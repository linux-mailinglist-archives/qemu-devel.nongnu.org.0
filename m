Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194703B9324
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 16:22:11 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyxZy-0004zM-5B
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 10:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUf-0005CA-1e
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lyxUa-000657-1B
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 10:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625148992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pPYfbcJSRE2nAtqT3UIEYmJJfgrlp488u56cgx+7PJ4=;
 b=VHAIjdS73OhsSn69yryLYnSE02/SuAQ6CA51kO811QfoY0lHUcJxrgnGogzz6PXzK+8QUe
 Gvdr0Z3PBpH6sTb+FFN2yxJ3N3jCx1lJHf1qHOhPjtHhFDTSjL8x2zrpyzVjSXKTuKrBBW
 WVmiL/KevtpJj/N1qmCtPdOYs11BxBM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-u-ehSB83Pu6cZTMkmt1yXA-1; Thu, 01 Jul 2021 10:16:31 -0400
X-MC-Unique: u-ehSB83Pu6cZTMkmt1yXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA74804145;
 Thu,  1 Jul 2021 14:16:30 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-230.ams2.redhat.com
 [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2B0E60843;
 Thu,  1 Jul 2021 14:16:27 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 05/20] migration: Allow reset of postcopy_recover_triggered
 when failed
Date: Thu,  1 Jul 2021 15:15:30 +0100
Message-Id: <20210701141545.193571-6-dgilbert@redhat.com>
In-Reply-To: <20210701141545.193571-1-dgilbert@redhat.com>
References: <20210701141545.193571-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: leobras@redhat.com, stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It's possible qemu_start_incoming_migration() failed at any point, when it
happens we should reset postcopy_recover_triggered to false so that the user
can still retry with a saner incoming port.

Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210629181356.217312-3-peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index 1bb03d1eca..fcca289ef7 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2097,6 +2097,13 @@ void qmp_migrate_recover(const char *uri, Error **errp)
 {
     MigrationIncomingState *mis = migration_incoming_get_current();
 
+    /*
+     * Don't even bother to use ERRP_GUARD() as it _must_ always be set by
+     * callers (no one should ignore a recover failure); if there is, it's a
+     * programming error.
+     */
+    assert(errp);
+
     if (mis->state != MIGRATION_STATUS_POSTCOPY_PAUSED) {
         error_setg(errp, "Migrate recover can only be run "
                    "when postcopy is paused.");
@@ -2115,6 +2122,12 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
+
+    /* Safe to dereference with the assert above */
+    if (*errp) {
+        /* Reset the flag so user could still retry */
+        qatomic_set(&mis->postcopy_recover_triggered, false);
+    }
 }
 
 void qmp_migrate_pause(Error **errp)
-- 
2.31.1


