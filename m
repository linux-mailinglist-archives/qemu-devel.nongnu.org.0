Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3B2F2D07
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:38:53 +0100 (CET)
Received: from localhost ([::1]:53116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzH4e-0002HP-3g
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDJ-0006jq-L0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:45 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:52650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGDH-0008Km-CS
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:45 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v1so1257934pjr.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=fRnJ9G+/kXb0cV5Gh7aweM/yZldnacQIs4zycqbfBqF0lI+rlFd7nAVP0l6ixfKsKc
 IYwll+CMTOqBJADEFQ15+2EfLvapOG5tUUBSoUUGQDCrpki8or5SSRrNuiN4s/LQrqfs
 dhd52dZFtYVC9uCoRolIv418yBs8Ke7C2rEIXocgNDiG59TDOw9nB/8Ch4Sswc9rg+9k
 GQRgbrvZGSYyMHgWIq0aqimldCwRU0TD9EbFvM+klvJyp01RfnfE8K1MJceWBC8e/021
 lKIM5Of25CqJOwbcB+dIMXLLaVtb8NmmzXaymcM+cRgb+POhLhfBiPxjCeRluxdx2ABC
 FiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=QhIEkvvKgWJjynTnW91z/vR+GEHfVjWa+jyQ82ie3Ffe8MVDW/5yRgTTPE6eFcVhhq
 K5JRbjo4XRmIDQ0jE0OWd6Lkv7J6bwzGax2aQRPzgdHX4xCdsEVa9LTXEsNc6JYScrod
 reFL4iNyaV7v9/ucuCc7ou9TEJcAmChk31bivCI4pf8aCn6t6dZhT0vbv1R9Huw90i2F
 aNPEyCF12UFUhyTVYR/0vH/1Mqh1vtX0z3iy+uUwJjqNLPg4nzivTxTWJN2xLPAZWR4q
 UBoyyV5C4mUdWU5q8F0dq6sVPjIN2w9rtA4TKAqIEkqnrQfgI8JfMrzOYJb0wdvEl3ic
 3ruA==
X-Gm-Message-State: AOAM530KVoesWT1Xg69p9ACJQZdU9umobX9ONxw17flisEbwAWHUFybJ
 1WaeIAIKpElYziR8Rh6JbIBz7c12vsKtWu2S
X-Google-Smtp-Source: ABdhPJzKQ1+L9qM3IJlzK0flMr0imcJ/FOmLcmDdDK8DuJUS8G6RUBu/LmQ+HOgAHxalwZh1uw4aGQ==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
 d4mr3762177pjo.56.1610444622055; 
 Tue, 12 Jan 2021 01:43:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 54/72] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Tue, 12 Jan 2021 17:39:28 +0800
Message-Id: <20210112093950.17530-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 49889a7706b..2188e92064f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2263,8 +2263,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


