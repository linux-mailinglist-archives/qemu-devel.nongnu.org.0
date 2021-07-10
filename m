Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2353C353F
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:42:09 +0200 (CEST)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F7I-0005TN-BE
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:42:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExP-0005BX-LR
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:55 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2ExN-0002Gi-Vk
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:31:55 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 h1-20020a17090a3d01b0290172d33bb8bcso10004605pjc.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z7Ncc5FKGICE8G9HC6MS3YW5C1jF/+Zh1RQa1f4ley4=;
 b=RANhMiECF+dWk8ZxPygJ3eH8FcPHjhQs4bxuO0AIacN1f4Ob2fJhnJR2grxc3AU481
 YZ73zCRUZFs77t9c3v4b1fUgjjEErmvsc/94aRoi6usnw8MAx5hVtnANz7lrAIiiq6Wr
 TqzHBFkqfSRkremeALMCusyS+pV/N/4vyZ2NouzMluzZzExLyAF6V5tOKugWYs+Ux5TW
 0sCBG87oslx+cStwycTxkIBT5XJwbrNiOQiLuN+JPK5fI5l2ffJJDL4E6KwWavIztVRC
 uXwE0n/cJzbKcaxESVjb4reBFWiFzi8NI/06U8PSccT7zrPMdtktL7Dy98X59dnUC7dU
 ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7Ncc5FKGICE8G9HC6MS3YW5C1jF/+Zh1RQa1f4ley4=;
 b=owO1HZ4Xnr9elArExQ08j3jMQDzGMGynC9X3xQXUBCtk5RBRPvao0lDxxRvZKvHOx6
 kI277EjU8ccuNYT7KBGNmZtV6AYq0DqK22z+KEG1x6jWvV6o4nB+/RQ5TnqyXUz5eazW
 WgLdzOLEEHo5yOiS4l74umTOWl5Y/dH9dQjg7M/v6AqFr6LFSwtBy51ume86H16ws9+m
 4UOLSozb0EmRRo/4+wRBUEkzvv6e1HCI4ejn5WX4StTfTDADsJLkbX+bncmtuvoavjp+
 sv9L4txgURVjDBv9evcZpsNGvEvWouw3c4nIGJQNTcu96jAMo35MEPz+bY9KRscS57Gz
 2WIQ==
X-Gm-Message-State: AOAM533IqeOI2pBbcE4ROyecKxglH95CqFTkQfNLM5JKRi/M001VICKK
 NfgsnLWZq+VgFJSPQ/Tl7/I/uF8B3GlePQ==
X-Google-Smtp-Source: ABdhPJzyU+YTzYfn9zomUymO04eViNqarW/nnBX40G3XizTsNWaL4pmDqy0fX9e/DMLgH9MgfKe+nw==
X-Received: by 2002:a17:90a:928c:: with SMTP id
 n12mr43274630pjo.30.1625931112705; 
 Sat, 10 Jul 2021 08:31:52 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id u23sm11975374pgk.38.2021.07.10.08.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:31:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/41] target/arm: Use translator_use_goto_tb for aarch64
Date: Sat, 10 Jul 2021 08:31:13 -0700
Message-Id: <20210710153143.1320521-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block"),
and gdbstub singlestep is handled by the generic function.

Drop the unused 'n' argument to use_goto_tb.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a6dd9ec701..ca11a5fecd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -385,35 +385,20 @@ static void gen_step_complete_exception(DisasContext *s)
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-static inline bool use_goto_tb(DisasContext *s, int n, uint64_t dest)
+static inline bool use_goto_tb(DisasContext *s, uint64_t dest)
 {
-    /* No direct tb linking with singlestep (either QEMU's or the ARM
-     * debug architecture kind) or deterministic io
-     */
-    if (s->base.singlestep_enabled || s->ss_active ||
-        (tb_cflags(s->base.tb) & CF_LAST_IO)) {
+    if (s->ss_active) {
         return false;
     }
-
-#ifndef CONFIG_USER_ONLY
-    /* Only link tbs from inside the same guest page */
-    if ((s->base.tb->pc & TARGET_PAGE_MASK) != (dest & TARGET_PAGE_MASK)) {
-        return false;
-    }
-#endif
-
-    return true;
+    return translator_use_goto_tb(&s->base, dest);
 }
 
 static inline void gen_goto_tb(DisasContext *s, int n, uint64_t dest)
 {
-    const TranslationBlock *tb;
-
-    tb = s->base.tb;
-    if (use_goto_tb(s, n, dest)) {
+    if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_a64_set_pc_im(dest);
-        tcg_gen_exit_tb(tb, n);
+        tcg_gen_exit_tb(s->base.tb, n);
         s->base.is_jmp = DISAS_NORETURN;
     } else {
         gen_a64_set_pc_im(dest);
-- 
2.25.1


