Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026D46B9CCB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:16:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8Fz-0001ES-UZ; Tue, 14 Mar 2023 13:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc8Fx-0001DH-Hw
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pc8Fu-0007QC-9G
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678814168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RypGE9aoVlGXhYJoJTu4igqMGEuxpqfA0la/kxZd1rI=;
 b=foCu8FhRVEEWb0+9ee0nfHTtevVJPa7Is72MObU6IIm+P0ko0F+MzD01cm00iNzTcHmEvc
 uwlLjEpe5QC9paKz7sRyz9vPTEmqK3SOJmQjUt8F7sToneEUJSYuqe1M9HY2NYGYL2TSZw
 7k2vYXP5g6oue8Lo2I1WDN9vkeGNhnU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-vYDQPwWFP8OkIwMfe1BI2w-1; Tue, 14 Mar 2023 13:16:07 -0400
X-MC-Unique: vYDQPwWFP8OkIwMfe1BI2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE2683C1485A;
 Tue, 14 Mar 2023 17:16:06 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD87B1121318;
 Tue, 14 Mar 2023 17:16:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	quintela@redhat.com,
	peterx@redhat.com
Cc: lizhijian@cn.fujitsu.com,
	jdenemar@redhat.com
Subject: [PATCH] migration/rdma: Fix return-path case
Date: Tue, 14 Mar 2023 17:15:58 +0000
Message-Id: <20230314171558.75941-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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


