Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D620436EC3A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 16:17:00 +0200 (CEST)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc7TP-0000fP-Tk
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 10:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7QH-0005Yw-3P
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:45 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:36527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lc7QE-0004U7-Lr
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 10:13:44 -0400
Received: from quad ([82.142.25.254]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N9dbx-1lYy9V3f9x-015ZUS; Thu, 29
 Apr 2021 16:13:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] exec/memory: Extract address_space_set() from
 dma_memory_set()
Date: Thu, 29 Apr 2021 16:13:24 +0200
Message-Id: <20210429141326.69245-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429141326.69245-1-laurent@vivier.eu>
References: <20210429141326.69245-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:21ZHYbI2/DrpcalKCabwqS6hSp2aXCTwYVhUc+Kru3WSAZqfFoW
 XlElmR7a2s1FtrsZDyCt9wmK675KspaYZ7ZOoM5v4448L+6TVi3nNtYaDPKg6YpXkmy0c+G
 PTQYpr7SvogP+vhs3/jdE1WSxIjsenStzZPjD0myE9utZU5BZC/4ZtXsiV1khmUHwl3JuOz
 fLcCl9pwdRwnK9T/CCqew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yaN70zbQI/8=:emvGAiDa+XwpO5ExOpDbYv
 gcRA8pa9rjOTuymKWUYEix6zdDdC5WxG+bxAM8Ureakb61J7nIWxwmU0ak8s5eaY8wrye0Xm7
 vr0PAZmS6GWDxIA3awPOSBbPbalWIgMHiBvvnXk6rAljsJd83Y8Wb8kpYjFy/yM8mZWKreqiu
 TeGFR/H9Lw5206NQ4pf1UgsTkqDmRB8c8ocfayHlaambNmx1i67uhvJ4Ms9wXR9Q/Cs9BuKAE
 AkHKsQrxr+R+oq5J25YeHsdj7kxQJHkQ1W27Rcl3B2SD47a7lsTZpvmDwyCeFz6url6echR6J
 ZLrOkLW5Zv9F82NEViyuL9m+daKdOR4Lk3QcEiaoaViBYfi/Tg/Qj38inQOAd0Y42UaKp/JKL
 33rof0KZAqOsoN46O4AQ4J+JH55tSDc28lTHkR9KJ98zG+OkNoZfph3OGkU6/3K0dUi+8qh6J
 Hi6hg/GZ3zkXudLz05VAPDyes6z2IC2sKmSeXjikASXXBps3i+AlrX4bHBN4w4F8sr+5klWFH
 4b19KZF0TVDRQk+JNGlOrk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
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
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/exec/memory.h | 16 ++++++++++++++++
 softmmu/dma-helpers.c | 16 +---------------
 softmmu/physmem.c     | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27d..192139af58e9 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2568,6 +2568,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
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
index 7d766a5e89a3..8e1e7ad53206 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -23,21 +23,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
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
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
-        len -= l;
-        addr += l;
-    }
-
-    return error;
+    return address_space_set(as, addr, c, len, MEMTXATTRS_UNSPECIFIED);
 }
 
 void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11e3..c9117527ae71 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2891,6 +2891,25 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
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
2.31.1


