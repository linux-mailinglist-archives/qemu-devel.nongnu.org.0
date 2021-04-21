Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 987C836644E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:19:49 +0200 (CEST)
Received: from localhost ([::1]:54852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4L6-0004vY-N6
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fs-0006lg-5O
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:24 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fk-0002vd-5S
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id j7so19099626pgi.3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EA1VakVSy8KKgmzlZy2S0QDEcM6PFoqkoum2F7ZUq2o=;
 b=ksW4Aape8AihmEuHh9N1ISGBiJ/F3gAQohsoVaKE7W34H3DQpf6g9PR/0838iz5f7O
 YKfeIzKdvzKmAAUXuBBJZjWJW5Kp/e54FnkZWi3KMWqupWp/itFlh6c7ZrrugWbc56gs
 6l/j1W83IXWYCIxNDkjZWAJyO9CRDZURE7KbtHXhPbspG3Zi39o5LjXGrpTzQnMf/4NH
 ftjlKe0fHRlC7kIbPw6rCmojA/J1u8CU/TnHM4eCWCeO4aA/7t7DyseT2eNjBQxPULsr
 baKLXdshdzIs0Z/aFGJTZFOdIqI2Idd9IiZht6RBZlVohDXxrzu03exw3uegXM6jUujE
 dPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EA1VakVSy8KKgmzlZy2S0QDEcM6PFoqkoum2F7ZUq2o=;
 b=MzjPQmQoYHFVsL5437RsILv6xixsnw73TjJV4AC8GpzDM1TAlqBlv1U8DaRVR18KZv
 FQzIfb4EcEdneoRDOfVYfmkBcG0nsbPR/d7DuSEfok6ccnNe92kOYo+otDcpm7KZ5gfn
 tS/x084EIuX69Gvmz2XsGKYSlPiGIZGCXEL5akSu1CdVoeHLyM1iwp2OKn1uj9dZ8OC+
 Nk+2XfF9FrWT9zWIDu0ZQeHrfihUXHJQti8P+/y+Sj/6rDn+63uMOi+rInn63bHhzw/j
 kmDRZcly0bIGizTEwkzUtmDAbMq9PsAuW7m7Npe/a2dUF2lFjZkLnqJA4dwlUznJKb+p
 Od5w==
X-Gm-Message-State: AOAM533jRiTYOARNIQw5oKcA6XjCuWO2O0ew9NORMTz4XTPuJ/sABdTa
 9GGE4/5cguimVGI/Y51kCCH1Fos92tTVawvR
X-Google-Smtp-Source: ABdhPJzJYnSvlLszI4WzK+hCTZArxULFKW4oJFWmyQYdUP7eJvKhMVnNYfeLI1T+DsAS4p00NH0COg==
X-Received: by 2002:a17:90b:50f:: with SMTP id
 r15mr8816828pjz.39.1618978454727; 
 Tue, 20 Apr 2021 21:14:14 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:14 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 03/17] target/riscv: rvb: count bits set
Date: Wed, 21 Apr 2021 12:13:45 +0800
Message-Id: <20210421041400.22243-4-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn32-64.decode           |  1 +
 target/riscv/insn32.decode              |  1 +
 target/riscv/insn_trans/trans_rvb.c.inc | 12 ++++++++++++
 target/riscv/translate.c                |  6 ++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index f4c42720fc7..89498a9a28a 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -90,3 +90,4 @@ hsv_d     0110111  .....   ..... 100 00000 1110011 @r2_s
 # *** RV64B Standard Extension (in addition to RV32B) ***
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8fe838cf0d0..0e321da37f4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -597,3 +597,4 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
+cpop       011000 000010 ..... 001 ..... 0010011 @r2
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 76788c2f353..dbbd94e1015 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -29,6 +29,12 @@ static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
     return gen_unary(ctx, a, gen_ctz);
 }
 
+static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, tcg_gen_ctpop_tl);
+}
+
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
@@ -44,4 +50,10 @@ static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
     return gen_unary(ctx, a, gen_ctzw);
 }
 
+static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, gen_cpopw);
+}
+
 #endif
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 4648c422f42..b20a58c63b4 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -551,6 +551,12 @@ static void gen_clzw(TCGv ret, TCGv arg1)
     tcg_gen_subi_i64(ret, ret, 32);
 }
 
+static void gen_cpopw(TCGv ret, TCGv arg1)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_ctpop_tl(ret, arg1);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


