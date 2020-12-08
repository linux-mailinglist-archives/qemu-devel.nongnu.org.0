Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912062D31CC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:12:32 +0100 (CET)
Received: from localhost ([::1]:52392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhTT-0000ZX-KY
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ3-0007kb-BN
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:45 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:39242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ0-0006Nu-Jf
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:44 -0500
Received: by mail-oi1-x241.google.com with SMTP id v85so9735592oia.6
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4wWHkNccTdv/S+w/jY/CU0oAZ7KJ+t/SYRwBRPA0ahA=;
 b=FJXUmnv/vpFLt8D3EGc/yrvcDiLfmh7ShPZaSXToP2nwD0HBU/QGKkB5zRAn2cTbAC
 N4znxkv/t25/TWgem8OFBrJjuXOwCC6YnpQEoPxF6ucs5b1svnNoCJHZWb//YZEOciOA
 tW27kwzgHUxychf0rgW/5JrEtfBgk6gCjjguRqsk7GCVBglnteXBs7D/rMae+YBuwoRR
 7fURS8kSyzYWrfk20GyK0RRyyA6c6a/qm1FTIgQSlQg6aaFKKqY4BKhESRfrXkltdGz0
 FTdXmEZeXyoo7LgeNnq7a2PjiW5WOEQKyJ9JzTcRRKXgFtR3+HDvvYTiPZv3FvOSkUZT
 lQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4wWHkNccTdv/S+w/jY/CU0oAZ7KJ+t/SYRwBRPA0ahA=;
 b=qEcrmOAaYGk1hCorG2z+uh5Lm/YTsBnM9QzYfdcnDPT/ausrdGj78O3EDzo5siZ1ly
 7xedSSE+gaStJKO61/SvmzlLuNgc1PsAUPJWvMRVSo0FdX4ZKxhKKggiVw4+jywBv8i0
 e2OTb9O5IWFPxBnzVvvGuZ7adwV4/hzLNipdriA6IAFK1ILdSUw6M4DsXigV1sBTHAMv
 zdcVcu/LiOB7GJUhDcdkGOaZZvNk+LCUbsYtyDEO3EOOJkcDHMN/NMBZqQ7oWPkjP9b5
 bHuxYtt0qSuOu+cTOngmcDwhfigCMI6XG/Lj00wvLiWezkoEXwZzGG6LQecLqUvj1H5F
 sY/A==
X-Gm-Message-State: AOAM532+SU3YlV6E5IIsmwSSBDGC/dGePMwmlF6pzyjO00wBo6RDLvr9
 tDmEbqa1c9NvR2vwy3fZP+NLUXoCHtihi2d5
X-Google-Smtp-Source: ABdhPJx0G5hYFP4uYeO6v7x+ViC9nnrRmMb+pr+Led8wHxRXPipuWB96EtzEgS5Fq2Kki3odIAmCvA==
X-Received: by 2002:aca:e108:: with SMTP id y8mr3833006oig.60.1607450501230;
 Tue, 08 Dec 2020 10:01:41 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/24] target/arm: Enforce alignment for VLDM/VSTM
Date: Tue,  8 Dec 2020 12:01:06 -0600
Message-Id: <20201208180118.157911-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 96948f5a2d..98e4ae30eb 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1065,12 +1065,12 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
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
@@ -1148,12 +1148,12 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
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


