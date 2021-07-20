Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD63CF9EF
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:56:34 +0200 (CEST)
Received: from localhost ([::1]:47932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pIX-0007oZ-DK
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGM-0004eb-QY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGK-0008G5-0o
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GS1Z57kHAgWZRtOO6uxALRKUYy2PtHX4ycWEiudgAS8=;
 b=EhhkDHCewa+M0CdbmP31/o4VUWuGufFB+yBOmvalVZPJk80pRd0/l0g5ItCRtd83XTil3r
 4AVPtllQIJnlflJ78a6NSf4P3rjaGlT0/u3DAflYSPjJBV1Y2kEWCCt63dX50O8VSjU49F
 pr0o6/HcHS5lRTR8lGb/W64gs7/RqNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-c0W4a7JHON6_FMzxA8PiFA-1; Tue, 20 Jul 2021 08:54:12 -0400
X-MC-Unique: c0W4a7JHON6_FMzxA8PiFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5C4E800050;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 858F45C1D1;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC30D112D842; Tue, 20 Jul 2021 14:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/16] spapr: Plug memory leak when we can't add a migration
 blocker
Date: Tue, 20 Jul 2021 14:53:54 +0200
Message-Id: <20210720125408.387910-3-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 2500fb423adb17995485de0b4d507cf2f09e3a7f
Cc: Aravinda Prasad <arawinda.p@gmail.com>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ppc/spapr_events.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 0cfc19be19..a8f2cc6bdc 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -872,7 +872,6 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
     SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
     CPUState *cs = CPU(cpu);
     int ret;
-    Error *local_err = NULL;
 
     if (spapr->fwnmi_machine_check_addr == -1) {
         /* Non-FWNMI case, deliver it like an architected CPU interrupt. */
@@ -912,7 +911,7 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
         }
     }
 
-    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, &local_err);
+    ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
     if (ret == -EBUSY) {
         /*
          * We don't want to abort so we let the migration to continue.
-- 
2.31.1


