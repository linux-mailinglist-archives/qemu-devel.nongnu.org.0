Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EEB3FF071
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 17:47:38 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLowD-0003lA-9N
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 11:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUl-0005U4-IW; Thu, 02 Sep 2021 11:19:15 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLoUk-0003GM-5V; Thu, 02 Sep 2021 11:19:15 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so3531720wrh.10;
 Thu, 02 Sep 2021 08:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKEDIK9jjR5E1iUtYoJzOCExU95HIVXUcHhHZVdYNmo=;
 b=kVRbVDJ/iHkK+UJWM+aQI8SwF+fWKOVW0tAIGFSdzQQZn1dh1nEJFZgjFNpvOd540L
 tjHGWjmkWcPC/WzY7vKE86GqtdgxBIADD+MX2Wj+QaEyq2u1tf35R62+C4RvmuYz5EpL
 9J4aVDsd4kSVEA1O+pQ6bb/7jYKpRxiY39bmtBUo/tzSXFJzBkooTN0gElSi5SJf43Hp
 sak74nA+KfkaW1UOBN/w4Jwlcf8ePZELB2k4UyHBBAf05zd7B97po+vMK8XKO4fb0ng+
 jz2GCgWAienCT/Da8DfnWrzO7j7ryR84wwhtdP84Y42jOeTA0xsov6vq4+tTNHmgLSkS
 MKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uKEDIK9jjR5E1iUtYoJzOCExU95HIVXUcHhHZVdYNmo=;
 b=l+NTFNbQMvH/BpCEe0BWTdr+A9Vbkyrpp9tFZXcnEulzc5GxJD1eYu2jY2WnSznr73
 C0VQoNupQP5MHu40ZzbvsuxBeba6mdAz/lYFQTUpPFna9uP4+6G1e25owqGUnqwxlafw
 N+RpTnjGbJRWMwHRJckQnjyiPq/YQgfkZ50280q1P1VzIjNQRYUt9qgFZ/yGNn0Rhc9t
 /6LM4cacJvAmGJZ0qMROJyz+w5jMXeolOJ7c5i9/RqypXtF7gFDWuYmDlf/HcVkMnR3a
 IajOEDCJrpuM6D8KpUU2eBPFWLSmsvKaw7mp6+/ceQY4N0I3DQ8XPlpDPXUgLppXXhwU
 eFug==
X-Gm-Message-State: AOAM533RJGwFjCi2VHN5ZYqo+c7VKTtBPvfM5UWpPJyVNmU2gQAtZfUD
 tZoTwAGXMhvOVcxOZ0tqNe4bLLAyDR8=
X-Google-Smtp-Source: ABdhPJxGTwTQtm2g8BjjsY6zwu4c16zdTLN4coyYNBf9pPdS6FRG626ytceIc3XrPOUKAd+7vNyUWw==
X-Received: by 2002:adf:c10b:: with SMTP id r11mr4502786wre.336.1630595950995; 
 Thu, 02 Sep 2021 08:19:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 129sm1894649wmz.26.2021.09.02.08.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 08:19:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/24] target/rx: Restrict cpu_exec_interrupt() handler to
 sysemu
Date: Thu,  2 Sep 2021 17:17:12 +0200
Message-Id: <20210902151715.383678-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902151715.383678-1-f4bug@amsat.org>
References: <20210902151715.383678-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Chris Wulff <crwulff@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/rx/cpu.h    | 2 ++
 target/rx/cpu.c    | 2 +-
 target/rx/helper.c | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7be..faa3606f52f 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -124,8 +124,10 @@ typedef RXCPU ArchCPU;
 #define CPU_RESOLVING_TYPE TYPE_RX_CPU
 
 const char *rx_crname(uint8_t cr);
+#ifndef CONFIG_USER_ONLY
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 96cc96e514f..25a4aa2976d 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -186,10 +186,10 @@ static const struct SysemuCPUOps rx_sysemu_ops = {
 static const struct TCGCPUOps rx_tcg_ops = {
     .initialize = rx_translate_init,
     .synchronize_from_tb = rx_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .tlb_fill = rx_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = rx_cpu_exec_interrupt,
     .do_interrupt = rx_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
 };
diff --git a/target/rx/helper.c b/target/rx/helper.c
index db6b07e3890..f34945e7e2c 100644
--- a/target/rx/helper.c
+++ b/target/rx/helper.c
@@ -40,6 +40,8 @@ void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
     env->psw_c = FIELD_EX32(psw, PSW, C);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 #define INT_FLAGS (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIR)
 void rx_cpu_do_interrupt(CPUState *cs)
 {
@@ -142,6 +144,8 @@ bool rx_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     return addr;
-- 
2.31.1


