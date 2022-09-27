Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F35EC2C2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:32:46 +0200 (CEST)
Received: from localhost ([::1]:39186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9lV-00078m-7e
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RT-0002ri-9f
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:00 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8RR-00051Q-LO
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:07:59 -0400
Received: by mail-pg1-x535.google.com with SMTP id s206so9108794pgs.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SZXLVRmmnhtpF37sbXWA0CFlA2zznYKmR2V+rAyp5Mc=;
 b=EtDxCs+YapOObKwqMS1MBUW4qZb/JqqfPIMmZl3wnyI/9vUS3ey1loyvEObS8iAlLo
 gw2hd1v71uP48sEn/HD4pgHBS/7uavahEOk+pk62N/MpFyJJSmig6zj8cjYKKilv6K7u
 A6B/ctv73d7GyGsT7FhMly7cSCkG59hAoGG32yGPK0ThBHugIdIFrPbKx4WEhyh6NiTu
 WYpVxU89QEse9AXWbcdekogk/KXi3p1RmWeE3+D9fPsOhW9gMCumtMdsFUqI+lM0/hD6
 caMTHbRUedVm+slle6pdSxn3sHQU2Zuc6yBzW2CdWfrwkC4O0/5PpsU7SJEucX7b4d5D
 XvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SZXLVRmmnhtpF37sbXWA0CFlA2zznYKmR2V+rAyp5Mc=;
 b=xb8ukLs9w6B2OTbVAcER8150o56FaAuz0i18/UnBf5yLC6xk0fQ5yIYZYh6550Q+ec
 sRkXUfAotzKcFXBB/Ppl8wFd8zq/ZgDDoKLIHlRlDFkoCVlPyprGf3PwsG63VbrSGSA5
 DRpzxkc4OXdQXANeSx7gq6BifV2SRL74kMpjDdmrdRirGWJvEBwOOCLWDetRwDvKQOBd
 LE1EXGDkbZqmkyIKYkTqBjAW2q3HVLOXtDfrXuJq1Pme05VjvcVeFGfo+WSHkaL+KyjG
 nLu1xqaP8A94Ca0iQOL61mBpA5k1T/HbqpWMuJlQYEKU0/oqE25gt16j1yaowDimQJWL
 NXMg==
X-Gm-Message-State: ACrzQf16Kzagx4xT89UQgL0CkDA3BR2E/y3saxpEipqh56DtpsXFYrMt
 jXotCjIi6Sud02kSh6AARz5+Wb3PbZw=
X-Google-Smtp-Source: AMsMyM6VpIthGnf60bTjTLaWIytQeBrurWklPUk320H4Zph4dJZODW0qgMNqdYCblhn9+Io1AXqR+w==
X-Received: by 2002:a62:a512:0:b0:536:e2bd:e15e with SMTP id
 v18-20020a62a512000000b00536e2bde15emr29324870pfm.1.1664276876062; 
 Tue, 27 Sep 2022 04:07:56 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:07:55 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 28/54] tests/qtest: Skip running virtio-net-test cases that
 require socketpair() for win32
Date: Tue, 27 Sep 2022 19:06:06 +0800
Message-Id: <20220927110632.1973965-29-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Some of the virtio-net-test test cases require socketpair() to do the
test setup. Skip them for win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change to skip only part of the virtio-net-test cases that require
  socketpair() intead of disabling all of them

 tests/qtest/virtio-net-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 6ded252901..dff43f0f60 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -165,8 +165,6 @@ static void stop_cont_test(void *obj, void *data, QGuestAllocator *t_alloc)
     rx_stop_cont_test(dev, t_alloc, rx, sv[0]);
 }
 
-#endif
-
 static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioPCIDevice *dev = obj;
@@ -286,6 +284,8 @@ static void *virtio_net_test_setup(GString *cmd_line, void *arg)
     return sv;
 }
 
+#endif /* _WIN32 */
+
 static void large_tx(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioNet *dev = obj;
@@ -319,16 +319,15 @@ static void *virtio_net_test_setup_nosocket(GString *cmd_line, void *arg)
 
 static void register_virtio_net_test(void)
 {
-    QOSGraphTestOptions opts = {
-        .before = virtio_net_test_setup,
-    };
+    QOSGraphTestOptions opts = { 0 };
 
-    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
 #ifndef _WIN32
+    opts.before = virtio_net_test_setup;
+    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
     qos_add_test("basic", "virtio-net", send_recv_test, &opts);
     qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
-#endif
     qos_add_test("announce-self", "virtio-net", announce_self, &opts);
+#endif
 
     /* These tests do not need a loopback backend.  */
     opts.before = virtio_net_test_setup_nosocket;
-- 
2.34.1


