Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE9F3CF9F4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:58:42 +0200 (CEST)
Received: from localhost ([::1]:56130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pKb-0004rs-Q4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGQ-0004kp-5O
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGN-0008Hk-3n
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MSt/m+s0UORwtA1r2YnMv27vH4CYgJo6nJKJj2HO3Mk=;
 b=FFTNsCJz7xGqrrOlam3KHRiQREq2HaVl7O7+damWjAN5/kNdp99Fa5GB0fWQXpKk4fYS9y
 lioAvI3JRBZF8dU1PJrJgSSugpIs+VspQkUEl6Ye5hoITCvtrDGWWMrfCTGkgUCWf88iQL
 wqllGOa9Z5tYuDhJ4r3gZEsZrFqe9Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-f9BOkJZGN5umoj_wqrCyMA-1; Tue, 20 Jul 2021 08:54:17 -0400
X-MC-Unique: f9BOkJZGN5umoj_wqrCyMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A6F410151E2;
 Tue, 20 Jul 2021 12:54:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FD45D9FC;
 Tue, 20 Jul 2021 12:54:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 08C11112D84A; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/16] vfio: Avoid error_propagate() after
 migrate_add_blocker()
Date: Tue, 20 Jul 2021 14:53:59 +0200
Message-Id: <20210720125408.387910-8-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When migrate_add_blocker(blocker, &errp) is followed by
error_propagate(errp, err), we can often just as well do
migrate_add_blocker(..., errp).  This is the case in
vfio_migration_probe().

Prior art: commit 386f6c07d2 "error: Avoid error_propagate() after
migrate_add_blocker()".

Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/vfio/migration.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 82f654afb6..ff6b45de6b 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -858,7 +858,6 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
     VFIOContainer *container = vbasedev->group->container;
     struct vfio_region_info *info = NULL;
-    Error *local_err = NULL;
     int ret = -ENOTSUP;
 
     if (!vbasedev->enable_migration || !container->dirty_pages_supported) {
@@ -885,9 +884,8 @@ add_blocker:
                "VFIO device doesn't support migration");
     g_free(info);
 
-    ret = migrate_add_blocker(vbasedev->migration_blocker, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
+    if (ret < 0) {
         error_free(vbasedev->migration_blocker);
         vbasedev->migration_blocker = NULL;
     }
-- 
2.31.1


