Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB307373FD6
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:31:03 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKQQ-00051f-Kd
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:31:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2x-0005TP-5t
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:47 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:41583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1leK2t-0002KI-8J
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:06:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id e2so1342467plh.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fIPRX4rZvfjgmZsp4kFN9w9Yg0oTaTpU0JN62XLcU4M=;
 b=Y4txtp2y4DxCfWPqt6KNy0GkKl8SwGOX3iYrnnagp8DGUaQdLbDy2foYUcajWFpoZx
 fKPUxkZ9wRAL/vezFzBLaywKuVv/EKKMinvmwHRzt4I/adtxctHD4OOXhcAh1KFRmXso
 M/HFqRNEv09X1wEHPmpFW7wcRwzldZoutWw9pGPEVUE0gWwvngUij6uTrgf5/mDs/cId
 zqdJN2N7ynS1EDwF2zg2GM62FtEZHHNII25rhgxFh6A5Z2arjtseXoSPJVG7zo9wHnVd
 a+mjrp/sKPZE2kW2LVYB7QHL+jC9qvdcqKauvPtJXmz9SlZJnucxxsXXeP9lViC+44en
 pFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fIPRX4rZvfjgmZsp4kFN9w9Yg0oTaTpU0JN62XLcU4M=;
 b=ocpRP80R5j7B+RqxCxvmjSJCN2SZLm3qR0VF1l/UcnoidFLLaQ53gfznwoaF4Kvt0G
 HE6U0yrviTZliOYO7bH8KuVcFCltuGThJ+n8Xsype93mvgW/rQZhGhovegIMTB8CDhZz
 cN+6j3GGyT60gZhn2D5MVpKXHthQCPJimVX38CFcyEVhrCvYBlgY10PXWi0wTMpn4XWz
 WTrGGyr0DuDBmoy2OoXjDIE/h1ya41UVIAO+t/NHL0zOM28dn5+Wa25QTp63yqxP+TbF
 L/LophxG4iVw5PiGhFvcdOz6DiS9zJIisQP4AdXKm4YyeO0e7t/Vz3zJTh+E/QUc65qd
 /T2g==
X-Gm-Message-State: AOAM533VnM+QZTKrk/JiCzBd9e8pUqRpGDXivVDO1xzxK/RNGGWHD5+N
 Op2KlJ8io6NRoP6AG24cCHNq4zNaXggGdWn3
X-Google-Smtp-Source: ABdhPJwhmVO/bq7jj8xa312lFR3ONvegn8VBAKdcqUXolYswPxKow7rpDaFNmuDIm/DocJc9gqyCUA==
X-Received: by 2002:a17:90b:3504:: with SMTP id
 ls4mr11756468pjb.222.1620230800628; 
 Wed, 05 May 2021 09:06:40 -0700 (PDT)
Received: from localhost.localdomain (122-116-72-36.HINET-IP.hinet.net.
 [122.116.72.36])
 by smtp.gmail.com with ESMTPSA id js6sm35877977pjb.0.2021.05.05.09.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 09:06:40 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 04/17] target/riscv: rvb: logic-with-negate
Date: Thu,  6 May 2021 00:06:05 +0800
Message-Id: <20210505160620.15723-5-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210505160620.15723-1-frank.chang@sifive.com>
References: <20210505160620.15723-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x631.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode              |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6f7671872d2..a4d95ea6217 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -663,6 +663,9 @@ vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+andn       0100000 .......... 111 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+xnor       0100000 .......... 100 ..... 0110011 @r
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 4a5d271b438..b8676785c6f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -35,6 +35,24 @@ static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
     return gen_unary(ctx, a, tcg_gen_ctpop_tl);
 }
 
+static bool trans_andn(DisasContext *ctx, arg_andn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_andc_tl);
+}
+
+static bool trans_orn(DisasContext *ctx, arg_orn *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_orc_tl);
+}
+
+static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, tcg_gen_eqv_tl);
+}
+
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-- 
2.17.1


