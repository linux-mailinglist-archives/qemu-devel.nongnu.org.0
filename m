Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72733E06A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:22:26 +0100 (CET)
Received: from localhost ([::1]:57618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMH8z-00061A-Hv
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2i-0005fH-H2
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2Z-0003WF-VT
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OAYmPS1ld/F4OC51Pp+PAerAmgSmDz1sEiakNbEAn+g=;
 b=hQVHEV2ikAJSQxU2oWD771ia+i0ubwiesqgqbZzufOhpZNPiEr3YtlOMmtSq3sowdUi37u
 GyE/T4ils9U9v+JXl2sJBK0vDnGByqtzglPav74R7pUcrwfo70tIbqtEq89U2no3yISeGA
 SN1DXHNA+DExDMh58WKKksQedULbRA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-aeE0HzcVMdyMcGzOD8dlfw-1; Tue, 16 Mar 2021 17:15:44 -0400
X-MC-Unique: aeE0HzcVMdyMcGzOD8dlfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F335DA40C3;
 Tue, 16 Mar 2021 21:15:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3A0550329;
 Tue, 16 Mar 2021 21:15:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] fuzz: move some DMA hooks
Date: Tue, 16 Mar 2021 17:15:26 -0400
Message-Id: <20210316211531.1649909-12-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

For the sparse-mem device, we want the fuzzer to populate entire DMA
reads from sparse-mem, rather than hooking into the individual MMIO
memory_region_dispatch_read operations. Otherwise, the fuzzer will treat
each sequential read separately (and populate it with a separate
pattern). Work around this by rearranging some DMA hooks. Since the
fuzzer has it's own logic to skip accidentally writing to MMIO regions,
we can call the DMA cb, outside the flatview_translate loop.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/memory.c  | 1 -
 softmmu/physmem.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9db47b7db6..c4730ec47a 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1440,7 +1440,6 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
-    fuzz_dma_read_cb(addr, size, mr);
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 7e8b0fab89..6a58c86750 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2831,6 +2831,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
     bool release_lock = false;
     uint8_t *buf = ptr;
 
+    fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
         if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
@@ -2841,7 +2842,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
-            fuzz_dma_read_cb(addr, len, mr);
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
             memcpy(buf, ram_ptr, l);
         }
-- 
2.26.2



