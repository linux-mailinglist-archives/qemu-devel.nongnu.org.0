Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195E36F8ED
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:07:05 +0200 (CEST)
Received: from localhost ([::1]:47374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQzA-0007CI-7v
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUH-0007pC-4y
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:10 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQUB-0001O0-Um
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:35:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id a4so70022867wrr.2
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vfktx2mvMGyTDBMyqJAZUhm98L0pQAwM5pYq0/74ZqY=;
 b=UaTISmfX9sPr3ZEGqQnqmC9I5kYwT2JNtqeL9OgW5OVmkQ9qlchTrod8WNKvFFQzlR
 UHFUvkBk6P9WpfbtPzglyw9R4sC/JdEGAuFTEXU9tQiSIodeyT4LyqvNkfcLC46fFoVV
 MdQ2Nstmkeu19hJ/3vg0280lYl5/ZuXhwGW38BuZeI46ZbepuY/yB1qc9BwpClB/6sQh
 mDFUn2tJFKvNsblXw21RM1U0E6p5DSW3wCVvXU2+25BEJksvoYTLn2DvpjOf4xxywoUN
 VuePyt0RzrhkQZX/FoNNkQ2VJtnMVaxfWuNa4F/ZE49sL+Tf5H5gzZlSRMaJ6KWqwpBD
 jJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vfktx2mvMGyTDBMyqJAZUhm98L0pQAwM5pYq0/74ZqY=;
 b=LGYj23yBHXE4lzI+yqfX47oACdK/fK0bFwKh4dEGUtAu4zdSPeeAG66QCswf/9MarK
 3jVCcwMKO6h4BbIDmaS6PCC1JOWPibNozSPQrsDB6iJDLTycWyJIh9jHrNrJ1OLL+1wh
 fhwpQTrHutg/dwz1+czD+PhVVG6oeDjlV9yuhK8ImPZJoJzm0JqmYikS6rIJVLD8fyTe
 YZdRXSRUVZTbNrakbTdDWy1111orqm2B5WdoMk3Ga1iRQ5dY8jwDv4dWM+jkSYofcSQq
 YSZFeWt6SMmuis5pVNEssvLe5cm5SQEee46oUamrXRstjwWNsxmSFdPs8yMD9iaKj8x5
 kfSQ==
X-Gm-Message-State: AOAM533Dv7wSTaIJrr1+6agz7x+Gar+woGWcn/kD/tDP6FFsI2W0VYlz
 hODAn1KOn5zV9o6Tqi5dQndoVKlDfAGDV8qn
X-Google-Smtp-Source: ABdhPJwEu2TOzFAv08t0Vrf/nn5tc2yfKHwbDVwAoPeTaJB9petTBlVuY3Oypz6iyKWiyI18PZkoRA==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr5922304wrr.37.1619778902261;
 Fri, 30 Apr 2021 03:35:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.35.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:35:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/43] target/arm: Enforce alignment for VLDR/VSTR
Date: Fri, 30 Apr 2021 11:34:25 +0100
Message-Id: <20210430103437.4140-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Message-id: 20210419202257.161730-22-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index f50afb23e74..e20d9c7ba66 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1364,11 +1364,11 @@ static bool trans_VLDR_VSTR_hp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld16u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st16(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UW | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1398,11 +1398,11 @@ static bool trans_VLDR_VSTR_sp(DisasContext *s, arg_VLDR_VSTR_sp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i32();
     if (a->l) {
-        gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         vfp_store_reg32(tmp, a->vd);
     } else {
         vfp_load_reg32(tmp, a->vd);
-        gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     }
     tcg_temp_free_i32(tmp);
     tcg_temp_free_i32(addr);
@@ -1439,11 +1439,11 @@ static bool trans_VLDR_VSTR_dp(DisasContext *s, arg_VLDR_VSTR_dp *a)
     addr = add_reg_for_lit(s, a->rn, offset);
     tmp = tcg_temp_new_i64();
     if (a->l) {
-        gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         vfp_store_reg64(tmp, a->vd);
     } else {
         vfp_load_reg64(tmp, a->vd);
-        gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+        gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
     }
     tcg_temp_free_i64(tmp);
     tcg_temp_free_i32(addr);
-- 
2.20.1


