Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30051412BBC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 04:28:01 +0200 (CEST)
Received: from localhost ([::1]:35168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSVVn-0008Ea-OT
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 22:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTa-0005X3-7q
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:42 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSVTX-0006Ea-7h
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 22:25:41 -0400
Received: by mail-pl1-x634.google.com with SMTP id t11so1833083plq.11
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 19:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4+zrbrroX1D6vS/SQV3E4mdDvw0CWYvps+W1iwdat2U=;
 b=Eu17ZHQailOpYS2FVwL536MmZZntf/D80XjGDw27Qd3EVLYBsL1XVq/IA8mqkUtICW
 7j/yVU2ljC30vxjUU3V/aqUADfiYohOF6iSwj7YNlrOnSv9vtwyz2KaDyvVFQXVRiCL2
 yJUAdcmRzkeuDo7zj40Zkslva6qA7CPC7vGbKoHafu3UNA/flsxqZ5iVC8w7h4LwJ8TB
 jt3mOflRuF/SQk+UJuhAVbQ87E+rVF9P7SbzaHFjyMzh8OTzDpowcq5arrNln6ydyBY8
 1ds0s1Lrsdy7RUWIudScdSflIbFsbFaBrMA/2bXxW1RT1+uwGcRMBjxaCywiljve/fO5
 Wi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+zrbrroX1D6vS/SQV3E4mdDvw0CWYvps+W1iwdat2U=;
 b=uk6UlbcVHfm+x+loQjaYNKLr9WzhHKAJ2d+rMvXasot0/PBpdUQLZoSzNifOZDbBQY
 +FIsAWPwPxxmvdoCPK2/6Xaj+nEwiywXnpUFwhvX0qBrOo544Le/KcHMPTSrc+O2fuwV
 EFhUobb7/n0NvvNrwCsbVAWWQKNdaeRR73bCG+45Hb12hEgg1cz2fqTETF3f/0gXDbcy
 m664h44npuNj9w4Gl8ysuqSA56tYHyXy/6n6Nu7mRAY2N2rBSrleP85BnLiabw7teftp
 s+sC1/9dVlwjZDHZBwSKLosodgTD+FX91IveiDScfQSeXgFDWk6+Of+Y9u2vCvK9soZn
 LRKw==
X-Gm-Message-State: AOAM532QdJb+ItL0MK2hnqZclyDABXQGVGKZh81DgSVaMwi5JoN4Vpk3
 rgK4z0Z7l6Cz1ck2VTJGKiAhAohVJl8WpA==
X-Google-Smtp-Source: ABdhPJy4WrpoLUTNNFpOor6fV+X2JN1naNMPZ7Uhbzv1RYIYkNdqL35c+R//kqw3Z/b097SHFdqHbg==
X-Received: by 2002:a17:90a:1984:: with SMTP id
 4mr2423118pji.241.1632191137902; 
 Mon, 20 Sep 2021 19:25:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n9sm15297621pff.37.2021.09.20.19.25.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 19:25:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Mon, 20 Sep 2021 19:25:26 -0700
Message-Id: <20210921022534.365291-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921022534.365291-1-richard.henderson@linaro.org>
References: <20210921022534.365291-1-richard.henderson@linaro.org>
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 75dbc1e4e3..5fd1ed3422 100644
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
2.25.1


