Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A8E410327
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 05:03:18 +0200 (CEST)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRQdJ-0001co-Up
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 23:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQc9-0007vt-V6; Fri, 17 Sep 2021 23:02:08 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mRQc8-0005xZ-6k; Fri, 17 Sep 2021 23:02:05 -0400
Received: by mail-ed1-x533.google.com with SMTP id c22so36965468edn.12;
 Fri, 17 Sep 2021 20:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mZWISt9Mmvu143nSBjB/92Vjzf4jNORaaNQp6xmyKM=;
 b=PmXvlx3KnLzI1KV/hutdOsL+bEUAPS1SVdYGSNWZak8IdSWelYTivC0z4ylrdr80Hb
 g4Yng3VTyTea7id0VSH6vE/GWlV7WQy0Q/Qlz6CPM6yi3cDCzNIEE6K6LTTRI0K2PQ6d
 Sgjb8kmCOkuJ1lp6jXd64ZsmMyD6VGnLvt8V2sP2G3/ik+jOETjiKAQOy5M2/0yfIVAE
 Wi23Jwh66L/f4BboSxIYFG348LH1zhsIAGu6Igf8Pnti5dylgiNe50z7DoAlIS0KaJ7C
 Duaf+N/c63nd7oTQI/FxGtWsK/WobFmgbu5tEnsS8/SowjVAmwL+DVccfh6/MdLEZtW+
 pZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6mZWISt9Mmvu143nSBjB/92Vjzf4jNORaaNQp6xmyKM=;
 b=In0eWeBjGNkQZJE4VFjfbQXr9xTrUT002BqvbcGGuMY74JfcrdGP/avdzclCjDQcmJ
 VOqCOnZTaNsQQwcJJJ+q7xEQyVeoFsbXj32Xhl5MTELBwFalEBJQOQxaSgtw7zkshXvW
 zP3uiRCVyg2e6tEylVI0A5kk5zvj40fLP+38frgi+VbI3A6eMeUYVIbsq6/xuvFJV5fZ
 goZscQWiD/KX3q/5mjzRgqenN/TREh5kK353vr8eBkBFfv2Y5feFNy6vr41/00UGtj9k
 /QRhf2GFqR3rs48rpA/MQz9EPZBnakglsmXzZ2gTuqLB3gLpA2iMEIbxC8moVfpZ49zB
 1uJA==
X-Gm-Message-State: AOAM530N5CkWDY+15I7N/UxyHxmztgizCZecAOJQ6sfBgfengwA/O7ok
 p1y0awXVEVLKtTthiIDMreg=
X-Google-Smtp-Source: ABdhPJyujvhzmTf9Hs+xIl91RzVQy04sP08sjnQjMZz4zZz1MRJjVCwyPtoIXoivBXRHlLVXOJQIRw==
X-Received: by 2002:a50:f60a:: with SMTP id c10mr15850002edn.250.1631934121524; 
 Fri, 17 Sep 2021 20:02:01 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d3sm3419367edv.87.2021.09.17.20.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 20:02:00 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Subject: [PATCH 1/3] hw/intc: openpic: Correct the reset value of IPIDR for
 FSL chipset
Date: Sat, 18 Sep 2021 11:01:47 +0800
Message-Id: <20210918030149.642398-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x533.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The reset value of IPIDR should be zero for Freescale chipset, per
the following 2 manuals I checked:

- P2020RM (https://www.nxp.com/webapp/Download?colCode=P2020RM)
- P4080RM (https://www.nxp.com/webapp/Download?colCode=P4080RM)

Currently it is set to 1, which leaves the IPI enabled on core 0
after power-on reset. Such may cause unexpected interrupt to be
delivered to core 0 if the IPI is triggered from core 0 to other
cores later.

Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/intc/openpic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 9b4c17854d..2790c6710a 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -1276,6 +1276,15 @@ static void openpic_reset(DeviceState *d)
             break;
         }
 
+        /* Mask all IPI interrupts for Freescale OpenPIC */
+        if ((opp->model == OPENPIC_MODEL_FSL_MPIC_20) ||
+            (opp->model == OPENPIC_MODEL_FSL_MPIC_42)) {
+            if (i >= opp->irq_ipi0 && i < opp->irq_tim0) {
+                write_IRQreg_idr(opp, i, 0);
+                continue;
+            }
+        }
+
         write_IRQreg_idr(opp, i, opp->idr_reset);
     }
     /* Initialise IRQ destinations */
-- 
2.25.1


