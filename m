Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9084A3B9001
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 11:48:06 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lytIj-00032y-Hk
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 05:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHI-0001q6-6i
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:37 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lytHF-0003rA-Hw
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 05:46:35 -0400
Received: by mail-ej1-x630.google.com with SMTP id yy20so9394374ejb.6
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 02:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orPQeS2G48u2gt6v14DWfmBn75seg7vljGHtmw7pNGU=;
 b=OgtgRcKLIpvDTL/DmdC0by+Va+c/lOtXjMQXiixN7PZGHOb6ASC8HmCaRAbyOpi9Op
 paNau54I/js1C/t0Lx75IzzqAY6cEm8ov53x+X2pw8Ef2ex+ZfW1oWKtruf4uSumGJN4
 ptdUyYHbFJWpQtR0G86O3TYJKPddKSBMVOufTiLcC/xxdLjbqZskDvRpPX3AHFnxZAYq
 M3uqB522OLQ1zPip9vrjLaD20ONECMKmpI7U9T9C2H5tX/Dn89WsRgVacEheK+I3I943
 UwrKDSODnT1GKb7ga/Lt7T39jEmeo6tz4LMVyzimKdd3KdjeDI6ixo178oojh4UW8Ndd
 +U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=orPQeS2G48u2gt6v14DWfmBn75seg7vljGHtmw7pNGU=;
 b=OyQ52lp1x4fM0Iax5sOhQbqknW4U3O8VvbllJYm6Zm/9rSvDA33amysQgGe7ysi6pE
 GfFmLoWLgUihjx+p4Yc0uUOx7IzJiuKkl+BAOfFHkIqgvACKLnoNaX2xfqSbBcRq+pEH
 XXz30GkYc/F2TIzoMAIxSGdLdq7VUolzN5R0xV8TRol0AE2VmdEEwci8D4bbtsEFF/nD
 k5WIWMYKV0mNsi6XzVo68/OQaB6Q7P3CXch5gPbvzS9gSNoDy0RxVJW70F4mXlF1i9j8
 Hu2g/+dYHKVeqiT3cwIg6MlyJQvMDkw/RKVDMM/G+m8WWGfPFV8toULq4x1KZy4pFuIA
 LLfg==
X-Gm-Message-State: AOAM532Wi7n6mH3KP3i5+OL7BD9YLdHxrkpWMfqU17Z9KgKOneiVX8/7
 BMlw9aD3ZXRRdRMrjh8fm8k=
X-Google-Smtp-Source: ABdhPJzXRxBojfh1qANDogY19+drpNNMPo6uK+VwKIRHA016pnpIDaiW0fHzZqkM3nwSm3TuWwyx/Q==
X-Received: by 2002:a17:906:2bc6:: with SMTP id
 n6mr40631660ejg.256.1625132791611; 
 Thu, 01 Jul 2021 02:46:31 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d25sm14467479edu.83.2021.07.01.02.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 02:46:31 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/net: e1000: Correct the initial value of VET register
Date: Thu,  1 Jul 2021 17:46:49 +0800
Message-Id: <20210701094651.1258613-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x630.google.com
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
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 hw/net/e1000.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 4f75b44cfc..20cbba6411 100644
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
@@ -254,6 +255,7 @@ static const uint32_t mac_reg_init[] = {
     [MANC]    = E1000_MANC_EN_MNG2HOST | E1000_MANC_RCV_TCO_EN |
                 E1000_MANC_ARP_EN | E1000_MANC_0298_EN |
                 E1000_MANC_RMCP_EN,
+    [VET]     = ETH_P_VLAN,
 };
 
 /* Helper function, *curr == 0 means the value is not set */
-- 
2.25.1


