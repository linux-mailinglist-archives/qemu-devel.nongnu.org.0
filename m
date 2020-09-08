Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D5C2609F3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 07:23:47 +0200 (CEST)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFW6c-0003EU-Tt
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 01:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3I-0005xz-Tr; Tue, 08 Sep 2020 01:20:20 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38209 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kFW3F-0005sO-LW; Tue, 08 Sep 2020 01:20:20 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Bltkk269zz9sTr; Tue,  8 Sep 2020 15:19:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1599542398;
 bh=ugr0WxY1CRWShk3/UQfX+l/l8XSozOlyduL+5OhU5iA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YGP+LUwtBPrX9IQ6uOGVUZBcIfKZePUHMGXKmJYassycaVxlpw35rZcH2pFnf72BZ
 FANnlqy6iuDsHTkbTVm/P7j4tQVe2vzAQC5Ed/nJkddvCnoXRj19DeZRBxv0QsLpeZ
 ossdawNQ9QOaEVHVKbFNLZ24orhSuIyDQnMqQ4AY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 06/33] spapr_vscsi: do not allow device hotplug
Date: Tue,  8 Sep 2020 15:19:26 +1000
Message-Id: <20200908051953.1616885-7-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
References: <20200908051953.1616885-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:19:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, bauerman@linux.ibm.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

We do not implement hotplug in the vscsi bus, but we forgot to
tell qdev about it. The result is that users are able to hotplug
devices in the vscsi bus, the devices appear in qdev, but they
aren't usable by the guest OS unless the user reboots it first.

Setting qbus hotplug_handler to NULL will tell qdev-monitor, via
qbus_is_hotpluggable(), that we do not support hotplug operations
in spapr_vscsi.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1862059

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20200820190635.379657-1-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/scsi/spapr_vscsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index d17dc03c73..57f0a1336f 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1219,6 +1219,9 @@ static void spapr_vscsi_realize(SpaprVioDevice *dev, Error **errp)
 
     scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
                  &vscsi_scsi_info, NULL);
+
+    /* ibmvscsi SCSI bus does not allow hotplug. */
+    qbus_set_hotplug_handler(BUS(&s->bus), NULL);
 }
 
 void spapr_vscsi_create(SpaprVioBus *bus)
-- 
2.26.2


