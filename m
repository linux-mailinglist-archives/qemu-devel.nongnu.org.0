Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219C4311705
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:29:59 +0100 (CET)
Received: from localhost ([::1]:52250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AY2-0000xi-6r
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:29:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3L-0002rp-Ro
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:15 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:40847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A3J-0003h9-4l
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:58:15 -0500
Received: by mail-pf1-x432.google.com with SMTP id i63so5297553pfg.7
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TB1xKftdAin96vEzndzCr5EtfRDX0MhFc87zNoWIuTY=;
 b=r6Ss6O93kX6PunhBqd8+Ntul2yab1i5L6opEqWIm0Q/+bjUvytC1YMEkWQ70KnVYlB
 4fcMTWAUWqdovXyJBI56BUfJrUBm0oR5JRqpwe3aNb6R2htwKhnldrtQWj1ueYP5dxY/
 YEx9iXvUAZVClEXI1Lrs+H2TmzG9MdqArjc7q6URo/WvEEs4FWMAzPMmwG5LF3AuFFp+
 h1nmTiDegvNvVhmYN4iBStGsA8dcs7WkgS5XzlRRz1PQGrrpKysgnvGylS2KWFJlfEPx
 jfb457O+wMSHMoAInjo7dB5gM2izk6e79u+0oQjH+GaZppw03ctWZbSLZjGmqT+70gI2
 UQGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TB1xKftdAin96vEzndzCr5EtfRDX0MhFc87zNoWIuTY=;
 b=lK2BaOjaCa0vqwCBy/km6iJuNtYuEha8ya5Shh67/FPH8dhnOyMOv8InhOeeazjHvH
 AIZegHTt8NdTsBmOoCyRPlm4G3uy4bO/ZfPnUHPQ5hchZhJpY37VeLJ/jYeA7Q/6puCt
 CXw72EFlw5koHMf+KleXO4nR57u/qv5Bj2Z65J9j/w5AV2lhyeyL0Ut3HkHjIB2ZlH0j
 fLRod/RMpXCmwifYGNmMVZ+445SlN02oPNg8Vd198c9HXgQh1tJHXpsQLp4pDCp8DnEG
 j8GzVt2jtlsFHGZMLncbs877W4KKGut7/M408qVMO33Pp8RL5zvqB9t/A+0Mw1vLi5mC
 HizQ==
X-Gm-Message-State: AOAM532qoBqSKO+frD+ic0oFjgvai9kBzs8W1/Lwbx+rrNKRXUi4BFzH
 DsWoys0hGvGGZMljnSihhqaUU7KCln2bSwkS
X-Google-Smtp-Source: ABdhPJy+UrINEQ+KJanSc9YTMbHmjUXBgb9BR6cOaKeRde48yF0ZiPVdt2uj+CPWJU5ihgPbW7ZhNg==
X-Received: by 2002:a63:1214:: with SMTP id h20mr6282220pgl.379.1612565891873; 
 Fri, 05 Feb 2021 14:58:11 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:58:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/46] cpu: move adjust_watchpoint_address to tcg_ops
Date: Fri,  5 Feb 2021 12:56:45 -1000
Message-Id: <20210205225650.1330794-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

commit 40612000599e ("arm: Correctly handle watchpoints for BE32 CPUs")

introduced this ARM-specific, TCG-specific hack to adjust the address,
before checking it with cpu_check_watchpoint.

Make adjust_watchpoint_address optional and move it to tcg_ops.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210204163931.7358-14-cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 6 +++++-
 hw/core/cpu.c         | 6 ------
 softmmu/physmem.c     | 5 ++++-
 target/arm/cpu.c      | 2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 063814eaa4..832dd26e92 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -136,6 +136,11 @@ typedef struct TcgCpuOperations {
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
+    /**
+     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
+     */
+    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
+
 } TcgCpuOperations;
 
 /**
@@ -244,7 +249,6 @@ struct CPUClass {
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
-    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
 
     const char *deprecation_note;
     /* Keep non-pointer data at the end to minimize holes.  */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 57542b6906..3d5bf9fe02 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -383,11 +383,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static vaddr cpu_adjust_watchpoint_address(CPUState *cpu, vaddr addr, int len)
-{
-    return addr;
-}
-
 static Property cpu_common_props[] = {
 #ifndef CONFIG_USER_ONLY
     /* Create a memory property for softmmu CPU object,
@@ -421,7 +416,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
-    k->adjust_watchpoint_address = cpu_adjust_watchpoint_address;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 51ed600bf9..3d9a9c39bd 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -894,7 +894,10 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         return;
     }
 
-    addr = cc->adjust_watchpoint_address(cpu, addr, len);
+    if (cc->tcg_ops.adjust_watchpoint_address) {
+        /* this is currently used only by ARM BE32 */
+        addr = cc->tcg_ops.adjust_watchpoint_address(cpu, addr, len);
+    }
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
         if (watchpoint_address_matches(wp, addr, len)
             && (wp->flags & flags)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index aa264eec0a..2a14431065 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2284,7 +2284,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #if !defined(CONFIG_USER_ONLY)
     cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
-    cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
+    cc->tcg_ops.adjust_watchpoint_address = arm_adjust_watchpoint_address;
     cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
-- 
2.25.1


