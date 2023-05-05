Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEE6F7A4A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:04:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujrO-0007z3-5R; Thu, 04 May 2023 21:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrM-0007yq-5U
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:44 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujrK-0006sg-Dd
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:03:43 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16294962b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248621; x=1685840621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gzoJE78iVJN0femplDxvF1wc7FoDyCByCqci+Nuw7LQ=;
 b=gCdw6nUHIo1/1kCdBfIgxgFSX5s9S64q0vKikLMVQ1dlDL98gcXwOe9Q1Ro9QO8Qx/
 bAZdpJCog3N0i/7pPG2aWVm5xbLWMytkAjBAE4BcmJvVDtXc58GpdQadQQTq2/1oezXG
 XRf8m8ff91slvD8uFeusk1iU9Kavo7AoIWpdV7A39yML4CAoNubKUHKDyP9BqYpikVkY
 dexdVTawDu4vnzHE0ujt7hImYDDjqVxQasLxDm0DgDIadgwdEh+LKL8/D8HBZq6YJ7xG
 PTxaNjjp7j0YxKUI4LQDlJ2OcBjmGCSdOppzlpJBCErUCDEjiwIn9fYqO25b2+c1v7H8
 e0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248621; x=1685840621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gzoJE78iVJN0femplDxvF1wc7FoDyCByCqci+Nuw7LQ=;
 b=gH/YPJ05+lO/JG9gIggSNRkB/F2z/XrCzpgrWwzPuPG36cDVmR3XAMKSwf3Y7altHC
 nqQB8E+ay+3gUZvXuz6Mb3CyfHQu6ImyQX8ipcg0idEiidnxoU7tAPA13YJ9Vr/CXfPO
 5w2Gbp1xfxXz3pRfKTR0D3zkFns/dz5fojvUhtfaIycDaGU7lldm2Th8YRv3XlyQOwQH
 Fu7y/uN7VRY5wv+1+B8LPXdG06xmhupU+LMK7HDJgONicBVmRru+NsosricWUGSvnqHU
 r/TSnGJ6/B0090JWqAofVIEgFjimu/iMp/iVYnYNqmFM1+k9BvH79GXuvfVHY8xbBROQ
 l19g==
X-Gm-Message-State: AC+VfDw4USok5Lyqpwnn26dXVtHP1IpBmtvJE6apetYD+Rp+v9faamIz
 mSSOjWJ1t68dQPA95cC62gtXdxcpUgPmzQ==
X-Google-Smtp-Source: ACHHUZ5mHnFCnj/Y8xcC9K5tf/rVUmSp9ryFsjYIkvtsuu9syabjZg88EOQbPOXaEIzMKSiV/UFIrg==
X-Received: by 2002:a17:903:2303:b0:1aa:d4ba:de2 with SMTP id
 d3-20020a170903230300b001aad4ba0de2mr6449125plh.18.1683248620594; 
 Thu, 04 May 2023 18:03:40 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:03:40 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/89] target/riscv: redirect XVentanaCondOps to use the Zicond
 functions
Date: Fri,  5 May 2023 11:01:19 +1000
Message-Id: <20230505010241.21812-8-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The Zicond standard extension implements the same instruction
semantics as XVentanaCondOps, although using different mnemonics and
opcodes.

Point XVentanaCondOps to the (newly implemented) Zicond implementation
to reduce the future maintenance burden.

Also updating MAINTAINERS as trans_xventanacondops.c.inc.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230307180708.302867-3-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS                                    |  2 +-
 .../insn_trans/trans_xventanacondops.c.inc     | 18 +++---------------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b22b85bc3a..431556c217 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -328,7 +328,7 @@ F: target/riscv/xthead*.decode
 RISC-V XVentanaCondOps extension
 M: Philipp Tomsich <philipp.tomsich@vrull.eu>
 L: qemu-riscv@nongnu.org
-S: Supported
+S: Maintained
 F: target/riscv/XVentanaCondOps.decode
 F: target/riscv/insn_trans/trans_xventanacondops.c.inc
 
diff --git a/target/riscv/insn_trans/trans_xventanacondops.c.inc b/target/riscv/insn_trans/trans_xventanacondops.c.inc
index 16849e6d4e..38c15f2825 100644
--- a/target/riscv/insn_trans/trans_xventanacondops.c.inc
+++ b/target/riscv/insn_trans/trans_xventanacondops.c.inc
@@ -1,7 +1,7 @@
 /*
  * RISC-V translation routines for the XVentanaCondOps extension.
  *
- * Copyright (c) 2021-2022 VRULL GmbH.
+ * Copyright (c) 2021-2023 VRULL GmbH.
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -16,24 +16,12 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-static bool gen_vt_condmask(DisasContext *ctx, arg_r *a, TCGCond cond)
-{
-    TCGv dest = dest_gpr(ctx, a->rd);
-    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
-    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
-
-    tcg_gen_movcond_tl(cond, dest, src2, ctx->zero, src1, ctx->zero);
-
-    gen_set_gpr(ctx, a->rd, dest);
-    return true;
-}
-
 static bool trans_vt_maskc(DisasContext *ctx, arg_r *a)
 {
-    return gen_vt_condmask(ctx, a, TCG_COND_NE);
+    return gen_logic(ctx, a, gen_czero_eqz);
 }
 
 static bool trans_vt_maskcn(DisasContext *ctx, arg_r *a)
 {
-    return gen_vt_condmask(ctx, a, TCG_COND_EQ);
+    return gen_logic(ctx, a, gen_czero_nez);
 }
-- 
2.40.0


