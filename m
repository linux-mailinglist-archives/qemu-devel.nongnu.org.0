Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9AC36645A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:23:45 +0200 (CEST)
Received: from localhost ([::1]:42198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Ou-0002sZ-IC
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GL-0007Jx-PT
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:53 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GI-0003I3-Sb
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id i190so27442170pfc.12
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D0cw4H25/7i+2JE1UkOVvTu8Q+EV1j6usobauvHAwhA=;
 b=kC6MA+9p7i8NH+ekD3/qaMoboT+Z/EpX1Ox8U05MwB0/hu3Aq5n12WVBGYVQ5fN+xk
 3mNRHKGm8AOSsFA15Y6YZvT0wksftWdrbC8Prh8cPhbaQ2hmfD1Xj9oJ1QH0NTSZIoQr
 IdiOlYKT4jxj2sBKxnVGltlBmvg0EnB4/5hWeMJJSRjHGyzwAUw3IXvcgFbUpEOhMdLn
 ppknSzGTo57kEDJEeCfcoYQD0CBDc8qbW8nxE4+Rs5EcxrCzNqj9dUiiQbsms4jcHCbA
 9aRijkHhtNuN3JMNd94bJs3wWfwaccoWw53Kz2JczSS0e/0atKAtFAA7X2JnhzRMqihO
 yRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D0cw4H25/7i+2JE1UkOVvTu8Q+EV1j6usobauvHAwhA=;
 b=OnC1SsK0yUGpA7DnWvMnmk2UfzBt4g+4aav+bPUY31xA4SYck/WxK7PrlkZWWR0pNv
 YKtKQAAJioxbfi5PT3JlBoU3i6MB3ZO4G6/038oxTnCpvr/bqIRjrIMAWR1pJQQ4ds0s
 GmIs5WIyJOBNWxhNxZYmc2RaRgBFxwymFrAKC/b9MMn7RzR16P2oXZu4bNQ6LrBHhUiQ
 3MV1QxnUpm5jpWvltHp6C03BsuxqJ7SGVP3jBa1hc66vSrXnjB9telwxdVq819RgyPz7
 8yhFusLZS2HC5OODgFg4imjh4kWqUl9ICcq62z400jShXLjWmIEImOg/e56lFp5C+I+l
 XHow==
X-Gm-Message-State: AOAM533StvT/M4RIqdwBRFMJznkvG7bwXVwl8mFmglK6YKEc2WVvaRA2
 5WCk6bwR5/EaVVZNrrqbkqms/1Qx3a0Lbbq6
X-Google-Smtp-Source: ABdhPJx37TNY7AZOy8oKQFelD5NncKvnps3jNEj5pE2fQHIlsRsQpDhV4zVjdtquvMjAX36P5VrgNQ==
X-Received: by 2002:aa7:88c6:0:b029:250:bf78:a4a3 with SMTP id
 k6-20020aa788c60000b0290250bf78a4a3mr27269782pff.70.1618978489164; 
 Tue, 20 Apr 2021 21:14:49 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:48 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 13/17] target/riscv: rvb: generalized or-combine
Date: Wed, 21 Apr 2021 12:13:55 +0800
Message-Id: <20210421041400.22243-14-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
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
index e47bae3ab2b..e1e8315ccbd 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -717,6 +717,12 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
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


