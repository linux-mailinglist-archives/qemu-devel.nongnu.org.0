Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFB4E7B1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 14:03:13 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1heIG8-0002Fb-Da
	for lists+qemu-devel@lfdr.de; Fri, 21 Jun 2019 08:03:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55249)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1heI7M-0003L2-Kk
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1heI7E-0005Jg-UP
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:54:05 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:37531 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1heI7A-00059g-Ml
 for qemu-devel@nongnu.org; Fri, 21 Jun 2019 07:53:57 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 823BF1A45C4;
 Fri, 21 Jun 2019 13:53:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 2B26D1A45FC;
 Fri, 21 Jun 2019 13:53:51 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 13:53:40 +0200
Message-Id: <1561118020-30489-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561118020-30489-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1561118020-30489-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v3 5/5] tests/tcg: target/mips: Amend tests for
 MSA int dot product instructions
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

Add tests for instructions whose result depends on the value in destination
register (prior to instruction execution).

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tests/tcg/mips/include/wrappers_msa.h              |   4 +
 .../ase/msa/int-dot-product/test_msa_dpadd_s_h.c   | 214 +++++++++++++++++++++
 2 files changed, 218 insertions(+)
 create mode 100644 tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_h.c

diff --git a/tests/tcg/mips/include/wrappers_msa.h b/tests/tcg/mips/include/wrappers_msa.h
index 8f260f5..6234703 100644
--- a/tests/tcg/mips/include/wrappers_msa.h
+++ b/tests/tcg/mips/include/wrappers_msa.h
@@ -411,6 +411,10 @@ DO_MSA__WD__WS_WT(DOTP_U_H, dotp_u.h)
 DO_MSA__WD__WS_WT(DOTP_U_W, dotp_u.w)
 DO_MSA__WD__WS_WT(DOTP_U_D, dotp_u.d)
 
+DO_MSA__WD__WS_WT(DPADD_S_H, dpadd_s.h)
+DO_MSA__WD__WD_WT(DPADD_S_H__DDT, dpadd_s.h)
+DO_MSA__WD__WS_WD(DPADD_S_H__DSD, dpadd_s.h)
+
 
 /*
  * Int Max Min
diff --git a/tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_h.c b/tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_h.c
new file mode 100644
index 0000000..35b63a3
--- /dev/null
+++ b/tests/tcg/mips/user/ase/msa/int-dot-product/test_msa_dpadd_s_h.c
@@ -0,0 +1,214 @@
+/*
+ *  Test program for MSA instruction DPADD_S.H
+ *
+ *  Copyright (C) 2019  Wave Computing, Inc.
+ *  Copyright (C) 2019  Aleksandar Markovic <amarkovic@wavecomp.com>
+ *
+ *  This program is free software: you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation, either version 2 of the License, or
+ *  (at your option) any later version.
+ *`
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
+ *
+ */
+
+#include <sys/time.h>
+#include <stdint.h>
+
+#include "../../../../include/wrappers_msa.h"
+#include "../../../../include/test_inputs_128.h"
+#include "../../../../include/test_utils_128.h"
+
+#define TEST_COUNT_TOTAL (                                                \
+            (PATTERN_INPUTS_SHORT_COUNT) * (PATTERN_INPUTS_SHORT_COUNT) + \
+            3 * (RANDOM_INPUTS_SHORT_COUNT) * (RANDOM_INPUTS_SHORT_COUNT))
+
+
+int32_t main(void)
+{
+    char *isa_ase_name = "MSA";
+    char *group_name = "Int Dot Product";
+    char *instruction_name =  "DPADD_S.H";
+    int32_t ret;
+    uint32_t i, j;
+    struct timeval start, end;
+    double elapsed_time;
+
+    uint64_t b128_result[TEST_COUNT_TOTAL][2];
+    uint64_t b128_expect[TEST_COUNT_TOTAL][2] = {
+        { 0xffffffffffffffffULL, 0xffffffffffffffffULL, },    /*   0  */
+        { 0x0000000000000000ULL, 0xffffffffffffffffULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0xffffffffffffffffULL, },
+        { 0x5555555555555555ULL, 0xffffffffffffffffULL, },
+        { 0xccccccccccccccccULL, 0xffffffffffffffffULL, },
+        { 0x3333333333333333ULL, 0xffffffffffffffffULL, },
+        { 0xe3388ee38ee3388eULL, 0xffffffffffffffffULL, },
+        { 0x1cc7711c711cc771ULL, 0xffffffffffffffffULL, },
+        { 0xffffffffffffffffULL, 0x0000000000000000ULL, },    /*   8  */
+        { 0x0000000000000000ULL, 0x0000000000000000ULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0x0000000000000000ULL, },
+        { 0x5555555555555555ULL, 0x0000000000000000ULL, },
+        { 0xccccccccccccccccULL, 0x0000000000000000ULL, },
+        { 0x3333333333333333ULL, 0x0000000000000000ULL, },
+        { 0xe3388ee38ee3388eULL, 0x0000000000000000ULL, },
+        { 0x1cc7711c711cc771ULL, 0x0000000000000000ULL, },
+        { 0xffffffffffffffffULL, 0xaaaaaaaaaaaaaaaaULL, },    /*  16  */
+        { 0x0000000000000000ULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0x5555555555555555ULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0xccccccccccccccccULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0x3333333333333333ULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0xe3388ee38ee3388eULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0x1cc7711c711cc771ULL, 0xaaaaaaaaaaaaaaaaULL, },
+        { 0xffffffffffffffffULL, 0x5555555555555555ULL, },    /*  24  */
+        { 0x0000000000000000ULL, 0x5555555555555555ULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0x5555555555555555ULL, },
+        { 0x5555555555555555ULL, 0x5555555555555555ULL, },
+        { 0xccccccccccccccccULL, 0x5555555555555555ULL, },
+        { 0x3333333333333333ULL, 0x5555555555555555ULL, },
+        { 0xe3388ee38ee3388eULL, 0x5555555555555555ULL, },
+        { 0x1cc7711c711cc771ULL, 0x5555555555555555ULL, },
+        { 0xffffffffffffffffULL, 0xccccccccccccccccULL, },    /*  32  */
+        { 0x0000000000000000ULL, 0xccccccccccccccccULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0xccccccccccccccccULL, },
+        { 0x5555555555555555ULL, 0xccccccccccccccccULL, },
+        { 0xccccccccccccccccULL, 0xccccccccccccccccULL, },
+        { 0x3333333333333333ULL, 0xccccccccccccccccULL, },
+        { 0xe3388ee38ee3388eULL, 0xccccccccccccccccULL, },
+        { 0x1cc7711c711cc771ULL, 0xccccccccccccccccULL, },
+        { 0xffffffffffffffffULL, 0x3333333333333333ULL, },    /*  40  */
+        { 0x0000000000000000ULL, 0x3333333333333333ULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0x3333333333333333ULL, },
+        { 0x5555555555555555ULL, 0x3333333333333333ULL, },
+        { 0xccccccccccccccccULL, 0x3333333333333333ULL, },
+        { 0x3333333333333333ULL, 0x3333333333333333ULL, },
+        { 0xe3388ee38ee3388eULL, 0x3333333333333333ULL, },
+        { 0x1cc7711c711cc771ULL, 0x3333333333333333ULL, },
+        { 0xffffffffffffffffULL, 0xe3388ee38ee3388eULL, },    /*  48  */
+        { 0x0000000000000000ULL, 0xe3388ee38ee3388eULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0xe3388ee38ee3388eULL, },
+        { 0x5555555555555555ULL, 0xe3388ee38ee3388eULL, },
+        { 0xccccccccccccccccULL, 0xe3388ee38ee3388eULL, },
+        { 0x3333333333333333ULL, 0xe3388ee38ee3388eULL, },
+        { 0xe3388ee38ee3388eULL, 0xe3388ee38ee3388eULL, },
+        { 0x1cc7711c711cc771ULL, 0xe3388ee38ee3388eULL, },
+        { 0xffffffffffffffffULL, 0x1cc7711c711cc771ULL, },    /*  56  */
+        { 0x0000000000000000ULL, 0x1cc7711c711cc771ULL, },
+        { 0xaaaaaaaaaaaaaaaaULL, 0x1cc7711c711cc771ULL, },
+        { 0x5555555555555555ULL, 0x1cc7711c711cc771ULL, },
+        { 0xccccccccccccccccULL, 0x1cc7711c711cc771ULL, },
+        { 0x3333333333333333ULL, 0x1cc7711c711cc771ULL, },
+        { 0xe3388ee38ee3388eULL, 0x1cc7711c711cc771ULL, },
+        { 0x1cc7711c711cc771ULL, 0x1cc7711c711cc771ULL, },
+        { 0x675e7b0c6acc6240ULL, 0x675e7b0c6acc6240ULL, },    /*  64  */
+        { 0xf71a3ffcbe639308ULL, 0x675e7b0c6acc6240ULL, },
+        { 0xd8ff2b145aaacf80ULL, 0x675e7b0c6acc6240ULL, },
+        { 0xf1d842a04f4d314eULL, 0x675e7b0c6acc6240ULL, },
+        { 0x675e7b0c6acc6240ULL, 0xf71a3ffcbe639308ULL, },
+        { 0xf71a3ffcbe639308ULL, 0xf71a3ffcbe639308ULL, },
+        { 0xd8ff2b145aaacf80ULL, 0xf71a3ffcbe639308ULL, },
+        { 0xf1d842a04f4d314eULL, 0xf71a3ffcbe639308ULL, },
+        { 0x675e7b0c6acc6240ULL, 0xd8ff2b145aaacf80ULL, },    /*  72  */
+        { 0xf71a3ffcbe639308ULL, 0xd8ff2b145aaacf80ULL, },
+        { 0xd8ff2b145aaacf80ULL, 0xd8ff2b145aaacf80ULL, },
+        { 0xf1d842a04f4d314eULL, 0xd8ff2b145aaacf80ULL, },
+        { 0x675e7b0c6acc6240ULL, 0xf1d842a04f4d314eULL, },
+        { 0xf71a3ffcbe639308ULL, 0xf1d842a04f4d314eULL, },
+        { 0xd8ff2b145aaacf80ULL, 0xf1d842a04f4d314eULL, },
+        { 0xf1d842a04f4d314eULL, 0xf1d842a04f4d314eULL, },
+        { 0x000000000c000000ULL, 0x0000fe000000005eULL, },    /*  80  */
+        { 0x00000000fc000000ULL, 0x000015000000001aULL, },
+        { 0x0000000014000000ULL, 0x0000ab00000000ffULL, },
+        { 0x00000000a0000000ULL, 0x0000a900000000d8ULL, },
+        { 0x000040000000000cULL, 0x9300003f00120000ULL, },
+        { 0x00000800000000fcULL, 0x9300003f00120000ULL, },
+        { 0x0000800000000014ULL, 0x9300003f00120000ULL, },
+        { 0x00004e00000000a0ULL, 0x9300003f00120000ULL, },
+        { 0x0000000000000000ULL, 0x8800000000fee6aaULL, },    /*  88  */
+        { 0x0000000000000000ULL, 0xfb000000001500aaULL, },
+        { 0x0000000000000000ULL, 0xac00000000abaeaaULL, },
+        { 0x0000000000000000ULL, 0x7000000000a916aaULL, },
+        { 0x00004f0000e20000ULL, 0x0000000000000000ULL, },
+        { 0x00004f0000e20000ULL, 0x0000000000000000ULL, },
+        { 0x00004f0000e20000ULL, 0x0000000000000000ULL, },
+        { 0x00004f0000e20000ULL, 0x0000000000000000ULL, },
+        { 0x000000000c000000ULL, 0x0000fe000000005eULL, },    /*  96  */
+        { 0x00000800000000fcULL, 0x6200007be64b0000ULL, },
+        { 0x0000000000000000ULL, 0xac00000000abaeccULL, },
+        { 0x00006a0000550000ULL, 0x0000000000000000ULL, },
+        { 0x000000000c000000ULL, 0x0000fe000000005eULL, },
+        { 0x00000800000000fcULL, 0x9300003f00120000ULL, },
+        { 0x0000000000000000ULL, 0xac00000000abae63ULL, },
+        { 0x0000be0000c70000ULL, 0x0000000000000000ULL, },
+        { 0x000000000c000000ULL, 0x0000fe000000005eULL, },    /* 104  */
+        { 0x00000800000000fcULL, 0xcf00002bae270000ULL, },
+        { 0x0000000000000000ULL, 0xac00000000abaeaaULL, },
+        { 0x00005a00008b0000ULL, 0x0000000000000000ULL, },
+        { 0x000000000c000000ULL, 0x0000fe000000005eULL, },
+        { 0x00000800000000fcULL, 0x31000042168d0000ULL, },
+        { 0x0000000000000000ULL, 0xac00000000abae4dULL, },
+        { 0x00004f0000e20000ULL, 0x0000000000000000ULL, },
+    };
+
+    reset_msa_registers();
+
+    gettimeofday(&start, NULL);
+
+    for (i = 0; i < PATTERN_INPUTS_SHORT_COUNT; i++) {
+        for (j = 0; j < PATTERN_INPUTS_SHORT_COUNT; j++) {
+            do_msa_DPADD_S_H(b128_pattern[i], b128_pattern[j],
+                             b128_result[PATTERN_INPUTS_SHORT_COUNT * i + j]);
+        }
+    }
+
+    for (i = 0; i < RANDOM_INPUTS_SHORT_COUNT; i++) {
+        for (j = 0; j < RANDOM_INPUTS_SHORT_COUNT; j++) {
+            do_msa_DPADD_S_H(b128_random[i], b128_random[j],
+                             b128_result[((PATTERN_INPUTS_SHORT_COUNT) *
+                                          (PATTERN_INPUTS_SHORT_COUNT)) +
+                                         RANDOM_INPUTS_SHORT_COUNT * i + j]);
+        }
+    }
+
+    for (i = 0; i < RANDOM_INPUTS_SHORT_COUNT; i++) {
+        for (j = 0; j < RANDOM_INPUTS_SHORT_COUNT; j++) {
+            do_msa_DPADD_S_H__DDT(b128_random[i], b128_random[j],
+                                  b128_result[
+                                      ((PATTERN_INPUTS_SHORT_COUNT) *
+                                       (PATTERN_INPUTS_SHORT_COUNT)) +
+                                      ((RANDOM_INPUTS_SHORT_COUNT) *
+                                       (RANDOM_INPUTS_SHORT_COUNT)) +
+                                      RANDOM_INPUTS_SHORT_COUNT * i + j]);
+        }
+    }
+
+    for (i = 0; i < RANDOM_INPUTS_SHORT_COUNT; i++) {
+        for (j = 0; j < RANDOM_INPUTS_SHORT_COUNT; j++) {
+            do_msa_DPADD_S_H__DSD(b128_random[i], b128_random[j],
+                                  b128_result[
+                                      ((PATTERN_INPUTS_SHORT_COUNT) *
+                                       (PATTERN_INPUTS_SHORT_COUNT)) +
+                                      (2 * (RANDOM_INPUTS_SHORT_COUNT) *
+                                       (RANDOM_INPUTS_SHORT_COUNT)) +
+                                      RANDOM_INPUTS_SHORT_COUNT * i + j]);
+        }
+    }
+
+    gettimeofday(&end, NULL);
+
+    elapsed_time = (end.tv_sec - start.tv_sec) * 1000.0;
+    elapsed_time += (end.tv_usec - start.tv_usec) / 1000.0;
+
+    ret = check_results_128(isa_ase_name, group_name, instruction_name,
+                            TEST_COUNT_TOTAL, elapsed_time,
+                            &b128_result[0][0], &b128_expect[0][0]);
+
+    return ret;
+}
-- 
2.7.4


