Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2B4418CF1
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 00:58:48 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUd6d-00055h-Qe
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 18:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcf6-0006W0-1T
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:25 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUcf4-0007Om-El
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 18:30:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r23so21146185wra.6
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 15:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=ev721cXxgLolbweNdRqxTm2+gWhZ3yh6MzUBsKacYgWM50dN3tYHjXAFDUZDC727yE
 oJ77JYxgjU4DFqSBwV1u/KUl2EHg0fK0dcAVXpsPdxsDrzfqppwMMa89h6QBqS3If6Qy
 7f6VokE1vUPc5gznJ8FYBzemHd4WkJy+zFifLU8Qsgjx9HsgQpzPdC5Y8TexwFwE6DZk
 B+ICXKS6RkRMS2ZPi/rEVRB2CTZiXSMc9ZzUIhxxQkiNDLREZ91fKK8ByZewVSoCMu7z
 Yqt/Rewq7vRjv2R0J9pZKOr+JrbOdo1+Ho4bbGIN9z8n0wF/PT9qXvVIUtjibz88+iyE
 dSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=NvoCpEWVhIoWJZ7Y6G46vF0M8j8Z045T4QZOHnIU0FkqN7LIbQue0v0u2iSIl3IOn6
 G0fGHCrdMoT/obHYAuRg+gJ9kdLFFbY5FN2vFJUR3APxC9KR0ztLavl5EF0HMDv+0eZs
 AgA899GWV8GMZMtJBWXThDFO+WpEaP0GFA6vP6X3UXdz5DmWLliwprSGR4DNwYQn4K5g
 pfuOpt3+vboJETbESEQzZHgkWMhXgEs6ASfejPOKc95fPqv4VeDgWAepE4p0RXqkCHzc
 XiXllm/4/0+kJ209D6l+JFJ22A2akthc4HOg3GOsO2xSkB4pixmnLxl8VY3D6JyyUpnx
 swaQ==
X-Gm-Message-State: AOAM533Deh1pfTxaEi0UqwCPDq4RSJYTSuumonuyHH1g4qXl/88LmNJ6
 VLU+eHwwvT3KjwLaSZmAdniXs0eO8ug=
X-Google-Smtp-Source: ABdhPJyJ38w+VyaXiFQDbfOFpqzZ57HdmWtL+KR/j5RVZnUkREDAf6h7Gbbv1hDw4kLFo9Ty5g7/SQ==
X-Received: by 2002:adf:f208:: with SMTP id p8mr24048662wro.379.1632695416775; 
 Sun, 26 Sep 2021 15:30:16 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i2sm377577wmo.14.2021.09.26.15.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 15:30:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 38/40] target/xtensa: Restrict has_work() handler to sysemu
Date: Mon, 27 Sep 2021 00:27:14 +0200
Message-Id: <20210926222716.1732932-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210926222716.1732932-1-f4bug@amsat.org>
References: <20210926222716.1732932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 target/xtensa/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595e..5cb19a88819 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -43,18 +43,17 @@ static void xtensa_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool xtensa_cpu_has_work(CPUState *cs)
 {
-#ifndef CONFIG_USER_ONLY
     XtensaCPU *cpu = XTENSA_CPU(cs);
 
     return !cpu->env.runstall && cpu->env.pending_irq_level;
-#else
-    return true;
-#endif
 }
 
-#ifdef CONFIG_USER_ONLY
+#else /* CONFIG_USER_ONLY*/
+
 static bool abi_call0;
 
 void xtensa_set_abi_call0(void)
@@ -66,7 +65,8 @@ bool xtensa_abi_call0(void)
 {
     return abi_call0;
 }
-#endif
+
+#endif /* CONFIG_USER_ONLY */
 
 static void xtensa_cpu_reset(DeviceState *dev)
 {
@@ -196,6 +196,7 @@ static const struct TCGCPUOps xtensa_tcg_ops = {
     .debug_excp_handler = xtensa_breakpoint_handler,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = xtensa_cpu_has_work,
     .cpu_exec_interrupt = xtensa_cpu_exec_interrupt,
     .do_interrupt = xtensa_cpu_do_interrupt,
     .do_transaction_failed = xtensa_cpu_do_transaction_failed,
@@ -215,7 +216,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_reset);
 
     cc->class_by_name = xtensa_cpu_class_by_name;
-    cc->has_work = xtensa_cpu_has_work;
     cc->dump_state = xtensa_cpu_dump_state;
     cc->set_pc = xtensa_cpu_set_pc;
     cc->gdb_read_register = xtensa_cpu_gdb_read_register;
-- 
2.31.1


