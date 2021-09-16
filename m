Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50540DE3C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:37:30 +0200 (CEST)
Received: from localhost ([::1]:47742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQtS5-0002LG-4Z
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLd-0001Sv-6O
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:50 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQtLV-0002YC-7a
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:30:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id t4so4147093plo.0
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zQBj6R6mNHBuNIdCp6TRGb9J98g6c/du643Q8y+hiXM=;
 b=LfnWUeN+AnGOQVNkE6d7OdMt7+ZH3VvDJqSy6Vg6hl96ewEeWK9WMT7fuptOL0gCQ6
 LCdD2Md40M4E874Orm+AgimauILpK79dEC6PtNoleFXMEqVXyCFL8Q8AmgL8hPRxgBsG
 Co5VcvifHuBK/bjUX2u5xwBZhXOrU1q8NSNi09pUNEqAZazqxwzCf2rFujB4fVfBiXv6
 otgSq5wzH6gEYNlYtpUKJMgqaGbYaYpu5zyQUACpac5aPJWZURB2KjDzWA/0NJDeiVD2
 pfcZGIrrYbywfke0egRi0/hTWJXoff4/AAqqMsoWb304ieze1c3iwNhF/KNOVLK+bCKQ
 xKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zQBj6R6mNHBuNIdCp6TRGb9J98g6c/du643Q8y+hiXM=;
 b=JSbgINO1ZXjAeuBT+8i06Nsj/Bg4JUPicDLnWAI8EcJwl2x4DZEchniian5MYzWZ2M
 KZiVlMUG304THD2JBXrBsNVHVSCCX6lwYoazT+fqLdW7vplXBcgkNEUfbeYLjGpGvRL7
 amPEz9tJj76/bMHCThmAmOeXz56fZqeYv65yjtnz02NZN+9eE9aODPPVXcLFN9dVYy63
 hk+SwUbEpzP4IuAgWzQILQ3AYE+J7ipJsZDLSyYaMRPikoz8R3wWFv2NXkaGixYqNlij
 2ZxQEAUPNS2eCkzGTsShdZzrj83LWqHDzdAjZV35RoN5dw1fD7xZl/EuZ9DEehTAAq3B
 yAHA==
X-Gm-Message-State: AOAM531jJVeld1CwNeEiFmU6Fu0/prj+/+FZrQ1CFvgg7fDK9ijtjr2P
 gIhBt9QtzCwptMSnmL4LdByXMWZuQAaK2A==
X-Google-Smtp-Source: ABdhPJzsdasiJm6YJtSt/jXrmPPI34WmLY8OgiR925auDiQos9gw3hqwzp4haz5KL1yLZ+u9X3WSUw==
X-Received: by 2002:a17:90a:7bc9:: with SMTP id
 d9mr6581287pjl.129.1631806239433; 
 Thu, 16 Sep 2021 08:30:39 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm3779447pgs.64.2021.09.16.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 08:30:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] target/nios2: Restrict has_work() handler to sysemu
Date: Thu, 16 Sep 2021 08:30:09 -0700
Message-Id: <20210916153025.1944763-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916153025.1944763-1-richard.henderson@linaro.org>
References: <20210916153025.1944763-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Message-Id: <20210912172731.789788-19-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1..9938d7c291 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -34,10 +34,12 @@ static void nios2_cpu_set_pc(CPUState *cs, vaddr value)
     env->regs[R_PC] = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 static bool nios2_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* !CONFIG_USER_ONLY */
 
 static void nios2_cpu_reset(DeviceState *dev)
 {
@@ -223,6 +225,7 @@ static const struct TCGCPUOps nios2_tcg_ops = {
     .tlb_fill = nios2_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = nios2_cpu_has_work,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
@@ -241,7 +244,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_reset);
 
     cc->class_by_name = nios2_cpu_class_by_name;
-    cc->has_work = nios2_cpu_has_work;
     cc->dump_state = nios2_cpu_dump_state;
     cc->set_pc = nios2_cpu_set_pc;
     cc->disas_set_info = nios2_cpu_disas_set_info;
-- 
2.25.1


