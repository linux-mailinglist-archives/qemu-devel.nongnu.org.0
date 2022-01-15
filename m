Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F948F955
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 21:39:29 +0100 (CET)
Received: from localhost ([::1]:49906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ppg-0003V1-6W
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 15:39:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnv-00025w-GW
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:39 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:52655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pnt-0002Mr-Sf
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:39 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MY6TD-1mptO11wZZ-00YSXU; Sat, 15
 Jan 2022 21:37:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] exec/memory: Extract address_space_set() from
 dma_memory_set()
Date: Sat, 15 Jan 2022 21:37:23 +0100
Message-Id: <20220115203725.3834712-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220115203725.3834712-1-laurent@vivier.eu>
References: <20220115203725.3834712-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ld+RLdf4cU9MZkXcJBneyQsqYgCHVsQRZAeWPBS8jcelhjpCUOq
 /rf1ceo3zOJPW3C9WCRe4GGMF8p372Xn6S51Cuh+zfpNJzgTvJGCRBHoCqbIxy7+TZ6a2l0
 zEy+iNphwhlEkYNvUvZMqUbHnZSw6JCuAuAek7fM/6ZnjKl6L6/zFuO0WBHK1IE9OuuWVV+
 zmjhTDZTaMUGZL02xPFMw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W15jl1dlVCs=:1bVcFb5HPydy6VA5+ZJtZP
 2y4pGj6KpKzp6snmLS7O3tUWyxRJ7h3OiENPumyK0BZh17RSmPw+KAr2985Qe6oVxiqNOGXmJ
 pJKiyxjIfATUWQoYWJd+74Pzn9ceX2gL+w8AZo1mOWxNVGYo9Xx0I7SICsLAjwoOEhyUrsCyN
 DrAZiMWS2VDkHIPcpS5v3nrAf/CshmqpQoL7jMRTrZCpH/ihhZw8EsaIMxNVFvKj90fojHP+z
 6tswUuhdvZEbM/8NiY6kTFTcgoOpsszAGzX7EnHRKRwsF3RTfHlBmfx3N5TIIXW1HIvtw3xZh
 Y+Cgf/I9w/67jHedrCUzbQwZ4gj6FCFpLHeWZX/pvnRn9ItRv4f/jK0stH3SXc3acEJ9WYqka
 3oTX0uNQfxDhaKByO/d+jfSygrQgRzbK+OKQQf3VoiMjldP4TZQ9DyymzWkyJfSHYKW8x7vQe
 0F8pNZevapbumbsQ7zS30riW2KQeiFZTj0kRiiA8pIzPZ9j1snfGmtzULjhKzyS0xn1+0YfYT
 mklp2X0eODu20DdEjkvN/vjLnYYRKVRiiFVpzyZ6o3iAp/gJCQ0wLSO+asL4ikESLPBnI9Yh5
 XtIq/vQFEBaw7HL6IRa6sQMxp47xYVhqyKhy/EDZsC2iJpcU3wGbsc5ul1xEDMLx82F2wY9qX
 s6O9QkbrHWJ/D5pRkmXibApmo3PEjqwrp8jEPFiODJIiSe+GXM3JQSWEMPz5hmWqjS48=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

dma_memory_set() does a DMA barrier, set the address space with
a constant value. The constant value filling code is not specific
to DMA and can be used for AddressSpace. Extract it as a new
helper: address_space_set().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
[lv: rebase]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 16 ++++++++++++++++
 softmmu/dma-helpers.c | 15 +--------------
 softmmu/physmem.c     | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 20f1b27377ea..c00c50943107 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2906,6 +2906,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
     }
 }
 
+/**
+ * address_space_set: Fill address space with a constant byte.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @c: constant byte to fill the memory
+ * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
+ */
+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
+                              uint8_t c, hwaddr len, MemTxAttrs attrs);
+
 #ifdef NEED_CPU_H
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index b0be1564797f..c2028b658582 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -23,20 +23,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
-#define FILLBUF_SIZE 512
-    uint8_t fillbuf[FILLBUF_SIZE];
-    int l;
-    MemTxResult error = MEMTX_OK;
-
-    memset(fillbuf, c, FILLBUF_SIZE);
-    while (len > 0) {
-        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, attrs, fillbuf, l);
-        len -= l;
-        addr += l;
-    }
-
-    return error;
+    return address_space_set(as, addr, c, len, attrs);
 }
 
 void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3524c04c2a16..dddf70edf5d2 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2927,6 +2927,25 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
     }
 }
 
+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
+                              uint8_t c, hwaddr len, MemTxAttrs attrs)
+{
+#define FILLBUF_SIZE 512
+    uint8_t fillbuf[FILLBUF_SIZE];
+    int l;
+    MemTxResult error = MEMTX_OK;
+
+    memset(fillbuf, c, FILLBUF_SIZE);
+    while (len > 0) {
+        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
+        len -= l;
+        addr += l;
+    }
+
+    return error;
+}
+
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write)
 {
-- 
2.34.1


