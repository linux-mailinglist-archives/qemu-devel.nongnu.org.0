Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594D3FC77B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 14:43:49 +0200 (CEST)
Received: from localhost ([::1]:54532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL37E-0005gd-Ba
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 08:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2ij-0007WD-WE
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mL2if-0006SC-Dk
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630412304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osPQ4bLKsDhnqdn8uaDB3ZlP3+Rdgg45jSXidZEEElc=;
 b=S0tmB8cBBvwsmq5gsBDK5mp6bBfGAJ+FNFedxe/Lw2Pf4J0B8HjaAxEPranCM5yC6Ht20w
 jKQmhpkx5zHJWG1Ht2ZvET1lh4L8m+PqJP9psvhzm+hMbRq/+1b2kwej1u0xrke3cMvwi/
 Fwt7SggZgrXqip/rTc/HYZrtokl8IeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-MPsc-aRfOl62WacDB5Ddsw-1; Tue, 31 Aug 2021 08:18:23 -0400
X-MC-Unique: MPsc-aRfOl62WacDB5Ddsw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C589218C8C3D;
 Tue, 31 Aug 2021 12:18:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E0860E1C;
 Tue, 31 Aug 2021 12:18:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7426E18009DD; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/29] tcg_funcs: Add tb_check_watchpoint to TCGModuleOps
Date: Tue, 31 Aug 2021 14:15:35 +0200
Message-Id: <20210831121545.2874233-20-kraxel@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/exec/translate-all.h | 1 -
 include/tcg/tcg-module.h     | 2 +-
 accel/tcg/tcg-module.c       | 5 +++++
 accel/tcg/translate-all.c    | 3 ++-
 softmmu/physmem.c            | 2 +-
 5 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/exec/translate-all.h b/include/exec/translate-all.h
index f313542cdae1..fa9cebd56c60 100644
--- a/include/exec/translate-all.h
+++ b/include/exec/translate-all.h
@@ -29,7 +29,6 @@ void page_collection_unlock(struct page_collection *set);
 void tb_invalidate_phys_page_fast(struct page_collection *pages,
                                   tb_page_addr_t start, int len,
                                   uintptr_t retaddr);
-void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr);
 
 #ifdef CONFIG_USER_ONLY
 int page_unprotect(target_ulong address, uintptr_t pc);
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index 6069b056f91f..645e8eb39e71 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -15,7 +15,7 @@ struct TCGModuleOps {
     void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
     void (*tb_flush)(CPUState *cpu);
     void (*tb_invalidate_phys_range)(tb_page_addr_t start, tb_page_addr_t end);
-
+    void (*tb_check_watchpoint)(CPUState *cpu, uintptr_t retaddr);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index dfd7d3bbc2e0..ea0c2a160a97 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -29,6 +29,10 @@ static void tb_invalidate_phys_range_stub(tb_page_addr_t start, tb_page_addr_t e
 {
 }
 
+static void tb_check_watchpoint_stub(CPUState *cpu, uintptr_t retaddr)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
     .tlb_flush_page = tlb_flush_page_stub,
@@ -40,4 +44,5 @@ struct TCGModuleOps tcg = {
     .tcg_exec_unrealizefn = update_cpu_stub,
     .tb_flush = update_cpu_stub,
     .tb_invalidate_phys_range = tb_invalidate_phys_range_stub,
+    .tb_check_watchpoint = tb_check_watchpoint_stub,
 };
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e71e58aff9e7..57129bbeb791 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1910,7 +1910,7 @@ static bool tb_invalidate_phys_page(tb_page_addr_t addr, uintptr_t pc)
 #endif
 
 /* user-mode: call with mmap_lock held */
-void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
+static void tb_check_watchpoint(CPUState *cpu, uintptr_t retaddr)
 {
     TranslationBlock *tb;
 
@@ -2439,6 +2439,7 @@ static void tcg_module_ops_tb(void)
 {
     tcg.tb_flush = tb_flush;
     tcg.tb_invalidate_phys_range = tb_invalidate_phys_range;
+    tcg.tb_check_watchpoint = tb_check_watchpoint;
 }
 
 type_init(tcg_module_ops_tb);
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index f2301f4445cc..634500fd3b7b 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -937,7 +937,7 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
                 cpu->watchpoint_hit = wp;
 
                 mmap_lock();
-                tb_check_watchpoint(cpu, ra);
+                tcg.tb_check_watchpoint(cpu, ra);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
                     cpu->exception_index = EXCP_DEBUG;
                     mmap_unlock();
-- 
2.31.1


