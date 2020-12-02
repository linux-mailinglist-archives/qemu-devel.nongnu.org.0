Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CF02CB672
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:12:10 +0100 (CET)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNFB-0004nD-S3
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC9-0002Sw-6l
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC4-0003ZO-Jw
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3E6dmaS037b/bSSBjbFSYQXI+/YdmZDp4gDJgM5wkPc=;
 b=hGguuf1tXW3v1UUQFdVmX3b5TN8DRggPMXLzanxt1Q2GfTkSOfOn8JmpQf6o7S5Pi3hDEE
 ONl67qmPtH0a7+2eMH3RRNPyZhQZjj3edcxbPqRi8bhxGwA3NE4VdjdqPEKn81S9+3dRIv
 mxisuTaUvXGlmkD1axJ9Vbu7nZk8RCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-V5aDzgbOPi6hdEHFP5I97w-1; Wed, 02 Dec 2020 03:08:54 -0500
X-MC-Unique: V5aDzgbOPi6hdEHFP5I97w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 926721006C81
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E1B210013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 009/113] dma: Let dma_memory_rw() propagate MemTxResult
Date: Wed,  2 Dec 2020 03:07:05 -0500
Message-Id: <20201202080849.4125477-10-pbonzini@redhat.com>
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

address_space_rw() returns a MemTxResult type.
Do not discard it, return it to the caller.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201023151923.3243652-6-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/dma.h | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 37cd9f1121..04687d8825 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -80,12 +80,13 @@ static inline bool dma_memory_valid(AddressSpace *as,
                                       MEMTXATTRS_UNSPECIFIED);
 }
 
-static inline int dma_memory_rw_relaxed(AddressSpace *as, dma_addr_t addr,
-                                        void *buf, dma_addr_t len,
-                                        DMADirection dir)
+static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
+                                                dma_addr_t addr,
+                                                void *buf, dma_addr_t len,
+                                                DMADirection dir)
 {
-    return (bool)address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                  buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
+    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+                            buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
 static inline int dma_memory_read_relaxed(AddressSpace *as, dma_addr_t addr,
@@ -101,9 +102,22 @@ static inline int dma_memory_write_relaxed(AddressSpace *as, dma_addr_t addr,
                                  DMA_DIRECTION_FROM_DEVICE);
 }
 
-static inline int dma_memory_rw(AddressSpace *as, dma_addr_t addr,
-                                void *buf, dma_addr_t len,
-                                DMADirection dir)
+/**
+ * dma_memory_rw: Read from or write to an address space from DMA controller.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @buf: buffer with the data transferred
+ * @len: the number of bytes to read or write
+ * @dir: indicates the transfer direction
+ */
+static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
+                                        void *buf, dma_addr_t len,
+                                        DMADirection dir)
 {
     dma_barrier(as, dir);
 
-- 
2.26.2



