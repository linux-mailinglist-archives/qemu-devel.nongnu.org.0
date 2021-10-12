Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE742A974
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:31:04 +0200 (CEST)
Received: from localhost ([::1]:39810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKgB-0003gP-F5
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXf-0006Rf-82
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:15 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXc-000474-CQ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:14 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ls18-20020a17090b351200b001a00250584aso2266624pjb.4
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9ywY9ZTgvf8lxwlmdR3Zdf9KRJMgcNgLbM1CBd+n8PA=;
 b=JbvjLToTKiz2p7vMrDPT97RbJmCRXr4aRU7iwvw9Ib9MlphA4ozmDIf3lbzSB8OEfc
 qQa+7QhlFAqY4G8DeBL8NSm4xLxAteTMfwZEMYkwgxY4tTkYgr+UcCPY0KmNeaisFRbW
 vy7sC2+cfItbduBNhSlDzoXqyDV7ME/0R2mpigQwTyDX/NqfJKnpqjA4cDqMFp4XdfEa
 2i7L8WwkP4hvVihUL2SwKM9FGmD+roDCsYLoQTp4ELSqYTucpdvyjqyambzUcSAoH12o
 JK4qO388uf0bdbAnfcOM6ffL/Vby0oBlOqwsUVRIxemQEQHgdtqgqEgVOREP7qWp4Bxb
 XHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ywY9ZTgvf8lxwlmdR3Zdf9KRJMgcNgLbM1CBd+n8PA=;
 b=Jkd++meYWnzRmBq7jSkXt16STtf07Gs35L7DTJ0U3N3dCVjLxA3r+z6QG5EgGRfX2t
 CgQKj/bYs0JLav//JPWRA0jT8hhnG7zQimkQoHXMdSwftuot9yML/Nsmh2sIP/xOkOZE
 lXMWGSMXC5csIXqVS8Q2yh+J6RqvGofSF8FDDV/U949SCP148yH/QlEwNym6r5UB2FZx
 OgGiLL+dkbk+YJMfo7sXd5nhgyC9/7Cy/EfWRrjFmisldNI4Oad/yfXuGtkWOuxm/cba
 SMTwjPwGdL9rVSnaYSx+9zbPn19DwOF0QzbVAXy51ZXB6qjEXBTR9qfksca69VqY6EV9
 AqNQ==
X-Gm-Message-State: AOAM533+wi4ccqKIyCs1sdptyv+jZYDomkjujZeI4SZna5hVXId5z7r0
 SeB+BJZHwZEmHaSoHSFFCmekiqEwYXMZvQ==
X-Google-Smtp-Source: ABdhPJyIdMeOgTGbFUgORuvIZlpXo7Rh8pvEiCZdO2xF2Tz9TGyHa2e0OjlKV3vbafBtV7qrLRJ03Q==
X-Received: by 2002:a17:902:ea0a:b0:13e:8b24:b94 with SMTP id
 s10-20020a170902ea0a00b0013e8b240b94mr30947579plg.45.1634055730906; 
 Tue, 12 Oct 2021 09:22:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] target/mips: Fix single stepping
Date: Tue, 12 Oct 2021 09:21:49 -0700
Message-Id: <20211012162159.471406-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
index 148afec9dc..f239f9ffc0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -16016,6 +16016,16 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
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
@@ -16085,17 +16095,14 @@ static void mips_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
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


