Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6299479B89
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:13:42 +0100 (CET)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybP3-0004JN-Sr
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:13:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMi-0002Bx-Od
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMe-0003gw-Qd
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639840272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dyGasbUZIFPw7fvwhyTaoJCMYzza07uwayvggRa8jm0=;
 b=RMSOKrd0vXFDUrg3A2sU7OoFa3ZXWWYocQWq05MGjKV/r3l3rEdWLhcqhCOC33GMLOw8U8
 jO/iWCpIakSVrMcLlQ1FsaupuAvYeb8cDTBI7UMGCGzm4YVD5zX9o++zKtCOhJ4TLqg6Or
 3rszdEJDIlcOW0+1lp6aotLqxxwHyaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-pAetNd_3PUO6jfGyc2nQKA-1; Sat, 18 Dec 2021 10:11:11 -0500
X-MC-Unique: pAetNd_3PUO6jfGyc2nQKA-1
Received: by mail-wr1-f72.google.com with SMTP id
 p1-20020adfba81000000b001a25b07ff53so1200346wrg.22
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 07:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyGasbUZIFPw7fvwhyTaoJCMYzza07uwayvggRa8jm0=;
 b=Ok29dAOWHtuGlCB+pleEnJ4MBsbbT6p04lBtXYZ8ZVZwxlpzaLLj46Lu1jxXdsa0p5
 +vvrtADoeOu3OzxfOzfcZGmWxZIETX5wy3PLAaKoA9G2MYFii7gyIG81iib5j0U0Du6I
 JqbFaVnLFXOUqaAeYq+Qi0XPlSe2JoZXm09DVhESTg1Z2jS+GTwQZp8+oN0/uV794NxS
 /G7ZrARQg7gjlGqhxe8uSZeFs0MtAggTAo11/VtZH/YtI3MzKDcmcn1LliAp0QqdKA7o
 ykGWxhoJeTQcmIST5EDHU966XaJhRxQtLpRbGXnQaJh2XMBPrmreVMWBOlEMqJ3T52VD
 bybQ==
X-Gm-Message-State: AOAM530mqjpK7d4kU5K6uw4f7m2maNimwXZE63Mni1R3DuCVHa3uJWP2
 0hZ6/Hodgniq4VgkKZ0p7I82TTB/vN1/TF9quSWnygPDc6+KPxfwMswxj/aCkOvbshx4BCVQaid
 mvAsUziH9mdlBmsR3msAMuOad9PY/8EyNOGNR/Yltd6EUfqTqqQoAFYhLmg89Tx4b
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr6464746wrq.700.1639840269652; 
 Sat, 18 Dec 2021 07:11:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwctQ0B7QLQ6XiLThzG4ssPryhsg7iV9BJ8glDYihq0/sPdMknGC1Qf2cY75x7CvRyxloKRlA==
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr6464714wrq.700.1639840269365; 
 Sat, 18 Dec 2021 07:11:09 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id az15sm5948661wmb.47.2021.12.18.07.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:11:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] dma: Let ld*_pci_dma() take MemTxAttrs argument
Date: Sat, 18 Dec 2021 16:10:51 +0100
Message-Id: <20211218151053.1545962-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218151053.1545962-1-philmd@redhat.com>
References: <20211218151053.1545962-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling ld*_pci_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h |  6 +++---
 hw/audio/intel-hda.c |  2 +-
 hw/net/eepro100.c    | 19 +++++++++++++------
 hw/net/tulip.c       | 18 ++++++++++--------
 hw/scsi/megasas.c    | 16 ++++++++++------
 hw/scsi/mptsas.c     | 10 ++++++----
 hw/scsi/vmw_pvscsi.c |  3 ++-
 hw/usb/hcd-xhci.c    |  1 +
 8 files changed, 46 insertions(+), 29 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 9f51ef2c3c2..7a46c1fa226 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -852,11 +852,11 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
     static inline uint##_bits##_t ld##_l##_pci_dma(PCIDevice *dev,      \
-                                                   dma_addr_t addr)     \
+                                                   dma_addr_t addr, \
+                                                   MemTxAttrs attrs) \
     {                                                                   \
         uint##_bits##_t val; \
-        ld##_l##_dma(pci_get_address_space(dev), addr, &val, \
-                     MEMTXATTRS_UNSPECIFIED); \
+        ld##_l##_dma(pci_get_address_space(dev), addr, &val, attrs); \
         return val; \
     }                                                                   \
     static inline void st##_s##_pci_dma(PCIDevice *dev, \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 3309ae0ea18..e34b7ab0e92 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -335,7 +335,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
         rp = (d->corb_rp + 1) & 0xff;
         addr = intel_hda_addr(d->corb_lbase, d->corb_ubase);
-        verb = ldl_le_pci_dma(&d->pci, addr + 4*rp);
+        verb = ldl_le_pci_dma(&d->pci, addr + 4 * rp, MEMTXATTRS_UNSPECIFIED);
         d->corb_rp = rp;
 
         dprint(d, 2, "%s: [rp 0x%x] verb 0x%08x\n", __func__, rp, verb);
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 83c4431b1ad..eb82e9cb118 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -737,6 +737,7 @@ static void read_cb(EEPRO100State *s)
 
 static void tx_command(EEPRO100State *s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     uint32_t tbd_array = s->tx.tbd_array_addr;
     uint16_t tcb_bytes = s->tx.tcb_bytes & 0x3fff;
     /* Sends larger than MAX_ETH_FRAME_SIZE are allowed, up to 2600 bytes. */
@@ -772,11 +773,14 @@ static void tx_command(EEPRO100State *s)
             /* Extended Flexible TCB. */
             for (; tbd_count < 2; tbd_count++) {
                 uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev,
-                                                            tbd_address);
+                                                            tbd_address,
+                                                            attrs);
                 uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev,
-                                                          tbd_address + 4);
+                                                          tbd_address + 4,
+                                                          attrs);
                 uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev,
-                                                        tbd_address + 6);
+                                                        tbd_address + 6,
+                                                        attrs);
                 tbd_address += 8;
                 TRACE(RXTX, logout
                     ("TBD (extended flexible mode): buffer address 0x%08x, size 0x%04x\n",
@@ -792,9 +796,12 @@ static void tx_command(EEPRO100State *s)
         }
         tbd_address = tbd_array;
         for (; tbd_count < s->tx.tbd_count; tbd_count++) {
-            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address);
-            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4);
-            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
+            uint32_t tx_buffer_address = ldl_le_pci_dma(&s->dev, tbd_address,
+                                                        attrs);
+            uint16_t tx_buffer_size = lduw_le_pci_dma(&s->dev, tbd_address + 4,
+                                                      attrs);
+            uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6,
+                                                    attrs);
             tbd_address += 8;
             TRACE(RXTX, logout
                 ("TBD (flexible mode): buffer address 0x%08x, size 0x%04x\n",
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 1f2c79dd58b..c76e4868f73 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -70,16 +70,18 @@ static const VMStateDescription vmstate_pci_tulip = {
 static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     if (s->csr[0] & CSR0_DBO) {
-        desc->status = ldl_be_pci_dma(&s->dev, p);
-        desc->control = ldl_be_pci_dma(&s->dev, p + 4);
-        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8);
-        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12);
+        desc->status = ldl_be_pci_dma(&s->dev, p, attrs);
+        desc->control = ldl_be_pci_dma(&s->dev, p + 4, attrs);
+        desc->buf_addr1 = ldl_be_pci_dma(&s->dev, p + 8, attrs);
+        desc->buf_addr2 = ldl_be_pci_dma(&s->dev, p + 12, attrs);
     } else {
-        desc->status = ldl_le_pci_dma(&s->dev, p);
-        desc->control = ldl_le_pci_dma(&s->dev, p + 4);
-        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8);
-        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12);
+        desc->status = ldl_le_pci_dma(&s->dev, p, attrs);
+        desc->control = ldl_le_pci_dma(&s->dev, p + 4, attrs);
+        desc->buf_addr1 = ldl_le_pci_dma(&s->dev, p + 8, attrs);
+        desc->buf_addr2 = ldl_le_pci_dma(&s->dev, p + 12, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index bcf8de9aa19..d6b452f07ce 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -202,7 +202,9 @@ static uint64_t megasas_frame_get_context(MegasasState *s,
                                           unsigned long frame)
 {
     PCIDevice *pci = &s->parent_obj;
-    return ldq_le_pci_dma(pci, frame + offsetof(struct mfi_frame_header, context));
+    return ldq_le_pci_dma(pci,
+                          frame + offsetof(struct mfi_frame_header, context),
+                          MEMTXATTRS_UNSPECIFIED);
 }
 
 static bool megasas_frame_is_ieee_sgl(MegasasCmd *cmd)
@@ -522,7 +524,8 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
     s->busy++;
 
     if (s->consumer_pa) {
-        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa,
+                                             MEMTXATTRS_UNSPECIFIED);
     }
     trace_megasas_qf_enqueue(cmd->index, cmd->count, cmd->context,
                              s->reply_queue_head, s->reply_queue_tail, s->busy);
@@ -553,14 +556,14 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
             stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
                            context, attrs);
         }
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
         trace_megasas_qf_complete(context, s->reply_queue_head,
                                   s->reply_queue_tail, s->busy);
     }
 
     if (megasas_intr_enabled(s)) {
         /* Update reply queue pointer */
-        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
+        s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa, attrs);
         tail = s->reply_queue_head;
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
@@ -625,6 +628,7 @@ static void megasas_abort_command(MegasasCmd *cmd)
 
 static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pcid = PCI_DEVICE(s);
     uint32_t pa_hi, pa_lo;
     hwaddr iq_pa, initq_size = sizeof(struct mfi_init_qinfo);
@@ -663,9 +667,9 @@ static int megasas_init_firmware(MegasasState *s, MegasasCmd *cmd)
     pa_lo = le32_to_cpu(initq->pi_addr_lo);
     pa_hi = le32_to_cpu(initq->pi_addr_hi);
     s->producer_pa = ((uint64_t) pa_hi << 32) | pa_lo;
-    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
+    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa, attrs);
     s->reply_queue_head %= MEGASAS_MAX_FRAMES;
-    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
+    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa, attrs);
     s->reply_queue_tail %= MEGASAS_MAX_FRAMES;
     flags = le32_to_cpu(initq->flags);
     if (flags & MFI_QUEUE_FLAG_CONTEXT64) {
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index f6c77655443..ac9f4dfcd2a 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -172,14 +172,15 @@ static const int mpi_request_sizes[] = {
 static dma_addr_t mptsas_ld_sg_base(MPTSASState *s, uint32_t flags_and_length,
                                     dma_addr_t *sgaddr)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pci = (PCIDevice *) s;
     dma_addr_t addr;
 
     if (flags_and_length & MPI_SGE_FLAGS_64_BIT_ADDRESSING) {
-        addr = ldq_le_pci_dma(pci, *sgaddr + 4);
+        addr = ldq_le_pci_dma(pci, *sgaddr + 4, attrs);
         *sgaddr += 12;
     } else {
-        addr = ldl_le_pci_dma(pci, *sgaddr + 4);
+        addr = ldl_le_pci_dma(pci, *sgaddr + 4, attrs);
         *sgaddr += 8;
     }
     return addr;
@@ -203,7 +204,7 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
         dma_addr_t addr, len;
         uint32_t flags_and_length;
 
-        flags_and_length = ldl_le_pci_dma(pci, sgaddr);
+        flags_and_length = ldl_le_pci_dma(pci, sgaddr, MEMTXATTRS_UNSPECIFIED);
         len = flags_and_length & MPI_SGE_LENGTH_MASK;
         if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
             != MPI_SGE_FLAGS_SIMPLE_ELEMENT ||
@@ -234,7 +235,8 @@ static int mptsas_build_sgl(MPTSASState *s, MPTSASRequest *req, hwaddr addr)
                 break;
             }
 
-            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr);
+            flags_and_length = ldl_le_pci_dma(pci, next_chain_addr,
+                                              MEMTXATTRS_UNSPECIFIED);
             if ((flags_and_length & MPI_SGE_FLAGS_ELEMENT_TYPE_MASK)
                 != MPI_SGE_FLAGS_CHAIN_ELEMENT) {
                 return MPI_IOCSTATUS_INVALID_SGL;
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 59c3e8ba048..33e16f91116 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -52,7 +52,8 @@
 
 #define RS_GET_FIELD(m, field) \
     (ldl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
+                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), \
+                 MEMTXATTRS_UNSPECIFIED))
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index da5a4072107..14bdb896768 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -3440,6 +3440,7 @@ static int usb_xhci_post_load(void *opaque, int version_id)
         }
         ldq_le_dma(xhci->as, dcbaap + 8 * slotid, &addr, MEMTXATTRS_UNSPECIFIED);
         slot->ctx = xhci_mask64(addr);
+
         xhci_dma_read_u32s(xhci, slot->ctx, slot_ctx, sizeof(slot_ctx));
         slot->uport = xhci_lookup_uport(xhci, slot_ctx);
         if (!slot->uport) {
-- 
2.33.1


