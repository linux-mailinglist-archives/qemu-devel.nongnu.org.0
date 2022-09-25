Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6A5E92DF
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 13:57:56 +0200 (CEST)
Received: from localhost ([::1]:38570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQGh-0008Hk-D9
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 07:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrY-0002wN-7d
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:57 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:33398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrW-0006P9-5J
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:55 -0400
Received: by mail-pf1-x433.google.com with SMTP id w2so4222437pfb.0
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SZXLVRmmnhtpF37sbXWA0CFlA2zznYKmR2V+rAyp5Mc=;
 b=cMdtW7UQy4+TPYUSNN04xa6YMGHU46/FQgRHlS8qt4E+vbBvyqqSmSUNHNIXB0cM2C
 XE27U0qBPZ+5vkwBVeP78Yi3NOIzoLgvVaYJe9ChzPrss3E9yzvlTLhJaj6aOO65iAZv
 MCtrmNswPFCpwuzBUhyOWYE9h5Bj4lGiJgSR6Lfrn+j9SbtbnTm7HIuHpjYKmcGtXyEW
 GoJwIHpWhehlnLjUGwwU/95t6N2ghDpDUp8lVeAPsS31QANmjcW9koCcV+T7Sc7Lm1ec
 HnQT1MMcKx+PsXAGaT7aEoqvp0pj7xbcbPO9grT623nH1mL78HFp/CiWtDYozw/f0Gl7
 Oe9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SZXLVRmmnhtpF37sbXWA0CFlA2zznYKmR2V+rAyp5Mc=;
 b=oduyEw0LsiOKHiY9nUAU3vOvc6EBLGPtw+YhAzTG2kfus/GK+OhncyXje4clEFDgFy
 HljOZG0+xvgxBQw3RLAjMLeC+ML3N62QXu/Rii14ayPHnr0ijM/06iMVG6W+oh8J/LI3
 zQWqAgBiRH0h0LjzyMf31qSh39lx2EDZbxZZNuXB7Zr3tHOEtgbvMAnsiW7PGQvEOj8a
 MLmjObVtvRkrlNc4GdANIugComvzMpUmWJnfi0Ai8T36vXqBPB3MaOf8FHU0dsl9qIb1
 9Q5KoC1DV6dWnxkcooAooiTOUsHyhAWdLL0GI0D+JEU5xIN7w8dnrETn4ffxLcIgTSdh
 q6lQ==
X-Gm-Message-State: ACrzQf3YNGZe0LRKePDb4UMgNwmJZEs2YeNldA4cVb+YCo9l2SFQwpd4
 StzwfFq/S3kmhvCn6ixCvL9paiqWgjg=
X-Google-Smtp-Source: AMsMyM66KcKWZ3UbRaVZszszy2tNDgxD0+c5fxiyRTY/sUspWzmHubyTwrerBU9r/Gb8ICm7vpVVng==
X-Received: by 2002:aa7:88d0:0:b0:542:d98d:bf1f with SMTP id
 k16-20020aa788d0000000b00542d98dbf1fmr18196751pff.78.1664105512599; 
 Sun, 25 Sep 2022 04:31:52 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:52 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 28/54] tests/qtest: Skip running virtio-net-test cases that
 require socketpair() for win32
Date: Sun, 25 Sep 2022 19:30:06 +0800
Message-Id: <20220925113032.1949844-29-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x433.google.com
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


