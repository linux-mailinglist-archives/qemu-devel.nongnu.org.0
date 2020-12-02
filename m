Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A72CB689
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:15:07 +0100 (CET)
Received: from localhost ([::1]:50218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNI2-0008EX-4G
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC9-0002TO-HK
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNC4-0003ZM-FZ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w2LH23/xArIxpJl7ZtYpv/7B6/RO5ym80DOZz4brbi8=;
 b=R4InDjssvuIjuBi/JsmP9k1Xi+swUvKGHEzNBAg69xR7GVSXt3sgOv5ly1IvQWKqEd65wI
 2IVMlOybJ4vsPe0UG2xDwM72GBwmObtvZLWZ9t/+LWtKtiiMxPLRFNOJWB9kMW+mPFh8cE
 KBgfQgXYLDgIAE87M7VsjAjfvG1mFDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-A4sgLo49My2LAitZpAZkfA-1; Wed, 02 Dec 2020 03:08:53 -0500
X-MC-Unique: A4sgLo49My2LAitZpAZkfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63681006C82
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:52 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B27F610013BD
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:08:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 007/113] dma: Document address_space_map/address_space_unmap()
 prototypes
Date: Wed,  2 Dec 2020 03:07:03 -0500
Message-Id: <20201202080849.4125477-8-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Add documentation based on address_space_map / address_space_unmap.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201023151923.3243652-4-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/dma.h | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 80c5bc3e02..c6e12b4c24 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -1,7 +1,7 @@
 /*
  * DMA helper functions
  *
- * Copyright (c) 2009 Red Hat
+ * Copyright (c) 2009, 2020 Red Hat
  *
  * This work is licensed under the terms of the GNU General Public License
  * (GNU GPL), version 2 or later.
@@ -125,6 +125,19 @@ static inline int dma_memory_write(AddressSpace *as, dma_addr_t addr,
 
 int dma_memory_set(AddressSpace *as, dma_addr_t addr, uint8_t c, dma_addr_t len);
 
+/**
+ * address_space_map: Map a physical memory region into a host virtual address.
+ *
+ * May map a subset of the requested range, given by and returned in @plen.
+ * May return %NULL and set *@plen to zero(0), if resources needed to perform
+ * the mapping are exhausted.
+ * Use only for reads OR writes - not for read-modify-write operations.
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @len: pointer to length of buffer; updated on return
+ * @dir: indicates the transfer direction
+ */
 static inline void *dma_memory_map(AddressSpace *as,
                                    dma_addr_t addr, dma_addr_t *len,
                                    DMADirection dir)
@@ -138,6 +151,20 @@ static inline void *dma_memory_map(AddressSpace *as,
     return p;
 }
 
+/**
+ * address_space_unmap: Unmaps a memory region previously mapped
+ *                      by dma_memory_map()
+ *
+ * Will also mark the memory as dirty if @dir == %DMA_DIRECTION_FROM_DEVICE.
+ * @access_len gives the amount of memory that was actually read or written
+ * by the caller.
+ *
+ * @as: #AddressSpace used
+ * @buffer: host pointer as returned by address_space_map()
+ * @len: buffer length as returned by address_space_map()
+ * @dir: indicates the transfer direction
+ * @access_len: amount of data actually transferred
+ */
 static inline void dma_memory_unmap(AddressSpace *as,
                                     void *buffer, dma_addr_t len,
                                     DMADirection dir, dma_addr_t access_len)
-- 
2.26.2



