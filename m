Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1502988C1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 09:50:56 +0100 (CET)
Received: from localhost ([::1]:56362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWyDP-0006No-7K
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 04:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kWyC0-0005XM-Cj
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:49:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1kWyBy-0002xK-Hm
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 04:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603702164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=deQXjiOEC3jhM44LhGBRYfyFJm66E8NKzSBPM5z+7KA=;
 b=SxMI5k6orhI37RJMsTuRjXROvfZny2mIl7YAClMdJy2dI/4oLB2TUde3MiodeeFOmKgRg7
 HBPXV6hRwMJzZ6D4h+sIunb+4yWKgPq65S3yOh10+wc0Wh+/u+xmQmNL9s/jSjLyyPzKv9
 5RZi/dgzMWyfxoFDEbFJpKo+BzSMhi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-oeeAWTt8MK6yH3RTIk28-Q-1; Mon, 26 Oct 2020 04:49:23 -0400
X-MC-Unique: oeeAWTt8MK6yH3RTIk28-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4717D1084C86
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 08:49:22 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48D2E5B4A4;
 Mon, 26 Oct 2020 08:49:17 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC] memory: pause all vCPUs for the duration of memory
 transactions
Date: Mon, 26 Oct 2020 09:49:16 +0100
Message-Id: <20201026084916.3103221-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, KVM doesn't provide an API to make atomic updates to memmap when
the change touches more than one memory slot, e.g. in case we'd like to
punch a hole in an existing slot.

Reports are that multi-CPU Q35 VMs booted with OVMF sometimes print something
like

!!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic ID - 00000003 !!!!
ExceptionData - 0000000000000010  I:1 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
RIP  - 000000007E35FAB6, CS  - 0000000000000038, RFLAGS - 0000000000010006
RAX  - 0000000000000000, RCX - 000000007E3598F2, RDX - 00000000078BFBFF
...

The problem seems to be that TSEG manipulations on one vCPU are not atomic
from other vCPUs views. In particular, here's the strace:

Initial creation of the 'problematic' slot:

10085 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
   memory_size=2146435072, userspace_addr=0x7fb89bf00000}) = 0

... and then the update (caused by e.g. mch_update_smram()) later:

10090 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
   memory_size=0, userspace_addr=0x7fb89bf00000}) = 0
10090 ioctl(13, KVM_SET_USER_MEMORY_REGION, {slot=6, flags=0, guest_phys_addr=0x100000,
   memory_size=2129657856, userspace_addr=0x7fb89bf00000}) = 0

In case KVM has to handle any event on a different vCPU in between these
two calls the #PF will get triggered.

An ideal solution to the problem would probably require KVM to provide a
new API to do the whole transaction in one shot but as a band-aid we can
just pause all vCPUs to make memory transations atomic.

Reported-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
RFC: Generally, memap updates happen only a few times during guest boot but
I'm not sure there are no scenarios when pausing all vCPUs is undesireable
from performance point of view. Also, I'm not sure if kvm_enabled() check
is needed.
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 softmmu/memory.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index fa280a19f7f7..0bf6f3f6d5dc 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -28,6 +28,7 @@
 
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
+#include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/tcg.h"
@@ -1057,7 +1058,9 @@ static void address_space_update_topology(AddressSpace *as)
 void memory_region_transaction_begin(void)
 {
     qemu_flush_coalesced_mmio_buffer();
-    ++memory_region_transaction_depth;
+    if ((++memory_region_transaction_depth == 1) && kvm_enabled()) {
+        pause_all_vcpus();
+    }
 }
 
 void memory_region_transaction_commit(void)
@@ -1087,7 +1090,11 @@ void memory_region_transaction_commit(void)
             }
             ioeventfd_update_pending = false;
         }
-   }
+
+        if (kvm_enabled()) {
+            resume_all_vcpus();
+        }
+    }
 }
 
 static void memory_region_destructor_none(MemoryRegion *mr)
-- 
2.25.4


