Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6CA485AB0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:32:59 +0100 (CET)
Received: from localhost ([::1]:43904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Dty-0008GS-LQ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:32:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlT-0001wB-VI; Wed, 05 Jan 2022 16:24:11 -0500
Received: from [2607:f8b0:4864:20::931] (port=41764
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlS-0007tb-At; Wed, 05 Jan 2022 16:24:11 -0500
Received: by mail-ua1-x931.google.com with SMTP id p37so821851uae.8;
 Wed, 05 Jan 2022 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mr85BSZGGimrDy/SW0VBBvffYUbbNDHjNMiGhOdIIXI=;
 b=Q7GqUAv0IJWWbFkx+P9wknTNG2HQYXAaUM0FFp/bRLpgRzdFKf9bxWBlPzLnfKjw47
 xeMKaGIGdXMVO77zkYMoMBxX6+/yhELwclI0llW3f0V5IHrcDuDgmGtr9QfMtyVp4MBt
 nvfsSYLQUzGmB4QnYEx1pmTPg58glhBhMLT1kclaJD/kXcnK3Y8XHQjrkaA9csT7+Xjk
 SR33PF5EXgK98CeHpl42QWVsmYNDcMBicjyqq6TNCRNGxPA+slo4oLQCDE7jgPAV2ehj
 mtxFBPk+eK69y8NWgXqf+SFr9q7w/BlaGnjzMCqAFjwAzftQB5JTrZW3A+cP9R4xTweR
 49/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mr85BSZGGimrDy/SW0VBBvffYUbbNDHjNMiGhOdIIXI=;
 b=z6qS9qWIb61tfCqpGrLfClzwDZGtOQD0hiCyz5TAGtIyJ5w+0zOWIT6JTAGEk3tu2i
 iCS8vdlyR1wfi8HlEFvOJNy7junBvUINl8cMHo+63U/65h7Dow310yMCjittA9llZ/zb
 pfd3yn4OXfluGnsCfzcC5yjxECpGpILE/fgvPIwei7wEfXR/exyRBudOsnhnX2syhkIC
 GcK15+lIYowWRK6RYgPRfZ66SZPIJ4X1mDvrk2bkyjZ8W7qOOphjZrqU4CZQYs7Ru2JO
 CNr40f6Ucn8Dtviy9o69voIN33axawSsSJ6u/kRvWhk379VowDjZ4Wq0cU2KzkRibyW/
 PuEg==
X-Gm-Message-State: AOAM5301LogRLVC+z6o/cVrsSIu0aV/FtymoXis+sxn0JFSZg+opaA27
 KxrZW2WEOI8cwJ/BTYTNV3cYLUxemqA=
X-Google-Smtp-Source: ABdhPJwASFVjVSUCLZFvt38cJ2fyBc3VMUBfeQAlVlFlj6YO9DSyepf1PAaqT30rjGC9XuoavgFZKw==
X-Received: by 2002:a67:cc16:: with SMTP id q22mr17117676vsl.39.1641417849182; 
 Wed, 05 Jan 2022 13:24:09 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:08 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/18] ppc/pnv: Complete user created PHB3 devices
Date: Wed,  5 Jan 2022 18:23:28 -0300
Message-Id: <20220105212338.49899-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cédric Le Goater <clg@kaod.org>

PHB3s ared SysBus devices and should be allowed to be dynamically
created.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/pci-host/pnv_phb3.c | 9 +++++++++
 hw/ppc/pnv.c           | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index a52aedcad3..7fb35dc031 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -993,6 +993,9 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
 
     /* User created devices */
     if (!phb->chip) {
+        Error *local_err = NULL;
+        BusState *s;
+
         phb->chip = pnv_get_chip(pnv, phb->chip_id);
         if (!phb->chip) {
             error_setg(errp, "invalid chip id: %d", phb->chip_id);
@@ -1004,6 +1007,12 @@ static void pnv_phb3_realize(DeviceState *dev, Error **errp)
          * correctly the device tree.
          */
         pnv_chip_parent_fixup(phb->chip, OBJECT(phb), phb->phb_id);
+
+        s = qdev_get_parent_bus(DEVICE(phb->chip));
+        if (!qdev_set_parent_bus(DEVICE(phb), s, &local_err)) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
 
     if (phb->phb_id >= PNV_CHIP_GET_CLASS(phb->chip)->num_phbs) {
diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index fa5e7bc751..8dc6382357 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1941,6 +1941,8 @@ static void pnv_machine_power8_class_init(ObjectClass *oc, void *data)
 
     pmc->compat = compat;
     pmc->compat_size = sizeof(compat);
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB3);
 }
 
 static void pnv_machine_power9_class_init(ObjectClass *oc, void *data)
-- 
2.33.1


