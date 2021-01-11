Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5932F1F2E
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 20:24:38 +0100 (CET)
Received: from localhost ([::1]:34864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz2nt-0007jt-Kf
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 14:24:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Rz-0006EL-Cs
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:59 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz2Ru-0006TS-3J
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 14:01:59 -0500
Received: by mail-pj1-x1030.google.com with SMTP id p12so89253pju.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 11:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=yTYN5j5PV/Sn4apB7FQIwW7cOCtXtWz/RYzpgF/tzc61sWSU1ZFFYfjuSBFHLGwYBi
 koHarkKTbwK0cNa1oZDWdP1AWuaTvLvNGz3pWlBle0IxnS1vuxq6erpm5gBI2vVXbFSL
 VgDDtnKZbxs5nFq7bdo6Zc4Tdw7XcfnTVQAxfmubReyxeWCA3HAcWBzM66lUbXbyKYgS
 56DIMIdri+7gNlwc+k9ABCcGT3Dpp89fGfD+szgglAm0FTE1uLyj00sWJxcMQ6nF/Q0b
 Q5P5bXdlUuS3ldxBy0Erst7kTmlR4ioDxJglPj2mopMKN7PQcrDGLvjUakBlmq+ZwlyV
 Hy0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KALA1eSooGUfBo7CGQXBooa38v23DHVbjR3um2cG8+w=;
 b=I7c22w60ZRinyNVagK494rG01CDG+XDS4+08K7iCLl/cscu3A8AVm7n77JDirCleMx
 UaBkykznn04eaem0rS8qkev9KEzbdZvSkMTonea51TOKHt5nmHOKPo6bENi+0qlV0IV3
 y7G/mpsJFTchVBFadsTc0Dd0YFs+YrzMy/CsrkWtqYHfgLThRjdl2k7gE8LN9V6vx8Rl
 NvJSpvv9L1C+vIkwrKUjDSPMbqC8va5sb7N1l8iqjibMIl8uUdokHR+FBUpuRGsqjkb/
 Sy1KsSGGWUsikgj1sz7EbiMTeVjQ8YKSUFsU0dOJT7MfY1M9O5OSu7I63JPavxNNHvMR
 0+RQ==
X-Gm-Message-State: AOAM53077w+pwXp6+dKcG8+Djbcy/U0HZo8x+x1A2GU7DRWUiKhqN3jt
 upLF+hKuSMBwVSUICJJxyfojM10xi8D99g==
X-Google-Smtp-Source: ABdhPJykhtsQdq5zrfLQwZBgccYT6grNv/tgb7cBtRZunOVB1KVJqa0RcBBrf+CNl7L4UcPKmiR6Iw==
X-Received: by 2002:a17:90a:674c:: with SMTP id
 c12mr304733pjm.98.1610391709680; 
 Mon, 11 Jan 2021 11:01:49 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id n195sm350395pfd.169.2021.01.11.11.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:01:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/30] target/arm: Enforce alignment for VLDM/VSTM
Date: Mon, 11 Jan 2021 09:01:02 -1000
Message-Id: <20210111190113.303726-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111190113.303726-1-richard.henderson@linaro.org>
References: <20210111190113.303726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 10766f210c..f50afb23e7 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1503,12 +1503,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1586,12 +1586,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s), MO_Q | MO_ALIGN_4);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1


