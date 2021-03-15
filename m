Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19433C7AA
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:24:18 +0100 (CET)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtlC-0004vP-1C
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaR-0000nh-48
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:13:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtaF-0006Ve-Ra
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=343Iudlhyqa3KTi01zwEIVOdtgmn+Ial5kl4C3BXF70=;
 b=NMqFT+kVRz8N5Nzgjmwdi0TMIiSn4SVOVmR7CiWfdpEfEmIrpdkVp8QIc+Je29/nv2d6CM
 TMA9WM2vujPyz0UV8ZdWk47RgwU+AaQ6aI2Aiio6b34F4V5M4dUYVOYzmtIG5p+ZEfDbJp
 jrJymeI7hV+vtaz4TEzN1hOkBIUrmWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-fau3gYVNP9KDIYl2GSnNnQ-1; Mon, 15 Mar 2021 16:12:55 -0400
X-MC-Unique: fau3gYVNP9KDIYl2GSnNnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98AB618460E2;
 Mon, 15 Mar 2021 20:12:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDDAB62680;
 Mon, 15 Mar 2021 20:12:51 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 9/9] migration: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Mon, 15 Mar 2021 20:12:15 +0000
Message-Id: <20210315201215.222539-10-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Replaced various qemu_mutex_lock calls and their respective
qemu_mutex_unlock calls with QEMU_LOCK_GUARD macro. This simplifies
the code by eliminating the respective qemu_mutex_unlock calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Message-Id: <20210311031538.5325-7-ma.mandourr@gmail.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/migration.c | 6 ++----
 migration/ram.c       | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a5ddf43559..36768391b6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -323,7 +323,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
     int ret = 0;
 
     trace_migrate_send_rp_message((int)message_type, len);
-    qemu_mutex_lock(&mis->rp_mutex);
+    QEMU_LOCK_GUARD(&mis->rp_mutex);
 
     /*
      * It's possible that the file handle got lost due to network
@@ -331,7 +331,7 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
      */
     if (!mis->to_src_file) {
         ret = -EIO;
-        goto error;
+        return ret;
     }
 
     qemu_put_be16(mis->to_src_file, (unsigned int)message_type);
@@ -342,8 +342,6 @@ static int migrate_send_rp_message(MigrationIncomingState *mis,
     /* It's possible that qemu file got error during sending */
     ret = qemu_file_get_error(mis->to_src_file);
 
-error:
-    qemu_mutex_unlock(&mis->rp_mutex);
     return ret;
 }
 
diff --git a/migration/ram.c b/migration/ram.c
index 72143da0ac..52537f14ac 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -819,7 +819,7 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
 {
     bool ret;
 
-    qemu_mutex_lock(&rs->bitmap_mutex);
+    QEMU_LOCK_GUARD(&rs->bitmap_mutex);
 
     /*
      * Clear dirty bitmap if needed.  This _must_ be called before we
@@ -852,7 +852,6 @@ static inline bool migration_bitmap_clear_dirty(RAMState *rs,
     if (ret) {
         rs->migration_dirty_pages--;
     }
-    qemu_mutex_unlock(&rs->bitmap_mutex);
 
     return ret;
 }
@@ -3275,7 +3274,7 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
     int idx, thread_count;
 
     thread_count = migrate_decompress_threads();
-    qemu_mutex_lock(&decomp_done_lock);
+    QEMU_LOCK_GUARD(&decomp_done_lock);
     while (true) {
         for (idx = 0; idx < thread_count; idx++) {
             if (decomp_param[idx].done) {
@@ -3295,7 +3294,6 @@ static void decompress_data_with_multi_threads(QEMUFile *f,
             qemu_cond_wait(&decomp_done_cond, &decomp_done_lock);
         }
     }
-    qemu_mutex_unlock(&decomp_done_lock);
 }
 
  /*
-- 
2.30.2


