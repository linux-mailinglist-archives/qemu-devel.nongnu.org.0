Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17356096F6
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 00:13:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omiNB-0000se-7g
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 17:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1omGvl-0003Pa-FG
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:01:10 -0400
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <volker.ruemelin@t-online.de>)
 id 1omGvj-0006AN-BL
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 12:01:01 -0400
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout12.t-online.de (Postfix) with SMTP id 6E55B669D;
 Sat, 22 Oct 2022 18:00:55 +0200 (CEST)
Received: from linpower.localnet ([84.175.228.229]) by fwd76.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1omGvd-0ZEjZJ0; Sat, 22 Oct 2022 18:00:53 +0200
Received: by linpower.localnet (Postfix, from userid 1000)
 id C75F22000A4; Sat, 22 Oct 2022 18:00:52 +0200 (CEST)
From: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/ac97-test: add up-/downsampling tests
Date: Sat, 22 Oct 2022 18:00:52 +0200
Message-Id: <20221022160052.1132-1-vr_qemu@t-online.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1666454453-EEFF2A26-E0B2D685/0/0 CLEAN NORMAL
X-TOI-MSGID: 35994585-f13a-4db1-9750-3e1a701f6551
Received-SPF: none client-ip=194.25.134.22;
 envelope-from=volker.ruemelin@t-online.de; helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test if the audio subsystem can handle extreme up- and down-
sampling ratios like 44100/1 and 1/44100. For some time these
used to trigger QEMU aborts. The test was taken from
https://gitlab.com/qemu-project/qemu/-/issues/71 where it was
used to demonstrate a very different issue.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
---
 tests/qtest/ac97-test.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/ac97-test.c b/tests/qtest/ac97-test.c
index 74103efdfa..ce25f1d588 100644
--- a/tests/qtest/ac97-test.c
+++ b/tests/qtest/ac97-test.c
@@ -42,16 +42,54 @@ static void *ac97_create(void *pci_bus, QGuestAllocator *alloc, void *addr)
     return &ac97->obj;
 }
 
+/*
+ * This is rather a test of the audio subsystem and not an AC97 test. Test if
+ * the audio subsystem can handle a 44100/1 upsample ratio. With an audio
+ * mixing buffer size of 1024 audio frames, the audio subsystem should either
+ * generate 1024 output frames from 0.0232 input frames or silently give up.
+ */
+static void ac97_playback_upsample(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QAC97 *ac97 = obj;
+    QPCIDevice *dev = &ac97->dev;
+    QPCIBar bar0;
+
+    qpci_device_enable(dev);
+    bar0 = qpci_iomap(dev, 0, NULL);
+    qpci_io_writew(dev, bar0, 0x2c, 0x1);
+}
+
+/*
+ * This test is similar to the playback upsample test. This time the audio
+ * subsystem should either generate 0.0232 audio frames from 1024 input frames
+ * or silently give up.
+ */
+static void ac97_record_downsample(void *obj, void *data, QGuestAllocator *alloc)
+{
+    QAC97 *ac97 = obj;
+    QPCIDevice *dev = &ac97->dev;
+    QPCIBar bar0;
+
+    qpci_device_enable(dev);
+    bar0 = qpci_iomap(dev, 0, NULL);
+    qpci_io_writew(dev, bar0, 0x32, 0x1);
+}
+
 static void ac97_register_nodes(void)
 {
     QOSGraphEdgeOptions opts = {
-        .extra_device_opts = "addr=04.0",
+        .extra_device_opts = "addr=04.0,audiodev=snd0",
+        .after_cmd_line = "-audiodev none,id=snd0"
+                          ",out.frequency=44100,in.frequency=44100",
     };
     add_qpci_address(&opts, &(QPCIAddress) { .devfn = QPCI_DEVFN(4, 0) });
 
     qos_node_create_driver("AC97", ac97_create);
     qos_node_produces("AC97", "pci-device");
     qos_node_consumes("AC97", "pci-bus", &opts);
+
+    qos_add_test("playback_upsample", "AC97", ac97_playback_upsample, NULL);
+    qos_add_test("record_downsample", "AC97", ac97_record_downsample, NULL);
 }
 
 libqos_init(ac97_register_nodes);
-- 
2.35.3


