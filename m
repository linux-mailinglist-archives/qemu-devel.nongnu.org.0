Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CD13CF15B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 03:32:18 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ecL-000221-LY
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 21:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOy-0006uK-8Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:28 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:45027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5eOu-0003Xg-Ps
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 21:18:28 -0400
Received: by mail-pf1-x434.google.com with SMTP id p36so18212887pfw.11
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 18:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PNGGuAbGOXbZh1djyRYowe+1Bkitpoo3mG0dYZQDf8E=;
 b=LR4emvHi2lR32ttWc8zdgrfA86cwTqToo7HMrUffpK6YNOzk4WIP4JN60THVihEqHS
 LpwamsK5y5kNbK0Dh6pLjC9WxYpTArgJh5NP0R+nAyDb7ltYjGLjSF7P+T4uD9FUD0ML
 HlziEq4vkC9MoLfuRnLr0/Ip9TzC2RlVIWBQkP0kPvbRZkk4I5vjniRALPoIYXauW2qq
 PVwUAbBhL8O5yuT2SqjQSKyG5dlk6RH0bi4BZRtUr919En5lD3kWpKLasZxZq3PM8UGE
 cc7dpktT+3TiR+27LGwQV3Xc1s8MLJDDKPkme/0EyyvHK4Hy2y5R650GiDUUu0PeV08x
 C88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNGGuAbGOXbZh1djyRYowe+1Bkitpoo3mG0dYZQDf8E=;
 b=thiPsuykej90Iqam0B4hvmI7Ttxu2NFjG2RgjLMcMWwu9lj3oXoP3gq4c9eQ3iEQ+R
 xao354IrZ9huTlNR2H/0z0sXzuL2ppHyOme8UUzehLZotmblVM9LECh51D0/XF6Gd38y
 0vlegFqNNC6dNd9sFkdUVvOKjJlketxR3OFAyIkUkDWiOGLwlfS+NASUhC0S8RBg+b6V
 0PNcLqxMt1NI3TI/EjQ0aFtxB1vK24PFQK+3bhyJ0j+gr1Rq//jHTQaPoXpBQn2mupZC
 B7fXqrg+QQEbHzkBKiSvm4l6HUeHDy8X5jnlrHYwEEKn/nTeMRiiLyG+hrn3DLOkbZ4n
 moVg==
X-Gm-Message-State: AOAM531HHBuS/P8jV+PmLQbEmTe1ZDKwYF3nWAxdIISkeGjSDAjkupFF
 dr+OeN1PJWpTbpfacro06qn7fVjJ2VDvdA==
X-Google-Smtp-Source: ABdhPJzPxaiDYKA33GPqLAN2rENxY+nAh6tmB7t0tNbDlsSea3ArROFOWFAFDv+MBfFoL66x1JgfKQ==
X-Received: by 2002:a63:e350:: with SMTP id o16mr28267418pgj.98.1626743903636; 
 Mon, 19 Jul 2021 18:18:23 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25378054pgi.94.2021.07.19.18.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 18:18:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v5 14/15] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Mon, 19 Jul 2021 15:17:59 -1000
Message-Id: <20210720011800.483966-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720011800.483966-1-richard.henderson@linaro.org>
References: <20210720011800.483966-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 4f3728c278..b45337f3ba 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -50,6 +50,7 @@ bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
                      CPUState *cpu, TranslationBlock *tb, int max_insns)
 {
+    uint32_t cflags = tb_cflags(tb);
     bool plugin_enabled;
 
     /* Initialize DisasContext */
@@ -72,8 +73,7 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
-    plugin_enabled = plugin_gen_tb_start(cpu, tb,
-                                         tb_cflags(db->tb) & CF_MEMI_ONLY);
+    plugin_enabled = plugin_gen_tb_start(cpu, tb, cflags & CF_MEMI_ONLY);
 
     while (true) {
         db->num_insns++;
@@ -88,14 +88,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
            update db->pc_next and db->is_jmp to indicate what should be
            done next -- either exiting this loop or locate the start of
            the next instruction.  */
-        if (db->num_insns == db->max_insns
-            && (tb_cflags(db->tb) & CF_LAST_IO)) {
+        if (db->num_insns == db->max_insns && (cflags & CF_LAST_IO)) {
             /* Accept I/O on the last instruction.  */
             gen_io_start();
             ops->translate_insn(db, cpu);
         } else {
             /* we should only see CF_MEMI_ONLY for io_recompile */
-            tcg_debug_assert(!(tb_cflags(db->tb) & CF_MEMI_ONLY));
+            tcg_debug_assert(!(cflags & CF_MEMI_ONLY));
             ops->translate_insn(db, cpu);
         }
 
-- 
2.25.1


