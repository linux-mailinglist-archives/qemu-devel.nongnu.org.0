Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4983DCFC9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:37:25 +0200 (CEST)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPhc-0002BH-UM
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeP-0004Uj-DR
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeN-00084q-Ms
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627878843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNTUmMHN/IB3QV167fIw72CwbwoA/mcTYnh+rj9MlTA=;
 b=Uuhhj0pozcFS79dtpuokMbqnFIb2XYWQdRNBjrgsmXIlZIUVV11BOEAW/BEZ/vCerjAFqu
 uoma4uJp91GBc8PKSXe8Ka3793h+wO6FNslT5Y3pch5Nc6jZaSzfCnHt8jN0GaMsAaSm2j
 wfrfvmMzgsUgvA5o2UDT0ScTOdkVxCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-1NR8xi5QNmWhR6VSJRrjzQ-1; Mon, 02 Aug 2021 00:34:01 -0400
X-MC-Unique: 1NR8xi5QNmWhR6VSJRrjzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51F4510066E5;
 Mon,  2 Aug 2021 04:34:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-135.pek2.redhat.com
 [10.72.12.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC34544F1;
 Mon,  2 Aug 2021 04:33:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 3/5] hw/net: e1000: Correct the initial value of VET register
Date: Mon,  2 Aug 2021 12:33:42 +0800
Message-Id: <20210802043344.44301-4-jasowang@redhat.com>
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

While Linux e1000 driver always writes VET register to 0x8100, it is
not always the case for everyone. Drivers relying on the reset value
of VET won't be able to transmit and receive VLAN frames in QEMU.

Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Christina Wang <christina.wang@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/core/machine.c |  1 +
 hw/net/e1000.c    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 775add0..f98a797 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -41,6 +41,7 @@ GlobalProperty hw_compat_6_0[] = {
     { "gpex-pcihost", "allow-unmapped-accesses", "false" },
     { "i8042", "extended-state", "false"},
     { "nvme-ns", "eui64-default", "off"},
+    { "e1000", "init-vet", "off" },
 };
 const size_t hw_compat_6_0_len = G_N_ELEMENTS(hw_compat_6_0);
 
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 4f75b44..a30546c 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -29,6 +29,7 @@
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "net/eth.h"
 #include "net/net.h"
 #include "net/checksum.h"
 #include "sysemu/sysemu.h"
@@ -130,10 +131,13 @@ struct E1000State_st {
 #define E1000_FLAG_MIT_BIT 1
 #define E1000_FLAG_MAC_BIT 2
 #define E1000_FLAG_TSO_BIT 3
+#define E1000_FLAG_VET_BIT 4
 #define E1000_FLAG_AUTONEG (1 << E1000_FLAG_AUTONEG_BIT)
 #define E1000_FLAG_MIT (1 << E1000_FLAG_MIT_BIT)
 #define E1000_FLAG_MAC (1 << E1000_FLAG_MAC_BIT)
 #define E1000_FLAG_TSO (1 << E1000_FLAG_TSO_BIT)
+#define E1000_FLAG_VET (1 << E1000_FLAG_VET_BIT)
+
     uint32_t compat_flags;
     bool received_tx_tso;
     bool use_tso_for_migration;
@@ -361,6 +365,13 @@ e1000_autoneg_timer(void *opaque)
     }
 }
 
+static bool e1000_vet_init_need(void *opaque)
+{
+    E1000State *s = opaque;
+
+    return chkflag(VET);
+}
+
 static void e1000_reset(void *opaque)
 {
     E1000State *d = opaque;
@@ -386,6 +397,10 @@ static void e1000_reset(void *opaque)
     }
 
     e1000x_reset_mac_addr(d->nic, d->mac_reg, macaddr);
+
+    if (e1000_vet_init_need(d)) {
+        d->mac_reg[VET] = ETH_P_VLAN;
+    }
 }
 
 static void
@@ -1737,6 +1752,8 @@ static Property e1000_properties[] = {
                     compat_flags, E1000_FLAG_MAC_BIT, true),
     DEFINE_PROP_BIT("migrate_tso_props", E1000State,
                     compat_flags, E1000_FLAG_TSO_BIT, true),
+    DEFINE_PROP_BIT("init-vet", E1000State,
+                    compat_flags, E1000_FLAG_VET_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.7.4


