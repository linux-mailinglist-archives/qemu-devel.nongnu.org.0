Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6253B88BE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 20:50:07 +0200 (CEST)
Received: from localhost ([::1]:48080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfHi-0006mF-Rt
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 14:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0l-00057X-2T
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:35 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyf0i-0001zX-Rg
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 14:32:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id a7so3214040pga.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 11:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwYP1FR59CBcY4SbMQQt/obAK3lfRhuxdMKBAeBeX6Y=;
 b=IQGFsnUezhZRccJzGFEYPeseANzTao5sqQZMZMtSRL/Qg+rcwtyOxcS3yNXAMG81Kc
 /ZSOasmj3d7h3DVxO3piWO/DuSnjXT9nJhMId92Gd6MM3fvHXjrU7cfit9QdjZ2Jb3Ju
 NOixqpmhIq6ELWkpWBCBkqy7wMCLla4vssrpdIE/s7zFd/YYeobDxBdODENY77iUi9FL
 bHDNw1E7oilsagI/y83GG612HQcPSM58HZZb79huE69SCPaiWJRIfJ6kYyUBLAV6IEGk
 4lApAil34P82PpiycU+99nnYqpSsClXpDThI4Q2B5BTrxhAzjY/jR8CeDlHg92fwMx8j
 7S7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VwYP1FR59CBcY4SbMQQt/obAK3lfRhuxdMKBAeBeX6Y=;
 b=NKRDDzc1IevFzfYyK6XjkFvk3WnkvV+JHhMIa4t92maNNOnaERyWiUFdtqi1IP8GdW
 i1uAlukhTvDcT2T58ftw8sPj6vaEomSM7kN+ikFVsmlcC1bn4zCmOGfF0Vif59o4ZJ91
 Pz5LeX1J6ySeim2ViVLDsK92aSQWmP3vL8mdV17UVtuYhNUdkMvIbTXyjioffKIsip6n
 mxEXTCg2oJSqyKz2uOBA7WfwasY/LW53GLUzDVaIio/mROG0SvZ/HX4CsCZcXs3xqrrs
 uTlWfp+rvjDr+MHAXshWb4uKftmQUwiykZB5arJmIdLRzDW67pUa2nkkS3FnXSuX2jMw
 ubFg==
X-Gm-Message-State: AOAM530/3lTIe6Yvg5xVgO2Iw/h5/VKH0bCPp2yw/AaENa2s1BWH0FG0
 4SAXYrmvFf3oEahWiUsDPk8Zk1Y8YYqYjA==
X-Google-Smtp-Source: ABdhPJw/6vn4rCO75Fs8m7uXDGI4ZtQjgood558fJitPWJpAvLIxWHOePHEPmT9f/9ZhG2h1HvWOQA==
X-Received: by 2002:a05:6a00:1496:b029:308:29bc:6d4d with SMTP id
 v22-20020a056a001496b029030829bc6d4dmr34939302pfu.14.1625077951532; 
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm23909517pff.88.2021.06.30.11.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:32:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] target/arm: Use translator_use_goto_tb for aarch64
Date: Wed, 30 Jun 2021 11:32:04 -0700
Message-Id: <20210630183226.3290849-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630183226.3290849-1-richard.henderson@linaro.org>
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have not needed to end a TB for I/O since ba3e7926691
("icount: clean up cpu_can_io at the entry to the block"),
and gdbstub singlestep is handled by the generic function.

Drop the unused 'n' argument to use_goto_tb.

Cc: qemu-arm@nongnu.org
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 1a40e49db7..eb1907d049 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -386,35 +386,20 @@ static void gen_step_complete_exception(DisasContext *s)
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


