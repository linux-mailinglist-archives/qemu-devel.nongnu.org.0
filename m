Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC560D939
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 04:22:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onVuo-0005XO-AJ; Tue, 25 Oct 2022 22:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVum-0005V7-Qa
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:08 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onVul-0001Jt-4z
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 22:13:08 -0400
Received: by mail-pl1-x62d.google.com with SMTP id g24so7690204plq.3
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 19:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Lt8PtTep8NzHGKaIk0wg/EMVOUzJ5wtCQJDLoHf3Hs=;
 b=dMM2CsL2Yvud7UgYR7njM6XmBTfdGw/Qk/nq2iZAf4ra4IXLNSeDSbOKsogRRZ8C5T
 8nTcKPfXYgrcVf02kz9P7Ew09JzqW3tjkFuax5ngN2xusMGF9mFnWKeNY46xQVaMOeMc
 18rDIHO6oI//wclWyD55EeVQ6EbvVLwtW/Q2AgFpoLuRcPt+xkjMLVZTKkhTNOz4pgkf
 bEXZcp8y4AQTy4ODJGMQydu8w0tissCLw44YN2ZyE0BbOrEWQU6z3G2fFFMxyXTY1/56
 0WpJcR4+8lyr+SJfWUdZLZphjsAiA86zIloVtaCBidXqEEtFOSIZbUyKlRHyV3lrOzm8
 UjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Lt8PtTep8NzHGKaIk0wg/EMVOUzJ5wtCQJDLoHf3Hs=;
 b=erro36GJUJVWdJsTl9mh+yuUMNP/VRYbmeMm01QohjFkJGX0uiD9YHoWWVuP+ARiQr
 H8i0XAu2tLT5KAzKKEDlxBFkswjoAS1b6hWllxVRsW9a9Y5CEvqTP38TG5NS4+qQQXe6
 h8clgpNxNE3nYAwVhtjjik9zH/t0Q9DDbfD3qgK0JOEa0F7sw4gT00e11vM1/91f/0qO
 clpozPUX2fJ79CAp9khETMrSSCB4ruHI1HmEO3MAAaBb3H0UyvwYDdw7YIUY6dtJaRjR
 2aKih0MLiIdjsbq+zvHbrBDzpHmbyoqX9ZdFzZlVbEDhSVxLRS5mZF6FY8ENJKzzi9OZ
 0n+Q==
X-Gm-Message-State: ACrzQf2LLS2CMb7du4oeBB2SPIkf9Iej76X8C05DN4kfsjKMFT8IahQR
 yQpYaOa9Mx8GVLpWS6hkE0OVdTs5/04StbI8
X-Google-Smtp-Source: AMsMyM6+NJnlMskxdG3L+TvK3eClHocnaY7IHmrv4G8zJYENPcl+07z4/OfMeR3zRPvJhZOV9tsWAA==
X-Received: by 2002:a17:902:ea06:b0:185:3d64:8d55 with SMTP id
 s6-20020a170902ea0600b001853d648d55mr40855886plg.7.1666750385766; 
 Tue, 25 Oct 2022 19:13:05 -0700 (PDT)
Received: from stoup.hotspotlogin.services ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a635d5d000000b0043c9da02729sm1897833pgm.6.2022.10.25.19.13.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 19:13:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 37/47] target/nios2: Convert to tcg_ops restore_state_to_opc
Date: Wed, 26 Oct 2022 12:11:06 +1000
Message-Id: <20221026021116.1988449-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221026021116.1988449-1-richard.henderson@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c       | 11 +++++++++++
 target/nios2/translate.c |  6 ------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 2b28429c08..9a5351bc81 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -42,6 +42,16 @@ static vaddr nios2_cpu_get_pc(CPUState *cs)
     return env->pc;
 }
 
+static void nios2_restore_state_to_opc(CPUState *cs,
+                                       const TranslationBlock *tb,
+                                       const uint64_t *data)
+{
+    Nios2CPU *cpu = NIOS2_CPU(cs);
+    CPUNios2State *env = &cpu->env;
+
+    env->pc = data[0];
+}
+
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
@@ -346,6 +356,7 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
+    .restore_state_to_opc = nios2_restore_state_to_opc,
 
 #ifndef CONFIG_USER_ONLY
     .tlb_fill = nios2_cpu_tlb_fill,
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 8dc0a32c6c..4db8b47744 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -1110,9 +1110,3 @@ void nios2_tcg_init(void)
     cpu_pc = tcg_global_mem_new(cpu_env,
                                 offsetof(CPUNios2State, pc), "pc");
 }
-
-void restore_state_to_opc(CPUNios2State *env, TranslationBlock *tb,
-                          target_ulong *data)
-{
-    env->pc = data[0];
-}
-- 
2.34.1


