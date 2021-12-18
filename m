Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4F2479B8C
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 16:15:23 +0100 (CET)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mybQg-0008AE-KB
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 10:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMd-00027F-Ah
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mybMa-0003W5-IR
 for qemu-devel@nongnu.org; Sat, 18 Dec 2021 10:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639840267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGAlxPyEcsvzR3DZ2hxvZ+MjXjPRcaMiHyCHLICfCkI=;
 b=KpPcaZmPNiXjbQigtHQJ5+c921FBXGqZRyzEAu2cuxhXcHxC/rMISqEUcoWwOryAc4HaBQ
 TaoJduB7Rd0ENMmov+aNAEuUPq0f/oQzbOehAiUXtozLnXrHe/805DC4aVpW/zO7EcFTTv
 vY6lFH07XF71hzbqmq3pG3C90b5Xb74=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-sOyZzJ56OhKg25nNQ2qk7g-1; Sat, 18 Dec 2021 10:11:06 -0500
X-MC-Unique: sOyZzJ56OhKg25nNQ2qk7g-1
Received: by mail-wr1-f72.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso610304wrb.12
 for <qemu-devel@nongnu.org>; Sat, 18 Dec 2021 07:11:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AGAlxPyEcsvzR3DZ2hxvZ+MjXjPRcaMiHyCHLICfCkI=;
 b=mXViUhChG9l+IgNqVCEgKJezyu5md7TnwWMh6gEbi4t0rgoWPx6nlC6DLiVV8xzJJP
 A/0Zg7fU2UF6LuTDt3VjlND2TUfHCbMpQmgojLbW0UyAPJO4i5e1fnKkHwsgIr7XGdNg
 q2zvC1llTcOlmC1onxIhQYd95c1QAHXr/5f8KhTzkgy4FrzcWFC0na6u3NletI0fFu6X
 Cjn7PTN41qRafTkZQ5gJKilZRokV/fzX+vcRH/jAXCpM8UZWPmi/gjlezQAG33VVzcN0
 itIMkLL1uyYUjXY3yRrzOByFzcjVNek1OsD5oYpXe1I18fEzFj/oSdMmCw/XZnNwkl3F
 hnrA==
X-Gm-Message-State: AOAM532oNMX8bGcCxYWQoT7VcBGZ/eX8erH0LxcJ+Vz5dOw9YypIY2pa
 ZQRfiX0B1HWn4s4+kyg8HnnboW1ZWsml5BljLIos+3Rlb02kQhsDFMpHiucl7Y5MLLIDZUHIVW4
 ye0Y/VIy9ZW6NoiNY8Bre/NaTgbIqPOOkZFBCp7lT1jlSHK7zgRKIgeGJJ/0H8lrO
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr2553680wrr.369.1639840264769; 
 Sat, 18 Dec 2021 07:11:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVcbonj/g9x8/hXip0ziuZ5aoWdu2h5eM68JELiBXzA0r8rmWZVZNhbp3pFj24ZyM2UY5XZw==
X-Received: by 2002:a5d:42c8:: with SMTP id t8mr2553646wrr.369.1639840264467; 
 Sat, 18 Dec 2021 07:11:04 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h19sm10834055wmq.0.2021.12.18.07.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 07:11:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] dma: Let st*_pci_dma() take MemTxAttrs argument
Date: Sat, 18 Dec 2021 16:10:50 +0100
Message-Id: <20211218151053.1545962-3-philmd@redhat.com>
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

Let devices specify transaction attributes when calling st*_pci_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 11 ++++++-----
 hw/audio/intel-hda.c | 10 ++++++----
 hw/net/eepro100.c    | 29 ++++++++++++++++++-----------
 hw/net/tulip.c       | 18 ++++++++++--------
 hw/scsi/megasas.c    | 15 ++++++++++-----
 hw/scsi/vmw_pvscsi.c |  3 ++-
 6 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 8c5f2ed5054..9f51ef2c3c2 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,11 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                      MEMTXATTRS_UNSPECIFIED); \
         return val; \
     }                                                                   \
-    static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
-                                        dma_addr_t addr, uint##_bits##_t val) \
-    {                                                                   \
-        st##_s##_dma(pci_get_address_space(dev), addr, val, \
-                     MEMTXATTRS_UNSPECIFIED); \
+    static inline void st##_s##_pci_dma(PCIDevice *dev, \
+                                        dma_addr_t addr, \
+                                        uint##_bits##_t val, \
+                                        MemTxAttrs attrs) \
+    { \
+        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index fb3d34a4a0c..3309ae0ea18 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -345,6 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
@@ -367,8 +368,8 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     ex = (solicited ? 0 : (1 << 4)) | dev->cad;
     wp = (d->rirb_wp + 1) & 0xff;
     addr = intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
-    stl_le_pci_dma(&d->pci, addr + 8*wp, response);
-    stl_le_pci_dma(&d->pci, addr + 8*wp + 4, ex);
+    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
+    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
     d->rirb_wp = wp;
 
     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
@@ -394,6 +395,7 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
 static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                            uint8_t *buf, uint32_t len)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
@@ -428,7 +430,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                st->be, st->bp, st->bpl[st->be].len, copy);
 
         pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output,
-                   MEMTXATTRS_UNSPECIFIED);
+                   attrs);
         st->lpib += copy;
         st->bp += copy;
         buf += copy;
@@ -451,7 +453,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
     if (d->dp_lbase & 0x01) {
         s = st - d->st;
         addr = intel_hda_addr(d->dp_lbase & ~0x01, d->dp_ubase);
-        stl_le_pci_dma(&d->pci, addr + 8*s, st->lpib);
+        stl_le_pci_dma(&d->pci, addr + 8 * s, st->lpib, attrs);
     }
     dprint(d, 3, "dma: --\n");
 
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..83c4431b1ad 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -700,6 +700,8 @@ static void set_ru_state(EEPRO100State * s, ru_state_t state)
 
 static void dump_statistics(EEPRO100State * s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     /* Dump statistical data. Most data is never changed by the emulation
      * and always 0, so we first just copy the whole block and then those
      * values which really matter.
@@ -707,16 +709,18 @@ static void dump_statistics(EEPRO100State * s)
      */
     pci_dma_write(&s->dev, s->statsaddr, &s->statistics, s->stats_size);
     stl_le_pci_dma(&s->dev, s->statsaddr + 0,
-                   s->statistics.tx_good_frames);
+                   s->statistics.tx_good_frames, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 36,
-                   s->statistics.rx_good_frames);
+                   s->statistics.rx_good_frames, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 48,
-                   s->statistics.rx_resource_errors);
+                   s->statistics.rx_resource_errors, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 60,
-                   s->statistics.rx_short_frame_errors);
+                   s->statistics.rx_short_frame_errors, attrs);
 #if 0
-    stw_le_pci_dma(&s->dev, s->statsaddr + 76, s->statistics.xmt_tco_frames);
-    stw_le_pci_dma(&s->dev, s->statsaddr + 78, s->statistics.rcv_tco_frames);
+    stw_le_pci_dma(&s->dev, s->statsaddr + 76,
+                   s->statistics.xmt_tco_frames, attrs);
+    stw_le_pci_dma(&s->dev, s->statsaddr + 78,
+                   s->statistics.rcv_tco_frames, attrs);
     missing("CU dump statistical counters");
 #endif
 }
@@ -833,6 +837,7 @@ static void set_multicast_list(EEPRO100State *s)
 
 static void action_command(EEPRO100State *s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     /* The loop below won't stop if it gets special handcrafted data.
        Therefore we limit the number of iterations. */
     unsigned max_loop_count = 16;
@@ -911,7 +916,7 @@ static void action_command(EEPRO100State *s)
         }
         /* Write new status. */
         stw_le_pci_dma(&s->dev, s->cb_address,
-                       s->tx.status | ok_status | STATUS_C);
+                       s->tx.status | ok_status | STATUS_C, attrs);
         if (bit_i) {
             /* CU completed action. */
             eepro100_cx_interrupt(s);
@@ -937,6 +942,7 @@ static void action_command(EEPRO100State *s)
 
 static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     cu_state_t cu_state;
     switch (val) {
     case CU_NOP:
@@ -986,7 +992,7 @@ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
         /* Dump statistical counters. */
         TRACE(OTHER, logout("val=0x%02x (dump stats)\n", val));
         dump_statistics(s);
-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005);
+        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005, attrs);
         break;
     case CU_CMD_BASE:
         /* Load CU base. */
@@ -997,7 +1003,7 @@ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
         /* Dump and reset statistical counters. */
         TRACE(OTHER, logout("val=0x%02x (dump stats and reset)\n", val));
         dump_statistics(s);
-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007);
+        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007, attrs);
         memset(&s->statistics, 0, sizeof(s->statistics));
         break;
     case CU_SRESUME:
@@ -1612,6 +1618,7 @@ static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size_t size)
      * - Magic packets should set bit 30 in power management driver register.
      * - Interesting packets should set bit 29 in power management driver register.
      */
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     EEPRO100State *s = qemu_get_nic_opaque(nc);
     uint16_t rfd_status = 0xa000;
 #if defined(CONFIG_PAD_RECEIVED_FRAMES)
@@ -1726,9 +1733,9 @@ static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size_t size)
     TRACE(OTHER, logout("command 0x%04x, link 0x%08x, addr 0x%08x, size %u\n",
           rfd_command, rx.link, rx.rx_buf_addr, rfd_size));
     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
-                offsetof(eepro100_rx_t, status), rfd_status);
+                offsetof(eepro100_rx_t, status), rfd_status, attrs);
     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
-                offsetof(eepro100_rx_t, count), size);
+                offsetof(eepro100_rx_t, count), size, attrs);
     /* Early receive interrupt not supported. */
 #if 0
     eepro100_er_interrupt(s);
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index ca69f7ea5e1..1f2c79dd58b 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -86,16 +86,18 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     if (s->csr[0] & CSR0_DBO) {
-        stl_be_pci_dma(&s->dev, p, desc->status);
-        stl_be_pci_dma(&s->dev, p + 4, desc->control);
-        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1);
-        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2);
+        stl_be_pci_dma(&s->dev, p, desc->status, attrs);
+        stl_be_pci_dma(&s->dev, p + 4, desc->control, attrs);
+        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
+        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
     } else {
-        stl_le_pci_dma(&s->dev, p, desc->status);
-        stl_le_pci_dma(&s->dev, p + 4, desc->control);
-        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1);
-        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2);
+        stl_le_pci_dma(&s->dev, p, desc->status, attrs);
+        stl_le_pci_dma(&s->dev, p + 4, desc->control, attrs);
+        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
+        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index cf8adf39ca1..bcf8de9aa19 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -168,14 +168,16 @@ static void megasas_frame_set_cmd_status(MegasasState *s,
                                          unsigned long frame, uint8_t v)
 {
     PCIDevice *pci = &s->parent_obj;
-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status), v);
+    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status),
+                v, MEMTXATTRS_UNSPECIFIED);
 }
 
 static void megasas_frame_set_scsi_status(MegasasState *s,
                                           unsigned long frame, uint8_t v)
 {
     PCIDevice *pci = &s->parent_obj;
-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_status), v);
+    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_status),
+                v, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline const char *mfi_frame_desc(unsigned int cmd)
@@ -530,6 +532,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
 
 static void megasas_complete_frame(MegasasState *s, uint64_t context)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pci_dev = PCI_DEVICE(s);
     int tail, queue_offset;
 
@@ -543,10 +546,12 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
          */
         if (megasas_use_queue64(s)) {
             queue_offset = s->reply_queue_head * sizeof(uint64_t);
-            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, context);
+            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                           context, attrs);
         } else {
             queue_offset = s->reply_queue_head * sizeof(uint32_t);
-            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, context);
+            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                           context, attrs);
         }
         s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
         trace_megasas_qf_complete(context, s->reply_queue_head,
@@ -560,7 +565,7 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
                                 s->busy);
-        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head);
+        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head, attrs);
         /* Notify HBA */
         if (msix_enabled(pci_dev)) {
             trace_megasas_msix_raise(0);
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index cd76bd67ab7..59c3e8ba048 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -55,7 +55,8 @@
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val))
+                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
+                 MEMTXATTRS_UNSPECIFIED))
 
 struct PVSCSIClass {
     PCIDeviceClass parent_class;
-- 
2.33.1


