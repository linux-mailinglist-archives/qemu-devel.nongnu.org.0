Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD63D0948
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 08:57:56 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66B1-0005xe-IT
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 02:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vv-0005DF-PJ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vt-0005dj-Hf
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:19 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x16so486834plg.3
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=D65+qbhBiQEHG5+8gyKCqsFmt2IVIgoiw1iwwfSXJMo=;
 b=tdd5AaxEGZ+CQZo5mjK5HAWpVuzuXgq2WwKfiM/XofK5sqLA529OnQQ/ZKp/4tgLvx
 hXkAwoqNhv3nG598go24w/CCu0JE/cr25z/Us9enfVPbo+FXAcVaeYkHi2a6JIRAN8yi
 g0FcgEEu4vB+CFlSr6zcxsUtjT7YfRI+OWzranrnfcAhRtthTm4UN9pI7oW87194i6eO
 ee0MYsTrKJyPI1Hl2y6Edzina20LFiNS4JOYQmMo4hYwDAJuk91HcQztwdN+hG0zmD/G
 717i+l7ImwX1zEpFo8DdUkBzwY64cT8p3trtZGCZ44A7iIc4clZa9natfkLjImWzi9aQ
 aNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D65+qbhBiQEHG5+8gyKCqsFmt2IVIgoiw1iwwfSXJMo=;
 b=MW4oITTxvspTZ54qDDMoHu7G3tDGnL7lWcooALoTy0mVDux4qoOE83++Vxv1xRHOib
 QSVBIEzLufnARR56sPZWX6fgxPI0Bti4t4oYgkE/wD7w/RC0xrLNXY86F9d1FO6YS3Ov
 ARJ0ULapAk5Vtlfd5t3VUBTP72OQUGy9fYHmU3S633NSd7nuDpZ73d3buNhOgGQfyaR3
 EAEwjdHlqacuLzXz5SM/ZzUw60hoLnsF8XdrJLH8ZFamkI7aYsXSQ8jz03bFQTbaAD1N
 aMpUR0pPRHGhwbedCp5qo/eMAacpQ+j2bqeQqLIFtfuloh64msEOeA9SivuY3mCLAmB7
 OS1g==
X-Gm-Message-State: AOAM532GACq8IKyDKkzVbbn7fOqG/H3mqbERWj8wajiKOkyqtDzYVyY4
 gPtV6Xo4eJOCF8meKBWQnv0LUiPM6HyDTg==
X-Google-Smtp-Source: ABdhPJz0LimapE0+RgfCR5fLszno9gRd4CzkC6H5oStlMcEqMcn2j7Wxb1thdMHmbRhhAVulwy4bCQ==
X-Received: by 2002:a17:902:7c81:b029:12b:6ac2:3ad9 with SMTP id
 y1-20020a1709027c81b029012b6ac23ad9mr20187364pll.76.1626849735170; 
 Tue, 20 Jul 2021 23:42:15 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 17/23] target/riscv: Remove dead code after exception
Date: Tue, 20 Jul 2021 20:41:49 -1000
Message-Id: <20210721064155.645508-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have already set DISAS_NORETURN in generate_exception,
which makes the exit_tb unreachable.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_privileged.c.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
index 32312be202..a7afcb15ce 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -22,8 +22,6 @@ static bool trans_ecall(DisasContext *ctx, arg_ecall *a)
 {
     /* always generates U-level ECALL, fixed in do_interrupt handler */
     generate_exception(ctx, RISCV_EXCP_U_ECALL);
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
@@ -60,13 +58,11 @@ static bool trans_ebreak(DisasContext *ctx, arg_ebreak *a)
         post   = opcode_at(&ctx->base, post_addr);
     }
 
-    if  (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
+    if (pre == 0x01f01013 && ebreak == 0x00100073 && post == 0x40705013) {
         generate_exception(ctx, RISCV_EXCP_SEMIHOST);
     } else {
         generate_exception(ctx, RISCV_EXCP_BREAKPOINT);
     }
-    exit_tb(ctx); /* no chaining */
-    ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
 
-- 
2.25.1


