Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811F4143F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:14:21 +0100 (CET)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ituIO-0001K9-BA
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:14:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52796)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itshp-0003R0-C3
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itshl-0004tn-7O
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:28348
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itshl-0004tc-3w
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:32:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSykeGBw36+fNBraRHympEaWn/xC5M19guYdlASgcVs=;
 b=FzzSclJSNpLB8lX10IgMeF1wZ/SjTzJeoDIxoPzlztLsjIDyvnF4GvEdHTgtRAPEGFLmyA
 Y4F6QjGWW1BY6+iwzYvgvr8KKuJTjowzy5SiQikQLSAmPXb8nCt1bzOMzQ7DIzEFeCkAQN
 diJJgsMXRaZmhKfRJWPSI04/B/DW2+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-XJQs5RABO7GhMX77qmP4qw-1; Tue, 21 Jan 2020 07:32:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83B118017CC;
 Tue, 21 Jan 2020 12:32:22 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A71760BE0;
 Tue, 21 Jan 2020 12:32:15 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 096/109] virtiofsd: do not always set FUSE_FLOCK_LOCKS
Date: Tue, 21 Jan 2020 12:24:20 +0000
Message-Id: <20200121122433.50803-97-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XJQs5RABO7GhMX77qmP4qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peng Tao <tao.peng@linux.alibaba.com>

Right now we always enable it regardless of given commandlines.
Fix it by setting the flag relying on the lo->flock bit.

Signed-off-by: Peng Tao <tao.peng@linux.alibaba.com>
Reviewed-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Reviewed-by: Sergio Lopez <slp@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 820172308f..4c3a48325f 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -546,9 +546,14 @@ static void lo_init(void *userdata, struct fuse_conn_i=
nfo *conn)
         fuse_log(FUSE_LOG_DEBUG, "lo_init: activating writeback\n");
         conn->want |=3D FUSE_CAP_WRITEBACK_CACHE;
     }
-    if (lo->flock && conn->capable & FUSE_CAP_FLOCK_LOCKS) {
-        fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
-        conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
+    if (conn->capable & FUSE_CAP_FLOCK_LOCKS) {
+        if (lo->flock) {
+            fuse_log(FUSE_LOG_DEBUG, "lo_init: activating flock locks\n");
+            conn->want |=3D FUSE_CAP_FLOCK_LOCKS;
+        } else {
+            fuse_log(FUSE_LOG_DEBUG, "lo_init: disabling flock locks\n");
+            conn->want &=3D ~FUSE_CAP_FLOCK_LOCKS;
+        }
     }
=20
     if (conn->capable & FUSE_CAP_POSIX_LOCKS) {
--=20
2.24.1


