Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B96A05FE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8kM-0008TL-Mq; Thu, 23 Feb 2023 05:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kK-0008Ny-50
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:40 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kI-0002ml-3A
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 gi3-20020a17090b110300b0023762f642dcso1537992pjb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wug6Iy1NosnQ9gqQ/P6iPpBTYZU2rrUMrqjSH7oT2gw=;
 b=oEp8xxitenjoFcmvSgzc+gdV56T7GdmiKyJh/2pYFJYAgemyQ93Rj1eH3cQCxOdQeT
 6EoS0Y3CTNaIxi/exZdiUCFGGgC72CPNuW0Z99v93wM+6E6J/rs9UfyjTZ/9wL4rUkBv
 RmIYfmw2rYSDLiOLTvKUiFEjLOLntitPR132xLxyGNOrxore820YaLML9wgHH9Cl/3v8
 Ou9k5WTNq2qrXA0Tw2K+0Mv0QzAn4y/7+sylXMBrEoi+4Bky3WARTJLHbV5imXu2kqdz
 eF/eeFqVJl932ir9t5cVr0YilmtCXpU4qwoKBq6nMEw6alUuZR1fbbaUXiiy37dYa5nr
 3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wug6Iy1NosnQ9gqQ/P6iPpBTYZU2rrUMrqjSH7oT2gw=;
 b=h1eZjGLnPRLBBE05U0kSHSGESFT2dRPaiaf30xSnPcO9uHrBCqW0UPAy/JsX8GdVLy
 bS3n4GmB0oCi9EaNTxIBDpBXshtEqS19utNMumBqb3+NEIGjb56xsLYdMvEMmriW9tgt
 uPXalp4kXXO+9W1efyR8iAIbxa7AXyns2nUdvFpao/Wtnhlbaa5gwcHOjIsvWB1RzGEg
 AchNjksfJ7XGGOFyhy8Ce7aqmj6kHxbsWytIqeQS6jApgjl4D1a59IAcoS63e81R19KL
 NdJ+zLSMu+jvvYnEAOm8IUu3BQaL0+kKJRad0nL6LGFyhWN1GLqk3IdBsHfodEKgtFco
 CO7g==
X-Gm-Message-State: AO0yUKUCXei9Mepwg9/uFM6+eFIBwP8KOdnVBb2h6fWEHuJ39aC2EA/s
 G7+cfVy55vpc9X2U8ndOfnH6Ew==
X-Google-Smtp-Source: AK7set/dgss0GcAIO8kNtpDPVrBpRNBf6k2vdyh1TcVy9pk8/jM1JbDEJV1sn644zXc8zomDEfyqtg==
X-Received: by 2002:a17:902:aa07:b0:19c:a6ba:69f6 with SMTP id
 be7-20020a170902aa0700b0019ca6ba69f6mr4307814plb.31.1677147757362; 
 Thu, 23 Feb 2023 02:22:37 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:37 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 34/34] e1000e: Implement system clock
Date: Thu, 23 Feb 2023 19:20:18 +0900
Message-Id: <20230223102018.141748-35-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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

The system clock is necessary to implement PTP features. While we are
not implementing PTP features for e1000e yet, we do have a plan to
implement them for igb, a new network device derived from e1000e,
so add system clock to the common base first.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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
index f73fc4c45c..d438bfcd5b 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,6 +41,7 @@
 #include "hw/virtio/virtio-pci.h"
 
 GlobalProperty hw_compat_7_2[] = {
+    { "e1000e", "migrate-timadj", "off" },
     { "virtio-mem", "x-early-migration", "false" },
 };
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 4545fe25a6..77144cb617 100644
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
index ec274319c4..78c07a8f8e 100644
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
index a2974631ef..e8d466b33e 100644
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
index d0a14b4523..213a70530d 100644
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
index e6387dde53..c497923806 100644
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
index 86a31b69f8..72b744b782 100644
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
2.39.1


