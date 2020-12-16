Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2254A2DB8DD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:17:01 +0100 (CET)
Received: from localhost ([::1]:60794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMN9-0002Zf-Vn
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:17:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBJ-00012A-KI
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:45 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBH-0001CX-Qz
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:45 -0500
Received: by mail-pl1-x62f.google.com with SMTP id g20so11224473plo.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iZK+rKAjOqv0UzEWB+rVOqX+wmO1H/CoTR7mTkztrw4=;
 b=LRrIBYVOjZ4gaQJ9swG7s9vZqnEnf+CPIsVrsobVI/1QhkuXTUlvscH3OF0kb3kGeE
 znFDs6tabotuq2W4ES9JZ6Shu31/ebF6/v5gyi09Qykylrt43CE894I7Dcmxua5fVYUU
 b5odlXFRoUIUeTmDcmsNO3Y5NHErq5by4+OQV6c+0Zqq5UDii/9gIfL+E4ENPilGNG7U
 JvwF86ThQr9pIOg7lzcLLZrx3AcpwpeF68TPKJr3kYhJXh8W+YR8sySoT3WVsxAjhXoF
 G8Gu/EywIMk8atme1WsfFuz6A+N0HvcmUjcpX32lupzFKIrKeV4+UwmuIpVB/isGU5q4
 UD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iZK+rKAjOqv0UzEWB+rVOqX+wmO1H/CoTR7mTkztrw4=;
 b=Or00EmFedxpfcSK8d1itsPywWMWR6TeqPQCgJPkpWGvBWl+ThCHqfRNyY7Cr9dRpx/
 I796ITQSe8QJvk9ZH6veQlXXhpzL6ITeQn2I10CeHWr4a0rTUnatw4Y9IrQCXpxulP3h
 mVmP8PNKnyzR81XUSMZ9fOfPaPjHsPFZG37E2Rg9VxoBeuB4ij6vA3vRQ8Zd1kiGyw2d
 3qMzrgGkB2+4yX55h5yXwaI2IC5UHDUxGTX/a/F44bJsQAJPyqTD97RWUJqVmJzysxu/
 FTLPR+XW8OX3L4UJm1a15y4I15qI2t4NfvMVe4eNsvZNlUTDbZmHFl57ljqFhXyGcbMT
 XhLw==
X-Gm-Message-State: AOAM531bJA6BRghwnSfOAnzC/1qi43sAF+dqmNdYHmF76V2xmp4DWDqX
 U8ySyD+L8cmoI/YGxu3lLuwVuuU+lrWH81c/WS8=
X-Google-Smtp-Source: ABdhPJzXNBfhMClpQSOvbpzqiCtsZCyMMscbthuhjJuBb+BEmIH5oa7XUf0rsGLHweOmDVMYqs7cwg==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr1221689pjb.72.1608084282334; 
 Tue, 15 Dec 2020 18:04:42 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 14/15] target/riscv: rvb: add/sub with postfix zero-extend
Date: Wed, 16 Dec 2020 10:01:39 +0800
Message-Id: <20201216020150.3157-15-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62f.google.com
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 22 ++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 31 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 1059cab5aa4..f819028266c 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1addu_w  0010000 .......... 010 ..... 0111011 @r
 sh2addu_w  0010000 .......... 100 ..... 0111011 @r
 sh3addu_w  0010000 .......... 110 ..... 0111011 @r
+addu_w     0000100 .......... 000 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slliu_w    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 07fe662b005..323ca5eccee 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -441,4 +441,26 @@ GEN_TRANS_SHADDU_W(1)
 GEN_TRANS_SHADDU_W(2)
 GEN_TRANS_SHADDU_W(3)
 
+static bool trans_addu_w(DisasContext *ctx, arg_addu_w *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, &gen_addu_w);
+}
+
+static bool trans_slliu_w(DisasContext *ctx, arg_slliu_w *a)
+{
+    TCGv source1 = tcg_temp_new();
+    gen_get_gpr(source1, a->rs1);
+
+    if (a->shamt < 32) {
+        tcg_gen_deposit_z_i64(source1, source1, a->shamt, 32);
+    } else {
+        tcg_gen_shli_i64(source1, source1, a->shamt);
+    }
+
+    gen_set_gpr(a->rd, source1);
+    tcg_temp_free(source1);
+    return true;
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index f9385bbcd4f..84e55880234 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -955,6 +955,12 @@ GEN_SHADDU_W(1)
 GEN_SHADDU_W(2)
 GEN_SHADDU_W(3)
 
+static void gen_addu_w(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


