Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1C9B646
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 20:40:01 +0200 (CEST)
Received: from localhost ([::1]:60902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1ETg-0004ls-Ah
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 14:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1ENn-0007zR-NX
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:33:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1ENm-0007jx-3I
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:33:55 -0400
Received: from nsstlmta24p.bpe.bigpond.com ([203.38.21.24]:59079)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>) id 1i1ENl-0007hK-GF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:33:54 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep24p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823183349.SCUZ28148.nsstlfep24p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:33:49 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeotghohhhutghksehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehmshhtsehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeorhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440CDB185E; Sat, 24 Aug 2019 04:33:49 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:36:44 +1000
Message-Id: <ebf1f78029d5ac1de1739a11d679740a87a1f02f.1566466906.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566466906.git.tony.nguyen@bt.com>
References: <cover.1566466906.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.24
Subject: [Qemu-devel] [PATCH v9 06/20] hw/virtio: Access MemoryRegion with
 MemOp
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/virtio/virtio-pci.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 8babd92e59..82c5e87a44 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -17,6 +17,7 @@
 
 #include "qemu/osdep.h"
 
+#include "exec/memop.h"
 #include "standard-headers/linux/virtio_pci.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
@@ -552,7 +553,8 @@ void virtio_address_space_write(VirtIOPCIProxy *proxy, hwaddr addr,
         /* As length is under guest control, handle illegal values. */
         return;
     }
-    memory_region_dispatch_write(mr, addr, val, len, MEMTXATTRS_UNSPECIFIED);
+    memory_region_dispatch_write(mr, addr, val, size_memop(len),
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static void
@@ -575,7 +577,8 @@ virtio_address_space_read(VirtIOPCIProxy *proxy, hwaddr addr,
     /* Make sure caller aligned buf properly */
     assert(!(((uintptr_t)buf) & (len - 1)));
 
-    memory_region_dispatch_read(mr, addr, &val, len, MEMTXATTRS_UNSPECIFIED);
+    memory_region_dispatch_read(mr, addr, &val, size_memop(len),
+                                MEMTXATTRS_UNSPECIFIED);
     switch (len) {
     case 1:
         pci_set_byte(buf, val);
-- 
2.23.0


