Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51992EB89F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:49:03 +0100 (CET)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzok-0002DZ-Qo
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzel-0005jJ-Tt; Tue, 05 Jan 2021 22:38:47 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzej-0006IL-8w; Tue, 05 Jan 2021 22:38:43 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpG3kt5z9sW8; Wed,  6 Jan 2021 14:38:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904310;
 bh=LTrtt20FQW0rW0tGMbbp6jPFAUzf10Glde6z9Teh1Qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N5I5AJV9yQWM5ey0hWjxekri7KbX7D4bNpuQwwhBafqI7NDdHg0HKIy2Z/ei5ar/s
 Rf50A2ya+hxTG/dpiF+BbXEsbr6SVPNsi8aYNhfhSqd9dKPJqgcR+zYKS4s/ACe1pm
 RQ7kCPwReRkhJ3xgy/LHdjHMevXiOKH23cwJyz4Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/22] spapr: DRC lookup cannot fail
Date: Wed,  6 Jan 2021 14:37:59 +1100
Message-Id: <20210106033816.232598-6-david@gibson.dropbear.id.au>
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

All memory DRC objects are created during machine init. It is thus safe
to assume spapr_drc_by_id() cannot return NULL when hot-plug/unplugging
memory.

Make this clear with an assertion, like the code already does a few lines
above when looping over memory DRCs. This fixes Coverity reports 1437757
and 1437758.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160805381160.228955.5388294067094240175.stgit@bahia.lan>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 489cefcb81..08f57f9164 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3437,6 +3437,7 @@ static void spapr_add_lmbs(DeviceState *dev, uint64_t addr_start, uint64_t size,
         if (dedicated_hp_event_source) {
             drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                                   addr_start / SPAPR_MEMORY_BLOCK_SIZE);
+            g_assert(drc);
             spapr_hotplug_req_add_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                                    nr_lmbs,
                                                    spapr_drc_index(drc));
@@ -3677,6 +3678,7 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                           addr_start / SPAPR_MEMORY_BLOCK_SIZE);
+    g_assert(drc);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                               nr_lmbs, spapr_drc_index(drc));
 }
-- 
2.29.2


