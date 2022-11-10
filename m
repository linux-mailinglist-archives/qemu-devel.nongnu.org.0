Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6B6241B0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:45:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot5z7-0003Nb-S4; Thu, 10 Nov 2022 06:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot5z5-0003NH-9a
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:44:39 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ot5z3-0006jH-Ji
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:44:39 -0500
Received: by mail-pf1-x42f.google.com with SMTP id q9so1794967pfg.5
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 03:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LO3sjqIRLZ3P5kfQ56vmM5lL0sGrd5Fhgvk4CS4Fw9Q=;
 b=a0/bDgcWJUO+q3G+S3DeAEyaO/GpF/ZGryeFYkexsdBxrOlWBEFkaVY077KqIq1ZCr
 Rc1oID4NQafJpnuJ2iC/La5CTTURELZczIkAFR2Jd7RjHmiRZf69nFQbEO3vKoiIXGx2
 RxqHZIAGIox9eXU8P6AW12L9x6L6YlL2kpYPbsT+HOa5oqIwwQtDyYFdg+jvqaTg5Hhd
 m0IqeWKXjesZhFpdJlqHLOcVM4YcpTOT4tBPtjSAWe29GJ2IRD90nbg2YkZvFkrXK0x7
 SGKj3MkT9YgPlZ4dfm/HLDpAbr40ss/QG05IUxQx+N6SRt9hBMF2t+w8lRghXAwt1FnN
 h4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LO3sjqIRLZ3P5kfQ56vmM5lL0sGrd5Fhgvk4CS4Fw9Q=;
 b=4wWQWWq++RGIABo5UV86XHpfnWuuQvy8BPV3OyEv0Pv4mNjZQ2mkGtCUDkGB0/puTv
 8327jNify2Vmqa9BUgtjvIodvhilxzAYlFiOUH1BfaZx2Y5M79N7YlwWe2bYwvGyFDNh
 lybgGVKT2A4XHIMAw+KDgNCTIofqtXUDipbnGAFLlLqyQ+wBYbIQhSzOwSr210e5FJ81
 tXiiirtXWitD5JMNIObs/1OtFpvmutgK/bZYw+XrcyM8sODPtPmHd6VA5+imRU/XjZ4a
 XMfguYfXojR6Tv7k5PGP+dnhXpCjqBJorJrrIhWgaA2fQdcceG9T9NTiPQ4OCKSbTUB0
 iL3g==
X-Gm-Message-State: ACrzQf0j+yQCyS+J3it0qItb4bN5MCNaPJMRc6y4zL/AFrFkduv0aw/0
 QASEJvQGkfquyU8mFJyuAUVWEh0AGYttxlOs
X-Google-Smtp-Source: AMsMyM6v0o0VnjULDF7spRLPI306XMj7P02NJmjJctx+ImqvP/5blb4UNfJ1ZWnKB5m106WxFxDcKQ==
X-Received: by 2002:a63:6645:0:b0:44b:2928:f868 with SMTP id
 a66-20020a636645000000b0044b2928f868mr2290776pgc.384.1668080675839; 
 Thu, 10 Nov 2022 03:44:35 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a170902d48b00b00178a9b193cfsm11138294plg.140.2022.11.10.03.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 03:44:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/e1000e-test: De-duplicate constants
Date: Thu, 10 Nov 2022 20:44:26 +0900
Message-Id: <20221110114426.65951-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42f.google.com
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

De-duplicate constants found in e1000e_send_verify() to avoid mismatch
and improve readability.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/e1000e-test.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 08adc5226d..3fc92046be 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -37,15 +37,15 @@
 
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
+    static const char test[] = "TEST";
     struct e1000_tx_desc descr;
-    static const int data_len = 64;
     char buffer[64];
     int ret;
     uint32_t recv_len;
 
     /* Prepare test data buffer */
-    uint64_t data = guest_alloc(alloc, data_len);
-    memwrite(data, "TEST", 5);
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
+    memwrite(data, test, sizeof(test));
 
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -54,7 +54,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
                                    E1000_TXD_CMD_EOP  |
                                    E1000_TXD_CMD_DEXT |
                                    E1000_TXD_DTYP_D   |
-                                   data_len);
+                                   sizeof(buffer));
 
     /* Put descriptor to the ring */
     e1000e_tx_ring_push(d, &descr);
@@ -69,9 +69,9 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     /* Check data sent to the backend */
     ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
     g_assert_cmpint(ret, == , sizeof(recv_len));
-    ret = recv(test_sockets[0], buffer, 64, 0);
-    g_assert_cmpint(ret, >=, 5);
-    g_assert_cmpstr(buffer, == , "TEST");
+    ret = recv(test_sockets[0], buffer, sizeof(buffer), 0);
+    g_assert_cmpint(ret, ==, sizeof(buffer));
+    g_assert_cmpstr(buffer, == , test);
 
     /* Free test data buffer */
     guest_free(alloc, data);
@@ -93,7 +93,6 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
         },
     };
 
-    static const int data_len = 64;
     char buffer[64];
     int ret;
 
@@ -102,7 +101,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
     g_assert_cmpint(ret, == , sizeof(test) + sizeof(len));
 
     /* Prepare test data buffer */
-    uint64_t data = guest_alloc(alloc, data_len);
+    uint64_t data = guest_alloc(alloc, sizeof(buffer));
 
     /* Prepare RX descriptor */
     memset(&descr, 0, sizeof(descr));
@@ -120,7 +119,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-    g_assert_cmpstr(buffer, == , "TEST");
+    g_assert_cmpstr(buffer, == , test);
 
     /* Free test data buffer */
     guest_free(alloc, data);
-- 
2.38.1


