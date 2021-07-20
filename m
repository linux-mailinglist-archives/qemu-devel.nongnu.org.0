Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5173CF9F3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:58:39 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pKY-0004m3-FA
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGM-0004ey-QU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGK-0008Gq-1J
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZ1q2MYPGu49QOTbjqzdIl9/u+FXvgLsoW4DA3BJq4Q=;
 b=ikmsuJIGoc0/+Erfh6gWdmICk4nV2hzj6grqf2JzWXfhx3iICCid0q46Tr9aOlA+dynXaL
 bk7n//C7Xg+JCVVJk/w4M8AamM9p0yDop00VetANqi/JHbyQNvHq5eDyGWnQFT6qayh34/
 qs20a7bJuM9W/IrJZ7xiHarQydxQaJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-gOCnyc92PWS94GMmpZk0gA-1; Tue, 20 Jul 2021 08:54:12 -0400
X-MC-Unique: gOCnyc92PWS94GMmpZk0gA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B970A81C85E;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 858845C1CF;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EFC4D112D844; Tue, 20 Jul 2021 14:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/16] spapr: Explain purpose of ->fwnmi_migration_blocker
 more clearly
Date: Tue, 20 Jul 2021 14:53:55 +0200
Message-Id: <20210720125408.387910-4-armbru@redhat.com>
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_mce_req_event() makes an effort to prevent migration from
degrading the reporting of FWNMIs.  It adds a migration blocker when
it receives one, and deletes it when it's done handling it.  This is a
best effort.

Commit 2500fb423a "migration: Include migration support for machine
check handling" tried to explain this in a comment.  Rewrite the
comment for clarity, and reposition it to make it clear it applies to
all failure modes, not just "migration already in progress".

Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Aravinda Prasad <arawinda.p@gmail.com>
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ppc/spapr_events.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
index a8f2cc6bdc..7d6876f12d 100644
--- a/hw/ppc/spapr_events.c
+++ b/hw/ppc/spapr_events.c
@@ -911,16 +911,17 @@ void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
         }
     }
 
+    /*
+     * Try to block migration while FWNMI is being handled, so the
+     * machine check handler runs where the information passed to it
+     * actually makes sense.  This shouldn't actually block migration,
+     * only delay it slightly, assuming migration is retried.  If the
+     * attempt to block fails, carry on.  Unfortunately, it always
+     * fails when running with -only-migrate.  A proper interface to
+     * delay migration completion for a bit could avoid that.
+     */
     ret = migrate_add_blocker(spapr->fwnmi_migration_blocker, NULL);
     if (ret == -EBUSY) {
-        /*
-         * We don't want to abort so we let the migration to continue.
-         * In a rare case, the machine check handler will run on the target.
-         * Though this is not preferable, it is better than aborting
-         * the migration or killing the VM. It is okay to call
-         * migrate_del_blocker on a blocker that was not added (which the
-         * nmi-interlock handler would do when it's called after this).
-         */
         warn_report("Received a fwnmi while migration was in progress");
     }
 
-- 
2.31.1


