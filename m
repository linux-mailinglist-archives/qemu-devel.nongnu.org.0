Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE43E03B5
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:51:47 +0200 (CEST)
Received: from localhost ([::1]:59472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBIFC-0007mC-SS
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI35-0004ln-C7
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBI33-0002Wv-MK
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6cgfPGC1Q7hET/NndgwW3RREa4+kZ9Bk4qC2KpBy1E=;
 b=Rthcnwh+Z0DD54uzIoGcTbuWHtpxyKhigz4454wGUtXAJR5YD72nn2sB/+au/Mr12FtwvK
 a2ZXcOctDRx1eT5phsd5EH48QPP8sHQ91hM8A910J/xjSuiLXIbCxfdGjDIzuEsXNc0epk
 nKncXsPu45tYKjsfdnkBQXZNPfkyMKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-f9Ry4tSiNIeYQFOKttzkWQ-1; Wed, 04 Aug 2021 10:39:07 -0400
X-MC-Unique: f9Ry4tSiNIeYQFOKttzkWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43E201940922;
 Wed,  4 Aug 2021 14:39:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D811036D05;
 Wed,  4 Aug 2021 14:39:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A1365180098C; Wed,  4 Aug 2021 16:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] tcg/module: Add tlb_flush_page to TCGModuleOps
Date: Wed,  4 Aug 2021 16:38:25 +0200
Message-Id: <20210804143826.3402872-7-kraxel@redhat.com>
In-Reply-To: <20210804143826.3402872-1-kraxel@redhat.com>
References: <20210804143826.3402872-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
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
 include/exec/exec-all.h  | 3 ---
 include/tcg/tcg-module.h | 3 +++
 accel/tcg/cputlb.c       | 1 +
 accel/tcg/tcg-module.c   | 5 +++++
 softmmu/physmem.c        | 4 ++--
 target/arm/helper.c      | 4 ++--
 6 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index ddb1ab797978..43d89699e989 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -328,9 +328,6 @@ static inline void tlb_init(CPUState *cpu)
 static inline void tlb_destroy(CPUState *cpu)
 {
 }
-static inline void tlb_flush_page(CPUState *cpu, target_ulong addr)
-{
-}
 static inline void tlb_flush_page_all_cpus(CPUState *src, target_ulong addr)
 {
 }
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index b94bfdd362ed..a903e3ee62c0 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -1,8 +1,11 @@
 #ifndef TCG_MODULE_H
 #define TCG_MODULE_H
 
+#include "exec/exec-all.h"
+
 struct TCGModuleOps {
     void (*tlb_flush)(CPUState *cpu);
+    void (*tlb_flush_page)(CPUState *cpu, target_ulong addr);
 };
 extern struct TCGModuleOps tcg;
 
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 40c3d1b65ac5..1fcdb71a10a0 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2771,6 +2771,7 @@ uint64_t cpu_ldq_code(CPUArchState *env, abi_ptr addr)
 static void tcg_module_ops_tlb(void)
 {
     tcg.tlb_flush = tlb_flush;
+    tcg.tlb_flush_page = tlb_flush_page;
 }
 
 type_init(tcg_module_ops_tlb);
diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
index a1e5728c8c1b..4d62160628bd 100644
--- a/accel/tcg/tcg-module.c
+++ b/accel/tcg/tcg-module.c
@@ -5,6 +5,11 @@ static void update_cpu_stub(CPUState *cpu)
 {
 }
 
+static void tlb_flush_page_stub(CPUState *cpu, target_ulong addr)
+{
+}
+
 struct TCGModuleOps tcg = {
     .tlb_flush = update_cpu_stub,
+    .tlb_flush_page = tlb_flush_page_stub,
 };
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index d99b4ce55d8f..845b9e99e819 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -794,7 +794,7 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
 
     in_page = -(addr | TARGET_PAGE_MASK);
     if (len <= in_page) {
-        tlb_flush_page(cpu, addr);
+        tcg.tlb_flush_page(cpu, addr);
     } else {
         tcg.tlb_flush(cpu);
     }
@@ -825,7 +825,7 @@ void cpu_watchpoint_remove_by_ref(CPUState *cpu, CPUWatchpoint *watchpoint)
 {
     QTAILQ_REMOVE(&cpu->watchpoints, watchpoint, entry);
 
-    tlb_flush_page(cpu, watchpoint->vaddr);
+    tcg.tlb_flush_page(cpu, watchpoint->vaddr);
 
     g_free(watchpoint);
 }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0848f9bcea8..047d4360b65f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -772,7 +772,7 @@ static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_page_all_cpus_synced(cs, value);
     } else {
-        tlb_flush_page(cs, value);
+        tcg.tlb_flush_page(cs, value);
     }
 }
 
@@ -799,7 +799,7 @@ static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
     if (tlb_force_broadcast(env)) {
         tlb_flush_page_all_cpus_synced(cs, value);
     } else {
-        tlb_flush_page(cs, value);
+        tcg.tlb_flush_page(cs, value);
     }
 }
 
-- 
2.31.1


