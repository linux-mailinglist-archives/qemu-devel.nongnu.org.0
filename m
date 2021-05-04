Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E39DC3725EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:43:31 +0200 (CEST)
Received: from localhost ([::1]:58736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldomI-0006V8-VU
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0v-0006eF-Eh; Tue, 04 May 2021 01:54:34 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:35451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0t-00058O-EZ; Tue, 04 May 2021 01:54:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CN4RbTz9ssP; Tue,  4 May 2021 15:53:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107600;
 bh=vL7ZdIT5+fnPoAOJ3OovBILu3ZlCN96VCnTNs+tkAok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmuDtzoZ9PAXbusjdiUA9RoTgU0nu6dLGaw/QhfIy+hmbMW3w0zYw/dqzTILO1yNL
 WUCwBIir/giKaaYwCIO4b6s6ZACVmbHVyw0ORVoyYF2GLzf7Esp5rGfsoZL/jfPaXF
 lEa2hS+L698l8b4p/lUdhy/BreWXl9kPlmc9ZA2w=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 36/46] spapr_drc.c: handle hotunplug errors in
 drc_unisolate_logical()
Date: Tue,  4 May 2021 15:53:02 +1000
Message-Id: <20210504055312.306823-37-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

At this moment, PAPR does not provide a way to report errors during a
device removal operation. This led the pSeries machine to implement
extra mechanisms to try to fallback and recover from an error that might
have happened during the hotunplug in the guest side. This started to
change a bit with commit fe1831eff8a4 ("spapr_drc.c: use DRC
reconfiguration to cleanup DIMM unplug state"), where one way to
fallback from a memory removal error was introduced.

Around the same time, in [1], the idea of using RTAS set-indicator for
this role was first introduced. The RTAS set-indicator call, when
attempting to UNISOLATE a DRC that is already UNISOLATED or CONFIGURED,
returns RTAS_OK and does nothing else for both QEMU and phyp. This gives
us an opportunity to use this behavior to signal the hypervisor layer
when a device removal errir happens, allowing QEMU/phyp to do a proper
error handling. Using set-indicator to report HP errors isn't strange to
PAPR, as per R1-13.5.3.4-4. of table 13.7 of current PAPR [2]:

"For all DR options: If this is a DR operation that involves the user
insert- ing a DR entity, then if the firmware can determine that the
inserted entity would cause a system disturbance, then the set-indicator
RTAS call must not unisolate the entity and must return an error status
which is unique to the particular error."

A change was proposed to the pSeries Linux kernel to call set-indicator
to move a DRC to 'unisolate' in the case of a hotunplug error in the
guest side [3]. Setting a DRC that is already unisolated or configured to
'unisolate' is a no-op (returns RTAS_OK) for QEMU and also for phyp.
Being a benign change for hypervisors that doesn't care about handling
such errors, we expect the kernel to accept this change at some point.

This patch prepares the pSeries machine for this new kernel feature by
changing drc_unisolate_logical() to handle guest side hotunplug errors.
For CPUs it's a simple matter of setting drc->unplug_requested to 'false',
while for LMBs the process is similar to the rollback that is done in
rtas_ibm_configure_connector().

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg06395.html
[2] https://openpowerfoundation.org/wp-content/uploads/2020/07/LoPAR-20200611.pdf
[3] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210416210216.380291-3-danielhb413@gmail.com/

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210420165100.108368-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 9e16505fa1..6918e0c9d1 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -151,9 +151,32 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
 
 static uint32_t drc_unisolate_logical(SpaprDrc *drc)
 {
+    SpaprMachineState *spapr = NULL;
+
     switch (drc->state) {
     case SPAPR_DRC_STATE_LOGICAL_UNISOLATE:
     case SPAPR_DRC_STATE_LOGICAL_CONFIGURED:
+        /*
+         * Unisolating a logical DRC that was marked for unplug
+         * means that the kernel is refusing the removal.
+         */
+        if (drc->unplug_requested && drc->dev) {
+            if (spapr_drc_type(drc) == SPAPR_DR_CONNECTOR_TYPE_LMB) {
+                spapr = SPAPR_MACHINE(qdev_get_machine());
+
+                spapr_memory_unplug_rollback(spapr, drc->dev);
+            }
+
+            drc->unplug_requested = false;
+            error_report("Device hotunplug rejected by the guest "
+                         "for device %s", drc->dev->id);
+
+            /*
+             * TODO: send a QAPI DEVICE_UNPLUG_ERROR event when
+             * it is implemented.
+             */
+        }
+
         return RTAS_OUT_SUCCESS; /* Nothing to do */
     case SPAPR_DRC_STATE_LOGICAL_AVAILABLE:
         break; /* see below */
-- 
2.31.1


