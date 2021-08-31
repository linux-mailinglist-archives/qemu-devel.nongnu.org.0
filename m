Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75233FC76E
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:40:23 +0200 (CEST)
Received: from localhost ([::1]:46476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL33u-0008VM-Ma
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2iu-0007mj-Ig
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ir-0006aX-D6
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p11PRkJOJjAxargU1dz9TBF2UP/nwlBlyI4WqujO8tw=;
 b=Fh0oGeUPSQ8KggBU+PoAbrZ2SlpnVpuhTseFeL+8EjtlP5z51Rmnm8vzN/tEwra4xw2OmO
 hiq2GB9KaCZDNQidPxPfjyTCRVdnHK/jXTWWUKwwf/eZU/m7w/d4behPdR9uRkE2R8TVq7
 rPnE9ULQ+snj9dC5t1d1Hm6nmCdFbys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-R-rFrnRJOSG5W3eEQBxamA-1; Tue, 31 Aug 2021 08:18:35 -0400
X-MC-Unique: R-rFrnRJOSG5W3eEQBxamA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E18802C8F;
 Tue, 31 Aug 2021 12:18:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687FA5D6D5;
 Tue, 31 Aug 2021 12:18:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B837D18009E5; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/29] tcg_funcs: Add curr_cflags to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:37 +0200
Message-Id: <20210831121545.2874233-22-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 include/exec/exec-all.h   | 2 +-
 include/tcg/tcg-module.h  | 1 +
 accel/tcg/cpu-exec.c      | 3 ++-
 accel/tcg/tcg-module.c    | 6 ++++++
 accel/tcg/translate-all.c | 6 +++---
 softmmu/physmem.c         | 4 ++--
 6 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 546db9416f43..d3cd6bf4988a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -563,7 +563,7 @@ static inline uint32_t tb_cflags(const TranslationBlock *tb)
 }
 
 /* current cflags for hashing/comparison */
-uint32_t curr_cflags(CPUState *cpu);
+// FIXME: docs
 
 /* TranslationBlock invalidate API */
 #if defined(CONFIG_USER_ONLY)
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 01205ad8fd34..e9c0615b51d9 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -17,6 +17,7 @@ struct TCGModuleOps {
     void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
     void (*tb_check_watchpoint)(CPUState *cpu, uintptr_t retaddr);
     bool (*cpu_restore_state)(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
+    uint32_t (*curr_cflags)(CPUState *cpu);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index d41d1d2bd24f..54d10a06914c 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -145,7 +145,7 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
-uint32_t curr_cflags(CPUState *cpu)
+static uint32_t curr_cflags(CPUState *cpu)
 {
     uint32_t cflags = cpu->tcg_cflags;
 
@@ -1036,6 +1036,7 @@ static void tcg_module_ops_exec(void)
 {
     tcg.tcg_exec_realizefn = tcg_exec_realizefn;
     tcg.tcg_exec_unrealizefn = tcg_exec_unrealizefn;
+    tcg.curr_cflags = curr_cflags;
 }
 
 type_init(tcg_module_ops_exec);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 61ad3a648767..f307975caff2 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -38,6 +38,11 @@ static bool cpu_restore_state_stub(CPUState *cpu, uintptr_t searched_pc, bool wi
     return false;
 }
 
+static uint32_t curr_cflags_stub(CPUState *cpu)
+{
+    return 0;
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -51,4 +56,5 @@ struct TCGModuleOps tcg = {
     .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
     .tb_check_watchpoint = tb_check_watchpoint_stub,
     .cpu_restore_state = cpu_restore_state_stub,
+    .curr_cflags = curr_cflags_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 836ac0565e01..5ec7139a75bf 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1761,7 +1761,7 @@ tb_invalidate_phys_page_range__locked(struct page_collection *pages,
     if (current_tb_modified) {
         page_collection_unlock(pages);
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
         mmap_unlock();
         cpu_loop_exit_noexc(cpu);
     }
@@ -1900,7 +1900,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #ifdef TARGET_HAS_PRECISE_SMC
     if (current_tb_modified) {
         /* Force execution of one insn next time.  */
-        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+        cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
         return true;
     }
 #endif
@@ -1976,7 +1976,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
      * operations only (which execute after completion) so we don't
      * double instrument the instruction.
      */
-    cpu->cflags_next_tb = curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
+    cpu->cflags_next_tb = tcg.curr_cflags(cpu) | CF_MEMI_ONLY | CF_LAST_IO | n;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, tb->pc,
                            "cpu_io_recompile: rewound execution of TB to "
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 76b6e16d9466..4b57d2f1d8aa 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -911,7 +911,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                  */
                 if (!cpu->can_do_io) {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | CF_LAST_IO | curr_cflags(cpu);
+                    cpu->cflags_next_tb = 1 | CF_LAST_IO | tcg.curr_cflags(cpu);
                     cpu_loop_exit_restore(cpu, ra);
                 }
                 /*
@@ -944,7 +944,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                     cpu_loop_exit_restore(cpu, ra);
                 } else {
                     /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags(cpu);
+                    cpu->cflags_next_tb = 1 | tcg.curr_cflags(cpu);
                     mmap_unlock();
                     if (ra) {
                         tcg.cpu_restore_state(cpu, ra, true);
-- 
2.31.1


