Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6492147F2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 20:31:48 +0200 (CEST)
Received: from localhost ([::1]:59784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrmx0-0004sY-9S
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 14:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvJ-0002ty-9U
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 14:30:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35966
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvH-0001Lz-Fc
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 14:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593887398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rnwhkibuuryD3VaVsetE4dEaQSFYlxZxsA4QPNf181w=;
 b=LA3aDlf1JdiUzt/kHAdQklil35gXSvC3Mwzj0aEWEV/jHqc0po35HRCq5+SK3NVjyeEPK5
 F9KBsqwd1++WVt6qHWcD4xcAzf0nVoEFCXE54SGTURUgk0SUr8Cqmgk4Ga8QfBXBs/qhnn
 RwyO101IAD4kDhdCR1GZ3U9T7drQjiM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-bqjU5aL7N4OiD5aHIShOzg-1; Sat, 04 Jul 2020 14:29:56 -0400
X-MC-Unique: bqjU5aL7N4OiD5aHIShOzg-1
Received: by mail-wr1-f71.google.com with SMTP id v3so6664119wrq.10
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 11:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnwhkibuuryD3VaVsetE4dEaQSFYlxZxsA4QPNf181w=;
 b=UHg4UHeHTa7c+5svaQvOVOQ82RXWhdl4oWQ1tE00FWrBDPrXE+vukCu6AR1H9EsoXZ
 laxhn+14tdtNx6P3CINBJVpMpbm/bW/iRfV0HT7GQdKMpWsRNbDZATVdQnSPpZQjfhgI
 t6ftu787tVgjpoGqqsltOtDvM08+EnW0XBGJMaqbfOi4HmDZ1k1+B99hB+7XdXaqSiTR
 O/TlcuzigW24ZUOQzpcO6wLwoepF/evCHfjSgMxAgATMIwFdLziLst6MYYtJ5c3h+X3d
 J0RF0i0OQzXqJ0+1QcMs/52HmH4Wa8AMxFRUGBh3zYvwHFAvu7iZlUe4nuFy5J9SsqJm
 n0zw==
X-Gm-Message-State: AOAM530V5d+5+HZJFN1AXdP1+vfiXtYquLGTR578+eR90lkk5BXA6W2e
 yHSF2NK00jZWKv7h3gCktGmTUyDI2H/sgQ5Hsaw2ymDXLRT+JohU3lIGDEer/4KjWsofSfhxGuH
 bNgI6RrU2UojwJCo=
X-Received: by 2002:adf:f60a:: with SMTP id t10mr33810099wrp.64.1593887394482; 
 Sat, 04 Jul 2020 11:29:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkm5yQ1qWIomDDGcWAn4+HbF2EUljM6ONyprgX/l9v5ui6ZJIYpxHdFnFzm7gk0vsOvVd3zA==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr33810092wrp.64.1593887394338; 
 Sat, 04 Jul 2020 11:29:54 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 1sm16942120wmf.21.2020.07.04.11.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 11:29:53 -0700 (PDT)
Date: Sat, 4 Jul 2020 14:29:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 11/41] migration/rdma: Use ram_block_discard_disable()
Message-ID: <20200704182750.1088103-12-mst@redhat.com>
References: <20200704182750.1088103-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200704182750.1088103-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:15
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20200626072248.78761-9-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


