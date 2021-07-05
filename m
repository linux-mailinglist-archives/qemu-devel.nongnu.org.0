Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A73BBADD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:11:12 +0200 (CEST)
Received: from localhost ([::1]:50636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LZH-0005Qp-TD
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRh-0000e7-VL
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m0LRf-0000zc-4y
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625479398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bWSVkaQLg9fnLysApXUXsqjRYe9B5EjHAPM+SLaUhmg=;
 b=GuIFTLd/ZAf3qrnPnKqOF5f6TOawuWGQ9k5idzNdTC2tnBkG2YAw/CiHXmNlw4q5UdXhOW
 suNCPSPS9LKPzaKozbVreQ+WO321jwEuolalqYNOrUFYvf26FCOZPEY3JqEjLCTmY9BYoX
 jprsHxApzJNaSF30VAM9npYNPd3a6FU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-H8GybJ_sNoWyx4HxujMH1w-1; Mon, 05 Jul 2021 06:03:17 -0400
X-MC-Unique: H8GybJ_sNoWyx4HxujMH1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB92100C611;
 Mon,  5 Jul 2021 10:03:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-11.ams2.redhat.com
 [10.36.114.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAF3360C0F;
 Mon,  5 Jul 2021 10:03:01 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, linfeng23@huawei.com,
 groug@kaod.org, huangy81@chinatelecom.cn, lvivier@redhat.com,
 lizhijian@cn.fujitsu.com, peterx@redhat.com, vgoyal@redhat.com
Subject: [PULL 03/19] migration: Move yank outside
 qemu_start_incoming_migration()
Date: Mon,  5 Jul 2021 11:02:19 +0100
Message-Id: <20210705100235.157093-4-dgilbert@redhat.com>
In-Reply-To: <20210705100235.157093-1-dgilbert@redhat.com>
References: <20210705100235.157093-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

Starting from commit b5eea99ec2f5c, qmp_migrate_recover() calls unregister
before calling qemu_start_incoming_migration(). I believe it wanted to mitigate
the next call to yank_register_instance(), but I think that's wrong.

Firstly, if during recover, we should keep the yank instance there, not
"quickly removing and adding it back".

Meanwhile, calling qmp_migrate_recover() twice with b5eea99ec2f5c will directly
crash the dest qemu (right now it can't; but it'll start to work right after
the next patch) because the 1st call of qmp_migrate_recover() will unregister
permanently when the channel failed to establish, then the 2nd call of
qmp_migrate_recover() crashes at yank_unregister_instance().

This patch fixes it by moving yank ops out of qemu_start_incoming_migration()
into qmp_migrate_incoming.  For qmp_migrate_recover(), drop the unregister of
yank instance too since we keep it there during the recovery phase.

Signed-off-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20210629181356.217312-2-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4228635d18..1bb03d1eca 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -456,10 +456,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
-        return;
-    }
-
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
@@ -474,7 +470,6 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
     } else if (strstart(uri, "fd:", &p)) {
         fd_start_incoming_migration(p, errp);
     } else {
-        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_setg(errp, "unknown migration protocol: %s", uri);
     }
 }
@@ -2083,9 +2078,14 @@ void qmp_migrate_incoming(const char *uri, Error **errp)
         return;
     }
 
+    if (!yank_register_instance(MIGRATION_YANK_INSTANCE, errp)) {
+        return;
+    }
+
     qemu_start_incoming_migration(uri, &local_err);
 
     if (local_err) {
+        yank_unregister_instance(MIGRATION_YANK_INSTANCE);
         error_propagate(errp, local_err);
         return;
     }
@@ -2114,7 +2114,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * only re-setup the migration stream and poke existing migration
      * to continue using that newly established channel.
      */
-    yank_unregister_instance(MIGRATION_YANK_INSTANCE);
     qemu_start_incoming_migration(uri, errp);
 }
 
-- 
2.31.1


