Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF55F40A213
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:35:03 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwPf-0006G1-0F
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6e-0001nM-6b
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:29 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6a-0007nj-Rr
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r2so10990728pgl.10
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QiqCBc+m0Fz8QoUQZzL/Ru/tNJr4RHJp7qRud4gO5Rs=;
 b=kPIJ+ALnEOtTainW5LGSW0+/9lQtxCm+nqBgSEsAg1Dg1rArNLhzxRwCSC7qNJOaR5
 kE/h4ot4xt3XauNA0USoew5CNPonW95N9j7WE15fu4pVS4vfOi1o6+5ufhzwNL7epMXa
 a/0xPuojA5dPEEkGvSJrqGmkNSPnUrsAfIarcVhd7njh+pJKqxmQA+BTp+zWkV2THR0l
 xO1+geOSYlsMM8XdDLoUoLYiCiC2CIwsPG+8IsWUzl2qJbduCUAuUBun0mTHZopdiHws
 l4+wZ9IWmdZ53qMeozTkq1YKm0cl6PiXy21aYjUxQgG3ZoHc+iyVu/bnZrAZ+4C6TUrH
 fkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QiqCBc+m0Fz8QoUQZzL/Ru/tNJr4RHJp7qRud4gO5Rs=;
 b=rEfgd7qvLgwvWba2gnvyGq0jUF0GwtMPBirRzh8yj7f75rACfTX1GfwW2aweHfsazp
 pUtp9EFlznudRdAKOtHEdkT4RQ8Bv8jWJps4eRgk/ESHQRyMDJvJ8fVAoRcSU8G8Xj1N
 EpWamlcUP4bBk+d1AsQWEdYuqsocO2x08E9iJe102exUG/NpxOce+1kiM+nWz05nd3db
 Mj1icXn4f6Skd1iZU3E2Kpk8vaqaGOYh0kC1PQ9QwBslQGDGF46mkmGif5oAyK8InoU+
 XxkzHiS3iHzFLRiLKwygoJX97yPVpRQfKetl4f2olLypV8Aw4rZljlIZvyp9bpjJG0tx
 xJmw==
X-Gm-Message-State: AOAM530MfdERBcf1qzHsO5DUeY3VW/7wknE+pakBb5ntyE7V6jr2pUAF
 P86wEkHiZJ2clBXAclw+cr0jeekMbFlRIw==
X-Google-Smtp-Source: ABdhPJyPs+SfWs8A6PyiLEWt+P+i0AVDMEqN1kRj/5M2bH2yVbC1+qt7WrlrDgfhK0XQXgsXmAp8IA==
X-Received: by 2002:a63:7404:: with SMTP id p4mr13178261pgc.222.1631578518815; 
 Mon, 13 Sep 2021 17:15:18 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/44] target/sparc: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Mon, 13 Sep 2021 17:14:40 -0700
Message-Id: <20210914001456.793490-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-21-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index da6b30ec74..5a8a4ce750 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -77,6 +77,7 @@ static void sparc_cpu_reset(DeviceState *dev)
     env->cache_control = 0;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     if (interrupt_request & CPU_INTERRUPT_HARD) {
@@ -96,6 +97,7 @@ static bool sparc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cpu_sparc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -863,10 +865,10 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 static const struct TCGCPUOps sparc_tcg_ops = {
     .initialize = sparc_tcg_init,
     .synchronize_from_tb = sparc_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .tlb_fill = sparc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = sparc_cpu_exec_interrupt,
     .do_interrupt = sparc_cpu_do_interrupt,
     .do_transaction_failed = sparc_cpu_do_transaction_failed,
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
-- 
2.25.1


