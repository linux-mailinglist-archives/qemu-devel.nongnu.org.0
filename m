Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EA93156E3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:37:16 +0100 (CET)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Yp1-00012U-5o
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YLH-0004Hq-Sk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YL5-0002UN-Un
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:06:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3rZMY58INtk87tu2FtQul6FS7jcBWV6BgotKQumVfg=;
 b=CzTvBe23lVUZu1Eivmw36xSOUKC33R/jp133OL6jLv6NZQNdzkPp6zORIcvvFSM5+ipRqk
 jKB+Cg1OiI+f5dzcfzoLyUHEVYEaB4E75TXLtY5q9x7lIpAbHEFrcsvfx8pa3Bi0/wHFhK
 hjRlez2tQueQny5nDc+L8XH9IgWxp3Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-qYYv2uncNOe58Z5QXEQsDw-1; Tue, 09 Feb 2021 14:06:16 -0500
X-MC-Unique: qYYv2uncNOe58Z5QXEQsDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B69F1005501
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:06:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03EF460C04;
 Tue,  9 Feb 2021 19:06:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 21/24] DAX:virtiofsd: implement FUSE_INIT map_alignment field
Date: Tue,  9 Feb 2021 19:02:21 +0000
Message-Id: <20210209190224.62827-22-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
index 99ba000c2e..df4527acc9 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -10,6 +10,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/host-utils.h"
 #include "fuse_i.h"
 #include "standard-headers/linux/fuse.h"
 #include "fuse_misc.h"
@@ -2188,6 +2189,12 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     outarg.max_background = se->conn.max_background;
     outarg.congestion_threshold = se->conn.congestion_threshold;
     outarg.time_gran = se->conn.time_gran;
+    if (arg->flags & FUSE_MAP_ALIGNMENT) {
+        outarg.flags |= FUSE_MAP_ALIGNMENT;
+
+        /* This constraint comes from mmap(2) and munmap(2) */
+        outarg.map_alignment = ctz64(sysconf(_SC_PAGE_SIZE));
+    }
 
     fuse_log(FUSE_LOG_DEBUG, "   INIT: %u.%u\n", outarg.major, outarg.minor);
     fuse_log(FUSE_LOG_DEBUG, "   flags=0x%08x\n", outarg.flags);
@@ -2197,6 +2204,7 @@ static void do_init(fuse_req_t req, fuse_ino_t nodeid,
     fuse_log(FUSE_LOG_DEBUG, "   congestion_threshold=%i\n",
              outarg.congestion_threshold);
     fuse_log(FUSE_LOG_DEBUG, "   time_gran=%u\n", outarg.time_gran);
+    fuse_log(FUSE_LOG_DEBUG, "   map_alignment=%u\n", outarg.map_alignment);
 
     send_reply_ok(req, &outarg, outargsize);
 }
-- 
2.29.2


