Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C444140B10
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 14:39:01 +0100 (CET)
Received: from localhost ([::1]:57408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isRq0-0007vo-9N
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 08:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1isRkS-0002cB-FX
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:33:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1isRkM-000843-1H
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:33:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1isRkL-00083F-Qu
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 08:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579267989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ln0Og2iIEXgA6Vm/1Vi7glo705g6JbWtKjkhmoo+5Qk=;
 b=VbNptmWIuchmCAhm/FqAFsrHDWZn5YIZlt98Xi+mpjqOez9axOJ/FnElBD7fGjmm/dHL/A
 eQHwCny3aU3I58luQIFkgsQXmtLOH8yweZBdG3KsIy945gjAgHnbfbMQHFvVuzvxvCJWA0
 4L1oiXDCvJ7aah6lSfJV5cS3Hrf8JiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-LFfcayQeOpaY3-ARgCJIuA-1; Fri, 17 Jan 2020 08:33:07 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4229100550E
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 13:33:06 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-206-6.brq.redhat.com [10.40.206.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6E0760FC2;
 Fri, 17 Jan 2020 13:32:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 105/104] virtiofsd: Unref old/new inodes with the same mutex
 lock in lo_rename()
Date: Fri, 17 Jan 2020 14:32:57 +0100
Message-Id: <20200117133257.16906-1-philmd@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LFfcayQeOpaY3-ARgCJIuA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, stefanha@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We can unref both old/new inodes with the same mutex lock.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Based-on: <20191212163904.159893-1-dgilbert@redhat.com>
"virtiofs daemon"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg664652.html

 tools/virtiofsd/passthrough_ll.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 57f58aef26..5c717cb5a1 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1461,8 +1461,10 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
     }
=20
 out:
-    unref_inode_lolocked(lo, oldinode, 1);
-    unref_inode_lolocked(lo, newinode, 1);
+    pthread_mutex_lock(&lo->mutex);
+    unref_inode(lo, oldinode, 1);
+    unref_inode(lo, newinode, 1);
+    pthread_mutex_unlock(&lo->mutex);
     lo_inode_put(lo, &oldinode);
     lo_inode_put(lo, &newinode);
     lo_inode_put(lo, &parent_inode);
--=20
2.21.1


