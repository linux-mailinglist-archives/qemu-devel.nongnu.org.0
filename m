Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CB146B30
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 15:24:32 +0100 (CET)
Received: from localhost ([::1]:57928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iudPK-000847-VE
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 09:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iubAW-00047F-Nb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iubAR-0006Kn-D8
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:01:04 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51768
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iubAR-00067D-6P
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579780844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I24qiScxZIlbZghmzV5IGz3tbAkotYcSQUQCVFodY9M=;
 b=f4by3EOQy84jg7EnnbdukYPSp407kU80lJ7oTCNicT/VVC9L0kXBq2rB6hNmBKpSbiGcFr
 bGBQsq6d5YfbQh5Z5i158KxZjLKAODdoB5Ji56quk0H7GPVFCY6tk1HbFHHvnegI0KOiQ9
 JaKtgBX1FE9ju/AlDA/5UUxS38sM6nw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218--N_ZWyMOMNeZBGJNYqmBbQ-1; Thu, 23 Jan 2020 07:00:33 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3E78018B1
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 12:00:32 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A778A8575C;
 Thu, 23 Jan 2020 12:00:29 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 071/111] virtiofsd: passthrough_ll: control readdirplus
Date: Thu, 23 Jan 2020 11:58:01 +0000
Message-Id: <20200123115841.138849-72-dgilbert@redhat.com>
In-Reply-To: <20200123115841.138849-1-dgilbert@redhat.com>
References: <20200123115841.138849-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -N_ZWyMOMNeZBGJNYqmBbQ-1
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

From: Miklos Szeredi <mszeredi@redhat.com>

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/helper.c         | 4 ++++
 tools/virtiofsd/passthrough_ll.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/helper.c b/tools/virtiofsd/helper.c
index 6d50a46a7e..14f5d70c10 100644
--- a/tools/virtiofsd/helper.c
+++ b/tools/virtiofsd/helper.c
@@ -153,6 +153,10 @@ void fuse_cmdline_help(void)
            "                               allowed (default: 10)\n"
            "    -o norace                  disable racy fallback\n"
            "                               default: false\n"
+           "    -o readdirplus|no_readdirplus\n"
+           "                               enable/disable readirplus\n"
+           "                               default: readdirplus except wit=
h "
+           "cache=3Dnever\n"
           );
 }
=20
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 6480c517dc..8b1784ff7b 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -117,6 +117,8 @@ struct lo_data {
     double timeout;
     int cache;
     int timeout_set;
+    int readdirplus_set;
+    int readdirplus_clear;
     struct lo_inode root; /* protected by lo->mutex */
     struct lo_map ino_map; /* protected by lo->mutex */
     struct lo_map dirp_map; /* protected by lo->mutex */
@@ -140,6 +142,8 @@ static const struct fuse_opt lo_opts[] =3D {
     { "cache=3Dauto", offsetof(struct lo_data, cache), CACHE_NORMAL },
     { "cache=3Dalways", offsetof(struct lo_data, cache), CACHE_ALWAYS },
     { "norace", offsetof(struct lo_data, norace), 1 },
+    { "readdirplus", offsetof(struct lo_data, readdirplus_set), 1 },
+    { "no_readdirplus", offsetof(struct lo_data, readdirplus_clear), 1 },
     FUSE_OPT_END
 };
 static bool use_syslog =3D false;
@@ -478,7 +482,8 @@ static void lo_init(void *userdata, struct fuse_conn_in=
fo *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
         conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
     }
-    if (lo->cache =3D=3D CACHE_NEVER) {
+    if ((lo->cache =3D=3D CACHE_NEVER && !lo->readdirplus_set) ||
+        lo->readdirplus_clear) {
         fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling readdirplus\n");
         conn->want &=3D ~FUSE_CAP_READDIRPLUS;
     }
--=20
2.24.1


