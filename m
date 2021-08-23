Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA8D3F51B2
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 22:07:14 +0200 (CEST)
Received: from localhost ([::1]:53476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIGDx-0006ee-Bd
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 16:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2w-0006MX-Kp
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:50 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIG2o-000390-2x
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 15:55:50 -0400
Received: by mail-pl1-x62f.google.com with SMTP id u15so10781598plg.13
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 12:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=40H5/R04EummmzhsS/xa91Ypx0fRpPh7Qw4dLzf/bOY=;
 b=IOLviqNLR/HtSko6IvikFv0I+2vNcAX6zuI4bLbcDaxLZOYRhyzfjv6spgR2qwqnUr
 gWYFg15T+ycaaP6sZZqm0TSwgOjwYicZfzrX/zwkcYRDnj8/i63m+cdPHfCXJHiv6ToV
 0MWqQR+qLV4penTWjFXydhgEciwm70ub5dk/kv8CySNQ8LWlJq518mJwGMVhfkljmwJU
 Sq9u0srUbx5G97CRFucRog2f0VXvW+OEGxZajnnIhWH9jM0H+H7UmMa7UmDcCOH4pbff
 2bPNsEuHgrPReVwbt/4HuC3feBlNu0DLgPaAU6Zbij/9M8dtxn5cWGOoHOlmXlAL2Eiz
 5yfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=40H5/R04EummmzhsS/xa91Ypx0fRpPh7Qw4dLzf/bOY=;
 b=Pu7bP4VVTJWKQHx/d0px3/uL0LPzemJLt6wABAGWjTs+Egko3lcyAQBc2VP8/bXGmT
 1r7RM57k1kYPjl9wuZie3ljQMMy3ySDkd3ExeVZRUzms02qW2ap2lvmNV5A0m+Dtf60T
 oEoTfsUY0GR0ZUeSUi3PRyrbfo6b+ipM1BNeGumGlHTPfzkQBQlg8CjfWu5ptwwBYM1g
 4Gn3pk2hrM/w7/NZPNIQef2RwGpK5C3NQPFyL4AXtlHXu2h4JTPP/eOtSQ99CO4v80sU
 34BQ3IAm+5NyLrCuIv34cua6+8CHtUEzmsOJwG93v5/XX++P3ECGO36sWOn5BM6fWOR8
 4qlA==
X-Gm-Message-State: AOAM531B4cogXF/xTMfYIaLl2E4NCBkVP+IMhRYrvTohsXmFWCdKLZOo
 QpuiDnBdXGfdgariWY8z5pWTHwD7jkstnA==
X-Google-Smtp-Source: ABdhPJwUt5l8uX58STD19ZyRw5IB1KYn8l9TAm2c1YxSR0SwCgN+INP7ygaM0dZDJ1rnJr5t3f8Ufg==
X-Received: by 2002:a17:90a:a104:: with SMTP id
 s4mr248034pjp.184.1629748540646; 
 Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm16685078pff.105.2021.08.23.12.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 12:55:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/24] target/riscv: Use extracts for sraiw and srliw
Date: Mon, 23 Aug 2021 12:55:18 -0700
Message-Id: <20210823195529.560295-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823195529.560295-1-richard.henderson@linaro.org>
References: <20210823195529.560295-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These operations can be done in one instruction on some hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e4726e618c..9e8d99be51 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -347,18 +347,28 @@ static bool trans_slliw(DisasContext *ctx, arg_slliw *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_shli_tl);
 }
 
+static void gen_srliw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_extract_tl(dst, src, shamt, 32 - shamt);
+}
+
 static bool trans_srliw(DisasContext *ctx, arg_srliw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_ZERO, tcg_gen_shri_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_srliw);
+}
+
+static void gen_sraiw(TCGv dst, TCGv src, target_long shamt)
+{
+    tcg_gen_sextract_tl(dst, src, shamt, 32 - shamt);
 }
 
 static bool trans_sraiw(DisasContext *ctx, arg_sraiw *a)
 {
     REQUIRE_64BIT(ctx);
     ctx->w = true;
-    return gen_shift_imm_fn(ctx, a, EXT_SIGN, tcg_gen_sari_tl);
+    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_sraiw);
 }
 
 static bool trans_addw(DisasContext *ctx, arg_addw *a)
-- 
2.25.1


