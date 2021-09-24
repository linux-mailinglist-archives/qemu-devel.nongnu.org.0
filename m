Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7306416FA8
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:55:37 +0200 (CEST)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThvb-0005Nl-Su
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThh6-0005L6-I4
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:37 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThh4-0007HO-2y
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id t28so12106288wra.7
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=ApShoZYtj9bGnnWC81QPqXgZDeM8jKnDuzTzWs0ugMkG9F60ACuR9+yW0piAHHVnrD
 dN/Lec8Fpplq83Lw5ehpcru7C+WWl0j6KWW1HCSjClE5DrRjc3gf0Vjd0h72pHaJBwJE
 dTV6H+ISz6WYDfKRyRFiXkXAd6FT4q+O5QwZ2Hw79Ly8T9b3Hycz8kuMb2rHK/d+lPFw
 EGM9PMBw7r4WX3RkYRt3dCRV3Umx8xZVo+drk7X5XnkBpz4FMvlzsQmE5KJq+PFFn+r9
 XY/eX1v4Kb2bY2tGnijImf4xa8P6DT4NkIzOQeattxuUBny1BkUdrrQYC25k4GG6OwsQ
 THYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Hcdc/mmIgCeyUTMws35ZeDR0xT8KVD3mt7/D2pvFUfg=;
 b=1453SuoEPlDYatRlI3jmrI3X5OdesOSwTmq4fuM5Uus9N9jZwDbG+a4/FahR4Igib5
 GFKZKTQhRLDEMcd/feggDLW8jx4xK1x7plHsVioimi7+gYb8/UuYaXxtqGbO7fkpQnY3
 yOHKdyz/kDKOSZnKBG8aEgN0A5ihi96erulTy5VypOl4YWqB5JaCan6cNs55uxWpupkJ
 BNDPOSdcig8gUN5YQfQGE1hvm+4CKRsB0UCt4LHYusNZvbfmP/ftL1j3d/j0qfAsxCJB
 3gWVlXakZ1v9+mAh+rv/as1dMU6AD819Ba3KDLFlb6PX57QWFB9l0kMVq3NV3S7RAgsV
 Qccg==
X-Gm-Message-State: AOAM533sE7uWcWIVgXUKq6bNUqCY+Q2ZMlLf8TymXpO/a62PdKftuydF
 COWG6OmDWvZhoGiraQfqEMj8+5yNHcE=
X-Google-Smtp-Source: ABdhPJzoqmTsBp+lpAAAfOeG3IfrPQeBmiO6L4KXy4vLYs5VxrvC51jMGmVLPllJ7Ki2tdHRInJtIQ==
X-Received: by 2002:a05:6000:18a7:: with SMTP id
 b7mr10833781wri.13.1632476432583; 
 Fri, 24 Sep 2021 02:40:32 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l13sm7734955wrb.11.2021.09.24.02.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 22/40] target/hppa: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:29 +0200
Message-Id: <20210924093847.1014331-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hppa/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index e8edd189bfc..be940ae2246 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -60,10 +60,12 @@ static void hppa_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.psw_n = (tb->flags & PSW_N) != 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool hppa_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
 {
@@ -147,6 +149,7 @@ static const struct TCGCPUOps hppa_tcg_ops = {
     .tlb_fill = hppa_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = hppa_cpu_has_work,
     .cpu_exec_interrupt = hppa_cpu_exec_interrupt,
     .do_interrupt = hppa_cpu_do_interrupt,
     .do_unaligned_access = hppa_cpu_do_unaligned_access,
@@ -163,7 +166,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
-    cc->has_work = hppa_cpu_has_work;
     cc->dump_state = hppa_cpu_dump_state;
     cc->set_pc = hppa_cpu_set_pc;
     cc->gdb_read_register = hppa_cpu_gdb_read_register;
-- 
2.31.1


