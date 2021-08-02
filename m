Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3676F3DCFCB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:37:36 +0200 (CEST)
Received: from localhost ([::1]:39888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPhn-0002l5-8R
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeS-0004ec-7E
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeQ-00087B-BM
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627878845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8hTmvS9uBMIyOGRbt2awNkoFr0/LmnnsB1s+rwROHTI=;
 b=ThoBl/N3N/pzj3LDsFOfTa4U0fogOQuusiKq3OOstKeO3Mg6f3APa6QR/Hi+94arX/2q2U
 2N34NHEbjkcVSfJJ+k/uRphsUbWcee6KPBUsGr31hRIa9bv3xlT4e1K6ygMggQaJ2abCEz
 ODe5jiTAKGisyVDz3bUgMaA88YG3nK0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-1HQyGJ17OCSl77j_HXwQtQ-1; Mon, 02 Aug 2021 00:34:04 -0400
X-MC-Unique: 1HQyGJ17OCSl77j_HXwQtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 423A2801AC0;
 Mon,  2 Aug 2021 04:34:03 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-135.pek2.redhat.com
 [10.72.12.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8D2D6A902;
 Mon,  2 Aug 2021 04:34:00 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 4/5] hw/net: e1000e: Correct the initial value of VET register
Date: Mon,  2 Aug 2021 12:33:43 +0800
Message-Id: <20210802043344.44301-5-jasowang@redhat.com>
In-Reply-To: <20210802043344.44301-1-jasowang@redhat.com>
References: <20210802043344.44301-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, Jason Wang <jasowang@redhat.com>,
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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c    | 1 +
 hw/net/e1000e.c      | 8 +++++++-
 hw/net/e1000e_core.c | 9 ++++-----
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index f98a797..943974d 100644
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
index a8a77ec..ac96f76 100644
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
index b75f2ab..b4bf4ca 100644
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
2.7.4


