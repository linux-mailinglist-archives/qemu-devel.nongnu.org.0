Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B857BF9E3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 21:11:33 +0200 (CEST)
Received: from localhost ([::1]:43176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDZAp-0003J3-NG
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 15:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47735)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYz2-0000kP-2g
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mark.cave-ayland@ilande.co.uk>) id 1iDYz0-0007zT-ET
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 14:59:19 -0400
Received: from mail.ilande.co.uk ([46.43.2.167]:40394
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYz0-0007Jk-6U; Thu, 26 Sep 2019 14:59:18 -0400
Received: from host86-138-245-63.range86-138.btcentralplus.com
 ([86.138.245.63] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1iDYyI-0001em-Vd; Thu, 26 Sep 2019 19:58:35 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, pc@us.ibm.com,
 david@gibson.dropbear.id.au
Date: Thu, 26 Sep 2019 19:58:00 +0100
Message-Id: <20190926185801.11176-7-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
References: <20190926185801.11176-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.138.245.63
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 6/7] target/ppc: use existing VsrD() macro to eliminate
 HI_IDX and LO_IDX from dfp_helper.c
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.43.2.167
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch over all accesses to the decimal numbers held in struct PPC_DFP from
using HI_IDX and LO_IDX to using the VsrD() macro instead. Not only does this
allow the compiler to ensure that the various dfp_* functions are being passed
a ppc_vsr_t rather than an arbitrary uint64_t pointer, but also allows the
host endian-specific HI_IDX and LO_IDX to be completely removed from
dfp_helper.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/dfp_helper.c | 70 ++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 39 deletions(-)

diff --git a/target/ppc/dfp_helper.c b/target/ppc/dfp_helper.c
index ed437f97da..b801acbedc 100644
--- a/target/ppc/dfp_helper.c
+++ b/target/ppc/dfp_helper.c
@@ -28,13 +28,6 @@
 #include "libdecnumber/dpd/decimal64.h"
 #include "libdecnumber/dpd/decimal128.h"
 
-#if defined(HOST_WORDS_BIGENDIAN)
-#define HI_IDX 0
-#define LO_IDX 1
-#else
-#define HI_IDX 1
-#define LO_IDX 0
-#endif
 
 static void get_dfp64(ppc_vsr_t *dst, ppc_fprp_t *dfp)
 {
@@ -1039,31 +1032,31 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b)              \
 DFP_HELPER_CTFIX(dctfix, 64)
 DFP_HELPER_CTFIX(dctfixq, 128)
 
-static inline void dfp_set_bcd_digit_64(uint64_t *t, uint8_t digit,
-                                            unsigned n)
+static inline void dfp_set_bcd_digit_64(ppc_vsr_t *t, uint8_t digit,
+                                        unsigned n)
 {
-    *t |= ((uint64_t)(digit & 0xF) << (n << 2));
+    t->VsrD(1) |= ((uint64_t)(digit & 0xF) << (n << 2));
 }
 
-static inline void dfp_set_bcd_digit_128(uint64_t *t, uint8_t digit,
-                                             unsigned n)
+static inline void dfp_set_bcd_digit_128(ppc_vsr_t *t, uint8_t digit,
+                                         unsigned n)
 {
-    t[(n & 0x10) ? HI_IDX : LO_IDX] |=
+    t->VsrD((n & 0x10) ? 0 : 1) |=
         ((uint64_t)(digit & 0xF) << ((n & 15) << 2));
 }
 
-static inline void dfp_set_sign_64(uint64_t *t, uint8_t sgn)
+static inline void dfp_set_sign_64(ppc_vsr_t *t, uint8_t sgn)
 {
-    *t <<= 4;
-    *t |= (sgn & 0xF);
+    t->VsrD(1) <<= 4;
+    t->VsrD(1) |= (sgn & 0xF);
 }
 
-static inline void dfp_set_sign_128(uint64_t *t, uint8_t sgn)
+static inline void dfp_set_sign_128(ppc_vsr_t *t, uint8_t sgn)
 {
-    t[HI_IDX] <<= 4;
-    t[HI_IDX] |= (t[LO_IDX] >> 60);
-    t[LO_IDX] <<= 4;
-    t[LO_IDX] |= (sgn & 0xF);
+    t->VsrD(0) <<= 4;
+    t->VsrD(0) |= (t->VsrD(1) >> 60);
+    t->VsrD(1) <<= 4;
+    t->VsrD(1) |= (sgn & 0xF);
 }
 
 #define DFP_HELPER_DEDPD(op, size)                                        \
@@ -1081,7 +1074,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,          \
     N = dfp.b.digits;                                                     \
                                                                           \
     for (i = 0; (i < N) && (i < (size)/4); i++) {                         \
-        dfp_set_bcd_digit_##size(&dfp.vt.u64[0], digits[N - i - 1], i);   \
+        dfp_set_bcd_digit_##size(&dfp.vt, digits[N - i - 1], i);          \
     }                                                                     \
                                                                           \
     if (sp & 2) {                                                         \
@@ -1092,7 +1085,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,          \
         } else {                                                          \
             sgn = ((sp & 1) ? 0xF : 0xC);                                 \
         }                                                                 \
-        dfp_set_sign_##size(&dfp.vt.u64[0], sgn);                         \
+        dfp_set_sign_##size(&dfp.vt, sgn);                                \
     }                                                                     \
                                                                           \
     if (size == 64) {                                                     \
@@ -1105,14 +1098,14 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,          \
 DFP_HELPER_DEDPD(ddedpd, 64)
 DFP_HELPER_DEDPD(ddedpdq, 128)
 
-static inline uint8_t dfp_get_bcd_digit_64(uint64_t *t, unsigned n)
+static inline uint8_t dfp_get_bcd_digit_64(ppc_vsr_t *t, unsigned n)
 {
-    return *t >> ((n << 2) & 63) & 15;
+    return t->VsrD(1) >> ((n << 2) & 63) & 15;
 }
 
-static inline uint8_t dfp_get_bcd_digit_128(uint64_t *t, unsigned n)
+static inline uint8_t dfp_get_bcd_digit_128(ppc_vsr_t *t, unsigned n)
 {
-    return t[(n & 0x10) ? HI_IDX : LO_IDX] >> ((n << 2) & 63) & 15;
+    return t->VsrD((n & 0x10) ? 0 : 1) >> ((n << 2) & 63) & 15;
 }
 
 #define DFP_HELPER_ENBCD(op, size)                                           \
@@ -1128,8 +1121,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
     decNumberZero(&dfp.t);                                                   \
                                                                              \
     if (s) {                                                                 \
-        uint8_t sgnNibble = dfp_get_bcd_digit_##size(&dfp.vb.u64[0],         \
-                                                     offset++);              \
+        uint8_t sgnNibble = dfp_get_bcd_digit_##size(&dfp.vb, offset++);     \
         switch (sgnNibble) {                                                 \
         case 0xD:                                                            \
         case 0xB:                                                            \
@@ -1149,7 +1141,7 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b,             \
                                                                              \
     while (offset < (size) / 4) {                                            \
         n++;                                                                 \
-        digits[(size) / 4 - n] = dfp_get_bcd_digit_##size(&dfp.vb.u64[0],    \
+        digits[(size) / 4 - n] = dfp_get_bcd_digit_##size(&dfp.vb,           \
                                                           offset++);         \
         if (digits[(size) / 4 - n] > 10) {                                   \
             dfp_set_FPSCR_flag(&dfp, FP_VX | FP_VXCVI, FPSCR_VE);            \
@@ -1212,16 +1204,16 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *b) \
 DFP_HELPER_XEX(dxex, 64)
 DFP_HELPER_XEX(dxexq, 128)
 
-static void dfp_set_raw_exp_64(uint64_t *t, uint64_t raw)
+static void dfp_set_raw_exp_64(ppc_vsr_t *t, uint64_t raw)
 {
-    *t &= 0x8003ffffffffffffULL;
-    *t |= (raw << (63 - 13));
+    t->VsrD(1) &= 0x8003ffffffffffffULL;
+    t->VsrD(1) |= (raw << (63 - 13));
 }
 
-static void dfp_set_raw_exp_128(uint64_t *t, uint64_t raw)
+static void dfp_set_raw_exp_128(ppc_vsr_t *t, uint64_t raw)
 {
-    t[HI_IDX] &= 0x80003fffffffffffULL;
-    t[HI_IDX] |= (raw << (63 - 17));
+    t->VsrD(0) &= 0x80003fffffffffffULL;
+    t->VsrD(0) |= (raw << (63 - 17));
 }
 
 #define DFP_HELPER_IEX(op, size)                                          \
@@ -1258,11 +1250,11 @@ void helper_##op(CPUPPCState *env, ppc_fprp_t *t, ppc_fprp_t *a,          \
         dfp.vt.VsrD(0) = dfp.vb.VsrD(0);                                  \
         dfp.vt.VsrD(1) = dfp.vb.VsrD(1);                                  \
         if (exp == -1) {                                                  \
-            dfp_set_raw_exp_##size(&dfp.vt.u64[0], raw_inf);              \
+            dfp_set_raw_exp_##size(&dfp.vt, raw_inf);                     \
         } else if (exp == -3) {                                           \
-            dfp_set_raw_exp_##size(&dfp.vt.u64[0], raw_snan);             \
+            dfp_set_raw_exp_##size(&dfp.vt, raw_snan);                    \
         } else {                                                          \
-            dfp_set_raw_exp_##size(&dfp.vt.u64[0], raw_qnan);             \
+            dfp_set_raw_exp_##size(&dfp.vt, raw_qnan);                    \
         }                                                                 \
     } else {                                                              \
         dfp.t = dfp.b;                                                    \
-- 
2.20.1


