Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684836F8E0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:59:12 +0200 (CEST)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQrX-00013V-0M
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUP-0007sR-I8
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:19 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUC-0001OA-EQ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:17 -0400
Received: by mail-wr1-x42e.google.com with SMTP id l14so150143wrx.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nQvJbV+I+IeHC4QJnyxqPSfqlbl9dQYnMWXa36K8Yjs=;
 b=azkBZBEYn0Jbf1/EAyDg5t5t92PEaOPTrKEKSf8kzPSON9bGYtam6vmqEIb9UszI+z
 LEiFsLAxtAerTiogQC88GPo5fV4sMxuhboveJ+9cLJQmPJyU2b53NTWHtgCISWJ3hr/j
 6fk3pNBJefnLohM1n10mOnJyJFrEik3nhx1H6CWPBrSn5OUOki3tI5CR3rptBOZ6P+dI
 fVoqtQpSGxT8WnOkif1IqHdubhImq+glCX/qDZlgosz+agQR0UEuO1Dph6eHbj82KEuP
 HgHqbWU6QZyAZ1OmwHGnhgBuG4DXhE6ZxHfTGgnVBGEGmPF24B74rGOQNDI7WSJE3MWj
 JL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nQvJbV+I+IeHC4QJnyxqPSfqlbl9dQYnMWXa36K8Yjs=;
 b=bU5Mp6rHsPNW4kC86PZiVAdz0VLUzL2dNavrM6S2aAtrFsZesnQg0R/pm+TF8jHRYn
 6AlCNZNFF2aSaF8r1MafMqm35M5fNEz6PoVU9CCCEwR2RrC0IB8E2XsM5ksqx2i/pOlf
 04J8c3WkOtpOZecWZRc6hinWRiTMPZfeNw6Yk0TnZ3OrAu/Rda8rDYdW2H/NHP0okNu1
 ttGS6rVdLikBe1xQnHSctXTd5bgR28FDvBuY1tubjPCSR5WWSQ4q5xO4zSI4lJjAXSV2
 hjYzrjW9cWL1a+QkrdMK1zgU9VFWx0XAkuyvmNvVFmf3QqSuR8fzPCu6muT12kWFi0Dz
 z3Gg==
X-Gm-Message-State: AOAM5300Ccn3+/0/HeIUe3JUoayTl9xla0KgOw1EOmnSwK0NPLkfVv/0
 Pff6coJPkvUmASsv24ttTkz7jqrXdl7zsGEr
X-Google-Smtp-Source: ABdhPJyUVGefsVRLfFl+iA8icVqAUT58crOBHt/9eHi390Saeh8H4XRxhdoVWO9O1Soa7DHKT3hFuA==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr5969150wrq.137.1619778902947; 
 Fri, 30 Apr 2021 03:35:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/43] target/arm: Enforce alignment for VLDn (all lanes)
Date: Fri, 30 Apr 2021 11:34:26 +0100
Message-Id: <20210430103437.4140-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h          |  1 +
 target/arm/translate.c          | 15 +++++++++++++
 target/arm/translate-neon.c.inc | 37 +++++++++++++++++++++++++--------
 3 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 0c60b83b3d4..ccf60c96d84 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -204,6 +204,7 @@ void arm_test_cc(DisasCompare *cmp, int cc);
 void arm_free_cc(DisasCompare *cmp);
 void arm_jump_cc(DisasCompare *cmp, TCGLabel *label);
 void arm_gen_test_cc(int cc, TCGLabel *label);
+MemOp pow2_align(unsigned i);
 
 /* Return state of Alternate Half-precision flag, caller frees result */
 static inline TCGv_i32 get_ahp_flag(void)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 3b071012cae..43ff0d4b8ac 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -908,6 +908,21 @@ static inline void store_reg_from_load(DisasContext *s, int reg, TCGv_i32 var)
 #define IS_USER_ONLY 0
 #endif
 
+MemOp pow2_align(unsigned i)
+{
+    static const MemOp mop_align[] = {
+        0, MO_ALIGN_2, MO_ALIGN_4, MO_ALIGN_8, MO_ALIGN_16,
+        /*
+         * FIXME: TARGET_PAGE_BITS_MIN affects TLB_FLAGS_MASK such
+         * that 256-bit alignment (MO_ALIGN_32) cannot be supported:
+         * see get_alignment_bits(). Enforce only 128-bit alignment for now.
+         */
+        MO_ALIGN_16
+    };
+    g_assert(i < ARRAY_SIZE(mop_align));
+    return mop_align[i];
+}
+
 /*
  * Abstractions of "generate code to do a guest load/store for
  * AArch32", where a vaddr is always 32 bits (and is zero
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 18d90421306..9c2b0760278 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -522,6 +522,7 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
     int size = a->size;
     int nregs = a->n + 1;
     TCGv_i32 addr, tmp;
+    MemOp mop, align;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
         return false;
@@ -532,18 +533,33 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         return false;
     }
 
+    align = 0;
     if (size == 3) {
         if (nregs != 4 || a->a == 0) {
             return false;
         }
         /* For VLD4 size == 3 a == 1 means 32 bits at 16 byte alignment */
-        size = 2;
-    }
-    if (nregs == 1 && a->a == 1 && size == 0) {
-        return false;
-    }
-    if (nregs == 3 && a->a == 1) {
-        return false;
+        size = MO_32;
+        align = MO_ALIGN_16;
+    } else if (a->a) {
+        switch (nregs) {
+        case 1:
+            if (size == 0) {
+                return false;
+            }
+            align = MO_ALIGN;
+            break;
+        case 2:
+            align = pow2_align(size + 1);
+            break;
+        case 3:
+            return false;
+        case 4:
+            align = pow2_align(size + 2);
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 
     if (!vfp_access_check(s)) {
@@ -556,12 +572,12 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
      */
     stride = a->t ? 2 : 1;
     vec_size = nregs == 1 ? stride * 8 : 8;
-
+    mop = size | align;
     tmp = tcg_temp_new_i32();
     addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     for (reg = 0; reg < nregs; reg++) {
-        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), size);
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), mop);
         if ((vd & 1) && vec_size == 16) {
             /*
              * We cannot write 16 bytes at once because the
@@ -577,6 +593,9 @@ static bool trans_VLD_all_lanes(DisasContext *s, arg_VLD_all_lanes *a)
         }
         tcg_gen_addi_i32(addr, addr, 1 << size);
         vd += stride;
+
+        /* Subsequent memory operations inherit alignment */
+        mop &= ~MO_AMASK;
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
-- 
2.20.1


