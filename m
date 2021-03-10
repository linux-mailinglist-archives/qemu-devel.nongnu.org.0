Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8D033345A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:25:44 +0100 (CET)
Received: from localhost ([::1]:58574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqPn-00014D-Ca
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAz-0003cm-Fm; Tue, 09 Mar 2021 23:10:25 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:58943 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAx-0004FY-Qk; Tue, 09 Mar 2021 23:10:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf2kCtz9shn; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=Pvi76breuEyFm035IaxECDDmYM+pX4UKxGtWO8tdvFM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lKuxTZyUKnxjxQWi9f+DOI61fjPbSmJ5tQo9hA+TvUHVHg8iyDwvK5T9Cwwvmu5QG
 VKcGxiI5w4xshlPzH75Q1Upm2odY+316JRhDRH/nTFgCIVWshnFIUk8Q5npTaL921Z
 QLY5Qx+hqAC05wHe/Y5aMdANbM5npnZ67lJlNjSo=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 19/20] spapr.c: remove duplicated assert in
 spapr_memory_unplug_request()
Date: Wed, 10 Mar 2021 15:10:01 +1100
Message-Id: <20210310041002.333813-20-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310041002.333813-1-david@gibson.dropbear.id.au>
References: <20210310041002.333813-1-david@gibson.dropbear.id.au>
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

From: Daniel Henrique Barboza <danielhb413@gmail.com>

We are asserting the existence of the first DRC LMB after sending unplug
requests to all LMBs of the DIMM, where every DRC is being asserted
inside the loop. This means that the first DRC is being asserted twice.

Remove the duplicated assert.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210302141019.153729-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index aca3ef9d58..b579830832 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3703,7 +3703,6 @@ static void spapr_memory_unplug_request(HotplugHandler *hotplug_dev,
 
     drc = spapr_drc_by_id(TYPE_SPAPR_DRC_LMB,
                           addr_start / SPAPR_MEMORY_BLOCK_SIZE);
-    g_assert(drc);
     spapr_hotplug_req_remove_by_count_indexed(SPAPR_DR_CONNECTOR_TYPE_LMB,
                                               nr_lmbs, spapr_drc_index(drc));
 }
-- 
2.29.2


