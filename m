Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDE83E0389
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:42:23 +0200 (CEST)
Received: from localhost ([::1]:52518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBI6A-00031X-TW
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI3G-0005Qq-6r
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI3E-0002eL-KT
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H+14YBWFElCf83ilUITKMOxThnDWV6jDsAJEX3YGShA=;
 b=PBNpR7ggqPBIZV+6GD6zflaHqpwwnCJD20fgk2bbUd+lI5y+pLeZu5vJ4d1bTL7kkwGAHE
 NsDVKEuhQiX6HstJIG/7KYCvHtSbhzKlEiC7Sy0E/aT1FwEG5OAMFT5GLkxYtZDyEjPhsO
 OfR2Al0UliA3ZzhJHZ8Sgp/iurg9mrQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-LxnRJQF7Oa6wvweeoN8P9A-1; Wed, 04 Aug 2021 10:39:19 -0400
X-MC-Unique: LxnRJQF7Oa6wvweeoN8P9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA7FA87D541;
 Wed,  4 Aug 2021 14:39:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35510E2C1;
 Wed,  4 Aug 2021 14:39:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B58C5180098D; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tcg/module: Add tlb_reset_dirty to TCGModuleOps
Date: Wed,  4 Aug 2021 16:38:26 +0200
Message-Id: <20210804143826.3402872-8-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move stub from exec-all.h to tcg-module.c.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/exec/exec-all.h  | 1 -
 include/tcg/tcg-module.h | 3 +++
 accel/tcg/cputlb.c       | 3 ++-
 accel/tcg/tcg-module.c   | 9 +++++++++
 softmmu/physmem.c        | 2 +-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 43d89699e989..27fc489c57b5 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -691,7 +691,6 @@ tb_page_addr_t get_page_addr_code(CPUArchState *env, target_ulong addr);
 tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
                                         void **hostp);
 
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr);
 
 MemoryRegionSection *
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index a903e3ee62c0..a14dcdb002db 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -6,6 +6,9 @@
 struct TCGModuleOps {
     void (*tlb_flush)(CPUState *cpu);
     void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
+#if defined(CONFIG_SOFTMMU)
+    void (*tlb_reset_dirty)(CPUState *cpu, ram_addr_t start1, ram_addr_t length);
+#endif
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 1fcdb71a10a0..fa9c9064848c 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1004,7 +1004,7 @@ static inline void copy_tlb_helper_locked(CPUTLBEntry *d, const CPUTLBEntry *s)
  * We must take tlb_c.lock to avoid racing with another vCPU update. The only
  * thing actually updated is the target TLB entry ->addr_write flags.
  */
-void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+static void tlb_reset_dirty(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
 {
     CPUArchState *env;
 
@@ -2772,6 +2772,7 @@ static void tcg_module_ops_tlb(void)
 {
     tcg.tlb_flush = tlb_flush;
     tcg.tlb_flush_page = tlb_flush_page;
+    tcg.tlb_reset_dirty = tlb_reset_dirty;
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index 4d62160628bd..febf4e49981c 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -9,7 +9,16 @@ static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
 {
 }
 
+#if defined(CONFIG_SOFTMMU)
+static void tlb_reset_dirty_stub(CPUState *cpu, ram_addr_t start1, ram_addr_t length)
+{
+}
+#endif
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
+#if defined(CONFIG_SOFTMMU)
+    .tlb_reset_dirty = tlb_reset_dirty_stub,
+#endif
 };
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 845b9e99e819..11932746b6f9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -1015,7 +1015,7 @@ static void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
     assert(block == qemu_get_ram_block(end - 1));
     start1 = (uintptr_t)ramblock_ptr(block, start - block->offset);
     CPU_FOREACH(cpu) {
-        tlb_reset_dirty(cpu, start1, length);
+        tcg.tlb_reset_dirty(cpu, start1, length);
     }
 }
 
-- 
2.31.1


