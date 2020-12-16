Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C74D2DB8D8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 03:15:11 +0100 (CET)
Received: from localhost ([::1]:56654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpMLO-0000ko-71
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 21:15:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMBC-0000jL-8y
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:38 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:46754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kpMB9-0001Ba-Cr
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 21:04:37 -0500
Received: by mail-pg1-x533.google.com with SMTP id c22so1076445pgg.13
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 18:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1ns9CvNprivvlSCZl0WFtV5ri8PlJe6qTUuy6CSPaIw=;
 b=O8mXpIYDQ72MjNEnGrw3xqkSiPhs7kZ01xWBW7BkZp4KngWDreAcdxP06Q9obw+nON
 VE1ugzPPnE6TmxaRzdUzgfg3zPia4ba+oWvR9/Rfchm27zRDnRXnXkXIGwagTqs7KswZ
 4874ZNf8ivX0VvCxt+LDkgWkAy3H7BHUESlByyNJ+QpHqVJr2HgRK9TS0z09f3YwF0Z+
 6BDQGjmd8vjx2PG/fs5SSKpp0zf+O3AANsRazGdAF9ZYkm3JAxBiZKrBJcPJmL7c0YwS
 OQAcbblDjGn+RJhnR2isyZtrIBFSWOjqYAP2IU1XV63Idb2MRKkCBc7CEW/89PfS/7FD
 ybMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1ns9CvNprivvlSCZl0WFtV5ri8PlJe6qTUuy6CSPaIw=;
 b=aCeK/zzBnY9d1lTXweClKRAbK/mrM56mEvg4Bfb3cGsKuOGfTKzWpk1G5NdIqJtQoQ
 rHPU7fwfS1M8tE0inqlGN/2MiiW4048+ORuFq7ruyacMBei0m1jlZ4C4Roy/RZHmC/oP
 7CC4op10Ne9EEGj/0vhFgyxW8oqjZcnGV8w7QBByld2qHVJv2UJwsRqeJQhM0Na08wWZ
 VspVG2YMKn1fpKqm++NhFy1BAt1zAwSGaJ781pN0TfqJb+it8i/c64tPeAZQqSTPPiGC
 iyMgddLOAfm7g1ZRBwD9UYFmJcum1HnThK/0F4DeJ3nqyumYOXCU58DaFai+9mmwzTgV
 sjLA==
X-Gm-Message-State: AOAM531P+llb86/7yPYUXGUVdAY1b03RaESShoeUEKkc4uH7Mshqjk07
 zrsvnEu79hPPcYmCz/5tWa7HkRX23jW+Hm6wQVU=
X-Google-Smtp-Source: ABdhPJw18l/0wgKdBQ+eAH3sGBKtYBpcIMUAq2v0jT3UBc+0UyoAv20t1WpXHKd7DKF3g8LUU0EkCw==
X-Received: by 2002:a62:25c7:0:b029:156:72a3:b0c0 with SMTP id
 l190-20020a6225c70000b029015672a3b0c0mr30123689pfl.59.1608084273863; 
 Tue, 15 Dec 2020 18:04:33 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a13sm289150pfr.59.2020.12.15.18.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 18:04:33 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v2 12/15] target/riscv: rvb: generalized or-combine
Date: Wed, 16 Dec 2020 10:01:37 +0800
Message-Id: <20201216020150.3157-13-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201216020150.3157-1-frank.chang@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x533.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/bitmanip_helper.c          | 31 ++++++++++++++++++++++
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32-64.decode           |  2 ++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 34 +++++++++++++++++++++++++
 target/riscv/translate.c                |  6 +++++
 6 files changed, 77 insertions(+)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 716d80aab59..6ab55b4b176 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -70,3 +70,34 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
 
 #endif
 
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
+
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a055c539fad..de3c341c2f4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -68,9 +68,11 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
 #if defined(TARGET_RISCV64)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
+DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 #endif
 
 /* Special functions */
diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index a355b91e399..46f469700b5 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -103,6 +103,7 @@ srow       0010000 .......... 101 ..... 0111011 @r
 rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
+gorcw      0010100 .......... 101 ..... 0111011 @r
 
 sbsetiw    0010100 .......... 001 ..... 0011011 @sh5
 sbclriw    0100100 .......... 001 ..... 0011011 @sh5
@@ -111,3 +112,4 @@ sloiw      0010000 .......... 001 ..... 0011011 @sh5
 sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
+gorciw     0010100 .......... 101 ..... 0011011 @sh5
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fd8f4238ef7..98d2ee0ab56 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -620,6 +620,7 @@ sro        0010000 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
+gorc       0010100 .......... 101 ..... 0110011 @r
 
 sbseti     00101. ........... 001 ..... 0010011 @sh
 sbclri     01001. ........... 001 ..... 0010011 @sh
@@ -629,3 +630,4 @@ sloi       00100. ........... 001 ..... 0010011 @sh
 sroi       00100. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
+gorci      00101. ........... 101 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 142e9123d68..c35fe84444c 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -236,6 +236,23 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
+static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shift(ctx, a, &gen_helper_gorc);
+}
+
+static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= TARGET_LONG_BITS) {
+        return false;
+    }
+
+    return gen_shifti(ctx, a, &gen_helper_gorc);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -384,4 +401,21 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_shiftiw(ctx, a, &gen_grevw);
 }
 
+static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_shiftw(ctx, a, &gen_gorcw);
+}
+
+static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
+    if (a->shamt >= 32) {
+        return false;
+    }
+
+    return gen_shiftiw(ctx, a, &gen_gorcw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index b40d170c01b..021daf10875 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -917,6 +917,12 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_grev(ret, arg1, arg2);
 }
 
+static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    gen_helper_gorc(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


