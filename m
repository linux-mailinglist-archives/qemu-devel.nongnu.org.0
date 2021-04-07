Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D163573C1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 19:58:03 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCRG-0006eG-5S
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUCNr-0002HB-Fk
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUCNn-0005VN-8P
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 13:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617818066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CApt4YVZe8dalznNHwV9qgpeG5mlB6qk179DmDj0bLU=;
 b=guPuLeEVpPZgy7jsB7NaZjHMqK2I2Mpx6EuYMbDA4GQGj+Lbb58GglDafYLBYtHUNDPJiH
 WbZTmESqBOpIO9xz6WAO0JazrSW0Gu+hZP43rI4oajHmSic701ZcDJVemAfFgGFfDVdrYr
 AVyX6WE9P+HHF+CgNhms/hpDvqB7VdQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-n3_sF7_vNXSeuGjFlPOGag-1; Wed, 07 Apr 2021 13:54:24 -0400
X-MC-Unique: n3_sF7_vNXSeuGjFlPOGag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4FA801FCE;
 Wed,  7 Apr 2021 17:54:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-14.ams2.redhat.com
 [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51C4510013D7;
 Wed,  7 Apr 2021 17:54:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, andrey.gruzdev@virtuozzo.com,
 huangy81@chinatelecom.cn
Subject: [PULL 3/6] migration: Inhibit virtio-balloon for the duration of
 background snapshot
Date: Wed,  7 Apr 2021 18:54:13 +0100
Message-Id: <20210407175416.201555-4-dgilbert@redhat.com>
In-Reply-To: <20210407175416.201555-1-dgilbert@redhat.com>
References: <20210407175416.201555-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>

The same thing as for incoming postcopy - we cannot deal with concurrent
RAM discards when using background snapshot feature in outgoing migration.

Fixes: 8518278a6af589ccc401f06e35f171b1e6fae800 (migration: implementation
  of background snapshot thread)
Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Reported-by: David Hildenbrand <david@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210401092226.102804-3-andrey.gruzdev@virtuozzo.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/virtio-balloon.c | 8 ++++++--
 include/migration/misc.h   | 2 ++
 migration/migration.c      | 8 ++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index e770955176..d120bf8f43 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -66,8 +66,12 @@ static bool virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
 
 static bool virtio_balloon_inhibited(void)
 {
-    /* Postcopy cannot deal with concurrent discards, so it's special. */
-    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy();
+    /*
+     * Postcopy cannot deal with concurrent discards,
+     * so it's special, as well as background snapshots.
+     */
+    return ram_block_discard_is_disabled() || migration_in_incoming_postcopy() ||
+            migration_in_bg_snapshot();
 }
 
 static void balloon_inflate_page(VirtIOBalloon *balloon,
diff --git a/include/migration/misc.h b/include/migration/misc.h
index bccc1b6b44..738675ef52 100644
--- a/include/migration/misc.h
+++ b/include/migration/misc.h
@@ -70,6 +70,8 @@ bool migration_in_postcopy_after_devices(MigrationState *);
 void migration_global_dump(Monitor *mon);
 /* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
 bool migration_in_incoming_postcopy(void);
+/* True if background snapshot is active */
+bool migration_in_bg_snapshot(void);
 
 /* migration/block-dirty-bitmap.c */
 void dirty_bitmap_mig_init(void);
diff --git a/migration/migration.c b/migration/migration.c
index 00e13f9d58..be4729e7c8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1976,6 +1976,14 @@ bool migration_in_incoming_postcopy(void)
     return ps >= POSTCOPY_INCOMING_DISCARD && ps < POSTCOPY_INCOMING_END;
 }
 
+bool migration_in_bg_snapshot(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return migrate_background_snapshot() &&
+            migration_is_setup_or_active(s->state);
+}
+
 bool migration_is_idle(void)
 {
     MigrationState *s = current_migration;
-- 
2.31.1


