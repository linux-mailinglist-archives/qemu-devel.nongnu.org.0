Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660C66A6609
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:59:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCex-0000z4-1A; Tue, 28 Feb 2023 21:57:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCef-00009F-F7
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:22 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCed-00034o-9c
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:57:21 -0500
Received: by mail-pl1-x636.google.com with SMTP id h8so9259401plf.10
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YLMhRL+VKzghwsgiVOCDhXwrJtiAvjwVpEoUP/CDxSY=;
 b=CnJ+qJ6A1htjkpwAPOyz8j/TGAiNB7tMLhhGGOgu7qtpi3ocd+WA4kc7HDkds0u2/5
 LvNpqkJx3zSw5RXgkFY8gtN/QQyV0MBn63+4acsJSo5wHz7glFEKb79DpwVRQOsNHZbu
 cHnbwY4MbeG0a3iRWtHfBKIXwiTIaNCQVIGq44F7bASJFN9KKETdSJVmmWAza573PMlj
 Gt9XpXvkURIQ+/crtkw5yYu1kJ7ZpWX+RhGNDrpv8SwuDwg3NVBrNIxeg47OelBfpD8P
 sxRysX1yUk83iPYFY+CS5ZHZ5DH9CYNIBUySVc0vDs733C0t5w73bOjPkgm2gxar/ua3
 Ebkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YLMhRL+VKzghwsgiVOCDhXwrJtiAvjwVpEoUP/CDxSY=;
 b=B+X+YdUZHf69NYWLfl55hSE10qGbRBGnui7XtXd8uGH9Ed3aoi6EQ4plO5FJjOjwzD
 /C39FUvhBTh+PzRWt2UOfm6J1S8m/gKWwSLnKINmpqH279+VA+tG0H3YHL5o//9L1L5A
 Jt7OAgMGDIUZ8hSIauB5rgsmCsuBgUeUbTQeQGZECabaE3X3O3ON2ZSGjtpPbHjdaS1D
 +MVZBv+xHDWf+gdD7CWoOuEc8T9+H3PrCTPGU4ihsQ7qLVkcC9guUjaXLwh9nGqyshBj
 1XHHtjGJPPsfBHpBgxPih62L9lGvM0X8q9mcNfeUH147hUUm/C3dg262bkN9JH2zYXso
 q4fw==
X-Gm-Message-State: AO0yUKUtr+aP9HzHqoo+Q4GnrROabMdCi/oq1SaUevtlZAkD8LxQ9uM9
 7XZRoAoQk+aV6XH/MiGiiE4m+cgrd9ec9+2BYz0=
X-Google-Smtp-Source: AK7set9GK27tW6b7200HE2tfNshw1NEy3CEnIh5k5eRF6T6ZkQZXgyvsfkO/jwKuMAMitC+nT9NqYA==
X-Received: by 2002:a17:902:c941:b0:196:5787:d73a with SMTP id
 i1-20020a170902c94100b001965787d73amr5957403pla.53.1677639438548; 
 Tue, 28 Feb 2023 18:57:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:57:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 19/62] target/sh4: Replace `tb_pc()` with `tb->pc`
Date: Tue, 28 Feb 2023 16:56:00 -1000
Message-Id: <20230301025643.1227244-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230227135202.9710-16-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sh4/cpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index f0934b20fa..61769ffdfa 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -26,6 +26,7 @@
 #include "migration/vmstate.h"
 #include "exec/exec-all.h"
 #include "fpu/softfloat-helpers.h"
+#include "tcg/tcg.h"
 
 static void superh_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -46,7 +47,8 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
 {
     SuperHCPU *cpu = SUPERH_CPU(cs);
 
-    cpu->env.pc = tb_pc(tb);
+    tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
+    cpu->env.pc = tb->pc;
     cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
 }
 
@@ -73,7 +75,7 @@ static bool superh_io_recompile_replay_branch(CPUState *cs,
     CPUSH4State *env = &cpu->env;
 
     if ((env->flags & (TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND))
-        && env->pc != tb_pc(tb)) {
+        && !(cs->tcg_cflags & CF_PCREL) && env->pc != tb->pc) {
         env->pc -= 2;
         env->flags &= ~(TB_FLAG_DELAY_SLOT | TB_FLAG_DELAY_SLOT_COND);
         return true;
-- 
2.34.1


