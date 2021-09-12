Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AB9407EF6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:32:25 +0200 (CEST)
Received: from localhost ([::1]:37610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTL6-0004dS-Mm
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGX-0005Ft-7U
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTGV-0004G7-Ou
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:27:40 -0400
Received: by mail-wm1-x334.google.com with SMTP id 140so1526489wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hznr1enLR5pCymS6G0/T6ANjmCPH0tNvUkpSC3Ehl/E=;
 b=im7Mnn+qOc9w2X0y+rTgrRRxw3YfVjnoeZDKdxVNqh4fqJArT2dNnBQU49rCYZrBLn
 JSU5ZFHuu7xeAIAB1+NbpE/EtMlmSDK4lc9C+rd3srntEjM0PHgBH1KiTtbH9UI9zAU3
 lMd8KpuIujlBVc7fVTTdJV42GluD9I6dcyC7xxkGcGJxj3AGpDL4aRQw7fHb+5Wc9PkP
 q/OM40baSuwX85y6NOnbddDF7YVougk76zYchTpAYTia2whaMq6R0UcQOoIJqHbHCQOr
 h95z3L2RuPF+7AMTPBZDWmw5aX+HakfYDdBCuxRXbrrMqJExeNXAIQU0PDDptSXj30iR
 t4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hznr1enLR5pCymS6G0/T6ANjmCPH0tNvUkpSC3Ehl/E=;
 b=dFV0/IDOI6HO6k02jJDxu2EYNLscU6yApzu8dxyqA9/eFAr+4X3lMa0cGRR8wJmfnY
 E+1efGn+QB6Of28T9CFfv9nlrPHxG60mhShqMye2ACYOgIeAxuxtSLweUjtOBPA7BXnK
 14aXCQSlZGaAmTemLUrVwCeENVtBzSr8jX1Hndy1+ipB6j7CARucen4qVngaQlN+vuML
 g8jPmVzfSMD9IGK3b4cTlbQPurnzYIz7/oIKHnkn9u3r7KJVAKHiwSzWNjUKoenLHN//
 kwDveie6k7GjRgO6uddYZr15gFWvdiRahnA7FcntLHZH0oeme0gHSIReKz/7Ov2ZFEsw
 nH4w==
X-Gm-Message-State: AOAM531Lc5/Hc30EhmyLQTqdufifz/W+vTDmzGMa9TqCgnms8SGQRHOo
 TtMtFMNEIgHmI+H4R9j96w/Sii+E/lc=
X-Google-Smtp-Source: ABdhPJxssmu7BFSNldHZup/ECLEMfAWqoFnDzjEi30v4Uz2DBrgfIpNZ4Sv/X+MQ2jWwelUZDaZFzw==
X-Received: by 2002:a1c:a94a:: with SMTP id s71mr3428443wme.32.1631467658043; 
 Sun, 12 Sep 2021 10:27:38 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id n7sm1430516wms.18.2021.09.12.10.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:27:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/30] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Sun, 12 Sep 2021 19:27:02 +0200
Message-Id: <20210912172731.789788-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 372579427a5 ("tcg: enable thread-per-vCPU") added the following
comment describing EXCP_HALTED in qemu_tcg_cpu_thread_fn():

    case EXCP_HALTED:
         /* during start-up the vCPU is reset and the thread is
          * kicked several times. If we don't ensure we go back
          * to sleep in the halted state we won't cleanly
          * start-up when the vCPU is enabled.
          *
          * cpu->halted should ensure we sleep in wait_io_event
          */
         g_assert(cpu->halted);
         break;

qemu_wait_io_event() is sysemu-specific, so we can restrict the
cpu_handle_halt() call in cpu_exec() to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4: Reduce ifdef'ry to cpu_handle_halt (rth)
---
 accel/tcg/cpu-exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 75dbc1e4e33..5fd1ed34222 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -588,8 +588,9 @@ static inline void tb_add_jump(TranslationBlock *tb, int n,
 
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
+#ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
+#if defined(TARGET_I386)
         if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
             X86CPU *x86_cpu = X86_CPU(cpu);
             qemu_mutex_lock_iothread();
@@ -597,13 +598,14 @@ static inline bool cpu_handle_halt(CPUState *cpu)
             cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
             qemu_mutex_unlock_iothread();
         }
-#endif
+#endif /* TARGET_I386 */
         if (!cpu_has_work(cpu)) {
             return true;
         }
 
         cpu->halted = 0;
     }
+#endif /* !CONFIG_USER_ONLY */
 
     return false;
 }
-- 
2.31.1


