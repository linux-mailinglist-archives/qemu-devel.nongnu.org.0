Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B35541832A
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 17:17:52 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU9R1-000239-B1
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 11:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94L-0004Xr-Ex
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:27 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU94I-0007JT-Px
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:54:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id t28so23094372wra.7
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=qWU4MvPZ5d33fFily2WsBp0lCIJ+9dZ12jEywn0YcLYbvd5J2IibCyiwEeldXAKvpB
 SG6zpIGxHY6wsdaEcZ4pIWIAzZyvCdmQUMGMeetakI5dFUiCdrlNFoHB7o7U7crJDfOr
 oI1B+OOn9bSRpFNxCzBOLu7TPhrcACUBh2IjGaJgJsnTH5UnmM6c6JzxmrOtWiKWJ94E
 5jHf0dFjS9Y3RGNYfal8jO18q6uISzRVSFBhwEUPoG/BvvyiTF23CmQABch0+9EIBeVf
 zI3SEeC6sNVDYknfowSrC3vz6FZDwRw54qT+ous3m/PtPBJJAUnfXbok/bsMdyO6cu/S
 0oeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=F6iT0mYKdizTZwY+Alp0nWU9C8rVfDyZdw7MbXpCAAA=;
 b=1h/7Q+AjSWO4FX3znsLZYT9tkj6UicswGkuZuesxup3eCeOPGW3A4Q4cRnG76hAMPt
 A9y4nHrO1EFgGhTAgeTcpVbTqQsXKy+6GDSOlRI1y/Noe65w2oxmB9/aD6sbxdq0hakh
 144pjDXuijLtyN99Ob3LGJU9DyTVDp05OwuAbEQf0C6olGcJbFLZ2UMh3uNb3RWLnjIy
 9wxRMTIgEcFnlnixhRd4Ov68PRj7JhTiD1V751t+hTzGmFN7qAINH5njZMs26uJsSdpg
 tQ8nbtY0ptndDVl3rUkhM1iTrJySvMPo438v36ijlF9q5ihmqhYWT/mjvtTM/MXwQw9P
 9Yfg==
X-Gm-Message-State: AOAM531hsUDrNQLJ/YyEAYnoMVZS5uzrpQG2tElwByndt+JHdQdFDTDz
 WXx3tpU+BfPhshvlZqnxHt1+QlDPY3A=
X-Google-Smtp-Source: ABdhPJxZynzoTzWQihn5d1/8CIHagvpHrrcMrbwJB7uTwH04XrWwsKQIaT+4S8bQqpVBis8GozBtIQ==
X-Received: by 2002:adf:e906:: with SMTP id f6mr2689169wrm.207.1632581661371; 
 Sat, 25 Sep 2021 07:54:21 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 v17sm1325275wro.34.2021.09.25.07.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:54:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 38/40] target/xtensa: Restrict has_work() handler to sysemu
Date: Sat, 25 Sep 2021 16:51:16 +0200
Message-Id: <20210925145118.1361230-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


