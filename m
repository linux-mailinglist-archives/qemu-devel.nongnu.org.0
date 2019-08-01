Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D227E097
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:54:14 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htELF-0003k0-QK
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57747)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFe-0004x1-5e
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFc-0006Hy-OP
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:26 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35931 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htEFa-0006By-6R
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:24 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 4B8F01A22A2;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2B4331A2264;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 18:45:22 +0200
Message-Id: <1564677923-23173-12-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 11/12] tests/tcg: target/mips: Add
 optional printing of more detailed failure info
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

There is a need for printing input and output data for failure cases,
for debugging purpose. This is achieved by this patch, and only if a
preprocessor constant is manually set to 1. (Assumption is that the
need for such printout is relatively rare.)

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tests/tcg/mips/include/test_utils_128.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/mips/include/test_utils_128.h b/tests/tcg/mips/include/test_utils_128.h
index 2fea610..0dd3868 100644
--- a/tests/tcg/mips/include/test_utils_128.h
+++ b/tests/tcg/mips/include/test_utils_128.h
@@ -27,7 +27,8 @@
 #include <inttypes.h>
 #include <string.h>
 
-#define PRINT_RESULTS 0
+#define PRINT_RESULTS    0
+#define PRINT_FAILURES   0
 
 
 static inline int32_t check_results_128(const char *isa_ase_name,
@@ -65,6 +66,26 @@ static inline int32_t check_results_128(const char *isa_ase_name,
             (b128_result[2 * i + 1] == b128_expect[2 * i + 1])) {
             pass_count++;
         } else {
+#if PRINT_FAILURES
+            uint32_t ii;
+            uint64_t a, b;
+
+            printf("\n");
+
+            printf("FAILURE for test case %d!\n", i);
+
+            memcpy(&a, (b128_expect + 2 * i), 8);
+            memcpy(&b, (b128_expect + 2 * i + 1), 8);
+            printf("Expected result : { 0x%016llxULL, 0x%016llxULL, },\n",
+                   a, b);
+
+            memcpy(&a, (b128_result + 2 * i), 8);
+            memcpy(&b, (b128_result + 2 * i + 1), 8);
+            printf("Actual result   : { 0x%016llxULL, 0x%016llxULL, },\n",
+                   a, b);
+
+            printf("\n");
+#endif
             fail_count++;
         }
     }
-- 
2.7.4


