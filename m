Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D01418CE6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:54:34 +0200 (CEST)
Received: from localhost ([::1]:59010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUd2X-0007bK-Lb
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceK-0005DS-W4
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:33 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUceJ-0006lp-E6
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:29:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id w29so46368374wra.8
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=kl/O0kGgHve1TC1A+zDj77iXst0/jtYnelSp9GQDHqiC+nLqDKBDKWYHHsBLfuNaG6
 7u+dm+pGpC+gECczcWD2albt3VcfZHvRKTZQDlIK1fnPW1rguOCm1vY5YK6LqrD6RaTB
 EKLAtEundze3Ddhq6Y016cJ+KjJPs0vme0lk0uSv78P8GtRuKavuivxGqHqhHaNwdr7S
 K+z1rCV068v8cEtp5IKwIoAdBG/IjiwFWv1t9+E8Y/sO0u9fjGPLmonCehSRm2gkXMIg
 bGZXI7hWSO89rUsce560tIQE+HyswuJDHYQQ4QDM5trb/Vp3h7zCrAKhVU272t6z/Hhs
 FmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=BwBwRJVRm+WzEnwukd9iL+txhVsc9GwAYcA0IbFkTlKpgfBD5KArE2fvV5AU0AQY9+
 eguOBszFS2xBeL4k56yOq9nW9SGG8ISwX4u380xeeUVOAYJQhLsC8dfYIlrJ80X/Y2V2
 ROr9HTOlIH0vZvGhTvFqsZ9m/pUa/NcQtB/AO8ul+0c1THVUR3y/hREhQmk0eYAaeVMF
 RDxKGGU6me0YZhAVQQ1AE2pTIJWitfcH0qfyUeybj85lE0gN4U7UzOdVTF24kUdcGYt+
 cxWZCMDlQiSCHGf4fXpBIqNjBUeE+Hk91hCoaJyBo89pDSBlOwAggaofeTfaQBy6UYF0
 DyHA==
X-Gm-Message-State: AOAM530+AKPmEfMtEPPSREghEaKuGAzljI/5O5d3QaOKqTUzBbGnPF/b
 33ILtbOWj+7zDZO39Jb3Zgw+RQFgPxM=
X-Google-Smtp-Source: ABdhPJwQEyacHfYB81Ch5Pvu4bxG+dqGI3hVh/ob32JsG99r7gD0mfsxnNJG8VxFDf4J220rskqfDw==
X-Received: by 2002:a05:6000:1103:: with SMTP id
 z3mr1512924wrw.312.1632695370068; 
 Sun, 26 Sep 2021 15:29:30 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 r27sm12541351wrr.70.2021.09.26.15.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:29:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 28/40] target/openrisc: Restrict has_work() handler to
 sysemu
Date: Mon, 27 Sep 2021 00:27:04 +0200
Message-Id: <20210926222716.1732932-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/openrisc/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index 27cb04152f9..3c368a1bde7 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -30,11 +30,13 @@ static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.dflag = 0;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool openrisc_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD |
                                     CPU_INTERRUPT_TIMER);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void openrisc_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -189,6 +191,7 @@ static const struct TCGCPUOps openrisc_tcg_ops = {
     .tlb_fill = openrisc_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = openrisc_cpu_has_work,
     .cpu_exec_interrupt = openrisc_cpu_exec_interrupt,
     .do_interrupt = openrisc_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -205,7 +208,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_reset);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
-    cc->has_work = openrisc_cpu_has_work;
     cc->dump_state = openrisc_cpu_dump_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
-- 
2.31.1


