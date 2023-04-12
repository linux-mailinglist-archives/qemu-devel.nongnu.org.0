Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E156E011F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 23:46:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmiHO-0008NZ-Qa; Wed, 12 Apr 2023 17:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHM-0008N0-Ez
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pmiHK-0006dF-W7
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 17:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681335922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BPBrb53DmJ8CjbFG14nTeT2QuDHlsQDJHH5J8fjC+I0=;
 b=LDSLdEXCTc1iPQbslbhinNBo4js9dZQf+B91cYjUiuGkjGNJ+ImZiC0Ko2TbUmsm57uPnP
 q/7zUoWmAxPGN86ZLUUAg97EqnTGClw2vYhOdk3r7MeGH9mt0Loh8YJtCGyM3UI4eGND+P
 wdBK81keF2jT6fzQ4OB+JcerPu9Vz/c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-O-ElFES6MF2eXAxLxbhFQA-1; Wed, 12 Apr 2023 17:45:18 -0400
X-MC-Unique: O-ElFES6MF2eXAxLxbhFQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58A3A185A791;
 Wed, 12 Apr 2023 21:45:18 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D5451121320;
 Wed, 12 Apr 2023 21:45:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Juan Quintela <quintela@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Subject: [PULL 5/5] migration: fix ram_state_pending_exact()
Date: Wed, 12 Apr 2023 23:45:07 +0200
Message-Id: <20230412214507.19816-6-quintela@redhat.com>
In-Reply-To: <20230412214507.19816-1-quintela@redhat.com>
References: <20230412214507.19816-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

I removed that bit on commit:

commit c8df4a7aeffcb46020f610526eea621fa5b0cd47
Author: Juan Quintela <quintela@redhat.com>
Date:   Mon Oct 3 02:00:03 2022 +0200

    migration: Split save_live_pending() into state_pending_*

Fixes: c8df4a7aeffcb46020f610526eea621fa5b0cd47
Suggested-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 9d1817ab7b..79d881f735 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3506,12 +3506,13 @@ static void ram_state_pending_estimate(void *opaque, uint64_t *must_precopy,
 static void ram_state_pending_exact(void *opaque, uint64_t *must_precopy,
                                     uint64_t *can_postcopy)
 {
+    MigrationState *s = migrate_get_current();
     RAMState **temp = opaque;
     RAMState *rs = *temp;
 
     uint64_t remaining_size = rs->migration_dirty_pages * TARGET_PAGE_SIZE;
 
-    if (!migration_in_postcopy()) {
+    if (!migration_in_postcopy() && remaining_size < s->threshold_size) {
         qemu_mutex_lock_iothread();
         WITH_RCU_READ_LOCK_GUARD() {
             migration_bitmap_sync_precopy(rs);
-- 
2.39.2


