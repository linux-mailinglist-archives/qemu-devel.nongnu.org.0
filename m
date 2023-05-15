Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9F3702DDF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:18:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsN-0007Ah-1j; Mon, 15 May 2023 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXr5-0004hG-JA
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqw-00014o-U2
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1aIg77/tUibkPSxCu7d4HMzJsHqBK9wvl+aQUORZK2w=;
 b=e4kJV36Avoyr8os/cZbyDzRzK2DGYKssyNFJ7UH378g2LtyMkPpdA6qpLSxUFrzF27rnJ8
 wI8MidoHlYDzjSzzxyF7t8DYGdPo/wWiIYoIOcNviq+Fgydlxx3n6Fpy5QlZTlKHp8Zkm6
 rO9125Y5LlKDG5sTKwS7EgNxpfZwMrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-nizukEjTO8OVmLnphcvIZA-1; Mon, 15 May 2023 09:02:59 -0400
X-MC-Unique: nizukEjTO8OVmLnphcvIZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B230182506A;
 Mon, 15 May 2023 13:02:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38A5940C6EC4;
 Mon, 15 May 2023 13:02:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/21] tests/tcg/multiarch: Make the system memory test work on
 big-endian
Date: Mon, 15 May 2023 15:02:30 +0200
Message-Id: <20230515130233.418183-19-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Store the bytes in descending order on big-endian.
Invert the logic in the multi-byte signed tests on big-endian.
Make the checks in the multi-byte signed tests stricter.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230511114651.439872-2-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/multiarch/system/memory.c | 67 ++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 24 deletions(-)

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index 214f7d4f54..e29786ae55 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -40,18 +40,21 @@ static void pdot(int count)
 }
 
 /*
- * Helper macros for shift/extract so we can keep our endian handling
- * in one place.
+ * Helper macros for endian handling.
  */
-#define BYTE_SHIFT(b, pos) ((uint64_t)b << (pos * 8))
-#define BYTE_EXTRACT(b, pos) ((b >> (pos * 8)) & 0xff)
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define BYTE_SHIFT(b, pos) (b << (pos * 8))
+#define BYTE_NEXT(b) ((b)++)
+#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+#define BYTE_SHIFT(b, pos) (b << ((sizeof(b) - 1 - (pos)) * 8))
+#define BYTE_NEXT(b) (--(b))
+#else
+#error Unsupported __BYTE_ORDER__
+#endif
 
 /*
- * Fill the data with ascending value bytes.
- *
- * Currently we only support Little Endian machines so write in
- * ascending address order. When we read higher address bytes should
- * either be zero or higher than the lower bytes.
+ * Fill the data with ascending (for little-endian) or descending (for
+ * big-endian) value bytes.
  */
 
 static void init_test_data_u8(int unused_offset)
@@ -62,14 +65,14 @@ static void init_test_data_u8(int unused_offset)
 
     ml_printf("Filling test area with u8:");
     for (i = 0; i < TEST_SIZE; i++) {
-        *ptr++ = count++;
+        *ptr++ = BYTE_NEXT(count);
         pdot(i);
     }
     ml_printf("done\n");
 }
 
 /*
- * Full the data with alternating positive and negative bytes. This
+ * Fill the data with alternating positive and negative bytes. This
  * should mean for reads larger than a byte all subsequent reads will
  * stay either negative or positive. We never write 0.
  */
@@ -119,7 +122,7 @@ static void init_test_data_u16(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t low = count++, high = count++;
+        uint16_t low = BYTE_NEXT(count), high = BYTE_NEXT(count);
         word = BYTE_SHIFT(high, 1) | BYTE_SHIFT(low, 0);
         *ptr++ = word;
         pdot(i);
@@ -139,9 +142,10 @@ static void init_test_data_u32(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t b4 = count++, b3 = count++;
-        uint8_t b2 = count++, b1 = count++;
-        word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) | b4;
+        uint32_t b4 = BYTE_NEXT(count), b3 = BYTE_NEXT(count);
+        uint32_t b2 = BYTE_NEXT(count), b1 = BYTE_NEXT(count);
+        word = BYTE_SHIFT(b1, 3) | BYTE_SHIFT(b2, 2) | BYTE_SHIFT(b3, 1) |
+               BYTE_SHIFT(b4, 0);
         *ptr++ = word;
         pdot(i);
     }
@@ -160,13 +164,13 @@ static void init_test_data_u64(int offset)
     reset_start_data(offset);
 
     for (i = 0; i < max; i++) {
-        uint8_t b8 = count++, b7 = count++;
-        uint8_t b6 = count++, b5 = count++;
-        uint8_t b4 = count++, b3 = count++;
-        uint8_t b2 = count++, b1 = count++;
+        uint64_t b8 = BYTE_NEXT(count), b7 = BYTE_NEXT(count);
+        uint64_t b6 = BYTE_NEXT(count), b5 = BYTE_NEXT(count);
+        uint64_t b4 = BYTE_NEXT(count), b3 = BYTE_NEXT(count);
+        uint64_t b2 = BYTE_NEXT(count), b1 = BYTE_NEXT(count);
         word = BYTE_SHIFT(b1, 7) | BYTE_SHIFT(b2, 6) | BYTE_SHIFT(b3, 5) |
                BYTE_SHIFT(b4, 4) | BYTE_SHIFT(b5, 3) | BYTE_SHIFT(b6, 2) |
-               BYTE_SHIFT(b7, 1) | b8;
+               BYTE_SHIFT(b7, 1) | BYTE_SHIFT(b8, 0);
         *ptr++ = word;
         pdot(i);
     }
@@ -374,12 +378,20 @@ static bool read_test_data_s16(int offset, bool neg_first)
     ml_printf("Reading s16 from %#lx (offset %d, %s):", ptr,
               offset, neg_first ? "neg" : "pos");
 
+    /*
+     * If the first byte is negative, then the last byte is positive.
+     * Therefore the logic below must be flipped for big-endian.
+     */
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    neg_first = !neg_first;
+#endif
+
     for (i = 0; i < max; i++) {
         int32_t data = *ptr++;
 
         if (neg_first && data < 0) {
             pdot(i);
-        } else if (data > 0) {
+        } else if (!neg_first && data > 0) {
             pdot(i);
         } else {
             ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
@@ -399,12 +411,20 @@ static bool read_test_data_s32(int offset, bool neg_first)
     ml_printf("Reading s32 from %#lx (offset %d, %s):",
               ptr, offset, neg_first ? "neg" : "pos");
 
+    /*
+     * If the first byte is negative, then the last byte is positive.
+     * Therefore the logic below must be flipped for big-endian.
+     */
+#if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
+    neg_first = !neg_first;
+#endif
+
     for (i = 0; i < max; i++) {
         int64_t data = *ptr++;
 
         if (neg_first && data < 0) {
             pdot(i);
-        } else if (data > 0) {
+        } else if (!neg_first && data > 0) {
             pdot(i);
         } else {
             ml_printf("Error %d %c 0\n", data, neg_first ? '<' : '>');
@@ -419,8 +439,7 @@ static bool read_test_data_s32(int offset, bool neg_first)
  * Read the test data and verify at various offsets
  *
  * For everything except bytes all our reads should be either positive
- * or negative depending on what offset we are reading from. Currently
- * we only handle LE systems.
+ * or negative depending on what offset we are reading from.
  */
 read_sfn read_sfns[] = { read_test_data_s8,
                          read_test_data_s16,
-- 
2.31.1


