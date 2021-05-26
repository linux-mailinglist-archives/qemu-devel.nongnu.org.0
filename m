Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B8391EE4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:19:47 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lly82-0006m9-Td
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxcF-0003kM-0P
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxc9-0000CI-1V
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfGFa5L8RLtyop7aM5DLc/+hT8H0rBjVbt1Qo9Sh4lo=;
 b=CHkV0kU1CCl8ZHmySI8xTYEFP80N1eCI5ebamlz24+BwJALr0L3aWwu7z9Pd4qbmVZIv9S
 ygYaaSTT4YcPwpwvFtHp2x3YMI6RX4X8Rv1+YM0355aqjWZ0LWeOvyU2BAOnx/ngqPcYJn
 yUsYaipdzx2EakyWtIDLveIrlpb4OsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-PhuYblm1O4qH6R6YiXw0oA-1; Wed, 26 May 2021 13:46:34 -0400
X-MC-Unique: PhuYblm1O4qH6R6YiXw0oA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F86180FD61;
 Wed, 26 May 2021 17:46:33 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5DAB5D9C6;
 Wed, 26 May 2021 17:46:25 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 12/15] migration/rdma: cleanup rdma in
 rdma_start_incoming_migration error path
Date: Wed, 26 May 2021 18:45:37 +0100
Message-Id: <20210526174540.290588-13-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
References: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

the error path after calling qemu_rdma_dest_init() should do rdma cleanup

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210520081148.17001-1-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/rdma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 41726cc74a..7e7595faab 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -4040,7 +4040,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
 
     if (ret) {
         ERROR(errp, "listening on socket!");
-        goto err;
+        goto cleanup_rdma;
     }
 
     trace_rdma_start_incoming_migration_after_rdma_listen();
@@ -4050,7 +4050,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
         rdma_return_path = qemu_rdma_data_init(host_port, &local_err);
 
         if (rdma_return_path == NULL) {
-            goto err;
+            goto cleanup_rdma;
         }
 
         qemu_rdma_return_path_dest_init(rdma_return_path, rdma);
@@ -4059,6 +4059,9 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
     qemu_set_fd_handler(rdma->channel->fd, rdma_accept_incoming_migration,
                         NULL, (void *)(intptr_t)rdma);
     return;
+
+cleanup_rdma:
+    qemu_rdma_cleanup(rdma);
 err:
     error_propagate(errp, local_err);
     if (rdma) {
-- 
2.31.1


