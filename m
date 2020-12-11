Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112D2D6F15
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:21:58 +0100 (CET)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZwL-0003ae-FM
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:21:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq7-0005bj-Qn; Thu, 10 Dec 2020 23:15:32 -0500
Received: from ozlabs.org ([203.11.71.1]:37189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq5-0000iz-U3; Thu, 10 Dec 2020 23:15:31 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrb1X3Qz9sWd; Fri, 11 Dec 2020 15:15:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660111;
 bh=dfSUJWYE8sTfFwFiC7FMYXVMBsIlriqEh85KB+TT7Xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Emc9jhJsQfYg9tOiRkl3opE9cqAwvtMjNM3JFkCCinu/NM7PBAkCXTjd9pnJ5xos/
 frPdi2MpUwj1VwsZD49lOEUFFHdrRPrk6MKd8FVoeBIkGbYIcNNza9phWHpqufRMcY
 tqDhaPXqzL3h9AcuBNEbtdQfzo7/puMYP09RS1b0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/30] spapr: Do TPM proxy hotplug sanity checks at pre-plug
Date: Fri, 11 Dec 2020 15:14:44 +1100
Message-Id: <20201211041507.425378-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

There can be only one TPM proxy at a time. This is currently
checked at plug time. But this can be detected at pre-plug in
order to error out earlier.

This allows to get rid of error handling in the plug handler.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201120234208.683521-9-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b270172369..7e954bc84b 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3974,17 +3974,28 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
     }
 }
 
-static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
-                                 Error **errp)
+static
+bool spapr_tpm_proxy_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
+                              Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
-    SpaprTpmProxy *tpm_proxy = SPAPR_TPM_PROXY(dev);
 
     if (spapr->tpm_proxy != NULL) {
         error_setg(errp, "Only one TPM proxy can be specified for this machine");
-        return;
+        return false;
     }
 
+    return true;
+}
+
+static void spapr_tpm_proxy_plug(HotplugHandler *hotplug_dev, DeviceState *dev)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(OBJECT(hotplug_dev));
+    SpaprTpmProxy *tpm_proxy = SPAPR_TPM_PROXY(dev);
+
+    /* Already checked in spapr_tpm_proxy_pre_plug() */
+    g_assert(spapr->tpm_proxy == NULL);
+
     spapr->tpm_proxy = tpm_proxy;
 }
 
@@ -4007,7 +4018,7 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
-        spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
+        spapr_tpm_proxy_plug(hotplug_dev, dev);
     }
 }
 
@@ -4070,6 +4081,8 @@ static void spapr_machine_device_pre_plug(HotplugHandler *hotplug_dev,
         spapr_core_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         spapr_phb_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
+        spapr_tpm_proxy_pre_plug(hotplug_dev, dev, errp);
     }
 }
 
-- 
2.29.2


