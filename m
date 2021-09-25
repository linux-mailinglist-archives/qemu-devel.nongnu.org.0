Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C1A418308
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:04:45 +0200 (CEST)
Received: from localhost ([::1]:37686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9EK-0003to-Ji
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU939-0001a1-Li
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:11 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU938-0006Nj-5R
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:53:11 -0400
Received: by mail-wr1-x430.google.com with SMTP id g16so36520418wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=Rl/Yl18A4Zx6SpjTQGdOwjzsPYqEpDhRthDsAYY0zMbIqb/iKWcxDK9QURA9EJTMMz
 4JA9JkLWKDI1dK8/IxhV/fcKAJk+8zCTuDy6r7gOQphNp04ZSqPpggT2MLUyPjm2NJ8m
 IKm4dXNNRRLwRo/oIu0BoJ+Vf2vmrYlS85QuiYG8qE2O4rcnxUrCdPKX0OUvc2SxvSxa
 +d9ibA2IuBDGTsBa3ugZje3NDKnO6rUjU9phRlPYs4ER+XAkG0UmRidSJyHa9pO2k9Kt
 hudo6wFE4f8p5xdN+jMu+oA0XbOdAVR52SjKKwN4tIj1GzeO9nFCwcNmOhmd6f2HCW1g
 0xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FoSlQqSQ8ZbPbrlQxUB8XNqV2UVRF3KYNvOO8ZgTpHU=;
 b=2hxxq/UI/M6WgKnu75fTVLNoWx528oMyilR8E58DqYPxAVNxvKTduF00yLe4MqEOZM
 I44qNHonOoxUIioyGGUR7d9UTog7hgUpnJp8FpjMkAdff8i8UuyDkPUS6uTC2GZvghqg
 8ZbjfgV4NrUMAj/tdsoJt1S1WiQBDLJONbWnjxArmeqmV8cIHOweSGb4XFsT4mwauXZK
 2UNXuDt2uuzDpTlHE3aYGkOaNT/25EEbbke5V1V3YkRW3l+TrgOpLd5k4AVNf+q0v7Ug
 2VWOAbz1RsNI2dUFN4P00KaEb4j15rmbcaGIqK16c5QDdVV3+VQyRDMMNlU0KIxV6FOr
 I4Vg==
X-Gm-Message-State: AOAM53230MZwVl3iWM/tSUyBLT3LZAq3bBh8poeA7kyKRc9dykosrsIJ
 gGiRCe4bCCk/EykWEDobdajF5v7e+I8=
X-Google-Smtp-Source: ABdhPJzCqAbyKnOrT06dUXGEJagRVoY5PAMLcP598ID1Vl+lu20zEv7JWnE5erwmkax7Snuk3aacbA==
X-Received: by 2002:adf:de86:: with SMTP id w6mr5874287wrl.287.1632581588807; 
 Sat, 25 Sep 2021 07:53:08 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i7sm4301335wrp.5.2021.09.25.07.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:53:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/40] target/i386: Restrict has_work() handler to sysemu
 and TCG
Date: Sat, 25 Sep 2021 16:51:01 +0200
Message-Id: <20210925145118.1361230-24-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to TCG sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c         | 6 ------
 target/i386/tcg/tcg-cpu.c | 8 +++++++-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b029f1bdf1..36a1c5f3fd2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6554,11 +6554,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
     return 0;
 }
 
-static bool x86_cpu_has_work(CPUState *cs)
-{
-    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
-}
-
 static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -6763,7 +6758,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = x86_cpu_class_by_name;
     cc->parse_features = x86_cpu_parse_featurestr;
-    cc->has_work = x86_cpu_has_work;
     cc->dump_state = x86_cpu_dump_state;
     cc->set_pc = x86_cpu_set_pc;
     cc->gdb_read_register = x86_cpu_gdb_read_register;
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 3ecfae34cb5..aef050d0898 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -55,6 +55,11 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
 }
 
 #ifndef CONFIG_USER_ONLY
+static bool x86_cpu_has_work(CPUState *cs)
+{
+    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) != 0;
+}
+
 static bool x86_debug_check_breakpoint(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
@@ -63,7 +68,7 @@ static bool x86_debug_check_breakpoint(CPUState *cs)
     /* RF disables all architectural breakpoints. */
     return !(env->eflags & RF_MASK);
 }
-#endif
+#endif /* CONFIG_USER_ONLY */
 
 #include "hw/core/tcg-cpu-ops.h"
 
@@ -76,6 +81,7 @@ static const struct TCGCPUOps x86_tcg_ops = {
 #ifdef CONFIG_USER_ONLY
     .fake_user_interrupt = x86_cpu_do_interrupt,
 #else
+    .has_work = x86_cpu_has_work,
     .do_interrupt = x86_cpu_do_interrupt,
     .cpu_exec_interrupt = x86_cpu_exec_interrupt,
     .debug_excp_handler = breakpoint_handler,
-- 
2.31.1


