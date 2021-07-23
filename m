Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BE3D35BF
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:56:49 +0200 (CEST)
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6q36-0003sL-Q6
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1m-0002Yv-Gv
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:26 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:40700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m6q1k-0005XH-P1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 03:55:26 -0400
Received: by mail-ed1-x529.google.com with SMTP id r16so630194edt.7
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 00:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqgf+p8MjYrsxaA5gkQkboG6A1tLeznIw1ecyMJgHoA=;
 b=mx7yjzWaHVHLJZRMG1pGMBYwLA/i418wZpDI1q+eocLLcF/lM0UJ4tx4gFFX4mUxzq
 YpilCnCYFeOMwb6bv0uw3hO5s4wtJLLl3ZswxAxJIstPV+YfaUOQKM65Js4fQLguqmiR
 bqcw0PJEU5jPIqMdj8kchAoLDZIOED+jAnBUXTaTnxM77YFyK1t/zYWWserzEjvjRG8z
 9HhBNPEGMN7swteB+n2LHN67CC1OwUiN64tT6oPMQYCDrpub+h9iBhxBniIEdeioiKyy
 9EwvoczFNVV1Y5tFvMe/mim8ISSmymGthxea4xCDcp4M4xiCwNAqOQQoIIDtZV8mopaY
 W6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iqgf+p8MjYrsxaA5gkQkboG6A1tLeznIw1ecyMJgHoA=;
 b=LsJpFe5WALx7W5wVBvv05m6Gj9KWQC5biD1uxiaxdX2BEFGNa8aLc+bAgKbJ5i8X/I
 Za+80hQprsd7Hu4nhjWIzByguX5pv+kdIis0LSeqsrM2RjSDB6Pz8xepc/WOixb1M2ay
 FNjVvDOHG/b0fmHvp4qnntbHqzp3sQlA5Mba8eZRgnMD0Q7bF0xClmx5B4xfJFFXv+AA
 MehS+3Bc4mHhenZ07AEiIB+u+rQIKk609NmE2WRjpAEMW1FUeDKCCT1dsalETCEscnou
 F+j9o5OC+oUVOZX4JCTZq3MS+pBb6OkqOHfpEV5x97zTBrYHp5l1Unjh9X5hgmorKQZm
 mpQw==
X-Gm-Message-State: AOAM532W/117XROMKu7E4HKoUOX68z8p4Ebmsugu3Rokdssk6253UwFN
 dlapZLf2jDms97OzkaHLHR0=
X-Google-Smtp-Source: ABdhPJyEobS2Pzj8hD6yB72tnRFp4h9FSH1KUBIL0I7hPAA4MxpNtZSwGXo94u+qKKaNHNa90wPejQ==
X-Received: by 2002:a05:6402:221c:: with SMTP id
 cq28mr4135416edb.115.1627026922597; 
 Fri, 23 Jul 2021 00:55:22 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id jo19sm10330791ejb.59.2021.07.23.00.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 00:55:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 1/3] hw/net: e1000: Correct the initial value of VET
 register
Date: Fri, 23 Jul 2021 15:55:10 +0800
Message-Id: <20210723075512.84897-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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

While Linux e1000 driver always writes VET register to 0x8100, it is
not always the case for everyone. Drivers relying on the reset value
of VET won't be able to transmit and receive VLAN frames in QEMU.

Reported-by: Markus Carlstedt <markus.carlstedt@windriver.com>
Signed-off-by: Christina Wang <christina.wang@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v4:
- Only keep hw_compat_6_0[] changes
- Use e1000_vet_init_need() instead of touching other flags

Changes in v3:
- add a "init-vet" property for versioned machines

 hw/core/machine.c |  1 +
 hw/net/e1000.c    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 775add0795..f98a797e43 100644
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
index 4f75b44cfc..a30546c5d5 100644
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
2.25.1


