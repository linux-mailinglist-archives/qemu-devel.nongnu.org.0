Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEC32CB673
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:12:12 +0100 (CET)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNFD-0004nO-JL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:12:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC7-0002QE-Mo
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:08:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC4-0003ZJ-Dq
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:08:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v8PALb00Zd2/H2U2mdRZ/xj/msCDT1iGPKd8DVpLsg0=;
 b=T/jbI/BVxuUOwEaaKKV75J4yxBCN1tnIlrcIQ1gqgdpcI1CgQLhW9tXbPUWlzA7wslu+EH
 oTnYYqsH3iEWrFXMIU9qtcGcVtwXDwv8u6zpZJ0s+JgEjV5fqqFN42Q62/cjRVwSruw1ce
 1pQVicm4I2ToWbZ//pQ8JX09wZ0pxfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-qfnDuV6lMvuaRDylmHIwbw-1; Wed, 02 Dec 2020 03:08:54 -0500
X-MC-Unique: qfnDuV6lMvuaRDylmHIwbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D558558F0
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E0CB10013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 008/113] dma: Let dma_memory_set() propagate MemTxResult
Date: Wed,  2 Dec 2020 03:07:04 -0500
Message-Id: <20201202080849.4125477-9-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

address_space_write() returns a MemTxResult type.
Do not discard it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201023151923.3243652-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/dma.h  | 15 ++++++++++++++-
 softmmu/dma-helpers.c |  7 ++++---
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index c6e12b4c24..37cd9f1121 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -123,7 +123,20 @@ static inline int dma_memory_write(AddressSpace *as, dma_addr_t addr,
                          DMA_DIRECTION_FROM_DEVICE);
 }
 
-int dma_memory_set(AddressSpace *as, dma_addr_t addr, uint8_t c, dma_addr_t len);
+/**
+ * dma_memory_set: Fill memory with a constant byte from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @c: constant byte to fill the memory
+ * @len: the number of bytes to fill with the constant byte
+ */
+MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
+                           uint8_t c, dma_addr_t len);
 
 /**
  * address_space_map: Map a physical memory region into a host virtual address.
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 03c92e0cc6..29001b5459 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -1,7 +1,7 @@
 /*
  * DMA helper functions
  *
- * Copyright (c) 2009 Red Hat
+ * Copyright (c) 2009,2020 Red Hat
  *
  * This work is licensed under the terms of the GNU General Public License
  * (GNU GPL), version 2 or later.
@@ -18,14 +18,15 @@
 
 /* #define DEBUG_IOMMU */
 
-int dma_memory_set(AddressSpace *as, dma_addr_t addr, uint8_t c, dma_addr_t len)
+MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
+                           uint8_t c, dma_addr_t len)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
 #define FILLBUF_SIZE 512
     uint8_t fillbuf[FILLBUF_SIZE];
     int l;
-    bool error = false;
+    MemTxResult error = MEMTX_OK;
 
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
-- 
2.26.2



