Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65325418C11
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:43:31 +0200 (CEST)
Received: from localhost ([::1]:60860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUcrq-0006S7-EF
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdZ-0002sk-VB
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcdY-0006AT-HR
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:28:45 -0400
Received: by mail-wr1-x42b.google.com with SMTP id u18so46533422wrg.5
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bWsdPZ7x9Zv9ulmzVLDInqOVNAhrwd+vJJnOs6jG4pU=;
 b=Lz1qhq/uC+KoKYHEK0XLdGXE+6OedOp7CtPzLrZMbklblzQg5mCutVwNKYMMj+2qsy
 c4fLcx+q5HSxWpbTbR4LbOLxLRJcr/W1nd45FUz7N7MBCOfOPe/b4/gpvd1aY7K6Biqq
 HcbKcv4U+qyJedhwNQYK94dmRrcuBgL1cpnAxEDv9DoOwkKWiPTnc1Ucg4RElpCegDnp
 WmTu0snU9Jkf+oG9WnGKmd4TOXulOlN/sIZsU7fhATofKMhT8Ccb/PPW3WRTyWPt9cAV
 tLyJgcMC0nbF1GUeuvFU1AynEaRwRXmScwO8az7UIRgaw5FxHEkopr1kSo5Z9jmydgPQ
 AjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bWsdPZ7x9Zv9ulmzVLDInqOVNAhrwd+vJJnOs6jG4pU=;
 b=ql/9de7cllJ2GSYojJo+c56DldGpeOy2e8X9rabNJPcMTP5qKDMV37SUF0LrzwI820
 jNfrr/PaWQUa3b0x8qyNFlkFcq7z56ruyln6e7zkLzhmCUECW+ZcahwfjGTTzT5MtNAA
 5T0SYdqaPoUxsPdWbddz1Oybzj0JzmX+0Y6pnbqvzI/YJqhx32zFq5zt5KdBrEvqQAYn
 NThBBBmKt1S+riVW5BuDRaPBjAqvgl2CtgEH9JfCMHbGaQjB09/3CqHcHqBR2PS72lSo
 rZzuwnRydGH6+LJN4DOfW0Pvxo/aREy3XiCNGlzvIR6e6ya4FpPfiRZJJfVCK0RER8wq
 gteQ==
X-Gm-Message-State: AOAM532dP5SPbmK4P7EiTWaMpbej3keAl0TSgh43gnzRCLWgVlrgzt1k
 +6UBtL9uvwxPlVNSt7f101nLXne3nsc=
X-Google-Smtp-Source: ABdhPJwDYMt4yEfClFOFdcVVxIF/Fn5fCbl9IkMYlUQQYUSG92wS0+y2XgsM1Pyp8ecLhyMMJGboLQ==
X-Received: by 2002:a05:6000:2af:: with SMTP id
 l15mr24655609wry.17.1632695322803; 
 Sun, 26 Sep 2021 15:28:42 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 z8sm5193869wrm.63.2021.09.26.15.28.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:28:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 18/40] target/alpha: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:26:54 +0200
Message-Id: <20210926222716.1732932-19-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 93e16a2ffb4..1ca601cac5b 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -33,6 +33,7 @@ static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool alpha_cpu_has_work(CPUState *cs)
 {
     /* Here we are checking to see if the CPU should wake up from HALT.
@@ -47,6 +48,7 @@ static bool alpha_cpu_has_work(CPUState *cs)
                                     | CPU_INTERRUPT_SMP
                                     | CPU_INTERRUPT_MCHK);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void alpha_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
@@ -221,6 +223,7 @@ static const struct TCGCPUOps alpha_tcg_ops = {
     .tlb_fill = alpha_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = alpha_cpu_has_work,
     .cpu_exec_interrupt = alpha_cpu_exec_interrupt,
     .do_interrupt = alpha_cpu_do_interrupt,
     .do_transaction_failed = alpha_cpu_do_transaction_failed,
@@ -238,7 +241,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = alpha_cpu_class_by_name;
-    cc->has_work = alpha_cpu_has_work;
     cc->dump_state = alpha_cpu_dump_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
-- 
2.31.1


