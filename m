Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AD9407EFB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:33:25 +0200 (CEST)
Received: from localhost ([::1]:41472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTM4-0007E7-Rg
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHl-0008Ph-Dd
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:57 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTHg-0004yd-QL
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:28:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id s24so4945280wmh.4
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=HsbPp59De0sDVgVwTkNKbZEEGoOM9PWhGHxOMEbuyj5XziwyJyzREpXK5dEqVWhfRq
 Y6nWlr2+uB+uuBHg2hSgh7X6t66pdN28I4zUmMQLKzSpFWomG8XOY3BU1Kpgs28h87MF
 rQ8tiOyXHPFBvRxlvYMi4C6mq/n9pd/sk+21K6pNx6SEhMqs0xhhJbxxt6aJGOz2KpUf
 p0CetTNMMnhLU86bFj+PIIIdC6LgpNlud4EHXYDo+Jo0Egwp7ZBPtiWCu2pbPxtrx2fH
 uccygmC1d+4YOkATG9WwOEq1VHl44J8mhRfmy9YM+61bPX6eepZ4zFIky9rfJkNBu2B9
 UOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TotqMEN5DrXYEF17ne4DDCu2zSM8Bp20jLCGhp9+svs=;
 b=KdFvTcuJKouy6R6yaWZlSWuXnByQHw1Lw8s8DT4eiq7TLIWDQTPh9ugGcLRIharEwB
 w/0ECaHPDPKIQaq4BPjkwUiFDrWuBacPpTWRkSwbpPy+plzxyTPJOde9khHOZkAnD/sj
 b7kDeD2dA0uFPH5xFkYKI9e3ok+GCGUxHUJB6tE9ySdktSiOzspsf/cxpaKHrXn7cmfj
 PJR6WvZfvxQaDK1/dWkKsRH3KYcfXD8cHMNenkp2yUgjqsHjbT9MXiuf6VkPKgUvM7H0
 OAedvNbVgjosTZXwLfLTu9/9CsUQrGkWXZuykXnvtcy/hibnTe6KJVOGXFF/qyMonUcY
 6PWQ==
X-Gm-Message-State: AOAM532SLmOz9zf5qsXuRmOImqxchU/hWFvlHfJ7axzFiL9wgI8TNPxE
 kAPuj7+PFyrlQuRfUkehhmf9kYgR+Os=
X-Google-Smtp-Source: ABdhPJwYnpowDOwWzctvni7VJXXdZpkgaaeIkwHRr5JP4yXuG0Pmso1KdGdkOZUMUM6Spv6+67u0Og==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr7609000wmb.59.1631467731155; 
 Sun, 12 Sep 2021 10:28:51 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d9sm6278043wrb.36.2021.09.12.10.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:28:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/30] target/microblaze: Restrict has_work() handler to
 sysemu
Date: Sun, 12 Sep 2021 19:27:17 +0200
Message-Id: <20210912172731.789788-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..36e6e540483 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,13 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +143,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +369,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +388,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1


