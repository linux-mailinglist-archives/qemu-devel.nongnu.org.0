Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2148E366456
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:21:59 +0200 (CEST)
Received: from localhost ([::1]:36154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4NC-0000MJ-54
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4G5-0006yH-Gm
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:38 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:33628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fy-00035n-3r
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:37 -0400
Received: by mail-pf1-x42a.google.com with SMTP id h11so9802142pfn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=FtG6v4dI/1U07ka9iRHwqgCw+Uzo2kLbGsmanEzy8lnSiz7dP2O4ivGm8wDsFhaU8w
 THslF0xr1YT5VkARUMogDM41mNc1MkLoY5XF2wlaMplD3s9bqD+heXO67UZ2J7g/NGuR
 HKqpvOwIoviXRkzpBlmcEwgdS/vMaJH3TqfJ1ReszvyQE98yQEHMwwiasDYs1I8YkUFj
 zd1HNFn7kzeXlP57Za7wSVQIAamrDbhsJQ59Nfxse/xBWxX3Dpui0vo3YU3ECNTIlWqf
 2cC9/GH3Q1BxCD4/1STBXw+nVmFgq+6immNmrxhEbOPqmGnKMgH5B1NxP4m61b+PAPDW
 aJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=Pwk9V1KZDBzf/wh8fyvhaFdyDkCrU7c+pLmF/iUh/ml/8ykOyQb5jEgM0tUsK72OPT
 8Z+Duc8t8egNJFHpAB4xqc0F07XEwEBlhpB3FqRXpGTZJFgrl2d3jgY5l7qm7IUr8xDm
 mFuCAovR7KwwESd+fRA+oqaasPQ2C6bqgk9mj0aUWjKXt74oJtUdc4v2KIBRrUFlzkrR
 BWdV/OSzCeXQJyMGCinI2mvi+L2XWR7nTDeKE+AZhnHNNNXfeCCxos+Rj4Kc/1Z4TypZ
 SyW2WzRBxw8+H4s5cllvdb4qj4id0wYNN1hrW5H/P3MMiDJbOSgbtTpabvYm5ZJdH5xe
 pW5w==
X-Gm-Message-State: AOAM532GHYzr2es7DZNKKf84LXtnMSvzCb6Bw0bPIePDlQVyMMOesMF3
 guqUzQL30iNMMJQTcNz6aEMqyzp7VXe4+E6T
X-Google-Smtp-Source: ABdhPJzP1jiOMyRHGP8WiLJTq1nfVz6W6czAAwEgJFnvBaAqdGPo183D/89dN+ufaX0AdSFN9PJVIw==
X-Received: by 2002:a17:90b:228a:: with SMTP id
 kx10mr8814527pjb.105.1618978468725; 
 Tue, 20 Apr 2021 21:14:28 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:28 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 07/17] target/riscv: rvb: sign-extend instructions
Date: Wed, 21 Apr 2021 12:13:49 +0800
Message-Id: <20210421041400.22243-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index d64326fd864..938c23088eb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+sext_b     011000 000100 ..... 001 ..... 0010011 @r2
+sext_h     011000 000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 2aa4515fe31..1496996a660 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,18 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ext16s_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


