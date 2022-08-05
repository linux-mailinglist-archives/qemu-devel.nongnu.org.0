Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7E58AC51
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 16:21:29 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJyCe-00042Y-JX
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 10:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy75-00081Q-BU; Fri, 05 Aug 2022 10:15:43 -0400
Received: from [200.168.210.66] (port=13350 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1oJy73-0004vg-J3; Fri, 05 Aug 2022 10:15:42 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 5 Aug 2022 11:15:23 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 5230B8003B3;
 Fri,  5 Aug 2022 11:15:23 -0300 (-03)
From: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/2] fpu: Add rebias bool, value and operation
Date: Fri,  5 Aug 2022 11:15:21 -0300
Message-Id: <20220805141522.412864-2-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
References: <20220805141522.412864-1-lucas.araujo@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Aug 2022 14:15:23.0564 (UTC)
 FILETIME=[CD709EC0:01D8A8D5]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Added the possibility of recalculating a result if it overflows or
underflows, if the result overflow and the rebias bool is true then the
intermediate result should have 3/4 of the total range subtracted from
the exponent. The same for underflow but it should be added to the
exponent of the intermediate number instead.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
---
 fpu/softfloat-parts.c.inc     | 21 +++++++++++++++++++--
 fpu/softfloat.c               |  2 ++
 include/fpu/softfloat-types.h |  4 ++++
 3 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index bbeadaa189..a9f268fcab 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -214,18 +214,35 @@ static void partsN(uncanon_normal)(FloatPartsN *p, float_status *s,
                 p->frac_lo &= ~round_mask;
             }
         } else if (unlikely(exp >= exp_max)) {
-            flags |= float_flag_overflow | float_flag_inexact;
-            if (overflow_norm) {
+            flags |= float_flag_overflow;
+            if (s->rebias_overflow) {
+                exp -= fmt->exp_re_bias;
+            } else if (overflow_norm) {
+                flags |= float_flag_inexact;
                 exp = exp_max - 1;
                 frac_allones(p);
                 p->frac_lo &= ~round_mask;
             } else {
+                flags |= float_flag_inexact;
                 p->cls = float_class_inf;
                 exp = exp_max;
                 frac_clear(p);
             }
         }
         frac_shr(p, frac_shift);
+    } else if (unlikely(s->rebias_underflow)) {
+        flags |= float_flag_underflow;
+        exp += fmt->exp_re_bias;
+        if (p->frac_lo & round_mask) {
+            flags |= float_flag_inexact;
+            if (frac_addi(p, p, inc)) {
+                frac_shr(p, 1);
+                p->frac_hi |= DECOMPOSED_IMPLICIT_BIT;
+                exp++;
+            }
+            p->frac_lo &= ~round_mask;
+        }
+        frac_shr(p, frac_shift);
     } else if (s->flush_to_zero) {
         flags |= float_flag_output_denormal;
         p->cls = float_class_zero;
diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 4a871ef2a1..c7454c3eb1 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -521,6 +521,7 @@ typedef struct {
 typedef struct {
     int exp_size;
     int exp_bias;
+    int exp_re_bias;
     int exp_max;
     int frac_size;
     int frac_shift;
@@ -532,6 +533,7 @@ typedef struct {
 #define FLOAT_PARAMS_(E)                                \
     .exp_size       = E,                                \
     .exp_bias       = ((1 << E) - 1) >> 1,              \
+    .exp_re_bias    = (1 << (E - 1)) + (1 << (E - 2)),  \
     .exp_max        = (1 << E) - 1
 
 #define FLOAT_PARAMS(E, F)                              \
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 7a6ea881d8..9735543ac4 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -195,6 +195,10 @@ typedef struct float_status {
     bool snan_bit_is_one;
     bool use_first_nan;
     bool no_signaling_nans;
+    /* should overflowed results subtract re_bias to its exponent? */
+    bool rebias_overflow;
+    /* should underflowed results add re_bias to its exponent? */
+    bool rebias_underflow;
 } float_status;
 
 #endif /* SOFTFLOAT_TYPES_H */
-- 
2.31.1


