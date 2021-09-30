Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8EC41E1D3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 20:55:08 +0200 (CEST)
Received: from localhost ([::1]:46738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mW1D1-0003M5-9b
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 14:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AV-0001C9-Oh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:31 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mW1AT-0004LE-P7
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 14:52:31 -0400
Received: by mail-wm1-x32b.google.com with SMTP id j27so5473517wms.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m263Z0MNZ9eUo84q1kegZSPB7SgF/ZysplashCzc5DE=;
 b=Qzb02E1vvwhwz9YJulKPE033dXvAppjtW6r8b7nywLNXl0coowTcU53r/19Fz3NJLb
 dLve29YhnYx2GrseAD/2yq7hR5jxg1I3b/NQviN+ISKoSHOwZOylFI/mmA1ibsGavAxw
 ItXy4T2x0CIPSbidH67QlNza1Xc7n3KsB5xlvDi9eZoXvv60cElelbSczohu8p6F5+nP
 n/KpLp1P9KBZEHNXz+Kw9WHnVcNAPTa2LXNeKdYR5uDW+dB9/5YFxM/XvJFiEubM5HLJ
 jFYTGIIAxvlAqf/UuQ/mGb2EV7D4OMgSKKhGTuQyhWR+kUTZdvlR1KOHi4N3YNIn0gZi
 lH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m263Z0MNZ9eUo84q1kegZSPB7SgF/ZysplashCzc5DE=;
 b=fgieLzkQgl37bFzkvVNiVhdQYELX6Wqn22yv5iycDXRFkVj7+XZpINmhN0hfYvn7ST
 Z+H1kepgbYWOC/Eg3xY2TdWFxREO8hUxjfmYlWrX0on4pFGetx5n9RVZXthJj4HW2GRJ
 AsUEaFo24sS9qdo6peZeMdkQf9ULnpyLxtlBIHtT4LRoIfiPvQIuFgf7rbJ/Vdg4rJD6
 M1aIk6casaH6CJDRyaMR10EhzCfWw4go2j6OskoXfUOhk37dG3zgRF/YMqozHzzbhwwn
 YaZgPewIoLgfqXHhpIt+dnSC6rQyuBgqZgcyclKKH46U1R/LJGCb80GNp8sw7P0KNhE6
 5Q2Q==
X-Gm-Message-State: AOAM5306mDLM86eHIzwVJCKa4tcaIt8mgovvXRWzpIeNePpI6OvzbreT
 JsN3au37eZwKWybWmvWa+ZRlTg==
X-Google-Smtp-Source: ABdhPJz1TWXDWeZ6Bd9Hf8DCiSxGmP1pmFP4JNCzscXDe5NsAg1tR+jCPGq6k1En7+XBAngsJMFGfw==
X-Received: by 2002:a05:600c:41c2:: with SMTP id
 t2mr704530wmh.16.1633027948494; 
 Thu, 30 Sep 2021 11:52:28 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l124sm5487151wml.8.2021.09.30.11.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 11:52:28 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH 3/3] virtio-iommu: Support bypass domain
Date: Thu, 30 Sep 2021 19:50:51 +0100
Message-Id: <20210930185050.262759-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930185050.262759-1-jean-philippe@linaro.org>
References: <20210930185050.262759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The driver can create a bypass domain by passing the
VIRTIO_IOMMU_ATTACH_F_BYPASS flag on the ATTACH request. Bypass domains
perform slightly better than domains with identity mappings since they
skip translation.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 82edeaa101..4f0207a3eb 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -42,6 +42,7 @@
 
 typedef struct VirtIOIOMMUDomain {
     uint32_t id;
+    bool bypass;
     GTree *mappings;
     QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
 } VirtIOIOMMUDomain;
@@ -257,12 +258,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
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
@@ -270,6 +275,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
     domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                    NULL, (GDestroyNotify)g_free,
                                    (GDestroyNotify)g_free);
+    domain->bypass = bypass;
     g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
     QLIST_INIT(&domain->endpoint_list);
     trace_virtio_iommu_get_domain(domain_id);
@@ -333,11 +339,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
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
@@ -355,7 +366,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
         }
     }
 
-    domain = virtio_iommu_get_domain(s, domain_id);
+    domain = virtio_iommu_get_domain(s, domain_id,
+                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
+    if (!domain) {
+        /* Incompatible flags */
+        return VIRTIO_IOMMU_S_INVAL;
+    }
     QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
 
     ep->domain = domain;
@@ -418,6 +434,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
         return VIRTIO_IOMMU_S_NOENT;
     }
 
+    if (domain->bypass) {
+        return VIRTIO_IOMMU_S_INVAL;
+    }
+
     interval = g_malloc0(sizeof(*interval));
 
     interval->low = virt_start;
@@ -463,6 +483,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
 
@@ -779,6 +804,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
             entry.perm = flag;
         }
         goto unlock;
+    } else if (ep->domain->bypass) {
+        entry.perm = flag;
+        goto unlock;
     }
 
     found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
-- 
2.33.0


