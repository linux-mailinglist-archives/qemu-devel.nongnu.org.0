Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3D12DB8C4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:09:54 +0100 (CET)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMGH-0004DR-EC
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:09:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9e-00073K-AZ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:03:02 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpM9c-0000yr-00
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:03:02 -0500
Received: by mail-pj1-x1035.google.com with SMTP id lb18so628457pjb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=eiTghjnWEsAzpHMW+REdOftMH4O8tJHHC5IsmbomEks=;
 b=YzzricU8Lz2bG77irmvnd90OLlc/egD+vkuVe34p3KukF2k4MAbCkNucw7dT6cers3
 ORwLRHGRC9hw+cpcXemmBZGLSwRM4Eo++0Ugf91ZtnSg48PVTcSiCxfSvXYnehJhuPz0
 zTNH5vyoT5LIhxB8+DuKaOeA13K/qnrFVAYE4YR2n0GxboZPODHyzjZplqzCoyIx/ISB
 0j8yn75wb4h51ldizcSqCWI7lhVH27Cwpqaf/cD0zs9RVeVLI8W+5DlzQ4nQcS8xDF/d
 Iw7Hpng3Gwx98f4kSQAEeOODn6AVKnSSSZczhrC8oLjyXc1Mijmnr4rmbUsAfw2Xn2Zz
 ipjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=eiTghjnWEsAzpHMW+REdOftMH4O8tJHHC5IsmbomEks=;
 b=EqkIm6tbpVJS7XY0raU13uan9dU86hd0zQ7tydGjMunTAY1pvz+//YtJpI2La2FgEF
 KNDZ/O//EToIUFJ59e8Q1goqzPTIulOGqAUF607eLF4iRpy8IKRSDBodOLzSeN0NkQva
 fE5dvmuZ3+npNLucNF1NnvxrGoBsgKcuUjIi0vjTR1s5FYZHJspmLBFMV8zTQNh7+nUl
 eUV4JeEkLz5P+4JxT1d/J1G9aPN3iqAsrO846cyWWa9T8eHcAgaKzCVUdsbDm1WyV6bU
 EawVuu/abbGC+bR86DyT8P4ZLtKw7hP1ILzho3M8hEgDKOBzHZ0cOeJHgH2gLleUA4Ne
 akEQ==
X-Gm-Message-State: AOAM533lVoW5weCigFGv2KYMuPUMjuDyg8UmYcMOgXvpglSmSZP366uA
 F8Hl1VEl+tU40p3Ba1/Za+RsFW1Mvo5VnC13qBU=
X-Google-Smtp-Source: ABdhPJwaZrWJ2FirT6+/h+1PrcGVQbOmTAhFm3X7vGDkKcx4sKtUUewd9peF6Egn1abO0xBEWRkqjA==
X-Received: by 2002:a17:90b:384c:: with SMTP id
 nl12mr1216689pjb.72.1608084178444; 
 Tue, 15 Dec 2020 18:02:58 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:02:58 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 09/15] target/riscv: rvb: shift ones
Date: Wed, 16 Dec 2020 10:01:34 +0800
Message-Id: <20201216020150.3157-10-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  4 ++
 target/riscv/insn32.decode              |  4 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 58 +++++++++++++++++++++++++
 target/riscv/translate.c                | 13 ++++++
 4 files changed, 79 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index e2490f791b7..6d017c70c74 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -98,7 +98,11 @@ sbsetw     0010100 .......... 001 ..... 0111011 @r
 sbclrw     0100100 .......... 001 ..... 0111011 @r
 sbinvw     0110100 .......... 001 ..... 0111011 @r
 sbextw     0100100 .......... 101 ..... 0111011 @r
+slow       0010000 .......... 001 ..... 0111011 @r
+srow       0010000 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
 sbinviw    0110100 .......... 001 ..... 0011011 @sh5
+sloiw      0010000 .......... 001 ..... 0011011 @sh5
+sroiw      0010000 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c697ff5c867..78ce4b11097 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -615,8 +615,12 @@ sbset      0010100 .......... 001 ..... 0110011 @r
 sbclr      0100100 .......... 001 ..... 0110011 @r
 sbinv      0110100 .......... 001 ..... 0110011 @r
 sbext      0100100 .......... 101 ..... 0110011 @r
+slo        0010000 .......... 001 ..... 0110011 @r
+sro        0010000 .......... 101 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
 sbinvi     01101. ........... 001 ..... 0010011 @sh
 sbexti     01001. ........... 101 ..... 0010011 @sh
+sloi       00100. ........... 001 ..... 0010011 @sh
+sroi       00100. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 43e9b670f73..11b5439e703 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -155,6 +155,40 @@ static bool trans_sbexti(DisasContext *ctx, arg_sbexti *a)
     return gen_shifti(ctx, a, &gen_sbext);
 }
 
+static bool trans_slo(DisasContext *ctx, arg_slo *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_slo);
+}
+
+static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_shifti(ctx, a, &gen_slo);
+}
+
+static bool trans_sro(DisasContext *ctx, arg_sro *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_sro);
+}
+
+static bool trans_sroi(DisasContext *ctx, arg_sroi *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_shifti(ctx, a, &gen_sro);
+}
+
 {
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
@@ -231,4 +265,28 @@ static bool trans_sbextw(DisasContext *ctx, arg_sbextw *a)
     return gen_shiftw(ctx, a, &gen_sbext);
 }
 
+static bool trans_slow(DisasContext *ctx, arg_slow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_slo);
+}
+
+static bool trans_sloiw(DisasContext *ctx, arg_sloiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, &gen_slo);
+}
+
+static bool trans_srow(DisasContext *ctx, arg_srow *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_sro);
+}
+
+static bool trans_sroiw(DisasContext *ctx, arg_sroiw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, &gen_sro);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index ca176709674..0c00d20ab1b 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -797,6 +797,19 @@ static void gen_sbext(TCGv ret, TCGv arg1, TCGv shamt)
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
 
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


