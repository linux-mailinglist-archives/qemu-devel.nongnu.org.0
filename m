Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF892A5D77
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 05:59:07 +0100 (CET)
Received: from localhost ([::1]:60160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaAt0-00009s-AA
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 23:59:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaAlA-0005Va-Ij
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 23:51:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kaAl8-0004Mc-Hv
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 23:51:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604465457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bbvtq4HGVJ/wSfBQLsW+iRV9/tlIpRrNFHMItefyjY8=;
 b=PFWwhHfiHsBK5mjQvoDtLR0SPDVb+Ex6O7sB3WKGxrk/DeSPMNj4POOBZV8P6KNYarDAEV
 pIsK910/tw4SyjMzHsA0K/YkzKMzWNzzHZral5Gg5B9J0FCKwjjcpbrWnoQEb+ib4NvgFr
 bg/zr6QHLdQ7Akxcnh0F894CyUF2L9s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-_Zba1jBtPzWzgHAE7nkH1g-1; Tue, 03 Nov 2020 23:50:56 -0500
X-MC-Unique: _Zba1jBtPzWzgHAE7nkH1g-1
Received: by mail-wr1-f70.google.com with SMTP id m20so8736419wrb.21
 for <qemu-devel@nongnu.org>; Tue, 03 Nov 2020 20:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Bbvtq4HGVJ/wSfBQLsW+iRV9/tlIpRrNFHMItefyjY8=;
 b=a32hBMddAtUzGlnPjrXVE+AjWiW/TKL15ITIu9KBbRStBesTID5KctgYDnHoUkaosk
 v6h6Owh5wgdku8mlUwf37f5MFt9rw/yJwaSo1l1V5RxfZerncGby0eX46x7s9h7LsJOC
 gLhaC8LMHunIlYTpsX6jJvhrdD8FippreWthyTtdSJutTDCollr/hiOzXbc6gUx1W6h/
 7YeNyTYBPK5b4eUctetB3PJRATAbtT79BXtJCSqyKs5ylMBOYpurzgKCOTzFd3MGyyFz
 kgLZxB4fut5kYQCma56mOdYq1v3/ZBZ2gfcpCowwYE1NmIfWGsrElxeFUXPBxMMdN3wQ
 /saw==
X-Gm-Message-State: AOAM530y2WToVb8aQfyRIR9FFef1xX40h37giB298XXVPvcTZpekPBdX
 /aYl5BAr4L+jqcBXS0eLnSQbKJV0YjibXUEqQYTimZ4jJ07Dj/obwQ/Zy8VsrPSJ1SCRQkZ4Hvp
 7YJcwsRX+12Q12/U=
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr2364010wmf.47.1604465454957; 
 Tue, 03 Nov 2020 20:50:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOxRbTVqdBUveCQH8FQrRepUEeeNdF1aKWTjm86UoIM4931kx3QFE5sm6Tz1GOxjpK11sGLA==
X-Received: by 2002:a1c:bcd6:: with SMTP id m205mr2363998wmf.47.1604465454793; 
 Tue, 03 Nov 2020 20:50:54 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id b5sm820732wrs.97.2020.11.03.20.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 20:50:54 -0800 (PST)
Date: Tue, 3 Nov 2020 23:50:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 04/38] virtio-mem: Probe THP size to determine default
 block size
Message-ID: <20201104044937.226370-5-mst@redhat.com>
References: <20201104044937.226370-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201104044937.226370-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's allow a minimum block size of 1 MiB in all configurations. Select
the default block size based on
- The page size of the memory backend.
- The THP size if the memory backend size corresponds to the real host
  page size.
- The global minimum of 1 MiB.
and warn if something smaller is configured by the user.

VIRTIO_MEM only supports Linux (depends on LINUX), so we can probe the
THP size unconditionally.

For now we only support virtio-mem on x86-64 - there isn't a user-visible
change (x86-64 only supports 2 MiB THP on the PMD level) - the default
was, and will be 2 MiB.

If we ever have THP on the PUD level (e.g., 1 GiB THP on x86-64), we
expect it to be more transparent - e.g., to only optimize fully populated
ranges unless explicitly told /configured otherwise (in contrast to PMD
THP).

Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20201008083029.9504-4-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-mem.c | 105 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 461ac68ee8..655824ff81 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -33,10 +33,83 @@
 #include "trace.h"
 
 /*
- * Use QEMU_VMALLOC_ALIGN, so no THP will have to be split when unplugging
- * memory (e.g., 2MB on x86_64).
+ * Let's not allow blocks smaller than 1 MiB, for example, to keep the tracking
+ * bitmap small.
  */
-#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)QEMU_VMALLOC_ALIGN)
+#define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
+
+#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
+    defined(__powerpc64__)
+#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
+#else
+        /* fallback to 1 MiB (e.g., the THP size on s390x) */
+#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
+#endif
+
+/*
+ * We want to have a reasonable default block size such that
+ * 1. We avoid splitting THPs when unplugging memory, which degrades
+ *    performance.
+ * 2. We avoid placing THPs for plugged blocks that also cover unplugged
+ *    blocks.
+ *
+ * The actual THP size might differ between Linux kernels, so we try to probe
+ * it. In the future (if we ever run into issues regarding 2.), we might want
+ * to disable THP in case we fail to properly probe the THP size, or if the
+ * block size is configured smaller than the THP size.
+ */
+static uint32_t thp_size;
+
+#define HPAGE_PMD_SIZE_PATH "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
+static uint32_t virtio_mem_thp_size(void)
+{
+    gchar *content = NULL;
+    const char *endptr;
+    uint64_t tmp;
+
+    if (thp_size) {
+        return thp_size;
+    }
+
+    /*
+     * Try to probe the actual THP size, fallback to (sane but eventually
+     * incorrect) default sizes.
+     */
+    if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
+        !qemu_strtou64(content, &endptr, 0, &tmp) &&
+        (!endptr || *endptr == '\n')) {
+        /*
+         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
+         * pages) or weird, fallback to something smaller.
+         */
+        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
+            warn_report("Read unsupported THP size: %" PRIx64, tmp);
+        } else {
+            thp_size = tmp;
+        }
+    }
+
+    if (!thp_size) {
+        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
+        warn_report("Could not detect THP size, falling back to %" PRIx64
+                    "  MiB.", thp_size / MiB);
+    }
+
+    g_free(content);
+    return thp_size;
+}
+
+static uint64_t virtio_mem_default_block_size(RAMBlock *rb)
+{
+    const uint64_t page_size = qemu_ram_pagesize(rb);
+
+    /* We can have hugetlbfs with a page size smaller than the THP size. */
+    if (page_size == qemu_real_host_page_size) {
+        return MAX(page_size, virtio_mem_thp_size());
+    }
+    return MAX(page_size, VIRTIO_MEM_MIN_BLOCK_SIZE);
+}
+
 /*
  * Size the usable region bigger than the requested size if possible. Esp.
  * Linux guests will only add (aligned) memory blocks in case they fully
@@ -443,10 +516,23 @@ static void virtio_mem_device_realize(DeviceState *dev, Error **errp)
     rb = vmem->memdev->mr.ram_block;
     page_size = qemu_ram_pagesize(rb);
 
+    /*
+     * If the block size wasn't configured by the user, use a sane default. This
+     * allows using hugetlbfs backends of any page size without manual
+     * intervention.
+     */
+    if (!vmem->block_size) {
+        vmem->block_size = virtio_mem_default_block_size(rb);
+    }
+
     if (vmem->block_size < page_size) {
         error_setg(errp, "'%s' property has to be at least the page size (0x%"
                    PRIx64 ")", VIRTIO_MEM_BLOCK_SIZE_PROP, page_size);
         return;
+    } else if (vmem->block_size < virtio_mem_default_block_size(rb)) {
+        warn_report("'%s' property is smaller than the default block size (%"
+                    PRIx64 " MiB)", VIRTIO_MEM_BLOCK_SIZE_PROP,
+                    virtio_mem_default_block_size(rb) / MiB);
     } else if (!QEMU_IS_ALIGNED(vmem->requested_size, vmem->block_size)) {
         error_setg(errp, "'%s' property has to be multiples of '%s' (0x%" PRIx64
                    ")", VIRTIO_MEM_REQUESTED_SIZE_PROP,
@@ -742,6 +828,18 @@ static void virtio_mem_get_block_size(Object *obj, Visitor *v, const char *name,
     const VirtIOMEM *vmem = VIRTIO_MEM(obj);
     uint64_t value = vmem->block_size;
 
+    /*
+     * If not configured by the user (and we're not realized yet), use the
+     * default block size we would use with the current memory backend.
+     */
+    if (!value) {
+        if (vmem->memdev && memory_region_is_ram(&vmem->memdev->mr)) {
+            value = virtio_mem_default_block_size(vmem->memdev->mr.ram_block);
+        } else {
+            value = virtio_mem_thp_size();
+        }
+    }
+
     visit_type_size(v, name, &value, errp);
 }
 
@@ -821,7 +919,6 @@ static void virtio_mem_instance_init(Object *obj)
 {
     VirtIOMEM *vmem = VIRTIO_MEM(obj);
 
-    vmem->block_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
     notifier_list_init(&vmem->size_change_notifiers);
     vmem->precopy_notifier.notify = virtio_mem_precopy_notify;
 
-- 
MST


