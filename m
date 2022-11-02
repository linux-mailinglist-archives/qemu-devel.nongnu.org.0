Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1B61686A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:21:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGL4-0002pt-W5; Wed, 02 Nov 2022 12:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL2-0002ji-RJ
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL0-0003R9-9d
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kVRFsZ5tOlNpwt90iJgpb5in64yP3rEEY2+3nFX4gMU=;
 b=IbPmV1P4hIro8gMETZqSjuHXTM6HEJnvUh0vNg0yTQzPoQEQygWGs7pX1hx3MhGJ/DGRqi
 dfIaVVl2bNLY7DvBsAMEVyWmeyvVIcdmtx+yL6QEdM9sxMx69+2AnfKRuYttmOPU3uWS9P
 eMpRaFO+Po+G8cM+OgXpgP7YhaTdYaU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-27D15A3gPW-pRGPLRzAEsQ-1; Wed, 02 Nov 2022 12:11:31 -0400
X-MC-Unique: 27D15A3gPW-pRGPLRzAEsQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 e21-20020adfa455000000b002365c221b59so5063650wra.22
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVRFsZ5tOlNpwt90iJgpb5in64yP3rEEY2+3nFX4gMU=;
 b=nW657Qt7rX8ejfLDF45/bFN8eGUkA8lGFiiMgQO7jrMMUNdLu1lR5X97A6CBn406Kj
 h+7qNelf3OHwsMDXFMk+KkGMGareVtC+PX1S8yF/J2hIxkWCgmxO03d+yoOHckV14VnW
 zbIwnClodTkCXABY6VN8VWaXn8Nm3DXn/0N44IczTYihyzUHXW/wmTjCPOS+mwWmdj1B
 rfIbzV8fAtB8GbZCtfhRqm02coDQSLwKmgORDahkilwAGQlpmW2ZcgrtFYy0hfiTjsoe
 aZPHDFaMF4OFtCEkmhMA/rQ0ckWt3ybE2hwnYTCVTL6eMHzDI6tDWmEL2PQONOS8vsvh
 Pt5Q==
X-Gm-Message-State: ACrzQf0mjffLn/Oo5vwU94MFEy+TANYBdOaJL3dCKHDyn/gg2NLULUEF
 erh9Pwja4+wC9yqNqYGyviJibH2KuG/OE3cLkqwHMTMysl3UAGjq71n3z/+aiAcxKZLNqmFMHTp
 eem8xhxViZIOBEuIoJVZM0U24Mh7yW8EdFCwxhpvNUO5nT7gf5ekg36a6FG7H
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr15227907wrm.501.1667405489519; 
 Wed, 02 Nov 2022 09:11:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6w0GoOajCc7JMcWW2sfPuzp+mEM8K4nZTCH2rRoatCxkPrNXHKzh8bPM4CgUnJEviNtNkR4Q==
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr15227848wrm.501.1667405489047; 
 Wed, 02 Nov 2022 09:11:29 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 i203-20020a1c3bd4000000b003cf7292c553sm2453277wma.13.2022.11.02.09.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:28 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Akihiko@redhat.com,
 Odaki@redhat.com, &lt@redhat.com,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-block@nongnu.org
Subject: [PULL v2 65/82] msix: Assert that specified vector is in range
Message-ID: <20221102160336.616599-66-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@gmail.com>

There were several different ways to deal with the situation where the
vector specified for a msix function is out of bound:
- early return a function and keep progresssing
- propagate the error to the caller
- mark msix unusable
- assert it is in bound
- just ignore

An out-of-bound vector should not be specified if the device
implementation is correct so let msix functions always assert that the
specified vector is in range.

An exceptional case is virtio-pci, which allows the guest to configure
vectors. For virtio-pci, it is more appropriate to introduce its own
checks because it is sometimes too late to check the vector range in
msix functions.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20220829083524.143640-1-akihiko.odaki@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
Signed-off-by: Akihiko Odaki &lt;<a href="mailto:akihiko.odaki@daynix.com" target="_blank">akihiko.odaki@daynix.com</a>&gt;<br>
---
 include/hw/pci/msix.h     |  4 +--
 hw/net/e1000e.c           | 15 ++-------
 hw/net/rocker/rocker.c    | 23 ++------------
 hw/net/vmxnet3.c          | 27 +++-------------
 hw/nvme/ctrl.c            |  5 +--
 hw/pci/msix.c             | 24 ++++++--------
 hw/rdma/vmw/pvrdma_main.c |  7 +---
 hw/remote/vfio-user-obj.c |  9 +-----
 hw/virtio/virtio-pci.c    | 67 ++++++++++++++++++++++++++++-----------
 9 files changed, 74 insertions(+), 107 deletions(-)

diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4f1cda0ebe..0e6f257e45 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -33,10 +33,10 @@ bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
 
-int msix_vector_use(PCIDevice *dev, unsigned vector);
+void msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
 void msix_unuse_all_vectors(PCIDevice *dev);
-void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp);
+void msix_set_mask(PCIDevice *dev, int vector, bool mask);
 
 void msix_notify(PCIDevice *dev, unsigned vector);
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ac96f7665a..7523e9f5d2 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -276,25 +276,18 @@ e1000e_unuse_msix_vectors(E1000EState *s, int num_vectors)
     }
 }
 
-static bool
+static void
 e1000e_use_msix_vectors(E1000EState *s, int num_vectors)
 {
     int i;
     for (i = 0; i < num_vectors; i++) {
-        int res = msix_vector_use(PCI_DEVICE(s), i);
-        if (res < 0) {
-            trace_e1000e_msix_use_vector_fail(i, res);
-            e1000e_unuse_msix_vectors(s, i);
-            return false;
-        }
+        msix_vector_use(PCI_DEVICE(s), i);
     }
-    return true;
 }
 
 static void
 e1000e_init_msix(E1000EState *s)
 {
-    PCIDevice *d = PCI_DEVICE(s);
     int res = msix_init(PCI_DEVICE(s), E1000E_MSIX_VEC_NUM,
                         &s->msix,
                         E1000E_MSIX_IDX, E1000E_MSIX_TABLE,
@@ -305,9 +298,7 @@ e1000e_init_msix(E1000EState *s)
     if (res < 0) {
         trace_e1000e_msix_init_fail(res);
     } else {
-        if (!e1000e_use_msix_vectors(s, E1000E_MSIX_VEC_NUM)) {
-            msix_uninit(d, &s->msix, &s->msix);
-        }
+        e1000e_use_msix_vectors(s, E1000E_MSIX_VEC_NUM);
     }
 }
 
diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index d8f3f16fe8..281d43e6cf 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1212,24 +1212,14 @@ static void rocker_msix_vectors_unuse(Rocker *r,
     }
 }
 
-static int rocker_msix_vectors_use(Rocker *r,
-                                   unsigned int num_vectors)
+static void rocker_msix_vectors_use(Rocker *r, unsigned int num_vectors)
 {
     PCIDevice *dev = PCI_DEVICE(r);
-    int err;
     int i;
 
     for (i = 0; i < num_vectors; i++) {
-        err = msix_vector_use(dev, i);
-        if (err) {
-            goto rollback;
-        }
+        msix_vector_use(dev, i);
     }
-    return 0;
-
-rollback:
-    rocker_msix_vectors_unuse(r, i);
-    return err;
 }
 
 static int rocker_msix_init(Rocker *r, Error **errp)
@@ -1247,16 +1237,9 @@ static int rocker_msix_init(Rocker *r, Error **errp)
         return err;
     }
 
-    err = rocker_msix_vectors_use(r, ROCKER_MSIX_VEC_COUNT(r->fp_ports));
-    if (err) {
-        goto err_msix_vectors_use;
-    }
+    rocker_msix_vectors_use(r, ROCKER_MSIX_VEC_COUNT(r->fp_ports));
 
     return 0;
-
-err_msix_vectors_use:
-    msix_uninit(dev, &r->msix_bar, &r->msix_bar);
-    return err;
 }
 
 static void rocker_msix_uninit(Rocker *r)
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 0b7acf7f89..d2ab527ef4 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2110,20 +2110,14 @@ vmxnet3_unuse_msix_vectors(VMXNET3State *s, int num_vectors)
     }
 }
 
-static bool
+static void
 vmxnet3_use_msix_vectors(VMXNET3State *s, int num_vectors)
 {
     PCIDevice *d = PCI_DEVICE(s);
     int i;
     for (i = 0; i < num_vectors; i++) {
-        int res = msix_vector_use(d, i);
-        if (0 > res) {
-            VMW_WRPRN("Failed to use MSI-X vector %d, error %d", i, res);
-            vmxnet3_unuse_msix_vectors(s, i);
-            return false;
-        }
+        msix_vector_use(d, i);
     }
-    return true;
 }
 
 static bool
@@ -2141,13 +2135,8 @@ vmxnet3_init_msix(VMXNET3State *s)
         VMW_WRPRN("Failed to initialize MSI-X, error %d", res);
         s->msix_used = false;
     } else {
-        if (!vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS)) {
-            VMW_WRPRN("Failed to use MSI-X vectors, error %d", res);
-            msix_uninit(d, &s->msix_bar, &s->msix_bar);
-            s->msix_used = false;
-        } else {
-            s->msix_used = true;
-        }
+        vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS);
+        s->msix_used = true;
     }
     return s->msix_used;
 }
@@ -2412,19 +2401,13 @@ static const VMStateDescription vmstate_vmxnet3_rxq_descr = {
 static int vmxnet3_post_load(void *opaque, int version_id)
 {
     VMXNET3State *s = opaque;
-    PCIDevice *d = PCI_DEVICE(s);
 
     net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
                     s->max_tx_frags, s->peer_has_vhdr);
     net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
 
     if (s->msix_used) {
-        if  (!vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS)) {
-            VMW_WRPRN("Failed to re-use MSI-X vectors");
-            msix_uninit(d, &s->msix_bar, &s->msix_bar);
-            s->msix_used = false;
-            return -1;
-        }
+        vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS);
     }
 
     if (!vmxnet3_validate_queues(s)) {
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 87aeba0564..d38fdd990e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4744,11 +4744,8 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl *n, uint64_t dma_addr,
                          uint16_t cqid, uint16_t vector, uint16_t size,
                          uint16_t irq_enabled)
 {
-    int ret;
-
     if (msix_enabled(&n->parent_obj)) {
-        ret = msix_vector_use(&n->parent_obj, vector);
-        assert(ret == 0);
+        msix_vector_use(&n->parent_obj, vector);
     }
     cq->ctrl = n;
     cq->cqid = cqid;
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 1e381a9813..9e70fcd6fa 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -136,17 +136,12 @@ static void msix_handle_mask_update(PCIDevice *dev, int vector, bool was_masked)
     }
 }
 
-void msix_set_mask(PCIDevice *dev, int vector, bool mask, Error **errp)
+void msix_set_mask(PCIDevice *dev, int vector, bool mask)
 {
-    ERRP_GUARD();
     unsigned offset;
     bool was_masked;
 
-    if (vector > dev->msix_entries_nr) {
-        error_setg(errp, "msix: vector %d not allocated. max vector is %d",
-                   vector, dev->msix_entries_nr);
-        return;
-    }
+    assert(vector < dev->msix_entries_nr);
 
     offset = vector * PCI_MSIX_ENTRY_SIZE + PCI_MSIX_ENTRY_VECTOR_CTRL;
 
@@ -522,7 +517,9 @@ void msix_notify(PCIDevice *dev, unsigned vector)
 {
     MSIMessage msg;
 
-    if (vector >= dev->msix_entries_nr || !dev->msix_entry_used[vector]) {
+    assert(vector < dev->msix_entries_nr);
+
+    if (!dev->msix_entry_used[vector]) {
         return;
     }
 
@@ -558,20 +555,17 @@ void msix_reset(PCIDevice *dev)
  * don't want to follow the spec suggestion can declare all vectors as used. */
 
 /* Mark vector as used. */
-int msix_vector_use(PCIDevice *dev, unsigned vector)
+void msix_vector_use(PCIDevice *dev, unsigned vector)
 {
-    if (vector >= dev->msix_entries_nr) {
-        return -EINVAL;
-    }
-
+    assert(vector < dev->msix_entries_nr);
     dev->msix_entry_used[vector]++;
-    return 0;
 }
 
 /* Mark vector as unused. */
 void msix_vector_unuse(PCIDevice *dev, unsigned vector)
 {
-    if (vector >= dev->msix_entries_nr || !dev->msix_entry_used[vector]) {
+    assert(vector < dev->msix_entries_nr);
+    if (!dev->msix_entry_used[vector]) {
         return;
     }
     if (--dev->msix_entry_used[vector]) {
diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 58db0b8e3b..4fc6712025 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -307,12 +307,7 @@ static int init_msix(PCIDevice *pdev)
     }
 
     for (i = 0; i < RDMA_MAX_INTRS; i++) {
-        rc = msix_vector_use(PCI_DEVICE(dev), i);
-        if (rc < 0) {
-            rdma_error_report("Fail mark MSI-X vector %d", i);
-            uninit_msix(pdev, i);
-            return rc;
-        }
+        msix_vector_use(PCI_DEVICE(dev), i);
     }
 
     return 0;
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c6cc53acf2..4e36bb8bcf 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -602,17 +602,10 @@ static void vfu_msix_irq_state(vfu_ctx_t *vfu_ctx, uint32_t start,
                                uint32_t count, bool mask)
 {
     VfuObject *o = vfu_get_private(vfu_ctx);
-    Error *err = NULL;
     uint32_t vector;
 
     for (vector = start; vector < count; vector++) {
-        msix_set_mask(o->pci_dev, vector, mask, &err);
-        if (err) {
-            VFU_OBJECT_ERROR(o, "vfu: %s: %s", o->device,
-                             error_get_pretty(err));
-            error_free(err);
-            err = NULL;
-        }
+        msix_set_mask(o->pci_dev, vector, mask);
     }
 }
 
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 855718d586..a1c9dfa7bb 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -71,9 +71,11 @@ static void virtio_pci_notify(DeviceState *d, uint16_t vector)
 {
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy_fast(d);
 
-    if (msix_enabled(&proxy->pci_dev))
-        msix_notify(&proxy->pci_dev, vector);
-    else {
+    if (msix_enabled(&proxy->pci_dev)) {
+        if (vector != VIRTIO_NO_VECTOR) {
+            msix_notify(&proxy->pci_dev, vector);
+        }
+    } else {
         VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
         pci_set_irq(&proxy->pci_dev, qatomic_read(&vdev->isr) & 1);
     }
@@ -175,6 +177,7 @@ static int virtio_pci_load_config(DeviceState *d, QEMUFile *f)
 {
     VirtIOPCIProxy *proxy = to_virtio_pci_proxy(d);
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    uint16_t vector;
 
     int ret;
     ret = pci_device_load(&proxy->pci_dev, f);
@@ -184,12 +187,17 @@ static int virtio_pci_load_config(DeviceState *d, QEMUFile *f)
     msix_unuse_all_vectors(&proxy->pci_dev);
     msix_load(&proxy->pci_dev, f);
     if (msix_present(&proxy->pci_dev)) {
-        qemu_get_be16s(f, &vdev->config_vector);
+        qemu_get_be16s(f, &vector);
+
+        if (vector != VIRTIO_NO_VECTOR && vector >= proxy->nvectors) {
+            return -EINVAL;
+        }
     } else {
-        vdev->config_vector = VIRTIO_NO_VECTOR;
+        vector = VIRTIO_NO_VECTOR;
     }
-    if (vdev->config_vector != VIRTIO_NO_VECTOR) {
-        return msix_vector_use(&proxy->pci_dev, vdev->config_vector);
+    vdev->config_vector = vector;
+    if (vector != VIRTIO_NO_VECTOR) {
+        msix_vector_use(&proxy->pci_dev, vector);
     }
     return 0;
 }
@@ -202,12 +210,15 @@ static int virtio_pci_load_queue(DeviceState *d, int n, QEMUFile *f)
     uint16_t vector;
     if (msix_present(&proxy->pci_dev)) {
         qemu_get_be16s(f, &vector);
+        if (vector != VIRTIO_NO_VECTOR && vector >= proxy->nvectors) {
+            return -EINVAL;
+        }
     } else {
         vector = VIRTIO_NO_VECTOR;
     }
     virtio_queue_set_vector(vdev, n, vector);
     if (vector != VIRTIO_NO_VECTOR) {
-        return msix_vector_use(&proxy->pci_dev, vector);
+        msix_vector_use(&proxy->pci_dev, vector);
     }
 
     return 0;
@@ -299,6 +310,7 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    uint16_t vector;
     hwaddr pa;
 
     switch (addr) {
@@ -352,18 +364,28 @@ static void virtio_ioport_write(void *opaque, uint32_t addr, uint32_t val)
         }
         break;
     case VIRTIO_MSI_CONFIG_VECTOR:
-        msix_vector_unuse(&proxy->pci_dev, vdev->config_vector);
+        if (vdev->config_vector != VIRTIO_NO_VECTOR) {
+            msix_vector_unuse(&proxy->pci_dev, vdev->config_vector);
+        }
         /* Make it possible for guest to discover an error took place. */
-        if (msix_vector_use(&proxy->pci_dev, val) < 0)
+        if (val < proxy->nvectors) {
+            msix_vector_use(&proxy->pci_dev, val);
+        } else {
             val = VIRTIO_NO_VECTOR;
+        }
         vdev->config_vector = val;
         break;
     case VIRTIO_MSI_QUEUE_VECTOR:
-        msix_vector_unuse(&proxy->pci_dev,
-                          virtio_queue_vector(vdev, vdev->queue_sel));
+        vector = virtio_queue_vector(vdev, vdev->queue_sel);
+        if (vector != VIRTIO_NO_VECTOR) {
+            msix_vector_unuse(&proxy->pci_dev, vector);
+        }
         /* Make it possible for guest to discover an error took place. */
-        if (msix_vector_use(&proxy->pci_dev, val) < 0)
+        if (val < proxy->nvectors) {
+            msix_vector_use(&proxy->pci_dev, val);
+        } else {
             val = VIRTIO_NO_VECTOR;
+        }
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
         break;
     default:
@@ -1266,6 +1288,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
 {
     VirtIOPCIProxy *proxy = opaque;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    uint16_t vector;
 
     if (vdev == NULL) {
         return;
@@ -1287,9 +1310,13 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
         }
         break;
     case VIRTIO_PCI_COMMON_MSIX:
-        msix_vector_unuse(&proxy->pci_dev, vdev->config_vector);
+        if (vdev->config_vector != VIRTIO_NO_VECTOR) {
+            msix_vector_unuse(&proxy->pci_dev, vdev->config_vector);
+        }
         /* Make it possible for guest to discover an error took place. */
-        if (msix_vector_use(&proxy->pci_dev, val) < 0) {
+        if (val < proxy->nvectors) {
+            msix_vector_use(&proxy->pci_dev, val);
+        } else {
             val = VIRTIO_NO_VECTOR;
         }
         vdev->config_vector = val;
@@ -1321,10 +1348,14 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
                              proxy->vqs[vdev->queue_sel].num);
         break;
     case VIRTIO_PCI_COMMON_Q_MSIX:
-        msix_vector_unuse(&proxy->pci_dev,
-                          virtio_queue_vector(vdev, vdev->queue_sel));
+        vector = virtio_queue_vector(vdev, vdev->queue_sel);
+        if (vector != VIRTIO_NO_VECTOR) {
+            msix_vector_unuse(&proxy->pci_dev, vector);
+        }
         /* Make it possible for guest to discover an error took place. */
-        if (msix_vector_use(&proxy->pci_dev, val) < 0) {
+        if (val < proxy->nvectors) {
+            msix_vector_use(&proxy->pci_dev, val);
+        } else {
             val = VIRTIO_NO_VECTOR;
         }
         virtio_queue_set_vector(vdev, vdev->queue_sel, val);
-- 
MST


