Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F74568246F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 07:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMkAB-0007hm-U7; Tue, 31 Jan 2023 01:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pMkA0-0007hK-Uw
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 01:30:29 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlfightup@gmail.com>)
 id 1pMk9z-0002IH-2L
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 01:30:28 -0500
Received: by mail-pf1-x436.google.com with SMTP id a184so9533882pfa.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 22:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VpJrBvuwKO0+pryIPahOw4mSDdC4ZvBzsvZ3ukL/xE0=;
 b=M56VKl+lOKIol5y/Chgfw6EcFDX2CNO/qFhGJujgQHQs+Nox7LEo51z3HusKQSmUYe
 cghYTLHqLFdvl7KnRvkasDvQqKmKQjwPqKKMTnB3vpxy7xbDiQbCDLuXjpWa2+WGXChM
 OSqILRLB5WYtctvkpJf2EDiHHbjUDZ9sD4c0lNCL+yM73ux+AYL9o8m9kvWKMiRJ31gP
 ydJ3zr8G5v20gpJYl6brdLb80QsAq4sCFHHtK/ffSolaEWrq23VxOJiSMdfxvGp6KkOT
 2nb5ew4P9ocz3wA3kQT0XrAXtDbQczGzYDTl1CHFRwM51I5tA1ts4R97APLsyPIDgk+Y
 YBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VpJrBvuwKO0+pryIPahOw4mSDdC4ZvBzsvZ3ukL/xE0=;
 b=JfPxTrnO98c7FTohdkUhELqSgd0GPwwhbS0rRrZkSYKB871zjV5WUprX92NC3Mrr6o
 s36zAWLmscpvEyl+Qzvwn1j+YKTCJKaglGaOP8t1TRBDnoyR/rHMpa/KDgn2ymDmKCSa
 /kOL0TCZD5yM3MMYBVqqSoDQ4vD17tW48Vn/dFsLPwFxpU7FKFwP02XD9p1K/0f57Z/m
 7zfQjOn25fwggDzd0h3+XxsdM59FfgFyEAPl36VOTPkrnAPuIBVR8cV1kmzKsCBfrhQQ
 AM+j6oLmB6oXn8kdGfqZmLBsnNJpcCHNkGSnQGy+r6jfkaq1AAL6K6KMgGMYNnWT0Lws
 6Hrg==
X-Gm-Message-State: AO0yUKWBbERBKg1xz425KmBoEngpGGqH84gnytjo4zPDtiAOXtxCUxD5
 3A6YfPV6mTId9e2Js0daFLc=
X-Google-Smtp-Source: AK7set+fi0i2OTxGNScMKicaxgFJPUslBrAtJ8fS30jPmLjcOt6rdUualzkEZ1njrOL0OoLIc3So/g==
X-Received: by 2002:a05:6a00:228f:b0:590:752f:3c54 with SMTP id
 f15-20020a056a00228f00b00590752f3c54mr12747105pfe.14.1675146625157; 
 Mon, 30 Jan 2023 22:30:25 -0800 (PST)
Received: from localhost.localdomain ([111.108.111.139])
 by smtp.gmail.com with ESMTPSA id
 b25-20020a056a0002d900b0058bbe1240easm8530117pft.190.2023.01.30.22.30.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Jan 2023 22:30:24 -0800 (PST)
From: wlfightup <wlfightup@gmail.com>
To: mst@redhat.com,
	marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org,
	wlfightup <wlfightup@gmail.com>
Subject: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
Date: Tue, 31 Jan 2023 14:30:13 +0800
Message-Id: <20230131063013.65588-1-wlfightup@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=wlfightup@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When vfio-pci devices are attached to the downstream, pcie acs
capability may be needed, Consistent with physical machine.

It has been tested in our environment, and pcie acs capability
is required in some scenarios.

Claim ACS support in the downstream port to allow
passthrough of individual functions of a device to different
guests (in a nested virt.setting) with VFIO.
Without this patch, all functions of a device, such as all VFs of
an SR/IOV device, will end up in the same IOMMU group.
A similar situation occurs on Windows with Hyper-V.

Signed-off-by: wlfightup <wlfightup@gmail.com>
---
 hw/pci-bridge/xio3130_downstream.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
index 38a2361fa2..2017cf42a3 100644
--- a/hw/pci-bridge/xio3130_downstream.c
+++ b/hw/pci-bridge/xio3130_downstream.c
@@ -40,6 +40,8 @@
 #define XIO3130_SSVID_SSID              0
 #define XIO3130_EXP_OFFSET              0x90
 #define XIO3130_AER_OFFSET              0x100
+#define XIO3130_ACS_OFFSET \
+        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
 
 static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
                                          uint32_t val, int len)
@@ -111,6 +113,10 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
         goto err;
     }
 
+    if (!s->disable_acs) {
+        pcie_acs_init(d, XIO3130_ACS_OFFSET);
+    }
+
     return;
 
 err:
@@ -137,6 +143,7 @@ static void xio3130_downstream_exitfn(PCIDevice *d)
 static Property xio3130_downstream_props[] = {
     DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
                     QEMU_PCIE_SLTCAP_PCP_BITNR, true),
+    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.24.3 (Apple Git-128)


