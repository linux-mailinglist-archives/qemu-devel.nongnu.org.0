Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF033D179E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 22:11:08 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IYd-0006B3-CC
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 16:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOL-0002yI-Hd
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:31 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:56309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6IOJ-0005uC-H8
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:00:28 -0400
Received: by mail-pj1-x1031.google.com with SMTP id gx2so2541150pjb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdFshZ1JFzbGAkyd3/YVEXhZvgnahsLT3Wd/z86Gd8Y=;
 b=r+Iv1GLvGF/M7czzJNI1zBqFmlfzBqu1lU0dvN6NDxAIfCHhQFemq5mTxtDmkNO2YS
 VAu4Yj3gCKc+BrebPo/kVjRFIoJ3KNeMNSXAKSTJj3r8+u/NJjpjNpH7B4Iq5zRydahD
 JQFmkQ3XAGuBai2cwLPKUpG7NaRxaLq3F1dExBo4NKPrxL/j1NZv0JgQcaGvmaFjOw0L
 CIVMWOOI3mx5PoClatJ3A5sbCFXrRvbAy61f/8QP0OhtkLTVfmv7qarx/5fEmUZC/7w2
 FAc9XOZuqB7cxuG3tBiq4jpR+sa934qcrh2Qybyf+HdDo6rCQbX78UitGzanBst1z0a5
 xreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdFshZ1JFzbGAkyd3/YVEXhZvgnahsLT3Wd/z86Gd8Y=;
 b=ZyvE21UdOJSdO/ryW3ZgcDsKqkCPd3QFhdV8cZGRen+y3HOmLxHxguMs73gWOElAoY
 +//TjEgyQqzPLpjeKLyUwSmMXUEtYaEwWfomv9DpZgXGM579BqQ8wF0p8ra5j/yRdCA9
 o+0CHnxwtiiAEeD/+M6gK2wdIfCwv6vg0roo8YtpJ6QxZPP0B34uKeGrr45/EwUv/lKd
 vDyUmODJgci0FLWA4c2qB4YG39fp+rjtEoLYP06vAXXYVlDe3qIhuOUXnD9Xcjo0hZDb
 ndApmSZo1jiBPpCZP8nHB4f1j27CeoAykBxvx7lcj+76B0sgKXS19xSMb8Z9+5zgVb1h
 Qsew==
X-Gm-Message-State: AOAM533CymuVImwTPMuNMaTqFmzCd7kbWyuucHxiKevM1T6xFB3PZ7Fn
 BSA0WB3dESsX3Z+wMznvBL6kLTpbWlCrLA==
X-Google-Smtp-Source: ABdhPJw5f1ZFDHb1IVLGcAE9TPtukCRUw5og3/6XV1uUX78os62SYqBTPo7Z16bno98orRQbs8GXtg==
X-Received: by 2002:a17:90b:110c:: with SMTP id
 gi12mr37030792pjb.163.1626897625689; 
 Wed, 21 Jul 2021 13:00:25 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w3sm706028pjq.12.2021.07.21.13.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:00:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] hw/core: Introduce CPUClass.gdb_adjust_breakpoint
Date: Wed, 21 Jul 2021 09:59:48 -1000
Message-Id: <20210721195954.879535-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721195954.879535-1-richard.henderson@linaro.org>
References: <20210721195954.879535-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This will allow a breakpoint hack to move out of AVR's translator.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h |  4 ++++
 cpu.c                 | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4e0ea68efc..bc864564ce 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -103,6 +103,9 @@ struct SysemuCPUOps;
  *       also implement the synchronize_from_tb hook.
  * @gdb_read_register: Callback for letting GDB read a register.
  * @gdb_write_register: Callback for letting GDB write a register.
+ * @gdb_adjust_breakpoint: Callback for adjusting the address of a
+ *       breakpoint.  Used by AVR to handle a gdb mis-feature with
+ *       its Harvard architecture split code and data.
  * @gdb_num_core_regs: Number of core registers accessible to GDB.
  * @gdb_core_xml_file: File name for core registers GDB XML description.
  * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
@@ -137,6 +140,7 @@ struct CPUClass {
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
+    vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
 
     const char *gdb_core_xml_file;
     gchar * (*gdb_arch_name)(CPUState *cpu);
diff --git a/cpu.c b/cpu.c
index 83059537d7..91d9e38acb 100644
--- a/cpu.c
+++ b/cpu.c
@@ -267,8 +267,13 @@ static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
+    if (cc->gdb_adjust_breakpoint) {
+        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    }
+
     bp = g_malloc(sizeof(*bp));
 
     bp->pc = pc;
@@ -294,8 +299,13 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
 /* Remove a specific breakpoint.  */
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
     CPUBreakpoint *bp;
 
+    if (cc->gdb_adjust_breakpoint) {
+        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    }
+
     QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
         if (bp->pc == pc && bp->flags == flags) {
             cpu_breakpoint_remove_by_ref(cpu, bp);
-- 
2.25.1


