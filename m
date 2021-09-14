Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24E40A22E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:50:45 +0200 (CEST)
Received: from localhost ([::1]:60624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwep-0007Ki-TP
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6T-0001kn-Od
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6P-0007fu-5w
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:13 -0400
Received: by mail-pl1-x635.google.com with SMTP id n4so6966080plh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fdyym3tRuWcxUVb7GR3eybl5FQ5L8A5RDTBUJNCEnuc=;
 b=sI3hEkGkSsGLjDX+cmNzinBv882Rl1uTMPZR+pqyyHrBofuuv6n7oPOM/9Zhnem5dY
 TtOJgGotR1wgftiI9t2+SE3p4MOctAemeZYwjZJSOeGiwBZsw2gm9vdbmJaSNWVZYT09
 Nt4/rMCMtXf2za2Lo44Eu11sHoGv0jyc14ALOzCqjI2IjgnpnkMDez7F0+fM8Q9FVRSB
 6x5cP3TkVFDlDGZmpvP2Qug2qE63842qeSajpuxMluwIUnpltULkzeP5ToWMM/EYKMly
 KvUBNGV+LpVjgexZzYfuIY2ymBx3XeMqlhWClg8DnirCVM8AFhesHHmyMN7lstvycGv0
 xD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fdyym3tRuWcxUVb7GR3eybl5FQ5L8A5RDTBUJNCEnuc=;
 b=xMGqv3oNdfcoWa40xBM2kxd15aHKpXIbQFY+/FzpdLEy6VRILf2TFMAcwDr3/6SkBw
 FDkWzHD3vFaoHIaFdrYlWnkcPsOgzrSIC0SVlMqDJb7HfkU5KBI6ZEEZD9Om/o8iGuAq
 IM3VEutME1NkdHuku/8QGIbRrWQY7HLYWV6pkUxkAVBh4JaDshVIIam53v7rzAzE4fkL
 e/mM0Wrr3csMqiYkBttlOuiuS/rj4V0V8W+3NuGEAxdvxoSCYgNHpkVh6SbuVGrAyTq9
 mNxmOawmxU1O04cnlAMYyCLoHxNDy105+3cZ3WFgl1KUdMUwZESEvIIo3VIZ/OVm+BkX
 u1Bw==
X-Gm-Message-State: AOAM530d8hli2wPLh4ZDbzq6/gtq7hJb9f5sUhsWYmv4tlWIam9nh/0M
 4L051zpohFtbO3OVnmlOcRBdqx9tEFW1mw==
X-Google-Smtp-Source: ABdhPJxkArHGlf2WP5jio6zHkSVZL1PVchfjjesT71mjINzvBe3aU4CgE6Z0y70D7karT4GCyKc87Q==
X-Received: by 2002:a17:902:aa88:b0:13a:95d:d059 with SMTP id
 d8-20020a170902aa8800b0013a095dd059mr12769638plr.65.1631578507762; 
 Mon, 13 Sep 2021 17:15:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/44] accel/tcg: Rename user-mode do_interrupt hack as
 fake_user_interrupt
Date: Mon, 13 Sep 2021 17:14:25 -0700
Message-Id: <20210914001456.793490-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

do_interrupt() is sysemu specific. However due to some X86
specific hack, it is also used in user-mode emulation, which
is why it couldn't be restricted to CONFIG_SOFTMMU (see the
comment around added in commit 78271684719: "cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").
Keep the hack but rename the handler as fake_user_interrupt()
and restrict do_interrupt() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-6-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++++++--------
 accel/tcg/cpu-exec.c          |  4 ++--
 target/i386/tcg/tcg-cpu.c     |  6 ++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index eab27d0c03..6c7ab9600b 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -37,14 +37,6 @@ struct TCGCPUOps {
     void (*cpu_exec_exit)(CPUState *cpu);
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
-    /**
-     * @do_interrupt: Callback for interrupt handling.
-     *
-     * note that this is in general SOFTMMU only, but it actually isn't
-     * because of an x86 hack (accel/tcg/cpu-exec.c), so we cannot put it
-     * in the SOFTMMU section in general.
-     */
-    void (*do_interrupt)(CPUState *cpu);
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
@@ -61,6 +53,20 @@ struct TCGCPUOps {
     void (*debug_excp_handler)(CPUState *cpu);
 
 #ifdef NEED_CPU_H
+#if defined(CONFIG_USER_ONLY) && defined(TARGET_I386)
+    /**
+     * @fake_user_interrupt: Callback for 'fake exception' handling.
+     *
+     * Simulate 'fake exception' which will be handled outside the
+     * cpu execution loop (hack for x86 user mode).
+     */
+    void (*fake_user_interrupt)(CPUState *cpu);
+#else
+    /**
+     * @do_interrupt: Callback for interrupt handling.
+     */
+    void (*do_interrupt)(CPUState *cpu);
+#endif /* !CONFIG_USER_ONLY || !TARGET_I386 */
 #ifdef CONFIG_SOFTMMU
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index e5c0ccd1a2..2838177e7f 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -651,8 +651,8 @@ static inline bool cpu_handle_exception(CPUState *cpu, int *ret)
            loop */
 #if defined(TARGET_I386)
         CPUClass *cc = CPU_GET_CLASS(cpu);
-        cc->tcg_ops->do_interrupt(cpu);
-#endif
+        cc->tcg_ops->fake_user_interrupt(cpu);
+#endif /* TARGET_I386 */
         *ret = cpu->exception_index;
         cpu->exception_index = -1;
         return true;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 93a79a5741..04c35486a2 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -73,9 +73,11 @@ static const struct TCGCPUOps x86_tcg_ops = {
     .cpu_exec_enter = x86_cpu_exec_enter,
     .cpu_exec_exit = x86_cpu_exec_exit,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
-    .do_interrupt = x86_cpu_do_interrupt,
     .tlb_fill = x86_cpu_tlb_fill,
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .fake_user_interrupt = x86_cpu_do_interrupt,
+#else
+    .do_interrupt = x86_cpu_do_interrupt,
     .debug_excp_handler = breakpoint_handler,
     .debug_check_breakpoint = x86_debug_check_breakpoint,
 #endif /* !CONFIG_USER_ONLY */
-- 
2.25.1


