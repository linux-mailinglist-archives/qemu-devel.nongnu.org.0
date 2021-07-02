Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAA03B9E2C
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:25:48 +0200 (CEST)
Received: from localhost ([::1]:47120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFQh-0004qB-Pi
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFP4-0003du-3B
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:06 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lzFP2-00016O-EY
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:05 -0400
Received: by mail-ed1-x529.google.com with SMTP id df12so12345248edb.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpI9js6MYPsZuSC2fkN8vkkKWP16ac71a0cNSBA3IE4=;
 b=JMkzKe5ekOEStbgaLvcsD+201hvwi8U6vZBgf4QOjc6eviaGyy7KeYi6IapxZJo1jg
 4jKsFdkhSVa7hg/UXqFM1ZD0XdMOolvGkFHYhYwjRse265L1RJGjTNqk2cgXuK1b8mgq
 +9SLvv7KQh3+IVHE0nSbqmbfI2WSMq4x/Noj4ZvPlK/NVsLvcPf3dggwR5m5WtssvEoY
 MbWDbw+dRMEIaLSMEzhXpgP6N8lWhuJ8nqSrfQPRxSJf5Pe6x6nsE7qUZvkccWg40eXp
 NGGU+tvlY/Yo3Eh91YFmgWGnwhbLDfLkjnFBHGTww0DdWoBmL1OXomi1l8eBRtqFZygO
 wc2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vpI9js6MYPsZuSC2fkN8vkkKWP16ac71a0cNSBA3IE4=;
 b=ZN8Lqy04j+GXyYDk1GqBS0NX+TAFHlZ3xp0jXVrOFktUDMOUllCJdAc7MUQgtmXmie
 S9oK/vp9j6DVrbAEzt0IsiWeZH5PfMk4Q4/uWKKsGlDWH46QdJNLi1UL6hs98GuJK2Mg
 BqxbWRAa5fQyTSPlCjZiTiLodkUNM4eWAdJgR1Zbb5x5RSXrK4HV+mIWKfQwUkwYqsx7
 Qj9KPC1PAKr/seI+jQCtJFA6sLnXVK2B92FlZMY5Z+KxehHnDyMnBU7dFpihtzXAA4O3
 glQlZ0qzmbAyoPh3fTcGmsfB03w6ojnPWZqg7lSh+iFhV69CPDJ7eyPVlNXlfOeOe4Mo
 sKxA==
X-Gm-Message-State: AOAM532qLQGOXiUU0dQdShKhKgKR2kiaOLlOQLPJ4hihKt/YrC4AA5BN
 wzoz0kVoyFuhJwMjC7r75wM=
X-Google-Smtp-Source: ABdhPJzBnJoLhNuOqJ3QxpGsK3jFfOjXLIOwO9wWfxk16utQBaNdrakrSSWXtHak3RClMbCDMYOs/w==
X-Received: by 2002:a05:6402:1776:: with SMTP id
 da22mr5321421edb.133.1625217841052; 
 Fri, 02 Jul 2021 02:24:01 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id c18sm1035623edt.18.2021.07.02.02.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] hw/net: e1000: Correct the initial value of VET
 register
Date: Fri,  2 Jul 2021 17:24:25 +0800
Message-Id: <20210702092427.1323667-1-bmeng.cn@gmail.com>
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

(no changes since v1)

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


