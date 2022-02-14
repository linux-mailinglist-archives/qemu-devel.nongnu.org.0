Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B3D4B5285
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:59:09 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbsg-0003Am-Uk
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:59:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJasM-0001yy-BD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:54:42 -0500
Received: from [2a00:1450:4864:20::12e] (port=40842
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nJasI-0006vi-UD
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:54:41 -0500
Received: by mail-lf1-x12e.google.com with SMTP id b9so6221967lfv.7
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUYnrQqqGt6VO0wBXzTWKHRMyxBgs3jc8GgoAC9EgW0=;
 b=Gy9n5Xgdtbe3O5j3G0yqY/goMl2QWCn4OmNQZ6JzdIKb1y1QxEKCJ4fVjzDjnRYVib
 xOxllatiDQWRjslQysxpQyzA/GOglRAL0lqxnlCAHc6pPIjhQz9aqzv5McSHRTou8uws
 C9ICMLuLRryhoaTiIYWg5LEXFsEkWN2u6ith8iNXQw5HTuWfa1lrRPF1z2ckKErRFvCq
 P/CV1JIrGohrH08CGR8SYa2em7KzWZllzu3t1bKF3xiSyOrBSy3vlBmOeuRS11sjErfR
 t1S1L7DKCZdXdPSEkDOcz5KICnfzgl/mv3i8LPppobFl+nlsG3Edko2EcDzK7MuxR3/K
 08Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUYnrQqqGt6VO0wBXzTWKHRMyxBgs3jc8GgoAC9EgW0=;
 b=jXUS25hR20yCMOKQiC2924eqHif2B8Ek523JCqFWneilViNes26mYbe6/+S/gy5Nd3
 P22jLjXNK/vImwxAvUJ7ENzi7Vl4XiEtopCu5QxRpIZ75vl4/22iz+4UCQvlOLhxT7U7
 4+JX3CpfYGwcYhTPmDJzr06d+Fcw9lulB80EueneBIFBX8BfOpvdDSgf0uIoErnWpAzV
 lchGS2Gpv/UqJ17kejSZ4P/KxmztWAlqvKCJl9qhFZxAZ2Ev21Smzfy/MXGaaP7HAIKp
 o5RLshfGH4CuCWds6IR5TrpRGla1+b0/ofuyClHE2sS0mjYOydDhv1flnUiRO3C0xfsi
 oZOA==
X-Gm-Message-State: AOAM532HFEV/hPEDaTCXUlezXwK6sFg8mmB57GoOJS+GhU3GcT8GPHTi
 GWZ9+Xz2Ra8wFmo0FkkH94+bJxe7viTgtw==
X-Google-Smtp-Source: ABdhPJyCKzuwdU3pvRLmPrA0EFHQ/xS6oaG8+OptFoCtY6U+gD44NO+gsiBNFRSPWvkHVh5TJWGqLA==
X-Received: by 2002:a17:907:3f26:: with SMTP id
 hq38mr10596646ejc.391.1644842857833; 
 Mon, 14 Feb 2022 04:47:37 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id kq17sm1475422ejb.205.2022.02.14.04.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:47:37 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 3/4] virtio-iommu: Support bypass domain
Date: Mon, 14 Feb 2022 12:43:55 +0000
Message-Id: <20220214124356.872985-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214124356.872985-1-jean-philippe@linaro.org>
References: <20220214124356.872985-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=jean-philippe@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lvivier@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The driver can create a bypass domain by passing the
VIRTIO_IOMMU_ATTACH_F_BYPASS flag on the ATTACH request. Bypass domains
perform slightly better than domains with identity mappings since they
skip translation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/virtio/virtio-iommu.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 4ca36db4ac..239fe97b12 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -43,6 +43,7 @@
 
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
+    bool bypass;
     GTree *mappings;
     QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
 } VirtIOIOMMUDomain;
@@ -258,12 +259,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
 }
 
 static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
-                                                  uint32_t domain_id)
+                                                  uint32_t domain_id,
+                                                  bool bypass)
 {
     VirtIOIOMMUDomain *domain;
 
     domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
     if (domain) {
+        if (domain->bypass != bypass) {
+            return NULL;
+        }
         return domain;
     }
     domain = g_malloc0(sizeof(*domain));
@@ -271,6 +276,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
     domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                    NULL, (GDestroyNotify)g_free,
                                    (GDestroyNotify)g_free);
+    domain->bypass = bypass;
     g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
     QLIST_INIT(&domain->endpoint_list);
     trace_virtio_iommu_get_domain(domain_id);
@@ -334,11 +340,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
 {
     uint32_t domain_id = le32_to_cpu(req->domain);
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    uint32_t flags = le32_to_cpu(req->flags);
     VirtIOIOMMUDomain *domain;
     VirtIOIOMMUEndpoint *ep;
 
     trace_virtio_iommu_attach(domain_id, ep_id);
 
+    if (flags & ~VIRTIO_IOMMU_ATTACH_F_BYPASS) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     ep = virtio_iommu_get_endpoint(s, ep_id);
     if (!ep) {
         return VIRTIO_IOMMU_S_NOENT;
@@ -356,7 +367,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
         }
     }
 
-    domain = virtio_iommu_get_domain(s, domain_id);
+    domain = virtio_iommu_get_domain(s, domain_id,
+                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
+    if (!domain) {
+        /* Incompatible bypass flag */
+        return VIRTIO_IOMMU_S_INVAL;
+    }
     QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
 
     ep->domain = domain;
@@ -419,6 +435,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_NOENT;
     }
 
+    if (domain->bypass) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     interval = g_malloc0(sizeof(*interval));
 
     interval->low = virt_start;
@@ -464,6 +484,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     if (!domain) {
         return VIRTIO_IOMMU_S_NOENT;
     }
+
+    if (domain->bypass) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     interval.low = virt_start;
     interval.high = virt_end;
 
@@ -780,6 +805,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             entry.perm = flag;
         }
         goto unlock;
+    } else if (ep->domain->bypass) {
+        entry.perm = flag;
+        goto unlock;
     }
 
     found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
@@ -1139,8 +1167,8 @@ static const VMStateDescription vmstate_endpoint = {
 
 static const VMStateDescription vmstate_domain = {
     .name = "domain",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .pre_load = domain_preload,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(id, VirtIOIOMMUDomain),
@@ -1149,6 +1177,7 @@ static const VMStateDescription vmstate_domain = {
                         VirtIOIOMMUInterval, VirtIOIOMMUMapping),
         VMSTATE_QLIST_V(endpoint_list, VirtIOIOMMUDomain, 1,
                         vmstate_endpoint, VirtIOIOMMUEndpoint, next),
+        VMSTATE_BOOL_V(bypass, VirtIOIOMMUDomain, 2),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -1186,7 +1215,7 @@ static const VMStateDescription vmstate_virtio_iommu_device = {
     .version_id = 2,
     .post_load = iommu_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 1,
+        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
                                    &vmstate_domain, VirtIOIOMMUDomain),
         VMSTATE_UINT8_V(config.bypass, VirtIOIOMMU, 2),
         VMSTATE_END_OF_LIST()
-- 
2.35.1


