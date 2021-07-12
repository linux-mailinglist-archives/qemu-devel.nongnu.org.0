Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9970F3C5FAB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:46:30 +0200 (CEST)
Received: from localhost ([::1]:50624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2y8b-00081u-Mw
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2h-0003zk-T2
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:24 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:42856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2y2W-0000wE-GR
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:40:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id y4so16728946pfi.9
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DeiOM3E/by38ksgPe4YGpd7ba5mJVtkTjbeFMUwSxAA=;
 b=Pq3D1OvrKTBqjAD/YmlAA29Ge5Jg9V7ZKn8Ms3UqMLd3d8X/o8FdHrQZLzO4AskQlh
 ZOPPuFNQKU2iM7dMEL6JiFK4NI0wwDoAmfZn3wh0sBuq0RPLJ8KvbB8Il5nRzA4Slwhb
 SRGbkQzSmoxq9qqU1xaCPpD+dVkYdKoKFFV7th4HZLe7J6nuIQLoXZ24DxtVliZ7yoUV
 pd+3kT3NxGCq4bW3zfKa11oG1oh5dXmSdW9SHERrZcmgASz/dCR5msGuiZw4irUrn5Ts
 2kos5J/SUeyUjAvDDDvVWKUvIZYTAHUtvKZp1VcGQh1uaZHYAQl1pIVOVWAJ8VteKid9
 bdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DeiOM3E/by38ksgPe4YGpd7ba5mJVtkTjbeFMUwSxAA=;
 b=KRnJ/k5xTGOilebbFUeoP0FBUYswWlgNVjk/omIkq/XwOR+pZ3ncCVrGk804qY9CIU
 wCMeCKhc+xGSGQBFH2MfGunhdwz6c2oKu8YCxOYoi+tiYsuBqJoXqZrTj6gIj/RDxp0K
 yBR4qpEzX572zKErjtyWRwV55VHUe9kX+ykPP99I4ti2foqvjZ+T3O5d5CqrcQirjbTG
 3s6rNbV6DySVhv10fksKUlNTsr5OyIMzCM7cGnU6cK6n4d3iE3jaRzseZRJMb9+Eg/+s
 Vb1ETF1Ws6ubhJ4DlrbpyLdzkSDC7ijNZidCiGUXTSH8Ky2FrbyI3BLy1vmyhxYT75+Y
 5H1Q==
X-Gm-Message-State: AOAM533OBlNcyMVu9rLkJZhdl4Rt1iz9hAUqNMT0uOaDJhqof4KtZRCn
 x0x1mPYd9thHwPzPi1W9kvS3LoJtkU5l2A==
X-Google-Smtp-Source: ABdhPJwUHOLTPlwWnUYch5uK5KJxH9bKd5fSMXhjDHpFfMCRWuFDgm0bANkr8GKf2FEVF/LG27a1rg==
X-Received: by 2002:a63:da04:: with SMTP id c4mr53966446pgh.348.1626104410850; 
 Mon, 12 Jul 2021 08:40:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b33sm18247635pgb.92.2021.07.12.08.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:40:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/10] accel/tcg: Hoist tb_cflags to a local in
 translator_loop
Date: Mon, 12 Jul 2021 08:40:03 -0700
Message-Id: <20210712154004.1410832-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712154004.1410832-1-richard.henderson@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The access internal to tb_cflags() is atomic.
Avoid re-reading it as such for the multiple uses.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translator.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 1c44d096d8..449159a27c 100644
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
@@ -125,14 +125,13 @@ void translator_loop(const TranslatorOps *ops, DisasContextBase *db,
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


