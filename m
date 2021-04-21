Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF5366487
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:25:33 +0200 (CEST)
Received: from localhost ([::1]:49810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Qe-0005x8-6U
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GT-0007QJ-8g
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:01 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4GP-0003Lj-Ay
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:15:01 -0400
Received: by mail-pf1-x42d.google.com with SMTP id h11so9803155pfn.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LKTAYv1ZhXep+SFlA+lQrA8de8BbGJbbUnzR8R+sZJc=;
 b=OwuQD3OuL3zQBldVt7wnLw0gRiBryz1rrxNW1lp+iedgLXgFe+PCC6OC8XziuCKmQD
 wy9End4ELKPazXn1M9Re8eKTdtlzbauVDHlNmwzdEMy3TFfpyJVV4CNABpIPIGiK2D5t
 PuajS0E4cOd+jg3qG3V1i+CG78qsCjN2YyiosNYH8/uinnagueY6D1gQY5ckP7gjxXqp
 NSPcr0x3rVVlZw1VTYqWQzZ7V/Yjx+j3N4FnS2SDhkUfHI8hls/RuV2vjazZtakSWrAM
 u3rrkEKXy2UrbmIAJmOgsTN/S6Zx/Dff4kOLQ7TihdolOds2X0mRltxL6DZTqN2eaGrU
 tObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LKTAYv1ZhXep+SFlA+lQrA8de8BbGJbbUnzR8R+sZJc=;
 b=LyeL5Gjj5XYA0bI5UrLL6Ei/2gLWMuD15jqhVFwjmNmEMA8yVKWBD/kURKN9/8DGnY
 Nd+UjXIHuu4o8Xr0NcwZVgCxUauWLXbBXDUoBpx+JyHUvIHtaAYQ9y+58P+Hpd/5oyO2
 3kKOF0Bh5M2VObX1VWEXl7Mpqv1FQ6iM8hAOzxR2GtjCYQAQxa3S9Cke2V2AeehYTptq
 wALwo2shBQOqYylr3RUxDtZBIPz+X/lnTJVnNqhYHum7y7sgD858c2mc/AWcsP5tLAPC
 i7X9tcilWdDGJP4cvy+o83mys9RwQ8NAnBCZbJHsyUkS29lhkqOpW83bAyFpmiwuSD0S
 Q6/w==
X-Gm-Message-State: AOAM533ySaDg3hjaEYciDdS2juL36OiRXymrXLPE/n2g6yNtfK98jT5M
 x2Nr9tc1A9ZwXluIDLc6TS5gf6KTnW2/jM+y
X-Google-Smtp-Source: ABdhPJx3/V8Wwch5VzyFEKgssskNxsBSRdndKOTySkS1tUVM59hI7FXHBFpMJJ2wvmAVgHxKBQpqDQ==
X-Received: by 2002:a17:90a:7783:: with SMTP id
 v3mr8870958pjk.177.1618978495729; 
 Tue, 20 Apr 2021 21:14:55 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:55 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 15/17] target/riscv: rvb: add/shift with prefix zero-extend
Date: Wed, 21 Apr 2021 12:13:57 +0800
Message-Id: <20210421041400.22243-16-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn32-64.decode           |  3 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 24 ++++++++++++++++++++++++
 target/riscv/translate.c                |  6 ++++++
 3 files changed, 33 insertions(+)

diff --git a/target/riscv/insn32-64.decode b/target/riscv/insn32-64.decode
index 2f80b0c07ae..01b28718af5 100644
--- a/target/riscv/insn32-64.decode
+++ b/target/riscv/insn32-64.decode
@@ -107,6 +107,7 @@ gorcw      0010100 .......... 101 ..... 0111011 @r
 sh1add_uw  0010000 .......... 010 ..... 0111011 @r
 sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -116,3 +117,5 @@ sroiw      0010000 .......... 101 ..... 0011011 @sh5
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
+
+slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index ca987f2705f..d69bda2f7b3 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -390,4 +390,28 @@ GEN_TRANS_SHADD_UW(1)
 GEN_TRANS_SHADD_UW(2)
 GEN_TRANS_SHADD_UW(3)
 
+static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_arith(ctx, a, gen_add_uw);
+}
+
+static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+
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
index 7e92cd87851..764e8f8cb0d 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -755,6 +755,12 @@ GEN_SHADD_UW(1)
 GEN_SHADD_UW(2)
 GEN_SHADD_UW(3)
 
+static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
+{
+    tcg_gen_ext32u_tl(arg1, arg1);
+    tcg_gen_add_tl(ret, arg1, arg2);
+}
+
 #endif
 
 static bool gen_arith(DisasContext *ctx, arg_r *a,
-- 
2.17.1


