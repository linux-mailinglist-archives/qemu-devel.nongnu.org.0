Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93F617A4B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 10:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqWw0-0003ph-1A; Thu, 03 Nov 2022 05:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqWvj-0003nt-F9
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:54:37 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oqWvf-0006xz-KC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 05:54:34 -0400
Received: by mail-pf1-x435.google.com with SMTP id y203so1128736pfb.4
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 02:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e8aiEB3an3hN4X7cLKD167dH+Ev6j9iEvmfA6IzzE+8=;
 b=Bg/Q0fzmMfZoWh+nPwt5e0pU/VzRIjPSoJepDqLsPkusZPGcFZcjHDQb8gUZAUuqH3
 326zngLGcw2IdIPt1cA57+wzOYJSDIHFvx3Onxh3OKcauGnYb/Wz+PDJlVERp6CwSiKp
 xfWJbqr/ujPd5sgx7zaI4euX+RfC7HZRVYc6jb9txM1UvkejWQp8rwEBwcChTdWG02gL
 UhxFFXdBDAwscLRdJH/msL0dkPlp9KHXhduiPSA03MSPwssvwSu9if67w8D72hWb9UV7
 NEpfSp21V8Rn2Iku4EYm0ZXzyBKklZi1Ku1q7gwR8EPofLgGAF300ZoCVaQcSazaoRwm
 ma1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e8aiEB3an3hN4X7cLKD167dH+Ev6j9iEvmfA6IzzE+8=;
 b=6EuwFT2ZWFFjkl/XtWf6rK8cJm2YjIVbpNdFHI/CLZVB9TB5vRuSeTvavZedQNROmj
 hFX7WokSyGVirg1ku7/TTAOYVrgUADqWYwbrhawQhDWpy/5zayIZQTEUYFDN6zvrEzd8
 JHWTvh9AG7fO81UXzvrndIzL74NQ2dAaF7GH3pTqJdHNGXvJJlQ86KOB3Jxhvt2xqjea
 kmiqRx4tBBb444K+uI6+nuPwTlx2BRRrkmfuFZyoPei9UljH8nmXKm4DmJGBE98bC/Fg
 2fDopnsJZiCknFS/jevdvraC/gNqgmrwsuEBZ+WBLFQGms20nJ0XUldXXvbfoodgkM6B
 CSjw==
X-Gm-Message-State: ACrzQf31+sXG0jXXTH1twO3zFkMvy9zC24QCAB+vHoP8o6tkkYaco8Rr
 wWEmnJ0sz7FhQd9HyBiN1JgfYmqaw5elPY5X
X-Google-Smtp-Source: AMsMyM59qycQEs7KmAanyIUP7uI0TMGP87cnveU+C0Shbe5Rjtzqu0ORkaXdc4JVethxxKSPxi+bcg==
X-Received: by 2002:a63:1110:0:b0:46f:b040:f5a with SMTP id
 g16-20020a631110000000b0046fb0400f5amr19014999pgl.84.1667469269478; 
 Thu, 03 Nov 2022 02:54:29 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 qe15-20020a17090b4f8f00b0020d9c2f6c39sm2952514pjb.34.2022.11.03.02.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 02:54:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] tests/qtest/e1000e-test: Use e1000_regs.h
Date: Thu,  3 Nov 2022 18:54:16 +0900
Message-Id: <20221103095416.110162-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::435;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x435.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The register definitions in tests/qtest/e1000e-test.c had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tests/qtest/e1000e-test.c | 66 ++++++---------------------------------
 1 file changed, 10 insertions(+), 56 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index c98779c7c0..9e7cb1eb2d 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -33,34 +33,11 @@
 #include "qemu/bitops.h"
 #include "libqos/malloc.h"
 #include "libqos/e1000e.h"
+#include "hw/net/e1000_regs.h"
 
 static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    struct {
-        uint64_t buffer_addr;
-        union {
-            uint32_t data;
-            struct {
-                uint16_t length;
-                uint8_t cso;
-                uint8_t cmd;
-            } flags;
-        } lower;
-        union {
-            uint32_t data;
-            struct {
-                uint8_t status;
-                uint8_t css;
-                uint16_t special;
-            } fields;
-        } upper;
-    } descr;
-
-    static const uint32_t dtyp_data = BIT(20);
-    static const uint32_t dtyp_ext  = BIT(29);
-    static const uint32_t dcmd_rs   = BIT(27);
-    static const uint32_t dcmd_eop  = BIT(24);
-    static const uint32_t dsta_dd   = BIT(0);
+    struct e1000_tx_desc descr;
     static const int data_len = 64;
     char buffer[64];
     int ret;
@@ -73,10 +50,10 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     /* Prepare TX descriptor */
     memset(&descr, 0, sizeof(descr));
     descr.buffer_addr = cpu_to_le64(data);
-    descr.lower.data = cpu_to_le32(dcmd_rs   |
-                                   dcmd_eop  |
-                                   dtyp_ext  |
-                                   dtyp_data |
+    descr.lower.data = cpu_to_le32(E1000_TXD_CMD_RS   |
+                                   E1000_TXD_CMD_EOP  |
+                                   E1000_TXD_CMD_DEXT |
+                                   E1000_TXD_DTYP_D   |
                                    data_len);
 
     /* Put descriptor to the ring */
@@ -86,7 +63,8 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
     e1000e_wait_isr(d, E1000E_TX0_MSG_ID);
 
     /* Check DD bit */
-    g_assert_cmphex(le32_to_cpu(descr.upper.data) & dsta_dd, ==, dsta_dd);
+    g_assert_cmphex(le32_to_cpu(descr.upper.data) & E1000_TXD_STAT_DD, ==,
+                    E1000_TXD_STAT_DD);
 
     /* Check data sent to the backend */
     ret = recv(test_sockets[0], &recv_len, sizeof(recv_len), 0);
@@ -101,31 +79,7 @@ static void e1000e_send_verify(QE1000E *d, int *test_sockets, QGuestAllocator *a
 
 static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator *alloc)
 {
-    union {
-        struct {
-            uint64_t buffer_addr;
-            uint64_t reserved;
-        } read;
-        struct {
-            struct {
-                uint32_t mrq;
-                union {
-                    uint32_t rss;
-                    struct {
-                        uint16_t ip_id;
-                        uint16_t csum;
-                    } csum_ip;
-                } hi_dword;
-            } lower;
-            struct {
-                uint32_t status_error;
-                uint16_t length;
-                uint16_t vlan;
-            } upper;
-        } wb;
-    } descr;
-
-    static const uint32_t esta_dd = BIT(0);
+    union e1000_rx_desc_extended descr;
 
     char test[] = "TEST";
     int len = htonl(sizeof(test));
@@ -162,7 +116,7 @@ static void e1000e_receive_verify(QE1000E *d, int *test_sockets, QGuestAllocator
 
     /* Check DD bit */
     g_assert_cmphex(le32_to_cpu(descr.wb.upper.status_error) &
-        esta_dd, ==, esta_dd);
+        E1000_RXD_STAT_DD, ==, E1000_RXD_STAT_DD);
 
     /* Check data sent to the backend */
     memread(data, buffer, sizeof(buffer));
-- 
2.38.1


