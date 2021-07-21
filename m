Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A585A3D078B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 06:16:39 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m63ew-0003id-Ne
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 00:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m63cx-0001gz-KY
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 00:14:35 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m63cv-0008Sz-Lv
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 00:14:35 -0400
Received: by mail-ej1-x636.google.com with SMTP id hd33so1170668ejc.9
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 21:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NX7CVelZKyv9RdDtdRqOT9dMf+JFJ64DUL+mHSolDKg=;
 b=ZPkY0uDA/88U6oW4oBjbpOCDMBRQeD3lBjDuWQNhpYWimEK6gYDZMFxsYKp/JPL6o8
 xGn/xlvGPsBXFY3MaNDWYe4c+9WJE7D8zWQMhxQcihKm3+gdM4zVaaJAjErTm+vIGktq
 GiJ0TgGHe5W20RcxOMgv14bfukfAPBrdsVcIPFRuIFmkLi2uGqHcNCzFxfOIESGdHre2
 ctRaR02a8YMqq1KwmHysfxMhWgh5wuHo7UuWe6cLeWdH2oGtUv0lp4+47ugU3fmzhC6h
 MZ7Jg6DmTBo9+5HEOk0gJx/FmVFE1vciiBT+NlBJRSGhkcRcw1JU+kS7wnrrEeypym6s
 pTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NX7CVelZKyv9RdDtdRqOT9dMf+JFJ64DUL+mHSolDKg=;
 b=UvQekaMYZRzCqGqj7GyHN72/qe6DVGGvgfemAggiBw6sEF2iV2BR0ZByjpsI6n6FE8
 YfJ+7RtV0epsAj5BHbEX7Y61eJssYU8Egp1LUp+j/f/Dz661XjfNS/pipA9cf5GMqb68
 Q+59AIaQP4PJy7RU7YhmlpZHFTVXkpnx+FYHbAMD+oOVNaBxWqRlqiWC5qQW1cuIf7Ni
 y+sn3AMQnjmgwpLYpxtePcxIFJwQhp+1uO6NkzC8kXV9rigQraEo0TYZWyq7SnjNT+fD
 FStZscxLcsdL6R5zmy3YhprodyrxKbN/rExmrjly2XQEnNNhoumvJXSPu0MGCgvy76tS
 yo6g==
X-Gm-Message-State: AOAM5320HM+XnLf5GjYWP/xy0pb7GVoJH0pa1aXrX94CiINrVjmZSm32
 ftt4hiWUzTz0Hh4JqIC3yE+mwIYxmiY=
X-Google-Smtp-Source: ABdhPJyk+E0dTdtLCZnK9sI8G81ETjMGITDOmidyqSwVYGZ9gwvTwXg+NXfsNHIrJptfjB9mauZ3SQ==
X-Received: by 2002:a17:906:e099:: with SMTP id
 gh25mr36256439ejb.346.1626840872162; 
 Tue, 20 Jul 2021 21:14:32 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id r27sm9444720edb.66.2021.07.20.21.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 21:14:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/net: e1000e: Correct the initial value of VET
 register
Date: Wed, 21 Jul 2021 12:15:03 +0800
Message-Id: <20210721041504.464403-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210721041504.464403-1-bmeng.cn@gmail.com>
References: <20210721041504.464403-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Christina Wang <christina.wang@windriver.com>,
 Markus Carlstedt <markus.carlstedt@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christina Wang <christina.wang@windriver.com>

The initial value of VLAN Ether Type (VET) register is 0x8100, as per
the manual and real hardware.

While Linux e1000e driver always writes VET register to 0x8100, it is
not always the case for everyone. Drivers relying on the reset value
of VET won't be able to transmit and receive VLAN frames in QEMU.

Unlike e1000 in QEMU, e1000e uses a field 'vet' in "struct E1000Core"
to cache the value of VET register, but the cache only gets updated
when VET register is written. To always get a consistent VET value
no matter VET is written or remains its reset value, drop the 'vet'
field and use 'core->mac[VET]' directly.

Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Christina Wang <christina.wang@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- add a "init-vet" property for versioned machines

Changes in v2:
- keep the 'vet' field in "struct E1000Core" for migration compatibility

 hw/core/machine.c    | 21 +++++++++++++++++++++
 hw/net/e1000e.c      |  8 +++++++-
 hw/net/e1000e_core.c |  9 ++++-----
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 29982c1ef1..8355df69c7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -42,6 +42,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "i8042", "extended-state", "false"},
     { "nvme-ns", "eui64-default", "off"},
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
@@ -51,6 +52,7 @@ GlobalProperty hw_compat_5_2[] = {
     { "virtio-blk-device", "report-discard-granularity", "off" },
     { "virtio-net-pci", "vectors", "3"},
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
 
@@ -65,6 +67,7 @@ GlobalProperty hw_compat_5_1[] = {
     { "pl011", "migrate-clk", "off" },
     { "virtio-pci", "x-ats-page-aligned", "off"},
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
 
@@ -77,6 +80,7 @@ GlobalProperty hw_compat_5_0[] = {
     { "vmport", "x-cmds-v2", "off" },
     { "virtio-device", "x-disable-legacy-check", "true" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_5_0_len = G_N_ELEMENTS(hw_compat_5_0);
 
@@ -94,12 +98,14 @@ GlobalProperty hw_compat_4_2[] = {
     { "fw_cfg", "acpi-mr-restore", "false" },
     { "virtio-device", "use-disabled-flag", "false" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
 
 GlobalProperty hw_compat_4_1[] = {
     { "virtio-pci", "x-pcie-flr-init", "off" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_4_1_len = G_N_ELEMENTS(hw_compat_4_1);
 
@@ -113,6 +119,7 @@ GlobalProperty hw_compat_4_0[] = {
     { "virtio-balloon-device", "qemu-4-0-config-size", "true" },
     { "pl031", "migrate-tick-offset", "false" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_4_0_len = G_N_ELEMENTS(hw_compat_4_0);
 
@@ -131,11 +138,13 @@ GlobalProperty hw_compat_3_1[] = {
     { "virtio-balloon-device", "qemu-4-0-config-size", "false" },
     { "pcie-root-port-base", "disable-acs", "true" }, /* Added in 4.1 */
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_3_1_len = G_N_ELEMENTS(hw_compat_3_1);
 
 GlobalProperty hw_compat_3_0[] = {
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_3_0_len = G_N_ELEMENTS(hw_compat_3_0);
 
@@ -147,6 +156,7 @@ GlobalProperty hw_compat_2_12[] = {
     { "vmware-svga", "global-vmstate", "true" },
     { "qxl-vga", "global-vmstate", "true" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_12_len = G_N_ELEMENTS(hw_compat_2_12);
 
@@ -156,6 +166,7 @@ GlobalProperty hw_compat_2_11[] = {
     { "vhost-user-blk-pci", "vectors", "2" },
     { "e1000", "migrate_tso_props", "off" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_11_len = G_N_ELEMENTS(hw_compat_2_11);
 
@@ -163,6 +174,7 @@ GlobalProperty hw_compat_2_10[] = {
     { "virtio-mouse-device", "wheel-axis", "false" },
     { "virtio-tablet-device", "wheel-axis", "false" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_10_len = G_N_ELEMENTS(hw_compat_2_10);
 
@@ -172,6 +184,7 @@ GlobalProperty hw_compat_2_9[] = {
     { "virtio-net-device", "x-mtu-bypass-backend", "off" },
     { "pcie-root-port", "x-migrate-msix", "false" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_9_len = G_N_ELEMENTS(hw_compat_2_9);
 
@@ -187,6 +200,7 @@ GlobalProperty hw_compat_2_8[] = {
     { "cirrus-vga", "vgamem_mb", "8" },
     { "isa-cirrus-vga", "vgamem_mb", "8" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_8_len = G_N_ELEMENTS(hw_compat_2_8);
 
@@ -197,6 +211,7 @@ GlobalProperty hw_compat_2_7[] = {
     { "intel-iommu", "x-buggy-eim", "true" },
     { "virtio-pci", "x-ignore-backend-features", "on" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_7_len = G_N_ELEMENTS(hw_compat_2_7);
 
@@ -206,6 +221,7 @@ GlobalProperty hw_compat_2_6[] = {
     { "virtio-pci", "disable-modern", "on",  .optional = true },
     { "virtio-pci", "disable-legacy", "off", .optional = true },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_6_len = G_N_ELEMENTS(hw_compat_2_6);
 
@@ -216,6 +232,7 @@ GlobalProperty hw_compat_2_5[] = {
     { "vmxnet3", "x-old-msi-offsets", "on" },
     { "vmxnet3", "x-disable-pcie", "on" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_5_len = G_N_ELEMENTS(hw_compat_2_5);
 
@@ -224,6 +241,7 @@ GlobalProperty hw_compat_2_4[] = {
     { "virtio-blk-device", "scsi", "true", .optional = true },
     { "e1000", "extra_mac_registers", "off" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
     { "virtio-pci", "x-disable-pcie", "on" },
     { "virtio-pci", "migrate-extra", "off" },
     { "fw_cfg_mem", "dma_enabled", "off" },
@@ -242,11 +260,13 @@ GlobalProperty hw_compat_2_3[] = {
     { "migration", "send-section-footer", "off" },
     { "migration", "store-global-state", "off" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_3_len = G_N_ELEMENTS(hw_compat_2_3);
 
 GlobalProperty hw_compat_2_2[] = {
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_2_len = G_N_ELEMENTS(hw_compat_2_2);
 
@@ -259,6 +279,7 @@ GlobalProperty hw_compat_2_1[] = {
     { "usb-kbd", "usb_version", "1" },
     { "virtio-pci", "virtio-pci-bus-master-bug-migration", "on" },
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_2_1_len = G_N_ELEMENTS(hw_compat_2_1);
 
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index a8a77eca95..ac96f7665a 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -35,6 +35,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/tap.h"
 #include "qemu/module.h"
@@ -79,7 +80,7 @@ struct E1000EState {
     bool disable_vnet;
 
     E1000ECore core;
-
+    bool init_vet;
 };
 
 #define E1000E_MMIO_IDX     0
@@ -527,6 +528,10 @@ static void e1000e_qdev_reset(DeviceState *dev)
     trace_e1000e_cb_qdev_reset();
 
     e1000e_core_reset(&s->core);
+
+    if (s->init_vet) {
+        s->core.mac[VET] = ETH_P_VLAN;
+    }
 }
 
 static int e1000e_pre_save(void *opaque)
@@ -666,6 +671,7 @@ static Property e1000e_properties[] = {
                         e1000e_prop_subsys_ven, uint16_t),
     DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
                         e1000e_prop_subsys, uint16_t),
+    DEFINE_PROP_BOOL("init-vet", E1000EState, init_vet, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b75f2ab8fc..b4bf4ca2f1 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -731,7 +731,7 @@ e1000e_process_tx_desc(E1000ECore *core,
             if (e1000x_vlan_enabled(core->mac) &&
                 e1000x_is_vlan_txd(txd_lower)) {
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt,
-                    le16_to_cpu(dp->upper.fields.special), core->vet);
+                    le16_to_cpu(dp->upper.fields.special), core->mac[VET]);
             }
             if (e1000e_tx_pkt_send(core, tx, queue_index)) {
                 e1000e_on_tx_done_update_stats(core, tx->tx_pkt);
@@ -1012,7 +1012,7 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 {
     uint32_t rctl = core->mac[RCTL];
 
-    if (e1000x_is_vlan_packet(buf, core->vet) &&
+    if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
         e1000x_vlan_rx_filter_enabled(core->mac)) {
         uint16_t vid = lduw_be_p(buf + 14);
         uint32_t vfta = ldl_le_p((uint32_t *)(core->mac + VFTA) +
@@ -1686,7 +1686,7 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     }
 
     net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac), core->vet);
+                               e1000x_vlan_enabled(core->mac), core->mac[VET]);
 
     e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
     e1000e_rx_ring_init(core, &rxr, rss_info.queue);
@@ -2397,8 +2397,7 @@ static void
 e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
 {
     core->mac[VET] = val & 0xffff;
-    core->vet = le16_to_cpu(core->mac[VET]);
-    trace_e1000e_vlan_vet(core->vet);
+    trace_e1000e_vlan_vet(core->mac[VET]);
 }
 
 static void
-- 
2.25.1


