Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F3F4E2ECA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 18:08:27 +0100 (CET)
Received: from localhost ([::1]:53174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLW6-0005bk-9t
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 13:08:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRR-0001et-7J
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWLRO-00056Z-53
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 13:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647882212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIBRlGQxSXS9XF5RRmjYDMe1486AbNnuC1Dog5NgKlU=;
 b=dprMsAsoT/B3RmDiWVANrXsp9noXIxOnSfOQbru416ShMz7G0MSohz3sKzmYPYGK7aibCv
 jFSTa3+ox/JDMPkkExdU8Q+NNlnZNvNxdPVK4HgN8y9A0lgqoX9RYdRIITFQccjmyPzWhi
 adYEwMPZKJ4CheOrM8JF23cefSYvqk4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-Cm3cAreyOXmEgE4BGs4hvg-1; Mon, 21 Mar 2022 13:03:29 -0400
X-MC-Unique: Cm3cAreyOXmEgE4BGs4hvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F4B7802C16;
 Mon, 21 Mar 2022 17:03:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2035E40D2821;
 Mon, 21 Mar 2022 17:03:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/8] softmmu/physmem: Introduce MemTxAttrs::memory field and
 MEMTX_ACCESS_ERROR
Date: Mon, 21 Mar 2022 18:03:14 +0100
Message-Id: <20220321170320.282496-3-thuth@redhat.com>
In-Reply-To: <20220321170320.282496-1-thuth@redhat.com>
References: <20220321170320.282496-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add the 'memory' bit to the memory attributes to restrict bus
controller accesses to memories.

Introduce flatview_access_allowed() to check bus permission
before running any bus transaction.

Have read/write accessors return MEMTX_ACCESS_ERROR if an access is
restricted.

There is no change for the default case where 'memory' is not set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211215182421.418374-4-philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
[thuth: Replaced MEMTX_BUS_ERROR with MEMTX_ACCESS_ERROR, remove "inline"]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/memattrs.h |  9 +++++++++
 softmmu/physmem.c       | 44 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55..9fb98bc1ef 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
+    /*
+     * Bus interconnect and peripherals can access anything (memories,
+     * devices) by default. By setting the 'memory' bit, bus transaction
+     * are restricted to "normal" memories (per the AMBA documentation)
+     * versus devices. Access to devices will be logged and rejected
+     * (see MEMTX_ACCESS_ERROR).
+     */
+    unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_ACCESS_ERROR      (1U << 2) /* access denied */
 typedef uint32_t MemTxResult;
 
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 3d968ca92f..4e1b27a20e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -42,6 +42,7 @@
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
 #include "qemu/qemu-print.h"
+#include "qemu/log.h"
 #include "qemu/memalign.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
@@ -2760,6 +2761,33 @@ static bool prepare_mmio_access(MemoryRegion *mr)
     return release_lock;
 }
 
+/**
+ * flatview_access_allowed
+ * @mr: #MemoryRegion to be accessed
+ * @attrs: memory transaction attributes
+ * @addr: address within that memory region
+ * @len: the number of bytes to access
+ *
+ * Check if a memory transaction is allowed.
+ *
+ * Returns: true if transaction is allowed, false if denied.
+ */
+static bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
+                                    hwaddr addr, hwaddr len)
+{
+    if (likely(!attrs.memory)) {
+        return true;
+    }
+    if (memory_region_is_ram(mr)) {
+        return true;
+    }
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "Invalid access to non-RAM device at "
+                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
+                  "region '%s'\n", addr, len, memory_region_name(mr));
+    return false;
+}
+
 /* Called within RCU critical section.  */
 static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
                                            MemTxAttrs attrs,
@@ -2774,7 +2802,10 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
     const uint8_t *buf = ptr;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_ACCESS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, true)) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2819,6 +2850,9 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_ACCESS_ERROR;
+    }
     return flatview_write_continue(fv, addr, attrs, buf, len,
                                    addr1, l, mr);
 }
@@ -2837,7 +2871,10 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
 
     fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
-        if (!memory_access_is_direct(mr, false)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_ACCESS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
@@ -2880,6 +2917,9 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_ACCESS_ERROR;
+    }
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
-- 
2.27.0


