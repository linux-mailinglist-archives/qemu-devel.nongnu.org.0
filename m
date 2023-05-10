Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF0F6FE3A3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:10:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwoGG-0002UE-SO; Wed, 10 May 2023 14:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGF-0002Td-0B
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwoGD-0000jh-Jx
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:09:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683742196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eWwxtlJniONLWPAkMdusLsygWswRB8hl7+bUhJjdpJc=;
 b=WbC0MhP7PTK3U48YJO1uDTChdne4S8+KN/cl0xRYe1ggf0OEvs9cnzAuwhRyU5UR1/Kdv+
 nYXcWb077sVKN5/Gqy5+XMbzX+1FFIyVAY7iEXNFe4IBMJuKexmai13Vb1k0WTDimn7GBl
 qqqDevUPUQ3IS4iVp/8aqj4b7QrWapM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-9Eny09lDMBSCzRl9sPrDew-1; Wed, 10 May 2023 14:09:51 -0400
X-MC-Unique: 9Eny09lDMBSCzRl9sPrDew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3246C805F58;
 Wed, 10 May 2023 18:09:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1DA41410DD5;
 Wed, 10 May 2023 18:09:48 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eric Blake <eblake@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 03/10] multifd: Add the ramblock to MultiFDRecvParams
Date: Wed, 10 May 2023 20:09:31 +0200
Message-Id: <20230510180938.6338-4-quintela@redhat.com>
In-Reply-To: <20230510180938.6338-1-quintela@redhat.com>
References: <20230510180938.6338-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Lukas Straub <lukasstraub2@web.de>

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <88135197411df1a71d7832962b39abf60faf0021.1683572883.git.lukasstraub2@web.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  2 ++
 migration/multifd.c | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7cfc265148..a835643b48 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -175,6 +175,8 @@ typedef struct {
     uint32_t next_packet_size;
     /* packets sent through this channel */
     uint64_t num_packets;
+    /* ramblock */
+    RAMBlock *block;
     /* ramblock host address */
     uint8_t *host;
     /* non zero pages recv through this channel */
diff --git a/migration/multifd.c b/migration/multifd.c
index 4e71c19292..5c4298eadf 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -281,7 +281,6 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 {
     MultiFDPacket_t *packet = p->packet;
-    RAMBlock *block;
     int i;
 
     packet->magic = be32_to_cpu(packet->magic);
@@ -331,21 +330,21 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
 
     /* make sure that ramblock is 0 terminated */
     packet->ramblock[255] = 0;
-    block = qemu_ram_block_by_name(packet->ramblock);
-    if (!block) {
+    p->block = qemu_ram_block_by_name(packet->ramblock);
+    if (!p->block) {
         error_setg(errp, "multifd: unknown ram block %s",
                    packet->ramblock);
         return -1;
     }
 
-    p->host = block->host;
+    p->host = p->block->host;
     for (i = 0; i < p->normal_num; i++) {
         uint64_t offset = be64_to_cpu(packet->offset[i]);
 
-        if (offset > (block->used_length - p->page_size)) {
+        if (offset > (p->block->used_length - p->page_size)) {
             error_setg(errp, "multifd: offset too long %" PRIu64
                        " (max " RAM_ADDR_FMT ")",
-                       offset, block->used_length);
+                       offset, p->block->used_length);
             return -1;
         }
         p->normal[i] = offset;
-- 
2.40.1


