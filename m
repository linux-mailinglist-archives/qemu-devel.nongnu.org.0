Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F2E3B9003
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:49:02 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lytJe-0005Nj-0k
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHL-0001qJ-Mc
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:39 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHJ-0003tK-7M
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id i5so7541567eds.1
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P5hDw/nlIpTS+nKMVatqsFM30wswQxYZ5Vh6WmjDBM4=;
 b=qQxcwIkjdcoWHcr6r7Pc9K2DszHbKhokriViu9Kwsrx2jbk8lqKdgT7KBXRnMB8z3G
 2Lz4ygzSlm/rvztnD4UfrqWkWA2vEK6UPrf8E8LcCYmK/nV6TcYTe0O4zjquACm0d6x3
 Mi2aVQ/O7S9D5Jog/gJb50a1Uy4sH96VK+r2JyNyXhqG/ZmHtlC2/+D4Lj4p3YPsyh66
 ZGc+uxpPXkJUcLcswuzkIf9DgcIjpqqklyesu2yzlvxtLieWhqh4lCHS44EomTNXjO0O
 q74Y7XY9LuF1m5Fz2TfPaeM17tEuiFuaTZtaFKvVIBfT8sjBFSGlPz/jUgqXzeF+4qNs
 BAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P5hDw/nlIpTS+nKMVatqsFM30wswQxYZ5Vh6WmjDBM4=;
 b=XNEY2iq3dQyLFxb4udSPaGcdL8d/7RT7YgOTFNKc78MUWT+tDM6c33E/bfo+SWRH6f
 1rzTr+IPm2F3dcWUjjaYPerX/JobULwmU8UaQjy0awDwAJImk8ZNj7fhy3Xnp1P/HngK
 o4x14KbsUoUAiwbJW0FdBnOdFZgKiwNZ38F88gv1+rYBH1yWvHFv7lroa6gxCs1ivEvM
 5UItN5TUiyvyAYlvad5EttUCcnk/VesCetNnxmMEnzHU2FlAw6ML9MqXheO+Vgh1DjZL
 jTvU2hpuEPrJRBU5fZwfcxAEAVXBH/xO8k5HH46N9/u/cNMq7zekiQ0IEcE8hN3DRNy1
 La4w==
X-Gm-Message-State: AOAM531X8lnkRLrT14tTjeTUt5kLCK5jn/izwi3W0U8awlhkwsLLesjv
 Hhk93f98T5kLt7R8QxYz6mw=
X-Google-Smtp-Source: ABdhPJyN8972ADi5vjv5nf+wPoVqyqMLzjA/m+QNbgcIdpHE4e08A/FEz3m61rNLDCH4Gq2sq86AQw==
X-Received: by 2002:aa7:cb43:: with SMTP id w3mr54692017edt.126.1625132795676; 
 Thu, 01 Jul 2021 02:46:35 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d25sm14467479edu.83.2021.07.01.02.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:46:35 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/net: e1000e: Correct the initial value of VET register
Date: Thu,  1 Jul 2021 17:46:50 +0800
Message-Id: <20210701094651.1258613-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701094651.1258613-1-bmeng.cn@gmail.com>
References: <20210701094651.1258613-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/e1000e_core.h |  2 --
 hw/net/e1000e.c      |  6 ++----
 hw/net/e1000e_core.c | 11 ++++++-----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/net/e1000e_core.h b/hw/net/e1000e_core.h
index 4ddb4d2c39..07d722bc68 100644
--- a/hw/net/e1000e_core.h
+++ b/hw/net/e1000e_core.h
@@ -105,8 +105,6 @@ struct E1000Core {
     uint32_t itr_guest_value;
     uint32_t eitr_guest_value[E1000E_MSIX_VEC_NUM];
 
-    uint16_t vet;
-
     uint8_t permanent_mac[ETH_ALEN];
 
     NICState *owner_nic;
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index a8a77eca95..1797e4a7cb 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -602,8 +602,8 @@ static const VMStateDescription e1000e_vmstate_intr_timer = {
 
 static const VMStateDescription e1000e_vmstate = {
     .name = "e1000e",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .pre_save = e1000e_pre_save,
     .post_load = e1000e_post_load,
     .fields = (VMStateField[]) {
@@ -645,8 +645,6 @@ static const VMStateDescription e1000e_vmstate = {
         VMSTATE_UINT32_ARRAY(core.eitr_guest_value, E1000EState,
                              E1000E_MSIX_VEC_NUM),
 
-        VMSTATE_UINT16(core.vet, E1000EState),
-
         VMSTATE_STRUCT_ARRAY(core.tx, E1000EState, E1000E_NUM_QUEUES, 0,
                              e1000e_vmstate_tx, struct e1000e_tx),
         VMSTATE_END_OF_LIST()
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index b75f2ab8fc..38b3e3b784 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -35,6 +35,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/tap.h"
 #include "hw/pci/msi.h"
@@ -731,7 +732,7 @@ e1000e_process_tx_desc(E1000ECore *core,
             if (e1000x_vlan_enabled(core->mac) &&
                 e1000x_is_vlan_txd(txd_lower)) {
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt,
-                    le16_to_cpu(dp->upper.fields.special), core->vet);
+                    le16_to_cpu(dp->upper.fields.special), core->mac[VET]);
             }
             if (e1000e_tx_pkt_send(core, tx, queue_index)) {
                 e1000e_on_tx_done_update_stats(core, tx->tx_pkt);
@@ -1012,7 +1013,7 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 {
     uint32_t rctl = core->mac[RCTL];
 
-    if (e1000x_is_vlan_packet(buf, core->vet) &&
+    if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
         e1000x_vlan_rx_filter_enabled(core->mac)) {
         uint16_t vid = lduw_be_p(buf + 14);
         uint32_t vfta = ldl_le_p((uint32_t *)(core->mac + VFTA) +
@@ -1686,7 +1687,7 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     }
 
     net_rx_pkt_attach_iovec_ex(core->rx_pkt, iov, iovcnt, iov_ofs,
-                               e1000x_vlan_enabled(core->mac), core->vet);
+                               e1000x_vlan_enabled(core->mac), core->mac[VET]);
 
     e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
     e1000e_rx_ring_init(core, &rxr, rss_info.queue);
@@ -2397,8 +2398,7 @@ static void
 e1000e_set_vet(E1000ECore *core, int index, uint32_t val)
 {
     core->mac[VET] = val & 0xffff;
-    core->vet = le16_to_cpu(core->mac[VET]);
-    trace_e1000e_vlan_vet(core->vet);
+    trace_e1000e_vlan_vet(core->mac[VET]);
 }
 
 static void
@@ -3442,6 +3442,7 @@ static const uint32_t e1000e_mac_reg_init[] = {
     [RXCSUM]        = E1000_RXCSUM_IPOFLD | E1000_RXCSUM_TUOFLD,
     [ITR]           = E1000E_MIN_XITR,
     [EITR...EITR + E1000E_MSIX_VEC_NUM - 1] = E1000E_MIN_XITR,
+    [VET]           = ETH_P_VLAN,
 };
 
 void
-- 
2.25.1


