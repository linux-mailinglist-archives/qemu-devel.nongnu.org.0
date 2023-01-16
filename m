Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DB366BA23
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:20:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLeG-0000oC-4g; Mon, 16 Jan 2023 04:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeE-0000nD-2G
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:22 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeA-0003CK-LF
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MJW5G-1p21ik1YFc-00JqsI; Mon, 16
 Jan 2023 10:19:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 1/4] target/m68k: pass quotient directly into make_quotient()
Date: Mon, 16 Jan 2023 10:19:09 +0100
Message-Id: <20230116091912.1882152-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116091912.1882152-1-laurent@vivier.eu>
References: <20230116091912.1882152-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4uwzH+WVJlRiDQcuhBFJjYvAnMhAgc/8+H/Ad1qnOb5T/a/2SEK
 4K6hWOSVAZmZb1cWElztYSolDHPHVpNjOcLCimnY9KpRCPa4uGWNWCtPHJOslTE68Ir/Bgx
 784LtK5r71cJ3JwAGLiwjIi/FLuT1zIyMfnDGhhsHuu5T1akG2Og/K+XKF/9Hi+aiK4RKrh
 OmVWJ8Sq5mgrT26s27BYw==
UI-OutboundReport: notjunk:1;M01:P0:w30Jta8nVkA=;xwx1L0eimVEXfljSdgG03tqz2q9
 yDtoNNTSUsj/nz6AlF8bxhxh2aGfjXqf+1mcbhXGYkEcqm4ljPPQCcreAQwlcExqbDoDlqP+E
 b3oeKWaTP57IYdx1HhMdxVxcGQQw9+Z/bfxfAlpqZ0EF9s0Y6GqGbUbqvxDnVshdu1U27duOO
 jnQ0sN51t1M7hQO4ubSbchEdo0arfuxelZTNmuKtLpQQpqw9LNpqoAbS9olhS5piaOHedo9df
 d1G4Fo6S8lhx4AKDACjperqKFjv5DD+Sb9PI7Pk7GWjbMW+BSKw75CoIICZnVQB1eUtSLJ/jw
 7QvzuWJbi/kgfXK2WPgWkfdwccayIFlWh5ObpxwyBW+pqlgZANekVYfuxRw8dWMukvvYTolgJ
 EfzHZ5IlvHEqZ2CTU3XPKHy2hNtkwjPibPpcYRSDaxIsztUniE74bJEXLcyztPVwLTE8/ODbX
 edEoIxVYy2hAAI+Lb6rkjD/OgP5qLLdwtFalL0RAlNmS9Cmg5jIW6nop4dDObB567Cx2/n1ql
 uH6PUxrdfTyKcPd1/tKqPAhvTFQ15oDsB+jQU3I1Dc2iX6eMy3j3FwWj6zILzA44Lb0lPkEUY
 6v7UTBlgsAnNvijY1kEToDQUqj34i5SQ9YX8bGbBiUt1FTC4lB/jHyyFmMEImjgwG2ZSekB6C
 lk0QDR8qOX0Rh/hm8nnTDgFIALwIr225XbTCBrhNpQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114232959.118224-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index fdc4937e29e1..0932c464fdae 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -515,16 +515,10 @@ uint32_t HELPER(fmovemd_ld_postinc)(CPUM68KState *env, uint32_t addr,
     return fmovem_postinc(env, addr, mask, cpu_ld_float64_ra);
 }
 
-static void make_quotient(CPUM68KState *env, floatx80 val)
+static void make_quotient(CPUM68KState *env, int32_t quotient)
 {
-    int32_t quotient;
     int sign;
 
-    if (floatx80_is_any_nan(val)) {
-        return;
-    }
-
-    quotient = floatx80_to_int32(val, &env->fp_status);
     sign = quotient < 0;
     if (sign) {
         quotient = -quotient;
@@ -538,14 +532,22 @@ void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
     res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
 
-    make_quotient(env, res->d);
+    if (floatx80_is_any_nan(res->d)) {
+        return;
+    }
+
+    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(frem)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
     res->d = floatx80_rem(val1->d, val0->d, &env->fp_status);
 
-    make_quotient(env, res->d);
+    if (floatx80_is_any_nan(res->d)) {
+        return;
+    }
+
+    make_quotient(env, floatx80_to_int32(res->d, &env->fp_status));
 }
 
 void HELPER(fgetexp)(CPUM68KState *env, FPReg *res, FPReg *val)
-- 
2.38.1


