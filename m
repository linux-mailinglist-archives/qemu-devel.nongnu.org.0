Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77DE40DEBE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:54:59 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtj0-0002Ig-RR
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0001T8-7U
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:50 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:50730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLT-0002W9-IK
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:46 -0400
Received: by mail-pj1-x1032.google.com with SMTP id k23so4847941pji.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMAaN3fIk1+CGVDUh2TqRwq0ThOKp39rivwNuMj/4tA=;
 b=RAa9NDJMTgTNx9GpkVNLwqJ0LDfAQd3EDopF/VYylBs5PbuS+oHwwqa+4ZTgAokNOr
 7aZFNwNNgcwp2z8fLITj5eHsPvzOfBj0rpyX91IDECwsfbfUHhrFtn5zjoHuMQUQx1Ql
 tX1yNokFkclN89E/8C1Nv5zCuvlml7/+/8VI1uYiENrfi0bZZE/I38rC+QwmCLm0IfWO
 z1X28JAEkG4HI+CQgcpdwZR0+i7O0SyFi2N0ncJR0xYvzCrQ4beubW4af8pTgs7o7dee
 p1baKyOLRc9EX9XO9KXHofOzmDtLMEhxrEPzdG4C1c1Afrrm91H7l5Ao9fIEWX4P4yBz
 Heaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMAaN3fIk1+CGVDUh2TqRwq0ThOKp39rivwNuMj/4tA=;
 b=AbNM1ThZIztU1ALhfhQrseWuFdv4dVfuF9bmYw5hcbDVZeEb0wmSreUGGrVd9qcJVt
 xSu6GQ4tvqS660R3vmH3y3Nj+DH3hZPUitIXJZxGsLRs+h9quVy9MgOTgiyGZIQTr8wC
 /vfmRyyoUSN+tTgx3jhWq+3MUuR6z4dlGt78YEwTbsInPiWpASsftqSBI/qM840nv/Ew
 i3aFeeidBK//28TuCzsfvOLLXvLFEGfc9ys/c0cK57ug6Ng9krXhbhpj9/QgJX9Z5Q+h
 C14vS8bPmt02UIpuF4O3Cg+Nfqj6Xcm4ql5vzcYLWEv4fIrs/ocWW9OrsHHDXQn1lVLM
 AOQA==
X-Gm-Message-State: AOAM530cJ44BuZdkiwaL7rRlHcKN0WLl/Ia6QNw1P3J9rc1IdtfSu9/6
 sH76KMWt7T86+DaZTLyN7a2n6PChT8NKhA==
X-Google-Smtp-Source: ABdhPJyMLBP8wMMZS3DY4URaFRPkov4TowUv8nFUGJElK33V+mzwq/QVP6cQ2AJcyT12GM6O+GLjYg==
X-Received: by 2002:a17:902:b202:b0:13a:2f9a:bd97 with SMTP id
 t2-20020a170902b20200b0013a2f9abd97mr5381598plr.2.1631806237373; 
 Thu, 16 Sep 2021 08:30:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/35] target/m68k: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:06 -0700
Message-Id: <20210916153025.1944763-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Message-Id: <20210912172731.789788-16-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 66d22d1189..ad5d26b5c9 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -31,10 +31,12 @@ static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool m68k_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & CPU_INTERRUPT_HARD;
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void m68k_set_feature(CPUM68KState *env, int feature)
 {
@@ -518,6 +520,7 @@ static const struct TCGCPUOps m68k_tcg_ops = {
     .tlb_fill = m68k_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = m68k_cpu_has_work,
     .cpu_exec_interrupt = m68k_cpu_exec_interrupt,
     .do_interrupt = m68k_cpu_do_interrupt,
     .do_transaction_failed = m68k_cpu_transaction_failed,
@@ -535,7 +538,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-    cc->has_work = m68k_cpu_has_work;
     cc->dump_state = m68k_cpu_dump_state;
     cc->set_pc = m68k_cpu_set_pc;
     cc->gdb_read_register = m68k_cpu_gdb_read_register;
-- 
2.25.1


