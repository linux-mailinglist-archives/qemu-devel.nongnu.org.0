Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DBE2F4534
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:30:09 +0100 (CET)
Received: from localhost ([::1]:45368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzabY-0002XM-TB
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaNE-0007mY-Ji
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:15:20 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaN7-0004EF-Ak
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:15:20 -0500
Received: by mail-pj1-x102a.google.com with SMTP id m5so589837pjv.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 23:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wuINCnXuB6SsrWmAjBhj4csaLklR2iJUL+TrTVfP7x8=;
 b=cDF4Ed+lf0XqvzSHgbbfUd3YdCvIpsKPxUOOoiN4+ihoSvdYa1g+0j5Q5AFswX9GGE
 Oqt3vqIiVEkXEjSXU/Ow3FhONdAbRJ4a6QNfk4QkWEJF+LHTo0IPbQL5N8/fOnWTJj0a
 eXVZyntoMRknozwrvs4+s7MNXrIDpWVGeDenDMmGR/zyq+uVbfYiaVZvu4u4fbAoLnn+
 5YURZaJW1I6FWLfN43zbUNMr1LF4CvjBATJqoQvgL+tGE4C1H3r6/Okhn9aJ1A70dAWd
 t56mWIiZmy/NPwizoVefap0u2ZiD5CtMVAHIyFzrL5drBPok0zohv74nyzdkdxDm4n+/
 JUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=wuINCnXuB6SsrWmAjBhj4csaLklR2iJUL+TrTVfP7x8=;
 b=o/Pl1XiOF14TjfGWgWvaMBocpxn5fHipejRd+gKecGrUK2nIBwobcR1HLv5kIGsSEe
 DGAO1G+BTGIPeuZm6FEVW2PPYX7se19Wfd/sbFiHsuTbLo2886Z5wz2suWADD2x0EoXa
 34UMzRXsCKoXnM+8bgXkL3hRGVZfaxe9TmKazeT6I2FeS4V29m1C8kmz1qgKVxjxGDEm
 1aRdUxWF+Npej3o1xF1VS0zD9B0RaJDgrrgLSRK1KB/Uyu/s6X00mhowpt3BLEX/Nz+9
 xwMj7s87TeVr/ajHro7qDdr5a5lNAiFb1BiSQe11L396NOt9WwdNYrgZ24pnImUrFYZi
 w92g==
X-Gm-Message-State: AOAM530r6A1puYh0r3Cj7x5prh143FenkyfJS12QwtXVzLeyF7GRum03
 pwlejDBwE9Ggepz6t2kEk34zdi6zFwIGJgkW
X-Google-Smtp-Source: ABdhPJzxLxkwbEUu+nzVon+xGfy7bZukdRwOfbeRc8Y6Cn2hGXS2nbhlxuTWOgUwHelw6wk5XCrYCg==
X-Received: by 2002:a17:90a:de94:: with SMTP id
 n20mr847956pjv.196.1610522110572; 
 Tue, 12 Jan 2021 23:15:10 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:15:10 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 13/16] target/riscv: rvb: generalized or-combine
Date: Wed, 13 Jan 2021 15:13:45 +0800
Message-Id: <20210113071350.24852-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/bitmanip_helper.c          | 31 +++++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32-64.decode           |  2 ++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 +++++++++++++++++++
 target/riscv/translate.c                |  6 +++++
 6 files changed, 67 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 1d3235bc0d6..389b52eccd9 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -69,3 +69,34 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
 }
 
 #endif
+
+static target_ulong do_gorc(target_ulong rs1,
+                            target_ulong rs2,
+                            int bits)
+{
+    target_ulong x = rs1;
+    int i, shift;
+
+    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
+        if (rs2 & shift) {
+            x |= do_swap(x, adjacent_masks[i], shift);
+        }
+    }
+
+    return x;
+}
+
+target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
+}
+
+/* RV64-only instruction */
+#ifdef TARGET_RISCV64
+
+target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
+{
+    return do_gorc(rs1, rs2, 32);
+}
+
+#endif
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index db8b770f1aa..7ddaea61798 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -60,9 +60,11 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 #if defined(TARGET_RISCV64)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 #endif
 
 /* Special functions */
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 38ceadd4553..894db5e3abf 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -103,6 +103,7 @@ srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
+gorcw      0010100 .......... 101 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -111,3 +112,4 @@ sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
+gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fa4bba4f0ee..0756ea5cc28 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -620,6 +620,7 @@ sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
+gorc       0010100 .......... 101 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -629,3 +630,4 @@ sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
+gorci      00101. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 286643cd183..a4181dbf0de 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -214,6 +214,18 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
+static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, gen_helper_gorc);
+}
+
+static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shifti(ctx, a, gen_helper_gorc);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -343,4 +355,16 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_shiftiw(ctx, a, gen_grevw);
 }
 
+static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, gen_gorcw);
+}
+
+static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftiw(ctx, a, gen_gorcw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index cb040a15003..e845b311a3d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -892,6 +892,12 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_grev(ret, arg1, arg2);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorcw(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


