Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A9033E05E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:19:48 +0100 (CET)
Received: from localhost ([::1]:49118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH6R-0002Nt-V2
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2g-0005ZO-9u
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2Y-0003Va-Ro
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VIHxetl+1S54Ce2FW6zBf/iw6yqFL697K4bAPaglIkc=;
 b=DWRFPtQJm2hexEMIa5EuEH7cvbO0bb4qPmaH3s9iZjffxR/r2P4DyE0macgs5XjIBwplqv
 vq9C4cI/DA91zMBjCbRn/UPsLWE2byhrFQrsr2wyAowx02ja4rhiiJFH4JxYSO/5VZn1D3
 rBRm6VjlvOXGtP0544y+ZCzpI/J1Tlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-e20aUCI6OKqG5ceR_1zU8g-1; Tue, 16 Mar 2021 17:15:43 -0400
X-MC-Unique: e20aUCI6OKqG5ceR_1zU8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A4FBA40C0;
 Tue, 16 Mar 2021 21:15:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39320610AF;
 Tue, 16 Mar 2021 21:15:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/16] fuzz: configure a sparse-mem device, by default
Date: Tue, 16 Mar 2021 17:15:25 -0400
Message-Id: <20210316211531.1649909-11-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

The generic-fuzzer often provides randomized DMA addresses to
virtual-devices. For a 64-bit address-space, the chance of these
randomized addresses coinciding with RAM regions, is fairly small. Even
though the fuzzer's instrumentation eventually finds valid addresses,
this can take some-time, and slows-down fuzzing progress (especially,
when multiple DMA buffers are involved). To work around this, create
"fake" sparse-memory that spans all of the 64-bit address-space. Adjust
the DMA call-back to populate this sparse memory, correspondingly

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 387ae2020a..b5fe27aae1 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -28,6 +28,7 @@
 #include "hw/pci/pci.h"
 #include "hw/boards.h"
 #include "generic_fuzz_configs.h"
+#include "hw/mem/sparse-mem.h"
 
 /*
  * SEPARATOR is used to separate "operations" in the fuzz input
@@ -64,6 +65,8 @@ static useconds_t timeout = DEFAULT_TIMEOUT_US;
 
 static bool qtest_log_enabled;
 
+MemoryRegion *sparse_mem_mr;
+
 /*
  * A pattern used to populate a DMA region or perform a memwrite. This is
  * useful for e.g. populating tables of unique addresses.
@@ -191,8 +194,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
      */
     if (dma_patterns->len == 0
         || len == 0
-        || mr != current_machine->ram
-        || addr > current_machine->ram_size) {
+        || (mr != current_machine->ram && mr != sparse_mem_mr)) {
         return;
     }
 
@@ -238,7 +240,7 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       MEMTXATTRS_UNSPECIFIED);
 
         if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1))) {
+              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
             l = memory_access_size(mr1, l, addr1);
         } else {
             /* ROM/RAM case */
@@ -814,6 +816,12 @@ static void generic_pre_fuzz(QTestState *s)
     }
     qts_global = s;
 
+    /*
+     * Create a special device that we can use to back DMA buffers at very
+     * high memory addresses
+     */
+    sparse_mem_mr = sparse_mem_init(0, UINT64_MAX);
+
     dma_regions = g_array_new(false, false, sizeof(address_range));
     dma_patterns = g_array_new(false, false, sizeof(pattern));
 
-- 
2.26.2



