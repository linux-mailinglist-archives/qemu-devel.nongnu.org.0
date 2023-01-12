Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D67666EFF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:03:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuNb-0004XJ-DI; Thu, 12 Jan 2023 05:00:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNY-0004WD-5U
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:12 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNR-0004dN-9h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:00:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 v13-20020a17090a6b0d00b00219c3be9830so20252840pjj.4
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ehdGXvlEXWvI7cGxBmtSDAxzIidJWvre7ory0lZ55hw=;
 b=aciPamVgtZSEBM6tCdkyJwW0ylDr//VMA2tJXNbM3npI+FcDhDKliOSsrgT4MbjvqB
 XfuSj1vAtnuMW2vBoTsb0cruAA55wLk3S+TsK8Sc0OTM49X2x8cJWEvT9jmLf9pD51uW
 gzyCHEz+ktn8A0QQTNLYRpUgkALwxERrQtk344RhuVSEocQIEAOearr3KNLvYFe9DCex
 tCYNXkZtpvWvJ+0mFd8r3UuqAn071aT2deqQo4QOx3WMzpUKPPlMs4WrAsdwERtUFtyc
 CN28mu7NaDF7hH+FR8NGxb0Yx2yWbkzDbAJVBMTQTvUUHgMmOs7rpMXAYvymo+X8RgeY
 +Q7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ehdGXvlEXWvI7cGxBmtSDAxzIidJWvre7ory0lZ55hw=;
 b=4IQhPt1O12OxC48D95NiSzRcpU+95Dg6hxU8bBV9uRUloydjuMW2Qv3tgH0jVyBsON
 q/f9ZgHDcvhAKnsesH4set6d8XXqImp2QyL+GM791YXQraK3rMrxkQRtdhlO+JF+Qlyr
 A2NYxcP3lqMd5y2jSb1PekEM3Gvj/64zXUHTs5BJVzcNDIb178QnxGOwJgCT8McXvMAQ
 CtaYEBycz/L4UYb3i+UpSsTcCwyfC+x8iL0qu/mDkjMu9SsIdH597rce/R3QCcdPWA4Q
 3e7p3co9AZiZQ+Ni6y8ijz0idUJWHmTMOLj9n9nMuD2oYt96oD0PcWW7m520lkNg6nyr
 JNZw==
X-Gm-Message-State: AFqh2kq7ykRlkcMvMJqd7p6si5cDVtZhQY3BLtXDKjMf2En6q/WDfwjv
 zn/IGmby3x4lgeuSRCADa2Mb7A==
X-Google-Smtp-Source: AMrXdXspF/t5k+mf/Tunk/6amt3FkoxER7rUXGKhCQNAZTTppvft6gk5/Cwin3mWEBIq5It79vEELw==
X-Received: by 2002:a17:90b:1046:b0:227:1cfc:f5ed with SMTP id
 gq6-20020a17090b104600b002271cfcf5edmr12419415pjb.39.1673517602950; 
 Thu, 12 Jan 2023 02:00:02 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:00:02 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH 25/31] igb: Transform to 82576 implementation
Date: Thu, 12 Jan 2023 18:57:37 +0900
Message-Id: <20230112095743.20123-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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

This is the change that transforms e1000e implementation to the real
igb implementation.

Signed-off-by: Gal Hammer <gal.hammer@sap.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb.c        |  316 ++---
 hw/net/igb_common.h |  114 +-
 hw/net/igb_core.c   | 3189 ++++++++++++++++++++++++-------------------
 hw/net/igb_core.h   |   56 +-
 hw/net/igb_regs.h   |  624 +++++++++
 hw/net/igbvf.c      |  327 +++++
 hw/net/meson.build  |    2 +-
 hw/net/trace-events |   32 +
 8 files changed, 2964 insertions(+), 1696 deletions(-)
 create mode 100644 hw/net/igb_regs.h
 create mode 100644 hw/net/igbvf.c

diff --git a/hw/net/igb.c b/hw/net/igb.c
index 5d4c904cc5..f6bd67b9cd 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -1,13 +1,17 @@
 /*
- * QEMU INTEL 82574 GbE NIC emulation
+ * QEMU Intel 82576 SR/IOV Ethernet Controller Emulation
  *
- * Software developer's manuals:
- * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ * Datasheet:
+ * https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eg-gbe-datasheet.pdf
  *
+ * Copyright (c) 2020-2023 Red Hat, Inc.
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
  * Developed by Daynix Computing LTD (http://www.daynix.com)
  *
  * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
+ * Gal Hammmer <gal.hammer@sap.com>
+ * Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  * Dmitry Fleytman <dmitry@daynix.com>
  * Leonid Bloch <leonid@daynix.com>
  * Yan Vugenfirer <yan@daynix.com>
@@ -37,12 +41,14 @@
 #include "qemu/units.h"
 #include "net/eth.h"
 #include "net/net.h"
-#include "net/tap.h"
 #include "qemu/module.h"
 #include "qemu/range.h"
 #include "sysemu/sysemu.h"
 #include "hw/hw.h"
 #include "hw/net/mii.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/pcie_sriov.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/qdev-properties.h"
@@ -70,18 +76,15 @@ struct IGBState {
 
     uint32_t ioaddr;
 
-    uint16_t subsys_ven;
-    uint16_t subsys;
-
-    uint16_t subsys_ven_used;
-    uint16_t subsys_used;
-
-    bool disable_vnet;
-
     IGBCore core;
-    bool init_vet;
 };
 
+#define IGB_MSIX_VECTORS    (10)
+
+#define IGB_CAP_SRIOV_OFFSET    (0x160)
+#define IGB_VF_OFFSET           (0x80)
+#define IGB_VF_STRIDE           (2)
+
 #define E1000E_MMIO_IDX     0
 #define E1000E_FLASH_IDX    1
 #define E1000E_IO_IDX       2
@@ -92,17 +95,28 @@ struct IGBState {
 #define E1000E_IO_SIZE      (32)
 #define E1000E_MSIX_SIZE    (16 * KiB)
 
-#define E1000E_MSIX_TABLE   (0x0000)
-#define E1000E_MSIX_PBA     (0x2000)
+static void igb_write_config(PCIDevice *dev, uint32_t addr,
+    uint32_t val, int len)
+{
+    IGBState *s = IGB(dev);
 
-static uint64_t
+    trace_igb_write_config(addr, val, len);
+    pci_default_write_config(dev, addr, val, len);
+
+    if (range_covers_byte(addr, len, PCI_COMMAND) &&
+        (dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
+        igb_start_recv(&s->core);
+    }
+}
+
+uint64_t
 igb_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
     IGBState *s = opaque;
     return igb_core_read(&s->core, addr, size);
 }
 
-static void
+void
 igb_mmio_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
     IGBState *s = opaque;
@@ -236,26 +250,28 @@ static NetClientInfo net_igb_info = {
 };
 
 /*
- * EEPROM (NVM) contents documented in Table 36, section 6.1
- * and generally 6.1.2 Software accessed words.
+ * EEPROM (NVM) contents documented in section 6.1, table 6-1:
+ * and in 6.10 Software accessed words.
  */
-static const uint16_t igb_eeprom_template[64] = {
-  /*        Address        |    Compat.    | ImVer |   Compat.     */
-    0x0000, 0x0000, 0x0000, 0x0420, 0xf746, 0x2010, 0xffff, 0xffff,
+static const uint16_t igb_eeprom_template[] = {
+  /*        Address        |Compat.|OEM sp.| ImRev |    OEM sp.    */
+    0x0000, 0x0000, 0x0000, 0x0d34, 0xffff, 0x2010, 0xffff, 0xffff,
   /*      PBA      |ICtrl1 | SSID  | SVID  | DevID |-------|ICtrl2 */
-    0x0000, 0x0000, 0x026b, 0x0000, 0x8086, 0x0000, 0x0000, 0x8058,
-  /*    NVM words 1,2,3    |-------------------------------|PCI-EID*/
-    0x0000, 0x2001, 0x7e7c, 0xffff, 0x1000, 0x00c8, 0x0000, 0x2704,
-  /* PCIe Init. Conf 1,2,3 |PCICtrl|PHY|LD1|-------| RevID | LD0,2 */
-    0x6cc9, 0x3150, 0x070e, 0x460b, 0x2d84, 0x0100, 0xf000, 0x0706,
-  /* FLPAR |FLANADD|LAN-PWR|FlVndr |ICtrl3 |APTSMBA|APTRxEP|APTSMBC*/
-    0x6000, 0x0080, 0x0f04, 0x7fff, 0x4f01, 0xc600, 0x0000, 0x20ff,
-  /* APTIF | APTMC |APTuCP |LSWFWID|MSWFWID|NC-SIMC|NC-SIC | VPDP  */
-    0x0028, 0x0003, 0x0000, 0x0000, 0x0000, 0x0003, 0x0000, 0xffff,
-  /*                            SW Section                         */
-    0x0100, 0xc000, 0x121c, 0xc007, 0xffff, 0xffff, 0xffff, 0xffff,
-  /*                      SW Section                       |CHKSUM */
-    0xffff, 0xffff, 0xffff, 0xffff, 0x0000, 0x0120, 0xffff, 0x0000,
+    0x1040, 0xffff, 0x002b, 0x0000, 0x8086, 0x10c9, 0x0000, 0x70c3,
+  /* SwPin0| DevID | EESZ  |-------|ICtrl3 |PCI-tc | MSIX  | APtr  */
+    0x0004, 0x10c9, 0x5c00, 0x0000, 0x2880, 0x0014, 0x4a40, 0x0060,
+  /* PCIe Init. Conf 1,2,3 |PCICtrl| LD1,3 |DDevID |DevRev | LD0,2 */
+    0x6cfb, 0xc7b0, 0x0abe, 0x0403, 0x0783, 0x10a6, 0x0001, 0x0602,
+  /* SwPin1| FunC  |LAN-PWR|ManHwC |ICtrl3 | IOVct |VDevID |-------*/
+    0x0004, 0x0020, 0x0000, 0x004a, 0x2080, 0x00f5, 0x10ca, 0x0000,
+  /*---------------| LD1,3 | LD0,2 | ROEnd | ROSta | Wdog  | VPD   */
+    0x0000, 0x0000, 0x4784, 0x4602, 0x0000, 0x0000, 0x1000, 0xffff,
+  /* PCSet0| Ccfg0 |PXEver |IBAcap |PCSet1 | Ccfg1 |iSCVer | ??    */
+    0x0100, 0x4000, 0x131f, 0x4013, 0x0100, 0x4000, 0xffff, 0xffff,
+  /* PCSet2| Ccfg2 |PCSet3 | Ccfg3 | ??    |AltMacP| ??    |CHKSUM */
+    0xffff, 0xffff, 0xffff, 0xffff, 0xffff, 0x00e0, 0xffff, 0x0000,
+  /* NC-SIC */
+    0x0003,
 };
 
 static void igb_core_realize(IGBState *s)
@@ -265,55 +281,33 @@ static void igb_core_realize(IGBState *s)
 }
 
 static void
-igb_unuse_msix_vectors(IGBState *s, int num_vectors)
+igb_init_msix(IGBState *s)
 {
     int i;
-    for (i = 0; i < num_vectors; i++) {
-        msix_vector_unuse(PCI_DEVICE(s), i);
-    }
-}
 
-static void
-igb_use_msix_vectors(IGBState *s, int num_vectors)
-{
-    int i;
-    for (i = 0; i < num_vectors; i++) {
-        msix_vector_use(PCI_DEVICE(s), i);
-    }
-}
+    msix_init(PCI_DEVICE(s), IGB_MSIX_VECTORS,
+              &s->msix,
+              E1000E_MSIX_IDX, 0,
+              &s->msix,
+              E1000E_MSIX_IDX, 0x2000,
+              0x70, &error_abort);
 
-static void
-igb_init_msix(IGBState *s)
-{
-    int res = msix_init(PCI_DEVICE(s), IGB_MSIX_VEC_NUM,
-                        &s->msix,
-                        E1000E_MSIX_IDX, E1000E_MSIX_TABLE,
-                        &s->msix,
-                        E1000E_MSIX_IDX, E1000E_MSIX_PBA,
-                        0xA0, NULL);
-
-    if (res < 0) {
-        trace_e1000e_msix_init_fail(res);
-    } else {
-        igb_use_msix_vectors(s, IGB_MSIX_VEC_NUM);
+    for (i = 0; i < IGB_MSIX_VECTORS; i++) {
+        msix_vector_use(PCI_DEVICE(s), i);
     }
 }
 
 static void
 igb_cleanup_msix(IGBState *s)
 {
-    if (msix_present(PCI_DEVICE(s))) {
-        igb_unuse_msix_vectors(s, IGB_MSIX_VEC_NUM);
-        msix_uninit(PCI_DEVICE(s), &s->msix, &s->msix);
-    }
+    msix_unuse_all_vectors(PCI_DEVICE(s));
+    msix_uninit(PCI_DEVICE(s), &s->msix, &s->msix);
 }
 
 static void
 igb_init_net_peer(IGBState *s, PCIDevice *pci_dev, uint8_t *macaddr)
 {
     DeviceState *dev = DEVICE(pci_dev);
-    NetClientState *nc;
-    int i;
 
     s->nic = qemu_new_nic(&net_igb_info, &s->conf,
         object_get_typename(OBJECT(s)), dev->id, s);
@@ -324,45 +318,6 @@ igb_init_net_peer(IGBState *s, PCIDevice *pci_dev, uint8_t *macaddr)
     memcpy(s->core.permanent_mac, macaddr, sizeof(s->core.permanent_mac));
 
     qemu_format_nic_info_str(qemu_get_queue(s->nic), macaddr);
-
-    /* Setup virtio headers */
-    if (s->disable_vnet) {
-        s->core.has_vnet = false;
-        trace_e1000e_cfg_support_virtio(false);
-        return;
-    } else {
-        s->core.has_vnet = true;
-    }
-
-    for (i = 0; i < s->conf.peers.queues; i++) {
-        nc = qemu_get_subqueue(s->nic, i);
-        if (!nc->peer || !qemu_has_vnet_hdr(nc->peer)) {
-            s->core.has_vnet = false;
-            trace_e1000e_cfg_support_virtio(false);
-            return;
-        }
-    }
-
-    trace_e1000e_cfg_support_virtio(true);
-
-    for (i = 0; i < s->conf.peers.queues; i++) {
-        nc = qemu_get_subqueue(s->nic, i);
-        qemu_set_vnet_hdr_len(nc->peer, sizeof(struct virtio_net_hdr));
-        qemu_using_vnet_hdr(nc->peer, true);
-    }
-}
-
-static inline uint64_t
-igb_gen_dsn(uint8_t *mac)
-{
-    return (uint64_t)(mac[5])        |
-           (uint64_t)(mac[4])  << 8  |
-           (uint64_t)(mac[3])  << 16 |
-           (uint64_t)(0x00FF)  << 24 |
-           (uint64_t)(0x00FF)  << 32 |
-           (uint64_t)(mac[2])  << 40 |
-           (uint64_t)(mac[1])  << 48 |
-           (uint64_t)(mac[0])  << 56;
 }
 
 static int
@@ -392,28 +347,10 @@ igb_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
     return ret;
 }
 
-static void igb_write_config(PCIDevice *pci_dev, uint32_t address,
-                             uint32_t val, int len)
-{
-    IGBState *s = IGB(pci_dev);
-
-    pci_default_write_config(pci_dev, address, val, len);
-
-    if (range_covers_byte(address, len, PCI_COMMAND) &&
-        (pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
-        igb_start_recv(&s->core);
-    }
-}
-
 static void igb_pci_realize(PCIDevice *pci_dev, Error **errp)
 {
-    static const uint16_t e1000e_pmrb_offset = 0x0C8;
-    static const uint16_t e1000e_pcie_offset = 0x0E0;
-    static const uint16_t e1000e_aer_offset =  0x100;
-    static const uint16_t e1000e_dsn_offset =  0x140;
     IGBState *s = IGB(pci_dev);
     uint8_t *macaddr;
-    int ret;
 
     trace_e1000e_cb_pci_realize();
 
@@ -422,12 +359,6 @@ static void igb_pci_realize(PCIDevice *pci_dev, Error **errp)
     pci_dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     pci_dev->config[PCI_INTERRUPT_PIN] = 1;
 
-    pci_set_word(pci_dev->config + PCI_SUBSYSTEM_VENDOR_ID, s->subsys_ven);
-    pci_set_word(pci_dev->config + PCI_SUBSYSTEM_ID, s->subsys);
-
-    s->subsys_ven_used = s->subsys_ven;
-    s->subsys_used = s->subsys;
-
     /* Define IO/MMIO regions */
     memory_region_init_io(&s->mmio, OBJECT(s), &mmio_ops, s,
                           "igb-mmio", E1000E_MMIO_SIZE);
@@ -451,34 +382,40 @@ static void igb_pci_realize(PCIDevice *pci_dev, Error **errp)
     memory_region_init(&s->msix, OBJECT(s), "igb-msix",
                        E1000E_MSIX_SIZE);
     pci_register_bar(pci_dev, E1000E_MSIX_IDX,
-                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->msix);
+                     PCI_BASE_ADDRESS_MEM_TYPE_64, &s->msix);
 
     /* Create networking backend */
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     macaddr = s->conf.macaddr.a;
 
+    /* Add PCI capabilities in reverse order */
+    assert(pcie_endpoint_cap_init(pci_dev, 0xa0) > 0);
+
     igb_init_msix(s);
 
-    if (pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset) < 0) {
-        hw_error("Failed to initialize PCIe capability");
-    }
+    msi_init(pci_dev, 0x50, 1, true, true, &error_abort);
 
-    ret = msi_init(PCI_DEVICE(s), 0xD0, 1, true, false, NULL);
-    if (ret) {
-        trace_e1000e_msi_init_fail(ret);
-    }
-
-    if (igb_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                              PCI_PM_CAP_DSI) < 0) {
+    if (igb_add_pm_capability(pci_dev, 0x40, PCI_PM_CAP_DSI) < 0) {
         hw_error("Failed to initialize PM capability");
     }
 
-    if (pcie_aer_init(pci_dev, PCI_ERR_VER, e1000e_aer_offset,
-                      PCI_ERR_SIZEOF, NULL) < 0) {
+    /* PCIe extended capabilities (in order) */
+    if (pcie_aer_init(pci_dev, 1, 0x100, 0x40, errp) < 0) {
         hw_error("Failed to initialize AER capability");
     }
 
-    pcie_dev_ser_num_init(pci_dev, e1000e_dsn_offset, igb_gen_dsn(macaddr));
+    pcie_ari_init(pci_dev, 0x150, 1);
+
+    pcie_sriov_pf_init(pci_dev, IGB_CAP_SRIOV_OFFSET, "igbvf",
+        IGB_82576_VF_DEV_ID, IGB_MAX_VF_FUNCTIONS, IGB_MAX_VF_FUNCTIONS,
+        IGB_VF_OFFSET, IGB_VF_STRIDE);
+
+    pcie_sriov_pf_init_vf_bar(pci_dev, 0,
+        PCI_BASE_ADDRESS_MEM_TYPE_64 | PCI_BASE_ADDRESS_MEM_PREFETCH,
+        16 * KiB);
+    pcie_sriov_pf_init_vf_bar(pci_dev, 3,
+        PCI_BASE_ADDRESS_MEM_TYPE_64 | PCI_BASE_ADDRESS_MEM_PREFETCH,
+        16 * KiB);
 
     igb_init_net_peer(s, pci_dev, macaddr);
 
@@ -499,7 +436,7 @@ static void igb_pci_uninit(PCIDevice *pci_dev)
 
     igb_core_pci_uninit(&s->core);
 
-    pcie_aer_exit(pci_dev);
+    pcie_sriov_pf_exit(pci_dev);
     pcie_cap_exit(pci_dev);
 
     qemu_del_nic(s->nic);
@@ -510,15 +447,13 @@ static void igb_pci_uninit(PCIDevice *pci_dev)
 
 static void igb_qdev_reset(Object *obj)
 {
+    PCIDevice *d = PCI_DEVICE(obj);
     IGBState *s = IGB(obj);
 
     trace_e1000e_cb_qdev_reset();
 
+    pcie_sriov_pf_disable_vfs(d);
     igb_core_reset(&s->core);
-
-    if (s->init_vet) {
-        s->core.mac[VET] = ETH_P_VLAN;
-    }
 }
 
 static int igb_pre_save(void *opaque)
@@ -537,15 +472,6 @@ static int igb_post_load(void *opaque, int version_id)
     IGBState *s = opaque;
 
     trace_e1000e_cb_post_load();
-
-    if ((s->subsys != s->subsys_used) ||
-        (s->subsys_ven != s->subsys_ven_used)) {
-        fprintf(stderr,
-            "ERROR: Cannot migrate while device properties "
-            "(subsys/subsys_ven) differ");
-        return -1;
-    }
-
     return igb_core_post_load(&s->core);
 }
 
@@ -554,20 +480,12 @@ static const VMStateDescription igb_vmstate_tx = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(sum_needed, struct igb_tx),
-        VMSTATE_UINT8(props.ipcss, struct igb_tx),
-        VMSTATE_UINT8(props.ipcso, struct igb_tx),
-        VMSTATE_UINT16(props.ipcse, struct igb_tx),
-        VMSTATE_UINT8(props.tucss, struct igb_tx),
-        VMSTATE_UINT8(props.tucso, struct igb_tx),
-        VMSTATE_UINT16(props.tucse, struct igb_tx),
-        VMSTATE_UINT8(props.hdr_len, struct igb_tx),
-        VMSTATE_UINT16(props.mss, struct igb_tx),
-        VMSTATE_UINT32(props.paylen, struct igb_tx),
-        VMSTATE_INT8(props.ip, struct igb_tx),
-        VMSTATE_INT8(props.tcp, struct igb_tx),
-        VMSTATE_BOOL(props.tse, struct igb_tx),
-        VMSTATE_BOOL(cptse, struct igb_tx),
+        VMSTATE_UINT16(vlan, struct igb_tx),
+        VMSTATE_UINT16(mss, struct igb_tx),
+        VMSTATE_BOOL(tse, struct igb_tx),
+        VMSTATE_BOOL(ixsm, struct igb_tx),
+        VMSTATE_BOOL(txsm, struct igb_tx),
+        VMSTATE_BOOL(first, struct igb_tx),
         VMSTATE_BOOL(skip_cp, struct igb_tx),
         VMSTATE_END_OF_LIST()
     }
@@ -603,58 +521,26 @@ static const VMStateDescription igb_vmstate = {
         VMSTATE_MSIX(parent_obj, IGBState),
 
         VMSTATE_UINT32(ioaddr, IGBState),
-        VMSTATE_UINT32(core.rxbuf_min_shift, IGBState),
         VMSTATE_UINT8(core.rx_desc_len, IGBState),
-        VMSTATE_UINT32_ARRAY(core.rxbuf_sizes, IGBState,
-                             E1000_PSRCTL_BUFFS_PER_DESC),
         VMSTATE_UINT32(core.rx_desc_buf_size, IGBState),
         VMSTATE_UINT16_ARRAY(core.eeprom, IGBState, IGB_EEPROM_SIZE),
-        VMSTATE_UINT16_2DARRAY(core.phy, IGBState,
-                               E1000E_PHY_PAGES, E1000E_PHY_PAGE_SIZE),
+        VMSTATE_UINT16_ARRAY(core.phy, IGBState, MAX_PHY_REG_ADDRESS + 1),
         VMSTATE_UINT32_ARRAY(core.mac, IGBState, E1000E_MAC_SIZE),
         VMSTATE_UINT8_ARRAY(core.permanent_mac, IGBState, ETH_ALEN),
 
-        VMSTATE_UINT32(core.delayed_causes, IGBState),
-
-        VMSTATE_UINT16(subsys, IGBState),
-        VMSTATE_UINT16(subsys_ven, IGBState),
-
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.rdtr, IGBState),
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.radv, IGBState),
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.raid, IGBState),
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.tadv, IGBState),
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.tidv, IGBState),
-
-        VMSTATE_IGB_INTR_DELAY_TIMER(core.itr, IGBState),
-
         VMSTATE_IGB_INTR_DELAY_TIMER_ARRAY(core.eitr, IGBState,
                                            IGB_MSIX_VEC_NUM),
 
-        VMSTATE_UINT32(core.itr_guest_value, IGBState),
         VMSTATE_UINT32_ARRAY(core.eitr_guest_value, IGBState, IGB_MSIX_VEC_NUM),
 
-        VMSTATE_UINT16(core.vet, IGBState),
-
         VMSTATE_STRUCT_ARRAY(core.tx, IGBState, IGB_NUM_QUEUES, 0,
                              igb_vmstate_tx, struct igb_tx),
         VMSTATE_END_OF_LIST()
     }
 };
 
-static PropertyInfo igb_prop_disable_vnet,
-                    igb_prop_subsys_ven,
-                    igb_prop_subsys;
-
 static Property igb_properties[] = {
     DEFINE_NIC_PROPERTIES(IGBState, conf),
-    DEFINE_PROP_SIGNED("disable_vnet_hdr", IGBState, disable_vnet, false,
-                        igb_prop_disable_vnet, bool),
-    DEFINE_PROP_SIGNED("subsys_ven", IGBState, subsys_ven,
-                        PCI_VENDOR_ID_INTEL,
-                        igb_prop_subsys_ven, uint16_t),
-    DEFINE_PROP_SIGNED("subsys", IGBState, subsys, 0,
-                        igb_prop_subsys, uint16_t),
-    DEFINE_PROP_BOOL("init-vet", IGBState, init_vet, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -667,27 +553,15 @@ static void igb_class_init(ObjectClass *class, void *data)
     c->realize = igb_pci_realize;
     c->exit = igb_pci_uninit;
     c->vendor_id = PCI_VENDOR_ID_INTEL;
-    c->device_id = E1000_DEV_ID_82574L;
-    c->revision = 0;
-    c->romfile = "efi-e1000e.rom";
+    c->device_id = E1000_DEV_ID_82576;
+    c->revision = 1;
     c->class_id = PCI_CLASS_NETWORK_ETHERNET;
 
     rc->phases.hold = igb_qdev_reset;
 
-    dc->desc = "Intel 82574L GbE Controller";
+    dc->desc = "Intel 82576 Gigabit Ethernet Controller";
     dc->vmsd = &igb_vmstate;
 
-    igb_prop_disable_vnet = qdev_prop_uint8;
-    igb_prop_disable_vnet.description = "Do not use virtio headers, "
-                                        "perform SW offloads emulation "
-                                        "instead";
-
-    igb_prop_subsys_ven = qdev_prop_uint16;
-    igb_prop_subsys_ven.description = "PCI device Subsystem Vendor ID";
-
-    igb_prop_subsys = qdev_prop_uint16;
-    igb_prop_subsys.description = "PCI device Subsystem ID";
-
     device_class_set_props(dc, igb_properties);
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 }
diff --git a/hw/net/igb_common.h b/hw/net/igb_common.h
index e29e829cb0..def8dc2fe3 100644
--- a/hw/net/igb_common.h
+++ b/hw/net/igb_common.h
@@ -1,6 +1,7 @@
 /*
  * QEMU igb emulation - shared code
  *
+ * Copyright (c) 2020-2023 Red Hat, Inc.
  * Copyright (c) 2008 Qumranet
  *
  * Based on work done by:
@@ -25,35 +26,51 @@
 #ifndef HW_NET_IGB_COMMON_H
 #define HW_NET_IGB_COMMON_H
 
-#include "e1000_regs.h"
+#include "igb_regs.h"
+
+#define defreg(x) x = (E1000_##x >> 2)
+#define defreg_indexed(x, i) x##i = (E1000_##x(i) >> 2)
+#define defreg_indexeda(x, i) x##i##_A = (E1000_##x##_A(i) >> 2)
+
+#define defregd(x) defreg_indexed(x, 0),  defreg_indexed(x, 1),  \
+                   defreg_indexed(x, 2),  defreg_indexed(x, 3),  \
+                   defreg_indexed(x, 4),  defreg_indexed(x, 5),  \
+                   defreg_indexed(x, 6),  defreg_indexed(x, 7),  \
+                   defreg_indexed(x, 8),  defreg_indexed(x, 9),  \
+                   defreg_indexed(x, 10), defreg_indexed(x, 11), \
+                   defreg_indexed(x, 12), defreg_indexed(x, 13), \
+                   defreg_indexed(x, 14), defreg_indexed(x, 15), \
+                   defreg_indexeda(x, 0), defreg_indexeda(x, 1), \
+                   defreg_indexeda(x, 2), defreg_indexeda(x, 3)
+
+#define defregv(x) defreg_indexed(x, 0), defreg_indexed(x, 1),   \
+                   defreg_indexed(x, 2), defreg_indexed(x, 3),   \
+                   defreg_indexed(x, 4), defreg_indexed(x, 5),   \
+                   defreg_indexed(x, 6), defreg_indexed(x, 7)
 
-#define defreg(x)   x = (E1000_##x >> 2)
 enum {
     defreg(CTRL),    defreg(EECD),    defreg(EERD),    defreg(GPRC),
     defreg(GPTC),    defreg(ICR),     defreg(ICS),     defreg(IMC),
     defreg(IMS),     defreg(LEDCTL),  defreg(MANC),    defreg(MDIC),
-    defreg(MPC),     defreg(PBA),     defreg(RCTL),    defreg(RDBAH0),
-    defreg(RDBAL0),  defreg(RDH0),    defreg(RDLEN0),  defreg(RDT0),
-    defreg(STATUS),  defreg(SWSM),    defreg(TCTL),    defreg(TDBAH),
-    defreg(TDBAL),   defreg(TDH),     defreg(TDLEN),   defreg(TDT),
-    defreg(TDLEN1),  defreg(TDBAL1),  defreg(TDBAH1),  defreg(TDH1),
-    defreg(TDT1),    defreg(TORH),    defreg(TORL),    defreg(TOTH),
-    defreg(TOTL),    defreg(TPR),     defreg(TPT),     defreg(TXDCTL),
+    defreg(MPC),     defreg(RCTL),
+    defreg(STATUS),  defreg(SWSM),    defreg(TCTL),
+    defreg(TORH),    defreg(TORL),    defreg(TOTH),
+    defreg(TOTL),    defreg(TPR),     defreg(TPT),
     defreg(WUFC),    defreg(RA),      defreg(MTA),     defreg(CRCERRS),
-    defreg(VFTA),    defreg(VET),     defreg(RDTR),    defreg(RADV),
-    defreg(TADV),    defreg(ITR),     defreg(SCC),     defreg(ECOL),
+    defreg(VFTA),    defreg(VET),
+    defreg(SCC),     defreg(ECOL),
     defreg(MCC),     defreg(LATECOL), defreg(COLC),    defreg(DC),
-    defreg(TNCRS),   defreg(SEQEC),   defreg(CEXTERR), defreg(RLEC),
+    defreg(TNCRS),   defreg(RLEC),
     defreg(XONRXC),  defreg(XONTXC),  defreg(XOFFRXC), defreg(XOFFTXC),
-    defreg(FCRUC),   defreg(AIT),     defreg(TDFH),    defreg(TDFT),
+    defreg(FCRUC),   defreg(TDFH),    defreg(TDFT),
     defreg(TDFHS),   defreg(TDFTS),   defreg(TDFPC),   defreg(WUC),
-    defreg(WUS),     defreg(POEMB),   defreg(PBS),     defreg(RDFH),
+    defreg(WUS),     defreg(RDFH),
     defreg(RDFT),    defreg(RDFHS),   defreg(RDFTS),   defreg(RDFPC),
-    defreg(PBM),     defreg(IPAV),    defreg(IP4AT),   defreg(IP6AT),
-    defreg(WUPM),    defreg(FFLT),    defreg(FFMT),    defreg(FFVT),
-    defreg(TARC0),   defreg(TARC1),   defreg(IAM),     defreg(EXTCNF_CTRL),
+    defreg(IPAV),    defreg(IP4AT),   defreg(IP6AT),
+    defreg(WUPM),    defreg(FFMT),
+    defreg(IAM),
     defreg(GCR),     defreg(TIMINCA), defreg(EIAC),    defreg(CTRL_EXT),
-    defreg(IVAR),    defreg(MFUTP01), defreg(MFUTP23), defreg(MANC2H),
+    defreg(IVAR0),   defreg(MANC2H),
     defreg(MFVAL),   defreg(MDEF),    defreg(FACTPS),  defreg(FTFT),
     defreg(RUC),     defreg(ROC),     defreg(RFC),     defreg(RJC),
     defreg(PRC64),   defreg(PRC127),  defreg(PRC255),  defreg(PRC511),
@@ -61,28 +78,22 @@ enum {
     defreg(PTC255),  defreg(PTC511),  defreg(PTC1023), defreg(PTC1522),
     defreg(GORCL),   defreg(GORCH),   defreg(GOTCL),   defreg(GOTCH),
     defreg(RNBC),    defreg(BPRC),    defreg(MPRC),    defreg(RFCTL),
-    defreg(PSRCTL),  defreg(MPTC),    defreg(BPTC),    defreg(TSCTFC),
+    defreg(MPTC),    defreg(BPTC),
     defreg(IAC),     defreg(MGTPRC),  defreg(MGTPDC),  defreg(MGTPTC),
     defreg(TSCTC),   defreg(RXCSUM),  defreg(FUNCTAG), defreg(GSCL_1),
     defreg(GSCL_2),  defreg(GSCL_3),  defreg(GSCL_4),  defreg(GSCN_0),
-    defreg(GSCN_1),  defreg(GSCN_2),  defreg(GSCN_3),  defreg(GCR2),
-    defreg(RAID),    defreg(RSRPD),   defreg(TIDV),    defreg(EITR),
-    defreg(MRQC),    defreg(RETA),    defreg(RSSRK),   defreg(RDBAH1),
-    defreg(RDBAL1),  defreg(RDLEN1),  defreg(RDH1),    defreg(RDT1),
+    defreg(GSCN_1),  defreg(GSCN_2),  defreg(GSCN_3),
+    defreg_indexed(EITR, 0),
+    defreg(MRQC),    defreg(RETA),    defreg(RSSRK),
     defreg(PBACLR),  defreg(FCAL),    defreg(FCAH),    defreg(FCT),
     defreg(FCRTH),   defreg(FCRTL),   defreg(FCTTV),   defreg(FCRTV),
-    defreg(FLA),     defreg(EEWR),    defreg(FLOP),    defreg(FLOL),
-    defreg(FLSWCTL), defreg(FLSWCNT), defreg(RXDCTL),  defreg(RXDCTL1),
+    defreg(FLA),     defreg(FLOP),
     defreg(MAVTV0),  defreg(MAVTV1),  defreg(MAVTV2),  defreg(MAVTV3),
     defreg(TXSTMPL), defreg(TXSTMPH), defreg(SYSTIML), defreg(SYSTIMH),
-    defreg(RXCFGL),  defreg(RXUDP),   defreg(TIMADJL), defreg(TIMADJH),
+    defreg(TIMADJL), defreg(TIMADJH),
     defreg(RXSTMPH), defreg(RXSTMPL), defreg(RXSATRL), defreg(RXSATRH),
-    defreg(FLASHT),  defreg(TIPG),    defreg(RDH),     defreg(RDT),
-    defreg(RDLEN),   defreg(RDBAH),   defreg(RDBAL),
-    defreg(TXDCTL1),
-    defreg(FLSWDATA),
+    defreg(TIPG),
     defreg(CTRL_DUP),
-    defreg(EXTCNF_SIZE),
     defreg(EEMNGCTL),
     defreg(EEMNGDATA),
     defreg(FLMNGCTL),
@@ -90,15 +101,46 @@ enum {
     defreg(FLMNGCNT),
     defreg(TSYNCRXCTL),
     defreg(TSYNCTXCTL),
+    defreg(RLPML),
+    defreg(UTA),
 
     /* Aliases */
-    defreg(RDH0_A),  defreg(RDT0_A),  defreg(RDTR_A),  defreg(RDFH_A),
-    defreg(RDFT_A),  defreg(TDH_A),   defreg(TDT_A),   defreg(TIDV_A),
-    defreg(TDFH_A),  defreg(TDFT_A),  defreg(RA_A),    defreg(RDBAL0_A),
-    defreg(TDBAL_A), defreg(TDLEN_A), defreg(VFTA_A),  defreg(RDLEN0_A),
-    defreg(FCRTL_A), defreg(FCRTH_A)
+    defreg(RDFH_A),      defreg(RDFT_A),     defreg(TDFH_A),     defreg(TDFT_A),
+    defreg(RA_A),        defreg(VFTA_A),     defreg(FCRTL_A),
+
+    /* Additional regs used by IGB */
+    defreg(FWSM),        defreg(SW_FW_SYNC),
+
+    defreg(EICS),        defreg(EIMS),        defreg(EIMC),       defreg(EIAM),
+    defreg(EICR),        defreg(IVAR_MISC),   defreg(GPIE),
+
+    defreg(RXPBS),      defregd(RDBAL),       defregd(RDBAH),     defregd(RDLEN),
+    defregd(SRRCTL),    defregd(RDH),         defregd(RDT),
+    defregd(RXDCTL),    defregd(RXCTL),       defregd(RQDPC),     defreg(RA2),
+
+    defreg(TXPBS),       defreg(TCTL_EXT),    defreg(DTXCTL),     defreg(HTCBDPC),
+    defregd(TDBAL),      defregd(TDBAH),      defregd(TDLEN),     defregd(TDH),
+    defregd(TDT),        defregd(TXDCTL),     defregd(TXCTL),
+    defregd(TDWBAL),     defregd(TDWBAH),
+
+    defregv(P2VMAILBOX), defregv(V2PMAILBOX), defreg(MBVFICR),    defreg(MBVFIMR),
+    defreg(VFLRE),       defreg(VFRE),        defreg(VFTE),       defreg(WVBR),
+    defreg(QDE),         defreg(DTXSWC),      defreg_indexed(VLVF, 0),
+    defregv(VMOLR),      defreg(RPLOLR),      defregv(VMBMEM),    defregv(VMVIR),
+
+    defregv(PVTCTRL),    defregv(PVTEICS),    defregv(PVTEIMS),   defregv(PVTEIMC),
+    defregv(PVTEIAC),    defregv(PVTEIAM),    defregv(PVTEICR),   defregv(PVFGPRC),
+    defregv(PVFGPTC),    defregv(PVFGORC),    defregv(PVFGOTC),   defregv(PVFMPRC),
+    defregv(PVFGPRLBC),  defregv(PVFGPTLBC),  defregv(PVFGORLBC), defregv(PVFGOTLBC),
+
+    defreg(MTA_A),
+
+    defreg(VTIVAR), defreg(VTIVAR_MISC),
 };
 
 #include "e1000x_common.h"
 
+uint64_t igb_mmio_read(void *opaque, hwaddr addr, unsigned size);
+void igb_mmio_write(void *opaque, hwaddr addr, uint64_t val, unsigned size);
+
 #endif
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index a5a49f1781..93d081c310 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1,13 +1,17 @@
 /*
  * Core code for QEMU igb emulation
  *
- * Software developer's manuals:
- * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ * Datasheet:
+ * https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eg-gbe-datasheet.pdf
  *
+ * Copyright (c) 2020-2023 Red Hat, Inc.
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
  * Developed by Daynix Computing LTD (http://www.daynix.com)
  *
  * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
+ * Gal Hammmer <gal.hammer@sap.com>
+ * Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  * Dmitry Fleytman <dmitry@daynix.com>
  * Leonid Bloch <leonid@daynix.com>
  * Yan Vugenfirer <yan@daynix.com>
@@ -50,38 +54,19 @@
 
 #include "trace.h"
 
-/* No more then 7813 interrupts per second according to spec 10.2.4.2 */
-#define E1000E_MIN_XITR     (500)
-
 #define E1000E_MAX_TX_FRAGS (64)
 
 union e1000_rx_desc_union {
     struct e1000_rx_desc legacy;
-    union e1000_rx_desc_extended extended;
-    union e1000_rx_desc_packet_split packet_split;
+    union e1000_adv_rx_desc adv;
 };
 
 static inline void
 igb_set_interrupt_cause(IGBCore *core, uint32_t val);
 
+static void igb_update_interrupt_state(IGBCore *core);
 static void igb_reset(IGBCore *core, bool sw);
 
-static inline void
-igb_process_ts_option(IGBCore *core, struct e1000_tx_desc *dp)
-{
-    if (le32_to_cpu(dp->upper.data) & E1000_TXD_EXTCMD_TSTAMP) {
-        trace_e1000e_wrn_no_ts_support();
-    }
-}
-
-static inline void
-igb_process_snap_option(IGBCore *core, uint32_t cmd_and_length)
-{
-    if (cmd_and_length & E1000_TXD_CMD_SNAP) {
-        trace_e1000e_wrn_no_snap_support();
-    }
-}
-
 static inline void
 igb_raise_legacy_irq(IGBCore *core)
 {
@@ -97,6 +82,21 @@ igb_lower_legacy_irq(IGBCore *core)
     pci_set_irq(core->owner, 0);
 }
 
+static void igb_msix_notify(IGBCore *core, unsigned int vector)
+{
+    PCIDevice *dev = core->owner;
+    uint16_t vfn;
+
+    vfn = 8 - (vector + 2) / 3;
+    if (vfn < pcie_sriov_num_vfs(core->owner)) {
+        dev = pcie_sriov_get_vf_at_index(core->owner, vfn);
+        assert(dev);
+        vector = (vector + 2) % 3;
+    }
+
+    msix_notify(dev, vector);
+}
+
 static inline void
 igb_intrmgr_rearm_timer(IGBIntrDelayTimer *timer)
 {
@@ -126,53 +126,6 @@ igb_intmgr_timer_pause(IGBIntrDelayTimer *timer)
     }
 }
 
-static inline void
-igb_intrmgr_stop_timer(IGBIntrDelayTimer *timer)
-{
-    if (timer->running) {
-        timer_del(timer->timer);
-        timer->running = false;
-    }
-}
-
-static inline void
-igb_intrmgr_fire_delayed_interrupts(IGBCore *core)
-{
-    trace_e1000e_irq_fire_delayed_interrupts();
-    igb_set_interrupt_cause(core, 0);
-}
-
-static void
-igb_intrmgr_on_timer(void *opaque)
-{
-    IGBIntrDelayTimer *timer = opaque;
-
-    trace_e1000e_irq_throttling_timer(timer->delay_reg << 2);
-
-    timer->running = false;
-    igb_intrmgr_fire_delayed_interrupts(timer->core);
-}
-
-static void
-igb_intrmgr_on_throttling_timer(void *opaque)
-{
-    IGBIntrDelayTimer *timer = opaque;
-
-    assert(!msix_enabled(timer->core->owner));
-
-    timer->running = false;
-
-    if (msi_enabled(timer->core->owner)) {
-        trace_e1000e_irq_msi_notify_postponed();
-        /* Clear msi_causes_pending to fire MSI eventually */
-        timer->core->msi_causes_pending = 0;
-        igb_set_interrupt_cause(timer->core, 0);
-    } else {
-        trace_e1000e_irq_legacy_notify_postponed();
-        igb_set_interrupt_cause(timer->core, 0);
-    }
-}
-
 static void
 igb_intrmgr_on_msix_throttling_timer(void *opaque)
 {
@@ -184,7 +137,7 @@ igb_intrmgr_on_msix_throttling_timer(void *opaque)
     timer->running = false;
 
     trace_e1000e_irq_msix_notify_postponed_vec(idx);
-    msix_notify(timer->core->owner, idx);
+    igb_msix_notify(timer->core, idx);
 }
 
 static void
@@ -192,54 +145,16 @@ igb_intrmgr_initialize_all_timers(IGBCore *core, bool create)
 {
     int i;
 
-    core->radv.delay_reg = RADV;
-    core->rdtr.delay_reg = RDTR;
-    core->raid.delay_reg = RAID;
-    core->tadv.delay_reg = TADV;
-    core->tidv.delay_reg = TIDV;
-
-    core->radv.delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
-    core->rdtr.delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
-    core->raid.delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
-    core->tadv.delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
-    core->tidv.delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
-
-    core->radv.core = core;
-    core->rdtr.core = core;
-    core->raid.core = core;
-    core->tadv.core = core;
-    core->tidv.core = core;
-
-    core->itr.core = core;
-    core->itr.delay_reg = ITR;
-    core->itr.delay_resolution_ns = E1000_INTR_THROTTLING_NS_RES;
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         core->eitr[i].core = core;
-        core->eitr[i].delay_reg = EITR + i;
-        core->eitr[i].delay_resolution_ns = E1000_INTR_THROTTLING_NS_RES;
+        core->eitr[i].delay_reg = EITR0 + i;
+        core->eitr[i].delay_resolution_ns = E1000_INTR_DELAY_NS_RES;
     }
 
     if (!create) {
         return;
     }
 
-    core->radv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->radv);
-    core->rdtr.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->rdtr);
-    core->raid.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->raid);
-
-    core->tadv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->tadv);
-    core->tidv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->tidv);
-
-    core->itr.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                   igb_intrmgr_on_throttling_timer,
-                                   &core->itr);
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         core->eitr[i].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                            igb_intrmgr_on_msix_throttling_timer,
@@ -247,154 +162,11 @@ igb_intrmgr_initialize_all_timers(IGBCore *core, bool create)
     }
 }
 
-static inline void
-igb_intrmgr_stop_delay_timers(IGBCore *core)
-{
-    igb_intrmgr_stop_timer(&core->radv);
-    igb_intrmgr_stop_timer(&core->rdtr);
-    igb_intrmgr_stop_timer(&core->raid);
-    igb_intrmgr_stop_timer(&core->tidv);
-    igb_intrmgr_stop_timer(&core->tadv);
-}
-
-static bool
-igb_intrmgr_delay_rx_causes(IGBCore *core, uint32_t *causes)
-{
-    uint32_t delayable_causes;
-    uint32_t rdtr = core->mac[RDTR];
-    uint32_t radv = core->mac[RADV];
-    uint32_t raid = core->mac[RAID];
-
-    if (msix_enabled(core->owner)) {
-        return false;
-    }
-
-    delayable_causes = E1000_ICR_RXQ0 |
-                       E1000_ICR_RXQ1 |
-                       E1000_ICR_RXT0;
-
-    if (!(core->mac[RFCTL] & E1000_RFCTL_ACK_DIS)) {
-        delayable_causes |= E1000_ICR_ACK;
-    }
-
-    /* Clean up all causes that may be delayed */
-    core->delayed_causes |= *causes & delayable_causes;
-    *causes &= ~delayable_causes;
-
-    /*
-     * Check if delayed RX interrupts disabled by client
-     * or if there are causes that cannot be delayed
-     */
-    if ((rdtr == 0) || (*causes != 0)) {
-        return false;
-    }
-
-    /*
-     * Check if delayed RX ACK interrupts disabled by client
-     * and there is an ACK packet received
-     */
-    if ((raid == 0) && (core->delayed_causes & E1000_ICR_ACK)) {
-        return false;
-    }
-
-    /* All causes delayed */
-    igb_intrmgr_rearm_timer(&core->rdtr);
-
-    if (!core->radv.running && (radv != 0)) {
-        igb_intrmgr_rearm_timer(&core->radv);
-    }
-
-    if (!core->raid.running && (core->delayed_causes & E1000_ICR_ACK)) {
-        igb_intrmgr_rearm_timer(&core->raid);
-    }
-
-    return true;
-}
-
-static bool
-igb_intrmgr_delay_tx_causes(IGBCore *core, uint32_t *causes)
-{
-    static const uint32_t delayable_causes = E1000_ICR_TXQ0 |
-                                             E1000_ICR_TXQ1 |
-                                             E1000_ICR_TXQE |
-                                             E1000_ICR_TXDW;
-
-    if (msix_enabled(core->owner)) {
-        return false;
-    }
-
-    /* Clean up all causes that may be delayed */
-    core->delayed_causes |= *causes & delayable_causes;
-    *causes &= ~delayable_causes;
-
-    /* If there are causes that cannot be delayed */
-    if (*causes != 0) {
-        return false;
-    }
-
-    /* All causes delayed */
-    igb_intrmgr_rearm_timer(&core->tidv);
-
-    if (!core->tadv.running && (core->mac[TADV] != 0)) {
-        igb_intrmgr_rearm_timer(&core->tadv);
-    }
-
-    return true;
-}
-
-static uint32_t
-igb_intmgr_collect_delayed_causes(IGBCore *core)
-{
-    uint32_t res;
-
-    if (msix_enabled(core->owner)) {
-        assert(core->delayed_causes == 0);
-        return 0;
-    }
-
-    res = core->delayed_causes;
-    core->delayed_causes = 0;
-
-    igb_intrmgr_stop_delay_timers(core);
-
-    return res;
-}
-
-static void
-igb_intrmgr_fire_all_timers(IGBCore *core)
-{
-    int i;
-    uint32_t val = igb_intmgr_collect_delayed_causes(core);
-
-    trace_e1000e_irq_adding_delayed_causes(val, core->mac[ICR]);
-    core->mac[ICR] |= val;
-
-    if (core->itr.running) {
-        timer_del(core->itr.timer);
-        igb_intrmgr_on_throttling_timer(&core->itr);
-    }
-
-    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
-        if (core->eitr[i].running) {
-            timer_del(core->eitr[i].timer);
-            igb_intrmgr_on_msix_throttling_timer(&core->eitr[i]);
-        }
-    }
-}
-
 static void
 igb_intrmgr_resume(IGBCore *core)
 {
     int i;
 
-    igb_intmgr_timer_resume(&core->radv);
-    igb_intmgr_timer_resume(&core->rdtr);
-    igb_intmgr_timer_resume(&core->raid);
-    igb_intmgr_timer_resume(&core->tidv);
-    igb_intmgr_timer_resume(&core->tadv);
-
-    igb_intmgr_timer_resume(&core->itr);
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         igb_intmgr_timer_resume(&core->eitr[i]);
     }
@@ -405,14 +177,6 @@ igb_intrmgr_pause(IGBCore *core)
 {
     int i;
 
-    igb_intmgr_timer_pause(&core->radv);
-    igb_intmgr_timer_pause(&core->rdtr);
-    igb_intmgr_timer_pause(&core->raid);
-    igb_intmgr_timer_pause(&core->tidv);
-    igb_intmgr_timer_pause(&core->tadv);
-
-    igb_intmgr_timer_pause(&core->itr);
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         igb_intmgr_timer_pause(&core->eitr[i]);
     }
@@ -423,14 +187,11 @@ igb_intrmgr_reset(IGBCore *core)
 {
     int i;
 
-    core->delayed_causes = 0;
-
-    igb_intrmgr_stop_delay_timers(core);
-
-    igb_intrmgr_stop_timer(&core->itr);
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
-        igb_intrmgr_stop_timer(&core->eitr[i]);
+        if (core->eitr[i].running) {
+            timer_del(core->eitr[i].timer);
+            igb_intrmgr_on_msix_throttling_timer(&core->eitr[i]);
+        }
     }
 }
 
@@ -439,15 +200,6 @@ igb_intrmgr_pci_unint(IGBCore *core)
 {
     int i;
 
-    timer_free(core->radv.timer);
-    timer_free(core->rdtr.timer);
-    timer_free(core->raid.timer);
-
-    timer_free(core->tadv.timer);
-    timer_free(core->tidv.timer);
-
-    timer_free(core->itr.timer);
-
     for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         timer_free(core->eitr[i].timer);
     }
@@ -468,20 +220,17 @@ igb_rx_csum_enabled(IGBCore *core)
 static inline bool
 igb_rx_use_legacy_descriptor(IGBCore *core)
 {
-    return (core->mac[RFCTL] & E1000_RFCTL_EXTEN) ? false : true;
-}
-
-static inline bool
-igb_rx_use_ps_descriptor(IGBCore *core)
-{
-    return !igb_rx_use_legacy_descriptor(core) &&
-           (core->mac[RCTL] & E1000_RCTL_DTYP_PS);
+    /*
+     * TODO: If SRRCTL[n],DESCTYPE = 000b, the 82576 uses the legacy Rx
+     * descriptor.
+     */
+    return false;
 }
 
 static inline bool
 igb_rss_enabled(IGBCore *core)
 {
-    return E1000_MRQC_ENABLED(core->mac[MRQC]) &&
+    return (core->mac[MRQC] & 3) == E1000_MRQC_ENABLE_RSS_MQ &&
            !igb_rx_csum_enabled(core) &&
            !igb_rx_use_legacy_descriptor(core);
 }
@@ -627,22 +376,47 @@ igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
 static void
 igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
-    if (tx->props.tse && tx->cptse) {
-        net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->props.mss);
+    if (tx->tse) {
+        net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->mss);
         net_tx_pkt_update_ip_checksums(tx->tx_pkt);
         e1000x_inc_reg_if_not_full(core->mac, TSCTC);
         return;
     }
 
-    if (tx->sum_needed & E1000_TXD_POPTS_TXSM) {
+    if (tx->txsm) {
         net_tx_pkt_build_vheader(tx->tx_pkt, false, true, 0);
     }
 
-    if (tx->sum_needed & E1000_TXD_POPTS_IXSM) {
+    if (tx->ixsm) {
         net_tx_pkt_update_ip_hdr_checksum(tx->tx_pkt);
     }
 }
 
+/* TX Packets Switching (7.10.3.6) */
+static bool igb_tx_pkt_switch(IGBCore *core, struct igb_tx *tx,
+                              NetClientState *nc)
+{
+    bool ret;
+
+    /* TX switching is only used to serve VM to VM traffic. */
+    if (!pcie_sriov_num_vfs(core->owner)) {
+        goto send_out;
+    }
+
+    /* TX switching requires DTXSWC.Loopback_en bit enabled. */
+    if (!(core->mac[DTXSWC] & E1000_DTXSWC_VMDQ_LOOPBACK_EN)) {
+        goto send_out;
+    }
+
+    ret = net_tx_pkt_send_loopback(tx->tx_pkt, nc);
+    if (!ret) {
+        return ret;
+    }
+
+send_out:
+    return net_tx_pkt_send(tx->tx_pkt, nc);
+}
+
 static bool
 igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 {
@@ -653,11 +427,11 @@ igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 
     net_tx_pkt_dump(tx->tx_pkt);
 
-    if ((core->phy[0][MII_BMCR] & MII_BMCR_LOOPBACK) ||
+    if ((core->phy[MII_BMCR] & MII_BMCR_LOOPBACK) ||
         ((core->mac[RCTL] & E1000_RCTL_LBM_MAC) == E1000_RCTL_LBM_MAC)) {
         return net_tx_pkt_send_loopback(tx->tx_pkt, queue);
     } else {
-        return net_tx_pkt_send(tx->tx_pkt, queue);
+        return igb_tx_pkt_switch(core, tx, queue);
     }
 }
 
@@ -694,99 +468,91 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
 static void
 igb_process_tx_desc(IGBCore *core,
                     struct igb_tx *tx,
-                    struct e1000_tx_desc *dp,
+                    union e1000_adv_tx_desc *tx_desc,
                     int queue_index)
 {
-    uint32_t txd_lower = le32_to_cpu(dp->lower.data);
-    uint32_t dtype = txd_lower & (E1000_TXD_CMD_DEXT | E1000_TXD_DTYP_D);
-    unsigned int split_size = txd_lower & 0xffff;
-    uint64_t addr;
-    struct e1000_context_desc *xp = (struct e1000_context_desc *)dp;
-    bool eop = txd_lower & E1000_TXD_CMD_EOP;
+    struct e1000_adv_tx_context_desc *tx_ctx_desc;
+    uint32_t cmd_type_len;
+    uint32_t olinfo_status;
+    uint64_t buffer_addr;
+    uint16_t length;
 
-    if (dtype == E1000_TXD_CMD_DEXT) { /* context descriptor */
-        e1000x_read_tx_ctx_descr(xp, &tx->props);
-        igb_process_snap_option(core, le32_to_cpu(xp->cmd_and_length));
-        return;
-    } else if (dtype == (E1000_TXD_CMD_DEXT | E1000_TXD_DTYP_D)) {
-        /* data descriptor */
-        tx->sum_needed = le32_to_cpu(dp->upper.data) >> 8;
-        tx->cptse = (txd_lower & E1000_TXD_CMD_TSE) ? 1 : 0;
-        igb_process_ts_option(core, dp);
+    cmd_type_len = le32_to_cpu(tx_desc->read.cmd_type_len);
+
+    if (cmd_type_len & E1000_ADVTXD_DCMD_DEXT) {
+        if ((cmd_type_len & E1000_ADVTXD_DTYP_DATA) ==
+            E1000_ADVTXD_DTYP_DATA) {
+            /* advanced transmit data descriptor */
+            if (tx->first) {
+                olinfo_status = le32_to_cpu(tx_desc->read.olinfo_status);
+
+                tx->tse = !!(cmd_type_len & E1000_ADVTXD_DCMD_TSE);
+                tx->ixsm = !!(olinfo_status & E1000_ADVTXD_POTS_IXSM);
+                tx->txsm = !!(olinfo_status & E1000_ADVTXD_POTS_TXSM);
+
+                tx->first = false;
+            }
+        } else if ((cmd_type_len & E1000_ADVTXD_DTYP_CTXT) ==
+                   E1000_ADVTXD_DTYP_CTXT) {
+            /* advanced transmit context descriptor */
+            tx_ctx_desc = (struct e1000_adv_tx_context_desc *)tx_desc;
+            tx->vlan = le32_to_cpu(tx_ctx_desc->vlan_macip_lens) >> 16;
+            tx->mss = le32_to_cpu(tx_ctx_desc->mss_l4len_idx) >> 16;
+            return;
+        } else {
+            /* unknown descriptor type */
+            return;
+        }
     } else {
         /* legacy descriptor */
-        igb_process_ts_option(core, dp);
-        tx->cptse = 0;
+
+        /* TODO: Implement a support for legacy descriptors (7.2.2.1). */
     }
 
-    addr = le64_to_cpu(dp->buffer_addr);
+    buffer_addr = le64_to_cpu(tx_desc->read.buffer_addr);
+    length = cmd_type_len & 0xFFFF;
 
     if (!tx->skip_cp) {
-        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, addr, split_size)) {
+        if (!net_tx_pkt_add_raw_fragment(tx->tx_pkt, buffer_addr, length)) {
             tx->skip_cp = true;
         }
     }
 
-    if (eop) {
+    if (cmd_type_len & E1000_TXD_CMD_EOP) {
         if (!tx->skip_cp && net_tx_pkt_parse(tx->tx_pkt)) {
-            if (e1000x_vlan_enabled(core->mac) &&
-                e1000x_is_vlan_txd(txd_lower)) {
-                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt,
-                    le16_to_cpu(dp->upper.fields.special), core->mac[VET]);
+            if (cmd_type_len & E1000_TXD_CMD_VLE) {
+                net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, tx->vlan,
+                    core->mac[VET] & 0xffff);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
                 igb_on_tx_done_update_stats(core, tx->tx_pkt);
             }
         }
 
+        tx->first = true;
         tx->skip_cp = false;
         net_tx_pkt_reset(tx->tx_pkt);
-
-        tx->sum_needed = 0;
-        tx->cptse = 0;
     }
 }
 
-static inline uint32_t
-igb_tx_wb_interrupt_cause(IGBCore *core, int queue_idx)
+static uint32_t igb_tx_wb_eic(IGBCore *core, int queue_idx)
 {
-    if (!msix_enabled(core->owner)) {
-        return E1000_ICR_TXDW;
-    }
-
-    return (queue_idx == 0) ? E1000_ICR_TXQ0 : E1000_ICR_TXQ1;
-}
+    uint32_t n, ent = 0;
 
-static inline uint32_t
-igb_rx_wb_interrupt_cause(IGBCore *core, int queue_idx,
-                             bool min_threshold_hit)
-{
-    if (!msix_enabled(core->owner)) {
-        return E1000_ICS_RXT0 | (min_threshold_hit ? E1000_ICS_RXDMT0 : 0);
-    }
+    n = igb_ivar_entry_tx(queue_idx);
+    ent = (core->mac[IVAR0 + n / 4] >> (8 * (n % 4))) & 0xff;
 
-    return (queue_idx == 0) ? E1000_ICR_RXQ0 : E1000_ICR_RXQ1;
+    return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
 }
 
-static uint32_t
-igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
-                     struct e1000_tx_desc *dp, bool *ide, int queue_idx)
+static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
 {
-    uint32_t txd_upper, txd_lower = le32_to_cpu(dp->lower.data);
+    uint32_t n, ent = 0;
 
-    if (!(txd_lower & E1000_TXD_CMD_RS) &&
-        !(core->mac[IVAR] & E1000_IVAR_TX_INT_EVERY_WB)) {
-        return 0;
-    }
+    n = igb_ivar_entry_rx(queue_idx);
+    ent = (core->mac[IVAR0 + n / 4] >> (8 * (n % 4))) & 0xff;
 
-    *ide = (txd_lower & E1000_TXD_CMD_IDE) ? true : false;
-
-    txd_upper = le32_to_cpu(dp->upper.data) | E1000_TXD_STAT_DD;
-
-    dp->upper.data = cpu_to_le32(txd_upper);
-    pci_dma_write(core->owner, base + ((char *)&dp->upper - (char *)dp),
-                  &dp->upper, sizeof(dp->upper));
-    return igb_tx_wb_interrupt_cause(core, queue_idx);
+    return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
 }
 
 typedef struct E1000E_RingInfo_st {
@@ -855,12 +621,6 @@ igb_ring_enabled(IGBCore *core, const E1000E_RingInfo *r)
     return core->mac[r->dlen] > 0;
 }
 
-static inline uint32_t
-igb_ring_len(IGBCore *core, const E1000E_RingInfo *r)
-{
-    return core->mac[r->dlen];
-}
-
 typedef struct IGB_TxRing_st {
     const E1000E_RingInfo *i;
     struct igb_tx *tx;
@@ -869,15 +629,29 @@ typedef struct IGB_TxRing_st {
 static inline int
 igb_mq_queue_idx(int base_reg_idx, int reg_idx)
 {
-    return (reg_idx - base_reg_idx) / (0x100 >> 2);
+    return (reg_idx - base_reg_idx) / 16;
 }
 
 static inline void
 igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
 {
     static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
-        { TDBAH,  TDBAL,  TDLEN,  TDH,  TDT, 0 },
-        { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 }
+        { TDBAH0, TDBAL0, TDLEN0, TDH0, TDT0, 0 },
+        { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 },
+        { TDBAH2, TDBAL2, TDLEN2, TDH2, TDT2, 2 },
+        { TDBAH3, TDBAL3, TDLEN3, TDH3, TDT3, 3 },
+        { TDBAH4, TDBAL4, TDLEN4, TDH4, TDT4, 4 },
+        { TDBAH5, TDBAL5, TDLEN5, TDH5, TDT5, 5 },
+        { TDBAH6, TDBAL6, TDLEN6, TDH6, TDT6, 6 },
+        { TDBAH7, TDBAL7, TDLEN7, TDH7, TDT7, 7 },
+        { TDBAH8, TDBAL8, TDLEN8, TDH8, TDT8, 8 },
+        { TDBAH9, TDBAL9, TDLEN9, TDH9, TDT9, 9 },
+        { TDBAH10, TDBAL10, TDLEN10, TDH10, TDT10, 10 },
+        { TDBAH11, TDBAL11, TDLEN11, TDH11, TDT11, 11 },
+        { TDBAH12, TDBAL12, TDLEN12, TDH12, TDT12, 12 },
+        { TDBAH13, TDBAL13, TDLEN13, TDH13, TDT13, 13 },
+        { TDBAH14, TDBAL14, TDLEN14, TDH14, TDT14, 14 },
+        { TDBAH15, TDBAL15, TDLEN15, TDH15, TDT15, 15 }
     };
 
     assert(idx < ARRAY_SIZE(i));
@@ -895,7 +669,21 @@ igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
 {
     static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
         { RDBAH0, RDBAL0, RDLEN0, RDH0, RDT0, 0 },
-        { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 }
+        { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 },
+        { RDBAH2, RDBAL2, RDLEN2, RDH2, RDT2, 2 },
+        { RDBAH3, RDBAL3, RDLEN3, RDH3, RDT3, 3 },
+        { RDBAH4, RDBAL4, RDLEN4, RDH4, RDT4, 4 },
+        { RDBAH5, RDBAL5, RDLEN5, RDH5, RDT5, 5 },
+        { RDBAH6, RDBAL6, RDLEN6, RDH6, RDT6, 6 },
+        { RDBAH7, RDBAL7, RDLEN7, RDH7, RDT7, 7 },
+        { RDBAH8, RDBAL8, RDLEN8, RDH8, RDT8, 8 },
+        { RDBAH9, RDBAL9, RDLEN9, RDH9, RDT9, 9 },
+        { RDBAH10, RDBAL10, RDLEN10, RDH10, RDT10, 10 },
+        { RDBAH11, RDBAL11, RDLEN11, RDH11, RDT11, 11 },
+        { RDBAH12, RDBAL12, RDLEN12, RDH12, RDT12, 12 },
+        { RDBAH13, RDBAL13, RDLEN13, RDH13, RDT13, 13 },
+        { RDBAH14, RDBAL14, RDLEN14, RDH14, RDT14, 14 },
+        { RDBAH15, RDBAL15, RDLEN15, RDH15, RDT15, 15 }
     };
 
     assert(idx < ARRAY_SIZE(i));
@@ -903,15 +691,44 @@ igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
     rxr->i      = &i[idx];
 }
 
+static uint32_t
+igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
+                     union e1000_adv_tx_desc *tx_desc,
+                     const E1000E_RingInfo *txi)
+{
+    uint32_t cmd_type_len = le32_to_cpu(tx_desc->read.cmd_type_len);
+    uint64_t tdwba;
+
+    tdwba = core->mac[E1000_TDWBAL(txi->idx) >> 2];
+    tdwba |= (uint64_t)core->mac[E1000_TDWBAH(txi->idx) >> 2] << 32;
+
+    if (!(cmd_type_len & E1000_TXD_CMD_RS)) {
+        return 0;
+    }
+
+    if (tdwba & 1) {
+        uint32_t buffer = cpu_to_le32(core->mac[txi->dh]);
+        pci_dma_write(core->owner, tdwba & ~3, &buffer, sizeof(buffer));
+    } else {
+        uint32_t status = le32_to_cpu(tx_desc->wb.status) | E1000_TXD_STAT_DD;
+
+        tx_desc->wb.status = cpu_to_le32(status);
+        pci_dma_write(core->owner, base + offsetof(union e1000_adv_tx_desc, wb),
+            &tx_desc->wb, sizeof(tx_desc->wb));
+    }
+
+    return igb_tx_wb_eic(core, txi->idx);
+}
+
 static void
 igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
     dma_addr_t base;
-    struct e1000_tx_desc desc;
-    bool ide = false;
+    union e1000_adv_tx_desc desc;
     const E1000E_RingInfo *txi = txr->i;
-    uint32_t cause = E1000_ICS_TXQE;
+    uint32_t eic = 0;
 
+    /* TODO: check if the queue itself is enabled too. */
     if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
         trace_e1000e_tx_disabled();
         return;
@@ -922,17 +739,17 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 
         pci_dma_read(core->owner, base, &desc, sizeof(desc));
 
-        trace_e1000e_tx_descr((void *)(intptr_t)desc.buffer_addr,
-                              desc.lower.data, desc.upper.data);
+        trace_e1000e_tx_descr((void *)(intptr_t)desc.read.buffer_addr,
+                              desc.read.cmd_type_len, desc.wb.status);
 
         igb_process_tx_desc(core, txr->tx, &desc, txi->idx);
-        cause |= igb_txdesc_writeback(core, base, &desc, &ide, txi->idx);
-
         igb_ring_advance(core, txi, 1);
+        eic |= igb_txdesc_writeback(core, base, &desc, txi);
     }
 
-    if (!ide || !igb_intrmgr_delay_tx_causes(core, &cause)) {
-        igb_set_interrupt_cause(core, cause);
+    if (eic) {
+        core->mac[EICR] |= eic;
+        igb_set_interrupt_cause(core, E1000_ICR_TXDW);
     }
 }
 
@@ -1006,49 +823,137 @@ igb_rx_l4_cso_enabled(IGBCore *core)
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
-static bool
-igb_receive_filter(IGBCore *core, const uint8_t *buf, int size)
+static uint16_t igb_receive_assign(IGBCore *core, const struct eth_header *ehdr,
+                                   E1000E_RSSInfo *rss_info)
 {
-    uint32_t rctl = core->mac[RCTL];
+    static const int ta_shift[] = { 4, 3, 2, 0 };
+    uint32_t f, ra[2], *macp, rctl = core->mac[RCTL];
+    uint16_t queues = 0;
+    bool accepted = false;
+    int i;
+
+    memset(rss_info, 0, sizeof(E1000E_RSSInfo));
 
-    if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
+    if (e1000x_is_vlan_packet(ehdr->h_dest, core->mac[VET] & 0xffff) &&
         e1000x_vlan_rx_filter_enabled(core->mac)) {
-        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
+        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(ehdr)->h_tci);
         uint32_t vfta =
             ldl_le_p((uint32_t *)(core->mac + VFTA) +
                      ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
         if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
             trace_e1000e_rx_flt_vlan_mismatch(vid);
-            return false;
+            return queues;
         } else {
             trace_e1000e_rx_flt_vlan_match(vid);
         }
     }
 
-    switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-    case ETH_PKT_UCAST:
-        if (rctl & E1000_RCTL_UPE) {
-            return true; /* promiscuous ucast */
+    if (pcie_sriov_num_vfs(core->owner)) {
+        if (is_broadcast_ether_addr(ehdr->h_dest)) {
+            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
+                if (core->mac[VMOLR0 + i] & E1000_VMOLR_BAM) {
+                    queues |= BIT(i);
+                }
+            }
+
+            return queues;
         }
-        break;
 
-    case ETH_PKT_BCAST:
-        if (rctl & E1000_RCTL_BAM) {
-            return true; /* broadcast enabled */
+        for (macp = core->mac + RA; macp < core->mac + RA + 32; macp += 2) {
+            if (!(macp[1] & E1000_RAH_AV)) {
+                continue;
+            }
+            ra[0] = cpu_to_le32(macp[0]);
+            ra[1] = cpu_to_le32(macp[1]);
+            if (!memcmp(ehdr->h_dest, (uint8_t *)ra, ETH_ALEN)) {
+                queues |= (macp[1] & E1000_RAH_POOL_MASK) / E1000_RAH_POOL_1;
+            }
         }
-        break;
 
-    case ETH_PKT_MCAST:
-        if (rctl & E1000_RCTL_MPE) {
-            return true; /* promiscuous mcast */
+        for (macp = core->mac + RA2; macp < core->mac + RA2 + 16; macp += 2) {
+            if (!(macp[1] & E1000_RAH_AV)) {
+                continue;
+            }
+            ra[0] = cpu_to_le32(macp[0]);
+            ra[1] = cpu_to_le32(macp[1]);
+            if (!memcmp(ehdr->h_dest, (uint8_t *)ra, ETH_ALEN)) {
+                queues |= (macp[1] & E1000_RAH_POOL_MASK) / E1000_RAH_POOL_1;
+            }
         }
-        break;
 
-    default:
-        g_assert_not_reached();
+        if (queues) {
+            return queues;
+        }
+
+        macp = core->mac + (is_multicast_ether_addr(ehdr->h_dest) ? MTA : UTA);
+
+        f = ta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
+        f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
+        if (macp[f >> 5] & (1 << (f & 0x1f))) {
+            for (i = 0; i < IGB_MAX_VF_FUNCTIONS; i++) {
+                if (core->mac[VMOLR0 + i] & E1000_VMOLR_ROMPE) {
+                        queues |= BIT(i);
+                }
+            }
+        }
+
+        if (queues) {
+            return queues;
+        }
+    } else {
+        switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
+        case ETH_PKT_UCAST:
+            if (rctl & E1000_RCTL_UPE) {
+                accepted = true; /* promiscuous ucast */
+            }
+            break;
+
+        case ETH_PKT_BCAST:
+            if (rctl & E1000_RCTL_BAM) {
+                accepted = true; /* broadcast enabled */
+            }
+            break;
+
+        case ETH_PKT_MCAST:
+            if (rctl & E1000_RCTL_MPE) {
+                accepted = true; /* promiscuous mcast */
+            }
+            break;
+
+        default:
+            g_assert_not_reached();
+        }
+
+        if (!accepted) {
+            accepted = e1000x_rx_group_filter(core->mac, ehdr->h_dest);
+        }
+
+        if (!accepted) {
+            for (macp = core->mac + RA2; macp < core->mac + RA2 + 16; macp += 2) {
+                if (!(macp[1] & E1000_RAH_AV)) {
+                    continue;
+                }
+                ra[0] = cpu_to_le32(macp[0]);
+                ra[1] = cpu_to_le32(macp[1]);
+                if (!memcmp(ehdr->h_dest, (uint8_t *)ra, ETH_ALEN)) {
+                    trace_e1000x_rx_flt_ucast_match((int)(macp - core->mac - RA2) / 2,
+                                                    MAC_ARG(ehdr->h_dest));
+
+                    accepted = true;
+                    break;
+                }
+            }
+        }
+
+        if (accepted) {
+            igb_rss_parse_packet(core, core->rx_pkt, rss_info);
+            queues = BIT(rss_info->queue);
+
+            return queues;
+        }
     }
 
-    return e1000x_rx_group_filter(core->mac, buf);
+    return queues;
 }
 
 static inline void
@@ -1059,41 +964,20 @@ igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
 }
 
 static inline void
-igb_read_ext_rx_descr(IGBCore *core, union e1000_rx_desc_extended *desc,
+igb_read_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
                       hwaddr *buff_addr)
 {
-    *buff_addr = le64_to_cpu(desc->read.buffer_addr);
-}
-
-static inline void
-igb_read_ps_rx_descr(IGBCore *core,
-                     union e1000_rx_desc_packet_split *desc,
-                     hwaddr (*buff_addr)[MAX_PS_BUFFERS])
-{
-    int i;
-
-    for (i = 0; i < MAX_PS_BUFFERS; i++) {
-        (*buff_addr)[i] = le64_to_cpu(desc->read.buffer_addr[i]);
-    }
-
-    trace_e1000e_rx_desc_ps_read((*buff_addr)[0], (*buff_addr)[1],
-                                 (*buff_addr)[2], (*buff_addr)[3]);
+    *buff_addr = le64_to_cpu(desc->read.pkt_addr);
 }
 
 static inline void
 igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-                  hwaddr (*buff_addr)[MAX_PS_BUFFERS])
+                  hwaddr *buff_addr)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        igb_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
-        (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
+        igb_read_lgcy_rx_descr(core, &desc->legacy, buff_addr);
     } else {
-        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            igb_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
-        } else {
-            igb_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
-            (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
-        }
+        igb_read_adv_rx_descr(core, &desc->adv, buff_addr);
     }
 }
 
@@ -1139,26 +1023,13 @@ igb_verify_csum_in_sw(IGBCore *core,
     }
 }
 
-static inline bool
-igb_is_tcp_ack(IGBCore *core, struct NetRxPkt *rx_pkt)
-{
-    if (!net_rx_pkt_is_tcp_ack(rx_pkt)) {
-        return false;
-    }
-
-    if (core->mac[RFCTL] & E1000_RFCTL_ACK_DATA_DIS) {
-        return !net_rx_pkt_has_tcp_data(rx_pkt);
-    }
-
-    return true;
-}
-
 static void
 igb_build_rx_metadata(IGBCore *core,
                       struct NetRxPkt *pkt,
                       bool is_eop,
                       const E1000E_RSSInfo *rss_info,
-                      uint32_t *rss, uint32_t *mrq,
+                      uint16_t *pkt_info, uint16_t *hdr_info,
+                      uint32_t *rss,
                       uint32_t *status_flags,
                       uint16_t *ip_id,
                       uint16_t *vlan_tag)
@@ -1170,6 +1041,7 @@ igb_build_rx_metadata(IGBCore *core,
     *status_flags = E1000_RXD_STAT_DD;
 
     /* No additional metadata needed for non-EOP descriptors */
+    /* TODO: EOP apply only to status so don't skip whole function. */
     if (!is_eop) {
         goto func_exit;
     }
@@ -1190,8 +1062,7 @@ igb_build_rx_metadata(IGBCore *core,
     if ((core->mac[RXCSUM] & E1000_RXCSUM_PCSD) != 0) {
         if (rss_info->enabled) {
             *rss = cpu_to_le32(rss_info->hash);
-            *mrq = cpu_to_le32(rss_info->type | (rss_info->queue << 8));
-            trace_e1000e_rx_metadata_rss(*rss, *mrq);
+            trace_igb_rx_metadata_rss(*rss);
         }
     } else if (isip4) {
             *status_flags |= E1000_RXD_STAT_IPIDV;
@@ -1199,7 +1070,7 @@ igb_build_rx_metadata(IGBCore *core,
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (istcp && igb_is_tcp_ack(core, pkt)) {
+    if (istcp && net_rx_pkt_is_tcp_ack(pkt)) {
         *status_flags |= E1000_RXD_STAT_ACK;
         trace_e1000e_rx_metadata_ack();
     }
@@ -1215,9 +1086,22 @@ igb_build_rx_metadata(IGBCore *core,
         pkt_type = E1000_RXD_PKT_MAC;
     }
 
-    *status_flags |= E1000_RXD_PKT_TYPE(pkt_type);
     trace_e1000e_rx_metadata_pkt_type(pkt_type);
 
+    if (pkt_info) {
+        if (rss_info->enabled) {
+            *pkt_info = rss_info->type;
+        }
+
+        *pkt_info |= (pkt_type << 4);
+    } else {
+        *status_flags |= E1000_RXD_PKT_TYPE(pkt_type);
+    }
+
+    if (hdr_info) {
+        *hdr_info = 0;
+    }
+
     /* RX CSO information */
     if (isip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
         trace_e1000e_rx_metadata_ipv6_sum_disabled();
@@ -1267,25 +1151,24 @@ igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
                         const E1000E_RSSInfo *rss_info,
                         uint16_t length)
 {
-    uint32_t status_flags, rss, mrq;
+    uint32_t status_flags, rss;
     uint16_t ip_id;
 
     assert(!rss_info->enabled);
-
     desc->length = cpu_to_le16(length);
     desc->csum = 0;
 
     igb_build_rx_metadata(core, pkt, pkt != NULL,
-                             rss_info,
-                             &rss, &mrq,
-                             &status_flags, &ip_id,
-                             &desc->special);
+                          rss_info,
+                          NULL, NULL, &rss,
+                          &status_flags, &ip_id,
+                          &desc->special);
     desc->errors = (uint8_t) (le32_to_cpu(status_flags) >> 24);
     desc->status = (uint8_t) le32_to_cpu(status_flags);
 }
 
 static inline void
-igb_write_ext_rx_descr(IGBCore *core, union e1000_rx_desc_extended *desc,
+igb_write_adv_rx_descr(IGBCore *core, union e1000_adv_rx_desc *desc,
                        struct NetRxPkt *pkt,
                        const E1000E_RSSInfo *rss_info,
                        uint16_t length)
@@ -1296,64 +1179,22 @@ igb_write_ext_rx_descr(IGBCore *core, union e1000_rx_desc_extended *desc,
 
     igb_build_rx_metadata(core, pkt, pkt != NULL,
                           rss_info,
+                          &desc->wb.lower.lo_dword.pkt_info,
+                          &desc->wb.lower.lo_dword.hdr_info,
                           &desc->wb.lower.hi_dword.rss,
-                          &desc->wb.lower.mrq,
                           &desc->wb.upper.status_error,
                           &desc->wb.lower.hi_dword.csum_ip.ip_id,
                           &desc->wb.upper.vlan);
 }
 
-static inline void
-igb_write_ps_rx_descr(IGBCore *core,
-                      union e1000_rx_desc_packet_split *desc,
-                      struct NetRxPkt *pkt,
-                      const E1000E_RSSInfo *rss_info,
-                      size_t ps_hdr_len,
-                      uint16_t(*written)[MAX_PS_BUFFERS])
-{
-    int i;
-
-    memset(&desc->wb, 0, sizeof(desc->wb));
-
-    desc->wb.middle.length0 = cpu_to_le16((*written)[0]);
-
-    for (i = 0; i < PS_PAGE_BUFFERS; i++) {
-        desc->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
-    }
-
-    igb_build_rx_metadata(core, pkt, pkt != NULL,
-                          rss_info,
-                          &desc->wb.lower.hi_dword.rss,
-                          &desc->wb.lower.mrq,
-                          &desc->wb.middle.status_error,
-                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                          &desc->wb.middle.vlan);
-
-    desc->wb.upper.header_status =
-        cpu_to_le16(ps_hdr_len | (ps_hdr_len ? E1000_RXDPS_HDRSTAT_HDRSP : 0));
-
-    trace_e1000e_rx_desc_ps_write((*written)[0], (*written)[1],
-                                  (*written)[2], (*written)[3]);
-}
-
 static inline void
 igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
-struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
-    size_t ps_hdr_len, uint16_t(*written)[MAX_PS_BUFFERS])
+struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info, uint16_t length)
 {
     if (igb_rx_use_legacy_descriptor(core)) {
-        assert(ps_hdr_len == 0);
-        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
-                                (*written)[0]);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info, length);
     } else {
-        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            igb_write_ps_rx_descr(core, &desc->packet_split, pkt, rss_info,
-                                  ps_hdr_len, written);
-        } else {
-            assert(ps_hdr_len == 0);
-            igb_write_ext_rx_descr(core, &desc->extended, pkt, rss_info,
-                                   (*written)[0]);
-        }
+        igb_write_adv_rx_descr(core, &desc->adv, pkt, rss_info, length);
     }
 }
 
@@ -1376,89 +1217,45 @@ igb_pci_dma_write_rx_desc(IGBCore *core, dma_addr_t addr,
             pci_dma_write(dev, addr + offset, &status, sizeof(status));
         }
     } else {
-        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            union e1000_rx_desc_packet_split *d = &desc->packet_split;
-            size_t offset = offsetof(union e1000_rx_desc_packet_split,
-                wb.middle.status_error);
-            uint32_t status = d->wb.middle.status_error;
-
-            d->wb.middle.status_error &= ~E1000_RXD_STAT_DD;
-            pci_dma_write(dev, addr, desc, len);
-
-            if (status & E1000_RXD_STAT_DD) {
-                d->wb.middle.status_error = status;
-                pci_dma_write(dev, addr + offset, &status, sizeof(status));
-            }
-        } else {
-            union e1000_rx_desc_extended *d = &desc->extended;
-            size_t offset = offsetof(union e1000_rx_desc_extended,
-                wb.upper.status_error);
-            uint32_t status = d->wb.upper.status_error;
+        union e1000_adv_rx_desc *d = &desc->adv;
+        size_t offset =
+            offsetof(union e1000_adv_rx_desc, wb.upper.status_error);
+        uint32_t status = d->wb.upper.status_error;
 
-            d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
-            pci_dma_write(dev, addr, desc, len);
+        d->wb.upper.status_error &= ~E1000_RXD_STAT_DD;
+        pci_dma_write(dev, addr, desc, len);
 
-            if (status & E1000_RXD_STAT_DD) {
-                d->wb.upper.status_error = status;
-                pci_dma_write(dev, addr + offset, &status, sizeof(status));
-            }
+        if (status & E1000_RXD_STAT_DD) {
+            d->wb.upper.status_error = status;
+            pci_dma_write(dev, addr + offset, &status, sizeof(status));
         }
     }
 }
 
-typedef struct e1000e_ba_state_st {
-    uint16_t written[MAX_PS_BUFFERS];
-    uint8_t cur_idx;
-} e1000e_ba_state;
-
 static inline void
 igb_write_hdr_to_rx_buffers(IGBCore *core,
-                            hwaddr (*ba)[MAX_PS_BUFFERS],
-                            e1000e_ba_state *bastate,
+                            hwaddr ba,
+                            uint16_t *written,
                             const char *data,
                             dma_addr_t data_len)
 {
-    assert(data_len <= core->rxbuf_sizes[0] - bastate->written[0]);
-
-    pci_dma_write(core->owner, (*ba)[0] + bastate->written[0], data, data_len);
-    bastate->written[0] += data_len;
+    assert(data_len <= core->rx_desc_buf_size - *written);
 
-    bastate->cur_idx = 1;
+    pci_dma_write(core->owner, ba + *written, data, data_len);
+    *written += data_len;
 }
 
 static void
 igb_write_to_rx_buffers(IGBCore *core,
-                        hwaddr (*ba)[MAX_PS_BUFFERS],
-                        e1000e_ba_state *bastate,
+                        hwaddr ba,
+                        uint16_t *written,
                         const char *data,
                         dma_addr_t data_len)
 {
-    while (data_len > 0) {
-        uint32_t cur_buf_len = core->rxbuf_sizes[bastate->cur_idx];
-        uint32_t cur_buf_bytes_left = cur_buf_len -
-                                      bastate->written[bastate->cur_idx];
-        uint32_t bytes_to_write = MIN(data_len, cur_buf_bytes_left);
-
-        trace_e1000e_rx_desc_buff_write(bastate->cur_idx,
-                                        (*ba)[bastate->cur_idx],
-                                        bastate->written[bastate->cur_idx],
-                                        data,
-                                        bytes_to_write);
-
-        pci_dma_write(core->owner,
-            (*ba)[bastate->cur_idx] + bastate->written[bastate->cur_idx],
-            data, bytes_to_write);
-
-        bastate->written[bastate->cur_idx] += bytes_to_write;
-        data += bytes_to_write;
-        data_len -= bytes_to_write;
-
-        if (bastate->written[bastate->cur_idx] == cur_buf_len) {
-            bastate->cur_idx++;
-        }
-
-        assert(bastate->cur_idx < MAX_PS_BUFFERS);
-    }
+    assert(data_len <= core->rx_desc_buf_size - *written);
+    trace_igb_rx_desc_buff_write(ba, *written, data, data_len);
+    pci_dma_write(core->owner, ba + *written, data, data_len);
+    *written += data_len;
 }
 
 static void
@@ -1484,45 +1281,7 @@ static inline bool
 igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
 {
     return igb_ring_free_descr_num(core, rxi) ==
-           igb_ring_len(core, rxi) >> core->rxbuf_min_shift;
-}
-
-static bool
-igb_do_ps(IGBCore *core, struct NetRxPkt *pkt, size_t *hdr_len)
-{
-    bool isip4, isip6, isudp, istcp;
-    bool fragment;
-
-    if (!igb_rx_use_ps_descriptor(core)) {
-        return false;
-    }
-
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
-
-    if (isip4) {
-        fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
-    } else if (isip6) {
-        fragment = net_rx_pkt_get_ip6_info(pkt)->fragment;
-    } else {
-        return false;
-    }
-
-    if (fragment && (core->mac[RFCTL] & E1000_RFCTL_IPFRSP_DIS)) {
-        return false;
-    }
-
-    if (!fragment && (isudp || istcp)) {
-        *hdr_len = net_rx_pkt_get_l5_hdr_offset(pkt);
-    } else {
-        *hdr_len = net_rx_pkt_get_l4_hdr_offset(pkt);
-    }
-
-    if ((*hdr_len > core->rxbuf_sizes[0]) ||
-        (*hdr_len > net_rx_pkt_get_total_len(pkt))) {
-        return false;
-    }
-
-    return true;
+           ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
 }
 
 static void
@@ -1541,15 +1300,12 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     size_t size = net_rx_pkt_get_total_len(pkt);
     size_t total_size = size + e1000x_fcs_len(core->mac);
     const E1000E_RingInfo *rxi;
-    size_t ps_hdr_len = 0;
-    bool do_ps = igb_do_ps(core, pkt, &ps_hdr_len);
-    bool is_first = true;
 
     rxi = rxr->i;
 
     do {
-        hwaddr ba[MAX_PS_BUFFERS];
-        e1000e_ba_state bastate = { { 0 } };
+        hwaddr ba;
+        uint16_t written = 0;
         bool is_last = false;
 
         desc_size = total_size - desc_offset;
@@ -1570,7 +1326,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
         igb_read_rx_descr(core, &desc, &ba);
 
-        if (ba[0]) {
+        if (ba) {
             if (desc_offset < size) {
                 static const uint32_t fcs_pad;
                 size_t iov_copy;
@@ -1579,41 +1335,11 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
                     copy_size = core->rx_desc_buf_size;
                 }
 
-                /* For PS mode copy the packet header first */
-                if (do_ps) {
-                    if (is_first) {
-                        size_t ps_hdr_copied = 0;
-                        do {
-                            iov_copy = MIN(ps_hdr_len - ps_hdr_copied,
-                                           iov->iov_len - iov_ofs);
-
-                            igb_write_hdr_to_rx_buffers(core, &ba, &bastate,
-                                                      iov->iov_base, iov_copy);
-
-                            copy_size -= iov_copy;
-                            ps_hdr_copied += iov_copy;
-
-                            iov_ofs += iov_copy;
-                            if (iov_ofs == iov->iov_len) {
-                                iov++;
-                                iov_ofs = 0;
-                            }
-                        } while (ps_hdr_copied < ps_hdr_len);
-
-                        is_first = false;
-                    } else {
-                        /* Leave buffer 0 of each descriptor except first */
-                        /* empty as per spec 7.1.5.1                      */
-                        igb_write_hdr_to_rx_buffers(core, &ba, &bastate,
-                                                       NULL, 0);
-                    }
-                }
-
                 /* Copy packet payload */
                 while (copy_size) {
                     iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
 
-                    igb_write_to_rx_buffers(core, &ba, &bastate,
+                    igb_write_to_rx_buffers(core, ba, &written,
                                             iov->iov_base + iov_ofs, iov_copy);
 
                     copy_size -= iov_copy;
@@ -1626,7 +1352,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
                 if (desc_offset + desc_size >= total_size) {
                     /* Simulate FCS checksum presence in the last descriptor */
-                    igb_write_to_rx_buffers(core, &ba, &bastate,
+                    igb_write_to_rx_buffers(core, ba, &written,
                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
                 }
             }
@@ -1639,37 +1365,26 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
         }
 
         igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
-                           rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
+                           rss_info, written);
         igb_pci_dma_write_rx_desc(core, base, &desc, core->rx_desc_len);
 
-        igb_ring_advance(core, rxi,
-                         core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
+        igb_ring_advance(core, rxi, core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
 
     } while (desc_offset < total_size);
 
     igb_update_rx_stats(core, size, total_size);
 }
 
-static inline void
-igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
-{
-    if (net_rx_pkt_has_virt_hdr(pkt)) {
-        struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
-
-        if (vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-            net_rx_pkt_fix_l4_csum(pkt);
-        }
-    }
-}
-
 ssize_t
 igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
 {
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
-    uint32_t n = 0;
+    uint16_t queues = 0;
+    uint32_t n;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
+    struct eth_header *ehdr;
     uint8_t *filter_buf;
     size_t size, orig_size;
     size_t iov_ofs = 0;
@@ -1677,7 +1392,7 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
     E1000E_RSSInfo rss_info;
     size_t total_size;
     ssize_t retval;
-    bool rdmts_hit;
+    int i;
 
     trace_e1000e_rx_receive_iov(iovcnt);
 
@@ -1685,12 +1400,6 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
         return -1;
     }
 
-    /* Pull virtio header in */
-    if (core->has_vnet) {
-        net_rx_pkt_set_vhdr_iovec(core->rx_pkt, iov, iovcnt);
-        iov_ofs = sizeof(struct virtio_net_hdr);
-    }
-
     filter_buf = iov->iov_base + iov_ofs;
     orig_size = iov_size(iov, iovcnt);
     size = orig_size - iov_ofs;
@@ -1716,61 +1425,66 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
         return orig_size;
     }
 
-    net_rx_pkt_set_packet_type(core->rx_pkt,
-        get_eth_packet_type(PKT_GET_ETH_HDR(filter_buf)));
+    ehdr = PKT_GET_ETH_HDR(filter_buf);
+    net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
+
+    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
+                               e1000x_vlan_enabled(core->mac),
+                               core->mac[VET] & 0xffff);
 
-    if (!igb_receive_filter(core, filter_buf, size)) {
+    queues = igb_receive_assign(core, ehdr, &rss_info);
+    if (!queues) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
     }
 
-    net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac), core->mac[VET]);
-
-    igb_rss_parse_packet(core, core->rx_pkt, &rss_info);
-    igb_rx_ring_init(core, &rxr, rss_info.queue);
-
-    trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-
     total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
         e1000x_fcs_len(core->mac);
 
-    if (igb_has_rxbufs(core, rxr.i, total_size)) {
-        igb_rx_fix_l4_csum(core, core->rx_pkt);
+    retval = orig_size;
 
-        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
+        if (!(queues & BIT(i))) {
+            continue;
+        }
 
-        retval = orig_size;
+        igb_rx_ring_init(core, &rxr, i);
 
-        /* Perform small receive detection (RSRPD) */
-        if (total_size < core->mac[RSRPD]) {
-            n |= E1000_ICS_SRPD;
-        }
+        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
 
-        /* Perform ACK receive detection */
-        if  (!(core->mac[RFCTL] & E1000_RFCTL_ACK_DIS) &&
-             (igb_is_tcp_ack(core, core->rx_pkt))) {
-            n |= E1000_ICS_ACK;
+        if (!igb_has_rxbufs(core, rxr.i, total_size)) {
+            retval = 0;
         }
+    }
+
+    if (retval) {
+        n = E1000_ICR_RXT0;
+
+        for (i = 0; i < IGB_NUM_QUEUES; i++) {
+            if (!(queues & BIT(i))) {
+                continue;
+            }
+
+            igb_rx_ring_init(core, &rxr, i);
+
+            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
-        /* Check if receive descriptor minimum threshold hit */
-        rdmts_hit = igb_rx_descr_threshold_hit(core, rxr.i);
-        n |= igb_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
+            /* Check if receive descriptor minimum threshold hit */
+            if (igb_rx_descr_threshold_hit(core, rxr.i)) {
+                n |= E1000_ICS_RXDMT0;
+            }
+
+            core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
+        }
 
         trace_e1000e_rx_written_to_guest(n);
     } else {
-        n |= E1000_ICS_RXO;
-        retval = 0;
-
+        n = E1000_ICS_RXO;
         trace_e1000e_rx_not_written_to_guest(n);
     }
 
-    if (!igb_intrmgr_delay_rx_causes(core, &n)) {
-        trace_e1000e_rx_interrupt_set(n);
-        igb_set_interrupt_cause(core, n);
-    } else {
-        trace_e1000e_rx_interrupt_delayed(n);
-    }
+    trace_e1000e_rx_interrupt_set(n);
+    igb_set_interrupt_cause(core, n);
 
     return retval;
 }
@@ -1778,13 +1492,12 @@ igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
 static inline bool
 igb_have_autoneg(IGBCore *core)
 {
-    return core->phy[0][MII_BMCR] & MII_BMCR_AUTOEN;
+    return core->phy[MII_BMCR] & MII_BMCR_AUTOEN;
 }
 
 static void igb_update_flowctl_status(IGBCore *core)
 {
-    if (igb_have_autoneg(core) &&
-        core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP) {
+    if (igb_have_autoneg(core) && core->phy[MII_BMSR] & MII_BMSR_AN_COMP) {
         trace_e1000e_link_autoneg_flowctl(true);
         core->mac[CTRL] |= E1000_CTRL_TFCE | E1000_CTRL_RFCE;
     } else {
@@ -1795,42 +1508,22 @@ static void igb_update_flowctl_status(IGBCore *core)
 static inline void
 igb_link_down(IGBCore *core)
 {
-    e1000x_update_regs_on_link_down(core->mac, core->phy[0]);
+    e1000x_update_regs_on_link_down(core->mac, core->phy);
     igb_update_flowctl_status(core);
 }
 
 static inline void
-igb_set_phy_ctrl(IGBCore *core, int index, uint16_t val)
+igb_set_phy_ctrl(IGBCore *core, uint16_t val)
 {
     /* bits 0-5 reserved; MII_BMCR_[ANRESTART,RESET] are self clearing */
-    core->phy[0][MII_BMCR] = val & ~(0x3f |
-                                     MII_BMCR_RESET |
-                                     MII_BMCR_ANRESTART);
-
-    if ((val & MII_BMCR_ANRESTART) &&
-        igb_have_autoneg(core)) {
-        e1000x_restart_autoneg(core->mac, core->phy[0], core->autoneg_timer);
-    }
-}
-
-static void
-igb_set_phy_oem_bits(IGBCore *core, int index, uint16_t val)
-{
-    core->phy[0][PHY_OEM_BITS] = val & ~BIT(10);
+    core->phy[MII_BMCR] = val & ~(0x3f | MII_BMCR_RESET | MII_BMCR_ANRESTART);
 
-    if (val & BIT(10)) {
-        e1000x_restart_autoneg(core->mac, core->phy[0], core->autoneg_timer);
+    if ((val & MII_BMCR_ANRESTART) && igb_have_autoneg(core)) {
+        e1000x_restart_autoneg(core->mac, core->phy, core->autoneg_timer);
     }
 }
 
-static void
-igb_set_phy_page(IGBCore *core, int index, uint16_t val)
-{
-    core->phy[0][PHY_PAGE] = val & PHY_PAGE_RW_MASK;
-}
-
-void
-igb_core_set_link_status(IGBCore *core)
+void igb_core_set_link_status(IGBCore *core)
 {
     NetClientState *nc = qemu_get_queue(core->owner_nic);
     uint32_t old_status = core->mac[STATUS];
@@ -1838,14 +1531,14 @@ igb_core_set_link_status(IGBCore *core)
     trace_e1000e_link_status_changed(nc->link_down ? false : true);
 
     if (nc->link_down) {
-        e1000x_update_regs_on_link_down(core->mac, core->phy[0]);
+        e1000x_update_regs_on_link_down(core->mac, core->phy);
     } else {
         if (igb_have_autoneg(core) &&
-            !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
-            e1000x_restart_autoneg(core->mac, core->phy[0],
+            !(core->phy[MII_BMSR] & MII_BMSR_AN_COMP)) {
+            e1000x_restart_autoneg(core->mac, core->phy,
                                    core->autoneg_timer);
         } else {
-            e1000x_update_regs_on_link_up(core->mac, core->phy[0]);
+            e1000x_update_regs_on_link_up(core->mac, core->phy);
             igb_start_recv(core);
         }
     }
@@ -1903,49 +1596,19 @@ igb_set_rfctl(IGBCore *core, int index, uint32_t val)
     core->mac[RFCTL] = val;
 }
 
-static void
-igb_calc_per_desc_buf_size(IGBCore *core)
-{
-    int i;
-    core->rx_desc_buf_size = 0;
-
-    for (i = 0; i < ARRAY_SIZE(core->rxbuf_sizes); i++) {
-        core->rx_desc_buf_size += core->rxbuf_sizes[i];
-    }
-}
-
 static void
 igb_parse_rxbufsize(IGBCore *core)
 {
     uint32_t rctl = core->mac[RCTL];
 
-    memset(core->rxbuf_sizes, 0, sizeof(core->rxbuf_sizes));
-
-    if (rctl & E1000_RCTL_DTYP_MASK) {
-        uint32_t bsize;
-
-        bsize = core->mac[PSRCTL] & E1000_PSRCTL_BSIZE0_MASK;
-        core->rxbuf_sizes[0] = (bsize >> E1000_PSRCTL_BSIZE0_SHIFT) * 128;
-
-        bsize = core->mac[PSRCTL] & E1000_PSRCTL_BSIZE1_MASK;
-        core->rxbuf_sizes[1] = (bsize >> E1000_PSRCTL_BSIZE1_SHIFT) * 1024;
-
-        bsize = core->mac[PSRCTL] & E1000_PSRCTL_BSIZE2_MASK;
-        core->rxbuf_sizes[2] = (bsize >> E1000_PSRCTL_BSIZE2_SHIFT) * 1024;
-
-        bsize = core->mac[PSRCTL] & E1000_PSRCTL_BSIZE3_MASK;
-        core->rxbuf_sizes[3] = (bsize >> E1000_PSRCTL_BSIZE3_SHIFT) * 1024;
-    } else if (rctl & E1000_RCTL_FLXBUF_MASK) {
+    if (rctl & E1000_RCTL_FLXBUF_MASK) {
         int flxbuf = rctl & E1000_RCTL_FLXBUF_MASK;
-        core->rxbuf_sizes[0] = (flxbuf >> E1000_RCTL_FLXBUF_SHIFT) * 1024;
+        core->rx_desc_buf_size = (flxbuf >> E1000_RCTL_FLXBUF_SHIFT) * 1024;
     } else {
-        core->rxbuf_sizes[0] = e1000x_rxbufsize(rctl);
+        core->rx_desc_buf_size = e1000x_rxbufsize(rctl);
     }
 
-    trace_e1000e_rx_desc_buff_sizes(core->rxbuf_sizes[0], core->rxbuf_sizes[1],
-                                    core->rxbuf_sizes[2], core->rxbuf_sizes[3]);
-
-    igb_calc_per_desc_buf_size(core);
+    trace_igb_rx_desc_buff_size(core->rx_desc_buf_size);
 }
 
 static void
@@ -1954,11 +1617,7 @@ igb_calc_rxdesclen(IGBCore *core)
     if (igb_rx_use_legacy_descriptor(core)) {
         core->rx_desc_len = sizeof(struct e1000_rx_desc);
     } else {
-        if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            core->rx_desc_len = sizeof(union e1000_rx_desc_packet_split);
-        } else {
-            core->rx_desc_len = sizeof(union e1000_rx_desc_extended);
-        }
+        core->rx_desc_len = sizeof(union e1000_adv_rx_desc);
     }
     trace_e1000e_rx_desc_len(core->rx_desc_len);
 }
@@ -1969,26 +1628,18 @@ igb_set_rx_control(IGBCore *core, int index, uint32_t val)
     core->mac[RCTL] = val;
     trace_e1000e_rx_set_rctl(core->mac[RCTL]);
 
+    if (val & E1000_RCTL_DTYP_MASK) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "igb: RCTL.DTYP must be zero for compatibility");
+    }
+
     if (val & E1000_RCTL_EN) {
         igb_parse_rxbufsize(core);
         igb_calc_rxdesclen(core);
-        core->rxbuf_min_shift = ((val / E1000_RCTL_RDMTS_QUAT) & 3) + 1 +
-                                E1000_RING_DESC_LEN_SHIFT;
-
         igb_start_recv(core);
     }
 }
 
-static
-void(*igb_phyreg_writeops[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE])
-(IGBCore *, int, uint16_t) = {
-    [0] = {
-        [MII_BMCR]     = igb_set_phy_ctrl,
-        [PHY_PAGE]     = igb_set_phy_page,
-        [PHY_OEM_BITS] = igb_set_phy_oem_bits
-    }
-};
-
 static inline void
 igb_clear_ims_bits(IGBCore *core, uint32_t bits)
 {
@@ -2013,220 +1664,372 @@ igb_postpone_interrupt(IGBIntrDelayTimer *timer)
 }
 
 static inline bool
-igb_itr_should_postpone(IGBCore *core)
+igb_eitr_should_postpone(IGBCore *core, int idx)
+{
+    return igb_postpone_interrupt(&core->eitr[idx]);
+}
+
+static void igb_send_msix(IGBCore *core)
+{
+    uint32_t causes = core->mac[EICR] & core->mac[EIMS];
+    uint32_t effective_eiac;
+    int vector;
+
+    for (vector = 0; vector < IGB_MSIX_VEC_NUM; ++vector) {
+        if ((causes & BIT(vector)) && !igb_eitr_should_postpone(core, vector)) {
+
+            trace_e1000e_irq_msix_notify_vec(vector);
+            igb_msix_notify(core, vector);
+
+            trace_e1000e_irq_icr_clear_eiac(core->mac[EICR], core->mac[EIAC]);
+            effective_eiac = core->mac[EIAC] & BIT(vector);
+            core->mac[EICR] &= ~effective_eiac;
+        }
+    }
+}
+
+static inline void
+igb_fix_icr_asserted(IGBCore *core)
+{
+    core->mac[ICR] &= ~E1000_ICR_ASSERTED;
+    if (core->mac[ICR]) {
+        core->mac[ICR] |= E1000_ICR_ASSERTED;
+    }
+
+    trace_e1000e_irq_fix_icr_asserted(core->mac[ICR]);
+}
+
+static void
+igb_update_interrupt_state(IGBCore *core)
+{
+    uint32_t icr;
+    uint32_t causes;
+    uint32_t int_alloc;
+
+    icr = core->mac[ICR] & core->mac[IMS];
+
+    if (msix_enabled(core->owner)) {
+        if (icr) {
+            causes = 0;
+            if (icr & E1000_ICR_DRSTA) {
+                int_alloc = core->mac[IVAR_MISC] & 0xff;
+                if (int_alloc & E1000_IVAR_VALID) {
+                    causes |= BIT(int_alloc & 0x1f);
+                }
+            }
+            /* Check if other bits (excluding the TCP Timer) are enabled. */
+            if (icr & ~E1000_ICR_DRSTA) {
+                int_alloc = (core->mac[IVAR_MISC] >> 8) & 0xff;
+                if (int_alloc & E1000_IVAR_VALID) {
+                    causes |= BIT(int_alloc & 0x1f);
+                }
+                trace_e1000e_irq_add_msi_other(core->mac[EICR]);
+            }
+            core->mac[EICR] |= causes;
+        }
+
+        if ((core->mac[EICR] & core->mac[EIMS])) {
+            igb_send_msix(core);
+        }
+    } else {
+        igb_fix_icr_asserted(core);
+
+        if (icr) {
+            core->mac[EICR] |= (icr & E1000_ICR_DRSTA) | E1000_EICR_OTHER;
+        } else {
+            core->mac[EICR] &= ~E1000_EICR_OTHER;
+        }
+
+        trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
+                                            core->mac[ICR], core->mac[IMS]);
+
+        if (msi_enabled(core->owner)) {
+            if (icr) {
+                msi_notify(core->owner, 0);
+            }
+        } else {
+            if (icr) {
+                igb_raise_legacy_irq(core);
+            } else {
+                igb_lower_legacy_irq(core);
+            }
+        }
+    }
+}
+
+static void
+igb_set_interrupt_cause(IGBCore *core, uint32_t val)
 {
-    return igb_postpone_interrupt(&core->itr);
+    trace_e1000e_irq_set_cause_entry(val, core->mac[ICR]);
+
+    core->mac[ICR] |= val;
+
+    trace_e1000e_irq_set_cause_exit(val, core->mac[ICR]);
+
+    igb_update_interrupt_state(core);
+}
+
+static void igb_set_eics(IGBCore *core, int index, uint32_t val)
+{
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
+
+    trace_igb_irq_write_eics(val, msix);
+
+    core->mac[EICS] |=
+        val & (msix ? E1000_EICR_MSIX_MASK : E1000_EICR_LEGACY_MASK);
+
+    /*
+     * TODO: Move to igb_update_interrupt_state if EICS is modified in other
+     * places.
+     */
+    core->mac[EICR] = core->mac[EICS];
+
+    igb_update_interrupt_state(core);
+}
+
+static void igb_set_eims(IGBCore *core, int index, uint32_t val)
+{
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
+
+    trace_igb_irq_write_eims(val, msix);
+
+    core->mac[EIMS] |=
+        val & (msix ? E1000_EICR_MSIX_MASK : E1000_EICR_LEGACY_MASK);
+
+    igb_update_interrupt_state(core);
+}
+
+static void igb_vf_reset(IGBCore *core, uint16_t vfn)
+{
+    /* TODO: Reset of the queue enable and the interrupt registers of the VF. */
+
+    core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_RSTI;
+    core->mac[V2PMAILBOX0 + vfn] = E1000_V2PMAILBOX_RSTD;
+}
+
+static void mailbox_interrupt_to_vf(IGBCore *core, uint16_t vfn)
+{
+    uint32_t ent = core->mac[VTIVAR_MISC + vfn];
+
+    if ((ent & E1000_IVAR_VALID)) {
+        core->mac[EICR] |= (ent & 0x3) << (22 - vfn * 3);
+        igb_update_interrupt_state(core);
+    }
 }
 
-static inline bool
-igb_eitr_should_postpone(IGBCore *core, int idx)
+static void mailbox_interrupt_to_pf(IGBCore *core)
 {
-    return igb_postpone_interrupt(&core->eitr[idx]);
+    igb_set_interrupt_cause(core, E1000_ICR_VMMB);
 }
 
-static void
-igb_msix_notify_one(IGBCore *core, uint32_t cause, uint32_t int_cfg)
+static void igb_set_pfmailbox(IGBCore *core, int index, uint32_t val)
 {
-    uint32_t effective_eiac;
+    uint16_t vfn = index - P2VMAILBOX0;
 
-    if (E1000_IVAR_ENTRY_VALID(int_cfg)) {
-        uint32_t vec = E1000_IVAR_ENTRY_VEC(int_cfg);
-        if (vec < IGB_MSIX_VEC_NUM) {
-            if (!igb_eitr_should_postpone(core, vec)) {
-                trace_e1000e_irq_msix_notify_vec(vec);
-                msix_notify(core->owner, vec);
-            }
-        } else {
-            trace_e1000e_wrn_msix_vec_wrong(cause, int_cfg);
-        }
-    } else {
-        trace_e1000e_wrn_msix_invalid(cause, int_cfg);
-    }
+    trace_igb_set_pfmailbox(vfn, val);
 
-    if (core->mac[CTRL_EXT] & E1000_CTRL_EXT_EIAME) {
-        trace_e1000e_irq_iam_clear_eiame(core->mac[IAM], cause);
-        core->mac[IAM] &= ~cause;
+    if (val & E1000_P2VMAILBOX_STS) {
+        core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_PFSTS;
+        mailbox_interrupt_to_vf(core, vfn);
     }
 
-    trace_e1000e_irq_icr_clear_eiac(core->mac[ICR], core->mac[EIAC]);
-
-    effective_eiac = core->mac[EIAC] & cause;
+    if (val & E1000_P2VMAILBOX_ACK) {
+        core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_PFACK;
+        mailbox_interrupt_to_vf(core, vfn);
+    }
 
-    core->mac[ICR] &= ~effective_eiac;
-    core->msi_causes_pending &= ~effective_eiac;
+    /* Buffer Taken by PF (can be set only if the VFU is cleared). */
+    if (val & E1000_P2VMAILBOX_PFU) {
+        if (!(core->mac[index] & E1000_P2VMAILBOX_VFU)) {
+            core->mac[index] |= E1000_P2VMAILBOX_PFU;
+            core->mac[V2PMAILBOX0 + vfn] |= E1000_V2PMAILBOX_PFU;
+        }
+    } else {
+        core->mac[index] &= ~E1000_P2VMAILBOX_PFU;
+        core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_PFU;
+    }
 
-    if (!(core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
-        core->mac[IMS] &= ~effective_eiac;
+    if (val & E1000_P2VMAILBOX_RVFU) {
+        core->mac[V2PMAILBOX0 + vfn] &= ~E1000_V2PMAILBOX_VFU;
+        core->mac[MBVFICR] &= ~((E1000_MBVFICR_VFACK_VF1 << vfn) |
+                                (E1000_MBVFICR_VFREQ_VF1 << vfn));
     }
 }
 
-static void
-igb_msix_notify(IGBCore *core, uint32_t causes)
+static void igb_set_vfmailbox(IGBCore *core, int index, uint32_t val)
 {
-    if (causes & E1000_ICR_RXQ0) {
-        igb_msix_notify_one(core, E1000_ICR_RXQ0,
-                               E1000_IVAR_RXQ0(core->mac[IVAR]));
-    }
+    uint16_t vfn = index - V2PMAILBOX0;
 
-    if (causes & E1000_ICR_RXQ1) {
-        igb_msix_notify_one(core, E1000_ICR_RXQ1,
-                               E1000_IVAR_RXQ1(core->mac[IVAR]));
-    }
+    trace_igb_set_vfmailbox(vfn, val);
 
-    if (causes & E1000_ICR_TXQ0) {
-        igb_msix_notify_one(core, E1000_ICR_TXQ0,
-                               E1000_IVAR_TXQ0(core->mac[IVAR]));
+    if (val & E1000_V2PMAILBOX_REQ) {
+        core->mac[MBVFICR] |= E1000_MBVFICR_VFREQ_VF1 << vfn;
+        mailbox_interrupt_to_pf(core);
     }
 
-    if (causes & E1000_ICR_TXQ1) {
-        igb_msix_notify_one(core, E1000_ICR_TXQ1,
-                               E1000_IVAR_TXQ1(core->mac[IVAR]));
+    if (val & E1000_V2PMAILBOX_ACK) {
+        core->mac[MBVFICR] |= E1000_MBVFICR_VFACK_VF1 << vfn;
+        mailbox_interrupt_to_pf(core);
     }
 
-    if (causes & E1000_ICR_OTHER) {
-        igb_msix_notify_one(core, E1000_ICR_OTHER,
-                               E1000_IVAR_OTHER(core->mac[IVAR]));
+    /* Buffer Taken by VF (can be set only if the PFU is cleared). */
+    if (val & E1000_V2PMAILBOX_VFU) {
+        if (!(core->mac[index] & E1000_V2PMAILBOX_PFU)) {
+            core->mac[index] |= E1000_V2PMAILBOX_VFU;
+            core->mac[P2VMAILBOX0 + vfn] |= E1000_P2VMAILBOX_VFU;
+        }
+    } else {
+        core->mac[index] &= ~E1000_V2PMAILBOX_VFU;
+        core->mac[P2VMAILBOX0 + vfn] &= ~E1000_P2VMAILBOX_VFU;
     }
 }
 
-static void
-igb_msix_clear_one(IGBCore *core, uint32_t cause, uint32_t int_cfg)
+static void igb_w1c(IGBCore *core, int index, uint32_t val)
 {
-    if (E1000_IVAR_ENTRY_VALID(int_cfg)) {
-        uint32_t vec = E1000_IVAR_ENTRY_VEC(int_cfg);
-        if (vec < IGB_MSIX_VEC_NUM) {
-            trace_e1000e_irq_msix_pending_clearing(cause, int_cfg, vec);
-            msix_clr_pending(core->owner, vec);
-        } else {
-            trace_e1000e_wrn_msix_vec_wrong(cause, int_cfg);
-        }
-    } else {
-        trace_e1000e_wrn_msix_invalid(cause, int_cfg);
-    }
+    core->mac[index] &= ~val;
 }
 
-static void
-igb_msix_clear(IGBCore *core, uint32_t causes)
+static void igb_set_eimc(IGBCore *core, int index, uint32_t val)
 {
-    if (causes & E1000_ICR_RXQ0) {
-        igb_msix_clear_one(core, E1000_ICR_RXQ0,
-                              E1000_IVAR_RXQ0(core->mac[IVAR]));
-    }
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
 
-    if (causes & E1000_ICR_RXQ1) {
-        igb_msix_clear_one(core, E1000_ICR_RXQ1,
-                              E1000_IVAR_RXQ1(core->mac[IVAR]));
-    }
+    /* Interrupts are disabled via a write to EIMC and reflected in EIMS. */
+    core->mac[EIMS] &=
+        ~(val & (msix ? E1000_EICR_MSIX_MASK : E1000_EICR_LEGACY_MASK));
 
-    if (causes & E1000_ICR_TXQ0) {
-        igb_msix_clear_one(core, E1000_ICR_TXQ0,
-                              E1000_IVAR_TXQ0(core->mac[IVAR]));
-    }
+    trace_igb_irq_write_eimc(val, core->mac[EIMS], msix);
+    igb_update_interrupt_state(core);
+}
 
-    if (causes & E1000_ICR_TXQ1) {
-        igb_msix_clear_one(core, E1000_ICR_TXQ1,
-                              E1000_IVAR_TXQ1(core->mac[IVAR]));
-    }
+static void igb_set_eiac(IGBCore *core, int index, uint32_t val)
+{
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
+
+    if (msix) {
+        trace_igb_irq_write_eiac(val);
 
-    if (causes & E1000_ICR_OTHER) {
-        igb_msix_clear_one(core, E1000_ICR_OTHER,
-                              E1000_IVAR_OTHER(core->mac[IVAR]));
+        /*
+         * TODO: When using IOV, the bits that correspond to MSI-X vectors
+         * that are assigned to a VF are read-only.
+         */
+        core->mac[EIAC] |= (val & E1000_EICR_MSIX_MASK);
     }
 }
 
-static inline void
-igb_fix_icr_asserted(IGBCore *core)
+static void igb_set_eiam(IGBCore *core, int index, uint32_t val)
 {
-    core->mac[ICR] &= ~E1000_ICR_ASSERTED;
-    if (core->mac[ICR]) {
-        core->mac[ICR] |= E1000_ICR_ASSERTED;
-    }
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
 
-    trace_e1000e_irq_fix_icr_asserted(core->mac[ICR]);
+    /*
+     * TODO: When using IOV, the bits that correspond to MSI-X vectors that
+     * are assigned to a VF are read-only.
+     */
+    core->mac[EIAM] |=
+        ~(val & (msix ? E1000_EICR_MSIX_MASK : E1000_EICR_LEGACY_MASK));
+
+    trace_igb_irq_write_eiam(val, msix);
 }
 
-static void
-igb_send_msi(IGBCore *core, bool msix)
+static void igb_set_eicr(IGBCore *core, int index, uint32_t val)
 {
-    uint32_t causes = core->mac[ICR] & core->mac[IMS] & ~E1000_ICR_ASSERTED;
+    bool msix = !!(core->mac[GPIE] & E1000_GPIE_MSIX_MODE);
 
-    core->msi_causes_pending &= causes;
-    causes ^= core->msi_causes_pending;
-    if (causes == 0) {
-        return;
-    }
-    core->msi_causes_pending |= causes;
+    /*
+     * TODO: In IOV mode, only bit zero of this vector is available for the PF
+     * function.
+     */
+    core->mac[EICR] &=
+        ~(val & (msix ? E1000_EICR_MSIX_MASK : E1000_EICR_LEGACY_MASK));
 
-    if (msix) {
-        igb_msix_notify(core, causes);
-    } else {
-        if (!igb_itr_should_postpone(core)) {
-            trace_e1000e_irq_msi_notify(causes);
-            msi_notify(core->owner, 0);
-        }
-    }
+    trace_igb_irq_write_eicr(val, msix);
+    igb_update_interrupt_state(core);
 }
 
-static void
-igb_update_interrupt_state(IGBCore *core)
+static void igb_set_vtctrl(IGBCore *core, int index, uint32_t val)
 {
-    bool interrupts_pending;
-    bool is_msix = msix_enabled(core->owner);
+    uint16_t vfn;
 
-    /* Set ICR[OTHER] for MSI-X */
-    if (is_msix) {
-        if (core->mac[ICR] & E1000_ICR_OTHER_CAUSES) {
-            core->mac[ICR] |= E1000_ICR_OTHER;
-            trace_e1000e_irq_add_msi_other(core->mac[ICR]);
-        }
+    if (val & E1000_CTRL_RST) {
+        vfn = (index - PVTCTRL0) / 0x40;
+        igb_vf_reset(core, vfn);
     }
+}
 
-    igb_fix_icr_asserted(core);
+static void igb_set_vteics(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - PVTEICS0) / 0x40;
 
-    /*
-     * Make sure ICR and ICS registers have the same value.
-     * The spec says that the ICS register is write-only.  However in practice,
-     * on real hardware ICS is readable, and for reads it has the same value as
-     * ICR (except that ICS does not have the clear on read behaviour of ICR).
-     *
-     * The VxWorks PRO/1000 driver uses this behaviour.
-     */
-    core->mac[ICS] = core->mac[ICR];
+    core->mac[index] = val;
+    igb_set_eics(core, EICS, (val & 0x7) << (22 - vfn * 3));
+}
 
-    interrupts_pending = (core->mac[IMS] & core->mac[ICR]) ? true : false;
-    if (!interrupts_pending) {
-        core->msi_causes_pending = 0;
-    }
+static void igb_set_vteims(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - PVTEIMS0) / 0x40;
 
-    trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
-                                        core->mac[ICR], core->mac[IMS]);
+    core->mac[index] = val;
+    igb_set_eims(core, EIMS, (val & 0x7) << (22 - vfn * 3));
+}
 
-    if (is_msix || msi_enabled(core->owner)) {
-        if (interrupts_pending) {
-            igb_send_msi(core, is_msix);
-        }
-    } else {
-        if (interrupts_pending) {
-            if (!igb_itr_should_postpone(core)) {
-                igb_raise_legacy_irq(core);
-            }
-        } else {
-            igb_lower_legacy_irq(core);
-        }
-    }
+static void igb_set_vteimc(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - PVTEIMC0) / 0x40;
+
+    core->mac[index] = val;
+    igb_set_eimc(core, EIMC, (val & 0x7) << (22 - vfn * 3));
 }
 
-static void
-igb_set_interrupt_cause(IGBCore *core, uint32_t val)
+static void igb_set_vteiac(IGBCore *core, int index, uint32_t val)
 {
-    trace_e1000e_irq_set_cause_entry(val, core->mac[ICR]);
+    uint16_t vfn = (index - PVTEIAC0) / 0x40;
 
-    val |= igb_intmgr_collect_delayed_causes(core);
-    core->mac[ICR] |= val;
+    core->mac[index] = val;
+    igb_set_eiac(core, EIAC, (val & 0x7) << (22 - vfn * 3));
+}
 
-    trace_e1000e_irq_set_cause_exit(val, core->mac[ICR]);
+static void igb_set_vteiam(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - PVTEIAM0) / 0x40;
 
-    igb_update_interrupt_state(core);
+    core->mac[index] = val;
+    igb_set_eiam(core, EIAM, (val & 0x7) << (22 - vfn * 3));
+}
+
+static void igb_set_vteicr(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - PVTEICR0) / 0x40;
+
+    core->mac[index] = val;
+    igb_set_eicr(core, EICR, (val & 0x7) << (22 - vfn * 3));
+}
+
+static void igb_set_vtivar(IGBCore *core, int index, uint32_t val)
+{
+    uint16_t vfn = (index - VTIVAR);
+    uint16_t qn = vfn;
+    uint8_t ent;
+    int n;
+
+    core->mac[index] = val;
+
+    /* Get assigned vector associated with queue Rx#0. */
+    if ((val & E1000_IVAR_VALID)) {
+        n = igb_ivar_entry_rx(qn);
+        ent = E1000_IVAR_VALID | (24 - vfn * 3 - (2 - (val & 0x7)));
+        core->mac[IVAR0 + n / 4] |= ent << 8 * (n % 4);
+    }
+
+    /* Get assigned vector associated with queue Tx#0 */
+    ent = val >> 8;
+    if ((ent & E1000_IVAR_VALID)) {
+        n = igb_ivar_entry_tx(qn);
+        ent = E1000_IVAR_VALID | (24 - vfn * 3 - (2 - (ent & 0x7)));
+        core->mac[IVAR0 + n / 4] |= ent << 8 * (n % 4);
+    }
+
+    /*
+     * Ignoring assigned vectors associated with queues Rx#1 and Tx#1 for now.
+     */
 }
 
 static inline void
@@ -2234,7 +2037,7 @@ igb_autoneg_timer(void *opaque)
 {
     IGBCore *core = opaque;
     if (!qemu_get_queue(core->owner_nic)->link_down) {
-        e1000x_update_regs_on_autoneg_done(core->mac, core->phy[0]);
+        e1000x_update_regs_on_autoneg_done(core->mac, core->phy);
         igb_start_recv(core);
 
         igb_update_flowctl_status(core);
@@ -2250,78 +2053,37 @@ igb_get_reg_index_with_offset(const uint16_t *mac_reg_access, hwaddr addr)
     return index + (mac_reg_access[index] & 0xfffe);
 }
 
-static const char igb_phy_regcap[E1000E_PHY_PAGES][0x20] = {
-    [0] = {
-        [MII_BMCR]              = PHY_ANYPAGE | PHY_RW,
-        [MII_BMSR]              = PHY_ANYPAGE | PHY_R,
-        [MII_PHYID1]            = PHY_ANYPAGE | PHY_R,
-        [MII_PHYID2]            = PHY_ANYPAGE | PHY_R,
-        [MII_ANAR]              = PHY_ANYPAGE | PHY_RW,
-        [MII_ANLPAR]            = PHY_ANYPAGE | PHY_R,
-        [MII_ANER]              = PHY_ANYPAGE | PHY_R,
-        [MII_ANNP]              = PHY_ANYPAGE | PHY_RW,
-        [MII_ANLPRNP]           = PHY_ANYPAGE | PHY_R,
-        [MII_CTRL1000]          = PHY_ANYPAGE | PHY_RW,
-        [MII_STAT1000]          = PHY_ANYPAGE | PHY_R,
-        [MII_EXTSTAT]           = PHY_ANYPAGE | PHY_R,
-        [PHY_PAGE]              = PHY_ANYPAGE | PHY_RW,
-
-        [PHY_COPPER_CTRL1]      = PHY_RW,
-        [PHY_COPPER_STAT1]      = PHY_R,
-        [PHY_COPPER_CTRL3]      = PHY_RW,
-        [PHY_RX_ERR_CNTR]       = PHY_R,
-        [PHY_OEM_BITS]          = PHY_RW,
-        [PHY_BIAS_1]            = PHY_RW,
-        [PHY_BIAS_2]            = PHY_RW,
-        [PHY_COPPER_INT_ENABLE] = PHY_RW,
-        [PHY_COPPER_STAT2]      = PHY_R,
-        [PHY_COPPER_CTRL2]      = PHY_RW
-    },
-    [2] = {
-        [PHY_MAC_CTRL1]         = PHY_RW,
-        [PHY_MAC_INT_ENABLE]    = PHY_RW,
-        [PHY_MAC_STAT]          = PHY_R,
-        [PHY_MAC_CTRL2]         = PHY_RW
-    },
-    [3] = {
-        [PHY_LED_03_FUNC_CTRL1] = PHY_RW,
-        [PHY_LED_03_POL_CTRL]   = PHY_RW,
-        [PHY_LED_TIMER_CTRL]    = PHY_RW,
-        [PHY_LED_45_CTRL]       = PHY_RW
-    },
-    [5] = {
-        [PHY_1000T_SKEW]        = PHY_R,
-        [PHY_1000T_SWAP]        = PHY_R
-    },
-    [6] = {
-        [PHY_CRC_COUNTERS]      = PHY_R
-    }
+static const char igb_phy_regcap[MAX_PHY_REG_ADDRESS + 1] = {
+    [MII_BMCR]                   = PHY_RW,
+    [MII_BMSR]                   = PHY_R,
+    [MII_PHYID1]                 = PHY_R,
+    [MII_PHYID2]                 = PHY_R,
+    [MII_ANAR]                   = PHY_RW,
+    [MII_ANLPAR]                 = PHY_R,
+    [MII_ANER]                   = PHY_R,
+    [MII_ANNP]                   = PHY_RW,
+    [MII_ANLPRNP]                = PHY_R,
+    [MII_CTRL1000]               = PHY_RW,
+    [MII_STAT1000]               = PHY_R,
+    [MII_EXTSTAT]                = PHY_R,
+
+    [IGP01E1000_PHY_PORT_CONFIG] = PHY_RW,
+    [IGP01E1000_PHY_PORT_STATUS] = PHY_R,
+    [IGP01E1000_PHY_PORT_CTRL]   = PHY_RW,
+    [IGP01E1000_PHY_LINK_HEALTH] = PHY_R,
+    [IGP02E1000_PHY_POWER_MGMT]  = PHY_RW,
+    [IGP01E1000_PHY_PAGE_SELECT] = PHY_W
 };
 
-static bool
-igb_phy_reg_check_cap(IGBCore *core, uint32_t addr,
-                         char cap, uint8_t *page)
-{
-    *page = (igb_phy_regcap[0][addr] & PHY_ANYPAGE) ? 0
-                                                    : core->phy[0][PHY_PAGE];
-
-    if (*page >= E1000E_PHY_PAGES) {
-        return false;
-    }
-
-    return igb_phy_regcap[*page][addr] & cap;
-}
-
 static void
-igb_phy_reg_write(IGBCore *core, uint8_t page, uint32_t addr, uint16_t data)
+igb_phy_reg_write(IGBCore *core, uint32_t addr, uint16_t data)
 {
-    assert(page < E1000E_PHY_PAGES);
-    assert(addr < E1000E_PHY_PAGE_SIZE);
+    assert(addr <= MAX_PHY_REG_ADDRESS);
 
-    if (igb_phyreg_writeops[page][addr]) {
-        igb_phyreg_writeops[page][addr](core, addr, data);
+    if (addr == MII_BMCR) {
+        igb_set_phy_ctrl(core, data);
     } else {
-        core->phy[page][addr] = data;
+        core->phy[addr] = data;
     }
 }
 
@@ -2330,25 +2092,24 @@ igb_set_mdic(IGBCore *core, int index, uint32_t val)
 {
     uint32_t data = val & E1000_MDIC_DATA_MASK;
     uint32_t addr = ((val & E1000_MDIC_REG_MASK) >> E1000_MDIC_REG_SHIFT);
-    uint8_t page;
 
     if ((val & E1000_MDIC_PHY_MASK) >> E1000_MDIC_PHY_SHIFT != 1) { /* phy # */
         val = core->mac[MDIC] | E1000_MDIC_ERROR;
     } else if (val & E1000_MDIC_OP_READ) {
-        if (!igb_phy_reg_check_cap(core, addr, PHY_R, &page)) {
-            trace_e1000e_core_mdic_read_unhandled(page, addr);
+        if (!(igb_phy_regcap[addr] & PHY_R)) {
+            trace_igb_core_mdic_read_unhandled(addr);
             val |= E1000_MDIC_ERROR;
         } else {
-            val = (val ^ data) | core->phy[page][addr];
-            trace_e1000e_core_mdic_read(page, addr, val);
+            val = (val ^ data) | core->phy[addr];
+            trace_igb_core_mdic_read(addr, val);
         }
     } else if (val & E1000_MDIC_OP_WRITE) {
-        if (!igb_phy_reg_check_cap(core, addr, PHY_W, &page)) {
-            trace_e1000e_core_mdic_write_unhandled(page, addr);
+        if (!(igb_phy_regcap[addr] & PHY_W)) {
+            trace_igb_core_mdic_write_unhandled(addr);
             val |= E1000_MDIC_ERROR;
         } else {
-            trace_e1000e_core_mdic_write(page, addr, data);
-            igb_phy_reg_write(core, page, addr, data);
+            trace_igb_core_mdic_write(addr, data);
+            igb_phy_reg_write(core, addr, data);
         }
     }
     core->mac[MDIC] = val | E1000_MDIC_READY;
@@ -2380,6 +2141,8 @@ igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
     trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
                                      !!(val & E1000_CTRL_EXT_SPD_BYPS));
 
+    /* TODO: PFRSTD */
+
     /* Zero self-clearing bits */
     val &= ~(E1000_CTRL_EXT_ASDCHK | E1000_CTRL_EXT_EE_RST);
     core->mac[CTRL_EXT] = val;
@@ -2423,23 +2186,13 @@ igb_set_fcrtl(IGBCore *core, int index, uint32_t val)
     }
 
 IGB_LOW_BITS_SET_FUNC(4)
-IGB_LOW_BITS_SET_FUNC(6)
-IGB_LOW_BITS_SET_FUNC(11)
-IGB_LOW_BITS_SET_FUNC(12)
 IGB_LOW_BITS_SET_FUNC(13)
 IGB_LOW_BITS_SET_FUNC(16)
 
-static void
-igb_set_vet(IGBCore *core, int index, uint32_t val)
-{
-    core->mac[VET] = val & 0xffff;
-    trace_e1000e_vlan_vet(core->mac[VET]);
-}
-
 static void
 igb_set_dlen(IGBCore *core, int index, uint32_t val)
 {
-    core->mac[index] = val & E1000_XDLEN_MASK;
+    core->mac[index] = val & 0xffff0;
 }
 
 static void
@@ -2448,36 +2201,16 @@ igb_set_dbal(IGBCore *core, int index, uint32_t val)
     core->mac[index] = val & E1000_XDBAL_MASK;
 }
 
-static void
-igb_set_tctl(IGBCore *core, int index, uint32_t val)
-{
-    IGB_TxRing txr;
-    core->mac[index] = val;
-
-    if (core->mac[TARC0] & E1000_TARC_ENABLE) {
-        igb_tx_ring_init(core, &txr, 0);
-        igb_start_xmit(core, &txr);
-    }
-
-    if (core->mac[TARC1] & E1000_TARC_ENABLE) {
-        igb_tx_ring_init(core, &txr, 1);
-        igb_start_xmit(core, &txr);
-    }
-}
-
 static void
 igb_set_tdt(IGBCore *core, int index, uint32_t val)
 {
     IGB_TxRing txr;
-    int qidx = igb_mq_queue_idx(TDT, index);
-    uint32_t tarc_reg = (qidx == 0) ? TARC0 : TARC1;
+    int qn = igb_mq_queue_idx(TDT0, index);
 
     core->mac[index] = val & 0xffff;
 
-    if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
-        igb_tx_ring_init(core, &txr, qidx);
-        igb_start_xmit(core, &txr);
-    }
+    igb_tx_ring_init(core, &txr, qn);
+    igb_start_xmit(core, &txr);
 }
 
 static void
@@ -2487,27 +2220,6 @@ igb_set_ics(IGBCore *core, int index, uint32_t val)
     igb_set_interrupt_cause(core, val);
 }
 
-static void
-igb_set_icr(IGBCore *core, int index, uint32_t val)
-{
-    uint32_t icr = 0;
-    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
-        (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
-        trace_e1000e_irq_icr_process_iame();
-        igb_clear_ims_bits(core, core->mac[IAM]);
-    }
-
-    icr = core->mac[ICR] & ~val;
-    /*
-     * Windows driver expects that the "receive overrun" bit and other
-     * ones to be cleared when the "Other" bit (#24) is cleared.
-     */
-    icr = (val & E1000_ICR_OTHER) ? (icr & ~E1000_ICR_OTHER_CAUSES) : icr;
-    trace_e1000e_irq_icr_write(val, core->mac[ICR], icr);
-    core->mac[ICR] = icr;
-    igb_update_interrupt_state(core);
-}
-
 static void
 igb_set_imc(IGBCore *core, int index, uint32_t val)
 {
@@ -2519,63 +2231,35 @@ igb_set_imc(IGBCore *core, int index, uint32_t val)
 static void
 igb_set_ims(IGBCore *core, int index, uint32_t val)
 {
-    static const uint32_t ims_ext_mask =
-        E1000_IMS_RXQ0 | E1000_IMS_RXQ1 |
-        E1000_IMS_TXQ0 | E1000_IMS_TXQ1 |
-        E1000_IMS_OTHER;
-
-    static const uint32_t ims_valid_mask =
-        E1000_IMS_TXDW      | E1000_IMS_TXQE    | E1000_IMS_LSC  |
-        E1000_IMS_RXDMT0    | E1000_IMS_RXO     | E1000_IMS_RXT0 |
-        E1000_IMS_MDAC      | E1000_IMS_TXD_LOW | E1000_IMS_SRPD |
-        E1000_IMS_ACK       | E1000_IMS_MNG     | E1000_IMS_RXQ0 |
-        E1000_IMS_RXQ1      | E1000_IMS_TXQ0    | E1000_IMS_TXQ1 |
-        E1000_IMS_OTHER;
-
-    uint32_t valid_val = val & ims_valid_mask;
+    uint32_t valid_val = val & 0x77D4FBFD;
 
     trace_e1000e_irq_set_ims(val, core->mac[IMS], core->mac[IMS] | valid_val);
     core->mac[IMS] |= valid_val;
-
-    if ((valid_val & ims_ext_mask) &&
-        (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PBA_CLR) &&
-        msix_enabled(core->owner)) {
-        igb_msix_clear(core, valid_val);
-    }
-
-    if ((valid_val == ims_valid_mask) &&
-        (core->mac[CTRL_EXT] & E1000_CTRL_EXT_INT_TIMERS_CLEAR_ENA)) {
-        trace_e1000e_irq_fire_all_timers(val);
-        igb_intrmgr_fire_all_timers(core);
-    }
-
     igb_update_interrupt_state(core);
 }
 
-static void
-igb_set_rdtr(IGBCore *core, int index, uint32_t val)
+static void igb_commit_icr(IGBCore *core)
 {
-    igb_set_16bit(core, index, val);
-
-    if ((val & E1000_RDTR_FPD) && (core->rdtr.running)) {
-        trace_e1000e_irq_rdtr_fpd_running();
-        igb_intrmgr_fire_delayed_interrupts(core);
+    /*
+     * If GPIE.NSICR = 0, then the copy of IAM to IMS will occur only if at
+     * least one bit is set in the IMS and there is a true interrupt as
+     * reflected in ICR.INTA.
+     */
+    if ((core->mac[GPIE] & E1000_GPIE_NSICR) ||
+        (core->mac[IMS] && (core->mac[ICR] & E1000_ICR_INT_ASSERTED))) {
+        igb_set_ims(core, IMS, core->mac[IAM]);
     } else {
-        trace_e1000e_irq_rdtr_fpd_not_running();
+        igb_update_interrupt_state(core);
     }
 }
 
-static void
-igb_set_tidv(IGBCore *core, int index, uint32_t val)
+static void igb_set_icr(IGBCore *core, int index, uint32_t val)
 {
-    igb_set_16bit(core, index, val);
+    uint32_t icr = core->mac[ICR] & ~val;
 
-    if ((val & E1000_TIDV_FPD) && (core->tidv.running)) {
-        trace_e1000e_irq_tidv_fpd_running();
-        igb_intrmgr_fire_delayed_interrupts(core);
-    } else {
-        trace_e1000e_irq_tidv_fpd_not_running();
-    }
+    trace_igb_irq_icr_write(val, core->mac[ICR], icr);
+    core->mac[ICR] = icr;
+    igb_commit_icr(core);
 }
 
 static uint32_t
@@ -2607,15 +2291,19 @@ igb_mac_swsm_read(IGBCore *core, int index)
 }
 
 static uint32_t
-igb_mac_itr_read(IGBCore *core, int index)
+igb_mac_eitr_read(IGBCore *core, int index)
 {
-    return core->itr_guest_value;
+    return core->eitr_guest_value[index - EITR0];
 }
 
-static uint32_t
-igb_mac_eitr_read(IGBCore *core, int index)
+static uint32_t igb_mac_vfmailbox_read(IGBCore *core, int index)
 {
-    return core->eitr_guest_value[index - EITR];
+    uint32_t val = core->mac[index];
+
+    core->mac[index] &= ~(E1000_V2PMAILBOX_PFSTS | E1000_V2PMAILBOX_PFACK |
+                          E1000_V2PMAILBOX_RSTD);
+
+    return val;
 }
 
 static uint32_t
@@ -2624,26 +2312,19 @@ igb_mac_icr_read(IGBCore *core, int index)
     uint32_t ret = core->mac[ICR];
     trace_e1000e_irq_icr_read_entry(ret);
 
-    if (core->mac[IMS] == 0) {
+    if (core->mac[GPIE] & E1000_GPIE_NSICR) {
+        trace_igb_irq_icr_clear_gpie_nsicr();
+        core->mac[ICR] = 0;
+    } else if (core->mac[IMS] == 0) {
         trace_e1000e_irq_icr_clear_zero_ims();
         core->mac[ICR] = 0;
-    }
-
-    if (!msix_enabled(core->owner)) {
+    } else if (!msix_enabled(core->owner)) {
         trace_e1000e_irq_icr_clear_nonmsix_icr_read();
         core->mac[ICR] = 0;
     }
 
-    if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
-        (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
-        trace_e1000e_irq_icr_clear_iame();
-        core->mac[ICR] = 0;
-        trace_e1000e_irq_icr_process_iame();
-        igb_clear_ims_bits(core, core->mac[IAM]);
-    }
-
     trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
-    igb_update_interrupt_state(core);
+    igb_commit_icr(core);
     return ret;
 }
 
@@ -2682,14 +2363,10 @@ igb_get_ctrl(IGBCore *core, int index)
     return val;
 }
 
-static uint32_t
-igb_get_status(IGBCore *core, int index)
+static uint32_t igb_get_status(IGBCore *core, int index)
 {
     uint32_t res = core->mac[STATUS];
-
-    if (!(core->mac[CTRL] & E1000_CTRL_GIO_MASTER_DISABLE)) {
-        res |= E1000_STATUS_GIO_MASTER_ENABLE;
-    }
+    uint16_t num_vfs = pcie_sriov_num_vfs(core->owner);
 
     if (core->mac[CTRL] & E1000_CTRL_FRCDPX) {
         res |= (core->mac[CTRL] & E1000_CTRL_FD) ? E1000_STATUS_FD : 0;
@@ -2715,23 +2392,21 @@ igb_get_status(IGBCore *core, int index)
         res |= E1000_STATUS_SPEED_1000;
     }
 
-    trace_e1000e_link_status(
-        !!(res & E1000_STATUS_LU),
-        !!(res & E1000_STATUS_FD),
-        (res & E1000_STATUS_SPEED_MASK) >> E1000_STATUS_SPEED_SHIFT,
-        (res & E1000_STATUS_ASDV) >> E1000_STATUS_ASDV_SHIFT);
+    if (num_vfs) {
+        res |= num_vfs << E1000_STATUS_NUM_VFS_SHIFT;
+        res |= E1000_STATUS_IOV_MODE;
+    }
 
-    return res;
-}
+    /*
+     * Windows driver 12.18.9.23 resets if E1000_STATUS_GIO_MASTER_ENABLE is
+     * left set after E1000_CTRL_LRST is set.
+     */
+    if (!(core->mac[CTRL] & E1000_CTRL_GIO_MASTER_DISABLE) &&
+        !(core->mac[CTRL] & E1000_CTRL_LRST)) {
+        res |= E1000_STATUS_GIO_MASTER_ENABLE;
+    }
 
-static uint32_t
-igb_get_tarc(IGBCore *core, int index)
-{
-    return core->mac[index] & ((BIT(11) - 1) |
-                                BIT(27)      |
-                                BIT(28)      |
-                                BIT(29)      |
-                                BIT(30));
+    return res;
 }
 
 static void
@@ -2782,71 +2457,15 @@ igb_set_eerd(IGBCore *core, int index, uint32_t val)
                       (data << E1000_EERW_DATA_SHIFT);
 }
 
-static void
-igb_set_eewr(IGBCore *core, int index, uint32_t val)
-{
-    uint32_t addr = (val >> E1000_EERW_ADDR_SHIFT) & E1000_EERW_ADDR_MASK;
-    uint32_t data = (val >> E1000_EERW_DATA_SHIFT) & E1000_EERW_DATA_MASK;
-    uint32_t flags = 0;
-
-    if ((addr < IGB_EEPROM_SIZE) && (val & E1000_EERW_START)) {
-        core->eeprom[addr] = data;
-        flags = E1000_EERW_DONE;
-    }
-
-    core->mac[EERD] = flags                           |
-                      (addr << E1000_EERW_ADDR_SHIFT) |
-                      (data << E1000_EERW_DATA_SHIFT);
-}
-
-static void
-igb_set_rxdctl(IGBCore *core, int index, uint32_t val)
-{
-    core->mac[RXDCTL] = core->mac[RXDCTL1] = val;
-}
-
-static void
-igb_set_itr(IGBCore *core, int index, uint32_t val)
-{
-    uint32_t interval = val & 0xffff;
-
-    trace_e1000e_irq_itr_set(val);
-
-    core->itr_guest_value = interval;
-    core->mac[index] = MAX(interval, E1000E_MIN_XITR);
-}
-
 static void
 igb_set_eitr(IGBCore *core, int index, uint32_t val)
 {
-    uint32_t interval = val & 0xffff;
-    uint32_t eitr_num = index - EITR;
-
-    trace_e1000e_irq_eitr_set(eitr_num, val);
-
-    core->eitr_guest_value[eitr_num] = interval;
-    core->mac[index] = MAX(interval, E1000E_MIN_XITR);
-}
-
-static void
-igb_set_psrctl(IGBCore *core, int index, uint32_t val)
-{
-    if (core->mac[RCTL] & E1000_RCTL_DTYP_MASK) {
+    uint32_t eitr_num = index - EITR0;
 
-        if ((val & E1000_PSRCTL_BSIZE0_MASK) == 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "igb: PSRCTL.BSIZE0 cannot be zero");
-            return;
-        }
-
-        if ((val & E1000_PSRCTL_BSIZE1_MASK) == 0) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "igb: PSRCTL.BSIZE1 cannot be zero");
-            return;
-        }
-    }
+    trace_igb_irq_eitr_set(eitr_num, val);
 
-    core->mac[PSRCTL] = val;
+    core->eitr_guest_value[eitr_num] = val & ~E1000_EITR_CNT_IGNR;
+    core->mac[index] = val & 0x7FFE;
 }
 
 static void
@@ -2855,11 +2474,6 @@ igb_update_rx_offloads(IGBCore *core)
     int cso_state = igb_rx_l4_cso_enabled(core);
 
     trace_e1000e_rx_set_cso(cso_state);
-
-    if (core->has_vnet) {
-        qemu_set_offload(qemu_get_queue(core->owner_nic)->peer,
-                         cso_state, 0, 0, 0, 0);
-    }
 }
 
 static void
@@ -2879,26 +2493,97 @@ igb_set_gcr(IGBCore *core, int index, uint32_t val)
 #define igb_getreg(x)    [x] = igb_mac_readreg
 typedef uint32_t (*readops)(IGBCore *, int);
 static const readops igb_macreg_readops[] = {
-    igb_getreg(PBA),
     igb_getreg(WUFC),
     igb_getreg(MANC),
     igb_getreg(TOTL),
     igb_getreg(RDT0),
+    igb_getreg(RDT1),
+    igb_getreg(RDT2),
+    igb_getreg(RDT3),
+    igb_getreg(RDT4),
+    igb_getreg(RDT5),
+    igb_getreg(RDT6),
+    igb_getreg(RDT7),
+    igb_getreg(RDT8),
+    igb_getreg(RDT9),
+    igb_getreg(RDT10),
+    igb_getreg(RDT11),
+    igb_getreg(RDT12),
+    igb_getreg(RDT13),
+    igb_getreg(RDT14),
+    igb_getreg(RDT15),
     igb_getreg(RDBAH0),
+    igb_getreg(RDBAH1),
+    igb_getreg(RDBAH2),
+    igb_getreg(RDBAH3),
+    igb_getreg(RDBAH4),
+    igb_getreg(RDBAH5),
+    igb_getreg(RDBAH6),
+    igb_getreg(RDBAH7),
+    igb_getreg(RDBAH8),
+    igb_getreg(RDBAH9),
+    igb_getreg(RDBAH10),
+    igb_getreg(RDBAH11),
+    igb_getreg(RDBAH12),
+    igb_getreg(RDBAH13),
+    igb_getreg(RDBAH14),
+    igb_getreg(RDBAH15),
+    igb_getreg(TDBAL0),
     igb_getreg(TDBAL1),
+    igb_getreg(TDBAL2),
+    igb_getreg(TDBAL3),
+    igb_getreg(TDBAL4),
+    igb_getreg(TDBAL5),
+    igb_getreg(TDBAL6),
+    igb_getreg(TDBAL7),
+    igb_getreg(TDBAL8),
+    igb_getreg(TDBAL9),
+    igb_getreg(TDBAL10),
+    igb_getreg(TDBAL11),
+    igb_getreg(TDBAL12),
+    igb_getreg(TDBAL13),
+    igb_getreg(TDBAL14),
+    igb_getreg(TDBAL15),
     igb_getreg(RDLEN0),
-    igb_getreg(RDH1),
+    igb_getreg(RDLEN1),
+    igb_getreg(RDLEN2),
+    igb_getreg(RDLEN3),
+    igb_getreg(RDLEN4),
+    igb_getreg(RDLEN5),
+    igb_getreg(RDLEN6),
+    igb_getreg(RDLEN7),
+    igb_getreg(RDLEN8),
+    igb_getreg(RDLEN9),
+    igb_getreg(RDLEN10),
+    igb_getreg(RDLEN11),
+    igb_getreg(RDLEN12),
+    igb_getreg(RDLEN13),
+    igb_getreg(RDLEN14),
+    igb_getreg(RDLEN15),
+    igb_getreg(SRRCTL0),
+    igb_getreg(SRRCTL1),
+    igb_getreg(SRRCTL2),
+    igb_getreg(SRRCTL3),
+    igb_getreg(SRRCTL4),
+    igb_getreg(SRRCTL5),
+    igb_getreg(SRRCTL6),
+    igb_getreg(SRRCTL7),
+    igb_getreg(SRRCTL8),
+    igb_getreg(SRRCTL9),
+    igb_getreg(SRRCTL10),
+    igb_getreg(SRRCTL11),
+    igb_getreg(SRRCTL12),
+    igb_getreg(SRRCTL13),
+    igb_getreg(SRRCTL14),
+    igb_getreg(SRRCTL15),
     igb_getreg(LATECOL),
-    igb_getreg(SEQEC),
     igb_getreg(XONTXC),
-    igb_getreg(AIT),
     igb_getreg(TDFH),
     igb_getreg(TDFT),
     igb_getreg(TDFHS),
     igb_getreg(TDFTS),
     igb_getreg(TDFPC),
     igb_getreg(WUS),
-    igb_getreg(PBS),
     igb_getreg(RDFH),
     igb_getreg(RDFT),
     igb_getreg(RDFHS),
@@ -2908,49 +2593,84 @@ static const readops igb_macreg_readops[] = {
     igb_getreg(MGTPRC),
     igb_getreg(EERD),
     igb_getreg(EIAC),
-    igb_getreg(PSRCTL),
     igb_getreg(MANC2H),
     igb_getreg(RXCSUM),
     igb_getreg(GSCL_3),
     igb_getreg(GSCN_2),
-    igb_getreg(RSRPD),
-    igb_getreg(RDBAL1),
     igb_getreg(FCAH),
     igb_getreg(FCRTH),
     igb_getreg(FLOP),
-    igb_getreg(FLASHT),
     igb_getreg(RXSTMPH),
     igb_getreg(TXSTMPL),
     igb_getreg(TIMADJL),
-    igb_getreg(TXDCTL),
     igb_getreg(RDH0),
+    igb_getreg(RDH1),
+    igb_getreg(RDH2),
+    igb_getreg(RDH3),
+    igb_getreg(RDH4),
+    igb_getreg(RDH5),
+    igb_getreg(RDH6),
+    igb_getreg(RDH7),
+    igb_getreg(RDH8),
+    igb_getreg(RDH9),
+    igb_getreg(RDH10),
+    igb_getreg(RDH11),
+    igb_getreg(RDH12),
+    igb_getreg(RDH13),
+    igb_getreg(RDH14),
+    igb_getreg(RDH15),
+    igb_getreg(TDT0),
     igb_getreg(TDT1),
+    igb_getreg(TDT2),
+    igb_getreg(TDT3),
+    igb_getreg(TDT4),
+    igb_getreg(TDT5),
+    igb_getreg(TDT6),
+    igb_getreg(TDT7),
+    igb_getreg(TDT8),
+    igb_getreg(TDT9),
+    igb_getreg(TDT10),
+    igb_getreg(TDT11),
+    igb_getreg(TDT12),
+    igb_getreg(TDT13),
+    igb_getreg(TDT14),
+    igb_getreg(TDT15),
     igb_getreg(TNCRS),
     igb_getreg(RJC),
     igb_getreg(IAM),
     igb_getreg(GSCL_2),
-    igb_getreg(RDBAH1),
-    igb_getreg(FLSWDATA),
     igb_getreg(RXSATRH),
     igb_getreg(TIPG),
     igb_getreg(FLMNGCTL),
     igb_getreg(FLMNGCNT),
     igb_getreg(TSYNCTXCTL),
-    igb_getreg(EXTCNF_SIZE),
-    igb_getreg(EXTCNF_CTRL),
     igb_getreg(EEMNGDATA),
     igb_getreg(CTRL_EXT),
     igb_getreg(SYSTIMH),
     igb_getreg(EEMNGCTL),
     igb_getreg(FLMNGDATA),
     igb_getreg(TSYNCRXCTL),
-    igb_getreg(TDH),
     igb_getreg(LEDCTL),
     igb_getreg(TCTL),
-    igb_getreg(TDBAL),
-    igb_getreg(TDLEN),
+    igb_getreg(TCTL_EXT),
+    igb_getreg(DTXCTL),
+    igb_getreg(RXPBS),
+    igb_getreg(TDH0),
     igb_getreg(TDH1),
-    igb_getreg(RADV),
+    igb_getreg(TDH2),
+    igb_getreg(TDH3),
+    igb_getreg(TDH4),
+    igb_getreg(TDH5),
+    igb_getreg(TDH6),
+    igb_getreg(TDH7),
+    igb_getreg(TDH8),
+    igb_getreg(TDH9),
+    igb_getreg(TDH10),
+    igb_getreg(TDH11),
+    igb_getreg(TDH12),
+    igb_getreg(TDH13),
+    igb_getreg(TDH14),
+    igb_getreg(TDH15),
     igb_getreg(ECOL),
     igb_getreg(DC),
     igb_getreg(RLEC),
@@ -2959,70 +2679,279 @@ static const readops igb_macreg_readops[] = {
     igb_getreg(RNBC),
     igb_getreg(MGTPTC),
     igb_getreg(TIMINCA),
-    igb_getreg(RXCFGL),
-    igb_getreg(MFUTP01),
     igb_getreg(FACTPS),
     igb_getreg(GSCL_1),
     igb_getreg(GSCN_0),
-    igb_getreg(GCR2),
-    igb_getreg(RDT1),
     igb_getreg(PBACLR),
     igb_getreg(FCTTV),
-    igb_getreg(EEWR),
-    igb_getreg(FLSWCTL),
-    igb_getreg(RXDCTL1),
     igb_getreg(RXSATRL),
     igb_getreg(SYSTIML),
-    igb_getreg(RXUDP),
     igb_getreg(TORL),
+    igb_getreg(TDLEN0),
     igb_getreg(TDLEN1),
+    igb_getreg(TDLEN2),
+    igb_getreg(TDLEN3),
+    igb_getreg(TDLEN4),
+    igb_getreg(TDLEN5),
+    igb_getreg(TDLEN6),
+    igb_getreg(TDLEN7),
+    igb_getreg(TDLEN8),
+    igb_getreg(TDLEN9),
+    igb_getreg(TDLEN10),
+    igb_getreg(TDLEN11),
+    igb_getreg(TDLEN12),
+    igb_getreg(TDLEN13),
+    igb_getreg(TDLEN14),
+    igb_getreg(TDLEN15),
     igb_getreg(MCC),
     igb_getreg(WUC),
     igb_getreg(EECD),
-    igb_getreg(MFUTP23),
-    igb_getreg(RAID),
     igb_getreg(FCRTV),
+    igb_getreg(TXDCTL0),
     igb_getreg(TXDCTL1),
+    igb_getreg(TXDCTL2),
+    igb_getreg(TXDCTL3),
+    igb_getreg(TXDCTL4),
+    igb_getreg(TXDCTL5),
+    igb_getreg(TXDCTL6),
+    igb_getreg(TXDCTL7),
+    igb_getreg(TXDCTL8),
+    igb_getreg(TXDCTL9),
+    igb_getreg(TXDCTL10),
+    igb_getreg(TXDCTL11),
+    igb_getreg(TXDCTL12),
+    igb_getreg(TXDCTL13),
+    igb_getreg(TXDCTL14),
+    igb_getreg(TXDCTL15),
+    igb_getreg(TXCTL0),
+    igb_getreg(TXCTL1),
+    igb_getreg(TXCTL2),
+    igb_getreg(TXCTL3),
+    igb_getreg(TXCTL4),
+    igb_getreg(TXCTL5),
+    igb_getreg(TXCTL6),
+    igb_getreg(TXCTL7),
+    igb_getreg(TXCTL8),
+    igb_getreg(TXCTL9),
+    igb_getreg(TXCTL10),
+    igb_getreg(TXCTL11),
+    igb_getreg(TXCTL12),
+    igb_getreg(TXCTL13),
+    igb_getreg(TXCTL14),
+    igb_getreg(TXCTL15),
+    igb_getreg(TDWBAL0),
+    igb_getreg(TDWBAL1),
+    igb_getreg(TDWBAL2),
+    igb_getreg(TDWBAL3),
+    igb_getreg(TDWBAL4),
+    igb_getreg(TDWBAL5),
+    igb_getreg(TDWBAL6),
+    igb_getreg(TDWBAL7),
+    igb_getreg(TDWBAL8),
+    igb_getreg(TDWBAL9),
+    igb_getreg(TDWBAL10),
+    igb_getreg(TDWBAL11),
+    igb_getreg(TDWBAL12),
+    igb_getreg(TDWBAL13),
+    igb_getreg(TDWBAL14),
+    igb_getreg(TDWBAL15),
+    igb_getreg(TDWBAH0),
+    igb_getreg(TDWBAH1),
+    igb_getreg(TDWBAH2),
+    igb_getreg(TDWBAH3),
+    igb_getreg(TDWBAH4),
+    igb_getreg(TDWBAH5),
+    igb_getreg(TDWBAH6),
+    igb_getreg(TDWBAH7),
+    igb_getreg(TDWBAH8),
+    igb_getreg(TDWBAH9),
+    igb_getreg(TDWBAH10),
+    igb_getreg(TDWBAH11),
+    igb_getreg(TDWBAH12),
+    igb_getreg(TDWBAH13),
+    igb_getreg(TDWBAH14),
+    igb_getreg(TDWBAH15),
+    igb_getreg(PVTCTRL0),
+    igb_getreg(PVTCTRL1),
+    igb_getreg(PVTCTRL2),
+    igb_getreg(PVTCTRL3),
+    igb_getreg(PVTCTRL4),
+    igb_getreg(PVTCTRL5),
+    igb_getreg(PVTCTRL6),
+    igb_getreg(PVTCTRL7),
+    igb_getreg(PVTEIMS0),
+    igb_getreg(PVTEIMS1),
+    igb_getreg(PVTEIMS2),
+    igb_getreg(PVTEIMS3),
+    igb_getreg(PVTEIMS4),
+    igb_getreg(PVTEIMS5),
+    igb_getreg(PVTEIMS6),
+    igb_getreg(PVTEIMS7),
+    igb_getreg(PVTEIAC0),
+    igb_getreg(PVTEIAC1),
+    igb_getreg(PVTEIAC2),
+    igb_getreg(PVTEIAC3),
+    igb_getreg(PVTEIAC4),
+    igb_getreg(PVTEIAC5),
+    igb_getreg(PVTEIAC6),
+    igb_getreg(PVTEIAC7),
+    igb_getreg(PVTEIAM0),
+    igb_getreg(PVTEIAM1),
+    igb_getreg(PVTEIAM2),
+    igb_getreg(PVTEIAM3),
+    igb_getreg(PVTEIAM4),
+    igb_getreg(PVTEIAM5),
+    igb_getreg(PVTEIAM6),
+    igb_getreg(PVTEIAM7),
+    igb_getreg(PVFGPRC0),
+    igb_getreg(PVFGPRC1),
+    igb_getreg(PVFGPRC2),
+    igb_getreg(PVFGPRC3),
+    igb_getreg(PVFGPRC4),
+    igb_getreg(PVFGPRC5),
+    igb_getreg(PVFGPRC6),
+    igb_getreg(PVFGPRC7),
+    igb_getreg(PVFGPTC0),
+    igb_getreg(PVFGPTC1),
+    igb_getreg(PVFGPTC2),
+    igb_getreg(PVFGPTC3),
+    igb_getreg(PVFGPTC4),
+    igb_getreg(PVFGPTC5),
+    igb_getreg(PVFGPTC6),
+    igb_getreg(PVFGPTC7),
+    igb_getreg(PVFGORC0),
+    igb_getreg(PVFGORC1),
+    igb_getreg(PVFGORC2),
+    igb_getreg(PVFGORC3),
+    igb_getreg(PVFGORC4),
+    igb_getreg(PVFGORC5),
+    igb_getreg(PVFGORC6),
+    igb_getreg(PVFGORC7),
+    igb_getreg(PVFGOTC0),
+    igb_getreg(PVFGOTC1),
+    igb_getreg(PVFGOTC2),
+    igb_getreg(PVFGOTC3),
+    igb_getreg(PVFGOTC4),
+    igb_getreg(PVFGOTC5),
+    igb_getreg(PVFGOTC6),
+    igb_getreg(PVFGOTC7),
+    igb_getreg(PVFMPRC0),
+    igb_getreg(PVFMPRC1),
+    igb_getreg(PVFMPRC2),
+    igb_getreg(PVFMPRC3),
+    igb_getreg(PVFMPRC4),
+    igb_getreg(PVFMPRC5),
+    igb_getreg(PVFMPRC6),
+    igb_getreg(PVFMPRC7),
+    igb_getreg(PVFGPRLBC0),
+    igb_getreg(PVFGPRLBC1),
+    igb_getreg(PVFGPRLBC2),
+    igb_getreg(PVFGPRLBC3),
+    igb_getreg(PVFGPRLBC4),
+    igb_getreg(PVFGPRLBC5),
+    igb_getreg(PVFGPRLBC6),
+    igb_getreg(PVFGPRLBC7),
+    igb_getreg(PVFGPTLBC0),
+    igb_getreg(PVFGPTLBC1),
+    igb_getreg(PVFGPTLBC2),
+    igb_getreg(PVFGPTLBC3),
+    igb_getreg(PVFGPTLBC4),
+    igb_getreg(PVFGPTLBC5),
+    igb_getreg(PVFGPTLBC6),
+    igb_getreg(PVFGPTLBC7),
+    igb_getreg(PVFGORLBC0),
+    igb_getreg(PVFGORLBC1),
+    igb_getreg(PVFGORLBC2),
+    igb_getreg(PVFGORLBC3),
+    igb_getreg(PVFGORLBC4),
+    igb_getreg(PVFGORLBC5),
+    igb_getreg(PVFGORLBC6),
+    igb_getreg(PVFGORLBC7),
+    igb_getreg(PVFGOTLBC0),
+    igb_getreg(PVFGOTLBC1),
+    igb_getreg(PVFGOTLBC2),
+    igb_getreg(PVFGOTLBC3),
+    igb_getreg(PVFGOTLBC4),
+    igb_getreg(PVFGOTLBC5),
+    igb_getreg(PVFGOTLBC6),
+    igb_getreg(PVFGOTLBC7),
     igb_getreg(RCTL),
-    igb_getreg(TDT),
     igb_getreg(MDIC),
     igb_getreg(FCRUC),
     igb_getreg(VET),
     igb_getreg(RDBAL0),
+    igb_getreg(RDBAL1),
+    igb_getreg(RDBAL2),
+    igb_getreg(RDBAL3),
+    igb_getreg(RDBAL4),
+    igb_getreg(RDBAL5),
+    igb_getreg(RDBAL6),
+    igb_getreg(RDBAL7),
+    igb_getreg(RDBAL8),
+    igb_getreg(RDBAL9),
+    igb_getreg(RDBAL10),
+    igb_getreg(RDBAL11),
+    igb_getreg(RDBAL12),
+    igb_getreg(RDBAL13),
+    igb_getreg(RDBAL14),
+    igb_getreg(RDBAL15),
+    igb_getreg(TDBAH0),
     igb_getreg(TDBAH1),
-    igb_getreg(RDTR),
+    igb_getreg(TDBAH2),
+    igb_getreg(TDBAH3),
+    igb_getreg(TDBAH4),
+    igb_getreg(TDBAH5),
+    igb_getreg(TDBAH6),
+    igb_getreg(TDBAH7),
+    igb_getreg(TDBAH8),
+    igb_getreg(TDBAH9),
+    igb_getreg(TDBAH10),
+    igb_getreg(TDBAH11),
+    igb_getreg(TDBAH12),
+    igb_getreg(TDBAH13),
+    igb_getreg(TDBAH14),
+    igb_getreg(TDBAH15),
     igb_getreg(SCC),
     igb_getreg(COLC),
-    igb_getreg(CEXTERR),
     igb_getreg(XOFFRXC),
     igb_getreg(IPAV),
     igb_getreg(GOTCL),
     igb_getreg(MGTPDC),
     igb_getreg(GCR),
-    igb_getreg(IVAR),
-    igb_getreg(POEMB),
     igb_getreg(MFVAL),
     igb_getreg(FUNCTAG),
     igb_getreg(GSCL_4),
     igb_getreg(GSCN_3),
     igb_getreg(MRQC),
-    igb_getreg(RDLEN1),
     igb_getreg(FCT),
     igb_getreg(FLA),
-    igb_getreg(FLOL),
-    igb_getreg(RXDCTL),
+    igb_getreg(RXDCTL0),
+    igb_getreg(RXDCTL1),
+    igb_getreg(RXDCTL2),
+    igb_getreg(RXDCTL3),
+    igb_getreg(RXDCTL4),
+    igb_getreg(RXDCTL5),
+    igb_getreg(RXDCTL6),
+    igb_getreg(RXDCTL7),
+    igb_getreg(RXDCTL8),
+    igb_getreg(RXDCTL9),
+    igb_getreg(RXDCTL10),
+    igb_getreg(RXDCTL11),
+    igb_getreg(RXDCTL12),
+    igb_getreg(RXDCTL13),
+    igb_getreg(RXDCTL14),
+    igb_getreg(RXDCTL15),
     igb_getreg(RXSTMPL),
     igb_getreg(TXSTMPH),
     igb_getreg(TIMADJH),
     igb_getreg(FCRTL),
-    igb_getreg(TDBAH),
-    igb_getreg(TADV),
     igb_getreg(XONRXC),
-    igb_getreg(TSCTFC),
     igb_getreg(RFCTL),
     igb_getreg(GSCN_1),
     igb_getreg(FCAL),
-    igb_getreg(FLSWCNT),
+    igb_getreg(GPIE),
+    igb_getreg(TXPBS),
+    igb_getreg(RLPML),
 
     [TOTH]    = igb_mac_read_clr8,
     [GOTCH]   = igb_mac_read_clr8,
@@ -3040,8 +2969,11 @@ static const readops igb_macreg_readops[] = {
     [IAC]     = igb_mac_read_clr4,
     [ICR]     = igb_mac_icr_read,
     [STATUS]  = igb_get_status,
-    [TARC0]   = igb_get_tarc,
     [ICS]     = igb_mac_ics_read,
+    /*
+     * 8.8.10: Reading the IMC register returns the value of the IMS register.
+     */
+    [IMC]     = igb_mac_ims_read,
     [TORH]    = igb_mac_read_clr8,
     [GORCH]   = igb_mac_read_clr8,
     [PRC127]  = igb_mac_read_clr4,
@@ -3056,9 +2988,7 @@ static const readops igb_macreg_readops[] = {
     [MPRC]    = igb_mac_read_clr4,
     [BPTC]    = igb_mac_read_clr4,
     [TSCTC]   = igb_mac_read_clr4,
-    [ITR]     = igb_mac_itr_read,
     [CTRL]    = igb_get_ctrl,
-    [TARC1]   = igb_get_tarc,
     [SWSM]    = igb_mac_swsm_read,
     [IMS]     = igb_mac_ims_read,
 
@@ -3066,53 +2996,141 @@ static const readops igb_macreg_readops[] = {
     [IP6AT ... IP6AT + 3]  = igb_mac_readreg,
     [IP4AT ... IP4AT + 6]  = igb_mac_readreg,
     [RA ... RA + 31]       = igb_mac_readreg,
+    [RA2 ... RA2 + 31]     = igb_mac_readreg,
     [WUPM ... WUPM + 31]   = igb_mac_readreg,
-    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = igb_mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1]    = igb_mac_readreg,
     [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]  = igb_mac_readreg,
     [FFMT ... FFMT + 254]  = igb_mac_readreg,
-    [FFVT ... FFVT + 254]  = igb_mac_readreg,
     [MDEF ... MDEF + 7]    = igb_mac_readreg,
-    [FFLT ... FFLT + 10]   = igb_mac_readreg,
     [FTFT ... FTFT + 254]  = igb_mac_readreg,
-    [PBM ... PBM + 10239]  = igb_mac_readreg,
     [RETA ... RETA + 31]   = igb_mac_readreg,
-    [RSSRK ... RSSRK + 31] = igb_mac_readreg,
+    [RSSRK ... RSSRK + 9]  = igb_mac_readreg,
     [MAVTV0 ... MAVTV3]    = igb_mac_readreg,
-    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = igb_mac_eitr_read
+    [EITR0 ... EITR0 + IGB_MSIX_VEC_NUM - 1] = igb_mac_eitr_read,
+    [PVTEICR0] = igb_mac_read_clr4,
+    [PVTEICR1] = igb_mac_read_clr4,
+    [PVTEICR2] = igb_mac_read_clr4,
+    [PVTEICR3] = igb_mac_read_clr4,
+    [PVTEICR4] = igb_mac_read_clr4,
+    [PVTEICR5] = igb_mac_read_clr4,
+    [PVTEICR6] = igb_mac_read_clr4,
+    [PVTEICR7] = igb_mac_read_clr4,
+
+    /* IGB specific: */
+    [FWSM]       = igb_mac_readreg,
+    [SW_FW_SYNC] = igb_mac_readreg,
+    [HTCBDPC]    = igb_mac_read_clr4,
+    [EICR]       = igb_mac_read_clr4,
+    [EIMS]       = igb_mac_readreg,
+    [EIAM]       = igb_mac_readreg,
+    [IVAR0 ... IVAR0 + 7] = igb_mac_readreg,
+    igb_getreg(IVAR_MISC),
+    [P2VMAILBOX0 ... P2VMAILBOX7] = igb_mac_readreg,
+    [V2PMAILBOX0 ... V2PMAILBOX7] = igb_mac_vfmailbox_read,
+    igb_getreg(MBVFICR),
+    [VMBMEM0 ... VMBMEM0 + 127] = igb_mac_readreg,
+    igb_getreg(MBVFIMR),
+    igb_getreg(VFLRE),
+    igb_getreg(VFRE),
+    igb_getreg(VFTE),
+    igb_getreg(QDE),
+    igb_getreg(DTXSWC),
+    igb_getreg(RPLOLR),
+    [VLVF0 ... VLVF0 + E1000_VLVF_ARRAY_SIZE - 1] = igb_mac_readreg,
+    [VMVIR0 ... VMVIR7] = igb_mac_readreg,
+    [VMOLR0 ... VMOLR7] = igb_mac_readreg,
+    [WVBR] = igb_mac_read_clr4,
+    [RQDPC0 ... RQDPC0 + IGB_NUM_QUEUES - 1] = igb_mac_read_clr4,
+    [VTIVAR ... VTIVAR + 7] = igb_mac_readreg,
+    [VTIVAR_MISC ... VTIVAR_MISC + 7] = igb_mac_readreg,
 };
 enum { IGB_NREADOPS = ARRAY_SIZE(igb_macreg_readops) };
 
 #define igb_putreg(x)    [x] = igb_mac_writereg
 typedef void (*writeops)(IGBCore *, int, uint32_t);
 static const writeops igb_macreg_writeops[] = {
-    igb_putreg(PBA),
     igb_putreg(SWSM),
     igb_putreg(WUFC),
-    igb_putreg(RDBAH1),
-    igb_putreg(TDBAH),
-    igb_putreg(TXDCTL),
     igb_putreg(RDBAH0),
+    igb_putreg(RDBAH1),
+    igb_putreg(RDBAH2),
+    igb_putreg(RDBAH3),
+    igb_putreg(RDBAH4),
+    igb_putreg(RDBAH5),
+    igb_putreg(RDBAH6),
+    igb_putreg(RDBAH7),
+    igb_putreg(RDBAH8),
+    igb_putreg(RDBAH9),
+    igb_putreg(RDBAH10),
+    igb_putreg(RDBAH11),
+    igb_putreg(RDBAH12),
+    igb_putreg(RDBAH13),
+    igb_putreg(RDBAH14),
+    igb_putreg(RDBAH15),
+    igb_putreg(SRRCTL0),
+    igb_putreg(SRRCTL1),
+    igb_putreg(SRRCTL2),
+    igb_putreg(SRRCTL3),
+    igb_putreg(SRRCTL4),
+    igb_putreg(SRRCTL5),
+    igb_putreg(SRRCTL6),
+    igb_putreg(SRRCTL7),
+    igb_putreg(SRRCTL8),
+    igb_putreg(SRRCTL9),
+    igb_putreg(SRRCTL10),
+    igb_putreg(SRRCTL11),
+    igb_putreg(SRRCTL12),
+    igb_putreg(SRRCTL13),
+    igb_putreg(SRRCTL14),
+    igb_putreg(SRRCTL15),
+    igb_putreg(RXDCTL0),
+    igb_putreg(RXDCTL1),
+    igb_putreg(RXDCTL2),
+    igb_putreg(RXDCTL3),
+    igb_putreg(RXDCTL4),
+    igb_putreg(RXDCTL5),
+    igb_putreg(RXDCTL6),
+    igb_putreg(RXDCTL7),
+    igb_putreg(RXDCTL8),
+    igb_putreg(RXDCTL9),
+    igb_putreg(RXDCTL10),
+    igb_putreg(RXDCTL11),
+    igb_putreg(RXDCTL12),
+    igb_putreg(RXDCTL13),
+    igb_putreg(RXDCTL14),
+    igb_putreg(RXDCTL15),
     igb_putreg(LEDCTL),
+    igb_putreg(TCTL),
+    igb_putreg(TCTL_EXT),
+    igb_putreg(DTXCTL),
+    igb_putreg(RXPBS),
+    igb_putreg(RQDPC0),
     igb_putreg(FCAL),
     igb_putreg(FCRUC),
     igb_putreg(WUC),
     igb_putreg(WUS),
     igb_putreg(IPAV),
+    igb_putreg(TDBAH0),
     igb_putreg(TDBAH1),
+    igb_putreg(TDBAH2),
+    igb_putreg(TDBAH3),
+    igb_putreg(TDBAH4),
+    igb_putreg(TDBAH5),
+    igb_putreg(TDBAH6),
+    igb_putreg(TDBAH7),
+    igb_putreg(TDBAH8),
+    igb_putreg(TDBAH9),
+    igb_putreg(TDBAH10),
+    igb_putreg(TDBAH11),
+    igb_putreg(TDBAH12),
+    igb_putreg(TDBAH13),
+    igb_putreg(TDBAH14),
+    igb_putreg(TDBAH15),
     igb_putreg(TIMINCA),
     igb_putreg(IAM),
-    igb_putreg(EIAC),
-    igb_putreg(IVAR),
-    igb_putreg(TARC0),
-    igb_putreg(TARC1),
-    igb_putreg(FLSWDATA),
-    igb_putreg(POEMB),
-    igb_putreg(MFUTP01),
-    igb_putreg(MFUTP23),
     igb_putreg(MANC),
     igb_putreg(MANC2H),
     igb_putreg(MFVAL),
-    igb_putreg(EXTCNF_CTRL),
     igb_putreg(FACTPS),
     igb_putreg(FUNCTAG),
     igb_putreg(GSCL_1),
@@ -3123,15 +3141,73 @@ static const writeops igb_macreg_writeops[] = {
     igb_putreg(GSCN_1),
     igb_putreg(GSCN_2),
     igb_putreg(GSCN_3),
-    igb_putreg(GCR2),
     igb_putreg(MRQC),
     igb_putreg(FLOP),
-    igb_putreg(FLOL),
-    igb_putreg(FLSWCTL),
-    igb_putreg(FLSWCNT),
     igb_putreg(FLA),
-    igb_putreg(RXDCTL1),
+    igb_putreg(TXDCTL0),
     igb_putreg(TXDCTL1),
+    igb_putreg(TXDCTL2),
+    igb_putreg(TXDCTL3),
+    igb_putreg(TXDCTL4),
+    igb_putreg(TXDCTL5),
+    igb_putreg(TXDCTL6),
+    igb_putreg(TXDCTL7),
+    igb_putreg(TXDCTL8),
+    igb_putreg(TXDCTL9),
+    igb_putreg(TXDCTL10),
+    igb_putreg(TXDCTL11),
+    igb_putreg(TXDCTL12),
+    igb_putreg(TXDCTL13),
+    igb_putreg(TXDCTL14),
+    igb_putreg(TXDCTL15),
+    igb_putreg(TXCTL0),
+    igb_putreg(TXCTL1),
+    igb_putreg(TXCTL2),
+    igb_putreg(TXCTL3),
+    igb_putreg(TXCTL4),
+    igb_putreg(TXCTL5),
+    igb_putreg(TXCTL6),
+    igb_putreg(TXCTL7),
+    igb_putreg(TXCTL8),
+    igb_putreg(TXCTL9),
+    igb_putreg(TXCTL10),
+    igb_putreg(TXCTL11),
+    igb_putreg(TXCTL12),
+    igb_putreg(TXCTL13),
+    igb_putreg(TXCTL14),
+    igb_putreg(TXCTL15),
+    igb_putreg(TDWBAL0),
+    igb_putreg(TDWBAL1),
+    igb_putreg(TDWBAL2),
+    igb_putreg(TDWBAL3),
+    igb_putreg(TDWBAL4),
+    igb_putreg(TDWBAL5),
+    igb_putreg(TDWBAL6),
+    igb_putreg(TDWBAL7),
+    igb_putreg(TDWBAL8),
+    igb_putreg(TDWBAL9),
+    igb_putreg(TDWBAL10),
+    igb_putreg(TDWBAL11),
+    igb_putreg(TDWBAL12),
+    igb_putreg(TDWBAL13),
+    igb_putreg(TDWBAL14),
+    igb_putreg(TDWBAL15),
+    igb_putreg(TDWBAH0),
+    igb_putreg(TDWBAH1),
+    igb_putreg(TDWBAH2),
+    igb_putreg(TDWBAH3),
+    igb_putreg(TDWBAH4),
+    igb_putreg(TDWBAH5),
+    igb_putreg(TDWBAH6),
+    igb_putreg(TDWBAH7),
+    igb_putreg(TDWBAH8),
+    igb_putreg(TDWBAH9),
+    igb_putreg(TDWBAH10),
+    igb_putreg(TDWBAH11),
+    igb_putreg(TDWBAH12),
+    igb_putreg(TDWBAH13),
+    igb_putreg(TDWBAH14),
+    igb_putreg(TDWBAH15),
     igb_putreg(TIPG),
     igb_putreg(RXSTMPH),
     igb_putreg(RXSTMPL),
@@ -3143,62 +3219,163 @@ static const writeops igb_macreg_writeops[] = {
     igb_putreg(SYSTIMH),
     igb_putreg(TIMADJL),
     igb_putreg(TIMADJH),
-    igb_putreg(RXUDP),
-    igb_putreg(RXCFGL),
     igb_putreg(TSYNCRXCTL),
     igb_putreg(TSYNCTXCTL),
-    igb_putreg(EXTCNF_SIZE),
     igb_putreg(EEMNGCTL),
-    igb_putreg(RA),
+    igb_putreg(GPIE),
+    igb_putreg(TXPBS),
+    igb_putreg(RLPML),
+    igb_putreg(VET),
 
+    [TDH0]     = igb_set_16bit,
     [TDH1]     = igb_set_16bit,
+    [TDH2]     = igb_set_16bit,
+    [TDH3]     = igb_set_16bit,
+    [TDH4]     = igb_set_16bit,
+    [TDH5]     = igb_set_16bit,
+    [TDH6]     = igb_set_16bit,
+    [TDH7]     = igb_set_16bit,
+    [TDH8]     = igb_set_16bit,
+    [TDH9]     = igb_set_16bit,
+    [TDH10]    = igb_set_16bit,
+    [TDH11]    = igb_set_16bit,
+    [TDH12]    = igb_set_16bit,
+    [TDH13]    = igb_set_16bit,
+    [TDH14]    = igb_set_16bit,
+    [TDH15]    = igb_set_16bit,
+    [TDT0]     = igb_set_tdt,
     [TDT1]     = igb_set_tdt,
-    [TCTL]     = igb_set_tctl,
-    [TDT]      = igb_set_tdt,
+    [TDT2]     = igb_set_tdt,
+    [TDT3]     = igb_set_tdt,
+    [TDT4]     = igb_set_tdt,
+    [TDT5]     = igb_set_tdt,
+    [TDT6]     = igb_set_tdt,
+    [TDT7]     = igb_set_tdt,
+    [TDT8]     = igb_set_tdt,
+    [TDT9]     = igb_set_tdt,
+    [TDT10]    = igb_set_tdt,
+    [TDT11]    = igb_set_tdt,
+    [TDT12]    = igb_set_tdt,
+    [TDT13]    = igb_set_tdt,
+    [TDT14]    = igb_set_tdt,
+    [TDT15]    = igb_set_tdt,
     [MDIC]     = igb_set_mdic,
     [ICS]      = igb_set_ics,
-    [TDH]      = igb_set_16bit,
     [RDH0]     = igb_set_16bit,
+    [RDH1]     = igb_set_16bit,
+    [RDH2]     = igb_set_16bit,
+    [RDH3]     = igb_set_16bit,
+    [RDH4]     = igb_set_16bit,
+    [RDH5]     = igb_set_16bit,
+    [RDH6]     = igb_set_16bit,
+    [RDH7]     = igb_set_16bit,
+    [RDH8]     = igb_set_16bit,
+    [RDH9]     = igb_set_16bit,
+    [RDH10]    = igb_set_16bit,
+    [RDH11]    = igb_set_16bit,
+    [RDH12]    = igb_set_16bit,
+    [RDH13]    = igb_set_16bit,
+    [RDH14]    = igb_set_16bit,
+    [RDH15]    = igb_set_16bit,
     [RDT0]     = igb_set_rdt,
+    [RDT1]     = igb_set_rdt,
+    [RDT2]     = igb_set_rdt,
+    [RDT3]     = igb_set_rdt,
+    [RDT4]     = igb_set_rdt,
+    [RDT5]     = igb_set_rdt,
+    [RDT6]     = igb_set_rdt,
+    [RDT7]     = igb_set_rdt,
+    [RDT8]     = igb_set_rdt,
+    [RDT9]     = igb_set_rdt,
+    [RDT10]    = igb_set_rdt,
+    [RDT11]    = igb_set_rdt,
+    [RDT12]    = igb_set_rdt,
+    [RDT13]    = igb_set_rdt,
+    [RDT14]    = igb_set_rdt,
+    [RDT15]    = igb_set_rdt,
     [IMC]      = igb_set_imc,
     [IMS]      = igb_set_ims,
     [ICR]      = igb_set_icr,
     [EECD]     = igb_set_eecd,
     [RCTL]     = igb_set_rx_control,
     [CTRL]     = igb_set_ctrl,
-    [RDTR]     = igb_set_rdtr,
-    [RADV]     = igb_set_16bit,
-    [TADV]     = igb_set_16bit,
-    [ITR]      = igb_set_itr,
     [EERD]     = igb_set_eerd,
-    [AIT]      = igb_set_16bit,
     [TDFH]     = igb_set_13bit,
     [TDFT]     = igb_set_13bit,
     [TDFHS]    = igb_set_13bit,
     [TDFTS]    = igb_set_13bit,
     [TDFPC]    = igb_set_13bit,
     [RDFH]     = igb_set_13bit,
-    [RDFHS]    = igb_set_13bit,
     [RDFT]     = igb_set_13bit,
+    [RDFHS]    = igb_set_13bit,
     [RDFTS]    = igb_set_13bit,
     [RDFPC]    = igb_set_13bit,
-    [PBS]      = igb_set_6bit,
     [GCR]      = igb_set_gcr,
-    [PSRCTL]   = igb_set_psrctl,
     [RXCSUM]   = igb_set_rxcsum,
-    [RAID]     = igb_set_16bit,
-    [RSRPD]    = igb_set_12bit,
-    [TIDV]     = igb_set_tidv,
+    [TDLEN0]   = igb_set_dlen,
     [TDLEN1]   = igb_set_dlen,
-    [TDLEN]    = igb_set_dlen,
+    [TDLEN2]   = igb_set_dlen,
+    [TDLEN3]   = igb_set_dlen,
+    [TDLEN4]   = igb_set_dlen,
+    [TDLEN5]   = igb_set_dlen,
+    [TDLEN6]   = igb_set_dlen,
+    [TDLEN7]   = igb_set_dlen,
+    [TDLEN8]   = igb_set_dlen,
+    [TDLEN9]   = igb_set_dlen,
+    [TDLEN10]  = igb_set_dlen,
+    [TDLEN11]  = igb_set_dlen,
+    [TDLEN12]  = igb_set_dlen,
+    [TDLEN13]  = igb_set_dlen,
+    [TDLEN14]  = igb_set_dlen,
+    [TDLEN15]  = igb_set_dlen,
     [RDLEN0]   = igb_set_dlen,
     [RDLEN1]   = igb_set_dlen,
-    [TDBAL]    = igb_set_dbal,
+    [RDLEN2]   = igb_set_dlen,
+    [RDLEN3]   = igb_set_dlen,
+    [RDLEN4]   = igb_set_dlen,
+    [RDLEN5]   = igb_set_dlen,
+    [RDLEN6]   = igb_set_dlen,
+    [RDLEN7]   = igb_set_dlen,
+    [RDLEN8]   = igb_set_dlen,
+    [RDLEN9]   = igb_set_dlen,
+    [RDLEN10]  = igb_set_dlen,
+    [RDLEN11]  = igb_set_dlen,
+    [RDLEN12]  = igb_set_dlen,
+    [RDLEN13]  = igb_set_dlen,
+    [RDLEN14]  = igb_set_dlen,
+    [RDLEN15]  = igb_set_dlen,
+    [TDBAL0]   = igb_set_dbal,
     [TDBAL1]   = igb_set_dbal,
+    [TDBAL2]   = igb_set_dbal,
+    [TDBAL3]   = igb_set_dbal,
+    [TDBAL4]   = igb_set_dbal,
+    [TDBAL5]   = igb_set_dbal,
+    [TDBAL6]   = igb_set_dbal,
+    [TDBAL7]   = igb_set_dbal,
+    [TDBAL8]   = igb_set_dbal,
+    [TDBAL9]   = igb_set_dbal,
+    [TDBAL10]  = igb_set_dbal,
+    [TDBAL11]  = igb_set_dbal,
+    [TDBAL12]  = igb_set_dbal,
+    [TDBAL13]  = igb_set_dbal,
+    [TDBAL14]  = igb_set_dbal,
+    [TDBAL15]  = igb_set_dbal,
     [RDBAL0]   = igb_set_dbal,
     [RDBAL1]   = igb_set_dbal,
-    [RDH1]     = igb_set_16bit,
-    [RDT1]     = igb_set_rdt,
+    [RDBAL2]   = igb_set_dbal,
+    [RDBAL3]   = igb_set_dbal,
+    [RDBAL4]   = igb_set_dbal,
+    [RDBAL5]   = igb_set_dbal,
+    [RDBAL6]   = igb_set_dbal,
+    [RDBAL7]   = igb_set_dbal,
+    [RDBAL8]   = igb_set_dbal,
+    [RDBAL9]   = igb_set_dbal,
+    [RDBAL10]  = igb_set_dbal,
+    [RDBAL11]  = igb_set_dbal,
+    [RDBAL12]  = igb_set_dbal,
+    [RDBAL13]  = igb_set_dbal,
+    [RDBAL14]  = igb_set_dbal,
+    [RDBAL15]  = igb_set_dbal,
     [STATUS]   = igb_set_status,
     [PBACLR]   = igb_set_pbaclr,
     [CTRL_EXT] = igb_set_ctrlext,
@@ -3208,30 +3385,110 @@ static const writeops igb_macreg_writeops[] = {
     [FCRTV]    = igb_set_16bit,
     [FCRTH]    = igb_set_fcrth,
     [FCRTL]    = igb_set_fcrtl,
-    [VET]      = igb_set_vet,
-    [RXDCTL]   = igb_set_rxdctl,
-    [FLASHT]   = igb_set_16bit,
-    [EEWR]     = igb_set_eewr,
     [CTRL_DUP] = igb_set_ctrl,
     [RFCTL]    = igb_set_rfctl,
-    [RA + 1]   = igb_mac_setmacaddr,
 
     [IP6AT ... IP6AT + 3]    = igb_mac_writereg,
     [IP4AT ... IP4AT + 6]    = igb_mac_writereg,
+    [RA]                     = igb_mac_writereg,
+    [RA + 1]                 = igb_mac_setmacaddr,
     [RA + 2 ... RA + 31]     = igb_mac_writereg,
+    [RA2 ... RA2 + 31]       = igb_mac_writereg,
     [WUPM ... WUPM + 31]     = igb_mac_writereg,
     [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = igb_mac_writereg,
-    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]    = igb_mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1] = igb_mac_writereg,
     [FFMT ... FFMT + 254]    = igb_set_4bit,
-    [FFVT ... FFVT + 254]    = igb_mac_writereg,
-    [PBM ... PBM + 10239]    = igb_mac_writereg,
     [MDEF ... MDEF + 7]      = igb_mac_writereg,
-    [FFLT ... FFLT + 10]     = igb_set_11bit,
     [FTFT ... FTFT + 254]    = igb_mac_writereg,
     [RETA ... RETA + 31]     = igb_mac_writereg,
-    [RSSRK ... RSSRK + 31]   = igb_mac_writereg,
+    [RSSRK ... RSSRK + 9]    = igb_mac_writereg,
     [MAVTV0 ... MAVTV3]      = igb_mac_writereg,
-    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = igb_set_eitr
+    [EITR0 ... EITR0 + IGB_MSIX_VEC_NUM - 1] = igb_set_eitr,
+
+    /* IGB specific: */
+    [FWSM]     = igb_mac_writereg,
+    [SW_FW_SYNC] = igb_mac_writereg,
+    [EICR] = igb_set_eicr,
+    [EICS] = igb_set_eics,
+    [EIAC] = igb_set_eiac,
+    [EIAM] = igb_set_eiam,
+    [EIMC] = igb_set_eimc,
+    [EIMS] = igb_set_eims,
+    [IVAR0 ... IVAR0 + 7] = igb_mac_writereg,
+    igb_putreg(IVAR_MISC),
+    [P2VMAILBOX0 ... P2VMAILBOX7] = igb_set_pfmailbox,
+    [V2PMAILBOX0 ... V2PMAILBOX7] = igb_set_vfmailbox,
+    [MBVFICR] = igb_w1c,
+    [VMBMEM0 ... VMBMEM0 + 127] = igb_mac_writereg,
+    igb_putreg(MBVFIMR),
+    [VFLRE] = igb_w1c,
+    igb_putreg(VFRE),
+    igb_putreg(VFTE),
+    igb_putreg(QDE),
+    igb_putreg(DTXSWC),
+    igb_putreg(RPLOLR),
+    [VLVF0 ... VLVF0 + E1000_VLVF_ARRAY_SIZE - 1] = igb_mac_writereg,
+    [VMVIR0 ... VMVIR7] = igb_mac_writereg,
+    [VMOLR0 ... VMOLR7] = igb_mac_writereg,
+    [UTA ... UTA + E1000_MC_TBL_SIZE - 1] = igb_mac_writereg,
+    [PVTCTRL0] = igb_set_vtctrl,
+    [PVTCTRL1] = igb_set_vtctrl,
+    [PVTCTRL2] = igb_set_vtctrl,
+    [PVTCTRL3] = igb_set_vtctrl,
+    [PVTCTRL4] = igb_set_vtctrl,
+    [PVTCTRL5] = igb_set_vtctrl,
+    [PVTCTRL6] = igb_set_vtctrl,
+    [PVTCTRL7] = igb_set_vtctrl,
+    [PVTEICS0] = igb_set_vteics,
+    [PVTEICS1] = igb_set_vteics,
+    [PVTEICS2] = igb_set_vteics,
+    [PVTEICS3] = igb_set_vteics,
+    [PVTEICS4] = igb_set_vteics,
+    [PVTEICS5] = igb_set_vteics,
+    [PVTEICS6] = igb_set_vteics,
+    [PVTEICS7] = igb_set_vteics,
+    [PVTEIMS0] = igb_set_vteims,
+    [PVTEIMS1] = igb_set_vteims,
+    [PVTEIMS2] = igb_set_vteims,
+    [PVTEIMS3] = igb_set_vteims,
+    [PVTEIMS4] = igb_set_vteims,
+    [PVTEIMS5] = igb_set_vteims,
+    [PVTEIMS6] = igb_set_vteims,
+    [PVTEIMS7] = igb_set_vteims,
+    [PVTEIMC0] = igb_set_vteimc,
+    [PVTEIMC1] = igb_set_vteimc,
+    [PVTEIMC2] = igb_set_vteimc,
+    [PVTEIMC3] = igb_set_vteimc,
+    [PVTEIMC4] = igb_set_vteimc,
+    [PVTEIMC5] = igb_set_vteimc,
+    [PVTEIMC6] = igb_set_vteimc,
+    [PVTEIMC7] = igb_set_vteimc,
+    [PVTEIAC0] = igb_set_vteiac,
+    [PVTEIAC1] = igb_set_vteiac,
+    [PVTEIAC2] = igb_set_vteiac,
+    [PVTEIAC3] = igb_set_vteiac,
+    [PVTEIAC4] = igb_set_vteiac,
+    [PVTEIAC5] = igb_set_vteiac,
+    [PVTEIAC6] = igb_set_vteiac,
+    [PVTEIAC7] = igb_set_vteiac,
+    [PVTEIAM0] = igb_set_vteiam,
+    [PVTEIAM1] = igb_set_vteiam,
+    [PVTEIAM2] = igb_set_vteiam,
+    [PVTEIAM3] = igb_set_vteiam,
+    [PVTEIAM4] = igb_set_vteiam,
+    [PVTEIAM5] = igb_set_vteiam,
+    [PVTEIAM6] = igb_set_vteiam,
+    [PVTEIAM7] = igb_set_vteiam,
+    [PVTEICR0] = igb_set_vteicr,
+    [PVTEICR1] = igb_set_vteicr,
+    [PVTEICR2] = igb_set_vteicr,
+    [PVTEICR3] = igb_set_vteicr,
+    [PVTEICR4] = igb_set_vteicr,
+    [PVTEICR5] = igb_set_vteicr,
+    [PVTEICR6] = igb_set_vteicr,
+    [PVTEICR7] = igb_set_vteicr,
+    [VTIVAR ... VTIVAR + 7] = igb_set_vtivar,
+    [VTIVAR_MISC ... VTIVAR_MISC + 7] = igb_mac_writereg
 };
 enum { IGB_NWRITEOPS = ARRAY_SIZE(igb_macreg_writeops) };
 
@@ -3245,15 +3502,85 @@ enum { MAC_ACCESS_PARTIAL = 1 };
  */
 static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
     /* Alias index offsets */
-    [FCRTL_A] = 0x07fe, [FCRTH_A] = 0x0802,
-    [RDH0_A]  = 0x09bc, [RDT0_A]  = 0x09bc, [RDTR_A] = 0x09c6,
+    [FCRTL_A] = 0x07fe,
     [RDFH_A]  = 0xe904, [RDFT_A]  = 0xe904,
-    [TDH_A]   = 0x0cf8, [TDT_A]   = 0x0cf8, [TIDV_A] = 0x0cf8,
     [TDFH_A]  = 0xed00, [TDFT_A]  = 0xed00,
     [RA_A ... RA_A + 31]      = 0x14f0,
     [VFTA_A ... VFTA_A + E1000_VLAN_FILTER_TBL_SIZE - 1] = 0x1400,
-    [RDBAL0_A ... RDLEN0_A] = 0x09bc,
-    [TDBAL_A ... TDLEN_A]   = 0x0cf8,
+
+    [RDBAL0_A] = 0x2600,
+    [RDBAH0_A] = 0x2600,
+    [RDLEN0_A] = 0x2600,
+    [SRRCTL0_A] = 0x2600,
+    [RDH0_A] = 0x2600,
+    [RDT0_A] = 0x2600,
+    [RXDCTL0_A] = 0x2600,
+    [RXCTL0_A] = 0x2600,
+    [RQDPC0_A] = 0x2600,
+    [RDBAL1_A] = 0x25D0,
+    [RDBAL2_A] = 0x25A0,
+    [RDBAL3_A] = 0x2570,
+    [RDBAH1_A] = 0x25D0,
+    [RDBAH2_A] = 0x25A0,
+    [RDBAH3_A] = 0x2570,
+    [RDLEN1_A] = 0x25D0,
+    [RDLEN2_A] = 0x25A0,
+    [RDLEN3_A] = 0x2570,
+    [SRRCTL1_A] = 0x25D0,
+    [SRRCTL2_A] = 0x25A0,
+    [SRRCTL3_A] = 0x2570,
+    [RDH1_A] = 0x25D0,
+    [RDH2_A] = 0x25A0,
+    [RDH3_A] = 0x2570,
+    [RDT1_A] = 0x25D0,
+    [RDT2_A] = 0x25A0,
+    [RDT3_A] = 0x2570,
+    [RXDCTL1_A] = 0x25D0,
+    [RXDCTL2_A] = 0x25A0,
+    [RXDCTL3_A] = 0x2570,
+    [RXCTL1_A] = 0x25D0,
+    [RXCTL2_A] = 0x25A0,
+    [RXCTL3_A] = 0x2570,
+    [RQDPC1_A] = 0x25D0,
+    [RQDPC2_A] = 0x25A0,
+    [RQDPC3_A] = 0x2570,
+    [TDBAL0_A] = 0x2A00,
+    [TDBAH0_A] = 0x2A00,
+    [TDLEN0_A] = 0x2A00,
+    [TDH0_A] = 0x2A00,
+    [TDT0_A] = 0x2A00,
+    [TXCTL0_A] = 0x2A00,
+    [TDWBAL0_A] = 0x2A00,
+    [TDWBAH0_A] = 0x2A00,
+    [TDBAL1_A] = 0x29D0,
+    [TDBAL2_A] = 0x29A0,
+    [TDBAL3_A] = 0x2970,
+    [TDBAH1_A] = 0x29D0,
+    [TDBAH2_A] = 0x29A0,
+    [TDBAH3_A] = 0x2970,
+    [TDLEN1_A] = 0x29D0,
+    [TDLEN2_A] = 0x29A0,
+    [TDLEN3_A] = 0x2970,
+    [TDH1_A] = 0x29D0,
+    [TDH2_A] = 0x29A0,
+    [TDH3_A] = 0x2970,
+    [TDT1_A] = 0x29D0,
+    [TDT2_A] = 0x29A0,
+    [TDT3_A] = 0x2970,
+    [TXDCTL0_A] = 0x2A00,
+    [TXDCTL1_A] = 0x29D0,
+    [TXDCTL2_A] = 0x29A0,
+    [TXDCTL3_A] = 0x2970,
+    [TXCTL1_A] = 0x29D0,
+    [TXCTL2_A] = 0x29A0,
+    [TXCTL3_A] = 0x29D0,
+    [TDWBAL1_A] = 0x29D0,
+    [TDWBAL2_A] = 0x29A0,
+    [TDWBAL3_A] = 0x2970,
+    [TDWBAH1_A] = 0x29D0,
+    [TDWBAH2_A] = 0x29A0,
+    [TDWBAH3_A] = 0x2970,
+
     /* Access options */
     [RDFH]  = MAC_ACCESS_PARTIAL,    [RDFT]  = MAC_ACCESS_PARTIAL,
     [RDFHS] = MAC_ACCESS_PARTIAL,    [RDFTS] = MAC_ACCESS_PARTIAL,
@@ -3261,12 +3588,11 @@ static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
     [TDFH]  = MAC_ACCESS_PARTIAL,    [TDFT]  = MAC_ACCESS_PARTIAL,
     [TDFHS] = MAC_ACCESS_PARTIAL,    [TDFTS] = MAC_ACCESS_PARTIAL,
     [TDFPC] = MAC_ACCESS_PARTIAL,    [EECD]  = MAC_ACCESS_PARTIAL,
-    [PBM]   = MAC_ACCESS_PARTIAL,    [FLA]   = MAC_ACCESS_PARTIAL,
+    [FLA]   = MAC_ACCESS_PARTIAL,
     [FCAL]  = MAC_ACCESS_PARTIAL,    [FCAH]  = MAC_ACCESS_PARTIAL,
     [FCT]   = MAC_ACCESS_PARTIAL,    [FCTTV] = MAC_ACCESS_PARTIAL,
     [FCRTV] = MAC_ACCESS_PARTIAL,    [FCRTL] = MAC_ACCESS_PARTIAL,
-    [FCRTH] = MAC_ACCESS_PARTIAL,    [TXDCTL] = MAC_ACCESS_PARTIAL,
-    [TXDCTL1] = MAC_ACCESS_PARTIAL,
+    [FCRTH] = MAC_ACCESS_PARTIAL,
     [MAVTV0 ... MAVTV3] = MAC_ACCESS_PARTIAL
 };
 
@@ -3317,7 +3643,7 @@ static void
 igb_autoneg_resume(IGBCore *core)
 {
     if (igb_have_autoneg(core) &&
-        !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
+        !(core->phy[MII_BMSR] & MII_BMSR_AN_COMP)) {
         qemu_get_queue(core->owner_nic)->link_down = false;
         timer_mod(core->autoneg_timer,
                   qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
@@ -3356,10 +3682,10 @@ igb_core_pci_realize(IGBCore        *core,
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
-                        E1000E_MAX_TX_FRAGS, core->has_vnet);
+                        E1000E_MAX_TX_FRAGS, false);
     }
 
-    net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
+    net_rx_pkt_init(&core->rx_pkt, false);
 
     e1000x_core_prepare_eeprom(core->eeprom,
                                eeprom_templ,
@@ -3389,96 +3715,143 @@ igb_core_pci_uninit(IGBCore *core)
 }
 
 static const uint16_t
-igb_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
-    [0] = {
-        [MII_BMCR] = MII_BMCR_SPEED1000 |
-                     MII_BMCR_FD        |
-                     MII_BMCR_AUTOEN,
-
-        [MII_BMSR] = MII_BMSR_EXTCAP    |
-                     MII_BMSR_LINK_ST   |
-                     MII_BMSR_AUTONEG   |
-                     MII_BMSR_MFPS      |
-                     MII_BMSR_EXTSTAT   |
-                     MII_BMSR_10T_HD    |
-                     MII_BMSR_10T_FD    |
-                     MII_BMSR_100TX_HD  |
-                     MII_BMSR_100TX_FD,
-
-        [MII_PHYID1]            = 0x141,
-        [MII_PHYID2]            = E1000_PHY_ID2_82574x,
-        [MII_ANAR]              = MII_ANAR_CSMACD | MII_ANAR_10 |
-                                  MII_ANAR_10FD | MII_ANAR_TX |
-                                  MII_ANAR_TXFD | MII_ANAR_PAUSE |
-                                  MII_ANAR_PAUSE_ASYM,
-        [MII_ANLPAR]            = MII_ANLPAR_10 | MII_ANLPAR_10FD |
-                                  MII_ANLPAR_TX | MII_ANLPAR_TXFD |
-                                  MII_ANLPAR_T4 | MII_ANLPAR_PAUSE,
-        [MII_ANER]              = MII_ANER_NP | MII_ANER_NWAY,
-        [MII_ANNP]              = 1 | MII_ANNP_MP,
-        [MII_CTRL1000]          = MII_CTRL1000_HALF | MII_CTRL1000_FULL |
-                                  MII_CTRL1000_PORT | MII_CTRL1000_MASTER,
-        [MII_STAT1000]          = MII_STAT1000_HALF | MII_STAT1000_FULL |
-                                  MII_STAT1000_ROK | MII_STAT1000_LOK,
-        [MII_EXTSTAT]           = MII_EXTSTAT_1000T_HD | MII_EXTSTAT_1000T_FD,
-
-        [PHY_COPPER_CTRL1]      = BIT(5) | BIT(6) | BIT(8) | BIT(9) |
-                                  BIT(12) | BIT(13),
-        [PHY_COPPER_STAT1]      = BIT(3) | BIT(10) | BIT(11) | BIT(13) | BIT(15)
-    },
-    [2] = {
-        [PHY_MAC_CTRL1]         = BIT(3) | BIT(7),
-        [PHY_MAC_CTRL2]         = BIT(1) | BIT(2) | BIT(6) | BIT(12)
-    },
-    [3] = {
-        [PHY_LED_TIMER_CTRL]    = BIT(0) | BIT(2) | BIT(14)
-    }
+igb_phy_reg_init[] = {
+    [MII_BMCR] = MII_BMCR_SPEED1000 |
+                 MII_BMCR_FD        |
+                 MII_BMCR_AUTOEN,
+
+    [MII_BMSR] = MII_BMSR_EXTCAP    |
+                 MII_BMSR_LINK_ST   |
+                 MII_BMSR_AUTONEG   |
+                 MII_BMSR_MFPS      |
+                 MII_BMSR_EXTSTAT   |
+                 MII_BMSR_10T_HD    |
+                 MII_BMSR_10T_FD    |
+                 MII_BMSR_100TX_HD  |
+                 MII_BMSR_100TX_FD,
+
+    [MII_PHYID1]            = IGP03E1000_E_PHY_ID >> 16,
+    [MII_PHYID2]            = (IGP03E1000_E_PHY_ID & 0xfff0) | 1,
+    [MII_ANAR]              = MII_ANAR_CSMACD | MII_ANAR_10 |
+                              MII_ANAR_10FD | MII_ANAR_TX |
+                              MII_ANAR_TXFD | MII_ANAR_PAUSE |
+                              MII_ANAR_PAUSE_ASYM,
+    [MII_ANLPAR]            = MII_ANLPAR_10 | MII_ANLPAR_10FD |
+                              MII_ANLPAR_TX | MII_ANLPAR_TXFD |
+                              MII_ANLPAR_T4 | MII_ANLPAR_PAUSE,
+    [MII_ANER]              = MII_ANER_NP | MII_ANER_NWAY,
+    [MII_ANNP]              = 0x1 | MII_ANNP_MP,
+    [MII_CTRL1000]          = MII_CTRL1000_HALF | MII_CTRL1000_FULL |
+                              MII_CTRL1000_PORT | MII_CTRL1000_MASTER,
+    [MII_STAT1000]          = MII_STAT1000_HALF | MII_STAT1000_FULL |
+                              MII_STAT1000_ROK | MII_STAT1000_LOK,
+    [MII_EXTSTAT]           = MII_EXTSTAT_1000T_HD | MII_EXTSTAT_1000T_FD,
+
+    [IGP01E1000_PHY_PORT_CONFIG] = BIT(5) | BIT(8),
+    [IGP01E1000_PHY_PORT_STATUS] = IGP01E1000_PSSR_SPEED_1000MBPS,
+    [IGP02E1000_PHY_POWER_MGMT]  = BIT(0) | BIT(3) | IGP02E1000_PM_D3_LPLU |
+                                   IGP01E1000_PSCFR_SMART_SPEED
 };
 
 static const uint32_t igb_mac_reg_init[] = {
-    [PBA]           =     0x00140014,
-    [LEDCTL]        =  BIT(1) | BIT(8) | BIT(9) | BIT(15) | BIT(17) | BIT(18),
-    [EXTCNF_CTRL]   = BIT(3),
+    [LEDCTL]        = 2 | (3 << 8) | BIT(15) | (6 << 16) | (7 << 24),
     [EEMNGCTL]      = BIT(31),
-    [FLASHT]        = 0x2,
-    [FLSWCTL]       = BIT(30) | BIT(31),
-    [FLOL]          = BIT(0),
-    [RXDCTL]        = BIT(16),
-    [RXDCTL1]       = BIT(16),
-    [TIPG]          = 0x8 | (0x8 << 10) | (0x6 << 20),
-    [RXCFGL]        = 0x88F7,
-    [RXUDP]         = 0x319,
-    [CTRL]          = E1000_CTRL_FD | E1000_CTRL_SWDPIN2 | E1000_CTRL_SWDPIN0 |
-                      E1000_CTRL_SPD_1000 | E1000_CTRL_SLU |
+    [RXDCTL0]       = E1000_RXDCTL_QUEUE_ENABLE | (1 << 16),
+    [RXDCTL1]       = 1 << 16,
+    [RXDCTL2]       = 1 << 16,
+    [RXDCTL3]       = 1 << 16,
+    [RXDCTL4]       = 1 << 16,
+    [RXDCTL5]       = 1 << 16,
+    [RXDCTL6]       = 1 << 16,
+    [RXDCTL7]       = 1 << 16,
+    [RXDCTL8]       = 1 << 16,
+    [RXDCTL9]       = 1 << 16,
+    [RXDCTL10]      = 1 << 16,
+    [RXDCTL11]      = 1 << 16,
+    [RXDCTL12]      = 1 << 16,
+    [RXDCTL13]      = 1 << 16,
+    [RXDCTL14]      = 1 << 16,
+    [RXDCTL15]      = 1 << 16,
+    [TIPG]          = 0x08 | (0x04 << 10) | (0x06 << 20),
+    [CTRL]          = E1000_CTRL_FD | E1000_CTRL_LRST | E1000_CTRL_SPD_1000 |
                       E1000_CTRL_ADVD3WUC,
-    [STATUS]        =  E1000_STATUS_ASDV_1000 | E1000_STATUS_LU,
-    [PSRCTL]        = (2 << E1000_PSRCTL_BSIZE0_SHIFT) |
-                      (4 << E1000_PSRCTL_BSIZE1_SHIFT) |
-                      (4 << E1000_PSRCTL_BSIZE2_SHIFT),
-    [TARC0]         = 0x3 | E1000_TARC_ENABLE,
-    [TARC1]         = 0x3 | E1000_TARC_ENABLE,
-    [EECD]          = E1000_EECD_AUTO_RD | E1000_EECD_PRES,
-    [EERD]          = E1000_EERW_DONE,
-    [EEWR]          = E1000_EERW_DONE,
+    [STATUS]        = E1000_STATUS_PHYRA | BIT(31),
+    [EECD]          = E1000_EECD_FWE_DIS | E1000_EECD_PRES |
+                      (2 << E1000_EECD_SIZE_EX_SHIFT),
     [GCR]           = E1000_L0S_ADJUST |
+                      E1000_GCR_CMPL_TMOUT_RESEND |
+                      E1000_GCR_CAP_VER2 |
                       E1000_L1_ENTRY_LATENCY_MSB |
                       E1000_L1_ENTRY_LATENCY_LSB,
-    [TDFH]          = 0x600,
-    [TDFT]          = 0x600,
-    [TDFHS]         = 0x600,
-    [TDFTS]         = 0x600,
-    [POEMB]         = 0x30D,
-    [PBS]           = 0x028,
-    [MANC]          = E1000_MANC_DIS_IP_CHK_ARP,
-    [FACTPS]        = E1000_FACTPS_LAN0_ON | 0x20000000,
-    [SWSM]          = 1,
     [RXCSUM]        = E1000_RXCSUM_IPOFLD | E1000_RXCSUM_TUOFLD,
-    [ITR]           = E1000E_MIN_XITR,
-    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = E1000E_MIN_XITR,
+    [TXPBS]         = 0x28,
+    [RXPBS]         = 0x40,
+    [TCTL]          = E1000_TCTL_PSP | (0xF << E1000_CT_SHIFT) |
+                      (0x40 << E1000_COLD_SHIFT) | (0x1 << 26) | (0xA << 28),
+    [TCTL_EXT]      = 0x40 | (0x42 << 10),
+    [DTXCTL]        = E1000_DTXCTL_8023LL | E1000_DTXCTL_SPOOF_INT,
+    [VET]           = ETH_P_VLAN | (ETH_P_VLAN << 16),
+
+    [V2PMAILBOX0 ... V2PMAILBOX0 + IGB_MAX_VF_FUNCTIONS - 1] = E1000_V2PMAILBOX_RSTI,
+    [MBVFIMR]       = 0xFF,
+    [VFRE]          = 0xFF,
+    [VFTE]          = 0xFF,
+    [VMOLR0 ... VMOLR0 + IGB_MAX_VF_FUNCTIONS - 1] = 0x2600 | E1000_VMOLR_STRCRC,
+    [RPLOLR]        = E1000_RPLOLR_STRCRC,
+    [RLPML]         = 0x2600,
+    [TXCTL0]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL1]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL2]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL3]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL4]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL5]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL6]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL7]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL8]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL9]       = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL10]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL11]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL12]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL13]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL14]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
+    [TXCTL15]      = E1000_DCA_TXCTRL_DATA_RRO_EN |
+                     E1000_DCA_TXCTRL_TX_WB_RO_EN |
+                     E1000_DCA_TXCTRL_DESC_RRO_EN,
 };
 
 static void igb_reset(IGBCore *core, bool sw)
 {
+    struct igb_tx *tx;
     int i;
 
     timer_del(core->autoneg_timer);
@@ -3489,7 +3862,9 @@ static void igb_reset(IGBCore *core, bool sw)
     memcpy(core->phy, igb_phy_reg_init, sizeof igb_phy_reg_init);
 
     for (i = 0; i < E1000E_MAC_SIZE; i++) {
-        if (sw && (i == PBA || i == PBS || i == FLA)) {
+        if (sw &&
+            (i == RXPBS || i == TXPBS ||
+             (i >= EITR0 && i < EITR0 + IGB_MSIX_VEC_NUM))) {
             continue;
         }
 
@@ -3497,8 +3872,6 @@ static void igb_reset(IGBCore *core, bool sw)
                        igb_mac_reg_init[i] : 0;
     }
 
-    core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
-
     if (qemu_get_queue(core->owner_nic)->link_down) {
         igb_link_down(core);
     }
@@ -3506,9 +3879,15 @@ static void igb_reset(IGBCore *core, bool sw)
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
 
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
-        net_tx_pkt_reset(core->tx[i].tx_pkt);
-        memset(&core->tx[i].props, 0, sizeof(core->tx[i].props));
-        core->tx[i].skip_cp = false;
+        tx = &core->tx[i];
+        net_tx_pkt_reset(tx->tx_pkt);
+        tx->vlan = 0;
+        tx->mss = 0;
+        tx->tse = false;
+        tx->ixsm = false;
+        tx->txsm = false;
+        tx->first = true;
+        tx->skip_cp = false;
     }
 }
 
@@ -3529,7 +3908,7 @@ void igb_core_pre_save(IGBCore *core)
      * at MII_BMSR_AN_COMP to infer link status on load.
      */
     if (nc->link_down && igb_have_autoneg(core)) {
-        core->phy[0][MII_BMSR] |= MII_BMSR_AN_COMP;
+        core->phy[MII_BMSR] |= MII_BMSR_AN_COMP;
         igb_update_flowctl_status(core);
     }
 
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index 4f70e45cb1..92b9da1153 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -1,13 +1,17 @@
 /*
  * Core code for QEMU igb emulation
  *
- * Software developer's manuals:
- * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
+ * Datasheet:
+ * https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eg-gbe-datasheet.pdf
  *
+ * Copyright (c) 2020-2023 Red Hat, Inc.
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
  * Developed by Daynix Computing LTD (http://www.daynix.com)
  *
  * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
+ * Gal Hammmer <gal.hammer@sap.com>
+ * Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
  * Dmitry Fleytman <dmitry@daynix.com>
  * Leonid Bloch <leonid@daynix.com>
  * Yan Vugenfirer <yan@daynix.com>
@@ -36,19 +40,21 @@
 #ifndef HW_NET_IGB_CORE_H
 #define HW_NET_IGB_CORE_H
 
-#define E1000E_PHY_PAGE_SIZE    (0x20)
-#define E1000E_PHY_PAGES        (0x07)
 #define E1000E_MAC_SIZE         (0x8000)
-#define IGB_EEPROM_SIZE         (64)
-#define IGB_MSIX_VEC_NUM        (5)
-#define IGB_NUM_QUEUES          (2)
+#define IGB_EEPROM_SIZE         (1024)
+
+/*
+ * TBD: handle igb sizes, vectors = 25, queues = 16!
+ * Just set some conservative values here to work with for now
+ */
+#define IGB_MSIX_VEC_NUM        (25)
+#define IGB_NUM_QUEUES          (16)
 
 typedef struct IGBCore IGBCore;
 
 enum { PHY_R = BIT(0),
        PHY_W = BIT(1),
-       PHY_RW = PHY_R | PHY_W,
-       PHY_ANYPAGE = BIT(2) };
+       PHY_RW = PHY_R | PHY_W };
 
 typedef struct IGBIntrDelayTimer_st {
     QEMUTimer *timer;
@@ -60,58 +66,42 @@ typedef struct IGBIntrDelayTimer_st {
 
 struct IGBCore {
     uint32_t mac[E1000E_MAC_SIZE];
-    uint16_t phy[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE];
+    uint16_t phy[MAX_PHY_REG_ADDRESS + 1];
     uint16_t eeprom[IGB_EEPROM_SIZE];
 
-    uint32_t rxbuf_sizes[E1000_PSRCTL_BUFFS_PER_DESC];
     uint32_t rx_desc_buf_size;
-    uint32_t rxbuf_min_shift;
     uint8_t rx_desc_len;
 
     QEMUTimer *autoneg_timer;
 
     struct igb_tx {
-        e1000x_txd_props props;
+        uint16_t vlan;  /* VLAN Tag */
+        uint16_t mss;   /* Maximum Segment Size */
+        bool tse;       /* TCP/UDP Segmentation Enable */
+        bool ixsm;      /* Insert IP Checksum */
+        bool txsm;      /* Insert TCP/UDP Checksum */
 
+        bool first;
         bool skip_cp;
-        unsigned char sum_needed;
-        bool cptse;
+
         struct NetTxPkt *tx_pkt;
     } tx[IGB_NUM_QUEUES];
 
     struct NetRxPkt *rx_pkt;
 
-    bool has_vnet;
     int max_queue_num;
 
-    /* Interrupt moderation management */
-    uint32_t delayed_causes;
-
-    IGBIntrDelayTimer radv;
-    IGBIntrDelayTimer rdtr;
-    IGBIntrDelayTimer raid;
-
-    IGBIntrDelayTimer tadv;
-    IGBIntrDelayTimer tidv;
-
-    IGBIntrDelayTimer itr;
-
     IGBIntrDelayTimer eitr[IGB_MSIX_VEC_NUM];
 
     VMChangeStateEntry *vmstate;
 
-    uint32_t itr_guest_value;
     uint32_t eitr_guest_value[IGB_MSIX_VEC_NUM];
 
-    uint16_t vet;
-
     uint8_t permanent_mac[ETH_ALEN];
 
     NICState *owner_nic;
     PCIDevice *owner;
     void (*owner_start_recv)(PCIDevice *d);
-
-    uint32_t msi_causes_pending;
 };
 
 void
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
new file mode 100644
index 0000000000..7d229c559d
--- /dev/null
+++ b/hw/net/igb_regs.h
@@ -0,0 +1,624 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This is copied + edited from kernel header files in
+ * drivers/net/ethernet/intel/igb
+ */
+
+#ifndef HW_IGB_REGS_H_
+#define HW_IGB_REGS_H_
+
+#include "e1000x_regs.h"
+
+/* from igb/e1000_hw.h */
+
+#define E1000_DEV_ID_82576                 0x10C9
+#define E1000_DEV_ID_82576_FIBER           0x10E6
+#define E1000_DEV_ID_82576_SERDES          0x10E7
+#define E1000_DEV_ID_82576_QUAD_COPPER             0x10E8
+#define E1000_DEV_ID_82576_QUAD_COPPER_ET2 0x1526
+#define E1000_DEV_ID_82576_NS                      0x150A
+#define E1000_DEV_ID_82576_NS_SERDES               0x1518
+#define E1000_DEV_ID_82576_SERDES_QUAD             0x150D
+
+/* Context Descriptor */
+struct e1000_adv_tx_context_desc {
+    __le32 vlan_macip_lens;
+    __le32 seqnum_seed;
+    __le32 type_tucmd_mlhl;
+    __le32 mss_l4len_idx;
+};
+
+/* Advanced Transmit Descriptor */
+union e1000_adv_tx_desc {
+    struct {
+        __le64 buffer_addr;     /* Address of descriptor's data buffer */
+        __le32 cmd_type_len;
+        __le32 olinfo_status;
+    } read;
+    struct {
+        __le64 rsvd;            /* Reserved */
+        __le32 nxtseq_seed;
+        __le32 status;
+    } wb;
+};
+
+#define E1000_ADVTXD_DTYP_CTXT  0x00200000 /* Advanced Context Descriptor */
+#define E1000_ADVTXD_DTYP_DATA  0x00300000 /* Advanced Data Descriptor */
+#define E1000_ADVTXD_DCMD_DEXT  0x20000000 /* Descriptor Extension (1=Adv) */
+#define E1000_ADVTXD_DCMD_TSE   0x80000000 /* TCP/UDP Segmentation Enable */
+
+#define E1000_ADVTXD_POTS_IXSM  0x00000100 /* Insert TCP/UDP Checksum */
+#define E1000_ADVTXD_POTS_TXSM  0x00000200 /* Insert TCP/UDP Checksum */
+
+#define E1000_TXD_POPTS_IXSM 0x00000001 /* Insert IP checksum */
+#define E1000_TXD_POPTS_TXSM 0x00000002 /* Insert TCP/UDP checksum */
+
+/* Receive Descriptor - Advanced */
+union e1000_adv_rx_desc {
+    struct {
+        __le64 pkt_addr;                /* Packet Buffer Address */
+        __le64 hdr_addr;                /* Header Buffer Address */
+    } read;
+    struct {
+        struct {
+            struct {
+                __le16 pkt_info;        /* RSS Type, Packet Type */
+                __le16 hdr_info;        /* Split Head, Buffer Length */
+            } lo_dword;
+            union {
+                __le32 rss;             /* RSS Hash */
+                struct {
+                        __le16 ip_id;   /* IP Id */
+                        __le16 csum;    /* Packet Checksum */
+                } csum_ip;
+            } hi_dword;
+        } lower;
+        struct {
+            __le32 status_error;        /* Ext Status/Error */
+            __le16 length;              /* Packet Length */
+            __le16 vlan;                /* VLAN tag */
+        } upper;
+    } wb;  /* writeback */
+};
+
+/* from igb/e1000_phy.h */
+
+/* IGP01E1000 Specific Registers */
+#define IGP01E1000_PHY_PORT_CONFIG        0x10 /* Port Config */
+#define IGP01E1000_PHY_PORT_STATUS        0x11 /* Status */
+#define IGP01E1000_PHY_PORT_CTRL          0x12 /* Control */
+#define IGP01E1000_PHY_LINK_HEALTH        0x13 /* PHY Link Health */
+#define IGP02E1000_PHY_POWER_MGMT         0x19 /* Power Management */
+#define IGP01E1000_PHY_PAGE_SELECT        0x1F /* Page Select */
+#define IGP01E1000_PHY_PCS_INIT_REG       0x00B4
+#define IGP01E1000_PHY_POLARITY_MASK      0x0078
+#define IGP01E1000_PSCR_AUTO_MDIX         0x1000
+#define IGP01E1000_PSCR_FORCE_MDI_MDIX    0x2000 /* 0=MDI, 1=MDIX */
+#define IGP01E1000_PSCFR_SMART_SPEED      0x0080
+
+/* Enable flexible speed on link-up */
+#define IGP02E1000_PM_D0_LPLU             0x0002 /* For D0a states */
+#define IGP02E1000_PM_D3_LPLU             0x0004 /* For all other states */
+#define IGP01E1000_PLHR_SS_DOWNGRADE      0x8000
+#define IGP01E1000_PSSR_POLARITY_REVERSED 0x0002
+#define IGP01E1000_PSSR_MDIX              0x0800
+#define IGP01E1000_PSSR_SPEED_MASK        0xC000
+#define IGP01E1000_PSSR_SPEED_1000MBPS    0xC000
+#define IGP02E1000_PHY_CHANNEL_NUM        4
+#define IGP02E1000_PHY_AGC_A              0x11B1
+#define IGP02E1000_PHY_AGC_B              0x12B1
+#define IGP02E1000_PHY_AGC_C              0x14B1
+#define IGP02E1000_PHY_AGC_D              0x18B1
+#define IGP02E1000_AGC_LENGTH_SHIFT       9   /* Course - 15:13, Fine - 12:9 */
+#define IGP02E1000_AGC_LENGTH_MASK        0x7F
+#define IGP02E1000_AGC_RANGE              15
+
+/* from igb/igb.h */
+
+#define E1000_PCS_CFG_IGN_SD     1
+
+/* Interrupt defines */
+#define IGB_START_ITR            648 /* ~6000 ints/sec */
+#define IGB_4K_ITR               980
+#define IGB_20K_ITR              196
+#define IGB_70K_ITR              56
+
+/* TX/RX descriptor defines */
+#define IGB_DEFAULT_TXD          256
+#define IGB_DEFAULT_TX_WORK      128
+#define IGB_MIN_TXD              80
+#define IGB_MAX_TXD              4096
+
+#define IGB_DEFAULT_RXD          256
+#define IGB_MIN_RXD              80
+#define IGB_MAX_RXD              4096
+
+#define IGB_DEFAULT_ITR           3 /* dynamic */
+#define IGB_MAX_ITR_USECS         10000
+#define IGB_MIN_ITR_USECS         10
+#define NON_Q_VECTORS             1
+#define MAX_Q_VECTORS             8
+#define MAX_MSIX_ENTRIES          10
+
+/* Transmit and receive queues */
+#define IGB_MAX_RX_QUEUES          8
+#define IGB_MAX_RX_QUEUES_82575    4
+#define IGB_MAX_RX_QUEUES_I211     2
+#define IGB_MAX_TX_QUEUES          8
+#define IGB_MAX_VF_MC_ENTRIES      30
+#define IGB_MAX_VF_FUNCTIONS       8
+#define IGB_MAX_VFTA_ENTRIES       128
+#define IGB_82576_VF_DEV_ID        0x10CA
+#define IGB_I350_VF_DEV_ID         0x1520
+
+/* from igb/e1000_82575.h */
+
+#define E1000_MRQC_ENABLE_RSS_MQ            0x00000002
+#define E1000_MRQC_ENABLE_VMDQ              0x00000003
+#define E1000_MRQC_RSS_FIELD_IPV4_UDP       0x00400000
+#define E1000_MRQC_ENABLE_VMDQ_RSS_MQ       0x00000005
+#define E1000_MRQC_RSS_FIELD_IPV6_UDP       0x00800000
+#define E1000_MRQC_RSS_FIELD_IPV6_UDP_EX    0x01000000
+
+/* Additional Receive Descriptor Control definitions */
+#define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
+
+/* Direct Cache Access (DCA) definitions */
+#define E1000_DCA_CTRL_DCA_MODE_DISABLE 0x01 /* DCA Disable */
+#define E1000_DCA_CTRL_DCA_MODE_CB2     0x02 /* DCA Mode CB2 */
+
+#define E1000_DCA_RXCTRL_CPUID_MASK 0x0000001F /* Rx CPUID Mask */
+#define E1000_DCA_RXCTRL_DESC_DCA_EN BIT(5) /* DCA Rx Desc enable */
+#define E1000_DCA_RXCTRL_HEAD_DCA_EN BIT(6) /* DCA Rx Desc header enable */
+#define E1000_DCA_RXCTRL_DATA_DCA_EN BIT(7) /* DCA Rx Desc payload enable */
+#define E1000_DCA_RXCTRL_DESC_RRO_EN BIT(9) /* DCA Rx rd Desc Relax Order */
+
+#define E1000_DCA_TXCTRL_CPUID_MASK 0x0000001F /* Tx CPUID Mask */
+#define E1000_DCA_TXCTRL_DESC_DCA_EN BIT(5) /* DCA Tx Desc enable */
+#define E1000_DCA_TXCTRL_DESC_RRO_EN BIT(9) /* Tx rd Desc Relax Order */
+#define E1000_DCA_TXCTRL_TX_WB_RO_EN BIT(11) /* Tx Desc writeback RO bit */
+#define E1000_DCA_TXCTRL_DATA_RRO_EN BIT(13) /* Tx rd data Relax Order */
+
+/* Additional DCA related definitions, note change in position of CPUID */
+#define E1000_DCA_TXCTRL_CPUID_MASK_82576 0xFF000000 /* Tx CPUID Mask */
+#define E1000_DCA_RXCTRL_CPUID_MASK_82576 0xFF000000 /* Rx CPUID Mask */
+#define E1000_DCA_TXCTRL_CPUID_SHIFT 24 /* Tx CPUID now in the last byte */
+#define E1000_DCA_RXCTRL_CPUID_SHIFT 24 /* Rx CPUID now in the last byte */
+
+#define E1000_DTXSWC_MAC_SPOOF_MASK   0x000000FF /* Per VF MAC spoof control */
+#define E1000_DTXSWC_VLAN_SPOOF_MASK  0x0000FF00 /* Per VF VLAN spoof control */
+#define E1000_DTXSWC_LLE_MASK         0x00FF0000 /* Per VF Local LB enables */
+#define E1000_DTXSWC_VLAN_SPOOF_SHIFT 8
+#define E1000_DTXSWC_VMDQ_LOOPBACK_EN BIT(31)  /* global VF LB enable */
+
+/* Per VM Offload register setup */
+#define E1000_VMOLR_RLPML_MASK 0x00003FFF /* Long Packet Maximum Length mask */
+#define E1000_VMOLR_LPE        0x00010000 /* Accept Long packet */
+#define E1000_VMOLR_RSSE       0x00020000 /* Enable RSS */
+#define E1000_VMOLR_AUPE       0x01000000 /* Accept untagged packets */
+#define E1000_VMOLR_ROMPE      0x02000000 /* Accept overflow multicast */
+#define E1000_VMOLR_ROPE       0x04000000 /* Accept overflow unicast */
+#define E1000_VMOLR_BAM        0x08000000 /* Accept Broadcast packets */
+#define E1000_VMOLR_MPME       0x10000000 /* Multicast promiscuous mode */
+#define E1000_VMOLR_STRVLAN    0x40000000 /* Vlan stripping enable */
+#define E1000_VMOLR_STRCRC     0x80000000 /* CRC stripping enable */
+
+#define E1000_DVMOLR_HIDEVLAN  0x20000000 /* Hide vlan enable */
+#define E1000_DVMOLR_STRVLAN   0x40000000 /* Vlan stripping enable */
+#define E1000_DVMOLR_STRCRC    0x80000000 /* CRC stripping enable */
+
+#define E1000_VLVF_ARRAY_SIZE     32
+#define E1000_VLVF_VLANID_MASK    0x00000FFF
+#define E1000_VLVF_POOLSEL_SHIFT  12
+#define E1000_VLVF_POOLSEL_MASK   (0xFF << E1000_VLVF_POOLSEL_SHIFT)
+#define E1000_VLVF_LVLAN          0x00100000
+#define E1000_VLVF_VLANID_ENABLE  0x80000000
+
+#define E1000_VMVIR_VLANA_DEFAULT      0x40000000 /* Always use default VLAN */
+#define E1000_VMVIR_VLANA_NEVER        0x80000000 /* Never insert VLAN tag */
+
+#define E1000_IOVCTL 0x05BBC
+#define E1000_IOVCTL_REUSE_VFQ 0x00000001
+
+#define E1000_RPLOLR_STRVLAN   0x40000000
+#define E1000_RPLOLR_STRCRC    0x80000000
+
+#define E1000_DTXCTL_8023LL     0x0004
+#define E1000_DTXCTL_VLAN_ADDED 0x0008
+#define E1000_DTXCTL_OOS_ENABLE 0x0010
+#define E1000_DTXCTL_MDP_EN     0x0020
+#define E1000_DTXCTL_SPOOF_INT  0x0040
+
+/* from igb/e1000_defines.h */
+
+#define E1000_IVAR_VALID     0x80
+#define E1000_GPIE_NSICR     0x00000001
+#define E1000_GPIE_MSIX_MODE 0x00000010
+#define E1000_GPIE_EIAME     0x40000000
+#define E1000_GPIE_PBA       0x80000000
+
+/* Transmit Control */
+#define E1000_TCTL_EN     0x00000002    /* enable tx */
+#define E1000_TCTL_PSP    0x00000008    /* pad short packets */
+#define E1000_TCTL_CT     0x00000ff0    /* collision threshold */
+#define E1000_TCTL_COLD   0x003ff000    /* collision distance */
+#define E1000_TCTL_RTLC   0x01000000    /* Re-transmit on late collision */
+
+/* Collision related configuration parameters */
+#define E1000_COLLISION_THRESHOLD       15
+#define E1000_CT_SHIFT                  4
+#define E1000_COLLISION_DISTANCE        63
+#define E1000_COLD_SHIFT                12
+
+#define E1000_RAH_POOL_MASK 0x03FC0000
+#define E1000_RAH_POOL_1 0x00040000
+
+#define E1000_ICR_VMMB         0x00000100 /* VM MB event */
+#define E1000_ICR_TS           0x00080000 /* Time Sync Interrupt */
+#define E1000_ICR_DRSTA        0x40000000 /* Device Reset Asserted */
+/* If this bit asserted, the driver should claim the interrupt */
+#define E1000_ICR_INT_ASSERTED 0x80000000
+/* LAN connected device generates an interrupt */
+#define E1000_ICR_DOUTSYNC     0x10000000 /* NIC DMA out of sync */
+
+/* Extended Interrupt Cause Read */
+#define E1000_EICR_RX_QUEUE0    0x00000001 /* Rx Queue 0 Interrupt */
+#define E1000_EICR_RX_QUEUE1    0x00000002 /* Rx Queue 1 Interrupt */
+#define E1000_EICR_RX_QUEUE2    0x00000004 /* Rx Queue 2 Interrupt */
+#define E1000_EICR_RX_QUEUE3    0x00000008 /* Rx Queue 3 Interrupt */
+#define E1000_EICR_TX_QUEUE0    0x00000100 /* Tx Queue 0 Interrupt */
+#define E1000_EICR_TX_QUEUE1    0x00000200 /* Tx Queue 1 Interrupt */
+#define E1000_EICR_TX_QUEUE2    0x00000400 /* Tx Queue 2 Interrupt */
+#define E1000_EICR_TX_QUEUE3    0x00000800 /* Tx Queue 3 Interrupt */
+#define E1000_EICR_OTHER        0x80000000 /* Interrupt Cause Active */
+
+/* Extended Interrupt Cause Set */
+/* E1000_EITR_CNT_IGNR is only for 82576 and newer */
+#define E1000_EITR_CNT_IGNR     0x80000000 /* Don't reset counters on write */
+
+/* PCI Express Control */
+#define E1000_GCR_CMPL_TMOUT_MASK       0x0000F000
+#define E1000_GCR_CMPL_TMOUT_10ms       0x00001000
+#define E1000_GCR_CMPL_TMOUT_RESEND     0x00010000
+#define E1000_GCR_CAP_VER2              0x00040000
+
+#define PHY_REVISION_MASK      0xFFFFFFF0
+#define MAX_PHY_REG_ADDRESS    0x1F  /* 5 bit address bus (0-0x1F) */
+#define MAX_PHY_MULTI_PAGE_REG 0xF
+
+#define IGP03E1000_E_PHY_ID 0x02A80390
+
+/* from igb/e1000_mbox.h */
+
+#define E1000_P2VMAILBOX_STS  0x00000001 /* Initiate message send to VF */
+#define E1000_P2VMAILBOX_ACK  0x00000002 /* Ack message recv'd from VF */
+#define E1000_P2VMAILBOX_VFU  0x00000004 /* VF owns the mailbox buffer */
+#define E1000_P2VMAILBOX_PFU  0x00000008 /* PF owns the mailbox buffer */
+#define E1000_P2VMAILBOX_RVFU 0x00000010 /* Reset VFU - used when VF stuck */
+
+#define E1000_MBVFICR_VFREQ_MASK 0x000000FF /* bits for VF messages */
+#define E1000_MBVFICR_VFREQ_VF1  0x00000001 /* bit for VF 1 message */
+#define E1000_MBVFICR_VFACK_MASK 0x00FF0000 /* bits for VF acks */
+#define E1000_MBVFICR_VFACK_VF1  0x00010000 /* bit for VF 1 ack */
+
+#define E1000_V2PMAILBOX_SIZE 16 /* 16 32 bit words - 64 bytes */
+
+/*
+ * If it's a E1000_VF_* msg then it originates in the VF and is sent to the
+ * PF.  The reverse is true if it is E1000_PF_*.
+ * Message ACK's are the value or'd with 0xF0000000
+ */
+/* Messages below or'd with this are the ACK */
+#define E1000_VT_MSGTYPE_ACK 0x80000000
+/* Messages below or'd with this are the NACK */
+#define E1000_VT_MSGTYPE_NACK 0x40000000
+/* Indicates that VF is still clear to send requests */
+#define E1000_VT_MSGTYPE_CTS 0x20000000
+#define E1000_VT_MSGINFO_SHIFT 16
+/* bits 23:16 are used for exra info for certain messages */
+#define E1000_VT_MSGINFO_MASK (0xFF << E1000_VT_MSGINFO_SHIFT)
+
+#define E1000_VF_RESET                 0x01 /* VF requests reset */
+#define E1000_VF_SET_MAC_ADDR          0x02 /* VF requests to set MAC addr */
+/* VF requests to clear all unicast MAC filters */
+#define E1000_VF_MAC_FILTER_CLR        (0x01 << E1000_VT_MSGINFO_SHIFT)
+/* VF requests to add unicast MAC filter */
+#define E1000_VF_MAC_FILTER_ADD        (0x02 << E1000_VT_MSGINFO_SHIFT)
+#define E1000_VF_SET_MULTICAST         0x03 /* VF requests to set MC addr */
+#define E1000_VF_SET_VLAN              0x04 /* VF requests to set VLAN */
+#define E1000_VF_SET_LPE               0x05 /* VF requests to set VMOLR.LPE */
+#define E1000_VF_SET_PROMISC           0x06 /*VF requests to clear VMOLR.ROPE/MPME*/
+#define E1000_VF_SET_PROMISC_MULTICAST (0x02 << E1000_VT_MSGINFO_SHIFT)
+
+#define E1000_PF_CONTROL_MSG 0x0100 /* PF control message */
+
+/* from igb/e1000_regs.h */
+
+#define E1000_EICR      0x01580  /* Ext. Interrupt Cause Read - R/clr */
+#define E1000_EITR(_n)  (0x01680 + (0x4 * (_n)))
+#define E1000_EICS      0x01520  /* Ext. Interrupt Cause Set - W0 */
+#define E1000_EIMS      0x01524  /* Ext. Interrupt Mask Set/Read - RW */
+#define E1000_EIMC      0x01528  /* Ext. Interrupt Mask Clear - WO */
+#define E1000_EIAC      0x0152C  /* Ext. Interrupt Auto Clear - RW */
+#define E1000_EIAM      0x01530  /* Ext. Interrupt Ack Auto Clear Mask - RW */
+#define E1000_GPIE      0x01514  /* General Purpose Interrupt Enable; RW */
+#define E1000_IVAR0     0x01700  /* Interrupt Vector Allocation Register - RW */
+#define E1000_IVAR_MISC 0x01740  /* Interrupt Vector Allocation Register (last) - RW */
+#define E1000_FRTIMER   0x01048  /* Free Running Timer - RW */
+#define E1000_FCRTV     0x02460  /* Flow Control Refresh Timer Value - RW */
+
+#define E1000_RQDPC(_n) (0x0C030 + ((_n) * 0x40))
+
+#define E1000_RXPBS 0x02404  /* Rx Packet Buffer Size - RW */
+#define E1000_TXPBS 0x03404  /* Tx Packet Buffer Size - RW */
+
+#define E1000_DTXCTL 0x03590  /* DMA TX Control - RW */
+
+#define E1000_HTCBDPC     0x04124  /* Host TX Circuit Breaker Dropped Count */
+#define E1000_RLPML       0x05004  /* RX Long Packet Max Length */
+#define E1000_RA2         0x054E0  /* 2nd half of Rx address array - RW Array */
+#define E1000_PSRTYPE(_i) (0x05480 + ((_i) * 4))
+
+/* VT Registers */
+#define E1000_MBVFICR   0x00C80 /* Mailbox VF Cause - RWC */
+#define E1000_MBVFIMR   0x00C84 /* Mailbox VF int Mask - RW */
+#define E1000_VFLRE     0x00C88 /* VF Register Events - RWC */
+#define E1000_VFRE      0x00C8C /* VF Receive Enables */
+#define E1000_VFTE      0x00C90 /* VF Transmit Enables */
+#define E1000_QDE       0x02408 /* Queue Drop Enable - RW */
+#define E1000_DTXSWC    0x03500 /* DMA Tx Switch Control - RW */
+#define E1000_WVBR      0x03554 /* VM Wrong Behavior - RWS */
+#define E1000_RPLOLR    0x05AF0 /* Replication Offload - RW */
+#define E1000_UTA       0x0A000 /* Unicast Table Array - RW */
+#define E1000_IOVTCL    0x05BBC /* IOV Control Register */
+#define E1000_TXSWC     0x05ACC /* Tx Switch Control */
+#define E1000_LVMMC     0x03548 /* Last VM Misbehavior cause */
+/* These act per VF so an array friendly macro is used */
+#define E1000_P2VMAILBOX(_n)   (0x00C00 + (4 * (_n)))
+#define E1000_VMBMEM(_n)       (0x00800 + (64 * (_n)))
+#define E1000_VMOLR(_n)        (0x05AD0 + (4 * (_n)))
+#define E1000_DVMOLR(_n)       (0x0C038 + (64 * (_n)))
+#define E1000_VLVF(_n)         (0x05D00 + (4 * (_n))) /* VLAN VM Filter */
+#define E1000_VMVIR(_n)        (0x03700 + (4 * (_n)))
+
+/* from igbvf/mbox.h */
+
+#define E1000_V2PMAILBOX_REQ      0x00000001 /* Request for PF Ready bit */
+#define E1000_V2PMAILBOX_ACK      0x00000002 /* Ack PF message received */
+#define E1000_V2PMAILBOX_VFU      0x00000004 /* VF owns the mailbox buffer */
+#define E1000_V2PMAILBOX_PFU      0x00000008 /* PF owns the mailbox buffer */
+#define E1000_V2PMAILBOX_PFSTS    0x00000010 /* PF wrote a message in the MB */
+#define E1000_V2PMAILBOX_PFACK    0x00000020 /* PF ack the previous VF msg */
+#define E1000_V2PMAILBOX_RSTI     0x00000040 /* PF has reset indication */
+#define E1000_V2PMAILBOX_RSTD     0x00000080 /* PF has indicated reset done */
+#define E1000_V2PMAILBOX_R2C_BITS 0x000000B0 /* All read to clear bits */
+
+#define E1000_VFMAILBOX_SIZE      16 /* 16 32 bit words - 64 bytes */
+
+/*
+ * If it's a E1000_VF_* msg then it originates in the VF and is sent to the
+ * PF.  The reverse is true if it is E1000_PF_*.
+ * Message ACK's are the value or'd with 0xF0000000
+ */
+/* Messages below or'd with this are the ACK */
+#define E1000_VT_MSGTYPE_ACK      0x80000000
+/* Messages below or'd with this are the NACK */
+#define E1000_VT_MSGTYPE_NACK     0x40000000
+/* Indicates that VF is still clear to send requests */
+#define E1000_VT_MSGTYPE_CTS      0x20000000
+
+/* We have a total wait time of 1s for vf mailbox posted messages */
+#define E1000_VF_MBX_INIT_TIMEOUT 2000 /* retry count for mbx timeout */
+#define E1000_VF_MBX_INIT_DELAY   500  /* usec delay between retries */
+
+#define E1000_VT_MSGINFO_SHIFT    16
+/* bits 23:16 are used for exra info for certain messages */
+#define E1000_VT_MSGINFO_MASK     (0xFF << E1000_VT_MSGINFO_SHIFT)
+
+#define E1000_VF_RESET            0x01 /* VF requests reset */
+#define E1000_VF_SET_MAC_ADDR     0x02 /* VF requests PF to set MAC addr */
+/* VF requests PF to clear all unicast MAC filters */
+#define E1000_VF_MAC_FILTER_CLR   (0x01 << E1000_VT_MSGINFO_SHIFT)
+/* VF requests PF to add unicast MAC filter */
+#define E1000_VF_MAC_FILTER_ADD   (0x02 << E1000_VT_MSGINFO_SHIFT)
+#define E1000_VF_SET_MULTICAST    0x03 /* VF requests PF to set MC addr */
+#define E1000_VF_SET_VLAN         0x04 /* VF requests PF to set VLAN */
+#define E1000_VF_SET_LPE          0x05 /* VF requests PF to set VMOLR.LPE */
+
+#define E1000_PF_CONTROL_MSG      0x0100 /* PF control message */
+
+/* from igbvf/regs.h */
+
+/* Statistics registers */
+#define E1000_VFGPRC   0x00F10
+#define E1000_VFGORC   0x00F18
+#define E1000_VFMPRC   0x00F3C
+#define E1000_VFGPTC   0x00F14
+#define E1000_VFGOTC   0x00F34
+#define E1000_VFGOTLBC 0x00F50
+#define E1000_VFGPTLBC 0x00F44
+#define E1000_VFGORLBC 0x00F48
+#define E1000_VFGPRLBC 0x00F40
+
+/* These act per VF so an array friendly macro is used */
+#define E1000_V2PMAILBOX(_n) (0x00C40 + (4 * (_n)))
+#define E1000_VMBMEM(_n)     (0x00800 + (64 * (_n)))
+
+/* from igbvf/vf.h */
+
+#define E1000_DEV_ID_82576_VF 0x10CA
+
+/* new */
+
+/* Receive Registers */
+
+/* RX Descriptor Base Low; RW */
+#define E1000_RDBAL(_n)    (0x0C000 + (0x40  * (_n)))
+#define E1000_RDBAL_A(_n)  (0x02800 + (0x100 * (_n)))
+
+/* RX Descriptor Base High; RW */
+#define E1000_RDBAH(_n)    (0x0C004 + (0x40  * (_n)))
+#define E1000_RDBAH_A(_n)  (0x02804 + (0x100 * (_n)))
+
+/* RX Descriptor Ring Length; RW */
+#define E1000_RDLEN(_n)    (0x0C008 + (0x40  * (_n)))
+#define E1000_RDLEN_A(_n)  (0x02808 + (0x100 * (_n)))
+
+/* Split and Replication Receive Control; RW */
+#define E1000_SRRCTL(_n)   (0x0C00C + (0x40  * (_n)))
+#define E1000_SRRCTL_A(_n) (0x0280C + (0x100 * (_n)))
+
+/* RX Descriptor Head; RW */
+#define E1000_RDH(_n)      (0x0C010 + (0x40  * (_n)))
+#define E1000_RDH_A(_n)    (0x02810 + (0x100 * (_n)))
+
+/* RX DCA Control; RW */
+#define E1000_RXCTL(_n)    (0x0C014 + (0x40  * (_n)))
+#define E1000_RXCTL_A(_n)  (0x02814 + (0x100 * (_n)))
+
+/* RX Descriptor Tail; RW */
+#define E1000_RDT(_n)      (0x0C018 + (0x40  * (_n)))
+#define E1000_RDT_A(_n)    (0x02818 + (0x100 * (_n)))
+
+/* RX Descriptor Control; RW */
+#define E1000_RXDCTL(_n)   (0x0C028 + (0x40  * (_n)))
+#define E1000_RXDCTL_A(_n) (0x02828 + (0x100 * (_n)))
+
+/* RX Queue Drop Packet Count; RC */
+#define E1000_RQDPC_A(_n)  (0x02830 + (0x100 * (_n)))
+
+/* Transmit Registers */
+
+/* TX Descriptor Base Low; RW */
+#define E1000_TDBAL(_n)    (0x0E000 + (0x40  * (_n)))
+#define E1000_TDBAL_A(_n)  (0x03800 + (0x100 * (_n)))
+
+/* TX Descriptor Base High; RW */
+#define E1000_TDBAH(_n)    (0x0E004 + (0x40  * (_n)))
+#define E1000_TDBAH_A(_n)  (0x03804 + (0x100 * (_n)))
+
+/* TX Descriptor Ring Length; RW */
+#define E1000_TDLEN(_n)    (0x0E008 + (0x40  * (_n)))
+#define E1000_TDLEN_A(_n)  (0x03808 + (0x100 * (_n)))
+
+/* TX Descriptor Head; RW */
+#define E1000_TDH(_n)      (0x0E010 + (0x40  * (_n)))
+#define E1000_TDH_A(_n)    (0x03810 + (0x100 * (_n)))
+
+/* TX DCA Control; RW */
+#define E1000_TXCTL(_n)    (0x0E014 + (0x40  * (_n)))
+#define E1000_TXCTL_A(_n)  (0x03814 + (0x100 * (_n)))
+
+/* TX Descriptor Tail; RW */
+#define E1000_TDT(_n)      (0x0E018 + (0x40  * (_n)))
+#define E1000_TDT_A(_n)    (0x03818 + (0x100 * (_n)))
+
+/* TX Descriptor Control; RW */
+#define E1000_TXDCTL(_n)   (0x0E028 + (0x40  * (_n)))
+#define E1000_TXDCTL_A(_n) (0x03828 + (0x100 * (_n)))
+
+/* TX Descriptor Completion Write–Back Address Low; RW */
+#define E1000_TDWBAL(_n)   (0x0E038 + (0x40  * (_n)))
+#define E1000_TDWBAL_A(_n) (0x03838 + (0x100 * (_n)))
+
+/* TX Descriptor Completion Write–Back Address High; RW */
+#define E1000_TDWBAH(_n)   (0x0E03C + (0x40  * (_n)))
+#define E1000_TDWBAH_A(_n) (0x0383C + (0x100 * (_n)))
+
+#define E1000_MTA_A        0x0200
+
+#define E1000_XDBAL_MASK (~(BIT(5) - 1)) /* TDBAL and RDBAL Registers Mask */
+
+#define E1000_ICR_MACSEC   0x00000020 /* MACSec */
+#define E1000_ICR_RX0      0x00000040 /* Receiver Overrun */
+#define E1000_ICR_GPI_SDP0 0x00000800 /* General Purpose, SDP0 pin */
+#define E1000_ICR_GPI_SDP1 0x00001000 /* General Purpose, SDP1 pin */
+#define E1000_ICR_GPI_SDP2 0x00002000 /* General Purpose, SDP2 pin */
+#define E1000_ICR_GPI_SDP3 0x00004000 /* General Purpose, SDP3 pin */
+#define E1000_ICR_PTRAP    0x00008000 /* Probe Trap */
+#define E1000_ICR_MNG      0x00040000 /* Management Event */
+#define E1000_ICR_OMED     0x00100000 /* Other Media Energy Detected */
+#define E1000_ICR_FER      0x00400000 /* Fatal Error */
+#define E1000_ICR_NFER     0x00800000 /* Non Fatal Error */
+#define E1000_ICR_CSRTO    0x01000000 /* CSR access Time Out Indication */
+#define E1000_ICR_SCE      0x02000000 /* Storm Control Event */
+#define E1000_ICR_SW_WD    0x04000000 /* Software Watchdog */
+
+/* Extended Interrupts */
+
+#define E1000_EICR_MSIX_MASK   0x01FFFFFF /* Bits used in MSI-X mode */
+#define E1000_EICR_LEGACY_MASK 0x4000FFFF /* Bits used in non MSI-X mode */
+
+/* Mirror VF Control (only RST bit); RW */
+#define E1000_PVTCTRL(_n) (0x10000 + (_n) * 0x100)
+
+/* Mirror Good Packets Received Count; RO */
+#define E1000_PVFGPRC(_n) (0x10010 + (_n) * 0x100)
+
+/* Mirror Good Packets Transmitted Count; RO */
+#define E1000_PVFGPTC(_n) (0x10014 + (_n) * 0x100)
+
+/* Mirror Good Octets Received Count; RO */
+#define E1000_PVFGORC(_n) (0x10018 + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Cause Set; WO */
+#define E1000_PVTEICS(_n) (0x10020 + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Mask Set/Read; RW */
+#define E1000_PVTEIMS(_n) (0x10024 + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Mask Clear; WO */
+#define E1000_PVTEIMC(_n) (0x10028 + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Auto Clear; RW */
+#define E1000_PVTEIAC(_n) (0x1002C + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Auto Mask Enable; RW */
+#define E1000_PVTEIAM(_n) (0x10030 + (_n) * 0x100)
+
+/* Mirror Good Octets Transmitted Count; RO */
+#define E1000_PVFGOTC(_n) (0x10034 + (_n) * 0x100)
+
+/* Mirror Multicast Packets Received Count; RO */
+#define E1000_PVFMPRC(_n) (0x1003C + (_n) * 0x100)
+
+/* Mirror Good RX Packets loopback Count; RO */
+#define E1000_PVFGPRLBC(_n) (0x10040 + (_n) * 0x100)
+
+/* Mirror Good TX packets loopback Count; RO */
+#define E1000_PVFGPTLBC(_n) (0x10044 + (_n) * 0x100)
+
+/* Mirror Good RX Octets loopback Count; RO */
+#define E1000_PVFGORLBC(_n) (0x10048 + (_n) * 0x100)
+
+/* Mirror Good TX Octets loopback Count; RO */
+#define E1000_PVFGOTLBC(_n) (0x10050 + (_n) * 0x100)
+
+/* Mirror Extended Interrupt Cause Set; RC/W1C */
+#define E1000_PVTEICR(_n) (0x10080 + (_n) * 0x100)
+
+/*
+ * These are fake addresses that, according to the specification, the device
+ * is not using. They are used to distinguish between the PF and the VFs
+ * accessing their VTIVAR register (which is the same address, 0x1700)
+ */
+#define E1000_VTIVAR      0x11700
+#define E1000_VTIVAR_MISC 0x11720
+
+#define E1000_RSS_QUEUE(reta, hash) (E1000_RETA_VAL(reta, hash) & 0x0F)
+
+#define E1000_STATUS_IOV_MODE 0x00040000
+
+#define E1000_STATUS_NUM_VFS_SHIFT 14
+
+static inline uint8_t igb_ivar_entry_rx(uint8_t i)
+{
+    return i < 8 ? i * 4 : (i - 8) * 4 + 2;
+}
+
+static inline uint8_t igb_ivar_entry_tx(uint8_t i)
+{
+    return i < 8 ? i * 4 + 1 : (i - 8) * 4 + 3;
+}
+
+#endif
diff --git a/hw/net/igbvf.c b/hw/net/igbvf.c
new file mode 100644
index 0000000000..f02cb7f283
--- /dev/null
+++ b/hw/net/igbvf.c
@@ -0,0 +1,327 @@
+/*
+ * QEMU Intel 82576 SR/IOV Ethernet Controller Emulation
+ *
+ * Datasheet:
+ * https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/82576eg-gbe-datasheet.pdf
+ *
+ * Copyright (c) 2020-2023 Red Hat, Inc.
+ * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
+ * Developed by Daynix Computing LTD (http://www.daynix.com)
+ *
+ * Authors:
+ * Akihiko Odaki <akihiko.odaki@daynix.com>
+ * Gal Hammmer <gal.hammer@sap.com>
+ * Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+ * Dmitry Fleytman <dmitry@daynix.com>
+ * Leonid Bloch <leonid@daynix.com>
+ * Yan Vugenfirer <yan@daynix.com>
+ *
+ * Based on work done by:
+ * Nir Peleg, Tutis Systems Ltd. for Qumranet Inc.
+ * Copyright (c) 2008 Qumranet
+ * Based on work done by:
+ * Copyright (c) 2007 Dan Aloni
+ * Copyright (c) 2004 Antony T Curtis
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/hw.h"
+#include "hw/net/mii.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pcie.h"
+#include "hw/pci/msix.h"
+#include "net/net.h"
+#include "igb_common.h"
+#include "trace.h"
+#include "qapi/error.h"
+
+#define TYPE_IGBVF "igbvf"
+OBJECT_DECLARE_SIMPLE_TYPE(IgbVfState, IGBVF)
+
+#define IGBVF_MSIX_VECTORS  (3)
+
+#define IGBVF_MMIO_BAR_IDX  (0)
+#define IGBVF_MSIX_BAR_IDX  (3)
+
+#define IGBVF_MMIO_SIZE     (16 * 1024)
+#define IGBVF_MSIX_SIZE     (16 * 1024)
+
+struct IgbVfState {
+    PCIDevice parent_obj;
+
+    MemoryRegion mmio;
+    MemoryRegion msix;
+};
+
+static hwaddr vf_to_pf_addr(hwaddr addr, uint16_t vfn, bool write)
+{
+    switch (addr) {
+    case E1000_CTRL:
+    case E1000_CTRL_DUP:
+        return E1000_PVTCTRL(vfn);
+    case E1000_EICS:
+        return E1000_PVTEICS(vfn);
+    case E1000_EIMS:
+        return E1000_PVTEIMS(vfn);
+    case E1000_EIMC:
+        return E1000_PVTEIMC(vfn);
+    case E1000_EIAC:
+        return E1000_PVTEIAC(vfn);
+    case E1000_EIAM:
+        return E1000_PVTEIAM(vfn);
+    case E1000_EICR:
+        return E1000_PVTEICR(vfn);
+    case E1000_EITR(0):
+    case E1000_EITR(1):
+    case E1000_EITR(2):
+        return E1000_EITR(22) + (addr - E1000_EITR(0)) - vfn * 0xC;
+    case E1000_IVAR0:
+        return E1000_VTIVAR + vfn * 4;
+    case E1000_IVAR_MISC:
+        return E1000_VTIVAR_MISC + vfn * 4;
+    case 0x0F04: /* PBACL */
+        return E1000_PBACLR;
+    case 0x0F0C: /* PSRTYPE */
+        return E1000_PSRTYPE(vfn);
+    case E1000_V2PMAILBOX(0):
+        return E1000_V2PMAILBOX(vfn);
+    case E1000_VMBMEM(0) ... E1000_VMBMEM(0) + 0x3F:
+        return addr + vfn * 0x40;
+    case E1000_RDBAL_A(0):
+        return E1000_RDBAL(vfn);
+    case E1000_RDBAL_A(1):
+        return E1000_RDBAL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RDBAH_A(0):
+        return E1000_RDBAH(vfn);
+    case E1000_RDBAH_A(1):
+        return E1000_RDBAH(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RDLEN_A(0):
+        return E1000_RDLEN(vfn);
+    case E1000_RDLEN_A(1):
+        return E1000_RDLEN(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_SRRCTL_A(0):
+        return E1000_SRRCTL(vfn);
+    case E1000_SRRCTL_A(1):
+        return E1000_SRRCTL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RDH_A(0):
+        return E1000_RDH(vfn);
+    case E1000_RDH_A(1):
+        return E1000_RDH(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RXCTL_A(0):
+        return E1000_RXCTL(vfn);
+    case E1000_RXCTL_A(1):
+        return E1000_RXCTL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RDT_A(0):
+        return E1000_RDT(vfn);
+    case E1000_RDT_A(1):
+        return E1000_RDT(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RXDCTL_A(0):
+        return E1000_RXDCTL(vfn);
+    case E1000_RXDCTL_A(1):
+        return E1000_RXDCTL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_RQDPC_A(0):
+        return E1000_RQDPC(vfn);
+    case E1000_RQDPC_A(1):
+        return E1000_RQDPC(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDBAL_A(0):
+        return E1000_TDBAL(vfn);
+    case E1000_TDBAL_A(1):
+        return E1000_TDBAL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDBAH_A(0):
+        return E1000_TDBAH(vfn);
+    case E1000_TDBAH_A(1):
+        return E1000_TDBAH(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDLEN_A(0):
+        return E1000_TDLEN(vfn);
+    case E1000_TDLEN_A(1):
+        return E1000_TDLEN(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDH_A(0):
+        return E1000_TDH(vfn);
+    case E1000_TDH_A(1):
+        return E1000_TDH(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TXCTL_A(0):
+        return E1000_TXCTL(vfn);
+    case E1000_TXCTL_A(1):
+        return E1000_TXCTL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDT_A(0):
+        return E1000_TDT(vfn);
+    case E1000_TDT_A(1):
+        return E1000_TDT(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TXDCTL_A(0):
+        return E1000_TXDCTL(vfn);
+    case E1000_TXDCTL_A(1):
+        return E1000_TXDCTL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDWBAL_A(0):
+        return E1000_TDWBAL(vfn);
+    case E1000_TDWBAL_A(1):
+        return E1000_TDWBAL(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_TDWBAH_A(0):
+        return E1000_TDWBAH(vfn);
+    case E1000_TDWBAH_A(1):
+        return E1000_TDWBAH(vfn + IGB_MAX_VF_FUNCTIONS);
+    case E1000_VFGPRC:
+        return E1000_PVFGPRC(vfn);
+    case E1000_VFGPTC:
+        return E1000_PVFGPTC(vfn);
+    case E1000_VFGORC:
+        return E1000_PVFGORC(vfn);
+    case E1000_VFGOTC:
+        return E1000_PVFGOTC(vfn);
+    case E1000_VFMPRC:
+        return E1000_PVFMPRC(vfn);
+    case E1000_VFGPRLBC:
+        return E1000_PVFGPRLBC(vfn);
+    case E1000_VFGPTLBC:
+        return E1000_PVFGPTLBC(vfn);
+    case E1000_VFGORLBC:
+        return E1000_PVFGORLBC(vfn);
+    case E1000_VFGOTLBC:
+        return E1000_PVFGOTLBC(vfn);
+    case E1000_STATUS:
+    case E1000_FRTIMER:
+        if (write) {
+            return HWADDR_MAX;
+        }
+        /* fallthrough */
+    case 0x34E8: /* PBTWAC */
+    case 0x24E8: /* PBRWAC */
+        return addr;
+    }
+
+    trace_igbvf_wrn_io_addr_unknown(addr);
+
+    return HWADDR_MAX;
+}
+
+static void igbvf_write_config(PCIDevice *dev, uint32_t addr, uint32_t val,
+    int len)
+{
+    trace_igbvf_write_config(addr, val, len);
+    pci_default_write_config(dev, addr, val, len);
+}
+
+static uint64_t igbvf_mmio_read(void *opaque, hwaddr addr, unsigned size)
+{
+    PCIDevice *vf = PCI_DEVICE(opaque);
+    PCIDevice *pf = pcie_sriov_get_pf(vf);
+
+    addr = vf_to_pf_addr(addr, pcie_sriov_vf_number(vf), false);
+    return addr == HWADDR_MAX ? 0 : igb_mmio_read(pf, addr, size);
+}
+
+static void igbvf_mmio_write(void *opaque, hwaddr addr, uint64_t val,
+    unsigned size)
+{
+    PCIDevice *vf = PCI_DEVICE(opaque);
+    PCIDevice *pf = pcie_sriov_get_pf(vf);
+
+    addr = vf_to_pf_addr(addr, pcie_sriov_vf_number(vf), true);
+    if (addr != HWADDR_MAX) {
+        igb_mmio_write(pf, addr, val, size);
+    }
+}
+
+static const MemoryRegionOps mmio_ops = {
+    .read = igbvf_mmio_read,
+    .write = igbvf_mmio_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void igbvf_pci_realize(PCIDevice *dev, Error **errp)
+{
+    IgbVfState *s = IGBVF(dev);
+    int ret;
+    int i;
+
+    dev->config_write = igbvf_write_config;
+
+    memory_region_init_io(&s->mmio, OBJECT(dev), &mmio_ops, s, "igbvf-mmio",
+        IGBVF_MMIO_SIZE);
+    pcie_sriov_vf_register_bar(dev, IGBVF_MMIO_BAR_IDX, &s->mmio);
+
+    memory_region_init(&s->msix, OBJECT(dev), "igbvf-msix", IGBVF_MSIX_SIZE);
+    pcie_sriov_vf_register_bar(dev, IGBVF_MSIX_BAR_IDX, &s->msix);
+
+    ret = msix_init(dev, IGBVF_MSIX_VECTORS, &s->msix, IGBVF_MSIX_BAR_IDX, 0,
+        &s->msix, IGBVF_MSIX_BAR_IDX, 0x2000, 0x70, errp);
+    if (ret) {
+        return;
+    }
+
+    for (i = 0; i < IGBVF_MSIX_VECTORS; i++) {
+        msix_vector_use(dev, i);
+    }
+
+    if (pcie_endpoint_cap_init(dev, 0xa0) < 0) {
+        hw_error("Failed to initialize PCIe capability");
+    }
+
+    if (pcie_aer_init(dev, 1, 0x100, 0x40, errp) < 0) {
+        hw_error("Failed to initialize AER capability");
+    }
+
+    pcie_ari_init(dev, 0x150, 1);
+}
+
+static void igbvf_pci_uninit(PCIDevice *dev)
+{
+    IgbVfState *s = IGBVF(dev);
+
+    pcie_aer_exit(dev);
+    pcie_cap_exit(dev);
+    msix_unuse_all_vectors(dev);
+    msix_uninit(dev, &s->msix, &s->msix);
+}
+
+static void igbvf_class_init(ObjectClass *class, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(class);
+    PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
+
+    c->realize = igbvf_pci_realize;
+    c->exit = igbvf_pci_uninit;
+    c->vendor_id = PCI_VENDOR_ID_INTEL;
+    c->device_id = E1000_DEV_ID_82576_VF;
+    c->revision = 1;
+    c->class_id = PCI_CLASS_NETWORK_ETHERNET;
+
+    dc->desc = "Intel 82576 Virtual Function";
+    dc->user_creatable = false;
+
+    set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
+}
+
+static const TypeInfo igbvf_info = {
+    .name = TYPE_IGBVF,
+    .parent = TYPE_PCI_DEVICE,
+    .instance_size = sizeof(IgbVfState),
+    .class_init = igbvf_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_PCIE_DEVICE },
+        { }
+    },
+};
+
+static void igb_register_types(void)
+{
+    type_register_static(&igbvf_info);
+}
+
+type_init(igb_register_types)
diff --git a/hw/net/meson.build b/hw/net/meson.build
index 4974ad6bd2..49df3ca096 100644
--- a/hw/net/meson.build
+++ b/hw/net/meson.build
@@ -11,7 +11,7 @@ softmmu_ss.add(when: 'CONFIG_E1000_PCI', if_true: files('e1000.c', 'e1000x_commo
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
 softmmu_ss.add(when: 'CONFIG_E1000E_PCI_EXPRESS', if_true: files('e1000e.c', 'e1000e_core.c', 'e1000x_common.c'))
 softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
-softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igb_core.c'))
+softmmu_ss.add(when: 'CONFIG_IGB_PCI_EXPRESS', if_true: files('igb.c', 'igbvf.c', 'igb_core.c'))
 softmmu_ss.add(when: 'CONFIG_RTL8139_PCI', if_true: files('rtl8139.c'))
 softmmu_ss.add(when: 'CONFIG_TULIP', if_true: files('tulip.c'))
 softmmu_ss.add(when: 'CONFIG_VMXNET3_PCI', if_true: files('net_tx_pkt.c', 'net_rx_pkt.c'))
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 8fa4299704..1c32ef58fc 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -272,6 +272,38 @@ e1000e_msix_use_vector_fail(uint32_t vec, int32_t res) "Failed to use MSI-X vect
 e1000e_mac_set_permanent(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_t b4, uint8_t b5) "Set permanent MAC: %02x:%02x:%02x:%02x:%02x:%02x"
 e1000e_cfg_support_virtio(bool support) "Virtio header supported: %d"
 
+# igb.c
+igb_write_config(uint32_t address, uint32_t val, int len) "CONFIG write 0x%"PRIx32", value: 0x%"PRIx32", len: %"PRId32
+igbvf_write_config(uint32_t address, uint32_t val, int len) "CONFIG write 0x%"PRIx32", value: 0x%"PRIx32", len: %"PRId32
+
+# igb_core.c
+igb_core_mdic_read(uint32_t addr, uint32_t data) "MDIC READ: PHY[%u] = 0x%x"
+igb_core_mdic_read_unhandled(uint32_t addr) "MDIC READ: PHY[%u] UNHANDLED"
+igb_core_mdic_write(uint32_t addr, uint32_t data) "MDIC WRITE: PHY[%u] = 0x%x"
+igb_core_mdic_write_unhandled(uint32_t addr) "MDIC WRITE: PHY[%u] UNHANDLED"
+
+igb_rx_desc_buff_size(uint32_t b) "buffer size: %u"
+igb_rx_desc_buff_write(uint64_t addr, uint16_t offset, const void* source, uint32_t len) "addr: 0x%"PRIx64", offset: %u, from: %p, length: %u"
+
+igb_rx_metadata_rss(uint32_t rss) "RSS data: 0x%X"
+
+igb_irq_icr_clear_gpie_nsicr(void) "Clearing ICR on read due to GPIE.NSICR enabled"
+igb_irq_icr_write(uint32_t bits, uint32_t old_icr, uint32_t new_icr) "Clearing ICR bits 0x%x: 0x%x --> 0x%x"
+igb_irq_set_iam(uint32_t icr) "Update IAM: 0x%x"
+igb_irq_read_iam(uint32_t icr) "Current IAM: 0x%x"
+igb_irq_write_eics(uint32_t val, bool msix) "Update EICS: 0x%x MSI-X: %d"
+igb_irq_write_eims(uint32_t val, bool msix) "Update EIMS: 0x%x MSI-X: %d"
+igb_irq_write_eimc(uint32_t val, uint32_t eims, bool msix) "Update EIMC: 0x%x EIMS: 0x%x MSI-X: %d"
+igb_irq_write_eiac(uint32_t val) "Update EIAC: 0x%x"
+igb_irq_write_eiam(uint32_t val, bool msix) "Update EIAM: 0x%x MSI-X: %d"
+igb_irq_write_eicr(uint32_t val, bool msix) "Update EICR: 0x%x MSI-X: %d"
+igb_irq_eitr_set(uint32_t eitr_num, uint32_t val) "EITR[%u] = 0x%x"
+igb_set_pfmailbox(uint32_t vf_num, uint32_t val) "PFMailbox[%d]: 0x%x"
+igb_set_vfmailbox(uint32_t vf_num, uint32_t val) "VFMailbox[%d]: 0x%x"
+
+# igbvf.c
+igbvf_wrn_io_addr_unknown(uint64_t addr) "IO unknown register 0x%"PRIx64
+
 # spapr_llan.c
 spapr_vlan_get_rx_bd_from_pool_found(int pool, int32_t count, uint32_t rx_bufs) "pool=%d count=%"PRId32" rxbufs=%"PRIu32
 spapr_vlan_get_rx_bd_from_page(int buf_ptr, uint64_t bd) "use_buf_ptr=%d bd=0x%016"PRIx64
-- 
2.39.0


