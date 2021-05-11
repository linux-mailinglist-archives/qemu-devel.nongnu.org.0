Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6552B37AA8A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 17:22:52 +0200 (CEST)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUDj-0004YX-ET
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 11:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU18-0007aS-HN
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lgU16-0004YZ-69
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620745786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kut2k8AQFD2uy14NKFAlyp3n85fRNitFkihyuY071Hg=;
 b=QGO02i1pm5u9RKsR7XDWtAIo6fpDar/PxhmnkWowPcMJHWCk9Ta3MTdobyU93g+Dh+u5rY
 k0CGNVcXLcPzjEN1q7gRGG2S5OemIPDbkP7Kt4UDOg3uBC46oi4tTjd9DwhNezRUbs5JLX
 6TECHe+W5iGvT4bJuREeynkWCpWpwWs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-u4od1QOEPR2nU9TRUEdsSw-1; Tue, 11 May 2021 11:09:44 -0400
X-MC-Unique: u4od1QOEPR2nU9TRUEdsSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F32A1006C83;
 Tue, 11 May 2021 15:09:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-51.ams2.redhat.com
 [10.36.113.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC9A7648A0;
 Tue, 11 May 2021 15:09:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, david@redhat.com, zhukeqian1@huawei.com,
 jiangkunkun@huawei.com, armbru@redhat.com, peter.maydell@linaro.org,
 huangy81@chinatelecom.cn
Subject: [PULL 10/17] migration/ram: Discard RAM when growing RAM blocks after
 ram_postcopy_incoming_init()
Date: Tue, 11 May 2021 16:08:35 +0100
Message-Id: <20210511150842.207155-11-dgilbert@redhat.com>
In-Reply-To: <20210511150842.207155-1-dgilbert@redhat.com>
References: <20210511150842.207155-1-dgilbert@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

In case we grow our RAM after ram_postcopy_incoming_init() (e.g., when
synchronizing the RAM block state with the migration source), the resized
part would not get discarded. Let's perform that when being notified
about a resize while postcopy has been advised, but is not listening
yet. With precopy, the process is as following:

1. VM created
- RAM blocks are created
2. Incomming migration started
- Postcopy is advised
- All pages in RAM blocks are discarded
3. Precopy starts
- RAM blocks are resized to match the size on the migration source.
- RAM pages from precopy stream are loaded
- Uffd handler is registered, postcopy starts listening
4. Guest started, postcopy running
- Pagefaults get resolved, pages get placed

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210429112708.12291-7-david@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 77922c445e..e1d081d334 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4099,6 +4099,7 @@ static SaveVMHandlers savevm_ram_handlers = {
 static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
                                       size_t old_size, size_t new_size)
 {
+    PostcopyState ps = postcopy_state_get();
     ram_addr_t offset;
     RAMBlock *rb = qemu_ram_block_from_host(host, false, &offset);
     Error *err = NULL;
@@ -4119,6 +4120,35 @@ static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,
         error_free(err);
         migration_cancel();
     }
+
+    switch (ps) {
+    case POSTCOPY_INCOMING_ADVISE:
+        /*
+         * Update what ram_postcopy_incoming_init()->init_range() does at the
+         * time postcopy was advised. Syncing RAM blocks with the source will
+         * result in RAM resizes.
+         */
+        if (old_size < new_size) {
+            if (ram_discard_range(rb->idstr, old_size, new_size - old_size)) {
+                error_report("RAM block '%s' discard of resized RAM failed",
+                             rb->idstr);
+            }
+        }
+        break;
+    case POSTCOPY_INCOMING_NONE:
+    case POSTCOPY_INCOMING_RUNNING:
+    case POSTCOPY_INCOMING_END:
+        /*
+         * Once our guest is running, postcopy does no longer care about
+         * resizes. When growing, the new memory was not available on the
+         * source, no handler needed.
+         */
+        break;
+    default:
+        error_report("RAM block '%s' resized during postcopy state: %d",
+                     rb->idstr, ps);
+        exit(-1);
+    }
 }
 
 static RAMBlockNotifier ram_mig_ram_notifier = {
-- 
2.31.1


