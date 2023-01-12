Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A4666F15
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:09:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuNR-0004NH-A3; Thu, 12 Jan 2023 05:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNL-0004Kw-4I
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:59 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuNG-0004cD-On
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:58 -0500
Received: by mail-pj1-x102f.google.com with SMTP id dw9so17222974pjb.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQWjYo+rd+IlowBPVGbeuZOP6zAHFVWklWiF1Js7xro=;
 b=foZ1Y9740/2R4CpvmVmurA8LjXl0cuR66w18qTtAox5LGdOVDhMb1DWuF+Pn2KDOLT
 C8qATHCL5NNLZDR01kLK5Q0FnSuGjKZWIu5OUoYsumOTjAf4kBb3mmP80n1GcAXjuZUv
 PuwZCaEjKuPRmmDVPTQHIpnOVNSCdENPAYrR5larbxW3bGU9qH9RSL4XoNzQcybKh7J9
 VYZACXLH40t76DyvTzQrmJtpgmxKcb1p/zwme9UqvtIf7H8X6bpPxbDsbDKYbvlRkMFb
 NAxm1aco1VCGWZNG9LqEtMadAQ2Xel+EK2fV7fwZn8FVI7nUQtp5uDTiaULmFrMddF/P
 0rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQWjYo+rd+IlowBPVGbeuZOP6zAHFVWklWiF1Js7xro=;
 b=r7/V8Xxyc+4N21IhKO5oBivw02xxCoOxv1UPPRS5CixcK0Sk20OQewCJRPu/DbSq2f
 a4oGSAeJx4UptmGgYnP0ymLj2N/zX3rlhBxJNzKgPKlsk5V9CoSCscvtDW8foOAV0ddp
 WFrWku4O3WqMaa9Yq1JkRCEOIRQQNjwwPey7Py4LPdDKLN3fmzgnYDQydq6F8/FnHznD
 YWGEVcbUXzXEf6rwvzWctLZT8y3akhdV1pXTc9lu1khYe35d1L0De663dgSHZlP/gO7K
 xW97fyWDiO2dE/+IfcvxdHXRALWMAyMw/639/Jez9WNpkfTrz1ABivUA8+YxvQyUL1r1
 XxbA==
X-Gm-Message-State: AFqh2koYjpOef20aXC24832Li8PpmEfzOv2b6BNAWHc7Dk2VZAwZ3KwH
 J0VcJumMy5mFjDT3BZOF0KQlZQ==
X-Google-Smtp-Source: AMrXdXvzmUpzKhvFPQzHIQsRfqyJUsESN2rOO9wayuogkvWuKdLQe1hC++yG3Tcm5KFayFbwJJ/P6g==
X-Received: by 2002:a17:90b:120e:b0:226:bbb9:1bf1 with SMTP id
 gl14-20020a17090b120e00b00226bbb91bf1mr28252175pjb.14.1673517591855; 
 Thu, 12 Jan 2023 01:59:51 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:51 -0800 (PST)
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
Subject: [PATCH 23/31] igb: Rename identifiers
Date: Thu, 12 Jan 2023 18:57:35 +0900
Message-Id: <20230112095743.20123-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

Rename identifiers of definitions which will be modified later for igb.
This will also allow to build igb along with e1000e.

Signed-off-by: Gal Hammer <gal.hammer@sap.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/igb.c        |  368 +++++-----
 hw/net/igb_common.h |    6 +-
 hw/net/igb_core.c   | 1694 +++++++++++++++++++++----------------------
 hw/net/igb_core.h   |   74 +-
 4 files changed, 1062 insertions(+), 1080 deletions(-)

diff --git a/hw/net/igb.c b/hw/net/igb.c
index d61efb781e..5d4c904cc5 100644
--- a/hw/net/igb.c
+++ b/hw/net/igb.c
@@ -48,17 +48,17 @@
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 
-#include "e1000_common.h"
-#include "e1000e_core.h"
+#include "igb_common.h"
+#include "igb_core.h"
 
 #include "trace.h"
 #include "qapi/error.h"
 #include "qom/object.h"
 
-#define TYPE_E1000E "e1000e"
-OBJECT_DECLARE_SIMPLE_TYPE(E1000EState, E1000E)
+#define TYPE_IGB "igb"
+OBJECT_DECLARE_SIMPLE_TYPE(IGBState, IGB)
 
-struct E1000EState {
+struct IGBState {
     PCIDevice parent_obj;
     NICState *nic;
     NICConf conf;
@@ -78,7 +78,7 @@ struct E1000EState {
 
     bool disable_vnet;
 
-    E1000ECore core;
+    IGBCore core;
     bool init_vet;
 };
 
@@ -96,22 +96,21 @@ struct E1000EState {
 #define E1000E_MSIX_PBA     (0x2000)
 
 static uint64_t
-e1000e_mmio_read(void *opaque, hwaddr addr, unsigned size)
+igb_mmio_read(void *opaque, hwaddr addr, unsigned size)
 {
-    E1000EState *s = opaque;
-    return e1000e_core_read(&s->core, addr, size);
+    IGBState *s = opaque;
+    return igb_core_read(&s->core, addr, size);
 }
 
 static void
-e1000e_mmio_write(void *opaque, hwaddr addr,
-                   uint64_t val, unsigned size)
+igb_mmio_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
-    E1000EState *s = opaque;
-    e1000e_core_write(&s->core, addr, val, size);
+    IGBState *s = opaque;
+    igb_core_write(&s->core, addr, val, size);
 }
 
 static bool
-e1000e_io_get_reg_index(E1000EState *s, uint32_t *idx)
+igb_io_get_reg_index(IGBState *s, uint32_t *idx)
 {
     if (s->ioaddr < 0x1FFFF) {
         *idx = s->ioaddr;
@@ -133,9 +132,9 @@ e1000e_io_get_reg_index(E1000EState *s, uint32_t *idx)
 }
 
 static uint64_t
-e1000e_io_read(void *opaque, hwaddr addr, unsigned size)
+igb_io_read(void *opaque, hwaddr addr, unsigned size)
 {
-    E1000EState *s = opaque;
+    IGBState *s = opaque;
     uint32_t idx = 0;
     uint64_t val;
 
@@ -144,8 +143,8 @@ e1000e_io_read(void *opaque, hwaddr addr, unsigned size)
         trace_e1000e_io_read_addr(s->ioaddr);
         return s->ioaddr;
     case E1000_IODATA:
-        if (e1000e_io_get_reg_index(s, &idx)) {
-            val = e1000e_core_read(&s->core, idx, sizeof(val));
+        if (igb_io_get_reg_index(s, &idx)) {
+            val = igb_core_read(&s->core, idx, sizeof(val));
             trace_e1000e_io_read_data(idx, val);
             return val;
         }
@@ -157,10 +156,9 @@ e1000e_io_read(void *opaque, hwaddr addr, unsigned size)
 }
 
 static void
-e1000e_io_write(void *opaque, hwaddr addr,
-                uint64_t val, unsigned size)
+igb_io_write(void *opaque, hwaddr addr, uint64_t val, unsigned size)
 {
-    E1000EState *s = opaque;
+    IGBState *s = opaque;
     uint32_t idx = 0;
 
     switch (addr) {
@@ -169,9 +167,9 @@ e1000e_io_write(void *opaque, hwaddr addr,
         s->ioaddr = (uint32_t) val;
         return;
     case E1000_IODATA:
-        if (e1000e_io_get_reg_index(s, &idx)) {
+        if (igb_io_get_reg_index(s, &idx)) {
             trace_e1000e_io_write_data(idx, val);
-            e1000e_core_write(&s->core, idx, val, sizeof(val));
+            igb_core_write(&s->core, idx, val, sizeof(val));
         }
         return;
     default:
@@ -181,8 +179,8 @@ e1000e_io_write(void *opaque, hwaddr addr,
 }
 
 static const MemoryRegionOps mmio_ops = {
-    .read = e1000e_mmio_read,
-    .write = e1000e_mmio_write,
+    .read = igb_mmio_read,
+    .write = igb_mmio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 4,
@@ -191,8 +189,8 @@ static const MemoryRegionOps mmio_ops = {
 };
 
 static const MemoryRegionOps io_ops = {
-    .read = e1000e_io_read,
-    .write = e1000e_io_write,
+    .read = igb_io_read,
+    .write = igb_io_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 4,
@@ -201,47 +199,47 @@ static const MemoryRegionOps io_ops = {
 };
 
 static bool
-e1000e_nc_can_receive(NetClientState *nc)
+igb_nc_can_receive(NetClientState *nc)
 {
-    E1000EState *s = qemu_get_nic_opaque(nc);
-    return e1000e_can_receive(&s->core);
+    IGBState *s = qemu_get_nic_opaque(nc);
+    return igb_can_receive(&s->core);
 }
 
 static ssize_t
-e1000e_nc_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
+igb_nc_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
 {
-    E1000EState *s = qemu_get_nic_opaque(nc);
-    return e1000e_receive_iov(&s->core, iov, iovcnt);
+    IGBState *s = qemu_get_nic_opaque(nc);
+    return igb_receive_iov(&s->core, iov, iovcnt);
 }
 
 static ssize_t
-e1000e_nc_receive(NetClientState *nc, const uint8_t *buf, size_t size)
+igb_nc_receive(NetClientState *nc, const uint8_t *buf, size_t size)
 {
-    E1000EState *s = qemu_get_nic_opaque(nc);
-    return e1000e_receive(&s->core, buf, size);
+    IGBState *s = qemu_get_nic_opaque(nc);
+    return igb_receive(&s->core, buf, size);
 }
 
 static void
-e1000e_set_link_status(NetClientState *nc)
+igb_set_link_status(NetClientState *nc)
 {
-    E1000EState *s = qemu_get_nic_opaque(nc);
-    e1000e_core_set_link_status(&s->core);
+    IGBState *s = qemu_get_nic_opaque(nc);
+    igb_core_set_link_status(&s->core);
 }
 
-static NetClientInfo net_e1000e_info = {
+static NetClientInfo net_igb_info = {
     .type = NET_CLIENT_DRIVER_NIC,
     .size = sizeof(NICState),
-    .can_receive = e1000e_nc_can_receive,
-    .receive = e1000e_nc_receive,
-    .receive_iov = e1000e_nc_receive_iov,
-    .link_status_changed = e1000e_set_link_status,
+    .can_receive = igb_nc_can_receive,
+    .receive = igb_nc_receive,
+    .receive_iov = igb_nc_receive_iov,
+    .link_status_changed = igb_set_link_status,
 };
 
 /*
  * EEPROM (NVM) contents documented in Table 36, section 6.1
  * and generally 6.1.2 Software accessed words.
  */
-static const uint16_t e1000e_eeprom_template[64] = {
+static const uint16_t igb_eeprom_template[64] = {
   /*        Address        |    Compat.    | ImVer |   Compat.     */
     0x0000, 0x0000, 0x0000, 0x0420, 0xf746, 0x2010, 0xffff, 0xffff,
   /*      PBA      |ICtrl1 | SSID  | SVID  | DevID |-------|ICtrl2 */
@@ -260,14 +258,14 @@ static const uint16_t e1000e_eeprom_template[64] = {
     0xffff, 0xffff, 0xffff, 0xffff, 0x0000, 0x0120, 0xffff, 0x0000,
 };
 
-static void e1000e_core_realize(E1000EState *s)
+static void igb_core_realize(IGBState *s)
 {
     s->core.owner = &s->parent_obj;
     s->core.owner_nic = s->nic;
 }
 
 static void
-e1000e_unuse_msix_vectors(E1000EState *s, int num_vectors)
+igb_unuse_msix_vectors(IGBState *s, int num_vectors)
 {
     int i;
     for (i = 0; i < num_vectors; i++) {
@@ -276,7 +274,7 @@ e1000e_unuse_msix_vectors(E1000EState *s, int num_vectors)
 }
 
 static void
-e1000e_use_msix_vectors(E1000EState *s, int num_vectors)
+igb_use_msix_vectors(IGBState *s, int num_vectors)
 {
     int i;
     for (i = 0; i < num_vectors; i++) {
@@ -285,9 +283,9 @@ e1000e_use_msix_vectors(E1000EState *s, int num_vectors)
 }
 
 static void
-e1000e_init_msix(E1000EState *s)
+igb_init_msix(IGBState *s)
 {
-    int res = msix_init(PCI_DEVICE(s), E1000E_MSIX_VEC_NUM,
+    int res = msix_init(PCI_DEVICE(s), IGB_MSIX_VEC_NUM,
                         &s->msix,
                         E1000E_MSIX_IDX, E1000E_MSIX_TABLE,
                         &s->msix,
@@ -297,27 +295,27 @@ e1000e_init_msix(E1000EState *s)
     if (res < 0) {
         trace_e1000e_msix_init_fail(res);
     } else {
-        e1000e_use_msix_vectors(s, E1000E_MSIX_VEC_NUM);
+        igb_use_msix_vectors(s, IGB_MSIX_VEC_NUM);
     }
 }
 
 static void
-e1000e_cleanup_msix(E1000EState *s)
+igb_cleanup_msix(IGBState *s)
 {
     if (msix_present(PCI_DEVICE(s))) {
-        e1000e_unuse_msix_vectors(s, E1000E_MSIX_VEC_NUM);
+        igb_unuse_msix_vectors(s, IGB_MSIX_VEC_NUM);
         msix_uninit(PCI_DEVICE(s), &s->msix, &s->msix);
     }
 }
 
 static void
-e1000e_init_net_peer(E1000EState *s, PCIDevice *pci_dev, uint8_t *macaddr)
+igb_init_net_peer(IGBState *s, PCIDevice *pci_dev, uint8_t *macaddr)
 {
     DeviceState *dev = DEVICE(pci_dev);
     NetClientState *nc;
     int i;
 
-    s->nic = qemu_new_nic(&net_e1000e_info, &s->conf,
+    s->nic = qemu_new_nic(&net_igb_info, &s->conf,
         object_get_typename(OBJECT(s)), dev->id, s);
 
     s->core.max_queue_num = s->conf.peers.queues ? s->conf.peers.queues - 1 : 0;
@@ -355,7 +353,7 @@ e1000e_init_net_peer(E1000EState *s, PCIDevice *pci_dev, uint8_t *macaddr)
 }
 
 static inline uint64_t
-e1000e_gen_dsn(uint8_t *mac)
+igb_gen_dsn(uint8_t *mac)
 {
     return (uint64_t)(mac[5])        |
            (uint64_t)(mac[4])  << 8  |
@@ -368,7 +366,7 @@ e1000e_gen_dsn(uint8_t *mac)
 }
 
 static int
-e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
+igb_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
 {
     Error *local_err = NULL;
     int ret = pci_add_capability(pdev, PCI_CAP_ID_PM, offset,
@@ -394,32 +392,32 @@ e1000e_add_pm_capability(PCIDevice *pdev, uint8_t offset, uint16_t pmc)
     return ret;
 }
 
-static void e1000e_write_config(PCIDevice *pci_dev, uint32_t address,
-                                uint32_t val, int len)
+static void igb_write_config(PCIDevice *pci_dev, uint32_t address,
+                             uint32_t val, int len)
 {
-    E1000EState *s = E1000E(pci_dev);
+    IGBState *s = IGB(pci_dev);
 
     pci_default_write_config(pci_dev, address, val, len);
 
     if (range_covers_byte(address, len, PCI_COMMAND) &&
         (pci_dev->config[PCI_COMMAND] & PCI_COMMAND_MASTER)) {
-        e1000e_start_recv(&s->core);
+        igb_start_recv(&s->core);
     }
 }
 
-static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
+static void igb_pci_realize(PCIDevice *pci_dev, Error **errp)
 {
     static const uint16_t e1000e_pmrb_offset = 0x0C8;
     static const uint16_t e1000e_pcie_offset = 0x0E0;
     static const uint16_t e1000e_aer_offset =  0x100;
     static const uint16_t e1000e_dsn_offset =  0x140;
-    E1000EState *s = E1000E(pci_dev);
+    IGBState *s = IGB(pci_dev);
     uint8_t *macaddr;
     int ret;
 
     trace_e1000e_cb_pci_realize();
 
-    pci_dev->config_write = e1000e_write_config;
+    pci_dev->config_write = igb_write_config;
 
     pci_dev->config[PCI_CACHE_LINE_SIZE] = 0x10;
     pci_dev->config[PCI_INTERRUPT_PIN] = 1;
@@ -432,7 +430,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
 
     /* Define IO/MMIO regions */
     memory_region_init_io(&s->mmio, OBJECT(s), &mmio_ops, s,
-                          "e1000e-mmio", E1000E_MMIO_SIZE);
+                          "igb-mmio", E1000E_MMIO_SIZE);
     pci_register_bar(pci_dev, E1000E_MMIO_IDX,
                      PCI_BASE_ADDRESS_SPACE_MEMORY, &s->mmio);
 
@@ -441,16 +439,16 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
      * for drivers that may theoretically probe for its presence.
      */
     memory_region_init(&s->flash, OBJECT(s),
-                       "e1000e-flash", E1000E_FLASH_SIZE);
+                       "igb-flash", E1000E_FLASH_SIZE);
     pci_register_bar(pci_dev, E1000E_FLASH_IDX,
                      PCI_BASE_ADDRESS_SPACE_MEMORY, &s->flash);
 
     memory_region_init_io(&s->io, OBJECT(s), &io_ops, s,
-                          "e1000e-io", E1000E_IO_SIZE);
+                          "igb-io", E1000E_IO_SIZE);
     pci_register_bar(pci_dev, E1000E_IO_IDX,
                      PCI_BASE_ADDRESS_SPACE_IO, &s->io);
 
-    memory_region_init(&s->msix, OBJECT(s), "e1000e-msix",
+    memory_region_init(&s->msix, OBJECT(s), "igb-msix",
                        E1000E_MSIX_SIZE);
     pci_register_bar(pci_dev, E1000E_MSIX_IDX,
                      PCI_BASE_ADDRESS_SPACE_MEMORY, &s->msix);
@@ -459,7 +457,7 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
     macaddr = s->conf.macaddr.a;
 
-    e1000e_init_msix(s);
+    igb_init_msix(s);
 
     if (pcie_endpoint_cap_v1_init(pci_dev, e1000e_pcie_offset) < 0) {
         hw_error("Failed to initialize PCIe capability");
@@ -470,8 +468,8 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
         trace_e1000e_msi_init_fail(ret);
     }
 
-    if (e1000e_add_pm_capability(pci_dev, e1000e_pmrb_offset,
-                                  PCI_PM_CAP_DSI) < 0) {
+    if (igb_add_pm_capability(pci_dev, e1000e_pmrb_offset,
+                              PCI_PM_CAP_DSI) < 0) {
         hw_error("Failed to initialize PM capability");
     }
 
@@ -480,64 +478,63 @@ static void e1000e_pci_realize(PCIDevice *pci_dev, Error **errp)
         hw_error("Failed to initialize AER capability");
     }
 
-    pcie_dev_ser_num_init(pci_dev, e1000e_dsn_offset,
-                          e1000e_gen_dsn(macaddr));
+    pcie_dev_ser_num_init(pci_dev, e1000e_dsn_offset, igb_gen_dsn(macaddr));
 
-    e1000e_init_net_peer(s, pci_dev, macaddr);
+    igb_init_net_peer(s, pci_dev, macaddr);
 
     /* Initialize core */
-    e1000e_core_realize(s);
+    igb_core_realize(s);
 
-    e1000e_core_pci_realize(&s->core,
-                            e1000e_eeprom_template,
-                            sizeof(e1000e_eeprom_template),
-                            macaddr);
+    igb_core_pci_realize(&s->core,
+                         igb_eeprom_template,
+                         sizeof(igb_eeprom_template),
+                         macaddr);
 }
 
-static void e1000e_pci_uninit(PCIDevice *pci_dev)
+static void igb_pci_uninit(PCIDevice *pci_dev)
 {
-    E1000EState *s = E1000E(pci_dev);
+    IGBState *s = IGB(pci_dev);
 
     trace_e1000e_cb_pci_uninit();
 
-    e1000e_core_pci_uninit(&s->core);
+    igb_core_pci_uninit(&s->core);
 
     pcie_aer_exit(pci_dev);
     pcie_cap_exit(pci_dev);
 
     qemu_del_nic(s->nic);
 
-    e1000e_cleanup_msix(s);
+    igb_cleanup_msix(s);
     msi_uninit(pci_dev);
 }
 
-static void e1000e_qdev_reset(Object *obj)
+static void igb_qdev_reset(Object *obj)
 {
-    E1000EState *s = E1000E(obj);
+    IGBState *s = IGB(obj);
 
     trace_e1000e_cb_qdev_reset();
 
-    e1000e_core_reset(&s->core);
+    igb_core_reset(&s->core);
 
     if (s->init_vet) {
         s->core.mac[VET] = ETH_P_VLAN;
     }
 }
 
-static int e1000e_pre_save(void *opaque)
+static int igb_pre_save(void *opaque)
 {
-    E1000EState *s = opaque;
+    IGBState *s = opaque;
 
     trace_e1000e_cb_pre_save();
 
-    e1000e_core_pre_save(&s->core);
+    igb_core_pre_save(&s->core);
 
     return 0;
 }
 
-static int e1000e_post_load(void *opaque, int version_id)
+static int igb_post_load(void *opaque, int version_id)
 {
-    E1000EState *s = opaque;
+    IGBState *s = opaque;
 
     trace_e1000e_cb_post_load();
 
@@ -549,178 +546,175 @@ static int e1000e_post_load(void *opaque, int version_id)
         return -1;
     }
 
-    return e1000e_core_post_load(&s->core);
+    return igb_core_post_load(&s->core);
 }
 
-static const VMStateDescription e1000e_vmstate_tx = {
-    .name = "e1000e-tx",
+static const VMStateDescription igb_vmstate_tx = {
+    .name = "igb-tx",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT8(sum_needed, struct e1000e_tx),
-        VMSTATE_UINT8(props.ipcss, struct e1000e_tx),
-        VMSTATE_UINT8(props.ipcso, struct e1000e_tx),
-        VMSTATE_UINT16(props.ipcse, struct e1000e_tx),
-        VMSTATE_UINT8(props.tucss, struct e1000e_tx),
-        VMSTATE_UINT8(props.tucso, struct e1000e_tx),
-        VMSTATE_UINT16(props.tucse, struct e1000e_tx),
-        VMSTATE_UINT8(props.hdr_len, struct e1000e_tx),
-        VMSTATE_UINT16(props.mss, struct e1000e_tx),
-        VMSTATE_UINT32(props.paylen, struct e1000e_tx),
-        VMSTATE_INT8(props.ip, struct e1000e_tx),
-        VMSTATE_INT8(props.tcp, struct e1000e_tx),
-        VMSTATE_BOOL(props.tse, struct e1000e_tx),
-        VMSTATE_BOOL(cptse, struct e1000e_tx),
-        VMSTATE_BOOL(skip_cp, struct e1000e_tx),
+        VMSTATE_UINT8(sum_needed, struct igb_tx),
+        VMSTATE_UINT8(props.ipcss, struct igb_tx),
+        VMSTATE_UINT8(props.ipcso, struct igb_tx),
+        VMSTATE_UINT16(props.ipcse, struct igb_tx),
+        VMSTATE_UINT8(props.tucss, struct igb_tx),
+        VMSTATE_UINT8(props.tucso, struct igb_tx),
+        VMSTATE_UINT16(props.tucse, struct igb_tx),
+        VMSTATE_UINT8(props.hdr_len, struct igb_tx),
+        VMSTATE_UINT16(props.mss, struct igb_tx),
+        VMSTATE_UINT32(props.paylen, struct igb_tx),
+        VMSTATE_INT8(props.ip, struct igb_tx),
+        VMSTATE_INT8(props.tcp, struct igb_tx),
+        VMSTATE_BOOL(props.tse, struct igb_tx),
+        VMSTATE_BOOL(cptse, struct igb_tx),
+        VMSTATE_BOOL(skip_cp, struct igb_tx),
         VMSTATE_END_OF_LIST()
     }
 };
 
-static const VMStateDescription e1000e_vmstate_intr_timer = {
-    .name = "e1000e-intr-timer",
+static const VMStateDescription igb_vmstate_intr_timer = {
+    .name = "igb-intr-timer",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_TIMER_PTR(timer, E1000IntrDelayTimer),
-        VMSTATE_BOOL(running, E1000IntrDelayTimer),
+        VMSTATE_TIMER_PTR(timer, IGBIntrDelayTimer),
+        VMSTATE_BOOL(running, IGBIntrDelayTimer),
         VMSTATE_END_OF_LIST()
     }
 };
 
-#define VMSTATE_E1000E_INTR_DELAY_TIMER(_f, _s)                     \
+#define VMSTATE_IGB_INTR_DELAY_TIMER(_f, _s)                        \
     VMSTATE_STRUCT(_f, _s, 0,                                       \
-                   e1000e_vmstate_intr_timer, E1000IntrDelayTimer)
+                   igb_vmstate_intr_timer, IGBIntrDelayTimer)
 
-#define VMSTATE_E1000E_INTR_DELAY_TIMER_ARRAY(_f, _s, _num)         \
+#define VMSTATE_IGB_INTR_DELAY_TIMER_ARRAY(_f, _s, _num)            \
     VMSTATE_STRUCT_ARRAY(_f, _s, _num, 0,                           \
-                         e1000e_vmstate_intr_timer, E1000IntrDelayTimer)
+                         igb_vmstate_intr_timer, IGBIntrDelayTimer)
 
-static const VMStateDescription e1000e_vmstate = {
-    .name = "e1000e",
+static const VMStateDescription igb_vmstate = {
+    .name = "igb",
     .version_id = 1,
     .minimum_version_id = 1,
-    .pre_save = e1000e_pre_save,
-    .post_load = e1000e_post_load,
+    .pre_save = igb_pre_save,
+    .post_load = igb_post_load,
     .fields = (VMStateField[]) {
-        VMSTATE_PCI_DEVICE(parent_obj, E1000EState),
-        VMSTATE_MSIX(parent_obj, E1000EState),
+        VMSTATE_PCI_DEVICE(parent_obj, IGBState),
+        VMSTATE_MSIX(parent_obj, IGBState),
 
-        VMSTATE_UINT32(ioaddr, E1000EState),
-        VMSTATE_UINT32(core.rxbuf_min_shift, E1000EState),
-        VMSTATE_UINT8(core.rx_desc_len, E1000EState),
-        VMSTATE_UINT32_ARRAY(core.rxbuf_sizes, E1000EState,
+        VMSTATE_UINT32(ioaddr, IGBState),
+        VMSTATE_UINT32(core.rxbuf_min_shift, IGBState),
+        VMSTATE_UINT8(core.rx_desc_len, IGBState),
+        VMSTATE_UINT32_ARRAY(core.rxbuf_sizes, IGBState,
                              E1000_PSRCTL_BUFFS_PER_DESC),
-        VMSTATE_UINT32(core.rx_desc_buf_size, E1000EState),
-        VMSTATE_UINT16_ARRAY(core.eeprom, E1000EState, E1000E_EEPROM_SIZE),
-        VMSTATE_UINT16_2DARRAY(core.phy, E1000EState,
+        VMSTATE_UINT32(core.rx_desc_buf_size, IGBState),
+        VMSTATE_UINT16_ARRAY(core.eeprom, IGBState, IGB_EEPROM_SIZE),
+        VMSTATE_UINT16_2DARRAY(core.phy, IGBState,
                                E1000E_PHY_PAGES, E1000E_PHY_PAGE_SIZE),
-        VMSTATE_UINT32_ARRAY(core.mac, E1000EState, E1000E_MAC_SIZE),
-        VMSTATE_UINT8_ARRAY(core.permanent_mac, E1000EState, ETH_ALEN),
+        VMSTATE_UINT32_ARRAY(core.mac, IGBState, E1000E_MAC_SIZE),
+        VMSTATE_UINT8_ARRAY(core.permanent_mac, IGBState, ETH_ALEN),
 
-        VMSTATE_UINT32(core.delayed_causes, E1000EState),
+        VMSTATE_UINT32(core.delayed_causes, IGBState),
 
-        VMSTATE_UINT16(subsys, E1000EState),
-        VMSTATE_UINT16(subsys_ven, E1000EState),
+        VMSTATE_UINT16(subsys, IGBState),
+        VMSTATE_UINT16(subsys_ven, IGBState),
 
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.rdtr, E1000EState),
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.radv, E1000EState),
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.raid, E1000EState),
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.tadv, E1000EState),
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.tidv, E1000EState),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.rdtr, IGBState),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.radv, IGBState),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.raid, IGBState),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.tadv, IGBState),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.tidv, IGBState),
 
-        VMSTATE_E1000E_INTR_DELAY_TIMER(core.itr, E1000EState),
-        VMSTATE_UNUSED(1),
+        VMSTATE_IGB_INTR_DELAY_TIMER(core.itr, IGBState),
 
-        VMSTATE_E1000E_INTR_DELAY_TIMER_ARRAY(core.eitr, E1000EState,
-                                              E1000E_MSIX_VEC_NUM),
-        VMSTATE_UNUSED(E1000E_MSIX_VEC_NUM),
+        VMSTATE_IGB_INTR_DELAY_TIMER_ARRAY(core.eitr, IGBState,
+                                           IGB_MSIX_VEC_NUM),
 
-        VMSTATE_UINT32(core.itr_guest_value, E1000EState),
-        VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
-                             E1000E_MSIX_VEC_NUM),
+        VMSTATE_UINT32(core.itr_guest_value, IGBState),
+        VMSTATE_UINT32_ARRAY(core.eitr_guest_value, IGBState, IGB_MSIX_VEC_NUM),
 
-        VMSTATE_UINT16(core.vet, E1000EState),
+        VMSTATE_UINT16(core.vet, IGBState),
 
-        VMSTATE_STRUCT_ARRAY(core.tx, E1000EState, E1000E_NUM_QUEUES, 0,
-                             e1000e_vmstate_tx, struct e1000e_tx),
+        VMSTATE_STRUCT_ARRAY(core.tx, IGBState, IGB_NUM_QUEUES, 0,
+                             igb_vmstate_tx, struct igb_tx),
         VMSTATE_END_OF_LIST()
     }
 };
 
-static PropertyInfo e1000e_prop_disable_vnet,
-                    e1000e_prop_subsys_ven,
-                    e1000e_prop_subsys;
+static PropertyInfo igb_prop_disable_vnet,
+                    igb_prop_subsys_ven,
+                    igb_prop_subsys;
 
-static Property e1000e_properties[] = {
-    DEFINE_NIC_PROPERTIES(E1000EState, conf),
-    DEFINE_PROP_SIGNED("disable_vnet_hdr", E1000EState, disable_vnet, false,
-                        e1000e_prop_disable_vnet, bool),
-    DEFINE_PROP_SIGNED("subsys_ven", E1000EState, subsys_ven,
+static Property igb_properties[] = {
+    DEFINE_NIC_PROPERTIES(IGBState, conf),
+    DEFINE_PROP_SIGNED("disable_vnet_hdr", IGBState, disable_vnet, false,
+                        igb_prop_disable_vnet, bool),
+    DEFINE_PROP_SIGNED("subsys_ven", IGBState, subsys_ven,
                         PCI_VENDOR_ID_INTEL,
-                        e1000e_prop_subsys_ven, uint16_t),
-    DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
-                        e1000e_prop_subsys, uint16_t),
-    DEFINE_PROP_BOOL("init-vet", E1000EState, init_vet, true),
+                        igb_prop_subsys_ven, uint16_t),
+    DEFINE_PROP_SIGNED("subsys", IGBState, subsys, 0,
+                        igb_prop_subsys, uint16_t),
+    DEFINE_PROP_BOOL("init-vet", IGBState, init_vet, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-static void e1000e_class_init(ObjectClass *class, void *data)
+static void igb_class_init(ObjectClass *class, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(class);
     ResettableClass *rc = RESETTABLE_CLASS(class);
     PCIDeviceClass *c = PCI_DEVICE_CLASS(class);
 
-    c->realize = e1000e_pci_realize;
-    c->exit = e1000e_pci_uninit;
+    c->realize = igb_pci_realize;
+    c->exit = igb_pci_uninit;
     c->vendor_id = PCI_VENDOR_ID_INTEL;
     c->device_id = E1000_DEV_ID_82574L;
     c->revision = 0;
     c->romfile = "efi-e1000e.rom";
     c->class_id = PCI_CLASS_NETWORK_ETHERNET;
 
-    rc->phases.hold = e1000e_qdev_reset;
+    rc->phases.hold = igb_qdev_reset;
 
     dc->desc = "Intel 82574L GbE Controller";
-    dc->vmsd = &e1000e_vmstate;
+    dc->vmsd = &igb_vmstate;
 
-    e1000e_prop_disable_vnet = qdev_prop_uint8;
-    e1000e_prop_disable_vnet.description = "Do not use virtio headers, "
-                                           "perform SW offloads emulation "
-                                           "instead";
+    igb_prop_disable_vnet = qdev_prop_uint8;
+    igb_prop_disable_vnet.description = "Do not use virtio headers, "
+                                        "perform SW offloads emulation "
+                                        "instead";
 
-    e1000e_prop_subsys_ven = qdev_prop_uint16;
-    e1000e_prop_subsys_ven.description = "PCI device Subsystem Vendor ID";
+    igb_prop_subsys_ven = qdev_prop_uint16;
+    igb_prop_subsys_ven.description = "PCI device Subsystem Vendor ID";
 
-    e1000e_prop_subsys = qdev_prop_uint16;
-    e1000e_prop_subsys.description = "PCI device Subsystem ID";
+    igb_prop_subsys = qdev_prop_uint16;
+    igb_prop_subsys.description = "PCI device Subsystem ID";
 
-    device_class_set_props(dc, e1000e_properties);
+    device_class_set_props(dc, igb_properties);
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 }
 
-static void e1000e_instance_init(Object *obj)
+static void igb_instance_init(Object *obj)
 {
-    E1000EState *s = E1000E(obj);
+    IGBState *s = IGB(obj);
     device_add_bootindex_property(obj, &s->conf.bootindex,
                                   "bootindex", "/ethernet-phy@0",
                                   DEVICE(obj));
 }
 
-static const TypeInfo e1000e_info = {
-    .name = TYPE_E1000E,
+static const TypeInfo igb_info = {
+    .name = TYPE_IGB,
     .parent = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(E1000EState),
-    .class_init = e1000e_class_init,
-    .instance_init = e1000e_instance_init,
+    .instance_size = sizeof(IGBState),
+    .class_init = igb_class_init,
+    .instance_init = igb_instance_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_PCIE_DEVICE },
         { }
     },
 };
 
-static void e1000e_register_types(void)
+static void igb_register_types(void)
 {
-    type_register_static(&e1000e_info);
+    type_register_static(&igb_info);
 }
 
-type_init(e1000e_register_types)
+type_init(igb_register_types)
diff --git a/hw/net/igb_common.h b/hw/net/igb_common.h
index 56afad3feb..e29e829cb0 100644
--- a/hw/net/igb_common.h
+++ b/hw/net/igb_common.h
@@ -1,5 +1,5 @@
 /*
- * QEMU e1000(e) emulation - shared code
+ * QEMU igb emulation - shared code
  *
  * Copyright (c) 2008 Qumranet
  *
@@ -22,8 +22,8 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_NET_E1000_COMMON_H
-#define HW_NET_E1000_COMMON_H
+#ifndef HW_NET_IGB_COMMON_H
+#define HW_NET_IGB_COMMON_H
 
 #include "e1000_regs.h"
 
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c282f45ec5..a5a49f1781 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1,5 +1,5 @@
 /*
- * Core code for QEMU e1000e emulation
+ * Core code for QEMU igb emulation
  *
  * Software developer's manuals:
  * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
@@ -45,8 +45,8 @@
 #include "net_tx_pkt.h"
 #include "net_rx_pkt.h"
 
-#include "e1000_common.h"
-#include "e1000e_core.h"
+#include "igb_common.h"
+#include "igb_core.h"
 
 #include "trace.h"
 
@@ -62,12 +62,12 @@ union e1000_rx_desc_union {
 };
 
 static inline void
-e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
+igb_set_interrupt_cause(IGBCore *core, uint32_t val);
 
-static void e1000e_reset(E1000ECore *core, bool sw);
+static void igb_reset(IGBCore *core, bool sw);
 
 static inline void
-e1000e_process_ts_option(E1000ECore *core, struct e1000_tx_desc *dp)
+igb_process_ts_option(IGBCore *core, struct e1000_tx_desc *dp)
 {
     if (le32_to_cpu(dp->upper.data) & E1000_TXD_EXTCMD_TSTAMP) {
         trace_e1000e_wrn_no_ts_support();
@@ -75,7 +75,7 @@ e1000e_process_ts_option(E1000ECore *core, struct e1000_tx_desc *dp)
 }
 
 static inline void
-e1000e_process_snap_option(E1000ECore *core, uint32_t cmd_and_length)
+igb_process_snap_option(IGBCore *core, uint32_t cmd_and_length)
 {
     if (cmd_and_length & E1000_TXD_CMD_SNAP) {
         trace_e1000e_wrn_no_snap_support();
@@ -83,7 +83,7 @@ e1000e_process_snap_option(E1000ECore *core, uint32_t cmd_and_length)
 }
 
 static inline void
-e1000e_raise_legacy_irq(E1000ECore *core)
+igb_raise_legacy_irq(IGBCore *core)
 {
     trace_e1000e_irq_legacy_notify(true);
     e1000x_inc_reg_if_not_full(core->mac, IAC);
@@ -91,14 +91,14 @@ e1000e_raise_legacy_irq(E1000ECore *core)
 }
 
 static inline void
-e1000e_lower_legacy_irq(E1000ECore *core)
+igb_lower_legacy_irq(IGBCore *core)
 {
     trace_e1000e_irq_legacy_notify(false);
     pci_set_irq(core->owner, 0);
 }
 
 static inline void
-e1000e_intrmgr_rearm_timer(E1000IntrDelayTimer *timer)
+igb_intrmgr_rearm_timer(IGBIntrDelayTimer *timer)
 {
     int64_t delay_ns = (int64_t) timer->core->mac[timer->delay_reg] *
                                  timer->delay_resolution_ns;
@@ -111,15 +111,15 @@ e1000e_intrmgr_rearm_timer(E1000IntrDelayTimer *timer)
 }
 
 static void
-e1000e_intmgr_timer_resume(E1000IntrDelayTimer *timer)
+igb_intmgr_timer_resume(IGBIntrDelayTimer *timer)
 {
     if (timer->running) {
-        e1000e_intrmgr_rearm_timer(timer);
+        igb_intrmgr_rearm_timer(timer);
     }
 }
 
 static void
-e1000e_intmgr_timer_pause(E1000IntrDelayTimer *timer)
+igb_intmgr_timer_pause(IGBIntrDelayTimer *timer)
 {
     if (timer->running) {
         timer_del(timer->timer);
@@ -127,7 +127,7 @@ e1000e_intmgr_timer_pause(E1000IntrDelayTimer *timer)
 }
 
 static inline void
-e1000e_intrmgr_stop_timer(E1000IntrDelayTimer *timer)
+igb_intrmgr_stop_timer(IGBIntrDelayTimer *timer)
 {
     if (timer->running) {
         timer_del(timer->timer);
@@ -136,27 +136,27 @@ e1000e_intrmgr_stop_timer(E1000IntrDelayTimer *timer)
 }
 
 static inline void
-e1000e_intrmgr_fire_delayed_interrupts(E1000ECore *core)
+igb_intrmgr_fire_delayed_interrupts(IGBCore *core)
 {
     trace_e1000e_irq_fire_delayed_interrupts();
-    e1000e_set_interrupt_cause(core, 0);
+    igb_set_interrupt_cause(core, 0);
 }
 
 static void
-e1000e_intrmgr_on_timer(void *opaque)
+igb_intrmgr_on_timer(void *opaque)
 {
-    E1000IntrDelayTimer *timer = opaque;
+    IGBIntrDelayTimer *timer = opaque;
 
     trace_e1000e_irq_throttling_timer(timer->delay_reg << 2);
 
     timer->running = false;
-    e1000e_intrmgr_fire_delayed_interrupts(timer->core);
+    igb_intrmgr_fire_delayed_interrupts(timer->core);
 }
 
 static void
-e1000e_intrmgr_on_throttling_timer(void *opaque)
+igb_intrmgr_on_throttling_timer(void *opaque)
 {
-    E1000IntrDelayTimer *timer = opaque;
+    IGBIntrDelayTimer *timer = opaque;
 
     assert(!msix_enabled(timer->core->owner));
 
@@ -166,17 +166,17 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
         trace_e1000e_irq_msi_notify_postponed();
         /* Clear msi_causes_pending to fire MSI eventually */
         timer->core->msi_causes_pending = 0;
-        e1000e_set_interrupt_cause(timer->core, 0);
+        igb_set_interrupt_cause(timer->core, 0);
     } else {
         trace_e1000e_irq_legacy_notify_postponed();
-        e1000e_set_interrupt_cause(timer->core, 0);
+        igb_set_interrupt_cause(timer->core, 0);
     }
 }
 
 static void
-e1000e_intrmgr_on_msix_throttling_timer(void *opaque)
+igb_intrmgr_on_msix_throttling_timer(void *opaque)
 {
-    E1000IntrDelayTimer *timer = opaque;
+    IGBIntrDelayTimer *timer = opaque;
     int idx = timer - &timer->core->eitr[0];
 
     assert(msix_enabled(timer->core->owner));
@@ -188,7 +188,7 @@ e1000e_intrmgr_on_msix_throttling_timer(void *opaque)
 }
 
 static void
-e1000e_intrmgr_initialize_all_timers(E1000ECore *core, bool create)
+igb_intrmgr_initialize_all_timers(IGBCore *core, bool create)
 {
     int i;
 
@@ -214,7 +214,7 @@ e1000e_intrmgr_initialize_all_timers(E1000ECore *core, bool create)
     core->itr.delay_reg = ITR;
     core->itr.delay_resolution_ns = E1000_INTR_THROTTLING_NS_RES;
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         core->eitr[i].core = core;
         core->eitr[i].delay_reg = EITR + i;
         core->eitr[i].delay_resolution_ns = E1000_INTR_THROTTLING_NS_RES;
@@ -225,41 +225,40 @@ e1000e_intrmgr_initialize_all_timers(E1000ECore *core, bool create)
     }
 
     core->radv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, e1000e_intrmgr_on_timer, &core->radv);
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->radv);
     core->rdtr.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, e1000e_intrmgr_on_timer, &core->rdtr);
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->rdtr);
     core->raid.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, e1000e_intrmgr_on_timer, &core->raid);
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->raid);
 
     core->tadv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, e1000e_intrmgr_on_timer, &core->tadv);
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->tadv);
     core->tidv.timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, e1000e_intrmgr_on_timer, &core->tidv);
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, igb_intrmgr_on_timer, &core->tidv);
 
     core->itr.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                                   e1000e_intrmgr_on_throttling_timer,
+                                   igb_intrmgr_on_throttling_timer,
                                    &core->itr);
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
-        core->eitr[i].timer =
-            timer_new_ns(QEMU_CLOCK_VIRTUAL,
-                         e1000e_intrmgr_on_msix_throttling_timer,
-                         &core->eitr[i]);
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
+        core->eitr[i].timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                                           igb_intrmgr_on_msix_throttling_timer,
+                                           &core->eitr[i]);
     }
 }
 
 static inline void
-e1000e_intrmgr_stop_delay_timers(E1000ECore *core)
+igb_intrmgr_stop_delay_timers(IGBCore *core)
 {
-    e1000e_intrmgr_stop_timer(&core->radv);
-    e1000e_intrmgr_stop_timer(&core->rdtr);
-    e1000e_intrmgr_stop_timer(&core->raid);
-    e1000e_intrmgr_stop_timer(&core->tidv);
-    e1000e_intrmgr_stop_timer(&core->tadv);
+    igb_intrmgr_stop_timer(&core->radv);
+    igb_intrmgr_stop_timer(&core->rdtr);
+    igb_intrmgr_stop_timer(&core->raid);
+    igb_intrmgr_stop_timer(&core->tidv);
+    igb_intrmgr_stop_timer(&core->tadv);
 }
 
 static bool
-e1000e_intrmgr_delay_rx_causes(E1000ECore *core, uint32_t *causes)
+igb_intrmgr_delay_rx_causes(IGBCore *core, uint32_t *causes)
 {
     uint32_t delayable_causes;
     uint32_t rdtr = core->mac[RDTR];
@@ -299,21 +298,21 @@ e1000e_intrmgr_delay_rx_causes(E1000ECore *core, uint32_t *causes)
     }
 
     /* All causes delayed */
-    e1000e_intrmgr_rearm_timer(&core->rdtr);
+    igb_intrmgr_rearm_timer(&core->rdtr);
 
     if (!core->radv.running && (radv != 0)) {
-        e1000e_intrmgr_rearm_timer(&core->radv);
+        igb_intrmgr_rearm_timer(&core->radv);
     }
 
     if (!core->raid.running && (core->delayed_causes & E1000_ICR_ACK)) {
-        e1000e_intrmgr_rearm_timer(&core->raid);
+        igb_intrmgr_rearm_timer(&core->raid);
     }
 
     return true;
 }
 
 static bool
-e1000e_intrmgr_delay_tx_causes(E1000ECore *core, uint32_t *causes)
+igb_intrmgr_delay_tx_causes(IGBCore *core, uint32_t *causes)
 {
     static const uint32_t delayable_causes = E1000_ICR_TXQ0 |
                                              E1000_ICR_TXQ1 |
@@ -334,17 +333,17 @@ e1000e_intrmgr_delay_tx_causes(E1000ECore *core, uint32_t *causes)
     }
 
     /* All causes delayed */
-    e1000e_intrmgr_rearm_timer(&core->tidv);
+    igb_intrmgr_rearm_timer(&core->tidv);
 
     if (!core->tadv.running && (core->mac[TADV] != 0)) {
-        e1000e_intrmgr_rearm_timer(&core->tadv);
+        igb_intrmgr_rearm_timer(&core->tadv);
     }
 
     return true;
 }
 
 static uint32_t
-e1000e_intmgr_collect_delayed_causes(E1000ECore *core)
+igb_intmgr_collect_delayed_causes(IGBCore *core)
 {
     uint32_t res;
 
@@ -356,87 +355,87 @@ e1000e_intmgr_collect_delayed_causes(E1000ECore *core)
     res = core->delayed_causes;
     core->delayed_causes = 0;
 
-    e1000e_intrmgr_stop_delay_timers(core);
+    igb_intrmgr_stop_delay_timers(core);
 
     return res;
 }
 
 static void
-e1000e_intrmgr_fire_all_timers(E1000ECore *core)
+igb_intrmgr_fire_all_timers(IGBCore *core)
 {
     int i;
-    uint32_t val = e1000e_intmgr_collect_delayed_causes(core);
+    uint32_t val = igb_intmgr_collect_delayed_causes(core);
 
     trace_e1000e_irq_adding_delayed_causes(val, core->mac[ICR]);
     core->mac[ICR] |= val;
 
     if (core->itr.running) {
         timer_del(core->itr.timer);
-        e1000e_intrmgr_on_throttling_timer(&core->itr);
+        igb_intrmgr_on_throttling_timer(&core->itr);
     }
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         if (core->eitr[i].running) {
             timer_del(core->eitr[i].timer);
-            e1000e_intrmgr_on_msix_throttling_timer(&core->eitr[i]);
+            igb_intrmgr_on_msix_throttling_timer(&core->eitr[i]);
         }
     }
 }
 
 static void
-e1000e_intrmgr_resume(E1000ECore *core)
+igb_intrmgr_resume(IGBCore *core)
 {
     int i;
 
-    e1000e_intmgr_timer_resume(&core->radv);
-    e1000e_intmgr_timer_resume(&core->rdtr);
-    e1000e_intmgr_timer_resume(&core->raid);
-    e1000e_intmgr_timer_resume(&core->tidv);
-    e1000e_intmgr_timer_resume(&core->tadv);
+    igb_intmgr_timer_resume(&core->radv);
+    igb_intmgr_timer_resume(&core->rdtr);
+    igb_intmgr_timer_resume(&core->raid);
+    igb_intmgr_timer_resume(&core->tidv);
+    igb_intmgr_timer_resume(&core->tadv);
 
-    e1000e_intmgr_timer_resume(&core->itr);
+    igb_intmgr_timer_resume(&core->itr);
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
-        e1000e_intmgr_timer_resume(&core->eitr[i]);
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
+        igb_intmgr_timer_resume(&core->eitr[i]);
     }
 }
 
 static void
-e1000e_intrmgr_pause(E1000ECore *core)
+igb_intrmgr_pause(IGBCore *core)
 {
     int i;
 
-    e1000e_intmgr_timer_pause(&core->radv);
-    e1000e_intmgr_timer_pause(&core->rdtr);
-    e1000e_intmgr_timer_pause(&core->raid);
-    e1000e_intmgr_timer_pause(&core->tidv);
-    e1000e_intmgr_timer_pause(&core->tadv);
+    igb_intmgr_timer_pause(&core->radv);
+    igb_intmgr_timer_pause(&core->rdtr);
+    igb_intmgr_timer_pause(&core->raid);
+    igb_intmgr_timer_pause(&core->tidv);
+    igb_intmgr_timer_pause(&core->tadv);
 
-    e1000e_intmgr_timer_pause(&core->itr);
+    igb_intmgr_timer_pause(&core->itr);
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
-        e1000e_intmgr_timer_pause(&core->eitr[i]);
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
+        igb_intmgr_timer_pause(&core->eitr[i]);
     }
 }
 
 static void
-e1000e_intrmgr_reset(E1000ECore *core)
+igb_intrmgr_reset(IGBCore *core)
 {
     int i;
 
     core->delayed_causes = 0;
 
-    e1000e_intrmgr_stop_delay_timers(core);
+    igb_intrmgr_stop_delay_timers(core);
 
-    e1000e_intrmgr_stop_timer(&core->itr);
+    igb_intrmgr_stop_timer(&core->itr);
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
-        e1000e_intrmgr_stop_timer(&core->eitr[i]);
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
+        igb_intrmgr_stop_timer(&core->eitr[i]);
     }
 }
 
 static void
-e1000e_intrmgr_pci_unint(E1000ECore *core)
+igb_intrmgr_pci_unint(IGBCore *core)
 {
     int i;
 
@@ -449,42 +448,42 @@ e1000e_intrmgr_pci_unint(E1000ECore *core)
 
     timer_free(core->itr.timer);
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         timer_free(core->eitr[i].timer);
     }
 }
 
 static void
-e1000e_intrmgr_pci_realize(E1000ECore *core)
+igb_intrmgr_pci_realize(IGBCore *core)
 {
-    e1000e_intrmgr_initialize_all_timers(core, true);
+    igb_intrmgr_initialize_all_timers(core, true);
 }
 
 static inline bool
-e1000e_rx_csum_enabled(E1000ECore *core)
+igb_rx_csum_enabled(IGBCore *core)
 {
     return (core->mac[RXCSUM] & E1000_RXCSUM_PCSD) ? false : true;
 }
 
 static inline bool
-e1000e_rx_use_legacy_descriptor(E1000ECore *core)
+igb_rx_use_legacy_descriptor(IGBCore *core)
 {
     return (core->mac[RFCTL] & E1000_RFCTL_EXTEN) ? false : true;
 }
 
 static inline bool
-e1000e_rx_use_ps_descriptor(E1000ECore *core)
+igb_rx_use_ps_descriptor(IGBCore *core)
 {
-    return !e1000e_rx_use_legacy_descriptor(core) &&
+    return !igb_rx_use_legacy_descriptor(core) &&
            (core->mac[RCTL] & E1000_RCTL_DTYP_PS);
 }
 
 static inline bool
-e1000e_rss_enabled(E1000ECore *core)
+igb_rss_enabled(IGBCore *core)
 {
     return E1000_MRQC_ENABLED(core->mac[MRQC]) &&
-           !e1000e_rx_csum_enabled(core) &&
-           !e1000e_rx_use_legacy_descriptor(core);
+           !igb_rx_csum_enabled(core) &&
+           !igb_rx_use_legacy_descriptor(core);
 }
 
 typedef struct E1000E_RSSInfo_st {
@@ -495,11 +494,11 @@ typedef struct E1000E_RSSInfo_st {
 } E1000E_RSSInfo;
 
 static uint32_t
-e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
+igb_rss_get_hash_type(IGBCore *core, struct NetRxPkt *pkt)
 {
     bool isip4, isip6, isudp, istcp;
 
-    assert(e1000e_rss_enabled(core));
+    assert(igb_rss_enabled(core));
 
     net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
 
@@ -565,13 +564,11 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
 }
 
 static uint32_t
-e1000e_rss_calc_hash(E1000ECore *core,
-                     struct NetRxPkt *pkt,
-                     E1000E_RSSInfo *info)
+igb_rss_calc_hash(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
 {
     NetRxPktRssType type;
 
-    assert(e1000e_rss_enabled(core));
+    assert(igb_rss_enabled(core));
 
     switch (info->type) {
     case E1000_MRQ_RSS_TYPE_IPV4:
@@ -598,13 +595,11 @@ e1000e_rss_calc_hash(E1000ECore *core,
 }
 
 static void
-e1000e_rss_parse_packet(E1000ECore *core,
-                        struct NetRxPkt *pkt,
-                        E1000E_RSSInfo *info)
+igb_rss_parse_packet(IGBCore *core, struct NetRxPkt *pkt, E1000E_RSSInfo *info)
 {
     trace_e1000e_rx_rss_started();
 
-    if (!e1000e_rss_enabled(core)) {
+    if (!igb_rss_enabled(core)) {
         info->enabled = false;
         info->hash = 0;
         info->queue = 0;
@@ -615,7 +610,7 @@ e1000e_rss_parse_packet(E1000ECore *core,
 
     info->enabled = true;
 
-    info->type = e1000e_rss_get_hash_type(core, pkt);
+    info->type = igb_rss_get_hash_type(core, pkt);
 
     trace_e1000e_rx_rss_type(info->type);
 
@@ -625,12 +620,12 @@ e1000e_rss_parse_packet(E1000ECore *core,
         return;
     }
 
-    info->hash = e1000e_rss_calc_hash(core, pkt, info);
+    info->hash = igb_rss_calc_hash(core, pkt, info);
     info->queue = E1000_RSS_QUEUE(&core->mac[RETA], info->hash);
 }
 
 static void
-e1000e_setup_tx_offloads(E1000ECore *core, struct e1000e_tx *tx)
+igb_setup_tx_offloads(IGBCore *core, struct igb_tx *tx)
 {
     if (tx->props.tse && tx->cptse) {
         net_tx_pkt_build_vheader(tx->tx_pkt, true, true, tx->props.mss);
@@ -649,12 +644,12 @@ e1000e_setup_tx_offloads(E1000ECore *core, struct e1000e_tx *tx)
 }
 
 static bool
-e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
+igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 {
     int target_queue = MIN(core->max_queue_num, queue_index);
     NetClientState *queue = qemu_get_subqueue(core->owner_nic, target_queue);
 
-    e1000e_setup_tx_offloads(core, tx);
+    igb_setup_tx_offloads(core, tx);
 
     net_tx_pkt_dump(tx->tx_pkt);
 
@@ -667,7 +662,7 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 }
 
 static void
-e1000e_on_tx_done_update_stats(E1000ECore *core, struct NetTxPkt *tx_pkt)
+igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
 {
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
@@ -697,10 +692,10 @@ e1000e_on_tx_done_update_stats(E1000ECore *core, struct NetTxPkt *tx_pkt)
 }
 
 static void
-e1000e_process_tx_desc(E1000ECore *core,
-                       struct e1000e_tx *tx,
-                       struct e1000_tx_desc *dp,
-                       int queue_index)
+igb_process_tx_desc(IGBCore *core,
+                    struct igb_tx *tx,
+                    struct e1000_tx_desc *dp,
+                    int queue_index)
 {
     uint32_t txd_lower = le32_to_cpu(dp->lower.data);
     uint32_t dtype = txd_lower & (E1000_TXD_CMD_DEXT | E1000_TXD_DTYP_D);
@@ -711,16 +706,16 @@ e1000e_process_tx_desc(E1000ECore *core,
 
     if (dtype == E1000_TXD_CMD_DEXT) { /* context descriptor */
         e1000x_read_tx_ctx_descr(xp, &tx->props);
-        e1000e_process_snap_option(core, le32_to_cpu(xp->cmd_and_length));
+        igb_process_snap_option(core, le32_to_cpu(xp->cmd_and_length));
         return;
     } else if (dtype == (E1000_TXD_CMD_DEXT | E1000_TXD_DTYP_D)) {
         /* data descriptor */
         tx->sum_needed = le32_to_cpu(dp->upper.data) >> 8;
         tx->cptse = (txd_lower & E1000_TXD_CMD_TSE) ? 1 : 0;
-        e1000e_process_ts_option(core, dp);
+        igb_process_ts_option(core, dp);
     } else {
         /* legacy descriptor */
-        e1000e_process_ts_option(core, dp);
+        igb_process_ts_option(core, dp);
         tx->cptse = 0;
     }
 
@@ -739,8 +734,8 @@ e1000e_process_tx_desc(E1000ECore *core,
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt,
                     le16_to_cpu(dp->upper.fields.special), core->mac[VET]);
             }
-            if (e1000e_tx_pkt_send(core, tx, queue_index)) {
-                e1000e_on_tx_done_update_stats(core, tx->tx_pkt);
+            if (igb_tx_pkt_send(core, tx, queue_index)) {
+                igb_on_tx_done_update_stats(core, tx->tx_pkt);
             }
         }
 
@@ -753,7 +748,7 @@ e1000e_process_tx_desc(E1000ECore *core,
 }
 
 static inline uint32_t
-e1000e_tx_wb_interrupt_cause(E1000ECore *core, int queue_idx)
+igb_tx_wb_interrupt_cause(IGBCore *core, int queue_idx)
 {
     if (!msix_enabled(core->owner)) {
         return E1000_ICR_TXDW;
@@ -763,7 +758,7 @@ e1000e_tx_wb_interrupt_cause(E1000ECore *core, int queue_idx)
 }
 
 static inline uint32_t
-e1000e_rx_wb_interrupt_cause(E1000ECore *core, int queue_idx,
+igb_rx_wb_interrupt_cause(IGBCore *core, int queue_idx,
                              bool min_threshold_hit)
 {
     if (!msix_enabled(core->owner)) {
@@ -774,8 +769,8 @@ e1000e_rx_wb_interrupt_cause(E1000ECore *core, int queue_idx,
 }
 
 static uint32_t
-e1000e_txdesc_writeback(E1000ECore *core, dma_addr_t base,
-                        struct e1000_tx_desc *dp, bool *ide, int queue_idx)
+igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
+                     struct e1000_tx_desc *dp, bool *ide, int queue_idx)
 {
     uint32_t txd_upper, txd_lower = le32_to_cpu(dp->lower.data);
 
@@ -791,7 +786,7 @@ e1000e_txdesc_writeback(E1000ECore *core, dma_addr_t base,
     dp->upper.data = cpu_to_le32(txd_upper);
     pci_dma_write(core->owner, base + ((char *)&dp->upper - (char *)dp),
                   &dp->upper, sizeof(dp->upper));
-    return e1000e_tx_wb_interrupt_cause(core, queue_idx);
+    return igb_tx_wb_interrupt_cause(core, queue_idx);
 }
 
 typedef struct E1000E_RingInfo_st {
@@ -804,14 +799,14 @@ typedef struct E1000E_RingInfo_st {
 } E1000E_RingInfo;
 
 static inline bool
-e1000e_ring_empty(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)
 {
     return core->mac[r->dh] == core->mac[r->dt] ||
                 core->mac[r->dt] >= core->mac[r->dlen] / E1000_RING_DESC_LEN;
 }
 
 static inline uint64_t
-e1000e_ring_base(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_base(IGBCore *core, const E1000E_RingInfo *r)
 {
     uint64_t bah = core->mac[r->dbah];
     uint64_t bal = core->mac[r->dbal];
@@ -820,13 +815,13 @@ e1000e_ring_base(E1000ECore *core, const E1000E_RingInfo *r)
 }
 
 static inline uint64_t
-e1000e_ring_head_descr(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_head_descr(IGBCore *core, const E1000E_RingInfo *r)
 {
-    return e1000e_ring_base(core, r) + E1000_RING_DESC_LEN * core->mac[r->dh];
+    return igb_ring_base(core, r) + E1000_RING_DESC_LEN * core->mac[r->dh];
 }
 
 static inline void
-e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
+igb_ring_advance(IGBCore *core, const E1000E_RingInfo *r, uint32_t count)
 {
     core->mac[r->dh] += count;
 
@@ -836,7 +831,7 @@ e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
 }
 
 static inline uint32_t
-e1000e_ring_free_descr_num(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_free_descr_num(IGBCore *core, const E1000E_RingInfo *r)
 {
     trace_e1000e_ring_free_space(r->idx, core->mac[r->dlen],
                                  core->mac[r->dh],  core->mac[r->dt]);
@@ -855,32 +850,32 @@ e1000e_ring_free_descr_num(E1000ECore *core, const E1000E_RingInfo *r)
 }
 
 static inline bool
-e1000e_ring_enabled(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_enabled(IGBCore *core, const E1000E_RingInfo *r)
 {
     return core->mac[r->dlen] > 0;
 }
 
 static inline uint32_t
-e1000e_ring_len(E1000ECore *core, const E1000E_RingInfo *r)
+igb_ring_len(IGBCore *core, const E1000E_RingInfo *r)
 {
     return core->mac[r->dlen];
 }
 
-typedef struct E1000E_TxRing_st {
+typedef struct IGB_TxRing_st {
     const E1000E_RingInfo *i;
-    struct e1000e_tx *tx;
-} E1000E_TxRing;
+    struct igb_tx *tx;
+} IGB_TxRing;
 
 static inline int
-e1000e_mq_queue_idx(int base_reg_idx, int reg_idx)
+igb_mq_queue_idx(int base_reg_idx, int reg_idx)
 {
     return (reg_idx - base_reg_idx) / (0x100 >> 2);
 }
 
 static inline void
-e1000e_tx_ring_init(E1000ECore *core, E1000E_TxRing *txr, int idx)
+igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
 {
-    static const E1000E_RingInfo i[E1000E_NUM_QUEUES] = {
+    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
         { TDBAH,  TDBAL,  TDLEN,  TDH,  TDT, 0 },
         { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 }
     };
@@ -896,9 +891,9 @@ typedef struct E1000E_RxRing_st {
 } E1000E_RxRing;
 
 static inline void
-e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRing *rxr, int idx)
+igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
 {
-    static const E1000E_RingInfo i[E1000E_NUM_QUEUES] = {
+    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
         { RDBAH0, RDBAL0, RDLEN0, RDH0, RDT0, 0 },
         { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 }
     };
@@ -909,7 +904,7 @@ e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRing *rxr, int idx)
 }
 
 static void
-e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
+igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 {
     dma_addr_t base;
     struct e1000_tx_desc desc;
@@ -922,30 +917,29 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
         return;
     }
 
-    while (!e1000e_ring_empty(core, txi)) {
-        base = e1000e_ring_head_descr(core, txi);
+    while (!igb_ring_empty(core, txi)) {
+        base = igb_ring_head_descr(core, txi);
 
         pci_dma_read(core->owner, base, &desc, sizeof(desc));
 
         trace_e1000e_tx_descr((void *)(intptr_t)desc.buffer_addr,
                               desc.lower.data, desc.upper.data);
 
-        e1000e_process_tx_desc(core, txr->tx, &desc, txi->idx);
-        cause |= e1000e_txdesc_writeback(core, base, &desc, &ide, txi->idx);
+        igb_process_tx_desc(core, txr->tx, &desc, txi->idx);
+        cause |= igb_txdesc_writeback(core, base, &desc, &ide, txi->idx);
 
-        e1000e_ring_advance(core, txi, 1);
+        igb_ring_advance(core, txi, 1);
     }
 
-    if (!ide || !e1000e_intrmgr_delay_tx_causes(core, &cause)) {
-        e1000e_set_interrupt_cause(core, cause);
+    if (!ide || !igb_intrmgr_delay_tx_causes(core, &cause)) {
+        igb_set_interrupt_cause(core, cause);
     }
 }
 
 static bool
-e1000e_has_rxbufs(E1000ECore *core, const E1000E_RingInfo *r,
-                  size_t total_size)
+igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
 {
-    uint32_t bufs = e1000e_ring_free_descr_num(core, r);
+    uint32_t bufs = igb_ring_free_descr_num(core, r);
 
     trace_e1000e_rx_has_buffers(r->idx, bufs, total_size,
                                 core->rx_desc_buf_size);
@@ -955,7 +949,7 @@ e1000e_has_rxbufs(E1000ECore *core, const E1000E_RingInfo *r,
 }
 
 void
-e1000e_start_recv(E1000ECore *core)
+igb_start_recv(IGBCore *core)
 {
     int i;
 
@@ -967,7 +961,7 @@ e1000e_start_recv(E1000ECore *core)
 }
 
 bool
-e1000e_can_receive(E1000ECore *core)
+igb_can_receive(IGBCore *core)
 {
     int i;
 
@@ -975,12 +969,11 @@ e1000e_can_receive(E1000ECore *core)
         return false;
     }
 
-    for (i = 0; i < E1000E_NUM_QUEUES; i++) {
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
         E1000E_RxRing rxr;
 
-        e1000e_rx_ring_init(core, &rxr, i);
-        if (e1000e_ring_enabled(core, rxr.i) &&
-            e1000e_has_rxbufs(core, rxr.i, 1)) {
+        igb_rx_ring_init(core, &rxr, i);
+        if (igb_ring_enabled(core, rxr.i) && igb_has_rxbufs(core, rxr.i, 1)) {
             trace_e1000e_rx_can_recv();
             return true;
         }
@@ -991,30 +984,30 @@ e1000e_can_receive(E1000ECore *core)
 }
 
 ssize_t
-e1000e_receive(E1000ECore *core, const uint8_t *buf, size_t size)
+igb_receive(IGBCore *core, const uint8_t *buf, size_t size)
 {
     const struct iovec iov = {
         .iov_base = (uint8_t *)buf,
         .iov_len = size
     };
 
-    return e1000e_receive_iov(core, &iov, 1);
+    return igb_receive_iov(core, &iov, 1);
 }
 
 static inline bool
-e1000e_rx_l3_cso_enabled(E1000ECore *core)
+igb_rx_l3_cso_enabled(IGBCore *core)
 {
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_IPOFLD);
 }
 
 static inline bool
-e1000e_rx_l4_cso_enabled(E1000ECore *core)
+igb_rx_l4_cso_enabled(IGBCore *core)
 {
     return !!(core->mac[RXCSUM] & E1000_RXCSUM_TUOFLD);
 }
 
 static bool
-e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
+igb_receive_filter(IGBCore *core, const uint8_t *buf, int size)
 {
     uint32_t rctl = core->mac[RCTL];
 
@@ -1059,23 +1052,23 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 }
 
 static inline void
-e1000e_read_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
-                          hwaddr *buff_addr)
+igb_read_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
+                       hwaddr *buff_addr)
 {
     *buff_addr = le64_to_cpu(desc->buffer_addr);
 }
 
 static inline void
-e1000e_read_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
-                         hwaddr *buff_addr)
+igb_read_ext_rx_descr(IGBCore *core, union e1000_rx_desc_extended *desc,
+                      hwaddr *buff_addr)
 {
     *buff_addr = le64_to_cpu(desc->read.buffer_addr);
 }
 
 static inline void
-e1000e_read_ps_rx_descr(E1000ECore *core,
-                        union e1000_rx_desc_packet_split *desc,
-                        hwaddr (*buff_addr)[MAX_PS_BUFFERS])
+igb_read_ps_rx_descr(IGBCore *core,
+                     union e1000_rx_desc_packet_split *desc,
+                     hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
     int i;
 
@@ -1088,32 +1081,32 @@ e1000e_read_ps_rx_descr(E1000ECore *core,
 }
 
 static inline void
-e1000e_read_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
-                     hwaddr (*buff_addr)[MAX_PS_BUFFERS])
+igb_read_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
+                  hwaddr (*buff_addr)[MAX_PS_BUFFERS])
 {
-    if (e1000e_rx_use_legacy_descriptor(core)) {
-        e1000e_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
+    if (igb_rx_use_legacy_descriptor(core)) {
+        igb_read_lgcy_rx_descr(core, &desc->legacy, &(*buff_addr)[0]);
         (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
+            igb_read_ps_rx_descr(core, &desc->packet_split, buff_addr);
         } else {
-            e1000e_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
+            igb_read_ext_rx_descr(core, &desc->extended, &(*buff_addr)[0]);
             (*buff_addr)[1] = (*buff_addr)[2] = (*buff_addr)[3] = 0;
         }
     }
 }
 
 static void
-e1000e_verify_csum_in_sw(E1000ECore *core,
-                         struct NetRxPkt *pkt,
-                         uint32_t *status_flags,
-                         bool istcp, bool isudp)
+igb_verify_csum_in_sw(IGBCore *core,
+                      struct NetRxPkt *pkt,
+                      uint32_t *status_flags,
+                      bool istcp, bool isudp)
 {
     bool csum_valid;
     uint32_t csum_error;
 
-    if (e1000e_rx_l3_cso_enabled(core)) {
+    if (igb_rx_l3_cso_enabled(core)) {
         if (!net_rx_pkt_validate_l3_csum(pkt, &csum_valid)) {
             trace_e1000e_rx_metadata_l3_csum_validation_failed();
         } else {
@@ -1124,7 +1117,7 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
         trace_e1000e_rx_metadata_l3_cso_disabled();
     }
 
-    if (!e1000e_rx_l4_cso_enabled(core)) {
+    if (!igb_rx_l4_cso_enabled(core)) {
         trace_e1000e_rx_metadata_l4_cso_disabled();
         return;
     }
@@ -1147,7 +1140,7 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
 }
 
 static inline bool
-e1000e_is_tcp_ack(E1000ECore *core, struct NetRxPkt *rx_pkt)
+igb_is_tcp_ack(IGBCore *core, struct NetRxPkt *rx_pkt)
 {
     if (!net_rx_pkt_is_tcp_ack(rx_pkt)) {
         return false;
@@ -1161,14 +1154,14 @@ e1000e_is_tcp_ack(E1000ECore *core, struct NetRxPkt *rx_pkt)
 }
 
 static void
-e1000e_build_rx_metadata(E1000ECore *core,
-                         struct NetRxPkt *pkt,
-                         bool is_eop,
-                         const E1000E_RSSInfo *rss_info,
-                         uint32_t *rss, uint32_t *mrq,
-                         uint32_t *status_flags,
-                         uint16_t *ip_id,
-                         uint16_t *vlan_tag)
+igb_build_rx_metadata(IGBCore *core,
+                      struct NetRxPkt *pkt,
+                      bool is_eop,
+                      const E1000E_RSSInfo *rss_info,
+                      uint32_t *rss, uint32_t *mrq,
+                      uint32_t *status_flags,
+                      uint16_t *ip_id,
+                      uint16_t *vlan_tag)
 {
     struct virtio_net_hdr *vhdr;
     bool isip4, isip6, istcp, isudp;
@@ -1206,7 +1199,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (istcp && e1000e_is_tcp_ack(core, pkt)) {
+    if (istcp && igb_is_tcp_ack(core, pkt)) {
         *status_flags |= E1000_RXD_STAT_ACK;
         trace_e1000e_rx_metadata_ack();
     }
@@ -1233,7 +1226,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
 
     if (!net_rx_pkt_has_virt_hdr(pkt)) {
         trace_e1000e_rx_metadata_no_virthdr();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
+        igb_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
         goto func_exit;
     }
 
@@ -1242,17 +1235,17 @@ e1000e_build_rx_metadata(E1000ECore *core,
     if (!(vhdr->flags & VIRTIO_NET_HDR_F_DATA_VALID) &&
         !(vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM)) {
         trace_e1000e_rx_metadata_virthdr_no_csum_info();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
+        igb_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
         goto func_exit;
     }
 
-    if (e1000e_rx_l3_cso_enabled(core)) {
+    if (igb_rx_l3_cso_enabled(core)) {
         *status_flags |= isip4 ? E1000_RXD_STAT_IPCS : 0;
     } else {
         trace_e1000e_rx_metadata_l3_cso_disabled();
     }
 
-    if (e1000e_rx_l4_cso_enabled(core)) {
+    if (igb_rx_l4_cso_enabled(core)) {
         if (istcp) {
             *status_flags |= E1000_RXD_STAT_TCPCS;
         } else if (isudp) {
@@ -1269,10 +1262,10 @@ func_exit:
 }
 
 static inline void
-e1000e_write_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
-                           struct NetRxPkt *pkt,
-                           const E1000E_RSSInfo *rss_info,
-                           uint16_t length)
+igb_write_lgcy_rx_descr(IGBCore *core, struct e1000_rx_desc *desc,
+                        struct NetRxPkt *pkt,
+                        const E1000E_RSSInfo *rss_info,
+                        uint16_t length)
 {
     uint32_t status_flags, rss, mrq;
     uint16_t ip_id;
@@ -1282,7 +1275,7 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
     desc->length = cpu_to_le16(length);
     desc->csum = 0;
 
-    e1000e_build_rx_metadata(core, pkt, pkt != NULL,
+    igb_build_rx_metadata(core, pkt, pkt != NULL,
                              rss_info,
                              &rss, &mrq,
                              &status_flags, &ip_id,
@@ -1292,31 +1285,31 @@ e1000e_write_lgcy_rx_descr(E1000ECore *core, struct e1000_rx_desc *desc,
 }
 
 static inline void
-e1000e_write_ext_rx_descr(E1000ECore *core, union e1000_rx_desc_extended *desc,
-                          struct NetRxPkt *pkt,
-                          const E1000E_RSSInfo *rss_info,
-                          uint16_t length)
+igb_write_ext_rx_descr(IGBCore *core, union e1000_rx_desc_extended *desc,
+                       struct NetRxPkt *pkt,
+                       const E1000E_RSSInfo *rss_info,
+                       uint16_t length)
 {
     memset(&desc->wb, 0, sizeof(desc->wb));
 
     desc->wb.upper.length = cpu_to_le16(length);
 
-    e1000e_build_rx_metadata(core, pkt, pkt != NULL,
-                             rss_info,
-                             &desc->wb.lower.hi_dword.rss,
-                             &desc->wb.lower.mrq,
-                             &desc->wb.upper.status_error,
-                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                             &desc->wb.upper.vlan);
+    igb_build_rx_metadata(core, pkt, pkt != NULL,
+                          rss_info,
+                          &desc->wb.lower.hi_dword.rss,
+                          &desc->wb.lower.mrq,
+                          &desc->wb.upper.status_error,
+                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                          &desc->wb.upper.vlan);
 }
 
 static inline void
-e1000e_write_ps_rx_descr(E1000ECore *core,
-                         union e1000_rx_desc_packet_split *desc,
-                         struct NetRxPkt *pkt,
-                         const E1000E_RSSInfo *rss_info,
-                         size_t ps_hdr_len,
-                         uint16_t(*written)[MAX_PS_BUFFERS])
+igb_write_ps_rx_descr(IGBCore *core,
+                      union e1000_rx_desc_packet_split *desc,
+                      struct NetRxPkt *pkt,
+                      const E1000E_RSSInfo *rss_info,
+                      size_t ps_hdr_len,
+                      uint16_t(*written)[MAX_PS_BUFFERS])
 {
     int i;
 
@@ -1328,13 +1321,13 @@ e1000e_write_ps_rx_descr(E1000ECore *core,
         desc->wb.upper.length[i] = cpu_to_le16((*written)[i + 1]);
     }
 
-    e1000e_build_rx_metadata(core, pkt, pkt != NULL,
-                             rss_info,
-                             &desc->wb.lower.hi_dword.rss,
-                             &desc->wb.lower.mrq,
-                             &desc->wb.middle.status_error,
-                             &desc->wb.lower.hi_dword.csum_ip.ip_id,
-                             &desc->wb.middle.vlan);
+    igb_build_rx_metadata(core, pkt, pkt != NULL,
+                          rss_info,
+                          &desc->wb.lower.hi_dword.rss,
+                          &desc->wb.lower.mrq,
+                          &desc->wb.middle.status_error,
+                          &desc->wb.lower.hi_dword.csum_ip.ip_id,
+                          &desc->wb.middle.vlan);
 
     desc->wb.upper.header_status =
         cpu_to_le16(ps_hdr_len | (ps_hdr_len ? E1000_RXDPS_HDRSTAT_HDRSP : 0));
@@ -1344,33 +1337,33 @@ e1000e_write_ps_rx_descr(E1000ECore *core,
 }
 
 static inline void
-e1000e_write_rx_descr(E1000ECore *core, union e1000_rx_desc_union *desc,
+igb_write_rx_descr(IGBCore *core, union e1000_rx_desc_union *desc,
 struct NetRxPkt *pkt, const E1000E_RSSInfo *rss_info,
     size_t ps_hdr_len, uint16_t(*written)[MAX_PS_BUFFERS])
 {
-    if (e1000e_rx_use_legacy_descriptor(core)) {
+    if (igb_rx_use_legacy_descriptor(core)) {
         assert(ps_hdr_len == 0);
-        e1000e_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
-                                   (*written)[0]);
+        igb_write_lgcy_rx_descr(core, &desc->legacy, pkt, rss_info,
+                                (*written)[0]);
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
-            e1000e_write_ps_rx_descr(core, &desc->packet_split, pkt, rss_info,
-                                      ps_hdr_len, written);
+            igb_write_ps_rx_descr(core, &desc->packet_split, pkt, rss_info,
+                                  ps_hdr_len, written);
         } else {
             assert(ps_hdr_len == 0);
-            e1000e_write_ext_rx_descr(core, &desc->extended, pkt, rss_info,
-                                       (*written)[0]);
+            igb_write_ext_rx_descr(core, &desc->extended, pkt, rss_info,
+                                   (*written)[0]);
         }
     }
 }
 
 static inline void
-e1000e_pci_dma_write_rx_desc(E1000ECore *core, dma_addr_t addr,
-                             union e1000_rx_desc_union *desc, dma_addr_t len)
+igb_pci_dma_write_rx_desc(IGBCore *core, dma_addr_t addr,
+                          union e1000_rx_desc_union *desc, dma_addr_t len)
 {
     PCIDevice *dev = core->owner;
 
-    if (e1000e_rx_use_legacy_descriptor(core)) {
+    if (igb_rx_use_legacy_descriptor(core)) {
         struct e1000_rx_desc *d = &desc->legacy;
         size_t offset = offsetof(struct e1000_rx_desc, status);
         uint8_t status = d->status;
@@ -1419,11 +1412,11 @@ typedef struct e1000e_ba_state_st {
 } e1000e_ba_state;
 
 static inline void
-e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
-                               hwaddr (*ba)[MAX_PS_BUFFERS],
-                               e1000e_ba_state *bastate,
-                               const char *data,
-                               dma_addr_t data_len)
+igb_write_hdr_to_rx_buffers(IGBCore *core,
+                            hwaddr (*ba)[MAX_PS_BUFFERS],
+                            e1000e_ba_state *bastate,
+                            const char *data,
+                            dma_addr_t data_len)
 {
     assert(data_len <= core->rxbuf_sizes[0] - bastate->written[0]);
 
@@ -1434,11 +1427,11 @@ e1000e_write_hdr_to_rx_buffers(E1000ECore *core,
 }
 
 static void
-e1000e_write_to_rx_buffers(E1000ECore *core,
-                           hwaddr (*ba)[MAX_PS_BUFFERS],
-                           e1000e_ba_state *bastate,
-                           const char *data,
-                           dma_addr_t data_len)
+igb_write_to_rx_buffers(IGBCore *core,
+                        hwaddr (*ba)[MAX_PS_BUFFERS],
+                        e1000e_ba_state *bastate,
+                        const char *data,
+                        dma_addr_t data_len)
 {
     while (data_len > 0) {
         uint32_t cur_buf_len = core->rxbuf_sizes[bastate->cur_idx];
@@ -1469,9 +1462,7 @@ e1000e_write_to_rx_buffers(E1000ECore *core,
 }
 
 static void
-e1000e_update_rx_stats(E1000ECore *core,
-                       size_t data_size,
-                       size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1490,19 +1481,19 @@ e1000e_update_rx_stats(E1000ECore *core,
 }
 
 static inline bool
-e1000e_rx_descr_threshold_hit(E1000ECore *core, const E1000E_RingInfo *rxi)
+igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
 {
-    return e1000e_ring_free_descr_num(core, rxi) ==
-           e1000e_ring_len(core, rxi) >> core->rxbuf_min_shift;
+    return igb_ring_free_descr_num(core, rxi) ==
+           igb_ring_len(core, rxi) >> core->rxbuf_min_shift;
 }
 
 static bool
-e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
+igb_do_ps(IGBCore *core, struct NetRxPkt *pkt, size_t *hdr_len)
 {
     bool isip4, isip6, isudp, istcp;
     bool fragment;
 
-    if (!e1000e_rx_use_ps_descriptor(core)) {
+    if (!igb_rx_use_ps_descriptor(core)) {
         return false;
     }
 
@@ -1535,9 +1526,9 @@ e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
 }
 
 static void
-e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
-                             const E1000E_RxRing *rxr,
-                             const E1000E_RSSInfo *rss_info)
+igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
+                          const E1000E_RxRing *rxr,
+                          const E1000E_RSSInfo *rss_info)
 {
     PCIDevice *d = core->owner;
     dma_addr_t base;
@@ -1551,7 +1542,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
     size_t total_size = size + e1000x_fcs_len(core->mac);
     const E1000E_RingInfo *rxi;
     size_t ps_hdr_len = 0;
-    bool do_ps = e1000e_do_ps(core, pkt, &ps_hdr_len);
+    bool do_ps = igb_do_ps(core, pkt, &ps_hdr_len);
     bool is_first = true;
 
     rxi = rxr->i;
@@ -1567,17 +1558,17 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
             desc_size = core->rx_desc_buf_size;
         }
 
-        if (e1000e_ring_empty(core, rxi)) {
+        if (igb_ring_empty(core, rxi)) {
             return;
         }
 
-        base = e1000e_ring_head_descr(core, rxi);
+        base = igb_ring_head_descr(core, rxi);
 
         pci_dma_read(d, base, &desc, core->rx_desc_len);
 
         trace_e1000e_rx_descr(rxi->idx, base, core->rx_desc_len);
 
-        e1000e_read_rx_descr(core, &desc, &ba);
+        igb_read_rx_descr(core, &desc, &ba);
 
         if (ba[0]) {
             if (desc_offset < size) {
@@ -1596,7 +1587,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                             iov_copy = MIN(ps_hdr_len - ps_hdr_copied,
                                            iov->iov_len - iov_ofs);
 
-                            e1000e_write_hdr_to_rx_buffers(core, &ba, &bastate,
+                            igb_write_hdr_to_rx_buffers(core, &ba, &bastate,
                                                       iov->iov_base, iov_copy);
 
                             copy_size -= iov_copy;
@@ -1613,7 +1604,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                     } else {
                         /* Leave buffer 0 of each descriptor except first */
                         /* empty as per spec 7.1.5.1                      */
-                        e1000e_write_hdr_to_rx_buffers(core, &ba, &bastate,
+                        igb_write_hdr_to_rx_buffers(core, &ba, &bastate,
                                                        NULL, 0);
                     }
                 }
@@ -1622,7 +1613,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
                 while (copy_size) {
                     iov_copy = MIN(copy_size, iov->iov_len - iov_ofs);
 
-                    e1000e_write_to_rx_buffers(core, &ba, &bastate,
+                    igb_write_to_rx_buffers(core, &ba, &bastate,
                                             iov->iov_base + iov_ofs, iov_copy);
 
                     copy_size -= iov_copy;
@@ -1635,7 +1626,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 
                 if (desc_offset + desc_size >= total_size) {
                     /* Simulate FCS checksum presence in the last descriptor */
-                    e1000e_write_to_rx_buffers(core, &ba, &bastate,
+                    igb_write_to_rx_buffers(core, &ba, &bastate,
                           (const char *) &fcs_pad, e1000x_fcs_len(core->mac));
                 }
             }
@@ -1647,20 +1638,20 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
             is_last = true;
         }
 
-        e1000e_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
+        igb_write_rx_descr(core, &desc, is_last ? core->rx_pkt : NULL,
                            rss_info, do_ps ? ps_hdr_len : 0, &bastate.written);
-        e1000e_pci_dma_write_rx_desc(core, base, &desc, core->rx_desc_len);
+        igb_pci_dma_write_rx_desc(core, base, &desc, core->rx_desc_len);
 
-        e1000e_ring_advance(core, rxi,
-                            core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
+        igb_ring_advance(core, rxi,
+                         core->rx_desc_len / E1000_MIN_RX_DESC_LEN);
 
     } while (desc_offset < total_size);
 
-    e1000e_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, size, total_size);
 }
 
 static inline void
-e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
+igb_rx_fix_l4_csum(IGBCore *core, struct NetRxPkt *pkt)
 {
     if (net_rx_pkt_has_virt_hdr(pkt)) {
         struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
@@ -1672,7 +1663,7 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
 }
 
 ssize_t
-e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
+igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt)
 {
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
@@ -1728,7 +1719,7 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     net_rx_pkt_set_packet_type(core->rx_pkt,
         get_eth_packet_type(PKT_GET_ETH_HDR(filter_buf)));
 
-    if (!e1000e_receive_filter(core, filter_buf, size)) {
+    if (!igb_receive_filter(core, filter_buf, size)) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
     }
@@ -1736,18 +1727,18 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
                                e1000x_vlan_enabled(core->mac), core->mac[VET]);
 
-    e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
-    e1000e_rx_ring_init(core, &rxr, rss_info.queue);
+    igb_rss_parse_packet(core, core->rx_pkt, &rss_info);
+    igb_rx_ring_init(core, &rxr, rss_info.queue);
 
     trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
 
     total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
         e1000x_fcs_len(core->mac);
 
-    if (e1000e_has_rxbufs(core, rxr.i, total_size)) {
-        e1000e_rx_fix_l4_csum(core, core->rx_pkt);
+    if (igb_has_rxbufs(core, rxr.i, total_size)) {
+        igb_rx_fix_l4_csum(core, core->rx_pkt);
 
-        e1000e_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
+        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
         retval = orig_size;
 
@@ -1758,13 +1749,13 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 
         /* Perform ACK receive detection */
         if  (!(core->mac[RFCTL] & E1000_RFCTL_ACK_DIS) &&
-             (e1000e_is_tcp_ack(core, core->rx_pkt))) {
+             (igb_is_tcp_ack(core, core->rx_pkt))) {
             n |= E1000_ICS_ACK;
         }
 
         /* Check if receive descriptor minimum threshold hit */
-        rdmts_hit = e1000e_rx_descr_threshold_hit(core, rxr.i);
-        n |= e1000e_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
+        rdmts_hit = igb_rx_descr_threshold_hit(core, rxr.i);
+        n |= igb_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
 
         trace_e1000e_rx_written_to_guest(n);
     } else {
@@ -1774,9 +1765,9 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
         trace_e1000e_rx_not_written_to_guest(n);
     }
 
-    if (!e1000e_intrmgr_delay_rx_causes(core, &n)) {
+    if (!igb_intrmgr_delay_rx_causes(core, &n)) {
         trace_e1000e_rx_interrupt_set(n);
-        e1000e_set_interrupt_cause(core, n);
+        igb_set_interrupt_cause(core, n);
     } else {
         trace_e1000e_rx_interrupt_delayed(n);
     }
@@ -1785,14 +1776,14 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 }
 
 static inline bool
-e1000e_have_autoneg(E1000ECore *core)
+igb_have_autoneg(IGBCore *core)
 {
     return core->phy[0][MII_BMCR] & MII_BMCR_AUTOEN;
 }
 
-static void e1000e_update_flowctl_status(E1000ECore *core)
+static void igb_update_flowctl_status(IGBCore *core)
 {
-    if (e1000e_have_autoneg(core) &&
+    if (igb_have_autoneg(core) &&
         core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP) {
         trace_e1000e_link_autoneg_flowctl(true);
         core->mac[CTRL] |= E1000_CTRL_TFCE | E1000_CTRL_RFCE;
@@ -1802,14 +1793,14 @@ static void e1000e_update_flowctl_status(E1000ECore *core)
 }
 
 static inline void
-e1000e_link_down(E1000ECore *core)
+igb_link_down(IGBCore *core)
 {
     e1000x_update_regs_on_link_down(core->mac, core->phy[0]);
-    e1000e_update_flowctl_status(core);
+    igb_update_flowctl_status(core);
 }
 
 static inline void
-e1000e_set_phy_ctrl(E1000ECore *core, int index, uint16_t val)
+igb_set_phy_ctrl(IGBCore *core, int index, uint16_t val)
 {
     /* bits 0-5 reserved; MII_BMCR_[ANRESTART,RESET] are self clearing */
     core->phy[0][MII_BMCR] = val & ~(0x3f |
@@ -1817,13 +1808,13 @@ e1000e_set_phy_ctrl(E1000ECore *core, int index, uint16_t val)
                                      MII_BMCR_ANRESTART);
 
     if ((val & MII_BMCR_ANRESTART) &&
-        e1000e_have_autoneg(core)) {
+        igb_have_autoneg(core)) {
         e1000x_restart_autoneg(core->mac, core->phy[0], core->autoneg_timer);
     }
 }
 
 static void
-e1000e_set_phy_oem_bits(E1000ECore *core, int index, uint16_t val)
+igb_set_phy_oem_bits(IGBCore *core, int index, uint16_t val)
 {
     core->phy[0][PHY_OEM_BITS] = val & ~BIT(10);
 
@@ -1833,13 +1824,13 @@ e1000e_set_phy_oem_bits(E1000ECore *core, int index, uint16_t val)
 }
 
 static void
-e1000e_set_phy_page(E1000ECore *core, int index, uint16_t val)
+igb_set_phy_page(IGBCore *core, int index, uint16_t val)
 {
     core->phy[0][PHY_PAGE] = val & PHY_PAGE_RW_MASK;
 }
 
 void
-e1000e_core_set_link_status(E1000ECore *core)
+igb_core_set_link_status(IGBCore *core)
 {
     NetClientState *nc = qemu_get_queue(core->owner_nic);
     uint32_t old_status = core->mac[STATUS];
@@ -1849,23 +1840,23 @@ e1000e_core_set_link_status(E1000ECore *core)
     if (nc->link_down) {
         e1000x_update_regs_on_link_down(core->mac, core->phy[0]);
     } else {
-        if (e1000e_have_autoneg(core) &&
+        if (igb_have_autoneg(core) &&
             !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
             e1000x_restart_autoneg(core->mac, core->phy[0],
                                    core->autoneg_timer);
         } else {
             e1000x_update_regs_on_link_up(core->mac, core->phy[0]);
-            e1000e_start_recv(core);
+            igb_start_recv(core);
         }
     }
 
     if (core->mac[STATUS] != old_status) {
-        e1000e_set_interrupt_cause(core, E1000_ICR_LSC);
+        igb_set_interrupt_cause(core, E1000_ICR_LSC);
     }
 }
 
 static void
-e1000e_set_ctrl(E1000ECore *core, int index, uint32_t val)
+igb_set_ctrl(IGBCore *core, int index, uint32_t val)
 {
     trace_e1000e_core_ctrl_write(index, val);
 
@@ -1883,7 +1874,7 @@ e1000e_set_ctrl(E1000ECore *core, int index, uint32_t val)
 
     if (val & E1000_CTRL_RST) {
         trace_e1000e_core_ctrl_sw_reset();
-        e1000e_reset(core, true);
+        igb_reset(core, true);
     }
 
     if (val & E1000_CTRL_PHY_RST) {
@@ -1893,7 +1884,7 @@ e1000e_set_ctrl(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_rfctl(E1000ECore *core, int index, uint32_t val)
+igb_set_rfctl(IGBCore *core, int index, uint32_t val)
 {
     trace_e1000e_rx_set_rfctl(val);
 
@@ -1913,7 +1904,7 @@ e1000e_set_rfctl(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_calc_per_desc_buf_size(E1000ECore *core)
+igb_calc_per_desc_buf_size(IGBCore *core)
 {
     int i;
     core->rx_desc_buf_size = 0;
@@ -1924,7 +1915,7 @@ e1000e_calc_per_desc_buf_size(E1000ECore *core)
 }
 
 static void
-e1000e_parse_rxbufsize(E1000ECore *core)
+igb_parse_rxbufsize(IGBCore *core)
 {
     uint32_t rctl = core->mac[RCTL];
 
@@ -1954,13 +1945,13 @@ e1000e_parse_rxbufsize(E1000ECore *core)
     trace_e1000e_rx_desc_buff_sizes(core->rxbuf_sizes[0], core->rxbuf_sizes[1],
                                     core->rxbuf_sizes[2], core->rxbuf_sizes[3]);
 
-    e1000e_calc_per_desc_buf_size(core);
+    igb_calc_per_desc_buf_size(core);
 }
 
 static void
-e1000e_calc_rxdesclen(E1000ECore *core)
+igb_calc_rxdesclen(IGBCore *core)
 {
-    if (e1000e_rx_use_legacy_descriptor(core)) {
+    if (igb_rx_use_legacy_descriptor(core)) {
         core->rx_desc_len = sizeof(struct e1000_rx_desc);
     } else {
         if (core->mac[RCTL] & E1000_RCTL_DTYP_PS) {
@@ -1973,40 +1964,40 @@ e1000e_calc_rxdesclen(E1000ECore *core)
 }
 
 static void
-e1000e_set_rx_control(E1000ECore *core, int index, uint32_t val)
+igb_set_rx_control(IGBCore *core, int index, uint32_t val)
 {
     core->mac[RCTL] = val;
     trace_e1000e_rx_set_rctl(core->mac[RCTL]);
 
     if (val & E1000_RCTL_EN) {
-        e1000e_parse_rxbufsize(core);
-        e1000e_calc_rxdesclen(core);
+        igb_parse_rxbufsize(core);
+        igb_calc_rxdesclen(core);
         core->rxbuf_min_shift = ((val / E1000_RCTL_RDMTS_QUAT) & 3) + 1 +
                                 E1000_RING_DESC_LEN_SHIFT;
 
-        e1000e_start_recv(core);
+        igb_start_recv(core);
     }
 }
 
 static
-void(*e1000e_phyreg_writeops[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE])
-(E1000ECore *, int, uint16_t) = {
+void(*igb_phyreg_writeops[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE])
+(IGBCore *, int, uint16_t) = {
     [0] = {
-        [MII_BMCR]     = e1000e_set_phy_ctrl,
-        [PHY_PAGE]     = e1000e_set_phy_page,
-        [PHY_OEM_BITS] = e1000e_set_phy_oem_bits
+        [MII_BMCR]     = igb_set_phy_ctrl,
+        [PHY_PAGE]     = igb_set_phy_page,
+        [PHY_OEM_BITS] = igb_set_phy_oem_bits
     }
 };
 
 static inline void
-e1000e_clear_ims_bits(E1000ECore *core, uint32_t bits)
+igb_clear_ims_bits(IGBCore *core, uint32_t bits)
 {
     trace_e1000e_irq_clear_ims(bits, core->mac[IMS], core->mac[IMS] & ~bits);
     core->mac[IMS] &= ~bits;
 }
 
 static inline bool
-e1000e_postpone_interrupt(E1000IntrDelayTimer *timer)
+igb_postpone_interrupt(IGBIntrDelayTimer *timer)
 {
     if (timer->running) {
         trace_e1000e_irq_postponed_by_xitr(timer->delay_reg << 2);
@@ -2015,33 +2006,33 @@ e1000e_postpone_interrupt(E1000IntrDelayTimer *timer)
     }
 
     if (timer->core->mac[timer->delay_reg] != 0) {
-        e1000e_intrmgr_rearm_timer(timer);
+        igb_intrmgr_rearm_timer(timer);
     }
 
     return false;
 }
 
 static inline bool
-e1000e_itr_should_postpone(E1000ECore *core)
+igb_itr_should_postpone(IGBCore *core)
 {
-    return e1000e_postpone_interrupt(&core->itr);
+    return igb_postpone_interrupt(&core->itr);
 }
 
 static inline bool
-e1000e_eitr_should_postpone(E1000ECore *core, int idx)
+igb_eitr_should_postpone(IGBCore *core, int idx)
 {
-    return e1000e_postpone_interrupt(&core->eitr[idx]);
+    return igb_postpone_interrupt(&core->eitr[idx]);
 }
 
 static void
-e1000e_msix_notify_one(E1000ECore *core, uint32_t cause, uint32_t int_cfg)
+igb_msix_notify_one(IGBCore *core, uint32_t cause, uint32_t int_cfg)
 {
     uint32_t effective_eiac;
 
     if (E1000_IVAR_ENTRY_VALID(int_cfg)) {
         uint32_t vec = E1000_IVAR_ENTRY_VEC(int_cfg);
-        if (vec < E1000E_MSIX_VEC_NUM) {
-            if (!e1000e_eitr_should_postpone(core, vec)) {
+        if (vec < IGB_MSIX_VEC_NUM) {
+            if (!igb_eitr_should_postpone(core, vec)) {
                 trace_e1000e_irq_msix_notify_vec(vec);
                 msix_notify(core->owner, vec);
             }
@@ -2070,40 +2061,40 @@ e1000e_msix_notify_one(E1000ECore *core, uint32_t cause, uint32_t int_cfg)
 }
 
 static void
-e1000e_msix_notify(E1000ECore *core, uint32_t causes)
+igb_msix_notify(IGBCore *core, uint32_t causes)
 {
     if (causes & E1000_ICR_RXQ0) {
-        e1000e_msix_notify_one(core, E1000_ICR_RXQ0,
+        igb_msix_notify_one(core, E1000_ICR_RXQ0,
                                E1000_IVAR_RXQ0(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_RXQ1) {
-        e1000e_msix_notify_one(core, E1000_ICR_RXQ1,
+        igb_msix_notify_one(core, E1000_ICR_RXQ1,
                                E1000_IVAR_RXQ1(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_TXQ0) {
-        e1000e_msix_notify_one(core, E1000_ICR_TXQ0,
+        igb_msix_notify_one(core, E1000_ICR_TXQ0,
                                E1000_IVAR_TXQ0(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_TXQ1) {
-        e1000e_msix_notify_one(core, E1000_ICR_TXQ1,
+        igb_msix_notify_one(core, E1000_ICR_TXQ1,
                                E1000_IVAR_TXQ1(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_OTHER) {
-        e1000e_msix_notify_one(core, E1000_ICR_OTHER,
+        igb_msix_notify_one(core, E1000_ICR_OTHER,
                                E1000_IVAR_OTHER(core->mac[IVAR]));
     }
 }
 
 static void
-e1000e_msix_clear_one(E1000ECore *core, uint32_t cause, uint32_t int_cfg)
+igb_msix_clear_one(IGBCore *core, uint32_t cause, uint32_t int_cfg)
 {
     if (E1000_IVAR_ENTRY_VALID(int_cfg)) {
         uint32_t vec = E1000_IVAR_ENTRY_VEC(int_cfg);
-        if (vec < E1000E_MSIX_VEC_NUM) {
+        if (vec < IGB_MSIX_VEC_NUM) {
             trace_e1000e_irq_msix_pending_clearing(cause, int_cfg, vec);
             msix_clr_pending(core->owner, vec);
         } else {
@@ -2115,36 +2106,36 @@ e1000e_msix_clear_one(E1000ECore *core, uint32_t cause, uint32_t int_cfg)
 }
 
 static void
-e1000e_msix_clear(E1000ECore *core, uint32_t causes)
+igb_msix_clear(IGBCore *core, uint32_t causes)
 {
     if (causes & E1000_ICR_RXQ0) {
-        e1000e_msix_clear_one(core, E1000_ICR_RXQ0,
+        igb_msix_clear_one(core, E1000_ICR_RXQ0,
                               E1000_IVAR_RXQ0(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_RXQ1) {
-        e1000e_msix_clear_one(core, E1000_ICR_RXQ1,
+        igb_msix_clear_one(core, E1000_ICR_RXQ1,
                               E1000_IVAR_RXQ1(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_TXQ0) {
-        e1000e_msix_clear_one(core, E1000_ICR_TXQ0,
+        igb_msix_clear_one(core, E1000_ICR_TXQ0,
                               E1000_IVAR_TXQ0(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_TXQ1) {
-        e1000e_msix_clear_one(core, E1000_ICR_TXQ1,
+        igb_msix_clear_one(core, E1000_ICR_TXQ1,
                               E1000_IVAR_TXQ1(core->mac[IVAR]));
     }
 
     if (causes & E1000_ICR_OTHER) {
-        e1000e_msix_clear_one(core, E1000_ICR_OTHER,
+        igb_msix_clear_one(core, E1000_ICR_OTHER,
                               E1000_IVAR_OTHER(core->mac[IVAR]));
     }
 }
 
 static inline void
-e1000e_fix_icr_asserted(E1000ECore *core)
+igb_fix_icr_asserted(IGBCore *core)
 {
     core->mac[ICR] &= ~E1000_ICR_ASSERTED;
     if (core->mac[ICR]) {
@@ -2155,7 +2146,7 @@ e1000e_fix_icr_asserted(E1000ECore *core)
 }
 
 static void
-e1000e_send_msi(E1000ECore *core, bool msix)
+igb_send_msi(IGBCore *core, bool msix)
 {
     uint32_t causes = core->mac[ICR] & core->mac[IMS] & ~E1000_ICR_ASSERTED;
 
@@ -2167,9 +2158,9 @@ e1000e_send_msi(E1000ECore *core, bool msix)
     core->msi_causes_pending |= causes;
 
     if (msix) {
-        e1000e_msix_notify(core, causes);
+        igb_msix_notify(core, causes);
     } else {
-        if (!e1000e_itr_should_postpone(core)) {
+        if (!igb_itr_should_postpone(core)) {
             trace_e1000e_irq_msi_notify(causes);
             msi_notify(core->owner, 0);
         }
@@ -2177,7 +2168,7 @@ e1000e_send_msi(E1000ECore *core, bool msix)
 }
 
 static void
-e1000e_update_interrupt_state(E1000ECore *core)
+igb_update_interrupt_state(IGBCore *core)
 {
     bool interrupts_pending;
     bool is_msix = msix_enabled(core->owner);
@@ -2190,7 +2181,7 @@ e1000e_update_interrupt_state(E1000ECore *core)
         }
     }
 
-    e1000e_fix_icr_asserted(core);
+    igb_fix_icr_asserted(core);
 
     /*
      * Make sure ICR and ICS registers have the same value.
@@ -2212,54 +2203,54 @@ e1000e_update_interrupt_state(E1000ECore *core)
 
     if (is_msix || msi_enabled(core->owner)) {
         if (interrupts_pending) {
-            e1000e_send_msi(core, is_msix);
+            igb_send_msi(core, is_msix);
         }
     } else {
         if (interrupts_pending) {
-            if (!e1000e_itr_should_postpone(core)) {
-                e1000e_raise_legacy_irq(core);
+            if (!igb_itr_should_postpone(core)) {
+                igb_raise_legacy_irq(core);
             }
         } else {
-            e1000e_lower_legacy_irq(core);
+            igb_lower_legacy_irq(core);
         }
     }
 }
 
 static void
-e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val)
+igb_set_interrupt_cause(IGBCore *core, uint32_t val)
 {
     trace_e1000e_irq_set_cause_entry(val, core->mac[ICR]);
 
-    val |= e1000e_intmgr_collect_delayed_causes(core);
+    val |= igb_intmgr_collect_delayed_causes(core);
     core->mac[ICR] |= val;
 
     trace_e1000e_irq_set_cause_exit(val, core->mac[ICR]);
 
-    e1000e_update_interrupt_state(core);
+    igb_update_interrupt_state(core);
 }
 
 static inline void
-e1000e_autoneg_timer(void *opaque)
+igb_autoneg_timer(void *opaque)
 {
-    E1000ECore *core = opaque;
+    IGBCore *core = opaque;
     if (!qemu_get_queue(core->owner_nic)->link_down) {
         e1000x_update_regs_on_autoneg_done(core->mac, core->phy[0]);
-        e1000e_start_recv(core);
+        igb_start_recv(core);
 
-        e1000e_update_flowctl_status(core);
+        igb_update_flowctl_status(core);
         /* signal link status change to the guest */
-        e1000e_set_interrupt_cause(core, E1000_ICR_LSC);
+        igb_set_interrupt_cause(core, E1000_ICR_LSC);
     }
 }
 
 static inline uint16_t
-e1000e_get_reg_index_with_offset(const uint16_t *mac_reg_access, hwaddr addr)
+igb_get_reg_index_with_offset(const uint16_t *mac_reg_access, hwaddr addr)
 {
     uint16_t index = (addr & 0x1ffff) >> 2;
     return index + (mac_reg_access[index] & 0xfffe);
 }
 
-static const char e1000e_phy_regcap[E1000E_PHY_PAGES][0x20] = {
+static const char igb_phy_regcap[E1000E_PHY_PAGES][0x20] = {
     [0] = {
         [MII_BMCR]              = PHY_ANYPAGE | PHY_RW,
         [MII_BMSR]              = PHY_ANYPAGE | PHY_R,
@@ -2308,36 +2299,34 @@ static const char e1000e_phy_regcap[E1000E_PHY_PAGES][0x20] = {
 };
 
 static bool
-e1000e_phy_reg_check_cap(E1000ECore *core, uint32_t addr,
+igb_phy_reg_check_cap(IGBCore *core, uint32_t addr,
                          char cap, uint8_t *page)
 {
-    *page =
-        (e1000e_phy_regcap[0][addr] & PHY_ANYPAGE) ? 0
+    *page = (igb_phy_regcap[0][addr] & PHY_ANYPAGE) ? 0
                                                     : core->phy[0][PHY_PAGE];
 
     if (*page >= E1000E_PHY_PAGES) {
         return false;
     }
 
-    return e1000e_phy_regcap[*page][addr] & cap;
+    return igb_phy_regcap[*page][addr] & cap;
 }
 
 static void
-e1000e_phy_reg_write(E1000ECore *core, uint8_t page,
-                     uint32_t addr, uint16_t data)
+igb_phy_reg_write(IGBCore *core, uint8_t page, uint32_t addr, uint16_t data)
 {
     assert(page < E1000E_PHY_PAGES);
     assert(addr < E1000E_PHY_PAGE_SIZE);
 
-    if (e1000e_phyreg_writeops[page][addr]) {
-        e1000e_phyreg_writeops[page][addr](core, addr, data);
+    if (igb_phyreg_writeops[page][addr]) {
+        igb_phyreg_writeops[page][addr](core, addr, data);
     } else {
         core->phy[page][addr] = data;
     }
 }
 
 static void
-e1000e_set_mdic(E1000ECore *core, int index, uint32_t val)
+igb_set_mdic(IGBCore *core, int index, uint32_t val)
 {
     uint32_t data = val & E1000_MDIC_DATA_MASK;
     uint32_t addr = ((val & E1000_MDIC_REG_MASK) >> E1000_MDIC_REG_SHIFT);
@@ -2346,7 +2335,7 @@ e1000e_set_mdic(E1000ECore *core, int index, uint32_t val)
     if ((val & E1000_MDIC_PHY_MASK) >> E1000_MDIC_PHY_SHIFT != 1) { /* phy # */
         val = core->mac[MDIC] | E1000_MDIC_ERROR;
     } else if (val & E1000_MDIC_OP_READ) {
-        if (!e1000e_phy_reg_check_cap(core, addr, PHY_R, &page)) {
+        if (!igb_phy_reg_check_cap(core, addr, PHY_R, &page)) {
             trace_e1000e_core_mdic_read_unhandled(page, addr);
             val |= E1000_MDIC_ERROR;
         } else {
@@ -2354,31 +2343,31 @@ e1000e_set_mdic(E1000ECore *core, int index, uint32_t val)
             trace_e1000e_core_mdic_read(page, addr, val);
         }
     } else if (val & E1000_MDIC_OP_WRITE) {
-        if (!e1000e_phy_reg_check_cap(core, addr, PHY_W, &page)) {
+        if (!igb_phy_reg_check_cap(core, addr, PHY_W, &page)) {
             trace_e1000e_core_mdic_write_unhandled(page, addr);
             val |= E1000_MDIC_ERROR;
         } else {
             trace_e1000e_core_mdic_write(page, addr, data);
-            e1000e_phy_reg_write(core, page, addr, data);
+            igb_phy_reg_write(core, page, addr, data);
         }
     }
     core->mac[MDIC] = val | E1000_MDIC_READY;
 
     if (val & E1000_MDIC_INT_EN) {
-        e1000e_set_interrupt_cause(core, E1000_ICR_MDAC);
+        igb_set_interrupt_cause(core, E1000_ICR_MDAC);
     }
 }
 
 static void
-e1000e_set_rdt(E1000ECore *core, int index, uint32_t val)
+igb_set_rdt(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] = val & 0xffff;
-    trace_e1000e_rx_set_rdt(e1000e_mq_queue_idx(RDT0, index), val);
-    e1000e_start_recv(core);
+    trace_e1000e_rx_set_rdt(igb_mq_queue_idx(RDT0, index), val);
+    igb_start_recv(core);
 }
 
 static void
-e1000e_set_status(E1000ECore *core, int index, uint32_t val)
+igb_set_status(IGBCore *core, int index, uint32_t val)
 {
     if ((val & E1000_STATUS_PHYRA) == 0) {
         core->mac[index] &= ~E1000_STATUS_PHYRA;
@@ -2386,7 +2375,7 @@ e1000e_set_status(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_ctrlext(E1000ECore *core, int index, uint32_t val)
+igb_set_ctrlext(IGBCore *core, int index, uint32_t val)
 {
     trace_e1000e_link_set_ext_params(!!(val & E1000_CTRL_EXT_ASDCHK),
                                      !!(val & E1000_CTRL_EXT_SPD_BYPS));
@@ -2397,7 +2386,7 @@ e1000e_set_ctrlext(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_pbaclr(E1000ECore *core, int index, uint32_t val)
+igb_set_pbaclr(IGBCore *core, int index, uint32_t val)
 {
     int i;
 
@@ -2407,7 +2396,7 @@ e1000e_set_pbaclr(E1000ECore *core, int index, uint32_t val)
         return;
     }
 
-    for (i = 0; i < E1000E_MSIX_VEC_NUM; i++) {
+    for (i = 0; i < IGB_MSIX_VEC_NUM; i++) {
         if (core->mac[PBACLR] & BIT(i)) {
             msix_clr_pending(core->owner, i);
         }
@@ -2415,97 +2404,97 @@ e1000e_set_pbaclr(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_fcrth(E1000ECore *core, int index, uint32_t val)
+igb_set_fcrth(IGBCore *core, int index, uint32_t val)
 {
     core->mac[FCRTH] = val & 0xFFF8;
 }
 
 static void
-e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
+igb_set_fcrtl(IGBCore *core, int index, uint32_t val)
 {
     core->mac[FCRTL] = val & 0x8000FFF8;
 }
 
-#define E1000E_LOW_BITS_SET_FUNC(num)                                \
-    static void                                                      \
-    e1000e_set_##num##bit(E1000ECore *core, int index, uint32_t val) \
-    {                                                                \
-        core->mac[index] = val & (BIT(num) - 1);                     \
+#define IGB_LOW_BITS_SET_FUNC(num)                             \
+    static void                                                \
+    igb_set_##num##bit(IGBCore *core, int index, uint32_t val) \
+    {                                                          \
+        core->mac[index] = val & (BIT(num) - 1);               \
     }
 
-E1000E_LOW_BITS_SET_FUNC(4)
-E1000E_LOW_BITS_SET_FUNC(6)
-E1000E_LOW_BITS_SET_FUNC(11)
-E1000E_LOW_BITS_SET_FUNC(12)
-E1000E_LOW_BITS_SET_FUNC(13)
-E1000E_LOW_BITS_SET_FUNC(16)
+IGB_LOW_BITS_SET_FUNC(4)
+IGB_LOW_BITS_SET_FUNC(6)
+IGB_LOW_BITS_SET_FUNC(11)
+IGB_LOW_BITS_SET_FUNC(12)
+IGB_LOW_BITS_SET_FUNC(13)
+IGB_LOW_BITS_SET_FUNC(16)
 
 static void
-e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
+igb_set_vet(IGBCore *core, int index, uint32_t val)
 {
     core->mac[VET] = val & 0xffff;
     trace_e1000e_vlan_vet(core->mac[VET]);
 }
 
 static void
-e1000e_set_dlen(E1000ECore *core, int index, uint32_t val)
+igb_set_dlen(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] = val & E1000_XDLEN_MASK;
 }
 
 static void
-e1000e_set_dbal(E1000ECore *core, int index, uint32_t val)
+igb_set_dbal(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] = val & E1000_XDBAL_MASK;
 }
 
 static void
-e1000e_set_tctl(E1000ECore *core, int index, uint32_t val)
+igb_set_tctl(IGBCore *core, int index, uint32_t val)
 {
-    E1000E_TxRing txr;
+    IGB_TxRing txr;
     core->mac[index] = val;
 
     if (core->mac[TARC0] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, 0);
-        e1000e_start_xmit(core, &txr);
+        igb_tx_ring_init(core, &txr, 0);
+        igb_start_xmit(core, &txr);
     }
 
     if (core->mac[TARC1] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, 1);
-        e1000e_start_xmit(core, &txr);
+        igb_tx_ring_init(core, &txr, 1);
+        igb_start_xmit(core, &txr);
     }
 }
 
 static void
-e1000e_set_tdt(E1000ECore *core, int index, uint32_t val)
+igb_set_tdt(IGBCore *core, int index, uint32_t val)
 {
-    E1000E_TxRing txr;
-    int qidx = e1000e_mq_queue_idx(TDT, index);
+    IGB_TxRing txr;
+    int qidx = igb_mq_queue_idx(TDT, index);
     uint32_t tarc_reg = (qidx == 0) ? TARC0 : TARC1;
 
     core->mac[index] = val & 0xffff;
 
     if (core->mac[tarc_reg] & E1000_TARC_ENABLE) {
-        e1000e_tx_ring_init(core, &txr, qidx);
-        e1000e_start_xmit(core, &txr);
+        igb_tx_ring_init(core, &txr, qidx);
+        igb_start_xmit(core, &txr);
     }
 }
 
 static void
-e1000e_set_ics(E1000ECore *core, int index, uint32_t val)
+igb_set_ics(IGBCore *core, int index, uint32_t val)
 {
     trace_e1000e_irq_write_ics(val);
-    e1000e_set_interrupt_cause(core, val);
+    igb_set_interrupt_cause(core, val);
 }
 
 static void
-e1000e_set_icr(E1000ECore *core, int index, uint32_t val)
+igb_set_icr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t icr = 0;
     if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
         trace_e1000e_irq_icr_process_iame();
-        e1000e_clear_ims_bits(core, core->mac[IAM]);
+        igb_clear_ims_bits(core, core->mac[IAM]);
     }
 
     icr = core->mac[ICR] & ~val;
@@ -2516,19 +2505,19 @@ e1000e_set_icr(E1000ECore *core, int index, uint32_t val)
     icr = (val & E1000_ICR_OTHER) ? (icr & ~E1000_ICR_OTHER_CAUSES) : icr;
     trace_e1000e_irq_icr_write(val, core->mac[ICR], icr);
     core->mac[ICR] = icr;
-    e1000e_update_interrupt_state(core);
+    igb_update_interrupt_state(core);
 }
 
 static void
-e1000e_set_imc(E1000ECore *core, int index, uint32_t val)
+igb_set_imc(IGBCore *core, int index, uint32_t val)
 {
     trace_e1000e_irq_ims_clear_set_imc(val);
-    e1000e_clear_ims_bits(core, val);
-    e1000e_update_interrupt_state(core);
+    igb_clear_ims_bits(core, val);
+    igb_update_interrupt_state(core);
 }
 
 static void
-e1000e_set_ims(E1000ECore *core, int index, uint32_t val)
+igb_set_ims(IGBCore *core, int index, uint32_t val)
 {
     static const uint32_t ims_ext_mask =
         E1000_IMS_RXQ0 | E1000_IMS_RXQ1 |
@@ -2551,66 +2540,66 @@ e1000e_set_ims(E1000ECore *core, int index, uint32_t val)
     if ((valid_val & ims_ext_mask) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_PBA_CLR) &&
         msix_enabled(core->owner)) {
-        e1000e_msix_clear(core, valid_val);
+        igb_msix_clear(core, valid_val);
     }
 
     if ((valid_val == ims_valid_mask) &&
         (core->mac[CTRL_EXT] & E1000_CTRL_EXT_INT_TIMERS_CLEAR_ENA)) {
         trace_e1000e_irq_fire_all_timers(val);
-        e1000e_intrmgr_fire_all_timers(core);
+        igb_intrmgr_fire_all_timers(core);
     }
 
-    e1000e_update_interrupt_state(core);
+    igb_update_interrupt_state(core);
 }
 
 static void
-e1000e_set_rdtr(E1000ECore *core, int index, uint32_t val)
+igb_set_rdtr(IGBCore *core, int index, uint32_t val)
 {
-    e1000e_set_16bit(core, index, val);
+    igb_set_16bit(core, index, val);
 
     if ((val & E1000_RDTR_FPD) && (core->rdtr.running)) {
         trace_e1000e_irq_rdtr_fpd_running();
-        e1000e_intrmgr_fire_delayed_interrupts(core);
+        igb_intrmgr_fire_delayed_interrupts(core);
     } else {
         trace_e1000e_irq_rdtr_fpd_not_running();
     }
 }
 
 static void
-e1000e_set_tidv(E1000ECore *core, int index, uint32_t val)
+igb_set_tidv(IGBCore *core, int index, uint32_t val)
 {
-    e1000e_set_16bit(core, index, val);
+    igb_set_16bit(core, index, val);
 
     if ((val & E1000_TIDV_FPD) && (core->tidv.running)) {
         trace_e1000e_irq_tidv_fpd_running();
-        e1000e_intrmgr_fire_delayed_interrupts(core);
+        igb_intrmgr_fire_delayed_interrupts(core);
     } else {
         trace_e1000e_irq_tidv_fpd_not_running();
     }
 }
 
 static uint32_t
-e1000e_mac_readreg(E1000ECore *core, int index)
+igb_mac_readreg(IGBCore *core, int index)
 {
     return core->mac[index];
 }
 
 static uint32_t
-e1000e_mac_ics_read(E1000ECore *core, int index)
+igb_mac_ics_read(IGBCore *core, int index)
 {
     trace_e1000e_irq_read_ics(core->mac[ICS]);
     return core->mac[ICS];
 }
 
 static uint32_t
-e1000e_mac_ims_read(E1000ECore *core, int index)
+igb_mac_ims_read(IGBCore *core, int index)
 {
     trace_e1000e_irq_read_ims(core->mac[IMS]);
     return core->mac[IMS];
 }
 
 static uint32_t
-e1000e_mac_swsm_read(E1000ECore *core, int index)
+igb_mac_swsm_read(IGBCore *core, int index)
 {
     uint32_t val = core->mac[SWSM];
     core->mac[SWSM] = val | E1000_SWSM_SMBI;
@@ -2618,19 +2607,19 @@ e1000e_mac_swsm_read(E1000ECore *core, int index)
 }
 
 static uint32_t
-e1000e_mac_itr_read(E1000ECore *core, int index)
+igb_mac_itr_read(IGBCore *core, int index)
 {
     return core->itr_guest_value;
 }
 
 static uint32_t
-e1000e_mac_eitr_read(E1000ECore *core, int index)
+igb_mac_eitr_read(IGBCore *core, int index)
 {
     return core->eitr_guest_value[index - EITR];
 }
 
 static uint32_t
-e1000e_mac_icr_read(E1000ECore *core, int index)
+igb_mac_icr_read(IGBCore *core, int index)
 {
     uint32_t ret = core->mac[ICR];
     trace_e1000e_irq_icr_read_entry(ret);
@@ -2650,16 +2639,16 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
         trace_e1000e_irq_icr_clear_iame();
         core->mac[ICR] = 0;
         trace_e1000e_irq_icr_process_iame();
-        e1000e_clear_ims_bits(core, core->mac[IAM]);
+        igb_clear_ims_bits(core, core->mac[IAM]);
     }
 
     trace_e1000e_irq_icr_read_exit(core->mac[ICR]);
-    e1000e_update_interrupt_state(core);
+    igb_update_interrupt_state(core);
     return ret;
 }
 
 static uint32_t
-e1000e_mac_read_clr4(E1000ECore *core, int index)
+igb_mac_read_clr4(IGBCore *core, int index)
 {
     uint32_t ret = core->mac[index];
 
@@ -2668,7 +2657,7 @@ e1000e_mac_read_clr4(E1000ECore *core, int index)
 }
 
 static uint32_t
-e1000e_mac_read_clr8(E1000ECore *core, int index)
+igb_mac_read_clr8(IGBCore *core, int index)
 {
     uint32_t ret = core->mac[index];
 
@@ -2678,7 +2667,7 @@ e1000e_mac_read_clr8(E1000ECore *core, int index)
 }
 
 static uint32_t
-e1000e_get_ctrl(E1000ECore *core, int index)
+igb_get_ctrl(IGBCore *core, int index)
 {
     uint32_t val = core->mac[CTRL];
 
@@ -2694,7 +2683,7 @@ e1000e_get_ctrl(E1000ECore *core, int index)
 }
 
 static uint32_t
-e1000e_get_status(E1000ECore *core, int index)
+igb_get_status(IGBCore *core, int index)
 {
     uint32_t res = core->mac[STATUS];
 
@@ -2736,7 +2725,7 @@ e1000e_get_status(E1000ECore *core, int index)
 }
 
 static uint32_t
-e1000e_get_tarc(E1000ECore *core, int index)
+igb_get_tarc(IGBCore *core, int index)
 {
     return core->mac[index] & ((BIT(11) - 1) |
                                 BIT(27)      |
@@ -2746,13 +2735,13 @@ e1000e_get_tarc(E1000ECore *core, int index)
 }
 
 static void
-e1000e_mac_writereg(E1000ECore *core, int index, uint32_t val)
+igb_mac_writereg(IGBCore *core, int index, uint32_t val)
 {
     core->mac[index] = val;
 }
 
 static void
-e1000e_mac_setmacaddr(E1000ECore *core, int index, uint32_t val)
+igb_mac_setmacaddr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t macaddr[2];
 
@@ -2767,7 +2756,7 @@ e1000e_mac_setmacaddr(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_eecd(E1000ECore *core, int index, uint32_t val)
+igb_set_eecd(IGBCore *core, int index, uint32_t val)
 {
     static const uint32_t ro_bits = E1000_EECD_PRES          |
                                     E1000_EECD_AUTO_RD       |
@@ -2777,13 +2766,13 @@ e1000e_set_eecd(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_eerd(E1000ECore *core, int index, uint32_t val)
+igb_set_eerd(IGBCore *core, int index, uint32_t val)
 {
     uint32_t addr = (val >> E1000_EERW_ADDR_SHIFT) & E1000_EERW_ADDR_MASK;
     uint32_t flags = 0;
     uint32_t data = 0;
 
-    if ((addr < E1000E_EEPROM_SIZE) && (val & E1000_EERW_START)) {
+    if ((addr < IGB_EEPROM_SIZE) && (val & E1000_EERW_START)) {
         data = core->eeprom[addr];
         flags = E1000_EERW_DONE;
     }
@@ -2794,13 +2783,13 @@ e1000e_set_eerd(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_eewr(E1000ECore *core, int index, uint32_t val)
+igb_set_eewr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t addr = (val >> E1000_EERW_ADDR_SHIFT) & E1000_EERW_ADDR_MASK;
     uint32_t data = (val >> E1000_EERW_DATA_SHIFT) & E1000_EERW_DATA_MASK;
     uint32_t flags = 0;
 
-    if ((addr < E1000E_EEPROM_SIZE) && (val & E1000_EERW_START)) {
+    if ((addr < IGB_EEPROM_SIZE) && (val & E1000_EERW_START)) {
         core->eeprom[addr] = data;
         flags = E1000_EERW_DONE;
     }
@@ -2811,13 +2800,13 @@ e1000e_set_eewr(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_rxdctl(E1000ECore *core, int index, uint32_t val)
+igb_set_rxdctl(IGBCore *core, int index, uint32_t val)
 {
     core->mac[RXDCTL] = core->mac[RXDCTL1] = val;
 }
 
 static void
-e1000e_set_itr(E1000ECore *core, int index, uint32_t val)
+igb_set_itr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t interval = val & 0xffff;
 
@@ -2828,7 +2817,7 @@ e1000e_set_itr(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_eitr(E1000ECore *core, int index, uint32_t val)
+igb_set_eitr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t interval = val & 0xffff;
     uint32_t eitr_num = index - EITR;
@@ -2840,19 +2829,19 @@ e1000e_set_eitr(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_set_psrctl(E1000ECore *core, int index, uint32_t val)
+igb_set_psrctl(IGBCore *core, int index, uint32_t val)
 {
     if (core->mac[RCTL] & E1000_RCTL_DTYP_MASK) {
 
         if ((val & E1000_PSRCTL_BSIZE0_MASK) == 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "e1000e: PSRCTL.BSIZE0 cannot be zero");
+                          "igb: PSRCTL.BSIZE0 cannot be zero");
             return;
         }
 
         if ((val & E1000_PSRCTL_BSIZE1_MASK) == 0) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "e1000e: PSRCTL.BSIZE1 cannot be zero");
+                          "igb: PSRCTL.BSIZE1 cannot be zero");
             return;
         }
     }
@@ -2861,9 +2850,9 @@ e1000e_set_psrctl(E1000ECore *core, int index, uint32_t val)
 }
 
 static void
-e1000e_update_rx_offloads(E1000ECore *core)
+igb_update_rx_offloads(IGBCore *core)
 {
-    int cso_state = e1000e_rx_l4_cso_enabled(core);
+    int cso_state = igb_rx_l4_cso_enabled(core);
 
     trace_e1000e_rx_set_cso(cso_state);
 
@@ -2874,377 +2863,377 @@ e1000e_update_rx_offloads(E1000ECore *core)
 }
 
 static void
-e1000e_set_rxcsum(E1000ECore *core, int index, uint32_t val)
+igb_set_rxcsum(IGBCore *core, int index, uint32_t val)
 {
     core->mac[RXCSUM] = val;
-    e1000e_update_rx_offloads(core);
+    igb_update_rx_offloads(core);
 }
 
 static void
-e1000e_set_gcr(E1000ECore *core, int index, uint32_t val)
+igb_set_gcr(IGBCore *core, int index, uint32_t val)
 {
     uint32_t ro_bits = core->mac[GCR] & E1000_GCR_RO_BITS;
     core->mac[GCR] = (val & ~E1000_GCR_RO_BITS) | ro_bits;
 }
 
-#define e1000e_getreg(x)    [x] = e1000e_mac_readreg
-typedef uint32_t (*readops)(E1000ECore *, int);
-static const readops e1000e_macreg_readops[] = {
-    e1000e_getreg(PBA),
-    e1000e_getreg(WUFC),
-    e1000e_getreg(MANC),
-    e1000e_getreg(TOTL),
-    e1000e_getreg(RDT0),
-    e1000e_getreg(RDBAH0),
-    e1000e_getreg(TDBAL1),
-    e1000e_getreg(RDLEN0),
-    e1000e_getreg(RDH1),
-    e1000e_getreg(LATECOL),
-    e1000e_getreg(SEQEC),
-    e1000e_getreg(XONTXC),
-    e1000e_getreg(AIT),
-    e1000e_getreg(TDFH),
-    e1000e_getreg(TDFT),
-    e1000e_getreg(TDFHS),
-    e1000e_getreg(TDFTS),
-    e1000e_getreg(TDFPC),
-    e1000e_getreg(WUS),
-    e1000e_getreg(PBS),
-    e1000e_getreg(RDFH),
-    e1000e_getreg(RDFT),
-    e1000e_getreg(RDFHS),
-    e1000e_getreg(RDFTS),
-    e1000e_getreg(RDFPC),
-    e1000e_getreg(GORCL),
-    e1000e_getreg(MGTPRC),
-    e1000e_getreg(EERD),
-    e1000e_getreg(EIAC),
-    e1000e_getreg(PSRCTL),
-    e1000e_getreg(MANC2H),
-    e1000e_getreg(RXCSUM),
-    e1000e_getreg(GSCL_3),
-    e1000e_getreg(GSCN_2),
-    e1000e_getreg(RSRPD),
-    e1000e_getreg(RDBAL1),
-    e1000e_getreg(FCAH),
-    e1000e_getreg(FCRTH),
-    e1000e_getreg(FLOP),
-    e1000e_getreg(FLASHT),
-    e1000e_getreg(RXSTMPH),
-    e1000e_getreg(TXSTMPL),
-    e1000e_getreg(TIMADJL),
-    e1000e_getreg(TXDCTL),
-    e1000e_getreg(RDH0),
-    e1000e_getreg(TDT1),
-    e1000e_getreg(TNCRS),
-    e1000e_getreg(RJC),
-    e1000e_getreg(IAM),
-    e1000e_getreg(GSCL_2),
-    e1000e_getreg(RDBAH1),
-    e1000e_getreg(FLSWDATA),
-    e1000e_getreg(RXSATRH),
-    e1000e_getreg(TIPG),
-    e1000e_getreg(FLMNGCTL),
-    e1000e_getreg(FLMNGCNT),
-    e1000e_getreg(TSYNCTXCTL),
-    e1000e_getreg(EXTCNF_SIZE),
-    e1000e_getreg(EXTCNF_CTRL),
-    e1000e_getreg(EEMNGDATA),
-    e1000e_getreg(CTRL_EXT),
-    e1000e_getreg(SYSTIMH),
-    e1000e_getreg(EEMNGCTL),
-    e1000e_getreg(FLMNGDATA),
-    e1000e_getreg(TSYNCRXCTL),
-    e1000e_getreg(TDH),
-    e1000e_getreg(LEDCTL),
-    e1000e_getreg(TCTL),
-    e1000e_getreg(TDBAL),
-    e1000e_getreg(TDLEN),
-    e1000e_getreg(TDH1),
-    e1000e_getreg(RADV),
-    e1000e_getreg(ECOL),
-    e1000e_getreg(DC),
-    e1000e_getreg(RLEC),
-    e1000e_getreg(XOFFTXC),
-    e1000e_getreg(RFC),
-    e1000e_getreg(RNBC),
-    e1000e_getreg(MGTPTC),
-    e1000e_getreg(TIMINCA),
-    e1000e_getreg(RXCFGL),
-    e1000e_getreg(MFUTP01),
-    e1000e_getreg(FACTPS),
-    e1000e_getreg(GSCL_1),
-    e1000e_getreg(GSCN_0),
-    e1000e_getreg(GCR2),
-    e1000e_getreg(RDT1),
-    e1000e_getreg(PBACLR),
-    e1000e_getreg(FCTTV),
-    e1000e_getreg(EEWR),
-    e1000e_getreg(FLSWCTL),
-    e1000e_getreg(RXDCTL1),
-    e1000e_getreg(RXSATRL),
-    e1000e_getreg(SYSTIML),
-    e1000e_getreg(RXUDP),
-    e1000e_getreg(TORL),
-    e1000e_getreg(TDLEN1),
-    e1000e_getreg(MCC),
-    e1000e_getreg(WUC),
-    e1000e_getreg(EECD),
-    e1000e_getreg(MFUTP23),
-    e1000e_getreg(RAID),
-    e1000e_getreg(FCRTV),
-    e1000e_getreg(TXDCTL1),
-    e1000e_getreg(RCTL),
-    e1000e_getreg(TDT),
-    e1000e_getreg(MDIC),
-    e1000e_getreg(FCRUC),
-    e1000e_getreg(VET),
-    e1000e_getreg(RDBAL0),
-    e1000e_getreg(TDBAH1),
-    e1000e_getreg(RDTR),
-    e1000e_getreg(SCC),
-    e1000e_getreg(COLC),
-    e1000e_getreg(CEXTERR),
-    e1000e_getreg(XOFFRXC),
-    e1000e_getreg(IPAV),
-    e1000e_getreg(GOTCL),
-    e1000e_getreg(MGTPDC),
-    e1000e_getreg(GCR),
-    e1000e_getreg(IVAR),
-    e1000e_getreg(POEMB),
-    e1000e_getreg(MFVAL),
-    e1000e_getreg(FUNCTAG),
-    e1000e_getreg(GSCL_4),
-    e1000e_getreg(GSCN_3),
-    e1000e_getreg(MRQC),
-    e1000e_getreg(RDLEN1),
-    e1000e_getreg(FCT),
-    e1000e_getreg(FLA),
-    e1000e_getreg(FLOL),
-    e1000e_getreg(RXDCTL),
-    e1000e_getreg(RXSTMPL),
-    e1000e_getreg(TXSTMPH),
-    e1000e_getreg(TIMADJH),
-    e1000e_getreg(FCRTL),
-    e1000e_getreg(TDBAH),
-    e1000e_getreg(TADV),
-    e1000e_getreg(XONRXC),
-    e1000e_getreg(TSCTFC),
-    e1000e_getreg(RFCTL),
-    e1000e_getreg(GSCN_1),
-    e1000e_getreg(FCAL),
-    e1000e_getreg(FLSWCNT),
-
-    [TOTH]    = e1000e_mac_read_clr8,
-    [GOTCH]   = e1000e_mac_read_clr8,
-    [PRC64]   = e1000e_mac_read_clr4,
-    [PRC255]  = e1000e_mac_read_clr4,
-    [PRC1023] = e1000e_mac_read_clr4,
-    [PTC64]   = e1000e_mac_read_clr4,
-    [PTC255]  = e1000e_mac_read_clr4,
-    [PTC1023] = e1000e_mac_read_clr4,
-    [GPRC]    = e1000e_mac_read_clr4,
-    [TPT]     = e1000e_mac_read_clr4,
-    [RUC]     = e1000e_mac_read_clr4,
-    [BPRC]    = e1000e_mac_read_clr4,
-    [MPTC]    = e1000e_mac_read_clr4,
-    [IAC]     = e1000e_mac_read_clr4,
-    [ICR]     = e1000e_mac_icr_read,
-    [STATUS]  = e1000e_get_status,
-    [TARC0]   = e1000e_get_tarc,
-    [ICS]     = e1000e_mac_ics_read,
-    [TORH]    = e1000e_mac_read_clr8,
-    [GORCH]   = e1000e_mac_read_clr8,
-    [PRC127]  = e1000e_mac_read_clr4,
-    [PRC511]  = e1000e_mac_read_clr4,
-    [PRC1522] = e1000e_mac_read_clr4,
-    [PTC127]  = e1000e_mac_read_clr4,
-    [PTC511]  = e1000e_mac_read_clr4,
-    [PTC1522] = e1000e_mac_read_clr4,
-    [GPTC]    = e1000e_mac_read_clr4,
-    [TPR]     = e1000e_mac_read_clr4,
-    [ROC]     = e1000e_mac_read_clr4,
-    [MPRC]    = e1000e_mac_read_clr4,
-    [BPTC]    = e1000e_mac_read_clr4,
-    [TSCTC]   = e1000e_mac_read_clr4,
-    [ITR]     = e1000e_mac_itr_read,
-    [CTRL]    = e1000e_get_ctrl,
-    [TARC1]   = e1000e_get_tarc,
-    [SWSM]    = e1000e_mac_swsm_read,
-    [IMS]     = e1000e_mac_ims_read,
-
-    [CRCERRS ... MPC]      = e1000e_mac_readreg,
-    [IP6AT ... IP6AT + 3]  = e1000e_mac_readreg,
-    [IP4AT ... IP4AT + 6]  = e1000e_mac_readreg,
-    [RA ... RA + 31]       = e1000e_mac_readreg,
-    [WUPM ... WUPM + 31]   = e1000e_mac_readreg,
-    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_readreg,
-    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]  = e1000e_mac_readreg,
-    [FFMT ... FFMT + 254]  = e1000e_mac_readreg,
-    [FFVT ... FFVT + 254]  = e1000e_mac_readreg,
-    [MDEF ... MDEF + 7]    = e1000e_mac_readreg,
-    [FFLT ... FFLT + 10]   = e1000e_mac_readreg,
-    [FTFT ... FTFT + 254]  = e1000e_mac_readreg,
-    [PBM ... PBM + 10239]  = e1000e_mac_readreg,
-    [RETA ... RETA + 31]   = e1000e_mac_readreg,
-    [RSSRK ... RSSRK + 31] = e1000e_mac_readreg,
-    [MAVTV0 ... MAVTV3]    = e1000e_mac_readreg,
-    [EITR...EITR + E1000E_MSIX_VEC_NUM - 1] = e1000e_mac_eitr_read
+#define igb_getreg(x)    [x] = igb_mac_readreg
+typedef uint32_t (*readops)(IGBCore *, int);
+static const readops igb_macreg_readops[] = {
+    igb_getreg(PBA),
+    igb_getreg(WUFC),
+    igb_getreg(MANC),
+    igb_getreg(TOTL),
+    igb_getreg(RDT0),
+    igb_getreg(RDBAH0),
+    igb_getreg(TDBAL1),
+    igb_getreg(RDLEN0),
+    igb_getreg(RDH1),
+    igb_getreg(LATECOL),
+    igb_getreg(SEQEC),
+    igb_getreg(XONTXC),
+    igb_getreg(AIT),
+    igb_getreg(TDFH),
+    igb_getreg(TDFT),
+    igb_getreg(TDFHS),
+    igb_getreg(TDFTS),
+    igb_getreg(TDFPC),
+    igb_getreg(WUS),
+    igb_getreg(PBS),
+    igb_getreg(RDFH),
+    igb_getreg(RDFT),
+    igb_getreg(RDFHS),
+    igb_getreg(RDFTS),
+    igb_getreg(RDFPC),
+    igb_getreg(GORCL),
+    igb_getreg(MGTPRC),
+    igb_getreg(EERD),
+    igb_getreg(EIAC),
+    igb_getreg(PSRCTL),
+    igb_getreg(MANC2H),
+    igb_getreg(RXCSUM),
+    igb_getreg(GSCL_3),
+    igb_getreg(GSCN_2),
+    igb_getreg(RSRPD),
+    igb_getreg(RDBAL1),
+    igb_getreg(FCAH),
+    igb_getreg(FCRTH),
+    igb_getreg(FLOP),
+    igb_getreg(FLASHT),
+    igb_getreg(RXSTMPH),
+    igb_getreg(TXSTMPL),
+    igb_getreg(TIMADJL),
+    igb_getreg(TXDCTL),
+    igb_getreg(RDH0),
+    igb_getreg(TDT1),
+    igb_getreg(TNCRS),
+    igb_getreg(RJC),
+    igb_getreg(IAM),
+    igb_getreg(GSCL_2),
+    igb_getreg(RDBAH1),
+    igb_getreg(FLSWDATA),
+    igb_getreg(RXSATRH),
+    igb_getreg(TIPG),
+    igb_getreg(FLMNGCTL),
+    igb_getreg(FLMNGCNT),
+    igb_getreg(TSYNCTXCTL),
+    igb_getreg(EXTCNF_SIZE),
+    igb_getreg(EXTCNF_CTRL),
+    igb_getreg(EEMNGDATA),
+    igb_getreg(CTRL_EXT),
+    igb_getreg(SYSTIMH),
+    igb_getreg(EEMNGCTL),
+    igb_getreg(FLMNGDATA),
+    igb_getreg(TSYNCRXCTL),
+    igb_getreg(TDH),
+    igb_getreg(LEDCTL),
+    igb_getreg(TCTL),
+    igb_getreg(TDBAL),
+    igb_getreg(TDLEN),
+    igb_getreg(TDH1),
+    igb_getreg(RADV),
+    igb_getreg(ECOL),
+    igb_getreg(DC),
+    igb_getreg(RLEC),
+    igb_getreg(XOFFTXC),
+    igb_getreg(RFC),
+    igb_getreg(RNBC),
+    igb_getreg(MGTPTC),
+    igb_getreg(TIMINCA),
+    igb_getreg(RXCFGL),
+    igb_getreg(MFUTP01),
+    igb_getreg(FACTPS),
+    igb_getreg(GSCL_1),
+    igb_getreg(GSCN_0),
+    igb_getreg(GCR2),
+    igb_getreg(RDT1),
+    igb_getreg(PBACLR),
+    igb_getreg(FCTTV),
+    igb_getreg(EEWR),
+    igb_getreg(FLSWCTL),
+    igb_getreg(RXDCTL1),
+    igb_getreg(RXSATRL),
+    igb_getreg(SYSTIML),
+    igb_getreg(RXUDP),
+    igb_getreg(TORL),
+    igb_getreg(TDLEN1),
+    igb_getreg(MCC),
+    igb_getreg(WUC),
+    igb_getreg(EECD),
+    igb_getreg(MFUTP23),
+    igb_getreg(RAID),
+    igb_getreg(FCRTV),
+    igb_getreg(TXDCTL1),
+    igb_getreg(RCTL),
+    igb_getreg(TDT),
+    igb_getreg(MDIC),
+    igb_getreg(FCRUC),
+    igb_getreg(VET),
+    igb_getreg(RDBAL0),
+    igb_getreg(TDBAH1),
+    igb_getreg(RDTR),
+    igb_getreg(SCC),
+    igb_getreg(COLC),
+    igb_getreg(CEXTERR),
+    igb_getreg(XOFFRXC),
+    igb_getreg(IPAV),
+    igb_getreg(GOTCL),
+    igb_getreg(MGTPDC),
+    igb_getreg(GCR),
+    igb_getreg(IVAR),
+    igb_getreg(POEMB),
+    igb_getreg(MFVAL),
+    igb_getreg(FUNCTAG),
+    igb_getreg(GSCL_4),
+    igb_getreg(GSCN_3),
+    igb_getreg(MRQC),
+    igb_getreg(RDLEN1),
+    igb_getreg(FCT),
+    igb_getreg(FLA),
+    igb_getreg(FLOL),
+    igb_getreg(RXDCTL),
+    igb_getreg(RXSTMPL),
+    igb_getreg(TXSTMPH),
+    igb_getreg(TIMADJH),
+    igb_getreg(FCRTL),
+    igb_getreg(TDBAH),
+    igb_getreg(TADV),
+    igb_getreg(XONRXC),
+    igb_getreg(TSCTFC),
+    igb_getreg(RFCTL),
+    igb_getreg(GSCN_1),
+    igb_getreg(FCAL),
+    igb_getreg(FLSWCNT),
+
+    [TOTH]    = igb_mac_read_clr8,
+    [GOTCH]   = igb_mac_read_clr8,
+    [PRC64]   = igb_mac_read_clr4,
+    [PRC255]  = igb_mac_read_clr4,
+    [PRC1023] = igb_mac_read_clr4,
+    [PTC64]   = igb_mac_read_clr4,
+    [PTC255]  = igb_mac_read_clr4,
+    [PTC1023] = igb_mac_read_clr4,
+    [GPRC]    = igb_mac_read_clr4,
+    [TPT]     = igb_mac_read_clr4,
+    [RUC]     = igb_mac_read_clr4,
+    [BPRC]    = igb_mac_read_clr4,
+    [MPTC]    = igb_mac_read_clr4,
+    [IAC]     = igb_mac_read_clr4,
+    [ICR]     = igb_mac_icr_read,
+    [STATUS]  = igb_get_status,
+    [TARC0]   = igb_get_tarc,
+    [ICS]     = igb_mac_ics_read,
+    [TORH]    = igb_mac_read_clr8,
+    [GORCH]   = igb_mac_read_clr8,
+    [PRC127]  = igb_mac_read_clr4,
+    [PRC511]  = igb_mac_read_clr4,
+    [PRC1522] = igb_mac_read_clr4,
+    [PTC127]  = igb_mac_read_clr4,
+    [PTC511]  = igb_mac_read_clr4,
+    [PTC1522] = igb_mac_read_clr4,
+    [GPTC]    = igb_mac_read_clr4,
+    [TPR]     = igb_mac_read_clr4,
+    [ROC]     = igb_mac_read_clr4,
+    [MPRC]    = igb_mac_read_clr4,
+    [BPTC]    = igb_mac_read_clr4,
+    [TSCTC]   = igb_mac_read_clr4,
+    [ITR]     = igb_mac_itr_read,
+    [CTRL]    = igb_get_ctrl,
+    [TARC1]   = igb_get_tarc,
+    [SWSM]    = igb_mac_swsm_read,
+    [IMS]     = igb_mac_ims_read,
+
+    [CRCERRS ... MPC]      = igb_mac_readreg,
+    [IP6AT ... IP6AT + 3]  = igb_mac_readreg,
+    [IP4AT ... IP4AT + 6]  = igb_mac_readreg,
+    [RA ... RA + 31]       = igb_mac_readreg,
+    [WUPM ... WUPM + 31]   = igb_mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = igb_mac_readreg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]  = igb_mac_readreg,
+    [FFMT ... FFMT + 254]  = igb_mac_readreg,
+    [FFVT ... FFVT + 254]  = igb_mac_readreg,
+    [MDEF ... MDEF + 7]    = igb_mac_readreg,
+    [FFLT ... FFLT + 10]   = igb_mac_readreg,
+    [FTFT ... FTFT + 254]  = igb_mac_readreg,
+    [PBM ... PBM + 10239]  = igb_mac_readreg,
+    [RETA ... RETA + 31]   = igb_mac_readreg,
+    [RSSRK ... RSSRK + 31] = igb_mac_readreg,
+    [MAVTV0 ... MAVTV3]    = igb_mac_readreg,
+    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = igb_mac_eitr_read
 };
-enum { E1000E_NREADOPS = ARRAY_SIZE(e1000e_macreg_readops) };
-
-#define e1000e_putreg(x)    [x] = e1000e_mac_writereg
-typedef void (*writeops)(E1000ECore *, int, uint32_t);
-static const writeops e1000e_macreg_writeops[] = {
-    e1000e_putreg(PBA),
-    e1000e_putreg(SWSM),
-    e1000e_putreg(WUFC),
-    e1000e_putreg(RDBAH1),
-    e1000e_putreg(TDBAH),
-    e1000e_putreg(TXDCTL),
-    e1000e_putreg(RDBAH0),
-    e1000e_putreg(LEDCTL),
-    e1000e_putreg(FCAL),
-    e1000e_putreg(FCRUC),
-    e1000e_putreg(WUC),
-    e1000e_putreg(WUS),
-    e1000e_putreg(IPAV),
-    e1000e_putreg(TDBAH1),
-    e1000e_putreg(TIMINCA),
-    e1000e_putreg(IAM),
-    e1000e_putreg(EIAC),
-    e1000e_putreg(IVAR),
-    e1000e_putreg(TARC0),
-    e1000e_putreg(TARC1),
-    e1000e_putreg(FLSWDATA),
-    e1000e_putreg(POEMB),
-    e1000e_putreg(MFUTP01),
-    e1000e_putreg(MFUTP23),
-    e1000e_putreg(MANC),
-    e1000e_putreg(MANC2H),
-    e1000e_putreg(MFVAL),
-    e1000e_putreg(EXTCNF_CTRL),
-    e1000e_putreg(FACTPS),
-    e1000e_putreg(FUNCTAG),
-    e1000e_putreg(GSCL_1),
-    e1000e_putreg(GSCL_2),
-    e1000e_putreg(GSCL_3),
-    e1000e_putreg(GSCL_4),
-    e1000e_putreg(GSCN_0),
-    e1000e_putreg(GSCN_1),
-    e1000e_putreg(GSCN_2),
-    e1000e_putreg(GSCN_3),
-    e1000e_putreg(GCR2),
-    e1000e_putreg(MRQC),
-    e1000e_putreg(FLOP),
-    e1000e_putreg(FLOL),
-    e1000e_putreg(FLSWCTL),
-    e1000e_putreg(FLSWCNT),
-    e1000e_putreg(FLA),
-    e1000e_putreg(RXDCTL1),
-    e1000e_putreg(TXDCTL1),
-    e1000e_putreg(TIPG),
-    e1000e_putreg(RXSTMPH),
-    e1000e_putreg(RXSTMPL),
-    e1000e_putreg(RXSATRL),
-    e1000e_putreg(RXSATRH),
-    e1000e_putreg(TXSTMPL),
-    e1000e_putreg(TXSTMPH),
-    e1000e_putreg(SYSTIML),
-    e1000e_putreg(SYSTIMH),
-    e1000e_putreg(TIMADJL),
-    e1000e_putreg(TIMADJH),
-    e1000e_putreg(RXUDP),
-    e1000e_putreg(RXCFGL),
-    e1000e_putreg(TSYNCRXCTL),
-    e1000e_putreg(TSYNCTXCTL),
-    e1000e_putreg(EXTCNF_SIZE),
-    e1000e_putreg(EEMNGCTL),
-    e1000e_putreg(RA),
-
-    [TDH1]     = e1000e_set_16bit,
-    [TDT1]     = e1000e_set_tdt,
-    [TCTL]     = e1000e_set_tctl,
-    [TDT]      = e1000e_set_tdt,
-    [MDIC]     = e1000e_set_mdic,
-    [ICS]      = e1000e_set_ics,
-    [TDH]      = e1000e_set_16bit,
-    [RDH0]     = e1000e_set_16bit,
-    [RDT0]     = e1000e_set_rdt,
-    [IMC]      = e1000e_set_imc,
-    [IMS]      = e1000e_set_ims,
-    [ICR]      = e1000e_set_icr,
-    [EECD]     = e1000e_set_eecd,
-    [RCTL]     = e1000e_set_rx_control,
-    [CTRL]     = e1000e_set_ctrl,
-    [RDTR]     = e1000e_set_rdtr,
-    [RADV]     = e1000e_set_16bit,
-    [TADV]     = e1000e_set_16bit,
-    [ITR]      = e1000e_set_itr,
-    [EERD]     = e1000e_set_eerd,
-    [AIT]      = e1000e_set_16bit,
-    [TDFH]     = e1000e_set_13bit,
-    [TDFT]     = e1000e_set_13bit,
-    [TDFHS]    = e1000e_set_13bit,
-    [TDFTS]    = e1000e_set_13bit,
-    [TDFPC]    = e1000e_set_13bit,
-    [RDFH]     = e1000e_set_13bit,
-    [RDFHS]    = e1000e_set_13bit,
-    [RDFT]     = e1000e_set_13bit,
-    [RDFTS]    = e1000e_set_13bit,
-    [RDFPC]    = e1000e_set_13bit,
-    [PBS]      = e1000e_set_6bit,
-    [GCR]      = e1000e_set_gcr,
-    [PSRCTL]   = e1000e_set_psrctl,
-    [RXCSUM]   = e1000e_set_rxcsum,
-    [RAID]     = e1000e_set_16bit,
-    [RSRPD]    = e1000e_set_12bit,
-    [TIDV]     = e1000e_set_tidv,
-    [TDLEN1]   = e1000e_set_dlen,
-    [TDLEN]    = e1000e_set_dlen,
-    [RDLEN0]   = e1000e_set_dlen,
-    [RDLEN1]   = e1000e_set_dlen,
-    [TDBAL]    = e1000e_set_dbal,
-    [TDBAL1]   = e1000e_set_dbal,
-    [RDBAL0]   = e1000e_set_dbal,
-    [RDBAL1]   = e1000e_set_dbal,
-    [RDH1]     = e1000e_set_16bit,
-    [RDT1]     = e1000e_set_rdt,
-    [STATUS]   = e1000e_set_status,
-    [PBACLR]   = e1000e_set_pbaclr,
-    [CTRL_EXT] = e1000e_set_ctrlext,
-    [FCAH]     = e1000e_set_16bit,
-    [FCT]      = e1000e_set_16bit,
-    [FCTTV]    = e1000e_set_16bit,
-    [FCRTV]    = e1000e_set_16bit,
-    [FCRTH]    = e1000e_set_fcrth,
-    [FCRTL]    = e1000e_set_fcrtl,
-    [VET]      = e1000e_set_vet,
-    [RXDCTL]   = e1000e_set_rxdctl,
-    [FLASHT]   = e1000e_set_16bit,
-    [EEWR]     = e1000e_set_eewr,
-    [CTRL_DUP] = e1000e_set_ctrl,
-    [RFCTL]    = e1000e_set_rfctl,
-    [RA + 1]   = e1000e_mac_setmacaddr,
-
-    [IP6AT ... IP6AT + 3]    = e1000e_mac_writereg,
-    [IP4AT ... IP4AT + 6]    = e1000e_mac_writereg,
-    [RA + 2 ... RA + 31]     = e1000e_mac_writereg,
-    [WUPM ... WUPM + 31]     = e1000e_mac_writereg,
-    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_writereg,
-    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]    = e1000e_mac_writereg,
-    [FFMT ... FFMT + 254]    = e1000e_set_4bit,
-    [FFVT ... FFVT + 254]    = e1000e_mac_writereg,
-    [PBM ... PBM + 10239]    = e1000e_mac_writereg,
-    [MDEF ... MDEF + 7]      = e1000e_mac_writereg,
-    [FFLT ... FFLT + 10]     = e1000e_set_11bit,
-    [FTFT ... FTFT + 254]    = e1000e_mac_writereg,
-    [RETA ... RETA + 31]     = e1000e_mac_writereg,
-    [RSSRK ... RSSRK + 31]   = e1000e_mac_writereg,
-    [MAVTV0 ... MAVTV3]      = e1000e_mac_writereg,
-    [EITR...EITR + E1000E_MSIX_VEC_NUM - 1] = e1000e_set_eitr
+enum { IGB_NREADOPS = ARRAY_SIZE(igb_macreg_readops) };
+
+#define igb_putreg(x)    [x] = igb_mac_writereg
+typedef void (*writeops)(IGBCore *, int, uint32_t);
+static const writeops igb_macreg_writeops[] = {
+    igb_putreg(PBA),
+    igb_putreg(SWSM),
+    igb_putreg(WUFC),
+    igb_putreg(RDBAH1),
+    igb_putreg(TDBAH),
+    igb_putreg(TXDCTL),
+    igb_putreg(RDBAH0),
+    igb_putreg(LEDCTL),
+    igb_putreg(FCAL),
+    igb_putreg(FCRUC),
+    igb_putreg(WUC),
+    igb_putreg(WUS),
+    igb_putreg(IPAV),
+    igb_putreg(TDBAH1),
+    igb_putreg(TIMINCA),
+    igb_putreg(IAM),
+    igb_putreg(EIAC),
+    igb_putreg(IVAR),
+    igb_putreg(TARC0),
+    igb_putreg(TARC1),
+    igb_putreg(FLSWDATA),
+    igb_putreg(POEMB),
+    igb_putreg(MFUTP01),
+    igb_putreg(MFUTP23),
+    igb_putreg(MANC),
+    igb_putreg(MANC2H),
+    igb_putreg(MFVAL),
+    igb_putreg(EXTCNF_CTRL),
+    igb_putreg(FACTPS),
+    igb_putreg(FUNCTAG),
+    igb_putreg(GSCL_1),
+    igb_putreg(GSCL_2),
+    igb_putreg(GSCL_3),
+    igb_putreg(GSCL_4),
+    igb_putreg(GSCN_0),
+    igb_putreg(GSCN_1),
+    igb_putreg(GSCN_2),
+    igb_putreg(GSCN_3),
+    igb_putreg(GCR2),
+    igb_putreg(MRQC),
+    igb_putreg(FLOP),
+    igb_putreg(FLOL),
+    igb_putreg(FLSWCTL),
+    igb_putreg(FLSWCNT),
+    igb_putreg(FLA),
+    igb_putreg(RXDCTL1),
+    igb_putreg(TXDCTL1),
+    igb_putreg(TIPG),
+    igb_putreg(RXSTMPH),
+    igb_putreg(RXSTMPL),
+    igb_putreg(RXSATRL),
+    igb_putreg(RXSATRH),
+    igb_putreg(TXSTMPL),
+    igb_putreg(TXSTMPH),
+    igb_putreg(SYSTIML),
+    igb_putreg(SYSTIMH),
+    igb_putreg(TIMADJL),
+    igb_putreg(TIMADJH),
+    igb_putreg(RXUDP),
+    igb_putreg(RXCFGL),
+    igb_putreg(TSYNCRXCTL),
+    igb_putreg(TSYNCTXCTL),
+    igb_putreg(EXTCNF_SIZE),
+    igb_putreg(EEMNGCTL),
+    igb_putreg(RA),
+
+    [TDH1]     = igb_set_16bit,
+    [TDT1]     = igb_set_tdt,
+    [TCTL]     = igb_set_tctl,
+    [TDT]      = igb_set_tdt,
+    [MDIC]     = igb_set_mdic,
+    [ICS]      = igb_set_ics,
+    [TDH]      = igb_set_16bit,
+    [RDH0]     = igb_set_16bit,
+    [RDT0]     = igb_set_rdt,
+    [IMC]      = igb_set_imc,
+    [IMS]      = igb_set_ims,
+    [ICR]      = igb_set_icr,
+    [EECD]     = igb_set_eecd,
+    [RCTL]     = igb_set_rx_control,
+    [CTRL]     = igb_set_ctrl,
+    [RDTR]     = igb_set_rdtr,
+    [RADV]     = igb_set_16bit,
+    [TADV]     = igb_set_16bit,
+    [ITR]      = igb_set_itr,
+    [EERD]     = igb_set_eerd,
+    [AIT]      = igb_set_16bit,
+    [TDFH]     = igb_set_13bit,
+    [TDFT]     = igb_set_13bit,
+    [TDFHS]    = igb_set_13bit,
+    [TDFTS]    = igb_set_13bit,
+    [TDFPC]    = igb_set_13bit,
+    [RDFH]     = igb_set_13bit,
+    [RDFHS]    = igb_set_13bit,
+    [RDFT]     = igb_set_13bit,
+    [RDFTS]    = igb_set_13bit,
+    [RDFPC]    = igb_set_13bit,
+    [PBS]      = igb_set_6bit,
+    [GCR]      = igb_set_gcr,
+    [PSRCTL]   = igb_set_psrctl,
+    [RXCSUM]   = igb_set_rxcsum,
+    [RAID]     = igb_set_16bit,
+    [RSRPD]    = igb_set_12bit,
+    [TIDV]     = igb_set_tidv,
+    [TDLEN1]   = igb_set_dlen,
+    [TDLEN]    = igb_set_dlen,
+    [RDLEN0]   = igb_set_dlen,
+    [RDLEN1]   = igb_set_dlen,
+    [TDBAL]    = igb_set_dbal,
+    [TDBAL1]   = igb_set_dbal,
+    [RDBAL0]   = igb_set_dbal,
+    [RDBAL1]   = igb_set_dbal,
+    [RDH1]     = igb_set_16bit,
+    [RDT1]     = igb_set_rdt,
+    [STATUS]   = igb_set_status,
+    [PBACLR]   = igb_set_pbaclr,
+    [CTRL_EXT] = igb_set_ctrlext,
+    [FCAH]     = igb_set_16bit,
+    [FCT]      = igb_set_16bit,
+    [FCTTV]    = igb_set_16bit,
+    [FCRTV]    = igb_set_16bit,
+    [FCRTH]    = igb_set_fcrth,
+    [FCRTL]    = igb_set_fcrtl,
+    [VET]      = igb_set_vet,
+    [RXDCTL]   = igb_set_rxdctl,
+    [FLASHT]   = igb_set_16bit,
+    [EEWR]     = igb_set_eewr,
+    [CTRL_DUP] = igb_set_ctrl,
+    [RFCTL]    = igb_set_rfctl,
+    [RA + 1]   = igb_mac_setmacaddr,
+
+    [IP6AT ... IP6AT + 3]    = igb_mac_writereg,
+    [IP4AT ... IP4AT + 6]    = igb_mac_writereg,
+    [RA + 2 ... RA + 31]     = igb_mac_writereg,
+    [WUPM ... WUPM + 31]     = igb_mac_writereg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = igb_mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]    = igb_mac_writereg,
+    [FFMT ... FFMT + 254]    = igb_set_4bit,
+    [FFVT ... FFVT + 254]    = igb_mac_writereg,
+    [PBM ... PBM + 10239]    = igb_mac_writereg,
+    [MDEF ... MDEF + 7]      = igb_mac_writereg,
+    [FFLT ... FFLT + 10]     = igb_set_11bit,
+    [FTFT ... FTFT + 254]    = igb_mac_writereg,
+    [RETA ... RETA + 31]     = igb_mac_writereg,
+    [RSSRK ... RSSRK + 31]   = igb_mac_writereg,
+    [MAVTV0 ... MAVTV3]      = igb_mac_writereg,
+    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = igb_set_eitr
 };
-enum { E1000E_NWRITEOPS = ARRAY_SIZE(e1000e_macreg_writeops) };
+enum { IGB_NWRITEOPS = ARRAY_SIZE(igb_macreg_writeops) };
 
 enum { MAC_ACCESS_PARTIAL = 1 };
 
@@ -3282,17 +3271,17 @@ static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
 };
 
 void
-e1000e_core_write(E1000ECore *core, hwaddr addr, uint64_t val, unsigned size)
+igb_core_write(IGBCore *core, hwaddr addr, uint64_t val, unsigned size)
 {
-    uint16_t index = e1000e_get_reg_index_with_offset(mac_reg_access, addr);
+    uint16_t index = igb_get_reg_index_with_offset(mac_reg_access, addr);
 
-    if (index < E1000E_NWRITEOPS && e1000e_macreg_writeops[index]) {
+    if (index < IGB_NWRITEOPS && igb_macreg_writeops[index]) {
         if (mac_reg_access[index] & MAC_ACCESS_PARTIAL) {
             trace_e1000e_wrn_regs_write_trivial(index << 2);
         }
         trace_e1000e_core_write(index << 2, size, val);
-        e1000e_macreg_writeops[index](core, index, val);
-    } else if (index < E1000E_NREADOPS && e1000e_macreg_readops[index]) {
+        igb_macreg_writeops[index](core, index, val);
+    } else if (index < IGB_NREADOPS && igb_macreg_readops[index]) {
         trace_e1000e_wrn_regs_write_ro(index << 2, size, val);
     } else {
         trace_e1000e_wrn_regs_write_unknown(index << 2, size, val);
@@ -3300,16 +3289,16 @@ e1000e_core_write(E1000ECore *core, hwaddr addr, uint64_t val, unsigned size)
 }
 
 uint64_t
-e1000e_core_read(E1000ECore *core, hwaddr addr, unsigned size)
+igb_core_read(IGBCore *core, hwaddr addr, unsigned size)
 {
     uint64_t val;
-    uint16_t index = e1000e_get_reg_index_with_offset(mac_reg_access, addr);
+    uint16_t index = igb_get_reg_index_with_offset(mac_reg_access, addr);
 
-    if (index < E1000E_NREADOPS && e1000e_macreg_readops[index]) {
+    if (index < IGB_NREADOPS && igb_macreg_readops[index]) {
         if (mac_reg_access[index] & MAC_ACCESS_PARTIAL) {
             trace_e1000e_wrn_regs_read_trivial(index << 2);
         }
-        val = e1000e_macreg_readops[index](core, index);
+        val = igb_macreg_readops[index](core, index);
         trace_e1000e_core_read(index << 2, size, val);
         return val;
     } else {
@@ -3319,15 +3308,15 @@ e1000e_core_read(E1000ECore *core, hwaddr addr, unsigned size)
 }
 
 static inline void
-e1000e_autoneg_pause(E1000ECore *core)
+igb_autoneg_pause(IGBCore *core)
 {
     timer_del(core->autoneg_timer);
 }
 
 static void
-e1000e_autoneg_resume(E1000ECore *core)
+igb_autoneg_resume(IGBCore *core)
 {
-    if (e1000e_have_autoneg(core) &&
+    if (igb_have_autoneg(core) &&
         !(core->phy[0][MII_BMSR] & MII_BMSR_AN_COMP)) {
         qemu_get_queue(core->owner_nic)->link_down = false;
         timer_mod(core->autoneg_timer,
@@ -3336,37 +3325,36 @@ e1000e_autoneg_resume(E1000ECore *core)
 }
 
 static void
-e1000e_vm_state_change(void *opaque, bool running, RunState state)
+igb_vm_state_change(void *opaque, bool running, RunState state)
 {
-    E1000ECore *core = opaque;
+    IGBCore *core = opaque;
 
     if (running) {
         trace_e1000e_vm_state_running();
-        e1000e_intrmgr_resume(core);
-        e1000e_autoneg_resume(core);
+        igb_intrmgr_resume(core);
+        igb_autoneg_resume(core);
     } else {
         trace_e1000e_vm_state_stopped();
-        e1000e_autoneg_pause(core);
-        e1000e_intrmgr_pause(core);
+        igb_autoneg_pause(core);
+        igb_intrmgr_pause(core);
     }
 }
 
 void
-e1000e_core_pci_realize(E1000ECore     *core,
-                        const uint16_t *eeprom_templ,
-                        uint32_t        eeprom_size,
-                        const uint8_t  *macaddr)
+igb_core_pci_realize(IGBCore        *core,
+                     const uint16_t *eeprom_templ,
+                     uint32_t        eeprom_size,
+                     const uint8_t  *macaddr)
 {
     int i;
 
     core->autoneg_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
-                                       e1000e_autoneg_timer, core);
-    e1000e_intrmgr_pci_realize(core);
+                                       igb_autoneg_timer, core);
+    igb_intrmgr_pci_realize(core);
 
-    core->vmstate =
-        qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
+    core->vmstate = qemu_add_vm_change_state_handler(igb_vm_state_change, core);
 
-    for (i = 0; i < E1000E_NUM_QUEUES; i++) {
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
         net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
                         E1000E_MAX_TX_FRAGS, core->has_vnet);
     }
@@ -3378,21 +3366,21 @@ e1000e_core_pci_realize(E1000ECore     *core,
                                eeprom_size,
                                PCI_DEVICE_GET_CLASS(core->owner)->device_id,
                                macaddr);
-    e1000e_update_rx_offloads(core);
+    igb_update_rx_offloads(core);
 }
 
 void
-e1000e_core_pci_uninit(E1000ECore *core)
+igb_core_pci_uninit(IGBCore *core)
 {
     int i;
 
     timer_free(core->autoneg_timer);
 
-    e1000e_intrmgr_pci_unint(core);
+    igb_intrmgr_pci_unint(core);
 
     qemu_del_vm_change_state_handler(core->vmstate);
 
-    for (i = 0; i < E1000E_NUM_QUEUES; i++) {
+    for (i = 0; i < IGB_NUM_QUEUES; i++) {
         net_tx_pkt_reset(core->tx[i].tx_pkt);
         net_tx_pkt_uninit(core->tx[i].tx_pkt);
     }
@@ -3401,7 +3389,7 @@ e1000e_core_pci_uninit(E1000ECore *core)
 }
 
 static const uint16_t
-e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
+igb_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
     [0] = {
         [MII_BMCR] = MII_BMCR_SPEED1000 |
                      MII_BMCR_FD        |
@@ -3447,7 +3435,7 @@ e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
     }
 };
 
-static const uint32_t e1000e_mac_reg_init[] = {
+static const uint32_t igb_mac_reg_init[] = {
     [PBA]           =     0x00140014,
     [LEDCTL]        =  BIT(1) | BIT(8) | BIT(9) | BIT(15) | BIT(17) | BIT(18),
     [EXTCNF_CTRL]   = BIT(3),
@@ -3486,33 +3474,33 @@ static const uint32_t e1000e_mac_reg_init[] = {
     [SWSM]          = 1,
     [RXCSUM]        = E1000_RXCSUM_IPOFLD | E1000_RXCSUM_TUOFLD,
     [ITR]           = E1000E_MIN_XITR,
-    [EITR...EITR + E1000E_MSIX_VEC_NUM - 1] = E1000E_MIN_XITR,
+    [EITR...EITR + IGB_MSIX_VEC_NUM - 1] = E1000E_MIN_XITR,
 };
 
-static void e1000e_reset(E1000ECore *core, bool sw)
+static void igb_reset(IGBCore *core, bool sw)
 {
     int i;
 
     timer_del(core->autoneg_timer);
 
-    e1000e_intrmgr_reset(core);
+    igb_intrmgr_reset(core);
 
     memset(core->phy, 0, sizeof core->phy);
-    memcpy(core->phy, e1000e_phy_reg_init, sizeof e1000e_phy_reg_init);
+    memcpy(core->phy, igb_phy_reg_init, sizeof igb_phy_reg_init);
 
     for (i = 0; i < E1000E_MAC_SIZE; i++) {
         if (sw && (i == PBA || i == PBS || i == FLA)) {
             continue;
         }
 
-        core->mac[i] = i < ARRAY_SIZE(e1000e_mac_reg_init) ?
-                       e1000e_mac_reg_init[i] : 0;
+        core->mac[i] = i < ARRAY_SIZE(igb_mac_reg_init) ?
+                       igb_mac_reg_init[i] : 0;
     }
 
     core->rxbuf_min_shift = 1 + E1000_RING_DESC_LEN_SHIFT;
 
     if (qemu_get_queue(core->owner_nic)->link_down) {
-        e1000e_link_down(core);
+        igb_link_down(core);
     }
 
     e1000x_reset_mac_addr(core->owner_nic, core->mac, core->permanent_mac);
@@ -3525,12 +3513,12 @@ static void e1000e_reset(E1000ECore *core, bool sw)
 }
 
 void
-e1000e_core_reset(E1000ECore *core)
+igb_core_reset(IGBCore *core)
 {
-    e1000e_reset(core, false);
+    igb_reset(core, false);
 }
 
-void e1000e_core_pre_save(E1000ECore *core)
+void igb_core_pre_save(IGBCore *core)
 {
     int i;
     NetClientState *nc = qemu_get_queue(core->owner_nic);
@@ -3540,9 +3528,9 @@ void e1000e_core_pre_save(E1000ECore *core)
      * complete auto-negotiation immediately. This allows us to look
      * at MII_BMSR_AN_COMP to infer link status on load.
      */
-    if (nc->link_down && e1000e_have_autoneg(core)) {
+    if (nc->link_down && igb_have_autoneg(core)) {
         core->phy[0][MII_BMSR] |= MII_BMSR_AN_COMP;
-        e1000e_update_flowctl_status(core);
+        igb_update_flowctl_status(core);
     }
 
     for (i = 0; i < ARRAY_SIZE(core->tx); i++) {
@@ -3553,7 +3541,7 @@ void e1000e_core_pre_save(E1000ECore *core)
 }
 
 int
-e1000e_core_post_load(E1000ECore *core)
+igb_core_post_load(IGBCore *core)
 {
     NetClientState *nc = qemu_get_queue(core->owner_nic);
 
diff --git a/hw/net/igb_core.h b/hw/net/igb_core.h
index d0a14b4523..4f70e45cb1 100644
--- a/hw/net/igb_core.h
+++ b/hw/net/igb_core.h
@@ -1,5 +1,5 @@
 /*
- * Core code for QEMU e1000e emulation
+ * Core code for QEMU igb emulation
  *
  * Software developer's manuals:
  * http://www.intel.com/content/dam/doc/datasheet/82574l-gbe-controller-datasheet.pdf
@@ -33,35 +33,35 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef HW_NET_E1000E_CORE_H
-#define HW_NET_E1000E_CORE_H
+#ifndef HW_NET_IGB_CORE_H
+#define HW_NET_IGB_CORE_H
 
 #define E1000E_PHY_PAGE_SIZE    (0x20)
 #define E1000E_PHY_PAGES        (0x07)
 #define E1000E_MAC_SIZE         (0x8000)
-#define E1000E_EEPROM_SIZE      (64)
-#define E1000E_MSIX_VEC_NUM     (5)
-#define E1000E_NUM_QUEUES       (2)
+#define IGB_EEPROM_SIZE         (64)
+#define IGB_MSIX_VEC_NUM        (5)
+#define IGB_NUM_QUEUES          (2)
 
-typedef struct E1000Core E1000ECore;
+typedef struct IGBCore IGBCore;
 
 enum { PHY_R = BIT(0),
        PHY_W = BIT(1),
        PHY_RW = PHY_R | PHY_W,
        PHY_ANYPAGE = BIT(2) };
 
-typedef struct E1000IntrDelayTimer_st {
+typedef struct IGBIntrDelayTimer_st {
     QEMUTimer *timer;
     bool running;
     uint32_t delay_reg;
     uint32_t delay_resolution_ns;
-    E1000ECore *core;
-} E1000IntrDelayTimer;
+    IGBCore *core;
+} IGBIntrDelayTimer;
 
-struct E1000Core {
+struct IGBCore {
     uint32_t mac[E1000E_MAC_SIZE];
     uint16_t phy[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE];
-    uint16_t eeprom[E1000E_EEPROM_SIZE];
+    uint16_t eeprom[IGB_EEPROM_SIZE];
 
     uint32_t rxbuf_sizes[E1000_PSRCTL_BUFFS_PER_DESC];
     uint32_t rx_desc_buf_size;
@@ -70,14 +70,14 @@ struct E1000Core {
 
     QEMUTimer *autoneg_timer;
 
-    struct e1000e_tx {
+    struct igb_tx {
         e1000x_txd_props props;
 
         bool skip_cp;
         unsigned char sum_needed;
         bool cptse;
         struct NetTxPkt *tx_pkt;
-    } tx[E1000E_NUM_QUEUES];
+    } tx[IGB_NUM_QUEUES];
 
     struct NetRxPkt *rx_pkt;
 
@@ -87,21 +87,21 @@ struct E1000Core {
     /* Interrupt moderation management */
     uint32_t delayed_causes;
 
-    E1000IntrDelayTimer radv;
-    E1000IntrDelayTimer rdtr;
-    E1000IntrDelayTimer raid;
+    IGBIntrDelayTimer radv;
+    IGBIntrDelayTimer rdtr;
+    IGBIntrDelayTimer raid;
 
-    E1000IntrDelayTimer tadv;
-    E1000IntrDelayTimer tidv;
+    IGBIntrDelayTimer tadv;
+    IGBIntrDelayTimer tidv;
 
-    E1000IntrDelayTimer itr;
+    IGBIntrDelayTimer itr;
 
-    E1000IntrDelayTimer eitr[E1000E_MSIX_VEC_NUM];
+    IGBIntrDelayTimer eitr[IGB_MSIX_VEC_NUM];
 
     VMChangeStateEntry *vmstate;
 
     uint32_t itr_guest_value;
-    uint32_t eitr_guest_value[E1000E_MSIX_VEC_NUM];
+    uint32_t eitr_guest_value[IGB_MSIX_VEC_NUM];
 
     uint16_t vet;
 
@@ -115,42 +115,42 @@ struct E1000Core {
 };
 
 void
-e1000e_core_write(E1000ECore *core, hwaddr addr, uint64_t val, unsigned size);
+igb_core_write(IGBCore *core, hwaddr addr, uint64_t val, unsigned size);
 
 uint64_t
-e1000e_core_read(E1000ECore *core, hwaddr addr, unsigned size);
+igb_core_read(IGBCore *core, hwaddr addr, unsigned size);
 
 void
-e1000e_core_pci_realize(E1000ECore      *regs,
-                       const uint16_t *eeprom_templ,
-                       uint32_t        eeprom_size,
-                       const uint8_t  *macaddr);
+igb_core_pci_realize(IGBCore        *regs,
+                     const uint16_t *eeprom_templ,
+                     uint32_t        eeprom_size,
+                     const uint8_t  *macaddr);
 
 void
-e1000e_core_reset(E1000ECore *core);
+igb_core_reset(IGBCore *core);
 
 void
-e1000e_core_pre_save(E1000ECore *core);
+igb_core_pre_save(IGBCore *core);
 
 int
-e1000e_core_post_load(E1000ECore *core);
+igb_core_post_load(IGBCore *core);
 
 void
-e1000e_core_set_link_status(E1000ECore *core);
+igb_core_set_link_status(IGBCore *core);
 
 void
-e1000e_core_pci_uninit(E1000ECore *core);
+igb_core_pci_uninit(IGBCore *core);
 
 bool
-e1000e_can_receive(E1000ECore *core);
+igb_can_receive(IGBCore *core);
 
 ssize_t
-e1000e_receive(E1000ECore *core, const uint8_t *buf, size_t size);
+igb_receive(IGBCore *core, const uint8_t *buf, size_t size);
 
 ssize_t
-e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt);
+igb_receive_iov(IGBCore *core, const struct iovec *iov, int iovcnt);
 
 void
-e1000e_start_recv(E1000ECore *core);
+igb_start_recv(IGBCore *core);
 
 #endif
-- 
2.39.0


