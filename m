Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123842B78F0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:40:13 +0100 (CET)
Received: from localhost ([::1]:34502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfJ0e-0004ja-2Z
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:40:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItR-0001bA-71
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:45 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kfItO-0004of-6l
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:32:44 -0500
Received: by mail-pf1-x432.google.com with SMTP id g7so969226pfc.2
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=b19CZAEI8TLcaimkbnhMiT5NLY0b6d5KIKU1WBHcNlk=;
 b=V+8Iyr0Z7WjMjX6RH+2jq7e0JlOvaBJxZ72xG1eUQoJV794ukfTqiqE5XulkIsR3Tf
 v3R7TRSDPWFx8gUKoVV0WBHLtXKT6tmh/tw1GEGBMbPTkYY8/6L+XwUywSsSyskKqSWI
 3ngJtpgk0JAQNJG06FQWKKiphEX1y0YjHGUwn10uihE4bJRawtl2EK4dDIBuZFbCX99h
 NrXsMXXlKGofFpVgYRFvSk5lO/3776yRycqG4Le8hQUfiuHXagLetJpXD9pZ76sR2N07
 ZZawXwYGUBwe7KvmwIBvWIv6eLNKqdRSoFj7zERPUt1xnkPWFhf9ay93vP/3/KrWn+cE
 p0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=b19CZAEI8TLcaimkbnhMiT5NLY0b6d5KIKU1WBHcNlk=;
 b=opqC4ocOKhxSZuFgMhPTZycaz1Kk//cz7lCbFDabnW+oQQr1TBeilyJjY48MiJyCgb
 2QGs3ohjv+OD7Y7dg8tggaSRuBhnM+C79SIyd0xO0XduRD6S835V93koqx9xi1n4xa+V
 sNtRO2qNpHbs5+g3Z/ASTHKKkv1+lJkpceaFZoNCRtfalhBvvupSatxGLxGTCdZjLmAR
 PeMT8WBgf7+EaurxSjcvioNaUmVIwJIL9mGzu2wvS3J5YoooTX0qyjRyhaxrWRRErdZv
 AhM7g7T9LnRJWUk7sKtZwzh3F6nBqFQ8Bc+3XSCzaTY/R8Et5o7D3fWov8hVmuVeGSGq
 hPHg==
X-Gm-Message-State: AOAM533KvK7v+st1iO2/jD0HcqhHdxQQu++J2YEI4r/pS9gcOuu6+VPo
 cqi7BHakScph5paRA3+Uij09FIGsxyln9l0syU4=
X-Google-Smtp-Source: ABdhPJymXct9URcNJVjLUXOyDLEb9+0rvdVQeE9kz7CZ5ARRVfqfSIWxbYIRgAj87nwdG1UvKUU+HQ==
X-Received: by 2002:a63:de57:: with SMTP id y23mr7297831pgi.62.1605688360833; 
 Wed, 18 Nov 2020 00:32:40 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id y10sm1618407pjm.34.2020.11.18.00.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 00:32:40 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 07/15] target/riscv: rvb: sign-extend instructions
Date: Wed, 18 Nov 2020 16:29:45 +0800
Message-Id: <20201118083044.13992-8-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201118083044.13992-1-frank.chang@sifive.com>
References: <20201118083044.13992-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvb.c.inc | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 372476f1d2c..626641333c6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -598,6 +598,8 @@ vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
 clz        011000000000 ..... 001 ..... 0010011 @r2
 ctz        011000000001 ..... 001 ..... 0010011 @r2
 pcnt       011000000010 ..... 001 ..... 0010011 @r2
+sext_b     011000000100 ..... 001 ..... 0010011 @r2
+sext_h     011000000101 ..... 001 ..... 0010011 @r2
 
 andn       0100000 .......... 111 ..... 0110011 @r
 orn        0100000 .......... 110 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index b9a0e39a3e5..bf15611f85a 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -95,6 +95,19 @@ static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
     return gen_arith(ctx, a, &tcg_gen_umax_tl);
 }
 
+static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext8s_tl);
+}
+
+static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
+{
+    REQUIRE_EXT(ctx, RVB);
+    return gen_unary(ctx, a, &tcg_gen_ext16s_tl);
+}
+
+{
 /* RV64-only instructions */
 #ifdef TARGET_RISCV64
 
-- 
2.17.1


