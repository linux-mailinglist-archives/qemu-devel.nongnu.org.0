Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EC54CADEE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:51:37 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU4W-0002dn-8G
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:51:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkf-0001ZO-0G
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkd-0000Ku-Cu
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5B4Qg3Si6icwzLYk2MSPnDdZkFQ4h4oO6akMfjLnkGc=;
 b=NUCHp3mjjkWVQ9AQBtf8+fiP7RINHRD5Ul4s6PxYsc8ftt9Cq/NFYyzR7UrdvRZ0nnyXsH
 afvfPtNj/ldW0IuCWCuMvt03V00VfgODq3QmimdUxI6lS7gHDReXL0ZP1LdYbZmqMeZ3sv
 SQh1KHLZHfLwBBMYaZpc5f0uInbo9ig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-140-Hh3CdOwGO9uPGRV5dKXvFA-1; Wed, 02 Mar 2022 13:30:59 -0500
X-MC-Unique: Hh3CdOwGO9uPGRV5dKXvFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 934731091DA0;
 Wed,  2 Mar 2022 18:30:58 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F03241059166;
 Wed,  2 Mar 2022 18:30:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 15/18] migration: postcopy_pause_fault_thread() never fails
Date: Wed,  2 Mar 2022 18:29:33 +0000
Message-Id: <20220302182936.227719-16-dgilbert@redhat.com>
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

Per the title, remove the return code and simplify the callers as the errors
will never be triggered.  No functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-12-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index b0d12d5053..32c52f4b1d 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -891,15 +891,11 @@ static void mark_postcopy_blocktime_end(uintptr_t addr)
                                       affected_cpu);
 }
 
-static bool postcopy_pause_fault_thread(MigrationIncomingState *mis)
+static void postcopy_pause_fault_thread(MigrationIncomingState *mis)
 {
     trace_postcopy_pause_fault_thread();
-
     qemu_sem_wait(&mis->postcopy_pause_sem_fault);
-
     trace_postcopy_pause_fault_thread_continued();
-
-    return true;
 }
 
 /*
@@ -959,13 +955,7 @@ static void *postcopy_ram_fault_thread(void *opaque)
              * broken already using the event. We should hold until
              * the channel is rebuilt.
              */
-            if (postcopy_pause_fault_thread(mis)) {
-                /* Continue to read the userfaultfd */
-            } else {
-                error_report("%s: paused but don't allow to continue",
-                             __func__);
-                break;
-            }
+            postcopy_pause_fault_thread(mis);
         }
 
         if (pfd[1].revents) {
@@ -1039,15 +1029,8 @@ retry:
                                         msg.arg.pagefault.address);
             if (ret) {
                 /* May be network failure, try to wait for recovery */
-                if (postcopy_pause_fault_thread(mis)) {
-                    /* We got reconnected somehow, try to continue */
-                    goto retry;
-                } else {
-                    /* This is a unavoidable fault */
-                    error_report("%s: postcopy_request_page() get %d",
-                                 __func__, ret);
-                    break;
-                }
+                postcopy_pause_fault_thread(mis);
+                goto retry;
             }
         }
 
-- 
2.35.1


