Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B256B1DB3AB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 14:37:32 +0200 (CEST)
Received: from localhost ([::1]:39984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbNyV-0005N3-Mz
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 08:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNtl-0004i0-4i
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:32:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29288
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jbNtk-0007Te-7H
 for qemu-devel@nongnu.org; Wed, 20 May 2020 08:32:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589977955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ltKYoFTOFOwpgkCR+dwMIxXVVeSfSRqAc7bfSqKPYMw=;
 b=IP+stV+1X126LqE8K5CGN3asm64esuNAPIiY+gj4MGfQ1CfzYzR/Zf7AINgpR4vPNLkLcQ
 ERph7HesCno4yvhs0airzUBhV0Tud2hxQp24LVE3H/PngOVyufWVwqjakX8bEubyoHdczy
 LmaOBNjUm9xbzF+N9Lb6oB3rHQg5XXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-aSsHCautMRepCBYq4ho0cA-1; Wed, 20 May 2020 08:32:33 -0400
X-MC-Unique: aSsHCautMRepCBYq4ho0cA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9997718FE868;
 Wed, 20 May 2020 12:32:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 870C46AD16;
 Wed, 20 May 2020 12:32:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/19] migration/rdma: Use ram_block_discard_disable()
Date: Wed, 20 May 2020 14:31:40 +0200
Message-Id: <20200520123152.60527-8-david@redhat.com>
In-Reply-To: <20200520123152.60527-1-david@redhat.com>
References: <20200520123152.60527-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 01:34:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/rdma.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 967fda5b0c..57e2cbc8ca 100644
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
@@ -4065,10 +4072,17 @@ void rdma_start_outgoing_migration(void *opaque,
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
2.25.4


