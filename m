Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E46392394
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:07:27 +0200 (CEST)
Received: from localhost ([::1]:47210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3Yc-00052m-DY
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FW-0005xS-2i
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:42 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:46981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FN-0004aP-6V
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:41 -0400
Received: by mail-pl1-x633.google.com with SMTP id d20so1407894pls.13
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PfGGDG54V+Z0/V/+AKWHcOfTeapHdTuypjBhgufuU0w=;
 b=Aq2PNBYmBol/sPj/oIA2vpVqD1YeLNautafMJZ5wGel/QzBernrUCJ77JietGIG+tn
 yAZpLJImw2uy8v5b3e4G/79fKFwyhQpxZn5BZcU+9PEG39i7WxuOp2i3YCGQrChEtQg7
 Zx2GjHfSAw04nL7fC7bAmi4h1Nqbm4UIO3pybludCyWVbG8YSz3XN2N+nT1uIatbVr4J
 xqa2ua0xr/lI111XSseHLXBt4vb95AE/LSBvOfoiEv1+7JBSd5RYE5vyo+Bg1aX7CYn2
 l1Vt2zQpXUCWqQPWPV4Wrfm80N/adCNqnMbbRrLFDHBpN6tYdpwcpaHhQtxgMjEXpJ4T
 fMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PfGGDG54V+Z0/V/+AKWHcOfTeapHdTuypjBhgufuU0w=;
 b=Uy9L1+EzUnK8AxTplbF+jsnLfD7QPfQHy8TgtPK1sBi3CoByIY0l618qQZT8VyPifZ
 zlf+n0jppBiC8rf7sNBAHh0Q9jYsMp2xBkd9JDOF+CH93aF4untAED1yX/St9eNzFUH5
 Yipx7xepJ7gV4Kr8YdHdY139xFazPHT38iSCprEFSyVYXrpgqzD/2YudjMNCNHyd7flo
 SxYEx6qV799o4cxV919NA4Nv9yqNV3neKl26qaLKDxrwe0pFKU7jzz4NTXyG06lcrwW5
 jEn46y0e1/IuWwGSIomOlQXOKWLeFbGcJYRxoIL99AK+6EwWQU1NNhtJTUUcMBCu0LE+
 u6uQ==
X-Gm-Message-State: AOAM531TP4qKrJvFZ3gAuPza7MRG70uvoPrC4CpVCakrEGM7Cy9nzIR1
 KLY5lA9RhWKRlZIJrVQdT6ltp5m9BxAL2A==
X-Google-Smtp-Source: ABdhPJz2ChYFL3KBWKha45EYW9nyMOrsICiJ8e5msoKh5Bk/WCvxtKZt7ioew41Zy2/sAmp29Vi16g==
X-Received: by 2002:a17:902:74c9:b029:fd:23e6:1bd9 with SMTP id
 f9-20020a17090274c9b02900fd23e61bd9mr618525plt.36.1622072851796; 
 Wed, 26 May 2021 16:47:31 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/31] cpu: Move CPUClass::get_crash_info to SysemuCPUOps
Date: Wed, 26 May 2021 16:47:03 -0700
Message-Id: <20210526234710.125396-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

cpu_get_crash_info() is called on GUEST_PANICKED events,
which only occur in system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210517105140.1062037-18-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h            | 1 -
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu-sysemu.c             | 4 ++--
 target/i386/cpu.c                | 2 +-
 target/s390x/cpu.c               | 2 +-
 5 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index dd3f5f996e..bf7d11b14f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -151,7 +151,6 @@ struct CPUClass {
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
-    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 8fa98bf2a7..b9383101fc 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_crash_info: Callback for reporting guest crash information in
+     * GUEST_PANICKED events.
+     */
+    GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
     /**
      * @virtio_is_big_endian: Callback to return %true if a CPU which supports
      * runtime configurable endianness is currently big-endian.
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index bad7d2cb01..90b5ac8eb9 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -138,8 +138,8 @@ GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
     CPUClass *cc = CPU_GET_CLASS(cpu);
     GuestPanicInformation *res = NULL;
 
-    if (cc->get_crash_info) {
-        res = cc->get_crash_info(cpu);
+    if (cc->sysemu_ops->get_crash_info) {
+        res = cc->sysemu_ops->get_crash_info(cpu);
     }
     return res;
 }
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 761fffee34..7761f2fa4c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6718,6 +6718,7 @@ static Property x86_cpu_properties[] = {
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_crash_info = x86_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_x86_cpu,
 };
 #endif
@@ -6752,7 +6753,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->asidx_from_attrs = x86_asidx_from_attrs;
     cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
-    cc->get_crash_info = x86_cpu_get_crash_info;
     cc->write_elf64_note = x86_cpu_write_elf64_note;
     cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
     cc->write_elf32_note = x86_cpu_write_elf32_note;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d7ab7c95b1..d2175a87f5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -480,6 +480,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps s390_sysemu_ops = {
+    .get_crash_info = s390_cpu_get_crash_info,
     .legacy_vmsd = &vmstate_s390_cpu,
 };
 #endif
@@ -524,7 +525,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = s390_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->get_crash_info = s390_cpu_get_crash_info;
     cc->write_elf64_note = s390_cpu_write_elf64_note;
     cc->sysemu_ops = &s390_sysemu_ops;
 #endif
-- 
2.25.1


