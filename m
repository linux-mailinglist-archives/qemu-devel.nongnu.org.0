Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC0913A8E1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:59:38 +0100 (CET)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKrA-0003Zn-RY
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKZc-0006RV-Se
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKZZ-0003Oj-5H
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50725
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKZZ-0003OJ-1j
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynLvDJfV4kUr7Pu6PZ24xc1KIuICA5kAdzwdWYoRAQo=;
 b=iEop8WqOx/33r+lo6NyYVKMfuEanLUv9R284UqhYPLQp4kbx25CiDQE013VhFL0u8oCmzM
 AMx0uDoM6GP63L93B3gkSwLfXEdfBVGqN7gikEBxgnd1ZfmJc17A3q1z2ni4aozp0Az7CY
 GeMa2IkZAqqiSGxmaPcNqiOcECkjZKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-FSkbqH-6OlWqOvzXcJrpdw-1; Tue, 14 Jan 2020 06:41:22 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1D55DB64;
 Tue, 14 Jan 2020 11:41:19 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C7E75DA7B;
 Tue, 14 Jan 2020 11:41:15 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] migration/ram: Yield periodically to the main loop
Date: Tue, 14 Jan 2020 12:39:10 +0100
Message-Id: <20200114113926.3556-15-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: FSkbqH-6OlWqOvzXcJrpdw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yury Kotov <yury-kotov@yandex-team.ru>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yury Kotov <yury-kotov@yandex-team.ru>

Usually, incoming migration coroutine yields to the main loop
while its IO-channel is waiting for data to receive. But there is a case
when RAM migration and data receive have the same speed: VM with huge
zeroed RAM. In this case, IO-channel won't read and thus the main loop
is stuck and for instance, it doesn't respond to QMP commands.

For this case, yield periodically, but not too often, so as not to
affect the speed of migration.

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/ram.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 1ec5c10561..5cd066467c 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4246,7 +4246,7 @@ static void colo_flush_ram_cache(void)
  */
 static int ram_load_precopy(QEMUFile *f)
 {
-    int flags =3D 0, ret =3D 0, invalid_flags =3D 0, len =3D 0;
+    int flags =3D 0, ret =3D 0, invalid_flags =3D 0, len =3D 0, i =3D 0;
     /* ADVISE is earlier, it shows the source has the postcopy capability =
on */
     bool postcopy_advised =3D postcopy_is_advised();
     if (!migrate_use_compression()) {
@@ -4258,6 +4258,17 @@ static int ram_load_precopy(QEMUFile *f)
         void *host =3D NULL;
         uint8_t ch;
=20
+        /*
+         * Yield periodically to let main loop run, but an iteration of
+         * the main loop is expensive, so do it each some iterations
+         */
+        if ((i & 32767) =3D=3D 0 && qemu_in_coroutine()) {
+            aio_co_schedule(qemu_get_current_aio_context(),
+                            qemu_coroutine_self());
+            qemu_coroutine_yield();
+        }
+        i++;
+
         addr =3D qemu_get_be64(f);
         flags =3D addr & ~TARGET_PAGE_MASK;
         addr &=3D TARGET_PAGE_MASK;
--=20
2.24.1


