Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F73D028B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 22:08:12 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5w2F-0004KS-2G
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 16:08:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpU-0007Hc-IK
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:55:00 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:34815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5vpS-00086Q-GX
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 15:54:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id o201so448036pfd.1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FG3q2edYS6Fvc6gJJ5V0CeBI+/JUHyKtgs7Bx29llms=;
 b=gGX9/e668+itBWM5nokIqsa2CxH4RDX8pKM7uuMeNQpmwavbNk3E5F4Zct86TKz+/d
 IorPiTyHotxyNvuxY8eElpaNG5RZ0paRseoEQhw0Fgx5uJw/EKdhrcWSLyYifHLDgTgr
 eosY4kC6ONBX3Mfg4Mn4MAURzrFnkWTHAaIL4HTHxtgMTDpGsBtpFcgxIOcRqinVIi69
 Ph1YQMpx35uM/CZ/2xEkAZ380JMcqP7v8LEE6GHj62xqQ/0QAZWISXrHbgaVBHBfPJE7
 nB4uwhGSY/+Oex0mwU4NamawoiHDLVlVmKtOKGznhY6ON5cMEVa4bX2c72B9C00nrGoE
 iXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FG3q2edYS6Fvc6gJJ5V0CeBI+/JUHyKtgs7Bx29llms=;
 b=Sa/024JxczRcP7D0a645S8yppRU1Vsi4BL/A17oAtAEq1zQUrf4lMBzfB5dOkK87/k
 o9+/tKz2ChyPKOwZPVEGHA9OtJRXACS3v/pnJvNZTPurlwWsXJo5xSdRP6G2Gi5I/z5V
 JhoQuknvyMF8SwP1T11lOdNUtIEEPSfLX7/MkehAN3cdo6hqQ6JqwRrzOd0VKLfxzQVG
 H7HLxpmvs4cKgJKVs6AEMa1cPKVpfBPqfCzoXlAp7YEhc2okiMAuHw7QUerdueqKTK88
 xsglZVRGX0T0aVsrMQFharfaLJmNxEAEexS/CYAr07266Cn9pHfHlrjRu1szZhvfem1d
 h3aA==
X-Gm-Message-State: AOAM5303zyBglATke4046kjprhcwtCiBfB6vrZtFYU+NQNH2vaYGhuwi
 AMKa3fFNQugNPsUOrGYVViPSg8bCim2U2g==
X-Google-Smtp-Source: ABdhPJwWX8lsn9W1UiMG5kLAcOWSdcfp9oaO9pRJMxC5bQcK4NIWCi4M8YMtxd0ifpKhihKpNd8utw==
X-Received: by 2002:a05:6a00:a86:b029:328:566c:d4e5 with SMTP id
 b6-20020a056a000a86b0290328566cd4e5mr33686483pfl.19.1626810897280; 
 Tue, 20 Jul 2021 12:54:57 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id j25sm15422179pfh.77.2021.07.20.12.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 12:54:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v6 11/17] hw/core: Introduce
 CPUClass.gdb_adjust_breakpoint
Date: Tue, 20 Jul 2021 09:54:33 -1000
Message-Id: <20210720195439.626594-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210720195439.626594-1-richard.henderson@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow a breakpoint hack to move out of AVR's translator.

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


