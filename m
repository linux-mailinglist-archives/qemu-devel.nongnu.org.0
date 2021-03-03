Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20832BCFC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:09:26 +0100 (CET)
Received: from localhost ([::1]:41484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZgL-0001Iw-KY
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZNK-0007SD-KF; Wed, 03 Mar 2021 16:49:46 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZNI-0002jF-FK; Wed, 03 Mar 2021 16:49:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id w11so25346333wrr.10;
 Wed, 03 Mar 2021 13:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ottfGjPoqRC/3E22juptG3JE4v6fY+pwU7Kpo+LVFR4=;
 b=nRIMcl+LiFaWh3K55iqaiz2Z18tEC4lkXVlScAIVZ+e87BdBMRRLTLgrXVTQWilmor
 5j8rq6JDw8aCp5pfzEiqJ7dtDzoj2ctdnHRQoDUl4cW1VFFw3TMZZIK1/MUFxlPfYn9g
 97NuDuxgleN6bcDoF7zC9wAqFOwduj+w2Ky5fLD4maWLx20lGDONl6zrjmmPy2oPSc7h
 Hdgqpr4QwnrJ96qghVkBhFpddsoyEU0botvjgsVK5rmJC5feXVkbfOArL2Ba0tikBtC7
 2r2bPQuPncweFR+1JlbjXYStle9CTmdEL+oJAf7eGhMCq7F1+ef+qzsCn1ybl1mbxb8+
 a32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ottfGjPoqRC/3E22juptG3JE4v6fY+pwU7Kpo+LVFR4=;
 b=myFyihGpg5mECV5zGNCSWHS6bSsJU0eKgwDrOFBbHV5i63ipm3dWJMnqPoXyf96Kmo
 Kkd7gT2e5pv3ipl2OFRlexei5AwOnOhPy7aqxtImlNZKbKBF03x0nnGD9rNowXq9fpd1
 lTZ1oK0t63YEfihQqQJ4MhghjJrD6i8RPS1kAHBuEHXiBUEsqw7BKpVtt2BiM1EUlepF
 nq37GfVwGJe+tDHEn+oz1pYy5+vLVL5Z9lDyjr9JUcI1j6lVBN5PWYEbwAJDTkkB8XfG
 2CEEpjWhAgB2xRXsw1uEcqgfza95w8k8PYQkDv688YD31Pjtayt7ygjioQt8zX26IVGp
 oPRw==
X-Gm-Message-State: AOAM5313sXIxqWX+efSDgLcv3z9VCLrQk9uuqAHbePW+03HWAmA3o0re
 EbLhG2y3y9X4NwUN0uiuLEzySfxcVvY=
X-Google-Smtp-Source: ABdhPJzx/NeL6Z/9tjyLRnsi6ODtSzDA70XnjVI2L7w54pMfsZWrBgPlFNiSdqAzd3SRJeKXj2zIEA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr705050wrt.111.1614808181761;
 Wed, 03 Mar 2021 13:49:41 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 12sm6911543wmw.43.2021.03.03.13.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:49:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 28/28] cpu: Move sysemu specific declarations to
 'sysemu-cpu-ops.h'
Date: Wed,  3 Mar 2021 22:47:08 +0100
Message-Id: <20210303214708.1727801-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these prototypes and declarations don't need to be exposed
on user-mode emulation. Move them to "sysemu-cpu-ops.h".

Suggested-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 164 -------------------------------
 include/hw/core/sysemu-cpu-ops.h | 155 +++++++++++++++++++++++++++++
 gdbstub.c                        |   1 +
 softmmu/physmem.c                |   1 +
 4 files changed, 157 insertions(+), 164 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 79dcc9a4e42..53598c02187 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -185,15 +185,6 @@ typedef struct CPUBreakpoint {
     QTAILQ_ENTRY(CPUBreakpoint) entry;
 } CPUBreakpoint;
 
-struct CPUWatchpoint {
-    vaddr vaddr;
-    vaddr len;
-    vaddr hitaddr;
-    MemTxAttrs hitattrs;
-    int flags; /* BP_* */
-    QTAILQ_ENTRY(CPUWatchpoint) entry;
-};
-
 #ifdef CONFIG_PLUGIN
 /*
  * For plugins we sometime need to save the resolved iotlb data before
@@ -428,76 +419,6 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
-/**
- * cpu_paging_enabled:
- * @cpu: The CPU whose state is to be inspected.
- *
- * Returns: %true if paging is enabled, %false otherwise.
- */
-bool cpu_paging_enabled(const CPUState *cpu);
-
-/**
- * cpu_get_memory_mapping:
- * @cpu: The CPU whose memory mappings are to be obtained.
- * @list: Where to write the memory mappings to.
- * @errp: Pointer for reporting an #Error.
- */
-void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
-                            Error **errp);
-
-#if !defined(CONFIG_USER_ONLY)
-
-/**
- * cpu_write_elf64_note:
- * @f: pointer to a function that writes memory to a file
- * @cpu: The CPU whose memory is to be dumped
- * @cpuid: ID number of the CPU
- * @opaque: pointer to the CPUState struct
- */
-int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque);
-
-/**
- * cpu_write_elf64_qemunote:
- * @f: pointer to a function that writes memory to a file
- * @cpu: The CPU whose memory is to be dumped
- * @cpuid: ID number of the CPU
- * @opaque: pointer to the CPUState struct
- */
-int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque);
-
-/**
- * cpu_write_elf32_note:
- * @f: pointer to a function that writes memory to a file
- * @cpu: The CPU whose memory is to be dumped
- * @cpuid: ID number of the CPU
- * @opaque: pointer to the CPUState struct
- */
-int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque);
-
-/**
- * cpu_write_elf32_qemunote:
- * @f: pointer to a function that writes memory to a file
- * @cpu: The CPU whose memory is to be dumped
- * @cpuid: ID number of the CPU
- * @opaque: pointer to the CPUState struct
- */
-int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque);
-
-/**
- * cpu_get_crash_info:
- * @cpu: The CPU to get crash information for
- *
- * Gets the previously saved crash information.
- * Caller is responsible for freeing the data.
- */
-GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
-
-#endif /* !CONFIG_USER_ONLY */
-
 /**
  * CPUDumpFlags:
  * @CPU_DUMP_CODE:
@@ -529,56 +450,6 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
  */
 void cpu_dump_statistics(CPUState *cpu, int flags);
 
-#ifndef CONFIG_USER_ONLY
-/**
- * cpu_get_phys_page_attrs_debug:
- * @cpu: The CPU to obtain the physical page address for.
- * @addr: The virtual address.
- * @attrs: Updated on return with the memory transaction attributes to use
- *         for this access.
- *
- * Obtains the physical page corresponding to a virtual one, together
- * with the corresponding memory transaction attributes to use for the access.
- * Use it only for debugging because no protection checks are done.
- *
- * Returns: Corresponding physical page address or -1 if no page found.
- */
-hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                     MemTxAttrs *attrs);
-
-/**
- * cpu_get_phys_page_debug:
- * @cpu: The CPU to obtain the physical page address for.
- * @addr: The virtual address.
- *
- * Obtains the physical page corresponding to a virtual one.
- * Use it only for debugging because no protection checks are done.
- *
- * Returns: Corresponding physical page address or -1 if no page found.
- */
-hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
-
-/**
- * cpu_asidx_from_attrs:
- * @cpu: CPU
- * @attrs: memory transaction attributes
- *
- * Returns the address space index specifying the CPU AddressSpace
- * to use for a memory access with the given transaction attributes.
- */
-int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
-
-/**
- * cpu_virtio_is_big_endian:
- * @cpu: CPU
-
- * Returns %true if a CPU which supports runtime configurable endianness
- * is currently big-endian.
- */
-bool cpu_virtio_is_big_endian(CPUState *cpu);
-
-#endif /* CONFIG_USER_ONLY */
-
 /**
  * cpu_list_add:
  * @cpu: The CPU to be added to the list of CPUs.
@@ -917,41 +788,6 @@ static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, int mask)
     return false;
 }
 
-#ifndef CONFIG_USER_ONLY
-int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
-                          int flags, CPUWatchpoint **watchpoint);
-int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
-                          vaddr len, int flags);
-void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
-void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
-
-/**
- * cpu_check_watchpoint:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- * @attrs: memory access attributes
- * @flags: watchpoint access type
- * @ra: unwind return address
- *
- * Check for a watchpoint hit in [addr, addr+len) of the type
- * specified by @flags.  Exit via exception with a hit.
- */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra);
-
-/**
- * cpu_watchpoint_address_matches:
- * @cpu: cpu context
- * @addr: guest virtual address
- * @len: access length
- *
- * Return the watchpoint flags that apply to [addr, addr+len).
- * If no watchpoint is registered for the range, the result is 0.
- */
-int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
-#endif
-
 /**
  * cpu_get_address_space:
  * @cpu: CPU to get address space from
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 3f9a5199dd1..da66acdc87f 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -12,6 +12,15 @@
 
 #include "hw/core/cpu.h"
 
+struct CPUWatchpoint {
+    vaddr vaddr;
+    vaddr len;
+    vaddr hitaddr;
+    MemTxAttrs hitattrs;
+    int flags; /* BP_* */
+    QTAILQ_ENTRY(CPUWatchpoint) entry;
+};
+
 /*
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
@@ -86,4 +95,150 @@ typedef struct SysemuCPUOps {
     const VMStateDescription *vmsd;
 } SysemuCPUOps;
 
+/**
+ * cpu_paging_enabled:
+ * @cpu: The CPU whose state is to be inspected.
+ *
+ * Returns: %true if paging is enabled, %false otherwise.
+ */
+bool cpu_paging_enabled(const CPUState *cpu);
+
+/**
+ * cpu_get_memory_mapping:
+ * @cpu: The CPU whose memory mappings are to be obtained.
+ * @list: Where to write the memory mappings to.
+ * @errp: Pointer for reporting an #Error.
+ */
+void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
+                            Error **errp);
+
+/**
+ * cpu_write_elf64_note:
+ * @f: pointer to a function that writes memory to a file
+ * @cpu: The CPU whose memory is to be dumped
+ * @cpuid: ID number of the CPU
+ * @opaque: pointer to the CPUState struct
+ */
+int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque);
+
+/**
+ * cpu_write_elf64_qemunote:
+ * @f: pointer to a function that writes memory to a file
+ * @cpu: The CPU whose memory is to be dumped
+ * @cpuid: ID number of the CPU
+ * @opaque: pointer to the CPUState struct
+ */
+int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque);
+
+/**
+ * cpu_write_elf32_note:
+ * @f: pointer to a function that writes memory to a file
+ * @cpu: The CPU whose memory is to be dumped
+ * @cpuid: ID number of the CPU
+ * @opaque: pointer to the CPUState struct
+ */
+int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque);
+
+/**
+ * cpu_write_elf32_qemunote:
+ * @f: pointer to a function that writes memory to a file
+ * @cpu: The CPU whose memory is to be dumped
+ * @cpuid: ID number of the CPU
+ * @opaque: pointer to the CPUState struct
+ */
+int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque);
+
+/**
+ * cpu_get_crash_info:
+ * @cpu: The CPU to get crash information for
+ *
+ * Gets the previously saved crash information.
+ * Caller is responsible for freeing the data.
+ */
+GuestPanicInformation *cpu_get_crash_info(CPUState *cpu);
+
+/**
+ * cpu_get_phys_page_attrs_debug:
+ * @cpu: The CPU to obtain the physical page address for.
+ * @addr: The virtual address.
+ * @attrs: Updated on return with the memory transaction attributes to use
+ *         for this access.
+ *
+ * Obtains the physical page corresponding to a virtual one, together
+ * with the corresponding memory transaction attributes to use for the access.
+ * Use it only for debugging because no protection checks are done.
+ *
+ * Returns: Corresponding physical page address or -1 if no page found.
+ */
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
+
+/**
+ * cpu_get_phys_page_debug:
+ * @cpu: The CPU to obtain the physical page address for.
+ * @addr: The virtual address.
+ *
+ * Obtains the physical page corresponding to a virtual one.
+ * Use it only for debugging because no protection checks are done.
+ *
+ * Returns: Corresponding physical page address or -1 if no page found.
+ */
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+
+/**
+ * cpu_asidx_from_attrs:
+ * @cpu: CPU
+ * @attrs: memory transaction attributes
+ *
+ * Returns the address space index specifying the CPU AddressSpace
+ * to use for a memory access with the given transaction attributes.
+ */
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
+
+/**
+ * cpu_virtio_is_big_endian:
+ * @cpu: CPU
+
+ * Returns %true if a CPU which supports runtime configurable endianness
+ * is currently big-endian.
+ */
+bool cpu_virtio_is_big_endian(CPUState *cpu);
+
+int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
+                          int flags, CPUWatchpoint **watchpoint);
+int cpu_watchpoint_remove(CPUState *cpu, vaddr addr,
+                          vaddr len, int flags);
+void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint);
+void cpu_watchpoint_remove_all(CPUState *cpu, int mask);
+
+/**
+ * cpu_check_watchpoint:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ * @attrs: memory access attributes
+ * @flags: watchpoint access type
+ * @ra: unwind return address
+ *
+ * Check for a watchpoint hit in [addr, addr+len) of the type
+ * specified by @flags.  Exit via exception with a hit.
+ */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra);
+
+/**
+ * cpu_watchpoint_address_matches:
+ * @cpu: cpu context
+ * @addr: guest virtual address
+ * @len: access length
+ *
+ * Return the watchpoint flags that apply to [addr, addr+len).
+ * If no watchpoint is registered for the range, the result is 0.
+ */
+int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len);
+
 #endif /* SYSEMU_CPU_OPS_H */
diff --git a/gdbstub.c b/gdbstub.c
index f3614ebcc7a..0bc609fbf24 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -41,6 +41,7 @@
 #include "exec/gdbstub.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #endif
 
 #define MAX_PACKET_LENGTH 4096
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 19e0aa9836a..00e9729fa8a 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -28,6 +28,7 @@
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 #endif /* CONFIG_TCG */
+#include "hw/core/sysemu-cpu-ops.h"
 
 #include "exec/exec-all.h"
 #include "exec/target_page.h"
-- 
2.26.2


