Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9A26B3AE2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:40:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZBb-00068z-Of; Fri, 10 Mar 2023 04:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBZ-0005to-5u
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZBS-0008UV-6t
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678441025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DnwKWdLogS7H0nk5WdOn7NL96qRnl9CWMuMHp91P60=;
 b=FvpuwL315mvImnBPLqdxh4yCN5o3XuHNyHMCXWOPACD6Uz3jjcL4XIwnpNbulZhypCejaM
 82dSCLcWOmqGxfqDTTu1vMY/B6gBEzX4B0ZOxJhOjkeY4LXvD6+OhklZaNYhqQfunMzY3N
 RuW4qCJybw4UMIOMpGFCBMn4OoiMtpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-ODsJ0pLWOY2PQ22xIAkB-g-1; Fri, 10 Mar 2023 04:37:02 -0500
X-MC-Unique: ODsJ0pLWOY2PQ22xIAkB-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1177F80D0F2;
 Fri, 10 Mar 2023 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE6FA410B317;
 Fri, 10 Mar 2023 09:36:59 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 34/44] e1000e: Implement system clock
Date: Fri, 10 Mar 2023 17:35:16 +0800
Message-Id: <20230310093526.30828-35-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The system clock is necessary to implement PTP features. While we are
not implementing PTP features for e1000e yet, we do have a plan to
implement them for igb, a new network device derived from e1000e,
so add system clock to the common base first.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c      |  1 +
 hw/net/e1000_regs.h    | 27 +++++++++++++++++++++++++++
 hw/net/e1000e.c        | 11 +++++++++++
 hw/net/e1000e_core.c   | 39 ++++++++++++++++++++++++++++++++++-----
 hw/net/e1000e_core.h   |  2 ++
 hw/net/e1000x_common.c | 25 +++++++++++++++++++++++++
 hw/net/e1000x_common.h |  3 +++
 7 files changed, 103 insertions(+), 5 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1cf6822..45e3d24 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -40,6 +40,7 @@
 #include "hw/virtio/virtio-pci.h"
 
 GlobalProperty hw_compat_7_2[] = {
+    { "e1000e", "migrate-timadj", "off" },
     { "virtio-mem", "x-early-migration", "false" },
 };
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 4545fe2..77144cb 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -908,6 +908,33 @@
 #define E1000_EEPROM_CFG_DONE         0x00040000   /* MNG config cycle done */
 #define E1000_EEPROM_CFG_DONE_PORT_1  0x00080000   /* ...for second port */
 
+/* HH Time Sync */
+#define E1000_TSYNCTXCTL_MAX_ALLOWED_DLY_MASK 0x0000F000 /* max delay */
+#define E1000_TSYNCTXCTL_SYNC_COMP            0x40000000 /* sync complete */
+#define E1000_TSYNCTXCTL_START_SYNC           0x80000000 /* initiate sync */
+
+#define E1000_TSYNCTXCTL_VALID                0x00000001 /* Tx timestamp valid */
+#define E1000_TSYNCTXCTL_ENABLED              0x00000010 /* enable Tx timestamping */
+
+#define E1000_TSYNCRXCTL_VALID                0x00000001 /* Rx timestamp valid */
+#define E1000_TSYNCRXCTL_TYPE_MASK            0x0000000E /* Rx type mask */
+#define E1000_TSYNCRXCTL_TYPE_L2_V2           0x00
+#define E1000_TSYNCRXCTL_TYPE_L4_V1           0x02
+#define E1000_TSYNCRXCTL_TYPE_L2_L4_V2        0x04
+#define E1000_TSYNCRXCTL_TYPE_ALL             0x08
+#define E1000_TSYNCRXCTL_TYPE_EVENT_V2        0x0A
+#define E1000_TSYNCRXCTL_ENABLED              0x00000010 /* enable Rx timestamping */
+#define E1000_TSYNCRXCTL_SYSCFI               0x00000020 /* Sys clock frequency */
+
+#define E1000_RXMTRL_PTP_V1_SYNC_MESSAGE      0x00000000
+#define E1000_RXMTRL_PTP_V1_DELAY_REQ_MESSAGE 0x00010000
+
+#define E1000_RXMTRL_PTP_V2_SYNC_MESSAGE      0x00000000
+#define E1000_RXMTRL_PTP_V2_DELAY_REQ_MESSAGE 0x01000000
+
+#define E1000_TIMINCA_INCPERIOD_SHIFT         24
+#define E1000_TIMINCA_INCVALUE_MASK           0x00FFFFFF
+
 /* PCI Express Control */
 /* 3GIO Control Register - GCR (0x05B00; RW) */
 #define E1000_L0S_ADJUST              (1 << 9)
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index ec27431..78c07a8 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -82,6 +82,7 @@ struct E1000EState {
 
     E1000ECore core;
     bool init_vet;
+    bool timadj;
 };
 
 #define E1000E_MMIO_IDX     0
@@ -554,6 +555,12 @@ static int e1000e_post_load(void *opaque, int version_id)
     return e1000e_core_post_load(&s->core);
 }
 
+static bool e1000e_migrate_timadj(void *opaque, int version_id)
+{
+    E1000EState *s = opaque;
+    return s->timadj;
+}
+
 static const VMStateDescription e1000e_vmstate_tx = {
     .name = "e1000e-tx",
     .version_id = 1,
@@ -645,6 +652,9 @@ static const VMStateDescription e1000e_vmstate = {
 
         VMSTATE_STRUCT_ARRAY(core.tx, E1000EState, E1000E_NUM_QUEUES, 0,
                              e1000e_vmstate_tx, struct e1000e_tx),
+
+        VMSTATE_INT64_TEST(core.timadj, E1000EState, e1000e_migrate_timadj),
+
         VMSTATE_END_OF_LIST()
     }
 };
@@ -663,6 +673,7 @@ static Property e1000e_properties[] = {
     DEFINE_PROP_SIGNED("subsys", E1000EState, subsys, 0,
                         e1000e_prop_subsys, uint16_t),
     DEFINE_PROP_BOOL("init-vet", E1000EState, init_vet, true),
+    DEFINE_PROP_BOOL("migrate-timadj", E1000EState, timadj, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index a297463..e8d466b 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -2902,6 +2902,35 @@ e1000e_set_gcr(E1000ECore *core, int index, uint32_t val)
     core->mac[GCR] = (val & ~E1000_GCR_RO_BITS) | ro_bits;
 }
 
+static uint32_t e1000e_get_systiml(E1000ECore *core, int index)
+{
+    e1000x_timestamp(core->mac, core->timadj, SYSTIML, SYSTIMH);
+    return core->mac[SYSTIML];
+}
+
+static uint32_t e1000e_get_rxsatrh(E1000ECore *core, int index)
+{
+    core->mac[TSYNCRXCTL] &= ~E1000_TSYNCRXCTL_VALID;
+    return core->mac[RXSATRH];
+}
+
+static uint32_t e1000e_get_txstmph(E1000ECore *core, int index)
+{
+    core->mac[TSYNCTXCTL] &= ~E1000_TSYNCTXCTL_VALID;
+    return core->mac[TXSTMPH];
+}
+
+static void e1000e_set_timinca(E1000ECore *core, int index, uint32_t val)
+{
+    e1000x_set_timinca(core->mac, &core->timadj, val);
+}
+
+static void e1000e_set_timadjh(E1000ECore *core, int index, uint32_t val)
+{
+    core->mac[TIMADJH] = val;
+    core->timadj += core->mac[TIMADJL] | ((int64_t)core->mac[TIMADJH] << 32);
+}
+
 #define e1000e_getreg(x)    [x] = e1000e_mac_readreg
 typedef uint32_t (*readops)(E1000ECore *, int);
 static const readops e1000e_macreg_readops[] = {
@@ -2957,7 +2986,6 @@ static const readops e1000e_macreg_readops[] = {
     e1000e_getreg(GSCL_2),
     e1000e_getreg(RDBAH1),
     e1000e_getreg(FLSWDATA),
-    e1000e_getreg(RXSATRH),
     e1000e_getreg(TIPG),
     e1000e_getreg(FLMNGCTL),
     e1000e_getreg(FLMNGCNT),
@@ -2998,7 +3026,6 @@ static const readops e1000e_macreg_readops[] = {
     e1000e_getreg(FLSWCTL),
     e1000e_getreg(RXDCTL1),
     e1000e_getreg(RXSATRL),
-    e1000e_getreg(SYSTIML),
     e1000e_getreg(RXUDP),
     e1000e_getreg(TORL),
     e1000e_getreg(TDLEN1),
@@ -3038,7 +3065,6 @@ static const readops e1000e_macreg_readops[] = {
     e1000e_getreg(FLOL),
     e1000e_getreg(RXDCTL),
     e1000e_getreg(RXSTMPL),
-    e1000e_getreg(TXSTMPH),
     e1000e_getreg(TIMADJH),
     e1000e_getreg(FCRTL),
     e1000e_getreg(TDBAH),
@@ -3087,6 +3113,9 @@ static const readops e1000e_macreg_readops[] = {
     [TARC1]   = e1000e_get_tarc,
     [SWSM]    = e1000e_mac_swsm_read,
     [IMS]     = e1000e_mac_ims_read,
+    [SYSTIML] = e1000e_get_systiml,
+    [RXSATRH] = e1000e_get_rxsatrh,
+    [TXSTMPH] = e1000e_get_txstmph,
 
     [CRCERRS ... MPC]      = e1000e_mac_readreg,
     [IP6AT ... IP6AT + 3]  = e1000e_mac_readreg,
@@ -3125,7 +3154,6 @@ static const writeops e1000e_macreg_writeops[] = {
     e1000e_putreg(WUS),
     e1000e_putreg(IPAV),
     e1000e_putreg(TDBAH1),
-    e1000e_putreg(TIMINCA),
     e1000e_putreg(IAM),
     e1000e_putreg(EIAC),
     e1000e_putreg(IVAR),
@@ -3168,7 +3196,6 @@ static const writeops e1000e_macreg_writeops[] = {
     e1000e_putreg(SYSTIML),
     e1000e_putreg(SYSTIMH),
     e1000e_putreg(TIMADJL),
-    e1000e_putreg(TIMADJH),
     e1000e_putreg(RXUDP),
     e1000e_putreg(RXCFGL),
     e1000e_putreg(TSYNCRXCTL),
@@ -3241,6 +3268,8 @@ static const writeops e1000e_macreg_writeops[] = {
     [CTRL_DUP] = e1000e_set_ctrl,
     [RFCTL]    = e1000e_set_rfctl,
     [RA + 1]   = e1000e_mac_setmacaddr,
+    [TIMINCA]  = e1000e_set_timinca,
+    [TIMADJH]  = e1000e_set_timadjh,
 
     [IP6AT ... IP6AT + 3]    = e1000e_mac_writereg,
     [IP4AT ... IP4AT + 6]    = e1000e_mac_writereg,
diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index d0a14b4..213a705 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -112,6 +112,8 @@ struct E1000Core {
     void (*owner_start_recv)(PCIDevice *d);
 
     uint32_t msi_causes_pending;
+
+    int64_t timadj;
 };
 
 void
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index e6387dd..c497923 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -267,3 +267,28 @@ e1000x_read_tx_ctx_descr(struct e1000_context_desc *d,
     props->tcp = (op & E1000_TXD_CMD_TCP) ? 1 : 0;
     props->tse = (op & E1000_TXD_CMD_TSE) ? 1 : 0;
 }
+
+void e1000x_timestamp(uint32_t *mac, int64_t timadj, size_t lo, size_t hi)
+{
+    int64_t ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint32_t timinca = mac[TIMINCA];
+    uint32_t incvalue = timinca & E1000_TIMINCA_INCVALUE_MASK;
+    uint32_t incperiod = MAX(timinca >> E1000_TIMINCA_INCPERIOD_SHIFT, 1);
+    int64_t timestamp = timadj + muldiv64(ns, incvalue, incperiod * 16);
+
+    mac[lo] = timestamp & 0xffffffff;
+    mac[hi] = timestamp >> 32;
+}
+
+void e1000x_set_timinca(uint32_t *mac, int64_t *timadj, uint32_t val)
+{
+    int64_t ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    uint32_t old_val = mac[TIMINCA];
+    uint32_t old_incvalue = old_val & E1000_TIMINCA_INCVALUE_MASK;
+    uint32_t old_incperiod = MAX(old_val >> E1000_TIMINCA_INCPERIOD_SHIFT, 1);
+    uint32_t incvalue = val & E1000_TIMINCA_INCVALUE_MASK;
+    uint32_t incperiod = MAX(val >> E1000_TIMINCA_INCPERIOD_SHIFT, 1);
+
+    mac[TIMINCA] = val;
+    *timadj += (muldiv64(ns, incvalue, incperiod) - muldiv64(ns, old_incvalue, old_incperiod)) / 16;
+}
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 86a31b6..72b744b 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -213,4 +213,7 @@ typedef struct e1000x_txd_props {
 void e1000x_read_tx_ctx_descr(struct e1000_context_desc *d,
                               e1000x_txd_props *props);
 
+void e1000x_timestamp(uint32_t *mac, int64_t timadj, size_t lo, size_t hi);
+void e1000x_set_timinca(uint32_t *mac, int64_t *timadj, uint32_t val);
+
 #endif
-- 
2.7.4


