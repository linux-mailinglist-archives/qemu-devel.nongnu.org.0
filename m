Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389C755042A
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 13:11:01 +0200 (CEST)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2WM0-0003zd-AD
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 07:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDc-0007qp-Ox; Sat, 18 Jun 2022 07:02:21 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o2WDb-0005fA-0Q; Sat, 18 Jun 2022 07:02:20 -0400
Received: by mail-oi1-x234.google.com with SMTP id s124so8300770oia.0;
 Sat, 18 Jun 2022 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgBvX04lektdxvLkMI1I/YjOTssBF/J1Ycnx3vGzq1M=;
 b=XNKgUatWQBpqCNDXt0lwleFQie5+lLJ0NNaAiuhontmXKAhoNi8KHzF77UqIwP72kj
 /KpWzrxfZwI74kq5doAzzha83vHnq4Zo+J+vU0bBvBzWNJWYbq1YguqCgbakWZ6b8Ai4
 wUqp6g2qQEJFDkPkKbN63kkLFmOXGVzyyvncS3FtT+qnOaZ8A4HExUQOAGAePg+UI+it
 ba8yDSPvqI7Gz0Z5S3sSiiIKkrFX+FS66xez63XwrzHrxeKnlsZuP4iZbHB1aXA4yk3h
 C5rG6nBYuoSBRsO4+PWw4DmWvCpZPBeFl44Bz3X9NCuj8VpOxD7mofIHhmDBRbKUKZEL
 HxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgBvX04lektdxvLkMI1I/YjOTssBF/J1Ycnx3vGzq1M=;
 b=J5Bl07lHK5L2Ks1I0Br+Yl4Hj1cDidRBgGTcURkX/oTohuBxbWtD2zfbnUsUdRELNR
 i/b+OLpuXt8LqmbMRMl4UGNTSidAN1Gp6VhLaOHVWI+vw5rHMOgQkD35CKEpxgwnqZrY
 dq/y4+IrPztMAkLnAcrOpRyEGT8dFx5T7SDs17hhEC+/INJutgkFOBhW1JJeHMizQKGF
 V6L2y8Kd8TEj50aGXBDfAx4zj3/USoXxxQ8J4+ds7HdioMV9MytWhWK/wPHSRwdZklE2
 WfOUGLDrcjpxYrugCAIigRDx33d3KYlYbMgd0Uw9TmT1iTi0pbqnaP+KJLeEIPH7gJz/
 n2xA==
X-Gm-Message-State: AOAM530rpD6KFu97RwRFYYQPQWEpwGlxXR++Olq7FMIMox0ZHiEmPoIZ
 Ox9SIyy3vl8coqy49vgKHgLciqASKO8=
X-Google-Smtp-Source: ABdhPJy3qEpHYCcmWlqNHj41GWSnWfsTj6V2/ud9WHDstvORLPk+n7tyM68aqjYRGMMX8CTQYdmswA==
X-Received: by 2002:a54:4e95:0:b0:32e:1ad1:2d4 with SMTP id
 c21-20020a544e95000000b0032e1ad102d4mr12839899oiy.235.1655550137474; 
 Sat, 18 Jun 2022 04:02:17 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c6:ccc8:8e07:268b:a09:2834])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a9d5a90000000b0060603221280sm4075456oth.80.2022.06.18.04.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 04:02:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 4/9] ppc/pnv: use dev instead of pci->qdev in
 root_port_realize()
Date: Sat, 18 Jun 2022 08:01:57 -0300
Message-Id: <20220618110202.87735-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618110202.87735-1-danielhb413@gmail.com>
References: <20220618110202.87735-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x234.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have access to the 'dev' object.

Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb3.c | 4 ++--
 hw/pci-host/pnv_phb4.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index 5e7f827415..8c03cc94f2 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1157,8 +1157,8 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
     }
 
     /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index a0ee52e820..61b45fe33c 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1781,7 +1781,6 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
 {
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
-    PCIDevice *pci = PCI_DEVICE(dev);
     PnvPHB4 *phb = NULL;
     Error *local_err = NULL;
 
@@ -1799,8 +1798,8 @@ static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
     }
 
     /* Set unique chassis/slot values for the root port */
-    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
-    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+    qdev_prop_set_uint8(dev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(dev, "slot", phb->phb_id);
 
     rpc->parent_realize(dev, &local_err);
     if (local_err) {
-- 
2.36.1


