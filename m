Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83A12E5F3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jan 2020 13:00:26 +0100 (CET)
Received: from localhost ([::1]:40268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1imz9N-0008Iq-V7
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 07:00:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1imz5S-0002fO-L7
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1imz5R-0007Q3-Gk
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:22 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:29951
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1imz5R-0007Or-04
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 06:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577966180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cZuJFppdIygI7a0JFt5qSBIq2Ddt1WNFM8RuXUYvobw=;
 b=IzXQmCMvpNv2FfICycX18SDMAXrOQB/uooipzKTg5W/q/8ZbNrpn9RK757VKlGY/VYMFvu
 hudRrEhGRReGCJMsZlqJbtl2SVn7zisPVbNBblyYpHtmfYkBFIbhI7I4dl8q6q6Lng2g+y
 xhwPLMfJaDGhqPYHbz3xlH4KEvwYZ3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-7SQQfBl_Mr6jhRyWqRaSyg-1; Thu, 02 Jan 2020 06:56:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E2BD18C43CD
 for <qemu-devel@nongnu.org>; Thu,  2 Jan 2020 11:56:18 +0000 (UTC)
Received: from localhost (ovpn-112-28.ams2.redhat.com [10.36.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A20B10013D9;
 Thu,  2 Jan 2020 11:56:10 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] screendump: replace FILE with QIOChannel and fix
 close()/qemu_close()
Date: Thu,  2 Jan 2020 15:54:57 +0400
Message-Id: <20200102115459.854103-6-marcandre.lureau@redhat.com>
In-Reply-To: <20200102115459.854103-1-marcandre.lureau@redhat.com>
References: <20200102115459.854103-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 7SQQfBl_Mr6jhRyWqRaSyg-1
X-Mimecast-Spam-Score: 0
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The file opened for ppm_save() may be a /dev/fdset, in which case a
dup fd is added to the fdset. It should be removed by calling
qemu_close(), instead of the implicit close() on fclose().

I don't see a convenient way to solve that with stdio streams, so I
switched the code to QIOChannel which uses qemu_close().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 ui/console.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index 77d62fe76d..587edf4ed4 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -33,6 +33,7 @@
 #include "chardev/char-fe.h"
 #include "trace.h"
 #include "exec/memory.h"
+#include "io/channel-file.h"
=20
 #define DEFAULT_BACKSCROLL 512
 #define CONSOLE_CURSOR_PERIOD 500
@@ -313,36 +314,31 @@ static bool ppm_save(int fd, DisplaySurface *ds, Erro=
r **errp)
 {
     int width =3D pixman_image_get_width(ds->image);
     int height =3D pixman_image_get_height(ds->image);
-    FILE *f;
+    g_autoptr(Object) ioc =3D OBJECT(qio_channel_file_new_fd(fd));
+    g_autofree char *header =3D NULL;
+    g_autoptr(pixman_image_t) linebuf =3D NULL;
+    g_autoptr(GError) error =3D NULL;
     int y;
-    int ret;
-    pixman_image_t *linebuf;
-    bool success =3D false;
=20
     trace_ppm_save(fd, ds);
-    f =3D fdopen(fd, "wb");
-    ret =3D fprintf(f, "P6\n%d %d\n%d\n", width, height, 255);
-    if (ret < 0) {
-        linebuf =3D NULL;
-        goto end;
+
+    header =3D g_strdup_printf("P6\n%d %d\n%d\n", width, height, 255);
+    if (qio_channel_write_all(QIO_CHANNEL(ioc),
+                              header, strlen(header), errp) < 0) {
+        return false;
     }
+
     linebuf =3D qemu_pixman_linebuf_create(PIXMAN_BE_r8g8b8, width);
     for (y =3D 0; y < height; y++) {
         qemu_pixman_linebuf_fill(linebuf, ds->image, width, 0, y);
-        clearerr(f);
-        ret =3D fwrite(pixman_image_get_data(linebuf), 1,
-                     pixman_image_get_stride(linebuf), f);
-        (void)ret;
-        success =3D !ferror(f);
+        if (qio_channel_write_all(QIO_CHANNEL(ioc),
+                                  (char *)pixman_image_get_data(linebuf),
+                                  pixman_image_get_stride(linebuf), errp) =
< 0) {
+            return false;
+        }
     }
=20
-end:
-    if (!success) {
-        error_setg(errp, "failed to write to PPM file: %s", strerror(errno=
));
-    }
-    qemu_pixman_image_unref(linebuf);
-    fclose(f);
-    return success;
+    return true;
 }
=20
 void qmp_screendump(const char *filename, bool has_device, const char *dev=
ice,
--=20
2.24.0.308.g228f53135a


