Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C02E7B8D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Dec 2020 18:27:06 +0100 (CET)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kufFZ-0006E5-4N
	for lists+qemu-devel@lfdr.de; Wed, 30 Dec 2020 12:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kufE8-0005Kq-9M
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 12:25:36 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kufE0-0003ro-BX
 for qemu-devel@nongnu.org; Wed, 30 Dec 2020 12:25:36 -0500
Received: by mail-pg1-x533.google.com with SMTP id i5so11722514pgo.1
 for <qemu-devel@nongnu.org>; Wed, 30 Dec 2020 09:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGtZvuF9EUsrpUsokKnKrv1xAf0EI+EpgdABgrDkMzI=;
 b=ut+pHL1Zdy15YcbmSTbXCTHFjVw0+yyvs5oUFHklGKArkamUGx5JH16m+0Cl2eckkb
 I0WWoViROLPIpgS6JcNOrizITzciI94mupNyG6cS1MXlcRlhyQLjGAvHzRnbx21NqCGt
 Tj2nq6eOEs5w/zTa/Gp/limhyeV9G4KP/tV6QYIiZerIBr6Q8jRvptwgQSPQYtfuG7tN
 +Zfbn4xih+O+kPfORvC00pcUdEx8/YT6bbgsgubX3GI+B36laVR3Uq7Wwhxp5L0Bik86
 NBqAsJyH69oxns8Ust73tNkgpl9IlbO4jZcAKSEyBxIUOfJBSybN7S1xceYXuoGoJpkO
 hv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KGtZvuF9EUsrpUsokKnKrv1xAf0EI+EpgdABgrDkMzI=;
 b=KrTKWJUFOmp/FS2KKhNeRzW2jsOW8bKsKSlxxZbVIqF23vhTNX9Ng4boamNXzm+ZVx
 AV0ZNnfCCxwWzuXcHBYXLrmn+gTnSBYSfx0xLUyjz5AzTBgtKfBzpzQ7bSLIrhWBjRsf
 lXl89FbWUIIgyZrDdXKWv2NasGQa5j0Hc+1wdo8tCl5/Z/vFtRqPkI5t+rjQc8gJEV6z
 fAACvcJpachhzpDJpHJkeEVskkRPrsYoB6lRpHHRUVwjuXeq+05eYvCjirN4lRXEYlmI
 T10p5+uOHzvcVnX12kKe1HI2VN73YJpA5sruuEYIyQHzbAIMEUw2vJlMvOK5f1UqLafu
 x9Pw==
X-Gm-Message-State: AOAM532aXHGr0alCJkcyf84jjARG1LKlQXMyTIlw3Lb3ISTgG3e2pAb1
 6OirzCg9bJr8Yw0FD10pf2fYLMdz6QOF8Q==
X-Google-Smtp-Source: ABdhPJxiMtKjTeYndUgCxKWoG3GZvg231fIRe7RVrWfLyVSJLg9mH+eJbu8BgLqX/VvQGld8fYLAbg==
X-Received: by 2002:a62:5547:0:b029:1a4:cb2a:2833 with SMTP id
 j68-20020a6255470000b02901a4cb2a2833mr48721493pfb.35.1609349124352; 
 Wed, 30 Dec 2020 09:25:24 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w2sm44274786pfj.110.2020.12.30.09.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 09:25:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve pred_desc decoding
Date: Wed, 30 Dec 2020 09:25:22 -0800
Message-Id: <20201230172522.33629-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There was an inconsistency between encoding, which uses
SIMD_DATA_SHIFT, and decoding which used SIMD_OPRSZ_BITS.
This happened to be ok, until e2e7168a214, which reduced
the size of SIMD_OPRSZ_BITS, which lead to truncating all
predicate vector lengths.

Cc: qemu-stable@nongnu.org
Buglink: https://bugs.launchpad.net/bugs/1908551
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

Ouch.  The patch that exposed this, e2e7168a214, went in near
the start of the 5.2 devel period, and I never noticed.  I've
been doing most of my testing vs ArmIE of late, which due to
lack of a proper sve signal frame restricts RISU to sve128,
which worked fine with this truncation.  I need to spend some
time getting FVP working again...


r~

---
 target/arm/sve_helper.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 5f037c3a8f..99e4b70d2f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -914,7 +914,7 @@ uint32_t HELPER(sve_pfirst)(void *vd, void *vg, uint32_t words)
 
 uint32_t HELPER(sve_pnext)(void *vd, void *vg, uint32_t pred_desc)
 {
-    intptr_t words = extract32(pred_desc, 0, SIMD_OPRSZ_BITS);
+    intptr_t words = extract32(pred_desc, 0, SIMD_DATA_SHIFT);
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint32_t flags = PREDTEST_INIT;
     uint64_t *d = vd, *g = vg, esz_mask;
@@ -1867,7 +1867,7 @@ static uint64_t compress_bits(uint64_t x, int n)
 
 void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd;
@@ -1928,7 +1928,7 @@ void HELPER(sve_zip_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     int odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1) << esz;
     uint64_t *d = vd, *n = vn, *m = vm;
@@ -1985,7 +1985,7 @@ void HELPER(sve_uzp_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 
 void HELPER(sve_trn_p)(void *vd, void *vn, void *vm, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     uintptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     bool odd = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd, *n = vn, *m = vm;
@@ -2035,7 +2035,7 @@ static uint8_t reverse_bits_8(uint8_t x, int n)
 
 void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     int esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     intptr_t i, oprsz_2 = oprsz / 2;
 
@@ -2065,7 +2065,7 @@ void HELPER(sve_rev_p)(void *vd, void *vn, uint32_t pred_desc)
 
 void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t high = extract32(pred_desc, SIMD_DATA_SHIFT + 2, 1);
     uint64_t *d = vd;
     intptr_t i;
@@ -2221,7 +2221,7 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
  */
 int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
 
     return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
@@ -2694,7 +2694,7 @@ static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
 void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2705,7 +2705,7 @@ void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, true);
     } else {
@@ -2716,7 +2716,7 @@ uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
 void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2727,7 +2727,7 @@ void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
 uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
                             uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, false);
     } else {
@@ -2737,55 +2737,55 @@ uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
 
 void HELPER(sve_brka_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_z(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_z(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_z(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_z)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_z(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brka_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_m(vd, vn, vg, oprsz, true);
 }
 
 uint32_t HELPER(sve_brkas_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_m(vd, vn, vg, oprsz, true);
 }
 
 void HELPER(sve_brkb_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     compute_brk_m(vd, vn, vg, oprsz, false);
 }
 
 uint32_t HELPER(sve_brkbs_m)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     return compute_brks_m(vd, vn, vg, oprsz, false);
 }
 
 void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
 
     if (!last_active_pred(vn, vg, oprsz)) {
         do_zero(vd, oprsz);
@@ -2811,7 +2811,7 @@ static uint32_t predtest_ones(ARMPredicateReg *d, intptr_t oprsz,
 
 uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
 
     if (last_active_pred(vn, vg, oprsz)) {
         return predtest_ones(vd, oprsz, -1);
@@ -2822,7 +2822,7 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
     intptr_t i;
@@ -2836,7 +2836,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 
 uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
 {
-    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_DATA_SHIFT) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
-- 
2.25.1


