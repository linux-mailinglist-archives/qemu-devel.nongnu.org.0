Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5A2789F5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:51:52 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLo8d-00053g-BA
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo6A-0002cB-S6
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:49:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo67-0000kx-J3
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:49:18 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601041751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n7WJt6aP9FRh7ANbQTFO8w3xDn6Lth8lc2RIhYZlSKE=;
 b=NWzEfWiiI6daTCpIPL7YdhqEXFibsdYsYnLCVOvY/KthbnGWcq+MZ2q6b5PjnCY1KqajgX
 kY5vuhvaf1YAr6FAEe//SwvS32FG7H2OPcI9btqxMNJK059VOJ3O0dGsTAJntn3l5aQWi0
 vZfYi9ulg9wowq2usJWY/GmlxvIEt2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-C6CLpOndPY-6i44u3Gc0uw-1; Fri, 25 Sep 2020 09:49:07 -0400
X-MC-Unique: C6CLpOndPY-6i44u3Gc0uw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FB10640A1;
 Fri, 25 Sep 2020 13:49:06 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30E975D9DC;
 Fri, 25 Sep 2020 13:49:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 1/3] util/vfio-helpers: Collect IOVA reserved regions
Date: Fri, 25 Sep 2020 15:48:43 +0200
Message-Id: <20200925134845.21053-2-eric.auger@redhat.com>
In-Reply-To: <20200925134845.21053-1-eric.auger@redhat.com>
References: <20200925134845.21053-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, kwolf@redhat.com, cohuck@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The IOVA allocator currently ignores host reserved regions.
As a result some chosen IOVAs may collide with some of them,
resulting in VFIO MAP_DMA errors later on. This happens on ARM
where the MSI reserved window quickly is encountered:
[0x8000000, 0x8100000]. since 5.4 kernel, VFIO returns the usable
IOVA regions. So let's enumerate them in the prospect to avoid
them, later on.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 util/vfio-helpers.c | 75 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 583bdfb36f..8e91beba95 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -40,6 +40,11 @@ typedef struct {
     uint64_t iova;
 } IOVAMapping;
 
+struct IOVARange {
+    uint64_t start;
+    uint64_t end;
+};
+
 struct QEMUVFIOState {
     QemuMutex lock;
 
@@ -49,6 +54,8 @@ struct QEMUVFIOState {
     int device;
     RAMBlockNotifier ram_notifier;
     struct vfio_region_info config_region_info, bar_region_info[6];
+    struct IOVARange *usable_iova_ranges;
+    uint8_t nb_iova_ranges;
 
     /* These fields are protected by @lock */
     /* VFIO's IO virtual address space is managed by splitting into a few
@@ -236,6 +243,36 @@ static int qemu_vfio_pci_write_config(QEMUVFIOState *s, void *buf, int size, int
     return ret == size ? 0 : -errno;
 }
 
+static void collect_usable_iova_ranges(QEMUVFIOState *s, void *first_cap)
+{
+    struct vfio_iommu_type1_info_cap_iova_range *cap_iova_range;
+    struct vfio_info_cap_header *cap = first_cap;
+    void *offset = first_cap;
+    int i;
+
+    while (cap->id != VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) {
+        if (cap->next) {
+            return;
+        }
+        offset += cap->next;
+        cap = (struct vfio_info_cap_header *)cap;
+    }
+
+    cap_iova_range = (struct vfio_iommu_type1_info_cap_iova_range *)cap;
+
+    s->nb_iova_ranges = cap_iova_range->nr_iovas;
+    if (s->nb_iova_ranges > 1) {
+        s->usable_iova_ranges =
+            g_realloc(s->usable_iova_ranges,
+                      s->nb_iova_ranges * sizeof(struct IOVARange));
+    }
+
+    for (i = 0; i <  s->nb_iova_ranges; i++) {
+        s->usable_iova_ranges[i].start = cap_iova_range->iova_ranges[i].start;
+        s->usable_iova_ranges[i].end = cap_iova_range->iova_ranges[i].end;
+    }
+}
+
 static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
                               Error **errp)
 {
@@ -243,10 +280,13 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
     int i;
     uint16_t pci_cmd;
     struct vfio_group_status group_status = { .argsz = sizeof(group_status) };
-    struct vfio_iommu_type1_info iommu_info = { .argsz = sizeof(iommu_info) };
+    struct vfio_iommu_type1_info *iommu_info = NULL;
+    size_t iommu_info_size = sizeof(*iommu_info);
     struct vfio_device_info device_info = { .argsz = sizeof(device_info) };
     char *group_file = NULL;
 
+    s->usable_iova_ranges = NULL;
+
     /* Create a new container */
     s->container = open("/dev/vfio/vfio", O_RDWR);
 
@@ -310,13 +350,38 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
         goto fail;
     }
 
+    iommu_info = g_malloc0(iommu_info_size);
+    iommu_info->argsz = iommu_info_size;
+
     /* Get additional IOMMU info */
-    if (ioctl(s->container, VFIO_IOMMU_GET_INFO, &iommu_info)) {
+    if (ioctl(s->container, VFIO_IOMMU_GET_INFO, iommu_info)) {
         error_setg_errno(errp, errno, "Failed to get IOMMU info");
         ret = -errno;
         goto fail;
     }
 
+    /*
+     * if the kernel does not report usable IOVA regions, choose
+     * the legacy [QEMU_VFIO_IOVA_MIN, QEMU_VFIO_IOVA_MAX -1] region
+     */
+    s->nb_iova_ranges = 1;
+    s->usable_iova_ranges = g_new0(struct IOVARange, 1);
+    s->usable_iova_ranges[0].start = QEMU_VFIO_IOVA_MIN;
+    s->usable_iova_ranges[0].end = QEMU_VFIO_IOVA_MAX - 1;
+
+    if (iommu_info->argsz > iommu_info_size) {
+        void *first_cap;
+
+        iommu_info_size = iommu_info->argsz;
+        iommu_info = g_realloc(iommu_info, iommu_info_size);
+        if (ioctl(s->container, VFIO_IOMMU_GET_INFO, iommu_info)) {
+            ret = -errno;
+            goto fail;
+        }
+        first_cap = (void *)iommu_info + iommu_info->cap_offset;
+        collect_usable_iova_ranges(s, first_cap);
+    }
+
     s->device = ioctl(s->group, VFIO_GROUP_GET_DEVICE_FD, device);
 
     if (s->device < 0) {
@@ -365,8 +430,12 @@ static int qemu_vfio_init_pci(QEMUVFIOState *s, const char *device,
     if (ret) {
         goto fail;
     }
+    g_free(iommu_info);
     return 0;
 fail:
+    g_free(s->usable_iova_ranges);
+    s->nb_iova_ranges = 0;
+    g_free(iommu_info);
     close(s->group);
 fail_container:
     close(s->container);
@@ -716,6 +785,8 @@ void qemu_vfio_close(QEMUVFIOState *s)
         qemu_vfio_undo_mapping(s, &s->mappings[i], NULL);
     }
     ram_block_notifier_remove(&s->ram_notifier);
+    g_free(s->usable_iova_ranges);
+    s->nb_iova_ranges = 0;
     qemu_vfio_reset(s);
     close(s->device);
     close(s->group);
-- 
2.21.3


