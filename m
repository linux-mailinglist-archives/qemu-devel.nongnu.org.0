Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C391A143DF7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:25:15 +0100 (CET)
Received: from localhost ([::1]:53766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittWs-0001P0-6a
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:25:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsgA-0002HZ-JF
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsg6-0004FZ-MF
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35392
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsg6-0004FQ-IU
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCoXgCHuW4YobTJDLLmNVUZVBzaUcZ9QYMkO5J43DOU=;
 b=a/CgaGm59wQiFA7+FTzvuUfBWVPmcl++bOeo721J58r5QUOqpxKCbmhOmXgNor4ZedM/j6
 nKU8oxQQRqMqsqcQx3yudkHLtplnOqj4zYV9rfPKQbkzKSbGRWuhZN8XKpoPJp4JACnrK6
 RUCdtl5uXyyDYd3OWHLbwpm5Yp6Y7ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-DLrnWxwVOHaNAbW9jy1-Hg-1; Tue, 21 Jan 2020 07:30:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 084B38018C4;
 Tue, 21 Jan 2020 12:30:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FB3360C81;
 Tue, 21 Jan 2020 12:30:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 068/109] virtiofsd: passthrough_ll: add renameat2 support
Date: Tue, 21 Jan 2020 12:23:52 +0000
Message-Id: <20200121122433.50803-69-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DLrnWxwVOHaNAbW9jy1-Hg-1
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

From: Miklos Szeredi <mszeredi@redhat.com>

Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index a7fb34ac0c..6f3ad14141 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1099,7 +1099,17 @@ static void lo_rename(fuse_req_t req, fuse_ino_t par=
ent, const char *name,
     }
=20
     if (flags) {
+#ifndef SYS_renameat2
         fuse_reply_err(req, EINVAL);
+#else
+        res =3D syscall(SYS_renameat2, lo_fd(req, parent), name,
+                       lo_fd(req, newparent), newname, flags);
+        if (res =3D=3D -1 && errno =3D=3D ENOSYS) {
+            fuse_reply_err(req, EINVAL);
+        } else {
+            fuse_reply_err(req, res =3D=3D -1 ? errno : 0);
+        }
+#endif
         return;
     }
=20
--=20
2.24.1


