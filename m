Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0528355AC7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:53:32 +0200 (CEST)
Received: from localhost ([::1]:49608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTptL-0007Ez-R7
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTph3-0001wM-0Y
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:49 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTpgz-0006QC-O5
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:40:48 -0400
Received: by mail-pg1-x536.google.com with SMTP id f29so8434480pgm.8
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h30NLvQUFSmWb89iN67sfFCqk9/Ie+AiL5gYJeDwQgI=;
 b=Y7siJFPq8qtozCvxgCYoT+kEVPjekeJ1JjIuCSAxQX22U6IQ8O5IHqMQ0jx7+vPBbA
 xoBDUdHOV6VTAs08BWneIztMxGy+wm1daTJZw8iNdPSatE12w8B2ntdmKTMAXwnMB4Gf
 qyXH7VOz6qLRlEQrwV2UhtT3/NXSpQHzsyGpwzA1XYS02X9xdpgANP9qGgRJxzZniLNv
 q4lK2hCOZJKZRPRWGoWxlKor/bDDGsZuMgMVRw0pyWLoDDEl/JEtsuyG/t7dHNopwFRI
 knxNb+snK3xek4SURYZ4zgVO8ocsk4MM4UgTbM6lS7quAYyPT+6nO3lkcfkIE0TVXh/E
 Duug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h30NLvQUFSmWb89iN67sfFCqk9/Ie+AiL5gYJeDwQgI=;
 b=Ta5X86DWHsG32lIFbBXnStJ/ASdAnloZIJ3fYTQreA0JEQysNmsuKp2LgqN9DAYkfl
 1E+xWDTT6HhW4Jx1AqCapZiMZ0L5XNRjyTOz8V+ZR/LpxwGjGG8V3/hwbXd3d5ZgoAup
 HaLQrzEQsf2U1YdGyxX78Q43XP8wYhnHAg7iJfSvRhbdJg00Z2+qFPpGb8vbVrGCiSGF
 N/HA3aiinprBo+jfOy/CegltIbrSG8ksdzPV/zxH1mF/qeQLWvJD6xrDiYBJE8joeERr
 RbBN7YjsEMb0kBeyHEGx9MWdj74SiRKdRLelq/JqRYhkXVTDEdVcLq8Zc6fbISktvvvk
 uViA==
X-Gm-Message-State: AOAM530MSJAGGAL3w5OPnxqifrrQhigdElWUiyqisdX1aK+2+6x4iUAf
 nNRdXIkFhavmMkKLW+HTqYRFnIbfqy9/Tw==
X-Google-Smtp-Source: ABdhPJxZf0IZlSs3PetinJfGVuSWDRryWyURX19XwrIfuj3NpW92s3aAJUCnIjNXLA+3PtDA7M3lvg==
X-Received: by 2002:a63:d309:: with SMTP id b9mr27613922pgg.96.1617730843916; 
 Tue, 06 Apr 2021 10:40:43 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h15sm19148056pfo.20.2021.04.06.10.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:40:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/12] target/arm: Remove log2_esize parameter to
 gen_mte_checkN
Date: Tue,  6 Apr 2021 10:40:30 -0700
Message-Id: <20210406174031.64299-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406174031.64299-1-richard.henderson@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The log2_esize parameter is not used except trivially.
Drop the parameter and the deferral to gen_mte_check1.

This fixes a bug in that the parameters as documented
in the header file were the reverse from those in the
implementation.  Which meant that translate-sve.c was
passing the parameters in the wrong order.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h |  2 +-
 target/arm/translate-a64.c | 15 +++++++--------
 target/arm/translate-sve.c |  4 ++--
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 3668b671dd..868d355048 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -44,7 +44,7 @@ TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int count, int log2_esize);
+                        bool tag_checked, int size);
 
 /* We should have at some point before trying to access an FP register
  * done the necessary access check, so assert that
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a68d5dd5d1..f35a5e8174 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -295,9 +295,9 @@ TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
  * For MTE, check multiple logical sequential accesses.
  */
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
-                        bool tag_checked, int log2_esize, int total_size)
+                        bool tag_checked, int size)
 {
-    if (tag_checked && s->mte_active[0] && total_size != (1 << log2_esize)) {
+    if (tag_checked && s->mte_active[0]) {
         TCGv_i32 tcg_desc;
         TCGv_i64 ret;
         int desc = 0;
@@ -306,7 +306,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
         desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
         desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
         desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
-        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, total_size - 1);
+        desc = FIELD_DP32(desc, MTEDESC, SIZEM1, size - 1);
         tcg_desc = tcg_const_i32(desc);
 
         ret = new_tmp_a64(s);
@@ -315,7 +315,7 @@ TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
 
         return ret;
     }
-    return gen_mte_check1(s, addr, is_write, tag_checked, log2_esize);
+    return clean_data_tbi(s, addr);
 }
 
 typedef struct DisasCompare64 {
@@ -2965,8 +2965,7 @@ static void disas_ldst_pair(DisasContext *s, uint32_t insn)
     }
 
     clean_addr = gen_mte_checkN(s, dirty_addr, !is_load,
-                                (wback || rn != 31) && !set_tag,
-                                size, 2 << size);
+                                (wback || rn != 31) && !set_tag, 2 << size);
 
     if (is_vector) {
         if (is_load) {
@@ -3713,7 +3712,7 @@ static void disas_ldst_multiple_struct(DisasContext *s, uint32_t insn)
      * promote consecutive little-endian elements below.
      */
     clean_addr = gen_mte_checkN(s, tcg_rn, is_store, is_postidx || rn != 31,
-                                size, total);
+                                total);
 
     /*
      * Consecutive little-endian elements from a single register
@@ -3866,7 +3865,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     tcg_rn = cpu_reg_sp(s, rn);
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
-                                scale, total);
+                                total);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5179c1f836..584c4d047c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4264,7 +4264,7 @@ static void do_ldr(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /*
@@ -4352,7 +4352,7 @@ static void do_str(DisasContext *s, uint32_t vofs, int len, int rn, int imm)
 
     dirty_addr = tcg_temp_new_i64();
     tcg_gen_addi_i64(dirty_addr, cpu_reg_sp(s, rn), imm);
-    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len, MO_8);
+    clean_addr = gen_mte_checkN(s, dirty_addr, false, rn != 31, len);
     tcg_temp_free_i64(dirty_addr);
 
     /* Note that unpredicated load/store of vector/predicate registers
-- 
2.25.1


