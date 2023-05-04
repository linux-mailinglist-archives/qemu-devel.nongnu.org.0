Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510946F09F5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 18:36:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps4ak-0005Va-54; Thu, 27 Apr 2023 12:35:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4ah-0005Uo-Vw
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ps4ag-0006qL-3X
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 12:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682613329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MR22qS+hH/2q31GosffhAixHKQy1yQTpaWbEt4e7Is8=;
 b=SuPxViBARpFKtKX+m1mmiam0WnlIXkmCkGwxgZMAV6ZLs+hBRSWcMI2AVsNPR+MRWixhXk
 cyHtlk20VQAby43rIN22+Xa1LFB+AqttjAaToUT1B0GZDtsN1gf/MmubTunh0xFG7r/W/g
 wwqztSXCv69KTuwcHh4Bb6FcMKutFSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-md4CrwyON6WrIRL24uQAnA-1; Thu, 27 Apr 2023 12:35:11 -0400
X-MC-Unique: md4CrwyON6WrIRL24uQAnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5EC0A3C1179E
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 16:35:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9597F10DF8;
 Thu, 27 Apr 2023 16:35:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>
Subject: [PATCH 10/19] migration/rdma: Don't pass the QIOChannelRDMA as an
 opaque
Date: Thu, 27 Apr 2023 18:34:40 +0200
Message-Id: <20230427163449.27473-11-quintela@redhat.com>
In-Reply-To: <20230427163449.27473-1-quintela@redhat.com>
References: <20230427163449.27473-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We can calculate it from the QEMUFile like the caller.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 77bbe3da36..40b8e2da51 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3527,7 +3527,7 @@ static int dest_ram_sort_func(const void *a, const void *b)
  *
  * Keep doing this until the source tells us to stop.
  */
-static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque)
+static int qemu_rdma_registration_handle(QEMUFile *f)
 {
     RDMAControlHeader reg_resp = { .len = sizeof(RDMARegisterResult),
                                .type = RDMA_CONTROL_REGISTER_RESULT,
@@ -3539,7 +3539,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque)
                              };
     RDMAControlHeader blocks = { .type = RDMA_CONTROL_RAM_BLOCKS_RESULT,
                                  .repeat = 1 };
-    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
     RDMALocalBlocks *local;
     RDMAControlHeader head;
@@ -3852,7 +3852,7 @@ static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
         return rdma_block_notification_handle(rioc, data);
 
     case RAM_CONTROL_HOOK:
-        return qemu_rdma_registration_handle(f, rioc);
+        return qemu_rdma_registration_handle(f);
 
     default:
         /* Shouldn't be called with any other values */
-- 
2.40.0


