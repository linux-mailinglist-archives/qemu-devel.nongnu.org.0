Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B665EAEC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPd3-0000Z6-Vi; Thu, 05 Jan 2023 07:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPco-0000Y0-Es
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pDPcl-0005n3-Ic
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672922734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+IS4Y6fGGsCuR9XOBO1PNaZzDstFV80dEiNW+nhajw=;
 b=bDymI19Tjaw3uGsyJO8kQUwgq4XFbQ7Tmh7kGIF0JOPG6VZtzaIjZItjxidmMCQ3JTEuye
 /TwK9GlM51YKt3tBKt80aMY/acF1vAZD2c9vb8Qy4q64hcMl5RaB7GnnxjMxHllt55ByjJ
 N9skPpesLhUI0LwWv7Vm12g3dln6sqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-qiut-mYEOc-zKoqEgjT7Aw-1; Thu, 05 Jan 2023 07:45:33 -0500
X-MC-Unique: qiut-mYEOc-zKoqEgjT7Aw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E08B811E9C;
 Thu,  5 Jan 2023 12:45:33 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C061121314;
 Thu,  5 Jan 2023 12:45:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-stable@nongnu.org
Subject: [PATCH v1 1/5] migration/ram: Fix populate_read_range()
Date: Thu,  5 Jan 2023 13:45:24 +0100
Message-Id: <20230105124528.93813-2-david@redhat.com>
In-Reply-To: <20230105124528.93813-1-david@redhat.com>
References: <20230105124528.93813-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

Unfortunately, commit f7b9dcfbcf44 broke populate_read_range(): the loop
end condition is very wrong, resulting in that function not populating the
full range. Lets' fix that.

Fixes: f7b9dcfbcf44 ("migration/ram: Factor out populating pages readable in ram_block_populate_pages()")
Cc: qemu-stable@nongnu.org
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 334309f1c6..b8f58d2a40 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1774,13 +1774,15 @@ out:
 static inline void populate_read_range(RAMBlock *block, ram_addr_t offset,
                                        ram_addr_t size)
 {
+    const ram_addr_t end = offset + size;
+
     /*
      * We read one byte of each page; this will preallocate page tables if
      * required and populate the shared zeropage on MAP_PRIVATE anonymous memory
      * where no page was populated yet. This might require adaption when
      * supporting other mappings, like shmem.
      */
-    for (; offset < size; offset += block->page_size) {
+    for (; offset < end; offset += block->page_size) {
         char tmp = *((char *)block->host + offset);
 
         /* Don't optimize the read out */
-- 
2.39.0


