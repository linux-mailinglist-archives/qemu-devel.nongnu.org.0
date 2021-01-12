Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079A72F2645
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 03:29:42 +0100 (CET)
Received: from localhost ([::1]:47106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz9RF-0001We-4A
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 21:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Io-0000yv-Rb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:21:00 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:38274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kz9Ie-00029v-Hp
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 21:20:56 -0500
Received: by mail-pg1-x52d.google.com with SMTP id q7so423555pgm.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 18:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=Zgk5gKtL9E6rrgTfbk/2B9Bisx7I4g5EDyoeHjEDYvzSAc5tcr9sBzi4FuzT2gqffd
 xLk6iqJFjHqmN7RgjhX8j0pnGsu4Ii3SBHNU6voopgKM9XXYPoyPwkg2kYTGwBZXj+5A
 PDH3xRaPZP5GuqTGSTXIOV0jJk1o2CmJX6Ov/mYox8OtznKCIGcbmZIhJYwm+HYhC5+I
 mWtnEjDW912ETrDdeE4ZngPT6VZMYme7QoXBp2ZJvKKc1oy9QdewBxwLDxjdnyV6D5Va
 s/XsUPipQJDTNUSASiGZVWI2n3A/7Fft5LW7b3goS7XJ71ByDDGmsjlUYwmI9ROu9rpt
 MqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=0zrnOavVe6XnQO96zzyHm13OUa7JpL0pUTrhRmvRqro=;
 b=QIRHlc174Ib5Z1JJ3pP9HJqQPhYEwfZkGQylzS0kG9WBJPsl/8QCyxmlHeLvhWMh+T
 ULZUcG++iy79GJ/qaZ7YfzUr2WaFzP+hdXqheV0caY/YCbGCdYFLD+b/PA+5vgi7hWu9
 aTR7jGZ9NCrUZoR1JjEJbqFspvGXNstb++2ESU3vvr5KnYg6a9zY31iH3miXEbEDTdEe
 elW0MNaCQ51ZdWC4mRI5b3qmGfvoGQ20PfD7Y/9ntdgUgr1J8iYncHvHZFdwcRvnxLoR
 62zGzwpDELgf5CsETOfiuFNDUMR9PmPq/lZD/8RQ05ILyl5qH7Qcn16GuUtl7cnnc+/n
 XNfA==
X-Gm-Message-State: AOAM530OhXaEbYT0sSdE0+0dPqPvDXz4duyn+Lg7YvEN0d9Jo6O6VeDg
 PYX57dFqQ9/Kctl4JknTHvWQ2CIrOO49C0iL
X-Google-Smtp-Source: ABdhPJyvobBozlydY7fRYp+1Du7jq5hU00dgajEyOpbT9dq7uqBfE2K+dbOWwnBjlj5HX0PGVJ0vnw==
X-Received: by 2002:a05:6a00:44:b029:19d:e250:1355 with SMTP id
 i4-20020a056a000044b029019de2501355mr2313984pfk.36.1610418045186; 
 Mon, 11 Jan 2021 18:20:45 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x14sm981326pfp.77.2021.01.11.18.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 18:20:44 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v3 07/16] target/riscv: rvb: sign-extend instructions
Date: Tue, 12 Jan 2021 10:19:48 +0800
Message-Id: <20210112022001.20521-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112022001.20521-1-frank.chang@sifive.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52d.google.com
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


