Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B453655CC8
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 10:38:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9NRe-0001vy-8K; Sun, 25 Dec 2022 04:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p9NRW-0001q3-4q
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 04:37:19 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1p9NRQ-0000Jw-6m
 for qemu-devel@nongnu.org; Sun, 25 Dec 2022 04:37:16 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so623190pjk.3
 for <qemu-devel@nongnu.org>; Sun, 25 Dec 2022 01:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qvhk2Vf1xZwA0oxyweAtu1ao2LoCtkd04c+2NriPHPI=;
 b=E+c07h7Sqb/MBvI2uuzkQgMK4FilWyRiN7u1xorV2V/EMWhA8qtDXub3ihkA4YiVTb
 2ELZCxqNcBQ3Q28m109/fgm+DhRFpxby8kbg+VyT76V7IpicHqnEWA+9yXwFfSa+wY/M
 WGXSF4bIvlJK24CybIvQTW6zK9CPMWFTXaaIrG832co0OzSkGQLCdvftEBDBNbz33FvD
 XRXlnbXgk0GhID6WJ8FTDWlh4mhMnZ6Rxzk0lJ8vpaSb8lhLlg915saD+tgdTckzXSHX
 jxBqHB9+Y36DI6sDDm8eo5/hlKOU5HpBvzBOAaWBVr0sl5ZY/Mo1qAxL2HEhXknN31nb
 2ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qvhk2Vf1xZwA0oxyweAtu1ao2LoCtkd04c+2NriPHPI=;
 b=k9QrlnJenRdW+zfWvmgUz/ruSQJgd8XTwIRyiuxfN/C4e3F5vSGUMjFoR5YVkxjOxY
 tvESrWZz20GgDqErTz5bDFuH/OY4H2Q4Qf4m+yniZjOM30F6LqWaSIK2qzt+ERn+C2P+
 X7JULXzDZkPxOCx7DAoaRBXrlhJ4cvqN2HKJz7aV3xMAyMpE5fE7/whUTcLUW0DHnidP
 Xu8qMGjq/gk5Q3k7k79lmZ2l/N+41h8ObXGNpC5I+Yr5tlWSp1Hxn4qzsIuML895+EKR
 IVPM730Pbd4a7LaUHTHYdC0Y8NBTH6/loB5/apDCfGYIERB++vFoE0GBYdwBVsCgTV7P
 brLw==
X-Gm-Message-State: AFqh2kqe0HGGRXeqLjJW9mIWkmH3r8I7ZfJ4LhGgQNxgkU3Iz6amMbPk
 FVb+f/arKzNtHH06dotM9KekM68UIUWs+edIuA0=
X-Google-Smtp-Source: AMrXdXs+zO0LFqOYHJoUi/0Mxyeqg5253eiJbsTdcgrgZpDQ9wxfk2GBShs2gkdVSh6S03nb7nq5+A==
X-Received: by 2002:a17:902:848d:b0:189:76ef:a1b9 with SMTP id
 c13-20020a170902848d00b0018976efa1b9mr15109509plo.5.1671961029590; 
 Sun, 25 Dec 2022 01:37:09 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:c360:8200:7b99:f7c3:d084:f1e2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a170903024e00b001890cbd1ff1sm5136190plh.149.2022.12.25.01.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 01:37:09 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] e1000e: Introduce e1000_rx_desc_union
Date: Sun, 25 Dec 2022 18:37:00 +0900
Message-Id: <20221225093700.68482-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Before this change, e1000e_write_packet_to_guest() allocated the
receive descriptor buffer as an array of uint8_t. This does not ensure
the buffer is sufficiently aligned.

Introduce e1000_rx_desc_union type, a union type of all receive
descriptor types to correct this.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000_regs.h  |   1 -
 hw/net/e1000e_core.c | 112 +++++++++++++++++++++----------------------
 2 files changed, 56 insertions(+), 57 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 59e050742b..cf1412d2d8 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -1100,7 +1100,6 @@ union e1000_rx_desc_packet_split {
 #define E1000_RING_DESC_LEN_SHIFT (4)
 
 #define E1000_MIN_RX_DESC_LEN   E1000_RING_DESC_LEN
-#define E1000_MAX_RX_DESC_LEN   (sizeof(union e1000_rx_desc_packet_split))
 
 /* Receive Descriptor bit definitions */
 #define E1000_RXD_STAT_DD       0x01    /* Descriptor Done */
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index fc9cdb4528..b1af807cf6 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -53,6 +53,12 @@
                                      second according to spec 10.2.4.2 */
 #define E1000E_MAX_TX_FRAGS (64)
 
+union e1000_rx_desc_union {
+    struct e1000_rx_desc legacy;
+    union e1000_rx_desc_extended extended;
+    union e1000_rx_desc_packet_split packet_split;
+};
+
 static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
@@ -1054,29 +1060,29 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 }
 
 static inline void
-e1000e_read_lgcy_rx_descr(E1000ECore *core, uint8_t *desc, hwaddr *buff_addr)
+e1000e_read_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
+                          hwaddr *buff_addr)
 {
-    struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
-    *buff_addr = le64_to_cpu(d->buffer_addr);
+    *buff_addr = le64_to_cpu(desc->buffer_addr);
 }
 
 static inline void
-e1000e_read_ext_rx_descr(E1000ECore *core, uint8_t *desc, hwaddr *buff_addr)
+e1000e_read_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
+                         hwaddr *buff_addr)
 {
     union e1000_rx_desc_extended *d = (union e1000_rx_desc_extended *) desc;
     *buff_addr = le64_to_cpu(d->read.buffer_addr);
 }
 
 static inline void
-e1000e_read_ps_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_read_ps_rx_descr(E1000ECore *core,
+                        union e1000_rx_desc_packet_split *desc,
                         hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
     int i;
-    union e1000_rx_desc_packet_split *d =
-        (union e1000_rx_desc_packet_split *) desc;
 
     for (i = 0; i < MAX_PS_BUFFERS; i++) {
-        (*buff_addr)[i] = le64_to_cpu(d->read.buffer_addr[i]);
+        (*buff_addr)[i] = le64_to_cpu(desc->read.buffer_addr[i]);
     }
 
     trace_e1000e_rx_desc_ps_read((*buff_addr)[0], (*buff_addr)[1],
@@ -1084,17 +1090,17 @@ e1000e_read_ps_rx_descr(E1000ECore *core, uint8_t *desc,
 }
 
 static inline void
-e1000e_read_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_read_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
                      hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
     if (e1000e_rx_use_legacy_descriptor(core)) {
-        e1000e_read_lgcy_rx_descr(core, desc, &(*buff_addr)[0]);
+        e1000e_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
         (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_read_ps_rx_descr(core, desc, buff_addr);
+            e1000e_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
         } else {
-            e1000e_read_ext_rx_descr(core, desc, &(*buff_addr)[0]);
+            e1000e_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
             (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
         }
     }
@@ -1265,7 +1271,7 @@ func_exit:
 }
 
 static inline void
-e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
                            struct NetRxPkt *pkt,
                            const E1000E_RSSInfo *rss_info,
                            uint16_t length)
@@ -1273,71 +1279,66 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, uint8_t *desc,
     uint32_t status_flags, rss, mrq;
     uint16_t ip_id;
 
-    struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
-
     assert(!rss_info->enabled);
 
-    d->length = cpu_to_le16(length);
-    d->csum = 0;
+    desc->length = cpu_to_le16(length);
+    desc->csum = 0;
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
                              &rss, &mrq,
                              &status_flags, &ip_id,
-                             &d->special);
-    d->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
-    d->status = (uint8_t) le32_to_cpu(status_flags);
+                             &desc->special);
+    desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
+    desc->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
 static inline void
-e1000e_write_ext_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
                           struct NetRxPkt *pkt,
                           const E1000E_RSSInfo *rss_info,
                           uint16_t length)
 {
-    union e1000_rx_desc_extended *d = (union e1000_rx_desc_extended *) desc;
-
-    memset(&d->wb, 0, sizeof(d->wb));
+    memset(&desc->wb, 0, sizeof(desc->wb));
 
-    d->wb.upper.length = cpu_to_le16(length);
+    desc->wb.upper.length = cpu_to_le16(length);
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
-                             &d->wb.lower.hi_dword.rss,
-                             &d->wb.lower.mrq,
-                             &d->wb.upper.status_error,
-                             &d->wb.lower.hi_dword.csum_ip.ip_id,
-                             &d->wb.upper.vlan);
+                             &desc->wb.lower.hi_dword.rss,
+                             &desc->wb.lower.mrq,
+                             &desc->wb.upper.status_error,
+                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                             &desc->wb.upper.vlan);
 }
 
 static inline void
-e1000e_write_ps_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_ps_rx_descr(E1000ECore *core,
+                         union e1000_rx_desc_packet_split *desc,
                          struct NetRxPkt *pkt,
                          const E1000E_RSSInfo *rss_info,
                          size_t ps_hdr_len,
                          uint16_t(*written)[MAX_PS_BUFFERS])
 {
     int i;
-    union e1000_rx_desc_packet_split *d =
-        (union e1000_rx_desc_packet_split *) desc;
 
-    memset(&d->wb, 0, sizeof(d->wb));
+    memset(&desc->wb, 0, sizeof(desc->wb));
 
-    d->wb.middle.length0 = cpu_to_le16((*written)[0]);
+    desc->wb.middle.length0 = cpu_to_le16((*written)[0]);
 
     for (i = 0; i < PS_PAGE_BUFFERS; i++) {
-        d->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
+        desc->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
     }
 
     e1000e_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
-                             &d->wb.lower.hi_dword.rss,
-                             &d->wb.lower.mrq,
-                             &d->wb.middle.status_error,
-                             &d->wb.lower.hi_dword.csum_ip.ip_id,
-                             &d->wb.middle.vlan);
+                             &desc->wb.lower.hi_dword.rss,
+                             &desc->wb.lower.mrq,
+                             &desc->wb.middle.status_error,
+                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                             &desc->wb.middle.vlan);
 
-    d->wb.upper.header_status =
+    desc->wb.upper.header_status =
         cpu_to_le16(ps_hdr_len | (ps_hdr_len ? E1000_RXDPS_HDRSTAT_HDRSP : 0));
 
     trace_e1000e_rx_desc_ps_write((*written)[0], (*written)[1],
@@ -1345,20 +1346,21 @@ e1000e_write_ps_rx_descr(E1000ECore *core, uint8_t *desc,
 }
 
 static inline void
-e1000e_write_rx_descr(E1000ECore *core, uint8_t *desc,
+e1000e_write_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
 struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
     size_t ps_hdr_len, uint16_t(*written)[MAX_PS_BUFFERS])
 {
     if (e1000e_rx_use_legacy_descriptor(core)) {
         assert(ps_hdr_len == 0);
-        e1000e_write_lgcy_rx_descr(core, desc, pkt, rss_info, (*written)[0]);
+        e1000e_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
+                                   (*written)[0]);
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_write_ps_rx_descr(core, desc, pkt, rss_info,
+            e1000e_write_ps_rx_descr(core, &desc->packet_split, pkt, rss_info,
                                       ps_hdr_len, written);
         } else {
             assert(ps_hdr_len == 0);
-            e1000e_write_ext_rx_descr(core, desc, pkt, rss_info,
+            e1000e_write_ext_rx_descr(core, &desc->extended, pkt, rss_info,
                                        (*written)[0]);
         }
     }
@@ -1366,12 +1368,12 @@ struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
 
 static inline void
 e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
-                             uint8_t *desc, dma_addr_t len)
+                             union e1000_rx_desc_union *desc, dma_addr_t len)
 {
     PCIDevice *dev = core->owner;
 
     if (e1000e_rx_use_legacy_descriptor(core)) {
-        struct e1000_rx_desc *d = (struct e1000_rx_desc *) desc;
+        struct e1000_rx_desc *d = &desc->legacy;
         size_t offset = offsetof(struct e1000_rx_desc, status);
         uint8_t status = d->status;
 
@@ -1384,8 +1386,7 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
         }
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            union e1000_rx_desc_packet_split *d =
-                (union e1000_rx_desc_packet_split *) desc;
+            union e1000_rx_desc_packet_split *d = &desc->packet_split;
             size_t offset = offsetof(union e1000_rx_desc_packet_split,
                 wb.middle.status_error);
             uint32_t status = d->wb.middle.status_error;
@@ -1398,8 +1399,7 @@ e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
                 pci_dma_write(dev, addr + offset, &status, sizeof(status));
             }
         } else {
-            union e1000_rx_desc_extended *d =
-                (union e1000_rx_desc_extended *) desc;
+            union e1000_rx_desc_extended *d = &desc->extended;
             size_t offset = offsetof(union e1000_rx_desc_extended,
                 wb.upper.status_error);
             uint32_t status = d->wb.upper.status_error;
@@ -1543,7 +1543,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 {
     PCIDevice *d = core->owner;
     dma_addr_t base;
-    uint8_t desc[E1000_MAX_RX_DESC_LEN];
+    union e1000_rx_desc_union desc;
     size_t desc_size;
     size_t desc_offset = 0;
     size_t iov_ofs = 0;
@@ -1579,7 +1579,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
         trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
 
-        e1000e_read_rx_descr(core, desc, &ba);
+        e1000e_read_rx_descr(core, &desc, &ba);
 
         if (ba[0]) {
             if (desc_offset < size) {
@@ -1649,9 +1649,9 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
             is_last = true;
         }
 
-        e1000e_write_rx_descr(core, desc, is_last ? core->rx_pkt : NULL,
+        e1000e_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-        e1000e_pci_dma_write_rx_desc(core, base, desc, core->rx_desc_len);
+        e1000e_pci_dma_write_rx_desc(core, base, &desc, core->rx_desc_len);
 
         e1000e_ring_advance(core, rxi,
                             core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
-- 
2.39.0


