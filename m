Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCB6BD31F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 16:14:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcpHh-0001ax-1K; Thu, 16 Mar 2023 11:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHO-0001QY-VF
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pcpHM-0003Hn-LD
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 11:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678979551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWtkZ5KFTsPGD80ZLZneVBmuZ3Uxb33J5L1+SLbAgK0=;
 b=GWjFgPYeYFlH4VF6Q2+nBSj3zs7V4TQZafDvw1pTaVEEG9vZMUTZSjUadP0wtDiypvNCUj
 Aln7cKrld5wkTt5iwcjxWgGIF2IQGCkTBxgFpe0vh6axvD864UMDhRSMEdXnmS8cJGFqcB
 BsLlf2KNgdkWk0lojXX+g2m3i9QAKB8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-f8qNwn3LO5S4iizo2R0a1A-1; Thu, 16 Mar 2023 11:12:29 -0400
X-MC-Unique: f8qNwn3LO5S4iizo2R0a1A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6E8A87B2A0;
 Thu, 16 Mar 2023 15:12:29 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC7D2492B02;
 Thu, 16 Mar 2023 15:12:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@fujitsu.com>
Subject: [PULL 2/7] migration/rdma: Fix return-path case
Date: Thu, 16 Mar 2023 16:12:20 +0100
Message-Id: <20230316151225.11362-3-quintela@redhat.com>
In-Reply-To: <20230316151225.11362-1-quintela@redhat.com>
References: <20230316151225.11362-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The RDMA code has return-path handling code, but it's only enabled
if postcopy is enabled; if the 'return-path' migration capability
is enabled, the return path is NOT setup but the core migration
code still tries to use it and breaks.

Enable the RDMA return path if either postcopy or the return-path
capability is enabled.

bz: https://bugzilla.redhat.com/show_bug.cgi?id=2063615

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 288eadc2d2..9d70e9885b 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3373,7 +3373,8 @@ static int qemu_rdma_accept(RDMAContext *rdma)
      * initialize the RDMAContext for return path for postcopy after first
      * connection request reached.
      */
-    if (migrate_postcopy() && !rdma->is_return_path) {
+    if ((migrate_postcopy() || migrate_use_return_path())
+        && !rdma->is_return_path) {
         rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
         if (rdma_return_path == NULL) {
             rdma_ack_cm_event(cm_event);
@@ -3455,7 +3456,8 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     }
 
     /* Accept the second connection request for return path */
-    if (migrate_postcopy() && !rdma->is_return_path) {
+    if ((migrate_postcopy() || migrate_use_return_path())
+        && !rdma->is_return_path) {
         qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                             NULL,
                             (void *)(intptr_t)rdma->return_path);
@@ -4192,7 +4194,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     /* RDMA postcopy need a separate queue pair for return path */
-    if (migrate_postcopy()) {
+    if (migrate_postcopy() || migrate_use_return_path()) {
         rdma_return_path = qemu_rdma_data_init(host_port, errp);
 
         if (rdma_return_path == NULL) {
-- 
2.39.2


