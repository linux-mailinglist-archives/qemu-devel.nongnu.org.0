Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594A03F328B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:53:25 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH8hj-0005sP-A6
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Y6-0005QH-MK
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:22 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mH8Xz-0003sV-5l
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:43:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id h1so1958773pjs.2
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=bU4qGPSjyvWGwZ8dqXBOQY6phQwJgw6veLvRd2zRsiOhidUDXIim7ijwboFqYny9nG
 UMYYb7G8s8wBL/5J5/hO2RRLI6fpLbOSm1uJSPaS54AcUKa34GT1oiNEzjk0qSJmJy6n
 Vv2vz5VD7uluB6a8HG0c6YH6XoNsWEpxFDPMcdqBLze/Yz9hm+3xAf/+Kf75bOVVA+kp
 4j4WUjWONd+YyiM+IXSrC0r86GXZsPFByhvrmk2oJWWYfwZu5xREZQdNpPqXllY/bBnD
 vPVcfHymFwnAPC3npZvCSYQt4h0X7ZabCT8638xPGE2TiYhHPWhuE349umKrbspTDm5X
 sZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtzgxMrimjDaolvyiQ4xom5y79yzDTt02qA1Y6+PMUo=;
 b=TmgJkOaKXs7WmTMTo/CcjvkgmHORw7418gQyt7sKbIU6t8PAGWF/2bVsqFnoWgLDOP
 DJegAXPkNlYQi5eY2mC+CKGpOerKKIcUvEc11WkSdup9DldmtviKNDhu3pNm/dXHJ2E9
 le3x2skFHZPCl0234UTE+1sWE/pZ+6nqthXr8WPkFYHEktskPTi/kp/r9kL+aC11+t10
 yMlNPIcnVUdbsdH2pJzt85KfWB7WKinXpLySc+DUUk3F2Siv2n24pqqikbUmkLrc2E6D
 bFWQVfScDW/UVz66wUhZh7Uzc3s3NDt1AN3Q28XDeY0WLyMlGS9axEyHovBMZ3QOsVFd
 Fnyw==
X-Gm-Message-State: AOAM533+UsrAIQhVy4OB0QEpjMsBV5jzNUEs5qVjv2dOPh2oi/E9zAkw
 Tvoq9/xqvMQudA7fZ/DMhzXqc4vXS0BovQ==
X-Google-Smtp-Source: ABdhPJxNFASU1pZVLAbxFRpuhAMcRfCqIk0Vvb8KU2o8UvJ4zyl+5BvlXkydud9G4Bu5SSzuZdQxrg==
X-Received: by 2002:a17:902:d504:b029:12d:4cb3:397e with SMTP id
 b4-20020a170902d504b029012d4cb3397emr17457108plg.41.1629481393832; 
 Fri, 20 Aug 2021 10:43:13 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id l2sm7304142pfc.157.2021.08.20.10.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:43:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/21] target/riscv: Use gen_arith for mulh and mulhu
Date: Fri, 20 Aug 2021 07:42:44 -1000
Message-Id: <20210820174257.548286-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820174257.548286-1-richard.henderson@linaro.org>
References: <20210820174257.548286-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Split out gen_mulh and gen_mulhu and use the common helper.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvm.c.inc | 40 +++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvm.c.inc b/target/riscv/insn_trans/trans_rvm.c.inc
index 3d93b24c25..80552be7a3 100644
--- a/target/riscv/insn_trans/trans_rvm.c.inc
+++ b/target/riscv/insn_trans/trans_rvm.c.inc
@@ -25,20 +25,18 @@ static bool trans_mul(DisasContext *ctx, arg_mul *a)
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_mul_tl);
 }
 
+static void gen_mulh(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_muls2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulh(DisasContext *ctx, arg_mulh *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_muls2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulh);
 }
 
 static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
@@ -47,20 +45,18 @@ static bool trans_mulhsu(DisasContext *ctx, arg_mulhsu *a)
     return gen_arith(ctx, a, EXT_NONE, gen_mulhsu);
 }
 
+static void gen_mulhu(TCGv ret, TCGv s1, TCGv s2)
+{
+    TCGv discard = tcg_temp_new();
+
+    tcg_gen_mulu2_tl(discard, ret, s1, s2);
+    tcg_temp_free(discard);
+}
+
 static bool trans_mulhu(DisasContext *ctx, arg_mulhu *a)
 {
     REQUIRE_EXT(ctx, RVM);
-    TCGv source1 = tcg_temp_new();
-    TCGv source2 = tcg_temp_new();
-    gen_get_gpr(ctx, source1, a->rs1);
-    gen_get_gpr(ctx, source2, a->rs2);
-
-    tcg_gen_mulu2_tl(source2, source1, source1, source2);
-
-    gen_set_gpr(ctx, a->rd, source1);
-    tcg_temp_free(source1);
-    tcg_temp_free(source2);
-    return true;
+    return gen_arith(ctx, a, EXT_NONE, gen_mulhu);
 }
 
 static bool trans_div(DisasContext *ctx, arg_div *a)
-- 
2.25.1


