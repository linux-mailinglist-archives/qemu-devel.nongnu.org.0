Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730FE143E26
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:41:00 +0100 (CET)
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittm7-0003Hy-3P
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:40:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52598)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsh1-0002rX-Im
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsgw-0004Zt-Oe
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:38 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:30618
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsgw-0004Ye-KJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMEU6RqbbMIzrbh3zo1HPnxLpqiR6fuNta5U7+e0S2M=;
 b=YLGHy5+U0N7HPYbOPJB+J2fP4DwSSelHw9G95iWh3KoARZZTWpuyGhuHxYJ0Zwex9UN3x5
 ddcP2OWpkfimvOxm88ipAky5X5vzaSgcNkl4RZSKHgUcDttuLP9Y/nowl9RvdrIhsWEYq7
 4AelFk1ldhayr05Lr5yPS0434Q1Vu3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-mvkITGsDNIKqk1Owo1n_gA-1; Tue, 21 Jan 2020 07:31:27 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DD1A19057D7;
 Tue, 21 Jan 2020 12:31:26 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB62060BE0;
 Tue, 21 Jan 2020 12:31:24 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 081/109] virtiofsd: add helper for lo_data cleanup
Date: Tue, 21 Jan 2020 12:24:05 +0000
Message-Id: <20200121122433.50803-82-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: mvkITGsDNIKqk1Owo1n_gA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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

From: Liu Bo <bo.liu@linux.alibaba.com>

This offers an helper function for lo_data's cleanup.

Signed-off-by: Liu Bo <bo.liu@linux.alibaba.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 462c250382..ac40cd4391 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2407,6 +2407,26 @@ static gboolean lo_key_equal(gconstpointer a, gconst=
pointer b)
     return la->ino =3D=3D lb->ino && la->dev =3D=3D lb->dev;
 }
=20
+static void fuse_lo_data_cleanup(struct lo_data *lo)
+{
+    if (lo->inodes) {
+        g_hash_table_destroy(lo->inodes);
+    }
+    lo_map_destroy(&lo->fd_map);
+    lo_map_destroy(&lo->dirp_map);
+    lo_map_destroy(&lo->ino_map);
+
+    if (lo->proc_self_fd >=3D 0) {
+        close(lo->proc_self_fd);
+    }
+
+    if (lo->root.fd >=3D 0) {
+        close(lo->root.fd);
+    }
+
+    free(lo->source);
+}
+
 int main(int argc, char *argv[])
 {
     struct fuse_args args =3D FUSE_ARGS_INIT(argc, argv);
@@ -2554,22 +2574,7 @@ err_out2:
 err_out1:
     fuse_opt_free_args(&args);
=20
-    if (lo.inodes) {
-        g_hash_table_destroy(lo.inodes);
-    }
-    lo_map_destroy(&lo.fd_map);
-    lo_map_destroy(&lo.dirp_map);
-    lo_map_destroy(&lo.ino_map);
-
-    if (lo.proc_self_fd >=3D 0) {
-        close(lo.proc_self_fd);
-    }
-
-    if (lo.root.fd >=3D 0) {
-        close(lo.root.fd);
-    }
-
-    free(lo.source);
+    fuse_lo_data_cleanup(&lo);
=20
     return ret ? 1 : 0;
 }
--=20
2.24.1


