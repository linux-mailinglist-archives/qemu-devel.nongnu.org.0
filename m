Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E09F3F93E5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 07:01:11 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTzK-0003rB-Bf
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 01:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpT-0008Qp-UY
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpQ-0000xk-7u
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XmFYbmbIYw4Xw3X3QezS8P5UjgyWd/vuLFna5pdDzkw=;
 b=NYaqIr5x9ZF9S222OCQvvwrv1RXJCFGx5lm7s+/S46tWWZU5vag3jyEsRKhjw08tF9r5b6
 qeJzAAGMIkIWT9HosEF/W1WW1jDjeHoK9xaJzV134SriqlHZ8toyVZNaN9gm9AHqapEq+8
 yvEw8n7Ghq3hroFfsoFfDa0xRwoCq/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Qi_li_ZRMDSi_2qFAeXoYA-1; Fri, 27 Aug 2021 00:50:51 -0400
X-MC-Unique: Qi_li_ZRMDSi_2qFAeXoYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 605BF1008064;
 Fri, 27 Aug 2021 04:50:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 693042854F;
 Fri, 27 Aug 2021 04:50:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8308511380AB; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/15] spapr: Plug memory leak when we can't add a migration
 blocker
Date: Fri, 27 Aug 2021 06:50:31 +0200
Message-Id: <20210827045044.388748-3-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>, peter.maydell@linaro.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 2500fb423adb17995485de0b4d507cf2f09e3a7f
Cc: Aravinda Prasad <arawinda.p@gmail.com>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-3-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ppc/spapr_events.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index 23e2e2fff1..690533cbdc 100644
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


