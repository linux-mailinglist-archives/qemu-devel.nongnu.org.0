Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9710E18C
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Dec 2019 12:27:43 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibNO9-00039x-T6
	for lists+qemu-devel@lfdr.de; Sun, 01 Dec 2019 06:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ibNDV-0001Oj-K5
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 06:16:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ibNDO-0008OA-8o
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 06:16:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41244
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ibNDM-0008NM-UK
 for qemu-devel@nongnu.org; Sun, 01 Dec 2019 06:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575198992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZF2NCOPuyjVU1ZJiB3EBr3etJoOFfzGwItPjXJNJ7Rw=;
 b=dcf9Aoaly09gu5/QWDhB9XqsAzW0eO9y+hCRS4UNVNvGzfA7UTuvnWOPqoDAow2c4nXBif
 275ZP7Qap77pvGqSTymSyisCKxRjFeuWp6RZW0PgIF+CmOof3hgDXpL2m2yVKmiuBNFyY7
 tEWBtQHz81kZ6YCddD2ty0FHAiMBy/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-VywniazEOs2ZmY6k6LLJyg-1; Sun, 01 Dec 2019 06:16:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 745E380183C
 for <qemu-devel@nongnu.org>; Sun,  1 Dec 2019 11:16:28 +0000 (UTC)
Received: from localhost (unknown [10.36.112.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 447B75D6A0;
 Sun,  1 Dec 2019 11:16:23 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] object: avoid extra class property key duplication
Date: Sun,  1 Dec 2019 15:15:10 +0400
Message-Id: <20191201111531.1136947-6-marcandre.lureau@redhat.com>
In-Reply-To: <20191201111531.1136947-1-marcandre.lureau@redhat.com>
References: <20191201111531.1136947-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: VywniazEOs2ZmY6k6LLJyg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Like object properties, no need to duplicate property name, as it is
owned already by ObjectProperty value.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 qom/object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 935491d334..f1e1e0947b 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -307,7 +307,7 @@ static void type_initialize(TypeImpl *ti)
         memcpy(ti->class, parent->class, parent->class_size);
         ti->class->interfaces =3D NULL;
         ti->class->properties =3D g_hash_table_new_full(
-            g_str_hash, g_str_equal, g_free, object_property_free);
+            g_str_hash, g_str_equal, NULL, object_property_free);
=20
         for (e =3D parent->class->interfaces; e; e =3D e->next) {
             InterfaceClass *iface =3D e->data;
@@ -334,7 +334,7 @@ static void type_initialize(TypeImpl *ti)
         }
     } else {
         ti->class->properties =3D g_hash_table_new_full(
-            g_str_hash, g_str_equal, g_free, object_property_free);
+            g_str_hash, g_str_equal, NULL, object_property_free);
     }
=20
     ti->class->type =3D ti;
@@ -1154,7 +1154,7 @@ object_class_property_add(ObjectClass *klass,
     prop->release =3D release;
     prop->opaque =3D opaque;
=20
-    g_hash_table_insert(klass->properties, g_strdup(name), prop);
+    g_hash_table_insert(klass->properties, prop->name, prop);
=20
     return prop;
 }
--=20
2.24.0


