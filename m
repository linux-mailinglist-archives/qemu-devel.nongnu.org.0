Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A62053C085
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:58:36 +0200 (CEST)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwspt-0007CQ-DB
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsge-0004QH-CB
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:00 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgb-0008U5-5j
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:00 -0400
Received: by mail-pj1-x1033.google.com with SMTP id gd1so6024314pjb.2
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AP39jqbPiQO8vlhvr3vURJ9OZT2UOimjCnaJk3rF7/M=;
 b=UiMz+ICIQZL2tXgVEHPvffEvf6NhyTrNcFana0UdkZRLIaTYWS2USJ9x7XtlppAs0x
 dYgwTK7GrS9xRCAlK4d4edSxTl3JbEnT/08b8T9iryl+W6Kb8vtefmBK8zZPf0HWE0ja
 n3hySf3C/5lzeMzFOdwP/OQPS87eovFyQru3gJimQG7Wh2Dha4iFF4H+8ChP3tcZfLSw
 i0J4NgRkhdi93Y73c1YpVc3DGPa+H2Py612xoOl/+dLwdRHicKXUaPalw7BLuMe+K3Br
 I/Xvj1paETT5bNQ4WxJAlqihxWimlNLU4RbbVNZwusLHA7YON81xbj7BdxMIGSU5W6Kh
 qx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AP39jqbPiQO8vlhvr3vURJ9OZT2UOimjCnaJk3rF7/M=;
 b=SbfRysWFkCJEVxjUFeFZ9R4wSXfaVawbHp5v4kqDfyCsH9TxeuXvbuGpYtVbzzzxu9
 D7r7o3/9wUpdkIFaFo9NChRGUUkGz30cRusrcuQN0Smoiec0fUCEXwQ+1FL5wbOg2BYs
 vtP7FI2NWB8FchVmaq9AuvGlkSIWh0dLLJA5PcWE5zLp4qIyIPKscjhFyh4U2js7smCl
 OZzASrjFHTNQiiHdH/KomWiSD4NtyN8cIJ1lLKZ7cRkx5xraCaa4fH5Vbl79o+NPgIAR
 dflnNFaWTWBeVhi0OiOZSSbVLjFbimMj8rz4kgX3XClv5DEHT9qvUQx15/UXTqV4wI2P
 Qmiw==
X-Gm-Message-State: AOAM532ZlOq2nSAbaZNsIIKzo/3MJuXOOnW47T3AxsjRRaklXpI5kadd
 kugmJdRKZjB3b7YHB1qWAoQ5fJBlewehsA==
X-Google-Smtp-Source: ABdhPJzGoqd7Hxm7KLjGxzCKEt97OFZCyzwwbAmxgsMXRsK1vYxg6pLUTSzKIoXGeJiI3wEfUTYSnQ==
X-Received: by 2002:a17:90b:3510:b0:1e0:b82:7558 with SMTP id
 ls16-20020a17090b351000b001e00b827558mr42390763pjb.21.1654206535719; 
 Thu, 02 Jun 2022 14:48:55 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 01/71] target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
Date: Thu,  2 Jun 2022 14:47:43 -0700
Message-Id: <20220602214853.496211-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

With SME, the vector length does not only come from ZCR_ELx.
Comment that this is either NVL or SVL, like the pseudocode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Renamed from SVE_LEN to VL.
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate-a64.h | 2 +-
 target/arm/translate.h     | 2 +-
 target/arm/helper.c        | 2 +-
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 2 +-
 6 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..015ce12fe2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3241,7 +3241,8 @@ FIELD(TBFLAG_M32, MVE_NO_PRED, 5, 1)            /* Not cached. */
  */
 FIELD(TBFLAG_A64, TBII, 0, 2)
 FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
-FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
+/* The current vector length, either NVL or SVL. */
+FIELD(TBFLAG_A64, VL, 4, 4)
 FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
 FIELD(TBFLAG_A64, BT, 9, 1)
 FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index f2e8ee0ee1..dbc917ee65 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -104,7 +104,7 @@ static inline TCGv_ptr vec_full_reg_ptr(DisasContext *s, int regno)
 /* Return the byte size of the "whole" vector register, VL / 8.  */
 static inline int vec_full_reg_size(DisasContext *s)
 {
-    return s->sve_len;
+    return s->vl;
 }
 
 bool disas_sve(DisasContext *, uint32_t);
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 9f0bb270c5..f473a21ed4 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -42,7 +42,7 @@ typedef struct DisasContext {
     bool ns;        /* Use non-secure CPREG bank on access */
     int fp_excp_el; /* FP exception EL or 0 if enabled */
     int sve_excp_el; /* SVE exception EL or 0 if enabled */
-    int sve_len;     /* SVE vector length in bytes */
+    int vl;          /* current vector length in bytes */
     /* Flag indicating that exceptions from secure mode are routed to EL3. */
     bool secure_routed_to_el3;
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40da63913c..960899022d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13696,7 +13696,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
             zcr_len = sve_zcr_len_for_el(env, el);
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
-        DP_TBFLAG_A64(flags, ZCR_LEN, zcr_len);
+        DP_TBFLAG_A64(flags, VL, zcr_len);
     }
 
     sctlr = regime_sctlr(env, stage1);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 935e1929bb..d438fb89e7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14608,7 +14608,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
-    dc->sve_len = (EX_TBFLAG_A64(tb_flags, ZCR_LEN) + 1) * 16;
+    dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
     dc->pauth_active = EX_TBFLAG_A64(tb_flags, PAUTH_ACTIVE);
     dc->bt = EX_TBFLAG_A64(tb_flags, BT);
     dc->btype = EX_TBFLAG_A64(tb_flags, BTYPE);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 836511d719..67761bf2cc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -111,7 +111,7 @@ static inline int pred_full_reg_offset(DisasContext *s, int regno)
 /* Return the byte size of the whole predicate register, VL / 64.  */
 static inline int pred_full_reg_size(DisasContext *s)
 {
-    return s->sve_len >> 3;
+    return s->vl >> 3;
 }
 
 /* Round up the size of a register to a size allowed by
-- 
2.34.1


