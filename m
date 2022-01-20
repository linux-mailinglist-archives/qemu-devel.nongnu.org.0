Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B808494A97
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:23:54 +0100 (CET)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nATfb-0007vY-0z
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASve-0006VK-Di
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:22 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:60581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASvb-0001eW-1T
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:22 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N1Ofr-1m9Asz2vTH-012lMG; Thu, 20
 Jan 2022 09:36:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] exec/memory: Extract address_space_set() from
 dma_memory_set()
Date: Thu, 20 Jan 2022 09:36:05 +0100
Message-Id: <20220120083607.1672319-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120083607.1672319-1-laurent@vivier.eu>
References: <20220120083607.1672319-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eJMrIwsDjumB4ebiBDlgTET15Pmnl0LALy6nh2Tp+K4QI0reD3Q
 gae6hXZhFIL9fM9wrxq3gjbqln1Iz5YNjKJLBYqm3MSuCspDbT56dz2Po+iT4mdXmp9POzQ
 NHKfWTmz8c/oaEFVn4OmRyVKBXzfJqlQfbUI12HqWJZyTSefgFD3EV/jiHF52wwcZ84Vclc
 Zxp17nuZXKV1mQ4Q0GkFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DbXVSvwfV34=:jxBBN/NKT71MNFHjpmGQ+Z
 SIQrumGOBZKxHelhEwbZex0y3pNLlmHsJVOsPa7OBLgnzkpazhwiYnepfNqFnGZ7dFXtQOsnJ
 iFlcBVZdGScZdS0W9KJTZXInBTeUkqdRPhakervEm5m1ejPanNGwdtGLmt683GjVspIpNwwzL
 MXuAhx0usZ4cs4pu7o7UVwdfwanuH2j+6KrqS3NYJ7ndvqmFgoAwl7awATcTYJg1yRClUofdl
 wVQ/Iik6XFRXsgFazvI5wf9pQq+y1cBIBNnJqeuG/C5ZvU7JiYJEAh3NBy3+rPL9Z1HPZdYqC
 N0SHZ1PJeqdj8PKfg+InVgjMYGLa9VKsekz0nwzO+Mz1/HknhYL4c6jnzvTafD1TofUwaEmv+
 tI6ZXCSAaieqxRajl7pWnSt8D2uN8SejIl9bPqGntI8AAQX0Q0Pt0Lyf1eV/lOthhMpjyK2cF
 d9p5v/+CqDlSy9ACTKd6vzaRwI64JKIrg/CqEjyaNRDf+MJHw/WKPAYnclQOcbfditdtJoSWC
 OuTruS/UtFXBnutYPIGn16c4eGOnHuNgXeUrbish8oOddZzDi/Zay04ZQwxOuSofHGgGsNsoZ
 Rrh1jOnyhpOT5KeqQxaGoMvxIefDGA4SOh+2Ql7yq8wW2BQoZKdKFdvRs/6Auxvv9KKOdSHhO
 QxcskU5guy+9PDVeGqr8KQrhx/tPKz3X/+BxDdo4yJsyDtNjrAaxtJYg+YsWHGX4eEzk=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220115203725.3834712-2-laurent@vivier.eu>
---
 include/exec/memory.h | 16 ++++++++++++++++
 softmmu/dma-helpers.c | 15 +--------------
 softmmu/physmem.c     | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 14 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 63be794a0672..4d5997e6bbae 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2908,6 +2908,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
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
index 1c6fba6a112e..160095e4ba7c 100644
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


