Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC041C732
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 16:48:40 +0200 (CEST)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVasx-0003Dy-KG
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 10:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVanw-0006Vy-35
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVanr-0007Ey-0F
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 10:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632926601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QPFVtgnSycwYsq1Snzvi16Yhd+SzcH50TfjPkh7zvQ=;
 b=MXwzZpzZOxIl1z1aIzCa+E1gqo1vkcF/TAo3tVQE9P7haNmotBkV5oq47dWUniyCVTaFOM
 wCukzD5khWCPMygZAqwh6G7sZTzyIU2uEm1KwCreRucy2Wrbq+a5/9CLad66g2V3iLdTo5
 RI+fUrr2pO5hjjwHlJLZd57D1Ey6y6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-hCcobd_xNkSPCWH9QhAujA-1; Wed, 29 Sep 2021 10:43:18 -0400
X-MC-Unique: hCcobd_xNkSPCWH9QhAujA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68B3D802CBA
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 14:43:17 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D6361017CF5;
 Wed, 29 Sep 2021 14:43:15 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] failover: don't allow to migrate a paused VM that needs
 PCI unplug
Date: Wed, 29 Sep 2021 16:43:11 +0200
Message-Id: <20210929144311.1168561-3-lvivier@redhat.com>
In-Reply-To: <20210929144311.1168561-1-lvivier@redhat.com>
References: <20210929144311.1168561-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As the guest OS is paused, we will never receive the unplug event
from the kernel and the migration cannot continue.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/net/virtio-net.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f205331dcf8c..e54b6c8cd86c 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -37,8 +37,10 @@
 #include "qapi/qapi-events-migration.h"
 #include "hw/virtio/virtio-access.h"
 #include "migration/misc.h"
+#include "migration/migration.h"
 #include "standard-headers/linux/ethtool.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/runstate.h"
 #include "trace.h"
 #include "monitor/qdev.h"
 #include "hw/pci/pci.h"
@@ -3279,7 +3281,13 @@ static void virtio_net_handle_migration_primary(VirtIONet *n, MigrationState *s)
     should_be_hidden = qatomic_read(&n->failover_primary_hidden);
 
     if (migration_in_setup(s) && !should_be_hidden) {
-        if (failover_unplug_primary(n, dev)) {
+        if (!runstate_is_running()) {
+            Error *err = NULL;
+            error_setg(&err,
+                       "cannot unplug primary device while VM is paused");
+            migration_cancel(err);
+            error_free(err);
+        } else if (failover_unplug_primary(n, dev)) {
             vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);
             qapi_event_send_unplug_primary(dev->id);
             qatomic_set(&n->failover_primary_hidden, true);
-- 
2.31.1


