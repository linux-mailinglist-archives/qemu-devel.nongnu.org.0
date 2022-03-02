Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FBE4CADCE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:46:12 +0100 (CET)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPTzH-0004VG-0g
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:46:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkP-0001Aq-Fe
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkN-0000HU-Qh
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQEpxXYDKo25qii7TXS62u3K8NDhEgNMVxi0JvIKVTw=;
 b=FuIVX6CxKKi+uq31Q+27fm6m2aTh5IFMAHqZ4uavc6lqMYruv2H/+QUtyp3TMMtuFbblL1
 OyCCtanCs5ngKMU/IZaFPXRaN55/Ra597t7NkBqYPtNXrhH1zHOP33vLjiOXqiCwul88fO
 o7HzTA6j0n2rBrAbOCWuVhRsc0OSQU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-Nt8cHhzOM26m8IxKqpesJQ-1; Wed, 02 Mar 2022 13:30:46 -0500
X-MC-Unique: Nt8cHhzOM26m8IxKqpesJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E88E184A5F2;
 Wed,  2 Mar 2022 18:30:44 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB761059166;
 Wed,  2 Mar 2022 18:30:43 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 08/18] migration: Finer grained tracepoints for POSTCOPY_LISTEN
Date: Wed,  2 Mar 2022 18:29:26 +0000
Message-Id: <20220302182936.227719-9-dgilbert@redhat.com>
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

The enablement of postcopy listening has a few steps, add a few tracepoints to
be there ready for some basic measurements for them.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-3-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c     | 9 ++++++++-
 migration/trace-events | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 7bb65e1d61..190cc5fc42 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1948,9 +1948,10 @@ static void *postcopy_ram_listen_thread(void *opaque)
 static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
 {
     PostcopyState ps = postcopy_state_set(POSTCOPY_INCOMING_LISTENING);
-    trace_loadvm_postcopy_handle_listen();
     Error *local_err = NULL;
 
+    trace_loadvm_postcopy_handle_listen("enter");
+
     if (ps != POSTCOPY_INCOMING_ADVISE && ps != POSTCOPY_INCOMING_DISCARD) {
         error_report("CMD_POSTCOPY_LISTEN in wrong postcopy state (%d)", ps);
         return -1;
@@ -1965,6 +1966,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after discard");
+
     /*
      * Sensitise RAM - can now generate requests for blocks that don't exist
      * However, at this point the CPU shouldn't be running, and the IO
@@ -1977,6 +1980,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
         }
     }
 
+    trace_loadvm_postcopy_handle_listen("after uffd");
+
     if (postcopy_notify(POSTCOPY_NOTIFY_INBOUND_LISTEN, &local_err)) {
         error_report_err(local_err);
         return -1;
@@ -1991,6 +1996,8 @@ static int loadvm_postcopy_handle_listen(MigrationIncomingState *mis)
     qemu_sem_wait(&mis->listen_thread_sem);
     qemu_sem_destroy(&mis->listen_thread_sem);
 
+    trace_loadvm_postcopy_handle_listen("return");
+
     return 0;
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index 123cfe79d7..92596c00d8 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -14,7 +14,7 @@ loadvm_handle_cmd_packaged_main(int ret) "%d"
 loadvm_handle_cmd_packaged_received(int ret) "%d"
 loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
-loadvm_postcopy_handle_listen(void) ""
+loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
 loadvm_postcopy_handle_run_cpu_sync(void) ""
 loadvm_postcopy_handle_run_vmstart(void) ""
-- 
2.35.1


