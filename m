Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D375F43FA43
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:52:27 +0200 (CEST)
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOYk-0007cH-N6
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmS-00072V-1F
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:32 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:33740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmQ-0006Bm-N4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id t184so8713532pfd.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9kvvvHxXjQ2XDAckOwgHwYb7RgcvEtihb3X2Pk2Ob7E=;
 b=j7MlKkBd3tvg3yLwJr9707PgLCq2Qf3ON1YUnbGAQ/AGFK3iub6Yv1Oolt/ccwaceY
 oO6V0b11qB/BopFQ2manucERegKA9jTIicpSw96XGDb4gBYxsWY69r/BDXfuLwmOYE1T
 hSOnYtncOsundr6mbwvhrKUeYT/I2ZChrBLbV26QMNendrOlIXRBnsMcLnwf0fW3d0pn
 FWctzx+3IFsu+jh6lnwaqXy+z++cLnFGm4T6s+2bnnNflg9/ENHTf79EwMDXuujCnmAf
 bIle9Y1gBx23a6FkwvTayN/NhZ2mLMRAKTMj8bCIBzrrAj+Zse8vAboAOz80qEYyaskq
 Zd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9kvvvHxXjQ2XDAckOwgHwYb7RgcvEtihb3X2Pk2Ob7E=;
 b=5YQVkVcZW/l6jQ6KiDN00xhx0XrEN21g3wIp+KEcb4FP0VA7muPyn288I0Xh9H90wb
 bJbruAkxJygZcXXtqOpc9HYWTbSlaR/LgsIbOimoZuib73UOZW05hRm6WtubvuBr0+3J
 NzlSCk5UXmfOURy8FKXfTQTMbXWgxkQyU8ZGrYAbiS0iS+GMH1/oD7pvyV1r7PN9CxNc
 5qqAVoa46GhB5dL3B9DGy8Wc9Ne4FgWRX1bncxhviQCLFkj76UwYo4VZQcCrIzcb/hVJ
 5QE7n+NUknEt7RbHKim8Eq4NQwas/lro+9e1UjrNC2dBXojQUV0eVbKl9nXYxPSYYR9E
 PDrw==
X-Gm-Message-State: AOAM530ZannOZUGwjc4BtBmrPp+YZ31HifEu9F/keGRetUfGcgdJxmFl
 H+22BqadUJsPJwP7mEmO9glxxEzhnVYLQvr/
X-Google-Smtp-Source: ABdhPJyBNyBBtrK8ynqZjpLSMDjrMASla5HXYGU0mFwO+uwELI+tkBCjG0ulCftRgE159l2QjkNfKw==
X-Received: by 2002:a65:6ab5:: with SMTP id x21mr7228007pgu.256.1635498148299; 
 Fri, 29 Oct 2021 02:02:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 46/76] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Fri, 29 Oct 2021 16:58:51 +0800
Message-Id: <20211029085922.255197-47-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index f6202835ff4..ed4554b6a1d 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1999,7 +1999,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.25.1


