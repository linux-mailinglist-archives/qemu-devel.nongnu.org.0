Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E239666BA25
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:20:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLeG-0000pP-ST; Mon, 16 Jan 2023 04:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeE-0000nC-2J
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:22 -0500
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pHLeA-0003CP-PA
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:19:21 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MK3mS-1p1TDx1XWI-00LVIe; Mon, 16
 Jan 2023 10:19:15 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 3/4] target/m68k: fix FPSR quotient byte for fmod instruction
Date: Mon, 16 Jan 2023 10:19:11 +0100
Message-Id: <20230116091912.1882152-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230116091912.1882152-1-laurent@vivier.eu>
References: <20230116091912.1882152-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6xYoaJXji7stxpwQHpL7U2GRZiwZnRh73P6CWgz21qjDfyMheeX
 RG+JhlwK/GJpWy/ZZsgoP8L98teTl3cIGb1pQgVEGQHEsKElkgnzaDzkPYMaQZHRakgagtV
 UbfPfizicgNOkRUo+2RGELYpY6oCTuQxi6qAC7k4sd6BOZ1tZ/h0ZkmukymxfIFoLqp5pls
 1Eua47rlRmFiDeZLm/2hQ==
UI-OutboundReport: notjunk:1;M01:P0:1k+z/l6IYM0=;dxmTnpAda8324cAEffjnJHGcpn/
 LZtuR6TX3ULQDpMeS9pzBcWpxNnKG1iyoSRC096/ottju2ixeuPVnbB+ctBheCRumhsr5tulh
 FoiQDSG+QBaJ0S8ULn/HlHDSDMoAxdSOPlN+5IiVOhccHuTqZHuPJBFuEq1kW9IXPlLKYU8Ir
 n3BJZDWj00WmCGTazAirkM27Y1W1nImw86YSEpcvGea6AaJo8kx3PXqnrzg9IF0S0MzWlV+6o
 R28ERzxDG5Pnbv+QjCFUuLMibcps0UxcqbkTZbXY2Tki+O35AazTO0oDXsbq9rExmqauMbewl
 ZozyB2+HH1+BZnv/MJ5bPQoX1V1+Qkdbi0ZKnrWIN4iMNOlteDeZSY2zJJtVVkqHs8tsedyU3
 bhp1t8tRiA0S7DHuBUC+Cfo02IkqXe+mX/0ZjWyywtVELNuoTJu/4daf8WdT0iw9VWw1GNM33
 yveGU7sPJijwpVcA6JKjJCsrOxXCSVALBfhLgfp8ZMcy/5Eb1S4oZkIfrvWXHz9wFfK8nO9ok
 i2ystGwxI5e9uBZPRbJ+XVsX6Mw48Dgma5C0Smr+NBE5bdq55CrdiY5VqMKz+Mif0vC4tQZ4N
 AdRvAmhfE9dTlWmowrPBPy9s6UI+RGW4qI2r4KT2N/lCwtT55kVquE8ABca6//OTis6vaiNm+
 +tEa6LY/wD/JVhdAzVegf+fvRMmBEMz++xRazDkVbw==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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

The FPSR quotient byte should be set to the value of the quotient and not the
result. Switch from using floatx80_mod() to floatx80_modrem() which returns
the quotient as a uint64_t which can be used for the quotient byte.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230114232959.118224-4-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/fpu_helper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 76b34b898879..5fd094a33cff 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -523,17 +523,16 @@ static void make_quotient(CPUM68KState *env, int sign, uint32_t quotient)
 
 void HELPER(fmod)(CPUM68KState *env, FPReg *res, FPReg *val0, FPReg *val1)
 {
-    uint32_t quotient;
-    int sign;
+    uint64_t quotient;
+    int sign = extractFloatx80Sign(val1->d) ^ extractFloatx80Sign(val0->d);
 
-    res->d = floatx80_mod(val1->d, val0->d, &env->fp_status);
+    res->d = floatx80_modrem(val1->d, val0->d, true, &quotient,
+                             &env->fp_status);
 
     if (floatx80_is_any_nan(res->d)) {
         return;
     }
 
-    sign = extractFloatx80Sign(res->d);
-    quotient = floatx80_to_int32(floatx80_abs(res->d), &env->fp_status);
     make_quotient(env, sign, quotient);
 }
 
-- 
2.38.1


