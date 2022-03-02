Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81684CADD8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:47:09 +0100 (CET)
Received: from localhost ([::1]:40266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU0C-0005PG-OR
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkh-0001hM-6U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkf-0000Lf-G9
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fP/tSqp5T3DCO/o7BYpMflxukfHmEcrKyYEABxnV1NI=;
 b=FHzEwVVM41Xc9bzNVARpne9IOgdnYi6m7REM+c4yDtHwWz9a2x+3i9Ba4eDNiAiHuhN5jK
 p2L1ocLA0DOgLRLELyyBFb1sWdHtmXMuYNHGEbtUNP+oZKk6v2bgTDyi3EgtyBtLhv7v3X
 SELM+qPrFLeTCAim+e3F22tT6IwsX3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-csPTRpmnPUO9UR5bsWQgWw-1; Wed, 02 Mar 2022 13:31:01 -0500
X-MC-Unique: csPTRpmnPUO9UR5bsWQgWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 800D084A5F0;
 Wed,  2 Mar 2022 18:31:00 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1B43105916D;
 Wed,  2 Mar 2022 18:30:58 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 16/18] migration: Add migration_incoming_transport_cleanup()
Date: Wed,  2 Mar 2022 18:29:34 +0000
Message-Id: <20220302182936.227719-17-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

Add a helper to cleanup the transport listener.

When do it, we should also null-ify the cleanup hook and the data, then it's
even safe to call it multiple times.

Move the socket_address_list cleanup altogether, because that's a mirror of the
listener channels and only for the purpose of query-migrate.  Hence when
someone wants to cleanup the listener transport, it should also want to cleanup
the socket list too, always.

No functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-15-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 22 ++++++++++++++--------
 migration/migration.h |  1 +
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 306e2ac60e..9cc344514b 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -267,6 +267,19 @@ MigrationIncomingState *migration_incoming_get_current(void)
     return current_incoming;
 }
 
+void migration_incoming_transport_cleanup(MigrationIncomingState *mis)
+{
+    if (mis->socket_address_list) {
+        qapi_free_SocketAddressList(mis->socket_address_list);
+        mis->socket_address_list = NULL;
+    }
+
+    if (mis->transport_cleanup) {
+        mis->transport_cleanup(mis->transport_data);
+        mis->transport_data = mis->transport_cleanup = NULL;
+    }
+}
+
 void migration_incoming_state_destroy(void)
 {
     struct MigrationIncomingState *mis = migration_incoming_get_current();
@@ -287,10 +300,8 @@ void migration_incoming_state_destroy(void)
         g_array_free(mis->postcopy_remote_fds, TRUE);
         mis->postcopy_remote_fds = NULL;
     }
-    if (mis->transport_cleanup) {
-        mis->transport_cleanup(mis->transport_data);
-    }
 
+    migration_incoming_transport_cleanup(mis);
     qemu_event_reset(&mis->main_thread_load_event);
 
     if (mis->page_requested) {
@@ -298,11 +309,6 @@ void migration_incoming_state_destroy(void)
         mis->page_requested = NULL;
     }
 
-    if (mis->socket_address_list) {
-        qapi_free_SocketAddressList(mis->socket_address_list);
-        mis->socket_address_list = NULL;
-    }
-
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index d8b9850eae..2de861df01 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -166,6 +166,7 @@ struct MigrationIncomingState {
 
 MigrationIncomingState *migration_incoming_get_current(void);
 void migration_incoming_state_destroy(void);
+void migration_incoming_transport_cleanup(MigrationIncomingState *mis);
 /*
  * Functions to work with blocktime context
  */
-- 
2.35.1


