Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396CA2B51E5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:05:54 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekl6-00074n-HA
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke6-0001y9-Oq
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke3-0002BP-GR
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605556714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02qjzftCWqzdeB4G3PIcfBijNIHXHCCvLfAwCNWHEWI=;
 b=K3zhZD+7HkIu5RvbY4+z6WLXPqTwihPjrJHKDMiHVkNT6o7dyccDGV1VFlgYl+JGRwcgH+
 pkBAUYiwJ6JcDTRUlUeSvCHlgDrNwWL1w37BCkJoLDgvX2HqQ/TQbAfJs29IVPpM4u+PZ4
 8esXK9R5uUWOpGmfY6FeLK4Kn8UXVwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-Rs-CTJk_NMK-9Lr7GGCP1g-1; Mon, 16 Nov 2020 14:58:32 -0500
X-MC-Unique: Rs-CTJk_NMK-9Lr7GGCP1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A46D81CBDD;
 Mon, 16 Nov 2020 19:58:31 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6A719746;
 Mon, 16 Nov 2020 19:58:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/5] util/vfio-helpers.c: Use ram_block_discard_disable() in
 qemu_vfio_open_pci()
Date: Mon, 16 Nov 2020 14:58:12 -0500
Message-Id: <20201116195815.48264-3-pbonzini@redhat.com>
In-Reply-To: <20201116195815.48264-1-pbonzini@redhat.com>
References: <20201116195815.48264-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Currently, when using "nvme://" for a block device, like
    -drive file=nvme://0000:01:00.0/1,if=none,id=drive0 \
    -device virtio-blk,drive=drive0 \

VFIO may pin all guest memory, and discarding of RAM no longer works as
expected. I was able to reproduce this easily with my
    01:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd
            NVMe SSD Controller SM981/PM981/PM983

Similar to common VFIO, we have to disable it, making sure that:
a) virtio-balloon won't discard any memory ("silently disabled")
b) virtio-mem and nvme:// run mutually exclusive

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20201116105947.9194-1-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 stubs/ram-block.c   |  6 ++++++
 util/vfio-helpers.c | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/stubs/ram-block.c b/stubs/ram-block.c
index 73c0a3ee08..108197683b 100644
--- a/stubs/ram-block.c
+++ b/stubs/ram-block.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "exec/ramlist.h"
 #include "exec/cpu-common.h"
+#include "exec/memory.h"
 
 void *qemu_ram_get_host_addr(RAMBlock *rb)
 {
@@ -29,3 +30,8 @@ int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque)
 {
     return 0;
 }
+
+int ram_block_discard_disable(bool state)
+{
+    return 0;
+}
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index c469beb061..2bec48e163 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 #include "exec/ramlist.h"
 #include "exec/cpu-common.h"
+#include "exec/memory.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "standard-headers/linux/pci_regs.h"
@@ -494,8 +495,20 @@ QEMUVFIOState *qemu_vfio_open_pci(const char *device, Error **errp)
     int r;
     QEMUVFIOState *s = g_new0(QEMUVFIOState, 1);
 
+    /*
+     * VFIO may pin all memory inside mappings, resulting it in pinning
+     * all memory inside RAM blocks unconditionally.
+     */
+    r = ram_block_discard_disable(true);
+    if (r) {
+        error_setg_errno(errp, -r, "Cannot set discarding of RAM broken");
+        g_free(s);
+        return NULL;
+    }
+
     r = qemu_vfio_init_pci(s, device, errp);
     if (r) {
+        ram_block_discard_disable(false);
         g_free(s);
         return NULL;
     }
@@ -837,4 +850,5 @@ void qemu_vfio_close(QEMUVFIOState *s)
     close(s->device);
     close(s->group);
     close(s->container);
+    ram_block_discard_disable(false);
 }
-- 
2.26.2



