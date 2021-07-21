Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD7E3D0955
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:02:20 +0200 (CEST)
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m66FH-0004Kl-8g
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vq-0005Bz-6W
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m65vo-0005Yt-JZ
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 02:42:13 -0400
Received: by mail-pf1-x430.google.com with SMTP id y4so1478250pfi.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 23:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=K170A+q0uF2SxDb8bwUFhGeVCad1b1WRSuX5MHPHonA=;
 b=z39AUgET2tOLJCD34NLoZGFg8x1tM8vfwS8C1XBWc9dNZZVVSS/nS+y71tW41ttjsz
 /bYs8jnIOI9A9JkYNuMDc37ydVyxO0ofMmD0fQqiUTnrUl9NGjfOmJCcuiMx93Nhd3Rv
 XazflA5bdhFJciyJrvRm+rF/TkkV1S5QujbtXMcyRQHoY2GzRyCQzzwTIw1tqAW39BdP
 O2hVun+wfpYz5WRqiYkzbgGATd+4/3mOSZEAwWShn7whMcqaGnurPULIedY1PIeVKkcG
 q78mNMsEjW7kofNAqyIvvCunKEQ324IIMqRFBH4Hdi8ka6yWdTBth4EaXO8uIbnLLqWf
 nxEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K170A+q0uF2SxDb8bwUFhGeVCad1b1WRSuX5MHPHonA=;
 b=rStkiMPVzl0sCwQAQsyC8V8CoFP/ya1e6VBOt3ltHiyCXm2mMWBw2in67d799IGWbI
 ZwfaLmvM+0qa6IZ5XAAM2GTFDEd0RqLhyImBDp6YmXI2U1/shq9HB/3/M4fVKUTtG5Po
 pqkbSpRbjatxcZNUcKB9wrUBaLwMqzws/Ik7VhnEYE8y5UPajLC+zo0AA1JaOkYA32oc
 UP8togeKQ3/ycXARZjjE2Ap6GD3FkoJixscLd9sNQj6sGc+LIXUynIK0qs0eQ533/mk6
 Z9xmD69tbG8gRB5GJCH6ykTtvpbEp5P2WF47kFV4+LOnpIWK+835KstdOICdQx4D6BaL
 NvFQ==
X-Gm-Message-State: AOAM531JN29lLX6tiAMDZGYvOVu1iNq+2+775xGRQzrOop5q67qasHZ6
 bA1A1aD6ycoDVFHDo9wEA3A4+2MeZpq2aA==
X-Google-Smtp-Source: ABdhPJypxb67ugrucAC4yEjagsAekEG1m40D/3OFFCptx55vZQfpYTfPqEqc3YGReDsW9EAVKEVZog==
X-Received: by 2002:a62:6c4:0:b029:324:8262:b3aa with SMTP id
 187-20020a6206c40000b02903248262b3aamr34553341pfg.25.1626849731132; 
 Tue, 20 Jul 2021 23:42:11 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id q17sm21146132pjd.42.2021.07.20.23.42.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 23:42:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 13/23] target/mips: Fix single stepping
Date: Tue, 20 Jul 2021 20:41:45 -1000
Message-Id: <20210721064155.645508-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721064155.645508-1-richard.henderson@linaro.org>
References: <20210721064155.645508-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

As per an ancient comment in mips_tr_translate_insn about the
expectations of gdb, when restarting the insn in a delay slot
we also re-execute the branch.  Which means that we are
expected to execute two insns in this case.

This has been broken since 8b86d6d2580, where we forced max_insns
to 1 while single-stepping.  This resulted in an exit from the
translator loop after the branch but before the delay slot is
translated.

Increase the max_insns to 2 for this case.  In addition, bypass
the end-of-page check, for when the branch itself ends the page.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/translate.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5b03545f09..4d1e08cfb1 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16162,6 +16162,16 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->default_tcg_memop_mask = (ctx->insn_flags & (ISA_MIPS_R6 |
                                   INSN_LOONGSON3A)) ? MO_UNALN : MO_ALIGN;
 
+    /*
+     * Execute a branch and its delay slot as a single instruction.
+     * This is what GDB expects and is consistent with what the
+     * hardware does (e.g. if a delay slot instruction faults, the
+     * reported PC is the PC of the branch).
+     */
+    if (ctx->base.singlestep_enabled && (ctx->hflags & MIPS_HFLAG_BMASK)) {
+        ctx->base.max_insns = 2;
+    }
+
     LOG_DISAS("\ntb %p idx %d hflags %04x\n", ctx->base.tb, ctx->mem_idx,
               ctx->hflags);
 }
@@ -16231,17 +16241,14 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (ctx->base.is_jmp != DISAS_NEXT) {
         return;
     }
+
     /*
-     * Execute a branch and its delay slot as a single instruction.
-     * This is what GDB expects and is consistent with what the
-     * hardware does (e.g. if a delay slot instruction faults, the
-     * reported PC is the PC of the branch).
+     * End the TB on (most) page crossings.
+     * See mips_tr_init_disas_context about single-stepping a branch
+     * together with its delay slot.
      */
-    if (ctx->base.singlestep_enabled &&
-        (ctx->hflags & MIPS_HFLAG_BMASK) == 0) {
-        ctx->base.is_jmp = DISAS_TOO_MANY;
-    }
-    if (ctx->base.pc_next - ctx->page_start >= TARGET_PAGE_SIZE) {
+    if (ctx->base.pc_next - ctx->page_start >= TARGET_PAGE_SIZE
+        && !ctx->base.singlestep_enabled) {
         ctx->base.is_jmp = DISAS_TOO_MANY;
     }
 }
-- 
2.25.1


