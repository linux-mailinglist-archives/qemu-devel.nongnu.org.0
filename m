Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4940DFCA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 18:13:57 +0200 (CEST)
Received: from localhost ([::1]:53976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQu1M-0006fI-CE
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 12:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLm-0001jk-VJ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0002dZ-09
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id k23so4848326pji.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lh58yC+MNXGB83pjMDOt8lSKa0ARivzdvFCovau9CGE=;
 b=mK2Jb/xK63uu+DOM7jKHEWX1FjOQX29E9Pe5eA6couddCpOTuoc0EOkJkoSexh7fFC
 veS9D7KsUHf+awpEy6A7ji10DeAsj6FZjm8LzKCQfv6uX9FEcSrEOX8jr7gVLUJM5wzK
 ucUS9bF4oyW4vOEe5Mb3XuudIqmzcLzCIC91PpehrVgN+NwJxZ/Xie5tu8ik3uapWYNt
 e2kG26Sz/mOCVkxtT4LEc29h491oxWAB7/4sGb49CfZHmOYb6Fo0RQ7n6OIB2AQB5h9s
 tC3qJ/xQm6AHlqUTSdUgfhTC3DAR61mE7H1/UDov5svuOZXCYPUolzwGfPsxO6bN7NH+
 Atpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lh58yC+MNXGB83pjMDOt8lSKa0ARivzdvFCovau9CGE=;
 b=V8pID7sD42dZ1ELjwJTIpnwLVb8KSi0nQsSNOfnoBGsoK42HmQXOk8D11ZdqFnql91
 kXJ1qGBmy+lOFmNib+W0mZFjq9wOxujISC8JnKwFnYOMN8XDlRtcx0H9cn+91Oogyb3X
 1gSPxpcvRdgrSkKCKK9jIR0ubfOBOhKr49ow2b4MRD5LuXz8rLeBWB/Jt0UlGFp7cpU8
 r0Vl+2eSa0BBccpRa1/LAjs2XM8LfogB7H/cLziBrfH+nqJXdFG+0sMSiQ3lv7IJmgXX
 Ik/Mq044YT1qfJidM+ILTl7EeokQvlmrB8q816C1AbXWqa9Sv0MpLU84GLkDCcu3TzBa
 a5bQ==
X-Gm-Message-State: AOAM53147ialblcaNQMBAImv3PUF7RRLF/imS92vDqWBeZCZIo36bF4p
 SXojSUpjhKvHbB+anmLZLpfbAew7i8WS3Q==
X-Google-Smtp-Source: ABdhPJz9zhix/V/l+/svKxBzi3yEEecByTxPStrfM+93lYmQ751vsO/5e6CjKP+m0x6adT4I3Y53Yw==
X-Received: by 2002:a17:902:9689:b0:138:d2ac:44f with SMTP id
 n9-20020a170902968900b00138d2ac044fmr5313337plp.85.1631806247195; 
 Thu, 16 Sep 2021 08:30:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/35] target/xtensa: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:20 -0700
Message-Id: <20210916153025.1944763-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict has_work() to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210912172731.789788-30-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index c1cbd03595..5cb19a8881 100644
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
2.25.1


