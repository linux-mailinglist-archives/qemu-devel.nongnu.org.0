Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA263B9E3A
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:28:39 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFTS-0001pr-RO
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFP8-0003ik-6C
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:10 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFP4-00017R-Ib
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:09 -0400
Received: by mail-ej1-x62c.google.com with SMTP id c17so15054054ejk.13
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lhvexZKKgTwhKHCe4TQ9fT8j+lx0QJ3P18QosG607Xc=;
 b=qDZHFXR6b2HS3GARlIaW/erSkhOz5DiRf18GCHymC/AC7lvgtXLkE249PXLGoXfgGC
 X8f1zONAkhjqwBNUpeESGTiLK9XT9TSzTVP6+knYAWeYgKO2RuMoyLilfNKVwrokpBge
 hbGLZlHwoXDjhN9ZbIWcFBlWKnXSncJ3fz9CxfNJS+rk3uBgFGUBWpU+1axhJMpYc8zL
 rGn1JamXRY4X28CxoXHyS1kbvjBS1oE86gAlMnjmWDgg+70m3JJnbM1+Pt0dGsQztsIT
 TBs0AisCslY8EhvEp5SZLfiq6z2JwgZDcWvfawo/2aEBWXOV+cKA3B6NX4QMY59BEK/Z
 iAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lhvexZKKgTwhKHCe4TQ9fT8j+lx0QJ3P18QosG607Xc=;
 b=arkGEJnz1s7E3YrYl+V00G+nCoqamRlXjnYc5ITTDcxMwhfiRHF2MRO6YckroarHuY
 G9n4CGfnQFCuvokrIfT+roYQhjIXWwe6lvwGtsntkW2lKEPTV3AmLKrGddj9G/7FjjF5
 L3Smbwoz4AaD7jMBbrtf01XPYzp8fQgbKS4wjj4NgXR8t4YiMkH7rErZUKltA1k7Wswp
 pbpTedUK6NL39NguNEeiiWU++5vK74zzNEUOl+rsorbxji4zUswtVk7DOSvV1ykpeSuj
 4hfPWxK1dZ+jqlWeQVAAFMjmsuwh8qL+jAa+ma8LyiS1ZzRAHTL3rBrsmWxv7jM3381q
 eq0Q==
X-Gm-Message-State: AOAM530XIAo2BmnYoaoxDo5U/qkFDooKDRWdHZ9jqZtlGLR9RDqHPFLm
 WGo/vGcMbVF7MESbfcuwCyo=
X-Google-Smtp-Source: ABdhPJyEfy7yCFqvBiZNxieJ8/gz+uT/9HWy5BL0RXT2eI3pF/vwA0yLuo/j4HahVjXBEtS1fLJvdg==
X-Received: by 2002:a17:906:d1d5:: with SMTP id
 bs21mr4379673ejb.378.1625217845086; 
 Fri, 02 Jul 2021 02:24:05 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id c18sm1035623edt.18.2021.07.02.02.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:04 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] hw/net: e1000e: Correct the initial value of VET
 register
Date: Fri,  2 Jul 2021 17:24:26 +0800
Message-Id: <20210702092427.1323667-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210702092427.1323667-1-bmeng.cn@gmail.com>
References: <20210702092427.1323667-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
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

Changes in v2:
- keep the 'vet' field in "struct E1000Core" for migration compatibility

 hw/net/e1000e_core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

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


