Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8A414715F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:03:43 +0100 (CET)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhlV-0004XC-9T
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41441)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufe9-0005DA-Cu
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufe8-0006eu-49
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:57 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:58943
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufe8-0006eS-0z
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A2OLDzwvIkswhQnYmC967hKOHC8UuZ0BirW2egCo2xI=;
 b=KTV8Hic6mjjNRgBFl040CfB2JC3UcXd2EzNHe97dwYNf+tZ8j+RenOLNvHvtiTrz4lyBB+
 jzYct+4S4XbawgZWG6Ex1NLXohnGgSZbqGEkcHLOdlYYwx55bfkGBk5e7G5ehOwPArqLGL
 crZ0phnDAQAeGmP/uoGyEYL1HasmB8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-uiYjjXtFNzW0xJdapgElZw-1; Thu, 23 Jan 2020 11:47:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9DD67A0A7
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD59319C69;
 Thu, 23 Jan 2020 16:47:49 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 053/108] virtiofsd: Parse flag FUSE_WRITE_KILL_PRIV
Date: Thu, 23 Jan 2020 16:45:35 +0000
Message-Id: <20200123164630.91498-54-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: uiYjjXtFNzW0xJdapgElZw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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

From: Vivek Goyal <vgoyal@redhat.com>

Caller can set FUSE_WRITE_KILL_PRIV in write_flags. Parse it and pass it
to the filesystem.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_common.h   | 6 +++++-
 tools/virtiofsd/fuse_lowlevel.c | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index f8f6433743..686c42c0a5 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -93,8 +93,12 @@ struct fuse_file_info {
      */
     unsigned int cache_readdir:1;
=20
+    /* Indicates that suid/sgid bits should be removed upon write */
+    unsigned int kill_priv:1;
+
+
     /** Padding.  Reserved for future use*/
-    unsigned int padding:25;
+    unsigned int padding:24;
     unsigned int padding2:32;
=20
     /*
diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 02e1d83038..2d6dc5a680 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -1142,6 +1142,7 @@ static void do_write(fuse_req_t req, fuse_ino_t nodei=
d,
     memset(&fi, 0, sizeof(fi));
     fi.fh =3D arg->fh;
     fi.writepage =3D (arg->write_flags & FUSE_WRITE_CACHE) !=3D 0;
+    fi.kill_priv =3D !!(arg->write_flags & FUSE_WRITE_KILL_PRIV);
=20
     fi.lock_owner =3D arg->lock_owner;
     fi.flags =3D arg->flags;
@@ -1177,7 +1178,8 @@ static void do_write_buf(fuse_req_t req, fuse_ino_t n=
odeid,
     fi.lock_owner =3D arg->lock_owner;
     fi.flags =3D arg->flags;
     fi.fh =3D arg->fh;
-    fi.writepage =3D arg->write_flags & FUSE_WRITE_CACHE;
+    fi.writepage =3D !!(arg->write_flags & FUSE_WRITE_CACHE);
+    fi.kill_priv =3D !!(arg->write_flags & FUSE_WRITE_KILL_PRIV);
=20
     if (ibufv->count =3D=3D 1) {
         assert(!(tmpbufv.buf[0].flags & FUSE_BUF_IS_FD));
--=20
2.24.1


