Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BA434F8CB
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:33:02 +0200 (CEST)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUPV-0001Ve-Kv
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIL-0004Zd-3h; Wed, 31 Mar 2021 02:25:37 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:57469 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUII-0000oy-61; Wed, 31 Mar 2021 02:25:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX709tlz9sWX; Wed, 31 Mar 2021 17:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171927;
 bh=ZbUZUTlF8jf5aE4OwXCN/W/eDeVgxYnFh4FTht1TnKw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E2F52+tw5QHSo6d7PtrnTG33Izz85LheGxTw8m/480BKEhFFwUZFO12VIZ7RBaBzX
 oJBhkA+tthbXrT60ElkGT5Yr3e0J7/1Rdr8LeYw+POiUajmM5ZBP2CI283GA4p9Ck3
 zENlyuAj1jvFOSrSQ9HuI3KOfHqOVvAb6Ydv4bU8=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 3/5] spapr: Assert DIMM unplug state in spapr_memory_unplug()
Date: Wed, 31 Mar 2021 17:25:22 +1100
Message-Id: <20210331062524.335749-4-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331062524.335749-1-david@gibson.dropbear.id.au>
References: <20210331062524.335749-1-david@gibson.dropbear.id.au>
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

From: Greg Kurz <groug@kaod.org>

spapr_memory_unplug() is the last step of the hot unplug sequence.
It is indirectly called by:

 spapr_lmb_release()
  hotplug_handler_unplug()

and spapr_lmb_release() already buys us that DIMM unplug state is
present : it gets restored with spapr_recover_pending_dimm_state()
if missing.

g_assert() that spapr_pending_dimm_unplugs_find() cannot return NULL
in spapr_memory_unplug() to make this clear and silence Coverity.

Fixes: Coverity CID 1450767
Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <161562021166.948373.15092876234470478331.stgit@bahia.lan>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index d56418ca29..73a06df3b1 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3660,6 +3660,9 @@ static void spapr_memory_unplug(HotplugHandler *hotplug_dev, DeviceState *dev)
     SpaprMachineState *spapr = SPAPR_MACHINE(hotplug_dev);
     SpaprDimmState *ds = spapr_pending_dimm_unplugs_find(spapr, PC_DIMM(dev));
 
+    /* We really shouldn't get this far without anything to unplug */
+    g_assert(ds);
+
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(hotplug_dev));
     qdev_unrealize(dev);
     spapr_pending_dimm_unplugs_remove(spapr, ds);
-- 
2.30.2


