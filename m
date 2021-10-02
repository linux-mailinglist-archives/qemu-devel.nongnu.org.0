Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B2941FEA8
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 01:34:07 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWoW6-00028n-VD
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 19:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoTC-0006zd-5M
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:06 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWoT9-0003FD-DS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 19:31:05 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e12so1866903wra.4
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x2u29mcCg9qLO7Eb+7HUeeSmQjTzAIKPzQVYsojV4k4=;
 b=AqJddUPZPnD+gi6tXg5QtJ2V0UYVhgkKx5mxGElkXGyzUUYRnJhYCV0STE9Z+pZ/yp
 EFv3MN1XmmNgcpwDFCskWkZm+U9cefLo0QWGd3k/U9ngC0228Mh1UfdjZ7VowVbvkHoE
 n0YFklr3F5e65vwSwo8kgOzLhLbe/9JGEbdYxmLfc2uflKCs/Te62MceQqr6j0WKCQZO
 2MadlweHzoJ4D/x3aVyRHkTblckQtjSwexp8OUfAsQn8lgzbH86D8Nq05cTdt+SB3mm4
 R+RYFC/m+VuqaIcphHry85bvoannXaOUP3I6txLe4S2jUu58pjdPDs0JSUmIy5H7wlnB
 swuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x2u29mcCg9qLO7Eb+7HUeeSmQjTzAIKPzQVYsojV4k4=;
 b=ixkzd2bDsEQPRWpy4Ue5CFhfBNxMTP0Or3X2BnpCIGOcnSII9nCXYsTykOfPiDtYWi
 a+yquqSYM2NLIIBQ7TSlBgiC69a+ddjg3VLFjzB3nchrzoA6D3k2HJdWDIxgeDjAxe6b
 pF4t9LKhunPi0Ulgwm3D+DcYirR7AiGxsByObzdIGUQSAvesRK0U/6PGzvvh2xc3FWiR
 WmUJUYejhtgrgeievplVCcrTicSsLM6r2aeKkLf/TBGwVIylPZV5F9Z8+JFWezsw8gGX
 cQTp9swwz4M//J4YYr35JR7Hs2A8Q/FAqiwy29MRomiC9zcOUQjSPC+njRfHKDr+qeWM
 0Xtw==
X-Gm-Message-State: AOAM531ORmWqkcSQD09CBYEBPpYf5DdSzI2Zgj8MtPFdLetp4l4/BkWw
 sivBFoSR6fdYJzGEBgc/9CB2FzGaGjI=
X-Google-Smtp-Source: ABdhPJw2/PoZf/vkWT6KXRvqydARe8tx6Ziija4hWn//v6nE4Hffp6S3TaeDvZlIUk6MneSSVPv2ow==
X-Received: by 2002:adf:e788:: with SMTP id n8mr5383231wrm.431.1633217461859; 
 Sat, 02 Oct 2021 16:31:01 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 t12sm6837273wrw.12.2021.10.02.16.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:31:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/nios2: Replace load_zero() by zero constant in
 DisasContext
Date: Sun,  3 Oct 2021 01:30:52 +0200
Message-Id: <20211002233054.3575646-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002233054.3575646-1-f4bug@amsat.org>
References: <20211002233054.3575646-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using a temporary for $zero, keep a reference to the
constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/nios2/translate.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 08d7ac53983..c398c5320fb 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -122,20 +122,12 @@ static uint8_t get_opxcode(uint32_t code)
     return instr.opx;
 }
 
-static TCGv load_zero(DisasContext *dc)
-{
-    if (!dc->zero) {
-        dc->zero = tcg_const_i32(0);
-    }
-    return dc->zero;
-}
-
 static TCGv load_gpr(DisasContext *dc, uint8_t reg)
 {
     if (likely(reg != R_ZERO)) {
         return cpu_R[reg];
     } else {
-        return load_zero(dc);
+        return dc->zero;
     }
 }
 
@@ -752,6 +744,7 @@ static void nios2_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     int page_insns;
 
     dc->mem_idx = cpu_mmu_index(env, false);
+    dc->zero = tcg_constant_i32(0);
 
     /* Bound the number of insns to execute to those left on the page.  */
     page_insns = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
@@ -797,14 +790,8 @@ static void nios2_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
         return;
     }
 
-    dc->zero = NULL;
-
     instr = &i_type_instructions[op];
     instr->handler(dc, code, instr->flags);
-
-    if (dc->zero) {
-        tcg_temp_free(dc->zero);
-    }
 }
 
 static void nios2_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
-- 
2.31.1


