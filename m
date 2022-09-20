Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB85BE61D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 14:43:38 +0200 (CEST)
Received: from localhost ([::1]:59090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oacbB-0001T4-E4
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 08:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZK-0001Il-Jm; Tue, 20 Sep 2022 06:33:34 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:41848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZI-000508-0c; Tue, 20 Sep 2022 06:33:34 -0400
Received: by mail-pg1-x531.google.com with SMTP id q9so2113840pgq.8;
 Tue, 20 Sep 2022 03:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=5vK7I12SbKOcFn43HOIKWmaFBkxVao5CvM3jde8q4IE=;
 b=FugxP0xmy4YDguSzwfMpySA31bnFASSySGjghOCIyELK/Hy/alZ3hk1lZ7wye8hQg+
 6yg4FtbYjcBZIgEOCI9VIpU1sUh3FDTstf1J+YgskJT/IxSX5iFzXBaevOfcPVT1Cp66
 HHicqD4lBqs9HE8HN8J2CnntBgs2oS7qFRJ7tJ6ypZi092U3WcQzxxkB6QgYuVj2Hl/Y
 FYFZYMISU2z4xEa+AnKiuVo0+PHv2o7000tVdh7rGwFS9jXPhAq9PyrNzzJ898Or5Q15
 n21BqsDe5rFrlUspr/8BSMQytbQSt9nXzpdPojxRYqC16jf52KQ0qLx3/O6+O5WIbG6W
 Gq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=5vK7I12SbKOcFn43HOIKWmaFBkxVao5CvM3jde8q4IE=;
 b=RS84u6WtLgqW0zKu9WRsRSa5kcPSzOv6/WAHUZenZdxDuXdIhMZWlXEl2mJYcVMC5E
 8XrtcaId0sT5cOVt9MAHJ5lhn0Wo+XjTZFRUojbZbHQKgM8KmLMDAA2wNmKobV4F2jRf
 Gi6qjF+3sycZNtptKlHJu3u2LVUMtSZv5IiW3q1qH4B7+BVLWmzDu2cKzupA8rYwM4JC
 XjAXugGDusK6PMLPAG6tz2TyJqrq8CURYE71mfXk60Qa5mTPIKZH7/OYy8pcbCk5ypAL
 BJjrRTpdMiI/rINVfEUmvG9CC3uEWhjwrH9wkefer63NkW00NNgSyFUU45NLPDtid5pd
 7eHg==
X-Gm-Message-State: ACrzQf0zCctcxcCHkquc1lFpqSiFPPct76QVFSh/2zrexUNjy91HS8KR
 RRk1TTJV0QoYQoCpL+v2PG/5A2yXkTc=
X-Google-Smtp-Source: AMsMyM7l9zO8A8g0ecjDG77EC05caPdNd9Dzmydc09GCwKUkwhuzEJCaCSWfw8QUZ6A3X5v9yDx/Xw==
X-Received: by 2002:a63:560a:0:b0:42a:7b1d:4e08 with SMTP id
 k10-20020a63560a000000b0042a7b1d4e08mr19951452pgb.594.1663670009694; 
 Tue, 20 Sep 2022 03:33:29 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org
Subject: [PATCH v2 28/39] hw/pci-host: pnv_phb{3,
 4}: Fix heap out-of-bound access failure
Date: Tue, 20 Sep 2022 18:31:48 +0800
Message-Id: <20220920103159.1865256-29-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

pnv_phb3_root_bus_info and pnv_phb4_root_bus_info are missing the
instance_size initialization. This results in accessing out-of-bound
memory when setting 'chip-id' and 'phb-id', and eventually crashes
glib's malloc functionality with the following message:

  "qemu-system-ppc64: GLib: ../glib-2.72.3/glib/gmem.c:131: failed to allocate 3232 bytes"

This issue was noticed only when running qtests with QEMU Windows
32-bit executable. Windows 64-bit, Linux 32/64-bit do not expose
this bug though.

Fixes: 9ae1329ee2fe ("ppc/pnv: Add models for POWER8 PHB3 PCIe Host bridge")
Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

Changes in v2:
- new patch: "hw/pci-host: pnv_phb{3,4}: Fix heap out-of-bound access failure"

 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index af8575c007..9054c393a2 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1169,6 +1169,7 @@ static void pnv_phb3_root_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_phb3_root_bus_info = {
     .name = TYPE_PNV_PHB3_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
+    .instance_size = sizeof(PnvPHB3RootBus),
     .class_init = pnv_phb3_root_bus_class_init,
 };
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 824e1a73fb..ccbde841fc 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1773,6 +1773,7 @@ static void pnv_phb4_root_bus_class_init(ObjectClass *klass, void *data)
 static const TypeInfo pnv_phb4_root_bus_info = {
     .name = TYPE_PNV_PHB4_ROOT_BUS,
     .parent = TYPE_PCIE_BUS,
+    .instance_size = sizeof(PnvPHB4RootBus),
     .class_init = pnv_phb4_root_bus_class_init,
 };
 
-- 
2.34.1


