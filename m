Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48C67C9BB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0JC-0002RX-B7; Thu, 26 Jan 2023 06:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0J5-0002Ie-0b
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:40 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0J2-0001Tw-PV
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:38 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d9so1525476pll.9
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QKz8NM0/A8Hgswx+4MXKSDHppx0dxLxGzCKxbK2Z1F0=;
 b=ZFOrE8a0zlCgSOVjlZY3YColwngJc8xOInGfRZZDpxLXGLM+X5Ly4Isic/xMnHnwkd
 8EiuNjfyFT89t/PRrF/XZyzvUP6T995U3B8fNCp1yD/vMOmBmyUVPZ6wo5yUbYI/bsEd
 6lPw/F6nJOwg8whDBoXcdMUW1zsogCPFepAn1DrLObCaG3ixeLi05EPG2L1/OV4ToTPd
 9cq5TWBb0kI4PG+sebJrQdnslc6IcSqpGOIiwHOdo6ZYRJSDmIEjzCeInKj3pxk14QWA
 R9hXbJTeM0LsCtMwEfr/XhF4YRa8YNwDNIu6PBsX6S//NW7CnQlJRoNBrBoIXWg78TkW
 mC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QKz8NM0/A8Hgswx+4MXKSDHppx0dxLxGzCKxbK2Z1F0=;
 b=acihMZTQ8t3Rv+qzcGDipz8IvC169kqWVeULoHbleL0VbvWELb/ScOYCXyEAajPh/X
 Vp8wXFg4eMDfV7W5bxtgbq6sxMd/FnkIyWZg/hq7yoCklXwEeq1vwaN8d0SLGT+kkRV4
 +Y6xp668rsdULPyZq3guR3uwCbdcp0WdsO8iUKNzgZ79N7qXSCeEv1jkQx8qS17AoQ+Z
 wbWZI1HUWyGW4wMhpUVXJTNndme1nIZccbGrrxxLLzQ2JVQdlFLYDWAfd592cnzuSiiQ
 7eahN5sEssrtMBhxhkvdhc6+ByuoxwRoo56L+hZis/FPHVg0GXT177FnPf3dCqRO77+J
 pPVg==
X-Gm-Message-State: AFqh2kqrr4FFWuA/6olVg9eu20CqLUTGOczpVtP+FfvCXxmt12XboQI1
 /tZATcr7evOOxtRb6ClqG5HpqA==
X-Google-Smtp-Source: AMrXdXvCiqkf+jQF6rAushxn0B8r9I8Y8ggd5S1ZZhwVNOE6xDK0opZAc6AnfARxyjLaXCDzUcR3PA==
X-Received: by 2002:a17:90a:4bc2:b0:229:7b29:54ac with SMTP id
 u2-20020a17090a4bc200b002297b2954acmr35925617pjl.35.1674732036114; 
 Thu, 26 Jan 2023 03:20:36 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:20:35 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 08/13] tests/qtest/e1000e-test: Fabricate ethernet header
Date: Thu, 26 Jan 2023 20:19:38 +0900
Message-Id: <20230126111943.38695-9-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126111943.38695-1-akihiko.odaki@daynix.com>
References: <20230126111943.38695-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
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
---
 tests/qtest/e1000e-test.c   | 17 +++++++++++------
 tests/qtest/libqos/e1000e.h |  2 ++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index b63a4d3c91..98706355e3 100644
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
 
+static const struct eth_header test = {
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
+    memwrite(data, &test, sizeof(test));
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -71,7 +76,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     g_assert_cmpint(ret, == , sizeof(recv_len));
     ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
     g_assert_cmpint(ret, ==, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
 
     /* Free test data buffer */
     guest_free(alloc, data);
@@ -81,14 +86,14 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 {
     union e1000_rx_desc_extended descr;
 
-    char test[] = "TEST";
+    struct eth_header test_iov = test;
     int len = htonl(sizeof(test));
     struct iovec iov[] = {
         {
             .iov_base = &len,
             .iov_len = sizeof(len),
         },{
-            .iov_base = test,
+            .iov_base = &test_iov,
             .iov_len = sizeof(test),
         },
     };
@@ -119,7 +124,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , test);
+    g_assert_false(memcmp(buffer, &test, sizeof(test)));
 
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
2.39.0


