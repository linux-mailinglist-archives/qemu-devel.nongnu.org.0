Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10652A34C2
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 20:59:51 +0100 (CET)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZfza-0004yo-Ln
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 14:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZfxM-0003Gg-84
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:57:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZfxE-0002HZ-2e
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 14:57:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604347042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kxeYddukYIG9wx6uBE7A6ECu+R5n9URcKomMBVBdZaY=;
 b=f4ZuWTimlPt2k60GoHHAcvpTRwNalyO9gk0ur/IgqlUZdI7h0flP40NVcrUb0EiC6YHsu9
 bwUa/asoCpFp0bJN7knouOCxblwWpcyOtWoIe2l0sDVW8RtpR1FH0JU+eRJDQscPoaxDeI
 J1bxI8iDjzH5AtE+xXBfUPKO7o5CSKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-PKJLE_pMOKmQF4st_h-YRw-1; Mon, 02 Nov 2020 14:57:15 -0500
X-MC-Unique: PKJLE_pMOKmQF4st_h-YRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDE1157056;
 Mon,  2 Nov 2020 19:57:14 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDBF1002C0A;
 Mon,  2 Nov 2020 19:57:13 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, peterx@redhat.com, philmd@redhat.com,
 zhangjiachen.jaycee@bytedance.com, mreitz@redhat.com
Subject: [PULL 04/12] tools/virtiofsd: Check vu_init() return value (CID
 1435958)
Date: Mon,  2 Nov 2020 19:56:49 +0000
Message-Id: <20201102195657.219501-5-dgilbert@redhat.com>
In-Reply-To: <20201102195657.219501-1-dgilbert@redhat.com>
References: <20201102195657.219501-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Since commit 6f5fd837889, vu_init() can fail if malloc() returns NULL.

This fixes the following Coverity warning:

  CID 1435958 (#1 of 1): Unchecked return value (CHECKED_RETURN)

Fixes: 6f5fd837889 ("libvhost-user: support many virtqueues")
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201102092339.2034297-1-philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 324936948d..83ba07c6cd 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -1013,8 +1013,11 @@ int virtio_session_mount(struct fuse_session *se)
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
     pthread_rwlock_init(&se->virtio_dev->vu_dispatch_rwlock, NULL);
-    vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
-            fv_set_watch, fv_remove_watch, &fv_iface);
+    if (!vu_init(&se->virtio_dev->dev, 2, se->vu_socketfd, fv_panic, NULL,
+                 fv_set_watch, fv_remove_watch, &fv_iface)) {
+        fuse_log(FUSE_LOG_ERR, "%s: vu_init failed\n", __func__);
+        return -1;
+    }
 
     return 0;
 }
-- 
2.28.0


