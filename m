Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96263D17DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:18:55 +0200 (CEST)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IgA-0002Um-Lv
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOT-00031l-29
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:38 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOP-00063H-Te
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id b12so1632118plh.10
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uv4KyE46xKGLObtihhZF89wcjkrGbag40+YXKQhFASw=;
 b=BIMXz1jcOrQdmm20Z+9NcGCm1SFpdh7U9wkW2CnrQqbc78BmY9FG3wBhOEkRhJGgT6
 9MjLZB71afSqzl4D8Hufbfq3Av9WV7R7ilWicDrKNJXiJ6cJW5yhSLL45FYq/oO+Sxm3
 vwagNiWMLicR4cfg3rHeLido0HKzRi+z1Dx/bbo7SjFCE7Yj5kEz+31fc/EgZRf05Gv4
 oh0lMOknlu+0H2DaefTLwnIDLs2F8oNWcHuIRyWlXnRCzwucW7Iz86kHmQVUTopA+Tkt
 rdAIxHYt4nAtMnN3LjsF9kj5G86pGlZ4lohsLz7SlYBdBoIasmBNmKhv8KsVKEzwphFB
 O1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uv4KyE46xKGLObtihhZF89wcjkrGbag40+YXKQhFASw=;
 b=JdxvxI5QPtIycFXDh5sC7Zd1iFzJ71z+SXXnxEQidxMUGFvhMjItSbAsK+OhKHrNhS
 gB7txJ+Ci/zWON+eS2iQcOU6toPq1jlCYk20CY5T/ePObdzbZQvOgtMato3VeB7HCzou
 V+4zHKbv7sIToX8Bx09gu3WcDuMzgsLWCCCxzFd6s6BEGAc3sJC5z7JU4jEjHJgg2ZHJ
 iBUIWVSg69QXuDeAUGh84vHU3sFoIOEQ2A697Hz0WUH0ZUzkKRi/Zo/Oirwyep3kzTJB
 o/vLmmPYkuSdedBEgAkbNtkHjz5axAmfgpNZwAbRM0tQfi2bc+MFsK8OhD67IcYSDVML
 Hkpw==
X-Gm-Message-State: AOAM533qW8fwo20vbTGsg5HCK/mvj/DUiKOpMLr8xEXCmyTKSEIe+sZ8
 c6EzOTkhFuUtoBK52vg2lpOhGK9LpIGJRw==
X-Google-Smtp-Source: ABdhPJxTPjEqg9yJZXijPcq654r0jv5ndtg2PNpBgEVHnXc97nWNUW898X95Y2RfD0W+zYST4v09Ow==
X-Received: by 2002:a17:902:c215:b029:12b:25f7:9b11 with SMTP id
 21-20020a170902c215b029012b25f79b11mr28920379pll.82.1626897632527; 
 Wed, 21 Jul 2021 13:00:32 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/27] accel/tcg: Hoist tb_cflags to a local in translator_loop
Date: Wed, 21 Jul 2021 09:59:53 -1000
Message-Id: <20210721195954.879535-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


