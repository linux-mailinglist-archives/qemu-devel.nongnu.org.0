Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2BD4756B2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:31 +0100 (CET)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRkx-0000ip-0n
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:43:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaP-0002vj-F6
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRaM-0007Gk-UH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KjiJvbQ1kYdTB1Gdp4xeCCdGswEw1RXIIh3/v03iwhw=;
 b=AVs22cJ4vJnf+6K+tZlYdDxlJWoNN/jUoZ3mBuiS0eJNG73WiA7SlgfpT6nPIhAAIcsMq7
 o9BLodzNYHkmNHO8h6R4JR9QfQJVuV9rD+amtrRJME1I0J6e3jxJ3FUteua1EULAD5t3jk
 nhTkg7dHRmNlwD6gmT/ik5zhWHS2phM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-IfNzd_a5ONmulE_iFCXJtQ-1; Wed, 15 Dec 2021 05:32:25 -0500
X-MC-Unique: IfNzd_a5ONmulE_iFCXJtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5698410B7440;
 Wed, 15 Dec 2021 10:32:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 807C275C3A;
 Wed, 15 Dec 2021 10:32:21 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] migration/ram.c: Remove the qemu_mutex_lock in
 colo_flush_ram_cache.
Date: Wed, 15 Dec 2021 11:32:01 +0100
Message-Id: <20211215103218.17527-2-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The code to acquire bitmap_mutex is added in the commit of
"63268c4970a5f126cc9af75f3ccb8057abef5ec0". There is no
need to acquire bitmap_mutex in colo_flush_ram_cache(). This
is because the colo_flush_ram_cache only be called on the COLO
secondary VM, which is the destination side.
On the COLO secondary VM, only the COLO thread will touch
the bitmap of ram cache.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Zhang Chen <chen.zhang@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 863035d235..2c688f5bbb 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3918,7 +3918,6 @@ void colo_flush_ram_cache(void)
     unsigned long offset = 0;
 
     memory_global_dirty_log_sync();
-    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -3954,7 +3953,6 @@ void colo_flush_ram_cache(void)
         }
     }
     trace_colo_flush_ram_cache_end();
-    qemu_mutex_unlock(&ram_state->bitmap_mutex);
 }
 
 /**
-- 
2.33.1


