Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6606FCE6C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 21:19:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwSqD-00042z-4a; Tue, 09 May 2023 15:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSqA-00040G-Nw
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pwSq9-0006U0-8W
 for qemu-devel@nongnu.org; Tue, 09 May 2023 15:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683659856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1BcKbF05eEbnrWAtopGD6CGeHNYVEyo8PXD3zb0NYcI=;
 b=WyLbglALGWWQLEnOyt0pTqwFcPArg5xp1PlJJs9zQBhD/6wtAE0h6H0RB2sL4ql+8AqrAn
 hinbc5jtx847TefOZePhE+EHMloG81Jul4nCrrp+6H7M2M277io3qOaNWc75zETbfeIpD7
 X7Nyq96mH9/es1LJOxBwSme5mlDcro4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-gLtK75TQPjWe17S7cb5A7g-1; Tue, 09 May 2023 15:17:34 -0400
X-MC-Unique: gLtK75TQPjWe17S7cb5A7g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8DA33850550;
 Tue,  9 May 2023 19:17:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ABDD263F5B;
 Tue,  9 May 2023 19:17:30 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 Leonardo Bras <leobras@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Lukas Straub <lukasstraub2@web.de>
Subject: [PULL 02/10] ram: Let colo_flush_ram_cache take the bitmap_mutex
Date: Tue,  9 May 2023 21:17:16 +0200
Message-Id: <20230509191724.86159-3-quintela@redhat.com>
In-Reply-To: <20230509191724.86159-1-quintela@redhat.com>
References: <20230509191724.86159-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

This is not required, colo_flush_ram_cache does not run concurrently
with the multifd threads since the cache is only flushed after
everything has been received. But it makes me more comfortable.

This will be used in the next commits to add colo support to multifd.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Message-Id: <35cb23ba854151d38a31e3a5c8a1020e4283cb4a.1683572883.git.lukasstraub2@web.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index 0346c1c1ed..3fa720dad9 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3814,6 +3814,7 @@ void colo_flush_ram_cache(void)
     unsigned long offset = 0;
 
     memory_global_dirty_log_sync();
+    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -3848,6 +3849,7 @@ void colo_flush_ram_cache(void)
             }
         }
     }
+    qemu_mutex_unlock(&ram_state->bitmap_mutex);
     trace_colo_flush_ram_cache_end();
 }
 
-- 
2.40.0


