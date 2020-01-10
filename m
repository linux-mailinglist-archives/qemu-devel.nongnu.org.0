Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B420513717C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:39:25 +0100 (CET)
Received: from localhost ([::1]:48122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipwNg-0006rn-Hf
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:39:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52092)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwGI-0006S4-8W
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:31:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwGG-0004MK-Df
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:31:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30875
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ipwGG-0004Jv-90
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:31:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VvJrqxGIRFgUUFb0eu+CzZzOXBYzQDf7ACqkiqvt4I=;
 b=aFmAnHnKkNpoztY7/GYsAV+HPjhi57AM6EosM8cnjmLmO3+fLua+MnBHWtiDCX2sDHe7wH
 LxAHiMDe6Ki+c5atzDIFFCfmi/dObY38MRAqF1ELr92Dbe/AVhGUxoSHXxWcyXdL8HFyhS
 PPIvmeK0bDSKdBP2qdiWkDqdRgqyPQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326--Vvd5IiLMnCxksoGjMzqeQ-1; Fri, 10 Jan 2020 10:31:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3A99803065
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 15:31:40 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D6515C1B5;
 Fri, 10 Jan 2020 15:31:38 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/26] object: avoid extra class property key duplication
Date: Fri, 10 Jan 2020 19:30:18 +0400
Message-Id: <20200110153039.1379601-6-marcandre.lureau@redhat.com>
In-Reply-To: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -Vvd5IiLMnCxksoGjMzqeQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
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
index 8453e4ac91..29101fdcd4 100644
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
@@ -1178,7 +1178,7 @@ object_class_property_add(ObjectClass *klass,
     prop->release =3D release;
     prop->opaque =3D opaque;
=20
-    g_hash_table_insert(klass->properties, g_strdup(name), prop);
+    g_hash_table_insert(klass->properties, prop->name, prop);
=20
     return prop;
 }
--=20
2.25.0.rc1.20.g2443f3f80d.dirty


