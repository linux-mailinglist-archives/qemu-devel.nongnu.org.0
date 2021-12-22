Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCE047D11C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:38:33 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzx2-0005jk-JW
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:38:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsa-00014k-R1
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsZ-00071T-9U
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePwBjrIdXczl3c2wHRgJ1SmHdaUFXtRhV80KcYS6f1s=;
 b=UitgY+m9tYyGa6dXsdC3ju44TFPuUuy0KyEoXL+ZZmz16buy3GavnjYNdyYjhTnUSTKrS8
 sMHgS8HSRSytCWa8TohqZzju8f5w09xJEAmenfBEvMHs5zUpRK6AfMIB4ScaeEBFg8+fyh
 MoWK2KXxiAD4eVyzggpYneoFErDBC+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-RdGqzlsOOYKUCzfaUwDkdw-1; Wed, 22 Dec 2021 06:33:47 -0500
X-MC-Unique: RdGqzlsOOYKUCzfaUwDkdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A53551023F53;
 Wed, 22 Dec 2021 11:33:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E90BE7B01D;
 Wed, 22 Dec 2021 11:33:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/9] failover: Silence warning messages during qtest
Date: Wed, 22 Dec 2021 12:32:51 +0100
Message-Id: <20211222113259.823203-2-thuth@redhat.com>
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
References: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

virtio-net-failover test tries several device combinations that produces
some expected warnings.
These warning can be confusing, so we disable them during the qtest
sequence.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Message-Id: <20211220145314.390697-1-lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
[thuth: Fix memory leak by using error_free()]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/net/virtio-net.c   | 7 ++++++-
 migration/migration.c | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5ea0..cf8ab0f8af 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pci.h"
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
+#include "sysemu/qtest.h"
 
 #define VIRTIO_NET_VM_VERSION    11
 
@@ -926,7 +927,11 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         qatomic_set(&n->failover_primary_hidden, false);
         failover_add_primary(n, &err);
         if (err) {
-            warn_report_err(err);
+            if (!qtest_enabled()) {
+                warn_report_err(err);
+            } else {
+                error_free(err);
+            }
         }
     }
 }
diff --git a/migration/migration.c b/migration/migration.c
index 3de11ae921..0652165610 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -60,6 +60,7 @@
 #include "qemu/yank.h"
 #include "sysemu/cpus.h"
 #include "yank_functions.h"
+#include "sysemu/qtest.h"
 
 #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
 
@@ -3766,7 +3767,8 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
             while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
                 qemu_sem_timedwait(&s->wait_unplug_sem, 250);
             }
-            if (qemu_savevm_state_guest_unplug_pending()) {
+            if (qemu_savevm_state_guest_unplug_pending() &&
+                !qtest_enabled()) {
                 warn_report("migration: partially unplugged device on "
                             "failure");
             }
-- 
2.27.0


