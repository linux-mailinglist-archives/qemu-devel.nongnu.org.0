Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED1A681C51
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:06:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGS-0000SV-3Z; Mon, 30 Jan 2023 16:00:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGD-0008Uy-Gv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:18 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbG9-0005Tb-F3
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:16 -0500
Received: by mail-pf1-x42e.google.com with SMTP id z31so8774800pfw.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReB1vaX5bh+3X6AkZ6hIM1RvSLfgvq375cN+IdwrJjc=;
 b=ZNR+SzHo8ZheErYcJW5OzjBjOP96PRIguhJykxOlqIu2hX07mAP6UqD7dcQL2fRiXl
 qLaTGFkCJnexHCrInWEFcf98MLV0ix2kyypBZWS7Er64vOllt8yZnmvZuDtrP7ZDA0lc
 oqC1iAqNM02lgE37fO7nyjpKe1XaG0gy6lc5Y5Aho+8Mx5M40V6NVtF4F/QwHJtuzVcB
 +oC17DpY9Fjn2PDK6eBIFUT/s4I+mA3Z7IEzUKUjhXbKlRAF3Xgx3sLenEpP2yl/jJSZ
 +NzZ3BmTJihMvFh3I0fkszvj5fPJNxA1obJ42IDPI0ggSwEFE6Zx8ZyxYTrn8sSCT3KP
 Fxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReB1vaX5bh+3X6AkZ6hIM1RvSLfgvq375cN+IdwrJjc=;
 b=ifdygeGp24iEpffJKCVt07Aa70mu3PgdwF2XPvzAhujfXTK9exWva85Geh2ijUmQZf
 /wMRTvxJGDRPu3mwWN3nDisCqJ07lWFiMVbxtebY0sFhIkdR6ZPZomAqnYh9o2N9lvhw
 fygw50OknRzx6A2zfF8aulQ0SaTTofpuA7m1j1A4Sy9eb38dRlUCocereyNm3AeiXShD
 M/73kj4iZB1luu1BgwTJrurGIF3GqmanlK0MhQ3MNaCQ8H5/O2SLNzbmfLy9/dHBzyYI
 7dAHi+KrBPdkW9OQVnPyZoadCzunpyJRYwvsxXm6a/Rhg5XcygFnWmpWAdzAHzXP0wKF
 SKZA==
X-Gm-Message-State: AFqh2koLK9QrWU8s2L0I8HqJCxQn3T1FIKqKCO1eDbO0gk81mnZ3tmb3
 fowtgSrJR0gN15t5aojamuqQfia0q/ZLDBcV
X-Google-Smtp-Source: AMrXdXsScnovJ3iPyOUCJ7jgfH2I1r9h6TTpVmSr135XAkb8ENs1qMq37T4btj21cEqR9q/32uEsLw==
X-Received: by 2002:a62:5e81:0:b0:590:22b:c29d with SMTP id
 s123-20020a625e81000000b00590022bc29dmr22984783pfb.10.1675112408109; 
 Mon, 30 Jan 2023 13:00:08 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 17/27] target/arm: Don't use tcg_temp_local_new_*
Date: Mon, 30 Jan 2023 10:59:25 -1000
Message-Id: <20230130205935.1157347-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since tcg_temp_new_* is now identical, use those.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 +++---
 target/arm/translate.c     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 02150d93e8..718a5bce1b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2694,7 +2694,7 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
         return true;
     }
 
-    last = tcg_temp_local_new_i32();
+    last = tcg_temp_new_i32();
     over = gen_new_label();
 
     find_last_active(s, last, esz, a->pg);
@@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
@@ -4427,7 +4427,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 12eeada122..7f70d9c78f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7110,7 +7110,7 @@ static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -7263,7 +7263,7 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
         return true;
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -8670,7 +8670,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
          * Decrement by 1 << (4 - LTPSIZE). We need to use a TCG local
          * so that decr stays live after the brcondi.
          */
-        TCGv_i32 decr = tcg_temp_local_new_i32();
+        TCGv_i32 decr = tcg_temp_new_i32();
         TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
         tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
         tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
-- 
2.34.1


