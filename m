Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E17F40DE42
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:39:26 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtTx-0008Aa-3w
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLk-0001Zy-58
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:56 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLT-0002WG-Hv
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:53 -0400
Received: by mail-pf1-x431.google.com with SMTP id c1so3324124pfp.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B7rWuZpn/SMFqm/jKpkO+UpJH/x3OABwCOd9KRMVg2I=;
 b=SJc92Y7DkgPZuwceESqn/Lpd5GNepRRd+GOIpkXai9Pjf/tF1wml/B+x/ejN1dxUOg
 hg9lEhddLF/RYyVj7wUy8jz6s5FaTHbWZFmwmBsOlt0yku/5uD/RX0Vm0YzjYU3+iC/V
 23U+xdppmItvm/PIzh9zF8If6HCyV7m37eYtR2IMmFRn+Xi6np5pN2Rid9XGifnoTvsV
 3DkrjipYHEWwtedEtNtIjTDCB+s+zzvdefg28hxNBX4Cg/PxaYyHDLcKQvKP7KF4GB0E
 dM4jKTXDUZzAzNc12ZW2zH/sWLP4nzJjZKIcYbx7JdrycJXF7ImbJfZi21t4fF7Psq/C
 5iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B7rWuZpn/SMFqm/jKpkO+UpJH/x3OABwCOd9KRMVg2I=;
 b=ovUtzlox4+Ot4CoZqwuqD0qDETBYWOiKKzJN2Dnbrt0G/KWhteyNokNkwptwtmcIpw
 GnA90cvhjCCnWcu2K3BoQbTd/wqVdruyh1WPcl4DBF4QtJxbCm6T4VZRZpWnOyInYQhl
 T6+8/WA/hEumTht4raMRnLB9Z4Hh/xf5oh7QrNnxzBWP8NvvVshW4PJym87N9U92dwJy
 CW4Ch6xnVTIPgWbiYOv+gO9lbCYZsB2/bMTIKAhiIpQQeXEYfDsJOGIbGSxz7KSYm0Rd
 kbcWJAcBrlo9z0j+GeOaC5DAOXgvJniTp696KCZePDwsiWdJPCUYvysfl3EWNJ2Wlqet
 ZwqQ==
X-Gm-Message-State: AOAM531rsZcmQ7cM9gOSNcxKXxyoDN3QwZucFov35jHvF3m3wnzV5ql5
 K+jxoRxIk+Ii68JnYvFnMmjOZXWVUl+sHw==
X-Google-Smtp-Source: ABdhPJyw4VQSYtTDbTfoKhXHR664yAO7Uo39d9SUpUu81Cwp55FMighk3FJG/hImiUlzCh31DIdJMQ==
X-Received: by 2002:a63:c045:: with SMTP id z5mr5459758pgi.374.1631806237987; 
 Thu, 16 Sep 2021 08:30:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/35] target/microblaze: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:07 -0700
Message-Id: <20210916153025.1944763-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20210912172731.789788-17-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925..36e6e54048 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,13 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +143,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +369,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +388,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.25.1


