Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B5E42A9B5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:41:39 +0200 (CEST)
Received: from localhost ([::1]:38880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKqQ-0005ZG-Oh
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXg-0006UU-Q0
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:16 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maKXb-00046d-MP
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:22:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id 133so14339588pgb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=gLpjH35DtYy/LfwCVLYBXMGKwBcYM8FSfx9CGd58O4Q+QHYR8l9f8cGIqSd/8Kb/Fg
 oPlzeyOouRYgr7DhUmi+eYC/sI5uvj+OxTOGqcC/Kip3ISQVvAxe2dDQeWGyry6S3BAo
 ASiKOLvPDmk47cre3CObcs5IyVIS9AOF8wJtf8NpvD1+AAU3jZoC0vP5K4UavwY5ekDA
 LZfA6qlM0v8Ectv1Q9ru3iIlbtU/qK5tLKSqm/0kmuLAPVsG/l410lnmzrhCWOAGS7Ol
 1yI10WB09BNrphS5u17tBg4neRfVYlni7BEoqqwP+YchPjdV7d+TYD/dQWU2DzjEI/LG
 h1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RDO2b1TAF4ztgLUbPUMoAMU1yhwWU0vJ3YMD4i8Z5ck=;
 b=QVr3VCu3ffdhn1UNEGN5iMCjOCYCV+s8QutybvLZxuImBjo8wxIPwC9o9RWm+jQEYL
 DhB/sPV8Fn9pztYD4fUtC/fIUyIwFNZkubhmJ/Sf2SrRaKWRmMqt6VymYZa6E0b5EG5o
 HeTXjRsuSps6u+Q0GJbJCfNEaxgWIXM1mk3xTZdoSEagPufKQF7qI28iBuQO0yiknh9i
 c+xSREtS6hBeQU5VB94NkQDAe6GXsxiI9nvOrgB/uERBhwDKIYcdVJy5lIj4nYEckgaT
 zq3FtwRgkouOYvLQQmnz1RIZA+UHHkE1G+RDK3T0t9sKMfhATXeOXVEdOFsgf3pvk0uY
 cqCw==
X-Gm-Message-State: AOAM532oktTIT7LbExsLJYjYXY6W8oX4lFWa3AWztNEpTSxFS+VRx6mH
 LWSqZm14CagDnAEclKDj2t+Z1A/6NHWdrg==
X-Google-Smtp-Source: ABdhPJxcCjSb/K7PZFzGMEB7V4knrOKsxmY8hADOO5EiS8CCyIOVOivUujMdUQK5PRZLHwW1jlT7Fg==
X-Received: by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with SMTP id
 b136-20020a621b8e000000b0044c9318f6e1mr33197333pfb.84.1634055730308; 
 Tue, 12 Oct 2021 09:22:10 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k190sm11525023pfd.211.2021.10.12.09.22.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:22:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/23] target/microblaze: Drop checks for singlestep_enabled
Date: Tue, 12 Oct 2021 09:21:48 -0700
Message-Id: <20211012162159.471406-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012162159.471406-1-richard.henderson@linaro.org>
References: <20211012162159.471406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

GDB single-stepping is now handled generically.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 7e465b629a..437bbed6d6 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -126,12 +126,7 @@ static void gen_raise_hw_excp(DisasContext *dc, uint32_t esr_ec)
 
 static void gen_goto_tb(DisasContext *dc, int n, target_ulong dest)
 {
-    if (dc->base.singlestep_enabled) {
-        TCGv_i32 tmp = tcg_const_i32(EXCP_DEBUG);
-        tcg_gen_movi_i32(cpu_pc, dest);
-        gen_helper_raise_exception(cpu_env, tmp);
-        tcg_temp_free_i32(tmp);
-    } else if (translator_use_goto_tb(&dc->base, dest)) {
+    if (translator_use_goto_tb(&dc->base, dest)) {
         tcg_gen_goto_tb(n);
         tcg_gen_movi_i32(cpu_pc, dest);
         tcg_gen_exit_tb(dc->base.tb, n);
@@ -1807,12 +1802,7 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
         /* Indirect jump (or direct jump w/ goto_tb disabled) */
         tcg_gen_mov_i32(cpu_pc, cpu_btarget);
         tcg_gen_discard_i32(cpu_btarget);
-
-        if (unlikely(cs->singlestep_enabled)) {
-            gen_raise_exception(dc, EXCP_DEBUG);
-        } else {
-            tcg_gen_lookup_and_goto_ptr();
-        }
+        tcg_gen_lookup_and_goto_ptr();
         return;
 
     default:
-- 
2.25.1


