Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA712EB899
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:46:32 +0100 (CET)
Received: from localhost ([::1]:39536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzmJ-0006eT-Eh
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:46:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeq-0005k1-2j; Tue, 05 Jan 2021 22:38:48 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:59885 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzej-0006Ia-RB; Tue, 05 Jan 2021 22:38:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG5y2vz9sWC; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=Q0SirtfQ/vPjQ1kn/a0VIr6kOZdpTCrLX8RQP5vLVTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Te1E8wWR8OWfZ93BU3/k3EADunv74YZJTqjV8McM6xHkDnXChvRCEGoRqjkkTRkth
 EJ8zbIzsHOdg1RVzbgH+ULZMxyk2dwJsCRduOTIHpcPsqgWG77H8jIV3V/Z9GkZKq7
 0yJXphKzUqPCunA565kgQ2G6XnPa0vYZErPQDDx0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/22] spapr: Call spapr_drc_reset() for all DRCs at CAS
Date: Wed,  6 Jan 2021 14:38:04 +1100
Message-Id: <20210106033816.232598-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Non-transient DRCs are either in the empty or the ready state,
which means spapr_drc_reset() doesn't change their state. It
is thus not needed to do any checking. Call spapr_drc_reset()
unconditionally and squash spapr_drc_transient() into its
only user, spapr_drc_needed().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201218103400.689660-2-groug@kaod.org>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c         | 8 ++------
 hw/ppc/spapr_hcall.c       | 7 ++++---
 include/hw/ppc/spapr_drc.h | 3 ---
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index fc7e321fcd..8d62f55066 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -462,8 +462,9 @@ static const VMStateDescription vmstate_spapr_drc_unplug_requested = {
     }
 };
 
-bool spapr_drc_transient(SpaprDrc *drc)
+static bool spapr_drc_needed(void *opaque)
 {
+    SpaprDrc *drc = opaque;
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
 
     /*
@@ -483,11 +484,6 @@ bool spapr_drc_transient(SpaprDrc *drc)
         spapr_drc_unplug_requested(drc);
 }
 
-static bool spapr_drc_needed(void *opaque)
-{
-    return spapr_drc_transient(opaque);
-}
-
 static const VMStateDescription vmstate_spapr_drc = {
     .name = "spapr_drc",
     .version_id = 1,
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index c0ea0bd579..4e9d50c254 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1650,9 +1650,10 @@ static void spapr_handle_transient_dev_before_cas(SpaprMachineState *spapr)
                                                           prop->name,
                                                           &error_abort));
 
-        if (spapr_drc_transient(drc)) {
-            spapr_drc_reset(drc);
-        }
+        /*
+         * This will complete any pending plug/unplug requests.
+         */
+        spapr_drc_reset(drc);
     }
 
     spapr_clear_pending_hotplug_events(spapr);
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index def3593adc..cff5e707d0 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -244,9 +244,6 @@ int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_type_mask);
 void spapr_drc_attach(SpaprDrc *drc, DeviceState *d);
 void spapr_drc_detach(SpaprDrc *drc);
 
-/* Returns true if a hot plug/unplug request is pending */
-bool spapr_drc_transient(SpaprDrc *drc);
-
 static inline bool spapr_drc_unplug_requested(SpaprDrc *drc)
 {
     return drc->unplug_requested;
-- 
2.29.2


