Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9141286C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 23:48:55 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSR9i-0006Fg-IO
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 17:48:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5x-0002qN-QB
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR5w-0001QQ-1f
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:45:01 -0400
Received: by mail-wr1-x429.google.com with SMTP id w17so25438589wrv.10
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v/6Xo0TImgBm2K/shdcIyB243lN4oaXhrr/liWYNm+w=;
 b=iyIiBpXaiDOtuVE5r/K3BHMNp+WKn6HJY/7/DoxzRV/dtmPN3DpKEiTIx2qTxrF18l
 wYndNYEJi6YyasCDTE7Xu45G9njLGisYV7HLeEKvc8J5LkWHEq+XKji+4VfDORWlCNCq
 3DsUMR5YdZ769DP83Z3UCPvDP/mbBanSn5x4OoMEsWmQPb5zPchZqfep/9nfhfzJcFho
 btnnN089KttGxtEtb9buuCk+U0BSuBN9Xqw0J4HoNCyf+oib4w2jSCp5XeQJcFr96sA3
 SIUpADWu+y3N1cA66UFpw3h6436On0HszQrzcUcm8SwO23jP7V187EuuUI54BWe6mGZj
 Ecww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v/6Xo0TImgBm2K/shdcIyB243lN4oaXhrr/liWYNm+w=;
 b=0e3hQA69K5pdTwHSdChEFeB+nsRNNNPbAp2V6s7IoDSPlDcTW7zGTjuaslvNQ9oUka
 nzoszeXRE/qRSjRDGpmbOyPH2s/dFprSF/UFm9W9sUxdk4xF0m/TwCH9cfS4kLRLnGc/
 Nx1L/AkAsQcb+YXkptzIOjP6IctEy6BD77Ke2ESDNr5emnpfsZADLn/0fFeil9xkfXjC
 Ki3i8/ccvdukh1CrxgNYSBserEhSO2YrerzkMu8y6nAYukj5+ZVgVg2ri3YTChX0pfj2
 rUkfcqkCq29LVncJPYzxauGz81tQ28L0duRuGnhKN7s4GnqU0fOh6rLDYE92Rs6BfiY6
 z4mw==
X-Gm-Message-State: AOAM533GWM9WBiAk0l7avzXf5Ve/PAfQp0Gnq1B37vLAMaTjQgCFLDQ7
 ORf9EYv6U4ASseLmpS96ZYDBoQonXw8=
X-Google-Smtp-Source: ABdhPJx7QboejQArc3/bdNfXSm2K8eVuMBb1inDD6MguUTeVbEvyJZ1q26RbGJKVHz+41wiDoxaQdw==
X-Received: by 2002:a7b:c104:: with SMTP id w4mr1128402wmi.160.1632174298541; 
 Mon, 20 Sep 2021 14:44:58 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g131sm659592wme.22.2021.09.20.14.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:44:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 02/31] accel/tcg: Restrict cpu_handle_halt() to sysemu
Date: Mon, 20 Sep 2021 23:44:18 +0200
Message-Id: <20210920214447.2998623-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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


