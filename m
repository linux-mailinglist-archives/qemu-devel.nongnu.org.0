Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82B2D925D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 06:03:31 +0100 (CET)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kog1C-0002BR-NY
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 00:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwQ-0005Ay-8E; Sun, 13 Dec 2020 23:58:34 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kofwO-0004qX-JM; Sun, 13 Dec 2020 23:58:34 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CvTfr0KZbz9sVp; Mon, 14 Dec 2020 15:58:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607921892;
 bh=VD+J1hXhDdr3pT9HMohEBgqU/0c2VCxHCWGNmfo7B6o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ben9RVrIr9aEprqwWXgRFm1MqTTDJjUO4zAdC7BfLt4VA+n83YIukKWMXvqtoE705
 VzT3eRJiX2x4oEXYrIXSGQhj61ik+TYVbFtFZrWx+MCHebJUhDtmbba1u/Qqt0kMpL
 +g99eyWVEURKysuZj4SiKo8OffEUZ/Hd9FNZWUjw=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 07/30] spapr: Do TPM proxy hotplug sanity checks at pre-plug
Date: Mon, 14 Dec 2020 15:57:44 +1100
Message-Id: <20201214045807.41003-8-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
index ac115b0987..d51c550288 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3971,17 +3971,28 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
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
 
@@ -4004,7 +4015,7 @@ static void spapr_machine_device_plug(HotplugHandler *hotplug_dev,
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         spapr_phb_plug(hotplug_dev, dev);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
-        spapr_tpm_proxy_plug(hotplug_dev, dev, errp);
+        spapr_tpm_proxy_plug(hotplug_dev, dev);
     }
 }
 
@@ -4067,6 +4078,8 @@ static void spapr_machine_device_pre_plug(HotplugHandler *hotplug_dev,
         spapr_core_pre_plug(hotplug_dev, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_PCI_HOST_BRIDGE)) {
         spapr_phb_pre_plug(hotplug_dev, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_SPAPR_TPM_PROXY)) {
+        spapr_tpm_proxy_pre_plug(hotplug_dev, dev, errp);
     }
 }
 
-- 
2.29.2


