Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 540AC4079C6
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 19:11:39 +0200 (CEST)
Received: from localhost ([::1]:44838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6XS-0004SX-E9
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 13:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6In-0000sC-5w
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:29 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6Il-0003HM-Hh
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:56:28 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so7524210wrb.3
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xbkBh1p97u6mIkTKAA2kHg2qUMQVayjkKn9c7GCbY1E=;
 b=UQwnDSxyMweeFtj5Fa5bMASwnc0ciijB5BiX1QcWRq32P99rOHMe2Wm0neiMrxLCFz
 5i5QBKkhxesx4LexCGZ5HgUuW1TfCtCU+6/zpTP2bhlGckRTJJbARJKgoX280mAGSztR
 YBRcybu5GhOOfJrQKebUJ5cruUs9rkF7Pz0XpupY0kvFUlglcrJu2zl4JsUv4Hxej+CS
 6oi0QqGA1IwvbopD4zNjX82uaEUKYi2S82m8HA2XkyBlPilLBkx0mQX2+ZRJsxP7pMAQ
 B6r4tkLEW5hU4LrLUter1L5rUmJXVT69VeDeKb3y7pmk0qjqKdSWArNsyTn87IJOXXHK
 Nq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xbkBh1p97u6mIkTKAA2kHg2qUMQVayjkKn9c7GCbY1E=;
 b=gbSlG11ow3jk/rVMmbPH39oYxpJPWXNBaXJfDLnX/VTxtKOVAEr0O0M0Adm77AhIYF
 oadi2jTA+s73WOCaxp48jJtqL8ci/Tn8f6OsRZaRLvFMffV2bBXnl+bOQN3hh5Q2kHaG
 yNlZhsIPpPcpe+0kt8mcgv4DoiglWSHZuNmXvqpK8b4dFEDAljnLyfbmudeknnl414ca
 i48vbQ+u8GEKQjvlCYWl6wx+g+UUCdbgGSqswd1unHzluXehMzC0WiR7RehvDq4hDO9u
 38Y6PAT4md0Z8NY6GbcJJCZiPbSZfMgfyZtQxquSCZlD1/SHmAysKmpUqefttp+4lpl2
 zXTg==
X-Gm-Message-State: AOAM533N/YiPxBSuHuhygVt7XmgbAmZCThjIklw4idwwGLTUeM9Mfj/U
 r+EFr95qhGjX+ycLSPAoXn0lXdHW0rM=
X-Google-Smtp-Source: ABdhPJxnsTjQLCAs34H3SwBZjFextnwAWGqT9zEzKDBdQCo68YpjZb6L+6aBlPNBehVOpCpJ5giCGA==
X-Received: by 2002:a5d:4e47:: with SMTP id r7mr3902835wrt.417.1631379386058; 
 Sat, 11 Sep 2021 09:56:26 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id i5sm2142844wrc.86.2021.09.11.09.56.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:56:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/24] target/xtensa: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Sat, 11 Sep 2021 18:54:32 +0200
Message-Id: <20210911165434.531552-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/xtensa/cpu.h        | 4 ++--
 target/xtensa/cpu.c        | 2 +-
 target/xtensa/exc_helper.c | 7 ++-----
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 1e0cb1535ca..cbb720e7cca 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -566,14 +566,14 @@ struct XtensaCPU {
 bool xtensa_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                          MMUAccessType access_type, int mmu_idx,
                          bool probe, uintptr_t retaddr);
+#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_interrupt(CPUState *cpu);
 bool xtensa_cpu_exec_interrupt(CPUState *cpu, int interrupt_request);
-#ifndef CONFIG_USER_ONLY
 void xtensa_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
                                       unsigned size, MMUAccessType access_type,
                                       int mmu_idx, MemTxAttrs attrs,
                                       MemTxResult response, uintptr_t retaddr);
-#endif /* !CONFIG_USER_ONLY */
+#endif
 void xtensa_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 hwaddr xtensa_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 void xtensa_count_regs(const XtensaConfig *config,
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 58ec3a08622..c1cbd03595e 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -192,11 +192,11 @@ static const struct SysemuCPUOps xtensa_sysemu_ops = {
 
 static const struct TCGCPUOps xtensa_tcg_ops = {
     .initialize = xtensa_translate_init,
-    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .tlb_fill = xtensa_cpu_tlb_fill,
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
     .do_unaligned_access = xtensa_cpu_do_unaligned_access,
diff --git a/target/xtensa/exc_helper.c b/target/xtensa/exc_helper.c
index 10e75ab070d..9bc7f50d355 100644
--- a/target/xtensa/exc_helper.c
+++ b/target/xtensa/exc_helper.c
@@ -255,11 +255,6 @@ void xtensa_cpu_do_interrupt(CPUState *cs)
     }
     check_interrupts(env);
 }
-#else
-void xtensa_cpu_do_interrupt(CPUState *cs)
-{
-}
-#endif
 
 bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -270,3 +265,5 @@ bool xtensa_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+
+#endif /* !CONFIG_USER_ONLY */
-- 
2.31.1


