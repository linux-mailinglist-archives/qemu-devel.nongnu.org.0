Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01088366459
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:23:38 +0200 (CEST)
Received: from localhost ([::1]:41348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4On-0002Y1-3s
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GB-0007As-Jg
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:38881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4G8-0003Ba-AM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:43 -0400
Received: by mail-pf1-x42e.google.com with SMTP id g16so14154146pfq.5
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UlKcyTCMHC5PHWX9t+om/fW5B4TMazN8nb4ojIDvwN4=;
 b=Os4giEMZXdnvYmmrNPRRNNI43FzD1cs3Q29t+GC0w8nIQs/5wFpB1M2nIiALdlQp0J
 gk1K7CcJviPvoHavN2lPodaunxT6Gv4l2twZYpl0d9OCkmNUjeWXWMtFFWTSrYo9heOi
 8AG9O3mgYX/l8xDkoEpaZuZrSeHLHnLP1PBLOnp34okGt5/YpXFRGzH20R7OaX2enMef
 76Vtx2O/+0eePv54rynFUijq33kuqWPPHBH3rEFnLVIFvKCtBDmAfYzmwdGbCbhSvRA7
 1jFDWMAKSbKc+9uhMvPFA/Ur49GrSyoYofwWy162GcgGoBG5mkxATgrJo8Nvm/Ip5HrY
 QTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UlKcyTCMHC5PHWX9t+om/fW5B4TMazN8nb4ojIDvwN4=;
 b=CABpQ6SMuYNqnCr3Wbvaa8XAc8oCvAGcLrMg3XkASU9NCPd83S+AggDrqjzxr2BZBu
 U98T16P8FxzD+gUQvxVRP3rqscLGsFmAc6Y8uhhu+chpshBPVLLSvC7ff37ltFVm0smf
 Du4J1v5PQ3CLvsTSKxt7OkKHN0DsNZRwfdH756JmNFnuHnVv1KdHMmfkbz4ZWtx8nAhH
 npqJePlY79mr2jvK4iKB5h5b4GgDTQ+yehrbvUvI4gNvlAGDz0y6e1whsrU5GNJi5Asy
 f1Ua75hue+FvpVvCAKnsU/Ekgmit6NQKgCvGeGhDRcdwwv9PxDW8Wfre0X5lTaPXiohb
 rf5Q==
X-Gm-Message-State: AOAM533NWS8XL/CfvMX2tDbwES+KgPvm4lWwEttL2OidymRCJqCZCVNl
 14n9/4wo+edzQrv1gPcmxsd3rSSrU8yupffw
X-Google-Smtp-Source: ABdhPJxJ3mloc7bHGy/USbOVWlZcNVBXwo687IwsFkty4/HFuKgRuXhog6eG1Pvx93nT9uTcwK1wYA==
X-Received: by 2002:a17:90a:fa0c:: with SMTP id
 cm12mr8881977pjb.54.1618978478856; 
 Tue, 20 Apr 2021 21:14:38 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 10/17] target/riscv: rvb: shift ones
Date: Wed, 21 Apr 2021 12:13:52 +0800
Message-Id: <20210421041400.22243-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42e.google.com
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
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  4 +++
 target/riscv/insn32.decode              |  4 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 48 +++++++++++++++++++++++++
 target/riscv/translate.c                | 14 ++++++++
 4 files changed, 70 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f6c63c31b03..8c3ed33077e 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -98,7 +98,11 @@ bsetw      0010100 .......... 001 ..... 0111011 @r
 bclrw      0100100 .......... 001 ..... 0111011 @r
 binvw      0110100 .......... 001 ..... 0111011 @r
 bextw      0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
 binviw     0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 64d2b057764..0ea92312372 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -615,8 +615,12 @@ bset       0010100 .......... 001 ..... 0110011 @r
 bclr       0100100 .......... 001 ..... 0110011 @r
 binv       0110100 .......... 001 ..... 0110011 @r
 bext       0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
 binvi      01101. ........... 001 ..... 0010011 @sh
 bexti      01001. ........... 101 ..... 0010011 @sh
+sloi       00100. ........... 001 ..... 0010011 @sh
+sroi       00100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 0c41f135dc6..44f9f639240 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,30 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
     return gen_shifti(ctx, a, gen_bext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_sro);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -230,4 +254,28 @@ static bool trans_bextw(DisasContext *ctx, arg_bextw *a)
     return gen_shiftw(ctx, a, gen_bext);
 }
 
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_slo);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_slo);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_sro);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_sro);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 28fb843a261..c7457553673 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -601,6 +601,20 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
+static void gen_slo(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shl_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
+static void gen_sro(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_not_tl(ret, arg1);
+    tcg_gen_shr_tl(ret, ret, arg2);
+    tcg_gen_not_tl(ret, ret);
+}
+
 #ifdef TARGET_RISCV64
 
 static void gen_ctzw(TCGv ret, TCGv arg1)
-- 
2.17.1


