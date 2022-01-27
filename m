Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E8F49E4C8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:39:00 +0100 (CET)
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5vO-000868-Q0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sc-0005Eb-D1
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:06 -0500
Received: from [2a00:1450:4864:20::429] (port=44673
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nD5sZ-0005bi-F5
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:36:06 -0500
Received: by mail-wr1-x429.google.com with SMTP id k18so5116894wrg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJzVegTFZjehCkbbLO9OIO0TY46xdVB2cc86JEWPD7Q=;
 b=kqH69NdlcYKzv91EVnAGsSPcfYkd4YkC5mo00zBCimTfLF27106kqdrrUQHa+15tRl
 WS5v17mtkXALAXgLYJHHPIenTZXucAkx9f1ZmEg6s5rzBowhPgcyIOf9PAong0wUpUre
 OhPYZn3rdB5pVxpz6u2aF54CBi5+uj63cUOgQBbCXzGdfDKIjOvcQytDiLfHbbLx/7Gh
 n9chdihSld28BAKQ2i/zJAJzG4JE/HWKt2wmGAC01oF7Ou7qz0IDBqXEA86v5RAarcYx
 r5x6d/Ylfz9/mCSWzf4vW30QsA/WFuRah1sl0eWXHIvVV6qddWmCcp25FP1sOwmxS8EL
 vt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJzVegTFZjehCkbbLO9OIO0TY46xdVB2cc86JEWPD7Q=;
 b=UCTKg82EBfTl2Mo3+ZIYEEkrkt1jCxeGpkDNjKLnN37pf9+H9eCpKi9/UpzC7pf5/p
 ebP9PvGKY0YNqUoJAc5DU5cpr2oJFNPdxcFoG5oBTun1cxMKzqMblr6X8ufeoGYvO+W/
 d/ryrpmM5qTbZDm0M//qg7QA/d2BfROdzU7Pkm7NjBtnY7lje5d6WqrM5/kA8YJbm78d
 v5R96teWN+fE3mzasOQl9kookYm/lAEXL6G6XK+BD3Oso4p4UK34mD9H+xafs7Jftv1J
 TvLqKEfCzJenq9nAs7qdlL1E9J3UqbMXJSBWTGO/NzVVUUzBmUwIppD7q5Cea+gtXXZk
 rluA==
X-Gm-Message-State: AOAM5320j2LARrWO7n3A2kKbUU9nIWUongxs1dbx1fGtsJrzbJ6TE0Iu
 QGCiEsMn+xJ8QeZYsx3aMEMpkQ==
X-Google-Smtp-Source: ABdhPJzkSCKc447AkStomd+Hqcg5TdZTv0SLvdbWDeHhXZbk9bT0s0xw41Jl4He4ljcKDIfoCDZ3eg==
X-Received: by 2002:a05:6000:170b:: with SMTP id
 n11mr3329824wrc.163.1643294159127; 
 Thu, 27 Jan 2022 06:35:59 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i3sm2285894wru.33.2022.01.27.06.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:35:58 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v2 3/4] virtio-iommu: Support bypass domain
Date: Thu, 27 Jan 2022 14:29:40 +0000
Message-Id: <20220127142940.671333-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127142940.671333-1-jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 pasic@linux.ibm.com, pbonzini@redhat.com
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
index ec02029bb6..a112428c65 100644
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
-- 
2.34.1


