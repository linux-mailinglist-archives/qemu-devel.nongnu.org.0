Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33D8416F98
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 11:52:31 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mThsc-00081p-UD
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 05:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgx-0005Cl-Qe
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:29 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mThgu-0007A4-VY
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 05:40:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id t7so25377297wrw.13
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 02:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BtkZfC3Jqv9BX8O65q6cSfCgutSi0wjc1sQe8Yf13mk=;
 b=J+sdCw2eapRlTcLHEpQOv0W7qPRU4O8ULFwEPDOEXqlAZtJ+9bKMVpMhx8FYKLYqBO
 Ag3ypiz+6dwRFzEXeU+8f8p21fwrKlb47/K2OqC+aFHkE9NewoM6lMt1mRwMtUpgm5lP
 ZUF81W4eFdTBasqFdrrpQJbzyR82HxZZ27v3s+cxm3ME4JoNyFdbz0qsavT55L4mwR3D
 ZSaNffM8UMeA0b8YaA+lkuaw98gFol269tQw/rD8Ni74i4agAeeXphHzzE+qC8yF8vcE
 4EMC1iYA7qoc4df7+ZQvKpIvegYw+zsQAgkT5Ytm+58+62Jvix0HwQr7beJKZ10NCW1K
 CY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BtkZfC3Jqv9BX8O65q6cSfCgutSi0wjc1sQe8Yf13mk=;
 b=Sjgc8FTMz9spaKxrFgCn36yFs3lgkZ6ClHYJDlnv2xpJ1JLs4kWOAR3H7Ut9H6d3C1
 lLRH0GBhHQjvsfmpiQymTxtitsrqR9RtFjO3cyxaOoZbpHXkhAErIDEo53ehcslvYi+1
 WZ/t9Y/+YpOZNcNOI5BdvBVNSKL0S0G7BYquFkhumDv+5oOhoVwaf9upbzfRE+m0pnK1
 3WGi7SMWKdUIxhs+nJZ8lyZzSOLb/xsT7dofLa1ll4xsf364NiZh77Ds+nvVZfmOrhBJ
 zXlD7kcGa4WerruzrxrVxjT/gIwbkb9S50ZfpVGfM1IRzVFmQwTasHeXKfyHbP8tWX3/
 q2ig==
X-Gm-Message-State: AOAM5330Nh4ACdXFNmJnnVSgOgrnWLv/c3m90teVmdHgdGNY3HAIGPbm
 GIxjbUoVzSu4TlgZ1eYsplMY2/vjphM=
X-Google-Smtp-Source: ABdhPJwAbqQzbkiTCAZ1vBq3StIchG3epvimAoPDx5NMYG4x2jIpO60xP2UoKBIObw7uB96NTcDdrg==
X-Received: by 2002:adf:dc0d:: with SMTP id t13mr982240wri.158.1632476423514; 
 Fri, 24 Sep 2021 02:40:23 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 g1sm14462069wmk.2.2021.09.24.02.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:40:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 20/40] target/cris: Restrict has_work() handler to sysemu
Date: Fri, 24 Sep 2021 11:38:27 +0200
Message-Id: <20210924093847.1014331-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210924093847.1014331-1-f4bug@amsat.org>
References: <20210924093847.1014331-1-f4bug@amsat.org>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict has_work() to sysemu.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/cris/cpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index c2e7483f5bd..b2761f8b110 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -35,10 +35,12 @@ static void cris_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool cris_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void cris_cpu_reset(DeviceState *dev)
 {
@@ -208,6 +210,7 @@ static const struct TCGCPUOps crisv10_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = crisv10_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -218,6 +221,7 @@ static const struct TCGCPUOps crisv32_tcg_ops = {
     .tlb_fill = cris_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = cris_cpu_has_work,
     .cpu_exec_interrupt = cris_cpu_exec_interrupt,
     .do_interrupt = cris_cpu_do_interrupt,
 #endif /* !CONFIG_USER_ONLY */
@@ -294,7 +298,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset);
 
     cc->class_by_name = cris_cpu_class_by_name;
-    cc->has_work = cris_cpu_has_work;
     cc->dump_state = cris_cpu_dump_state;
     cc->set_pc = cris_cpu_set_pc;
     cc->gdb_read_register = cris_cpu_gdb_read_register;
-- 
2.31.1


