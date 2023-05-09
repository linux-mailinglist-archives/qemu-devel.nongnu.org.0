Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A46FD201
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 00:01:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwVNq-0004Ni-So; Tue, 09 May 2023 18:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNl-0004N4-2a
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pwVNg-0003ez-9K
 for qemu-devel@nongnu.org; Tue, 09 May 2023 18:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683669623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ihVEjBV3U5cCb9uxrle17sGu8lcKCiiO/F9zdoLXP8=;
 b=Si3dBzfBeplcdlep3h1F4ZxSscADXBuoB6v2HrV3Usr825pneLIBUP7MaH5JHQqGJf5jAE
 OFJpLvKQXU4wJUdTHMcNwZnrtmRFn0dFRQVBirCaP9xAg3c0ULzC0CsrlosE8naytaj2gi
 ojy2YwF9bqBWtr9puJwhy+PtTPCbdRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-DVmswm3MNV-QLg8A4gVv3Q-1; Tue, 09 May 2023 18:00:20 -0400
X-MC-Unique: DVmswm3MNV-QLg8A4gVv3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42A1F857E61;
 Tue,  9 May 2023 22:00:20 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.18.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 042002166B26;
 Tue,  9 May 2023 22:00:19 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: Avihai Horon <avihaih@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PULL 2/3] vfio/migration: Skip log_sync during migration SETUP state
Date: Tue,  9 May 2023 15:59:22 -0600
Message-Id: <20230509215923.3186420-3-alex.williamson@redhat.com>
In-Reply-To: <20230509215923.3186420-1-alex.williamson@redhat.com>
References: <20230509215923.3186420-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Avihai Horon <avihaih@nvidia.com>

Currently, VFIO log_sync can be issued while migration is in SETUP
state. However, doing this log_sync is at best redundant and at worst
can fail.

Redundant -- all RAM is marked dirty in migration SETUP state and is
transferred only after migration is set to ACTIVE state, so doing
log_sync during migration SETUP is pointless.

Can fail -- there is a time window, between setting migration state to
SETUP and starting dirty tracking by RAM save_live_setup handler, during
which dirty tracking is still not started. Any VFIO log_sync call that
is issued during this time window will fail. For example, this error can
be triggered by migrating a VM when a GUI is active, which constantly
calls log_sync.

Fix it by skipping VFIO log_sync while migration is in SETUP state.

Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Link: https://lore.kernel.org/r/20230403130000.6422-1-avihaih@nvidia.com
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4d01ea351515..78358ede2764 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -478,7 +478,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     VFIODevice *vbasedev;
     MigrationState *ms = migrate_get_current();
 
-    if (!migration_is_setup_or_active(ms->state)) {
+    if (ms->state != MIGRATION_STATUS_ACTIVE &&
+        ms->state != MIGRATION_STATUS_DEVICE) {
         return false;
     }
 
-- 
2.39.2


