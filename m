Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0B13DF3E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 16:51:31 +0100 (CET)
Received: from localhost ([::1]:44128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is7Qg-00013m-7l
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 10:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1is7MD-0003rr-TX
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1is7MC-0004Y7-BB
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:53 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24077
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1is7MC-0004Xt-7u
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 10:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579189611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NT34jybCSxqqhb9E0i6CiN4hh1ID9VIMQpr6EXCYNx4=;
 b=BgBy/5AuZhmYd1yh8JY8NHK274YVyGf5QgQ3eHnXeJoLwoYh9aSItrUtkW2JSbca+Z5/CL
 1oUhDwsBA3Yh6P3+e1GCLycFqhCFrusgQXWI36bpiRY7JoplMOHkQd5U3h/Wb7Qpvv5O7w
 2m4FCmtuadnnzSiurPyD1psI+72DtI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-LC64tN2XMmCqmcLC1PuU1g-1; Thu, 16 Jan 2020 10:46:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFF448BF0EF
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:46:49 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5E15A6684B;
 Thu, 16 Jan 2020 15:46:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/5] qemu-file: Don't do IO after shutdown
Date: Thu, 16 Jan 2020 16:46:15 +0100
Message-Id: <20200116154616.11569-5-quintela@redhat.com>
In-Reply-To: <20200116154616.11569-1-quintela@redhat.com>
References: <20200116154616.11569-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: LC64tN2XMmCqmcLC1PuU1g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Be sure that we are not doing neither read/write after shutdown of the
QEMUFile.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>

---

Set error in case that there is none (dave)
---
 migration/qemu-file.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 26fb25ddc1..bbb2b63927 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -53,6 +53,8 @@ struct QEMUFile {
=20
     int last_error;
     Error *last_error_obj;
+    /* has the file has been shutdown */
+    bool shutdown;
 };
=20
 /*
@@ -61,10 +63,18 @@ struct QEMUFile {
  */
 int qemu_file_shutdown(QEMUFile *f)
 {
+    int ret;
+
+    f->shutdown =3D true;
     if (!f->ops->shut_down) {
         return -ENOSYS;
     }
-    return f->ops->shut_down(f->opaque, true, true, NULL);
+    ret =3D f->ops->shut_down(f->opaque, true, true, NULL);
+
+    if (!f->last_error) {
+        qemu_file_set_error(f, -EIO);
+    }
+    return ret;
 }
=20
 /*
@@ -214,6 +224,9 @@ void qemu_fflush(QEMUFile *f)
         return;
     }
=20
+    if (f->shutdown) {
+        return;
+    }
     if (f->iovcnt > 0) {
         expect =3D iov_size(f->iov, f->iovcnt);
         ret =3D f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->pos=
,
@@ -328,6 +341,10 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
     f->buf_index =3D 0;
     f->buf_size =3D pending;
=20
+    if (f->shutdown) {
+        return 0;
+    }
+
     len =3D f->ops->get_buffer(f->opaque, f->buf + pending, f->pos,
                              IO_BUF_SIZE - pending, &local_error);
     if (len > 0) {
@@ -642,6 +659,9 @@ int64_t qemu_ftell(QEMUFile *f)
=20
 int qemu_file_rate_limit(QEMUFile *f)
 {
+    if (f->shutdown) {
+        return 1;
+    }
     if (qemu_file_get_error(f)) {
         return 1;
     }
--=20
2.24.1


