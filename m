Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B3A6F53DA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 10:58:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8IL-0000w7-OX; Wed, 03 May 2023 04:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8IJ-0000ur-Kh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu8II-0006bx-1B
 for qemu-devel@nongnu.org; Wed, 03 May 2023 04:57:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-2fa0ce30ac2so4501650f8f.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 01:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683104220; x=1685696220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7IYj+6O0tu3qih1X/ui++MY9beLsqUGE8F3B+8p5C8=;
 b=xiVx9FyyTdjiB1pMp8DSHblfLnRDVYlyTNqvTOIlbc1hH+rqkgjncqSz3BgLzp5TEi
 kkhZoF9Nz0yC5RZU15dngGKR/8NnwStJxvvBvvAloD/JuabZbxyqNdQB/hLobsct/AlK
 gjs/iL4DMWT2P5tfiXhcIlZW8dPCc24KCkPxhU6eYRum++2kqsnT8qNPgJpRAShBrafI
 rlEi0fRG+GjzPoYZWhOqyJXqHa+zYUXppgGnqQclke8t9mfwkRmbUVjLzgtcO9aGfEab
 l2D1y/SAdmOuM8QlK7AjzstotHHja1CflWD1z3yNG8Ea05tMgL6o3NFzfUQqMc8OXR0S
 0jUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104220; x=1685696220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i7IYj+6O0tu3qih1X/ui++MY9beLsqUGE8F3B+8p5C8=;
 b=f3kK25F4zGFKdU94C4DslVJHNZqQpYVyGA32L8xiAtT5jHZXD10Iz2/VH8Qot0k7+S
 iTb+Sp+GzqzayjDErGaJV//QavEg8B5aDfEARImx+y3YyfHzVaxWVhH+Vg2BY7ljip4K
 os/KdCwIBrKio04ldXVI7icKaDUZr+wgwP9gqW7ZcawCU/hksF0tK/RseE/TWd8Ht69k
 kXWsnurVXfbLjolQxb/rPryAtM396/beqnysOb/Yicrd4FN5Wjc2Ae9ly14Ys8O7FPnz
 5aqGQrSnHCEV/usRgC/DpqJ/dUKNIBhDtgEeLBNXlR7oz9+g2zvKsiI3NPuhvAhyurtk
 g+Tg==
X-Gm-Message-State: AC+VfDxO+DVFDGv82wG+jaXMlcmVCf+vhmx+67bc3KMGMw1w7UVHUPUR
 kfIv1UDPNVG2TCaCCyL7FgnZxsuy7pw7aX314x59aQ==
X-Google-Smtp-Source: ACHHUZ6DlAbdbZcvBAmxNgOmgMJt0o+mtkFDeA4CptkW+1uHRHIzgAaruJ37fg2DE9i60Rva6xUyIg==
X-Received: by 2002:a5d:6603:0:b0:306:2862:c725 with SMTP id
 n3-20020a5d6603000000b003062862c725mr8782830wru.7.1683104220363; 
 Wed, 03 May 2023 01:57:00 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 f26-20020a7bcd1a000000b003ef5f77901dsm1191307wmj.45.2023.05.03.01.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 01:57:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: dbarboza@ventanamicro.com
Subject: [PATCH 04/11] tcg/riscv: Support ADD.UW, SEXT.B, SEXT.H,
 ZEXT.H from Zba+Zbb
Date: Wed,  3 May 2023 09:56:50 +0100
Message-Id: <20230503085657.1814850-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503085657.1814850-1-richard.henderson@linaro.org>
References: <20230503085657.1814850-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c5b060023f..53a7f97b29 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -593,26 +593,42 @@ static void tcg_out_ext8u(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_ext16u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
-    tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
+    if (have_zbb) {
+        tcg_out_opc_reg(s, OPC_ZEXT_H, ret, arg, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+        tcg_out_opc_imm(s, OPC_SRLIW, ret, ret, 16);
+    }
 }
 
 static void tcg_out_ext32u(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
-    tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
+    if (have_zba) {
+        tcg_out_opc_reg(s, OPC_ADD_UW, ret, arg, TCG_REG_ZERO);
+    } else {
+        tcg_out_opc_imm(s, OPC_SLLI, ret, arg, 32);
+        tcg_out_opc_imm(s, OPC_SRLI, ret, ret, 32);
+    }
 }
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
-    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
+    if (have_zbb) {
+        tcg_out_opc_imm(s, OPC_SEXT_B, ret, arg, 0);
+    } else {
+        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 24);
+        tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 24);
+    }
 }
 
 static void tcg_out_ext16s(TCGContext *s, TCGType type, TCGReg ret, TCGReg arg)
 {
-    tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
-    tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
+    if (have_zbb) {
+        tcg_out_opc_imm(s, OPC_SEXT_H, ret, arg, 0);
+    } else {
+        tcg_out_opc_imm(s, OPC_SLLIW, ret, arg, 16);
+        tcg_out_opc_imm(s, OPC_SRAIW, ret, ret, 16);
+    }
 }
 
 static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
-- 
2.34.1


