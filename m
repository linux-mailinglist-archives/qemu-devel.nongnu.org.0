Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E70333455
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:20:54 +0100 (CET)
Received: from localhost ([::1]:43832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqL7-0002hb-8C
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:20:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAw-0003YI-Q9; Tue, 09 Mar 2021 23:10:22 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38577 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAv-0004E4-AW; Tue, 09 Mar 2021 23:10:22 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWf0tGWz9sXG; Wed, 10 Mar 2021 15:10:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349406;
 bh=4oySvY0VN7t1ZKMssZ+OTi1q2plRJDlm+3pnVW+mj8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pnY38UJYMEnwJUS5xbV1ZdgF1mKkJrOPhCcn+KoaldEV+RUjSGynsE9y2X3yrRRfr
 60qQC5F6vMZ8aVWwhdEnYlgr7NofyPzEIyuMDUKmiQCdSIHl+YTno4+kXR0gnFUBQ8
 0OE5K+2T082LSjhUHgviCeaBU21WOFW2UpKt+6QA=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 15/20] spapr.c: add 'unplug already in progress' message for
 PHB unplug
Date: Wed, 10 Mar 2021 15:09:57 +1100
Message-Id: <20210310041002.333813-16-david@gibson.dropbear.id.au>
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

Both CPU hotunplug and PC_DIMM unplug reports an user warning,
mentioning that the hotunplug is in progress, if consecutive
'device_del' are issued in quick succession.

Do the same for PHBs in spapr_phb_unplug_request().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210226163301.419727-4-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 6eaddb12cb..aca3ef9d58 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4034,6 +4034,10 @@ static void spapr_phb_unplug_request(HotplugHandler *hotplug_dev,
     if (!spapr_drc_unplug_requested(drc)) {
         spapr_drc_unplug_request(drc);
         spapr_hotplug_req_remove_by_index(drc);
+    } else {
+        error_setg(errp,
+                   "PCI Host Bridge unplug already in progress for device %s",
+                   dev->id);
     }
 }
 
-- 
2.29.2


