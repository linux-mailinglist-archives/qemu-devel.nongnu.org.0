Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205D6A06B1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9CT-0007H5-6d; Thu, 23 Feb 2023 05:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9CM-0007C5-5Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:38 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9CK-0003iD-I4
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so4194116pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/nys2t0G7RD2ftML3eD4g9pOiP5E57MBuxl39+WQCyc=;
 b=wOuwV8SrwOT9ApMcXsIyRilYZHaWxGcXfI2GYXNbSxU4Lt0YLvE0OPdDgecXl7Y5U5
 bJwZ4GUPPC5uDjSWLIAxKIRbsEFEgVwABmzFKVuZYok6ZAfo1pObKgn8zKGMQIkDYyqu
 Jj6Qk4BEOve+LNdwjJwM7Z5qjz6eChTXPaWrSIz9SzhgYl4mEieNJ5/pRqN5GW89qxrE
 2SxxVgXssSiRVqKhd22X/WvBE5I4FqEnt2KKmm5WIfPz0N+wPwB2HShWWnTgBLJqW6mn
 wr6thukdC0kmtadh7DFJrFP6NiY7R5OqwEDRDca3iHctxUQrZ0fB25FK5OJ+EXxdtCbC
 h0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/nys2t0G7RD2ftML3eD4g9pOiP5E57MBuxl39+WQCyc=;
 b=ezsl8PgvdlxQ4mz3CHZAHvMemS6js9hB+c61M6raYM70ksFRF4xR3gv3mcdgSBQXhP
 p5qulgCdYXOjBlvV7TysaxpS08OTd07Hi4665JJAqJ4mhWuGXUWroDJkYSmc98y5Da71
 WzVqPV9tJ3ajIvbfDeNYiFiUGNQxoc6xR5J0Y6sh6W39yrzhjCsdXJ8/aHms3UgTc9l5
 0rO3p9c94V5Iqkzibzr21GAC5B9F2FdidsOttD/99XB0jgTNFgA3XvZGeLosB6qud0tn
 3mLcECektnXrBZOha9/KYLJuyhxBpYJbPZ3pZR3Ymii5HiZS78p7OsXEUeRnOwoifeWu
 5Epw==
X-Gm-Message-State: AO0yUKV6p9YATeKG2i/WRaLX1UrFySv8RlnUzQsmywU6kl5s5LXtFv//
 9DnRi4SUwn8TZkZAXcHyTqXfuQ==
X-Google-Smtp-Source: AK7set+/1mIAPMmkbexwxHKehFf7buLc701+01WI/Wutkz6D///xRQOSiSaDtkBYKjab9SIMQdur2Q==
X-Received: by 2002:a05:6a21:329c:b0:c7:8340:3312 with SMTP id
 yt28-20020a056a21329c00b000c783403312mr13686577pzb.1.1677149495432; 
 Thu, 23 Feb 2023 02:51:35 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a6384c1000000b004fb26a80875sm4477692pgd.22.2023.02.23.02.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:51:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v9 5/9] tests/qtest/e1000e-test: Fabricate ethernet header
Date: Thu, 23 Feb 2023 19:50:53 +0900
Message-Id: <20230223105057.144309-6-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223105057.144309-1-akihiko.odaki@daynix.com>
References: <20230223105057.144309-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

e1000e understands ethernet header so fabricate something convincing.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000e-test.c   | 25 +++++++++++++++----------
 tests/qtest/libqos/e1000e.h |  2 ++
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index b63a4d3c91..de9738fdb7 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -27,6 +27,7 @@
 #include "qemu/osdep.h"
 #include "libqtest-single.h"
 #include "libqos/pci-pc.h"
+#include "net/eth.h"
 #include "qemu/sockets.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
@@ -35,9 +36,13 @@
 #include "libqos/e1000e.h"
 #include "hw/net/e1000_regs.h"
 
+static const struct eth_header packet = {
+    .h_dest = E1000E_ADDRESS,
+    .h_source = E1000E_ADDRESS,
+};
+
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    static const char test[] = "TEST";
     struct e1000_tx_desc descr;
     char buffer[64];
     int ret;
@@ -45,7 +50,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
 
     /* Prepare test data buffer */
     uint64_t data = guest_alloc(alloc, sizeof(buffer));
-    memwrite(data, test, sizeof(test));
+    memwrite(data, &packet, sizeof(packet));
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -71,7 +76,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     g_assert_cmpint(ret, == , sizeof(recv_len));
     ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
     g_assert_cmpint(ret, ==, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &packet, sizeof(packet)));
 
     /* Free test data buffer */
     guest_free(alloc, data);
@@ -81,15 +86,15 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 {
     union e1000_rx_desc_extended descr;
 
-    char test[] = "TEST";
-    int len = htonl(sizeof(test));
+    struct eth_header test_iov = packet;
+    int len = htonl(sizeof(packet));
     struct iovec iov[] = {
         {
             .iov_base = &len,
             .iov_len = sizeof(len),
         },{
-            .iov_base = test,
-            .iov_len = sizeof(test),
+            .iov_base = &test_iov,
+            .iov_len = sizeof(packet),
         },
     };
 
@@ -97,8 +102,8 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
     int ret;
 
     /* Send a dummy packet to device's socket*/
-    ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(test));
-    g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
+    ret = iov_send(test_sockets[0], iov, 2, 0, sizeof(len) + sizeof(packet));
+    g_assert_cmpint(ret, == , sizeof(packet) + sizeof(len));
 
     /* Prepare test data buffer */
     uint64_t data = guest_alloc(alloc, sizeof(buffer));
@@ -119,7 +124,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &packet, sizeof(packet)));
 
     /* Free test data buffer */
     guest_free(alloc, data);
diff --git a/tests/qtest/libqos/e1000e.h b/tests/qtest/libqos/e1000e.h
index 091ce139da..5e2b201aa7 100644
--- a/tests/qtest/libqos/e1000e.h
+++ b/tests/qtest/libqos/e1000e.h
@@ -25,6 +25,8 @@
 #define E1000E_RX0_MSG_ID           (0)
 #define E1000E_TX0_MSG_ID           (1)
 
+#define E1000E_ADDRESS { 0x52, 0x54, 0x00, 0x12, 0x34, 0x56 }
+
 typedef struct QE1000E QE1000E;
 typedef struct QE1000E_PCI QE1000E_PCI;
 
-- 
2.39.1


