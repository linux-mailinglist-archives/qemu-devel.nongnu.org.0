Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCFD2B0CEA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:44:43 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHaM-0001OU-Bm
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUj-00034b-5X
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdHUe-0006Xi-JM
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:38:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605206324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sg7HcRs2/FAFweiOx5ZTXonC5w7t3XsXU78QHE7ftHY=;
 b=famE+JF5WViOcUURtfPIcGpWVjkDZIosLdkqJ7f6dDnR6qHAjBMEJuZArU+jKJiObNwepz
 XKV+gtEbt4uJzxwTGuGPHC+aelsQ/Z+el6CfusWjvZAcRAsAqmqsriD2aX3nETdvulEw91
 j5WJGIhlmHr7iGMLzxrg9KHzOpASfZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-toDMNw8nOkGhNti1dbIhag-1; Thu, 12 Nov 2020 13:38:42 -0500
X-MC-Unique: toDMNw8nOkGhNti1dbIhag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99F78049D5;
 Thu, 12 Nov 2020 18:38:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-60.ams2.redhat.com
 [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD8755D9E4;
 Thu, 12 Nov 2020 18:38:38 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kuhn.chenqun@huawei.com, zhengchuan@huawei.com,
 lihaotian9@huawei.com, longpeng2@huawei.com, liangpeng10@huawei.com,
 philmd@redhat.com, liuzhiqiang26@huawei.com
Subject: [PULL 08/11] virtiofsd: Announce submounts even without statx()
Date: Thu, 12 Nov 2020 18:37:55 +0000
Message-Id: <20201112183758.203176-9-dgilbert@redhat.com>
In-Reply-To: <20201112183758.203176-1-dgilbert@redhat.com>
References: <20201112183758.203176-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:52:29
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

From: Max Reitz <mreitz@redhat.com>

Contrary to what the check (and warning) in lo_init() claims, we can
announce submounts just fine even without statx() -- the check is based
on comparing both the mount ID and st_dev of parent and child.  Without
statx(), we will not have the mount ID; but we always have st_dev.

The only problems we have (without statx() and its mount ID) are:

(1) Mounting the same device twice may lead to both trees being treated
    as exactly the same tree by virtiofsd.  But that is a problem that
    is completely independent of mirroring host submounts in the guest.
    Both submount roots will still show the FUSE_SUBMOUNT flag, because
    their st_dev still differs from their respective parent.

(2) There is only one exception to (1), and that is if you mount a
    device inside a mount of itself: Then, its st_dev will be the same
    as that of its parent, and so without a mount ID, virtiofsd will not
    be able to recognize the nested mount's root as a submount.
    However, thanks to virtiofsd then treating both trees as exactly the
    same tree, it will be caught up in a loop when the guest tries to
    examine the nested submount, so the guest will always see nothing
    but an ELOOP there.  Therefore, this case is just fully broken
    without statx(), whether we check for submounts (based on st_dev) or
    not.

All in all, checking for submounts works well even without comparing the
mount ID (i.e., without statx()).  The only concern is an edge case
that, without statx() mount IDs, is utterly broken anyway.

Thus, drop said check in lo_init().

Reported-by: Miklos Szeredi <mszeredi@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201103164135.169325-1-mreitz@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index ec1008bceb..6c64b03f1a 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -610,14 +610,6 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
                  "does not support it\n");
         lo->announce_submounts = false;
     }
-
-#ifndef CONFIG_STATX
-    if (lo->announce_submounts) {
-        fuse_log(FUSE_LOG_WARNING, "lo_init: Cannot announce submounts, there "
-                 "is no statx()\n");
-        lo->announce_submounts = false;
-    }
-#endif
 }
 
 static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
-- 
2.28.0


