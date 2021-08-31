Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13533FC78A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:46:59 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3AI-0002Ue-Mx
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ii-0007RQ-Av
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ie-0006R0-5y
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pe1VnmXeX4WMdsVT7ST1+j8I7UtCzPwZFsJViammQWw=;
 b=d8ZNwiqyTZKvBY47PUnHGcdWvXdUJpiKJx09mJJCsiANa3F91IySYH9s9I9L5r9U5CphOk
 ImmebX9OBpXG9HZxLJGdpvDB0wXXw4BgMJVD+b+1hsHin3V7SbKe3vnsJuwpg1ksxBZyRR
 FlqSgu1ejTlE7T6vObqCl2X6ZZSKkA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-msmcjnuyPZiwNAIB0-x4dA-1; Tue, 31 Aug 2021 08:18:22 -0400
X-MC-Unique: msmcjnuyPZiwNAIB0-x4dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDECD87D572;
 Tue, 31 Aug 2021 12:18:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A26660FB8;
 Tue, 31 Aug 2021 12:18:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 615E818009DA; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/29] tcg_funcs: Add tb_invalidate_phys_range to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:34 +0200
Message-Id: <20210831121545.2874233-19-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h   | 3 +--
 include/tcg/tcg-module.h  | 2 ++
 accel/tcg/tcg-module.c    | 5 +++++
 accel/tcg/translate-all.c | 3 ++-
 cpu.c                     | 4 ++--
 linux-user/mmap.c         | 6 +++---
 softmmu/physmem.c         | 2 +-
 7 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9cb8337acee1..c27e911b65f9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -25,7 +25,6 @@
 #include "exec/cpu_ldst.h"
 #endif
 #include "sysemu/cpu-timers.h"
-#include "tcg/tcg-module.h"
 
 /* allow to see translation results - the slowdown should be negligible, so we leave it */
 #define DEBUG_DISAS
@@ -42,6 +41,7 @@ typedef ram_addr_t tb_page_addr_t;
 #endif
 
 #include "qemu/log.h"
+#include "tcg/tcg-module.h"
 
 void gen_intermediate_code(CPUState *cpu, TranslationBlock *tb, int max_insns);
 void restore_state_to_opc(CPUArchState *env, TranslationBlock *tb,
@@ -571,7 +571,6 @@ void tb_invalidate_phys_addr(tb_page_addr_t addr);
 #else
 void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs);
 #endif
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 003581b0718c..6069b056f91f 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -14,6 +14,8 @@ struct TCGModuleOps {
     void (*tcg_exec_unrealizefn)(CPUState *cpu);
     void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
     void (*tb_flush)(CPUState *cpu);
+    void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
+
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 7600951fd20b..dfd7d3bbc2e0 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -25,6 +25,10 @@ static void tcg_exec_realizefn_stub(CPUState *cpu, Error **errp)
 {
 }
 
+static void tb_invalidate_phys_range_stub(tb_page_addr_t start, tb_page_addr_t end)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -35,4 +39,5 @@ struct TCGModuleOps tcg = {
     .tcg_exec_realizefn = tcg_exec_realizefn_stub,
     .tcg_exec_unrealizefn = update_cpu_stub,
     .tb_flush = update_cpu_stub,
+    .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 3a3a60575141..e71e58aff9e7 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1777,7 +1777,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
  *
  * Called with mmap_lock held for user-mode emulation.
  */
-void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
+static void tb_invalidate_phys_range(tb_page_addr_t start, tb_page_addr_t end)
 {
     struct page_collection *pages;
     tb_page_addr_t next;
@@ -2438,6 +2438,7 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 static void tcg_module_ops_tb(void)
 {
     tcg.tb_flush = tb_flush;
+    tcg.tb_invalidate_phys_range = tb_invalidate_phys_range;
 }
 
 type_init(tcg_module_ops_tb);
diff --git a/cpu.c b/cpu.c
index b8ac817cb3fd..536bb6911a58 100644
--- a/cpu.c
+++ b/cpu.c
@@ -222,7 +222,7 @@ const char *parse_cpu_option(const char *cpu_option)
 void tb_invalidate_phys_addr(tb_page_addr_t addr)
 {
     mmap_lock();
-    tb_invalidate_phys_range(addr, addr + 1);
+    tcg.tb_invalidate_phys_range(addr, addr + 1);
     mmap_unlock();
 }
 #else
@@ -243,7 +243,7 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
         return;
     }
     ram_addr = memory_region_get_ram_addr(mr) + addr;
-    tb_invalidate_phys_range(ram_addr, ram_addr + 1);
+    tcg.tb_invalidate_phys_range(ram_addr, ram_addr + 1);
 }
 #endif
 
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 85cb03e176c1..0f4cfefe01cb 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -630,7 +630,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
     if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
         log_page_dump(__func__);
     }
-    tb_invalidate_phys_range(start, start + len);
+    tcg.tb_invalidate_phys_range(start, start + len);
     mmap_unlock();
     return start;
 fail:
@@ -734,7 +734,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
 
     if (ret == 0) {
         page_set_flags(start, start + len, 0);
-        tb_invalidate_phys_range(start, start + len);
+        tcg.tb_invalidate_phys_range(start, start + len);
     }
     mmap_unlock();
     return ret;
@@ -824,7 +824,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         page_set_flags(new_addr, new_addr + new_size,
                        prot | PAGE_VALID | PAGE_RESET);
     }
-    tb_invalidate_phys_range(new_addr, new_addr + new_size);
+    tcg.tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
     return new_addr;
 }
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 8b27827c533d..f2301f4445cc 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2696,7 +2696,7 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
     }
     if (dirty_log_mask & (1 << DIRTY_MEMORY_CODE)) {
         assert(tcg_enabled());
-        tb_invalidate_phys_range(addr, addr + length);
+        tcg.tb_invalidate_phys_range(addr, addr + length);
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
     }
     cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
-- 
2.31.1


