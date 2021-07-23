Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 243883D35C5
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:58:06 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6q4L-0006BM-7L
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1q-0002bH-JP
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:30 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1o-0005ab-Rv
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:30 -0400
Received: by mail-ej1-x632.google.com with SMTP id he41so2395748ejc.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQQmhAGAzdnqhbClBos+MqQMVmkZ9th8hg1hioKK738=;
 b=GcRdJbfbyaiA1Xs4ghvcEinnmfm/5VkabghFeRXNmL6zARkZPNqbhtiL3kmIq2gdHu
 peUYxmlFkKBFt8Ivpabm7CVqjWDyD83HVAhBhta6wR5vsJRq7O0ROmSb3+WidC62dFyE
 qyl7FbT7/cBVwtZrfAq5u/AtgXR+Qt4Dt5UeRjpHtp/hJUQXZxig8NUciAwLLnkSCzba
 VbAqgRTn8Li8Lf0Hd0SP4m5h9cCFiKf6n3dt590ZgplY8RIBN7S+SfwpflEx7008zCZk
 O9wtbtpnVj3RWtYlcVKBibK7nrgruyACI7AXMIA0lRlU0gRKXYH4eZQtTkGsUM7DHktE
 TZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQQmhAGAzdnqhbClBos+MqQMVmkZ9th8hg1hioKK738=;
 b=mAGdOMWakTTXlDN2cNvYO5NMfXdrgwm55utqMCg1xXoj1IKG2JvCR3MO0pmhL6piGP
 fSooAW4jX6IO0NY+DA/VTNThGSDdVnZl+LRHdZcpbECj6zpQ0AXjOPtPR57OFgc+zIUE
 YSrPdeCggsSZdtINrfsztTx0jiswxq03dFj5QctINF9J8Z/jOzgVYf614C61yj3zFbUu
 Y7pln+ygnkZLy73DT03PSI59Cag7VwGZCzi79Px6xatcpbfETPjHOkUfcsnUSJL1lhTq
 ZL+k2AO8ZxcD5CNLDK4JLIdE7R3WSFo9qVZl4n2dT2mHPmBOpekaur5KcThuUbRvF8fu
 hGuQ==
X-Gm-Message-State: AOAM530gC0UKfVh+Q4723TJ/C+57M4z+ny6dKbrdPKYsoWCy1pCS4jIG
 EEjcBEzJyvXSXf8DJ8XH2Zw=
X-Google-Smtp-Source: ABdhPJyUF6qB3qXKwvm+pBUDfk+thL6mcofiMawqg4JLnZ0cpARZBOlzl093LJqlognvzHORmGwi3Q==
X-Received: by 2002:a17:906:546:: with SMTP id k6mr3489802eja.53.1627026926695; 
 Fri, 23 Jul 2021 00:55:26 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jo19sm10330791ejb.59.2021.07.23.00.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:55:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 2/3] hw/net: e1000e: Correct the initial value of VET
 register
Date: Fri, 23 Jul 2021 15:55:11 +0800
Message-Id: <20210723075512.84897-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723075512.84897-1-bmeng.cn@gmail.com>
References: <20210723075512.84897-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x632.google.com
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

Changes in v4:
- Only keep hw_compat_6_0[] changes

Changes in v3:
- add a "init-vet" property for versioned machines

Changes in v2:
- keep the 'vet' field in "struct E1000Core" for migration compatibility

 hw/core/machine.c    | 1 +
 hw/net/e1000e.c      | 8 +++++++-
 hw/net/e1000e_core.c | 9 ++++-----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f98a797e43..943974d411 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -42,6 +42,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "i8042", "extended-state", "false"},
     { "nvme-ns", "eui64-default", "off"},
     { "e1000", "init-vet", "off" },
+    { "e1000e", "init-vet", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
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


