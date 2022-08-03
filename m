Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DF588DFF
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 15:55:53 +0200 (CEST)
Received: from localhost ([::1]:56438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJEqm-0001GC-Ef
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 09:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgg-00037S-Hy; Wed, 03 Aug 2022 09:45:26 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgd-0004qR-Ig; Wed, 03 Aug 2022 09:45:26 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id q15so1985140vsr.0;
 Wed, 03 Aug 2022 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=WY1mlFNxjtzovYyo+r6kFpYn/4MD7VpdrOont9jJSnU=;
 b=erNGSHvfs7Ontr8WVeCDH/5vpHRYs/E2dkHcfn/qCN6fv0lD1/yv2bU0+gFqvR0IN4
 t6f2WAKnO23a7gISiii0LahjwtBAI5vYcutf6M/878wocVScgIqiCWLHJ6x6Vxido2Vq
 LfmGLka8W+TGSVZvG2wR9yzhjco6o6P/JQwe5YstfHqghRp/JBT7y4Q6ScznbOpxJkt+
 WcsQeadxO/ZOhgPqLDzXZBTpdZ8vGjxu/hB6OWzPqn+oHZmfYcjHzZA0V1G3qMeIo9gw
 HHvsbXA/MlvcbaONnegf0kMYa7CEIBNcob5epeRgDBshZaHxkxaE40+/2XUNjykqYrHX
 jRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=WY1mlFNxjtzovYyo+r6kFpYn/4MD7VpdrOont9jJSnU=;
 b=Gtud3tGaQVRf8yJLxAqIsK9DhS57g1CfG5fz5TFlnJGCJFgzJdM/s+dfkJ30CSgCBM
 +QNjiTRsTVSrqO5YNycwrOJ2lMxQ8GMbzbpL/ZMZLQyl2MBnobqpJQ3a20FFldBjBM35
 21tX3NctcZECTwgFM78U0W5eSYlPhGdwiRgjPMBwnvzM+6gn44h61keyzsCYQXjWY7xD
 qw6z5I7qxuhNIOTxz236YH95Pp4M1kNYzBhEnmXOLPVrWZ2nLI1H5bOlQh+R4m+cDrjD
 2U25eTk+3/VtDgAT33NZTUvMVRJVMHXSP4p4gUcWZ4fao37Epxe3TWMK1ktlH+ESGajb
 Pm4A==
X-Gm-Message-State: ACgBeo1t05PYYuAKM4iY3jKCX4jU90azhhPBy3PHsoDGb/uRkYN/LnWQ
 hstL4QHDabN2FuFMXAkhKjcDoI8cWk4=
X-Google-Smtp-Source: AA6agR7W33ozq5nRU1Og/xuFn+GDB1JcvvQ6TlGBWkfLbg9uBK8VtaBFk6enGQ2d/cN5WwyAbKzDbg==
X-Received: by 2002:a05:6102:955:b0:385:f146:b553 with SMTP id
 a21-20020a056102095500b00385f146b553mr5427648vsi.25.1659534321755; 
 Wed, 03 Aug 2022 06:45:21 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:21 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 08/10] ppc/pnv: enable user created pnv-phb powernv9
Date: Wed,  3 Aug 2022 10:44:57 -0300
Message-Id: <20220803134459.2633902-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220803134459.2633902-1-danielhb413@gmail.com>
References: <20220803134459.2633902-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2f.google.com
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

Enable pnv-phb user created devices for powernv9 now that we have
everything in place.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c      | 2 +-
 hw/pci-host/pnv_phb4_pec.c | 6 ++++--
 hw/ppc/pnv.c               | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 9807d093f5..c241e90036 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -211,7 +211,7 @@ static void pnv_phb_realize(DeviceState *dev, Error **errp)
         pnv_phb4_bus_init(dev, PNV_PHB4(phb->backend));
     }
 
-    if (phb->version == 3 && !defaults_enabled()) {
+    if (!defaults_enabled()) {
         return;
     }
 
diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 8dc363d69c..9871f462cd 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -146,8 +146,10 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
     pec->num_phbs = pecc->num_phbs[pec->index];
 
     /* Create PHBs if running with defaults */
-    for (i = 0; i < pec->num_phbs; i++) {
-        pnv_pec_default_phb_realize(pec, i, errp);
+    if (defaults_enabled()) {
+        for (i = 0; i < pec->num_phbs; i++) {
+            pnv_pec_default_phb_realize(pec, i, errp);
+        }
     }
 
     /* Initialize the XSCOM regions for the PEC registers */
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0d3a88578b..b6314dc961 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -2134,6 +2134,8 @@ static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
     pmc->dt_power_mgt = pnv_dt_power_mgt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB);
 }
 
 static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
-- 
2.36.1


