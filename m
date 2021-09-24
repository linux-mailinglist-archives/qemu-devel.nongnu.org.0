Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D00416F3E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:42:01 +0200 (CEST)
Received: from localhost ([::1]:53256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThiS-0005ul-4W
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfZ-0002kD-Jg
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:03 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThfY-0005wS-9D
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:39:01 -0400
Received: by mail-wr1-x434.google.com with SMTP id d21so25358911wra.12
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/6Xo0TImgBm2K/shdcIyB243lN4oaXhrr/liWYNm+w=;
 b=Pa9TAG3DJJNK60sjEqpoeDmA5Ja/hj8QumRUf3uvdx8KtTwf7Db64hlkgabldj/bgr
 w6UgkL2fGHrya1aOpmSDbYmhs0nmg1RfYZBuzVEx/l3pxiRslAE93ncb9NQ2owsY2RQV
 YAI9fUzxrQvJxCEToZvURcG28wKKOUFMXjt5ZycSM6W35BE4NFCIdVn71KZ6hpStsTkg
 hmjtGORbtz8XrFcfxWw2vkhckEz2pjbRztnT+y4lB1V/MqyRcl9FL4lFia6d5UlRxXBS
 yT8TkUGFNxvLS0iwxk6MK0yWevpgf4+8RPyykY2PKPeZSyJGK8A36kykXuJtSA32jfJQ
 OHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v/6Xo0TImgBm2K/shdcIyB243lN4oaXhrr/liWYNm+w=;
 b=19JEwu3rA27yTIDVR3roKxgXrPRvj6vgsTCsCzVw64C9Qr5KzWtA6CKMF2x9mNEx+Q
 3QL23IBTY77fn6RMUnrhDIZt5u/x3XFYcVs5CQdO2y2vNbhAlGBm+b7Hzu+vwT/fcgHm
 AWybPdh1DzYW0ZXMAOitp8xBwG6RMUDE0oxN5OIFHXSQlMOFiSL226o2p4psdIU130f7
 IB2BdHeWmO0HbAHpqDsvFs/HCzZ9u+P0rsry1oNDcUa0DvujT7z3SY2m3bzpt/vlyONa
 ukPKwzD/lkJrg4bhUHysKOxzV9C3/FREHQKWAKC8UVt3UKbfHLN/la76LFmDiqpNJoDB
 YDzw==
X-Gm-Message-State: AOAM531lsOdZXvTyQsVttzXSAV3RItNsWp3vwd9RSIsLcjHe4LyXhzHb
 mcp+WYoYwNkRgLAP8ByzcFit2kKbBNU=
X-Google-Smtp-Source: ABdhPJzhrnXA0uhl2pqV0q5B3dpoBOUbVOmIkvNTuLFX1nY/29IPrGM2JLjn3E6eMtqMs62Y3cpC9g==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr10126026wrp.349.1632476338844; 
 Fri, 24 Sep 2021 02:38:58 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 c14sm7622119wrd.50.2021.09.24.02.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:38:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 02/40] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Fri, 24 Sep 2021 11:38:09 +0200
Message-Id: <20210924093847.1014331-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


