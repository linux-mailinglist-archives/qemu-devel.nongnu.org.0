Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1474CADFE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:58:39 +0100 (CET)
Received: from localhost ([::1]:42740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPUBK-0001sh-Fq
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:58:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkR-0001G8-J7
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkQ-0000Hj-0U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QMuijoeyhdD7ZAKSpw+7FmSCKswDHGvkCzCaIxtCAhA=;
 b=S2sOEvVObKQAweL7tlIo8H3KjI0fZ6eomDs2cWqg1eyqSYmWEdYJ2WbJVsJ9g6msoQkAAS
 kMLa6bJuym1eRqMPM6qOvDZYdGmSqopmzkf7OrPYtiKqyjgWlvX6uDgsufmel40zJ/PDNu
 iw6JF3oZ0bfWWk0QwPTl3ob1YvklcR4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-3f2A1pQyO1y7YfzTABoOOw-1; Wed, 02 Mar 2022 13:30:48 -0500
X-MC-Unique: 3f2A1pQyO1y7YfzTABoOOw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A4284A5F1;
 Wed,  2 Mar 2022 18:30:47 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A95B105916E;
 Wed,  2 Mar 2022 18:30:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 09/18] migration: Tracepoint change in postcopy-run bottom half
Date: Wed,  2 Mar 2022 18:29:27 +0000
Message-Id: <20220302182936.227719-10-dgilbert@redhat.com>
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

Remove the old two tracepoints and they're even near each other:

    trace_loadvm_postcopy_handle_run_cpu_sync()
    trace_loadvm_postcopy_handle_run_vmstart()

Add trace_loadvm_postcopy_handle_run_bh() with a finer granule trace.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-4-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c     | 12 +++++++++---
 migration/trace-events |  3 +--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 190cc5fc42..41e3238798 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2006,13 +2006,19 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     Error *local_err = NULL;
     MigrationIncomingState *mis = opaque;
 
+    trace_loadvm_postcopy_handle_run_bh("enter");
+
     /* TODO we should move all of this lot into postcopy_ram.c or a shared code
      * in migration.c
      */
     cpu_synchronize_all_post_init();
 
+    trace_loadvm_postcopy_handle_run_bh("after cpu sync");
+
     qemu_announce_self(&mis->announce_timer, migrate_announce_params());
 
+    trace_loadvm_postcopy_handle_run_bh("after announce");
+
     /* Make sure all file formats flush their mutable metadata.
      * If we get an error here, just don't restart the VM yet. */
     bdrv_invalidate_cache_all(&local_err);
@@ -2022,9 +2028,7 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
         autostart = false;
     }
 
-    trace_loadvm_postcopy_handle_run_cpu_sync();
-
-    trace_loadvm_postcopy_handle_run_vmstart();
+    trace_loadvm_postcopy_handle_run_bh("after invalidate cache");
 
     dirty_bitmap_mig_before_vm_start();
 
@@ -2037,6 +2041,8 @@ static void loadvm_postcopy_handle_run_bh(void *opaque)
     }
 
     qemu_bh_delete(mis->bh);
+
+    trace_loadvm_postcopy_handle_run_bh("return");
 }
 
 /* After all discards we can start running and asking for pages */
diff --git a/migration/trace-events b/migration/trace-events
index 92596c00d8..1aec580e92 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -16,8 +16,7 @@ loadvm_handle_recv_bitmap(char *s) "%s"
 loadvm_postcopy_handle_advise(void) ""
 loadvm_postcopy_handle_listen(const char *str) "%s"
 loadvm_postcopy_handle_run(void) ""
-loadvm_postcopy_handle_run_cpu_sync(void) ""
-loadvm_postcopy_handle_run_vmstart(void) ""
+loadvm_postcopy_handle_run_bh(const char *str) "%s"
 loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
-- 
2.35.1


