Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38B7430CC6
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 00:55:57 +0200 (CEST)
Received: from localhost ([::1]:56464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcF4N-0005LJ-DE
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 18:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1U-00032F-51
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:52:56 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1S-0008HI-N4
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:52:55 -0400
Received: by mail-wr1-x431.google.com with SMTP id r10so37764529wra.12
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XBnfgWtJMOT8mPH1nfALqedm/L7Aa2ZlVIQfLmCDLhk=;
 b=IHWqW9qcdAF+qdq1BDK1lv8mXVsoZu69zPkgiaKdD9Xo1w0aqoqn3xMomEMjkEtiPM
 GUrjtENWTm7xveNQgOqGLXL8++r32u7KwVSGYdS+QZ/i99Od/0gm4g6KAtBXhn0SBUAz
 ba3eQPzDhiTDM73+xFbEr9Xy6bCZEUpEC0LtAVsXBlh1B5wnaOSbl23k3F69flB3bqjo
 8OZnZ34M+VMg8JyIZHjnrQCaYhs270ulUWyUquxAna/cNSEBQ6mi5ekFhHqmrsXWx89g
 BPu0CpBJTv2EJDSBFejX4FqtxJrZ2NzfXJ8bliQqD8APBJrIUKnkLp6OYaZ1g+4B97IN
 CNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XBnfgWtJMOT8mPH1nfALqedm/L7Aa2ZlVIQfLmCDLhk=;
 b=aeWsidSQrO91faN+cAPB/+6d2OE8/8LwfLl1oLUBv4cz61zuR8qv42TSCJMexJsyGT
 Enkh+TNMx3AwglNKQYRqP4W2iocXrevOcuqAc7CY3tu31DvlUeYn6hLvbjIr5z+JkRdV
 r2ZQ6kbYoTQ5kmwnHqcIDKmzzUKM1mITOexUEoRbcy3etHlT8nkREJLkO+/FTYrvcdG1
 /La9MsaxQ0hegnqSU70lzS7GflE3qxRuka4XHrt78+RTAMy1Kq2SRBO163bAEvJxPmLn
 raDhqTXDnmf6LkErpFK9mtagrnTSihPJok5Lc5MxGNLJ6B20jE8ERoeTMgMJBNgWOLb4
 4mEw==
X-Gm-Message-State: AOAM532iIUKcoWzdQBnhMmRgcaic5UMhkcoPgdTCicJjNpsmfkOxwnS0
 rbVjOL6CjVs9apJRXDYcDSEo/HMA+4k=
X-Google-Smtp-Source: ABdhPJwCxufwQs6gG61U+MsD5esm5pR2qMqMvXQFMHneqHI8qNDbQ/QisJP8RSnkSQh3npppcDC7XA==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr31492511wri.178.1634511172958; 
 Sun, 17 Oct 2021 15:52:52 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o23sm10946237wms.18.2021.10.17.15.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:52:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] target/mips: Check nanoMIPS DSP MULT[U] accumulator with
 Release 6
Date: Mon, 18 Oct 2021 00:52:29 +0200
Message-Id: <20211017225245.2618892-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "MIPS Architecture Extension: nanoMIPS32 DSP TRM" rev 0.04,
MULT and MULTU opcodes:

  The value of ac selects an accumulator numbered from 0 to 3.
  When ac=0, this refers to the original HI/LO register pair of the
  MIPS32 architecture.

  In Release 6 of the MIPS Architecture, accumulators are eliminated
  from MIPS32.

Ensure pre-Release 6 is restricted to HI/LO registers pair.

Fixes: 8b3698b2947 ("target/mips: Add emulation of DSP ASE for nanoMIPS - part 4")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/nanomips_translate.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index ccbcecad093..2c022a49f24 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -1868,6 +1868,9 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 TCGv_i32 t2 = tcg_temp_new_i32();
                 TCGv_i32 t3 = tcg_temp_new_i32();
 
+                if (acc || ctx->insn_flags & ISA_MIPS_R6) {
+                    check_dsp_r2(ctx);
+                }
                 gen_load_gpr(t0, rs);
                 gen_load_gpr(t1, rt);
                 tcg_gen_trunc_tl_i32(t2, t0);
@@ -1925,6 +1928,9 @@ static void gen_pool32axf_2_nanomips_insn(DisasContext *ctx, uint32_t opc,
                 TCGv_i32 t2 = tcg_temp_new_i32();
                 TCGv_i32 t3 = tcg_temp_new_i32();
 
+                if (acc || ctx->insn_flags & ISA_MIPS_R6) {
+                    check_dsp_r2(ctx);
+                }
                 gen_load_gpr(t0, rs);
                 gen_load_gpr(t1, rt);
                 tcg_gen_trunc_tl_i32(t2, t0);
-- 
2.31.1


