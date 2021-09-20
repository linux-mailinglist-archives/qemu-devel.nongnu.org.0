Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D84128E7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:32:49 +0200 (CEST)
Received: from localhost ([::1]:34476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRqC-0003yl-68
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:32:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7H-0005BD-Ai
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mSR7F-0002nQ-Tu
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:46:23 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u15so33597052wru.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 14:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=HW8Q5L1PV7MEkXxO7VUDWF39UanwaF2++taI2xa8FB9TOoI0cMPOlOoY3BMIDVaTve
 61+CjtToPqXMjb7domkU73P6/TeD0jDBy46EbZh8+o+rhCjksZexqbpSOf+Rp3NWFBsK
 1EtpjQPmciIol6kIUtOLtfArtFb1ZT+H4r5lnC6ajdNGFt7zjEzH3jlj/8MfPcNQ+n7x
 gaa6IBmMMc2jf99pnt2dVceZcGF9QsgJthgDgnyD/ahBqXZP+WML7D0zGo1IzLPi6ZtV
 ZRnUmp0QlO2KZrTs2wQMszUrICk/g1i0yBnc1kzr7eBrDJtUD+VYk5Thql0xiMGMPIun
 jq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h26pMLEnUsWrxMoqQtHQ2NCzZkcdqUGqN4k/9eCW+zM=;
 b=e7DtERV+gM1RDUt0/b3k5ZZWhx2dQ63cj+fNQdDVnsIUt5840wIJTSEMXWQZ8lkr7V
 UmDnxWR5IEQ251JExbs8eYO41jJjXwanRntrlWMEzxDy84PaIOR2NJN/mzOonrTSF/v3
 9hRKSiZss54W8ZKtz08l1DNwMrTzVWphIfaUbczQIs+qyFn3gs1wclajDiDCkf3w2VbL
 rkAYzAL+jn5Hvsmq8X1kYjUafU/QMxjiHVWqdqcxZgbxprKITA/04OhfvuQDqYBuqZs0
 zRcTWVeCL6qdjweukZU8flJjAj7xgAsji8aJE/wXiZYf45CqnrsijSG0wkQK/Fvtsou+
 UseA==
X-Gm-Message-State: AOAM531k0Um1cIJkHpDCxfe5pBXadXEgg0opfYDCvOokdJxt0Ubq5wxR
 /lKGe+skwYw91JLIXTFfq/APG72MTEE=
X-Google-Smtp-Source: ABdhPJy3rpKGHmpWGqANvzV24lwsGdNKY2PCIeppJeWFC8mDHADMvE4kRPV3WYrSRESXAG8LGcIteg==
X-Received: by 2002:a05:600c:214a:: with SMTP id
 v10mr1077722wml.167.1632174380385; 
 Mon, 20 Sep 2021 14:46:20 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 d70sm702776wmd.3.2021.09.20.14.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:46:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/31] target/openrisc: Restrict has_work() handler to
 sysemu
Date: Mon, 20 Sep 2021 23:44:36 +0200
Message-Id: <20210920214447.2998623-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920214447.2998623-1-f4bug@amsat.org>
References: <20210920214447.2998623-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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


