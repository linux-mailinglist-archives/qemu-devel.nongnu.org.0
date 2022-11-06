Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6961E301
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdA-0005rd-5j; Sun, 06 Nov 2022 10:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd7-0005r5-VK
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd5-0000vZ-Kq
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1lIhzbe+EEQd2vZvZtwTt9hLhJr+rCc7od1ytqep54Y=;
 b=eYeMsQQkB8+ZtOhSf1qn0hyf/CrMvCWKKX00CHDKpUW9j6kHlL18mCoeG3wIsijxVv/tGV
 bx1YYo7hdizr5jRF1QDxiqFnx8XCZo0bmgsJP2j62gGPH+597T/6/qq7yY5h1WMuj4kVN0
 l2hRQkJ9gyw9w9PLms20iFnh+FVtsuw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-yvNzx9t_OoC0SKiAHr3vmg-1; Sun, 06 Nov 2022 10:32:05 -0500
X-MC-Unique: yvNzx9t_OoC0SKiAHr3vmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2994F101A52A;
 Sun,  6 Nov 2022 15:32:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45B440C6EC4;
 Sun,  6 Nov 2022 15:32:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 03/12] tests/qtest/e1000e-test: Use e1000_regs.h
Date: Sun,  6 Nov 2022 16:31:47 +0100
Message-Id: <20221106153156.620150-4-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The register definitions in tests/qtest/e1000e-test.c had names
different from hw/net/e1000_regs.h, which made it hard to understand
what test codes corresponds to the implementation. Use
hw/net/e1000_regs.h from tests/qtest/libqos/e1000e.c to remove
these duplications.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221103095416.110162-1-akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000e-test.c | 66 ++++++---------------------------------
 1 file changed, 10 insertions(+), 56 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 4cdd8238f2..08adc5226d 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -33,34 +33,11 @@
 #include "qemu/bitops.h"
 #include "libqos/libqos-malloc.h"
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
2.31.1


