Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB220AD29
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 09:30:44 +0200 (CEST)
Received: from localhost ([::1]:47294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joiot-00034i-LB
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 03:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joiic-0000U8-Tf
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60997
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1joiiZ-0003T3-3O
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 03:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593156250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K0bxEZTNG5tW1NNkUgKUn7jrte0My/UUwSbEJ+zpHfA=;
 b=gO2FYyWmnhnO4K6IeXOkcAnOggPzWJqvM2VejaGlm2FFwUJo+EzBH65JeswLSbTZSDdYl7
 gMR4lcdTeHS7bL4Jna6mI4AeXcMPgNNEaTrViHuM0xQoAvuqWbUPzKrhbZpVQKQlmOb3VO
 zQxk9jfHR6ZmaVAgsAsUMTlvTxw9ddU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-x4u5xWUmOFavdCVnY9fXzA-1; Fri, 26 Jun 2020 03:24:06 -0400
X-MC-Unique: x4u5xWUmOFavdCVnY9fXzA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 831CD804002;
 Fri, 26 Jun 2020 07:24:05 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-35.ams2.redhat.com [10.36.113.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 846311C8;
 Fri, 26 Jun 2020 07:24:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/21] migration/rdma: Use ram_block_discard_disable()
Date: Fri, 26 Jun 2020 09:22:35 +0200
Message-Id: <20200626072248.78761-9-david@redhat.com>
In-Reply-To: <20200626072248.78761-1-david@redhat.com>
References: <20200626072248.78761-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=205.139.110.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RDMA will pin all guest memory (as documented in docs/rdma.txt). We want
to disable RAM block discards - however, to keep it simple use
ram_block_discard_is_required() instead of inhibiting.

Note: It is not sufficient to limit disabling to pin_all. Even when only
conditionally pinning 1 MB chunks, as soon as one page within such a
chunk was discarded and one page not, the discarded pages will be pinned
as well.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/rdma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index ec45d33ba3..bbe6f36627 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -29,6 +29,7 @@
 #include "qemu/sockets.h"
 #include "qemu/bitmap.h"
 #include "qemu/coroutine.h"
+#include "exec/memory.h"
 #include <sys/socket.h>
 #include <netdb.h>
 #include <arpa/inet.h>
@@ -4017,8 +4018,14 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
     Error *local_err = NULL;
 
     trace_rdma_start_incoming_migration();
-    rdma = qemu_rdma_data_init(host_port, &local_err);
 
+    /* Avoid ram_block_discard_disable(), cannot change during migration. */
+    if (ram_block_discard_is_required()) {
+        error_setg(errp, "RDMA: cannot disable RAM discard");
+        return;
+    }
+
+    rdma = qemu_rdma_data_init(host_port, &local_err);
     if (rdma == NULL) {
         goto err;
     }
@@ -4067,10 +4074,17 @@ void rdma_start_outgoing_migration(void *opaque,
                             const char *host_port, Error **errp)
 {
     MigrationState *s = opaque;
-    RDMAContext *rdma = qemu_rdma_data_init(host_port, errp);
     RDMAContext *rdma_return_path = NULL;
+    RDMAContext *rdma;
     int ret = 0;
 
+    /* Avoid ram_block_discard_disable(), cannot change during migration. */
+    if (ram_block_discard_is_required()) {
+        error_setg(errp, "RDMA: cannot disable RAM discard");
+        return;
+    }
+
+    rdma = qemu_rdma_data_init(host_port, errp);
     if (rdma == NULL) {
         goto err;
     }
-- 
2.26.2


