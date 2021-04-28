Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8636D660
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:22:00 +0200 (CEST)
Received: from localhost ([::1]:56166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbiGW-0003ZU-0a
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxY-0006mA-5x
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhxW-0005If-Fb
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+viPE2GJ9eEbW+GOrQDDEYes7MrDZKw/MISp+dVDbpo=;
 b=WvzTNGEp07PmOiIRIoThDAhpiiAYIFRqx0P35Zc3KRR1Ag52kzpxfLR3kB6CDM/rLMSxpO
 NL7P5Wdh4kTYXUTf5J9Ge4kslI+NvZAEfqkcp/HX5k3wgHGQwku3icLa/yDdBrL4D0a7/L
 Jle+4AwVGWkPbl0mFXuRcLMEmLe9XdI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-bmLTLqWLPgujBaExUbenQw-1; Wed, 28 Apr 2021 07:02:18 -0400
X-MC-Unique: bmLTLqWLPgujBaExUbenQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3509100A622;
 Wed, 28 Apr 2021 11:02:17 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1D311002D71;
 Wed, 28 Apr 2021 11:02:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 23/26] DAX:virtiofsd: implement FUSE_INIT map_alignment
 field
Date: Wed, 28 Apr 2021 12:00:57 +0100
Message-Id: <20210428110100.27757-24-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Communicate the host page size to the FUSE client so that
FUSE_SETUPMAPPING/FUSE_REMOVEMAPPING requests are aware of our alignment
constraints.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 6930574aaf..50fc5c8d5a 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "fuse_i.h"
 #include "standard-headers/linux/fuse.h"
 #include "fuse_misc.h"
@@ -2194,6 +2195,12 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     outarg.max_background = se->conn.max_background;
     outarg.congestion_threshold = se->conn.congestion_threshold;
     outarg.time_gran = se->conn.time_gran;
+    if (arg->flags & FUSE_MAP_ALIGNMENT) {
+        outarg.flags |= FUSE_MAP_ALIGNMENT;
+
+        /* This constraint comes from mmap(2) and munmap(2) */
+        outarg.map_alignment = ctz64(sysconf(_SC_PAGE_SIZE));
+    }
 
     if (se->conn.want & FUSE_CAP_HANDLE_KILLPRIV_V2) {
         outarg.flags |= FUSE_HANDLE_KILLPRIV_V2;
@@ -2207,6 +2214,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     fuse_log(FUSE_LOG_DEBUG, "   congestion_threshold=%i\n",
              outarg.congestion_threshold);
     fuse_log(FUSE_LOG_DEBUG, "   time_gran=%u\n", outarg.time_gran);
+    fuse_log(FUSE_LOG_DEBUG, "   map_alignment=%u\n", outarg.map_alignment);
 
     send_reply_ok(req, &outarg, outargsize);
 }
-- 
2.31.1


