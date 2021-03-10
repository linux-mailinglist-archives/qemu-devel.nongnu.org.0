Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19947333443
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:14:09 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqEa-0000e5-42
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAl-0003Ti-D2; Tue, 09 Mar 2021 23:10:13 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:54035 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAi-00047A-QD; Tue, 09 Mar 2021 23:10:10 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd2yPpz9sWT; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=uxtevDW1LKqCTh9ft/IK1UJZ8brhnol69QHZu/WwkrY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PrV2Vj2rc3mxXqCT1PivFRcQztLbNfH9Mf7t52mb6Mr4FqNdJaxgkAvO4r2qkjTfb
 te4NHYLJmG2E5iRvh8zw7/lRmXP1I2886x/ZAjoFTO5RclbTpyaEIO9qmKnrPKb9Rq
 gYsoKCYZfqGPkldUeGXdm9PI6dBy5gvKml2tteY0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/20] spapr_drc.c: do not call spapr_drc_detach() in
 drc_isolate_logical()
Date: Wed, 10 Mar 2021 15:09:46 +1100
Message-Id: <20210310041002.333813-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

drc_isolate_logical() is used to move the DRC from the "Configured" to
the "Available" state, erroring out if the DRC is in the unexpected
"Unisolate" state and doing nothing (with RTAS_OUT_SUCCESS) if the DRC
is already in "Available" or in "Unusable" state.

When moving from "Configured" to "Available", the DRC is moved to the
LOGICAL_AVAILABLE state, a drc->unplug_requested check is done and, if
true, spapr_drc_detach() is called.

What spapr_drc_detach() does then is:

- set drc->unplug_requested to true. In fact, this is the only place
where unplug_request is set to true;
- does nothing else if drc->state != drck->empty_state. If the DRC
state is equal to drck->empty_state, spapr_drc_release() is
called. For logical DRCs, drck->empty_state = LOGICAL_UNUSABLE.

In short, calling spapr_drc_detach() in drc_isolate_logical() does
nothing. It'll set unplug_request to true again ('again' since it was
already true - otherwise the function wouldn't be called), and will
return without calling spapr_drc_release() because the DRC is not in
LOGICAL_UNUSABLE, since drc_isolate_logical() just moved it to
LOGICAL_AVAILABLE. The only place where the logical DRC is released is
when called from drc_set_unusable(), when it is moved to the
"Unusable" state.  As it should, according to PAPR.

Even though calling spapr_drc_detach() in drc_isolate_logical() is
benign, removing it will avoid further thought about the matter. So
let's go ahead and do that.

As a note, this logic was introduced in commit bbf5c878ab76. Since
then, the DRC handling code was refactored and enhanced, and PAPR
itself went through some changes in the DRC area as well. It is
expected that some assumptions we had back then are now deprecated.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210211225246.17315-2-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_drc.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 8571d5bafe..84bd3c881f 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -132,19 +132,6 @@ static uint32_t drc_isolate_logical(SpaprDrc *drc)
 
     drc->state = SPAPR_DRC_STATE_LOGICAL_AVAILABLE;
 
-    /* if we're awaiting release, but still in an unconfigured state,
-     * it's likely the guest is still in the process of configuring
-     * the device and is transitioning the devices to an ISOLATED
-     * state as a part of that process. so we only complete the
-     * removal when this transition happens for a device in a
-     * configured state, as suggested by the state diagram from PAPR+
-     * 2.7, 13.4
-     */
-    if (drc->unplug_requested) {
-        uint32_t drc_index = spapr_drc_index(drc);
-        trace_spapr_drc_set_isolation_state_finalizing(drc_index);
-        spapr_drc_detach(drc);
-    }
     return RTAS_OUT_SUCCESS;
 }
 
-- 
2.29.2


