Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1244F13716C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 16:36:52 +0100 (CET)
Received: from localhost ([::1]:48102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipwLC-0003fU-LS
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 10:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwH7-0007JH-7E
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ipwH6-00074Q-0w
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:32:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42042
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ipwH5-000730-SG
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 10:32:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578670355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tcerdhFsiHnhHb3CEjKTElAN4VEt/8lQyXR+UQ/FiqY=;
 b=Dz4qhnPAn+mx07LZFMsKSO48oAvJNycQ2G+jDd6NDzI1BWknr6burUS2e7jIvjb06AT48+
 dfBY83ZG1VJu4yDgp/hqeHzNUu+xI1jYDgJSDXE0vzvG4gFXOjNWXxNZlBhP/yFq7UEG2C
 VeE28E6lK+iblFNEvBx1jP/Pn9BDvbE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-NuRjY7e5NdmqXQ8crOkTGQ-1; Fri, 10 Jan 2020 10:32:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DFFFDB98
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 15:32:33 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF1E380628;
 Fri, 10 Jan 2020 15:32:26 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/26] qstring: add qstring_free()
Date: Fri, 10 Jan 2020 19:30:22 +0400
Message-Id: <20200110153039.1379601-10-marcandre.lureau@redhat.com>
In-Reply-To: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: NuRjY7e5NdmqXQ8crOkTGQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

Similar to g_string_free(), optionally return the underlying char*.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/qapi/qmp/qstring.h |  1 +
 qobject/qstring.c          | 27 ++++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index 3e83e3a95d..e2e356e5e7 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -33,6 +33,7 @@ void qstring_append_int(QString *qstring, int64_t value);
 void qstring_append(QString *qstring, const char *str);
 void qstring_append_chr(QString *qstring, int c);
 bool qstring_is_equal(const QObject *x, const QObject *y);
+char *qstring_free(QString *qstring, bool return_str);
 void qstring_destroy_obj(QObject *obj);
=20
 #endif /* QSTRING_H */
diff --git a/qobject/qstring.c b/qobject/qstring.c
index 1c6897df00..b66a2c35f2 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -149,16 +149,33 @@ bool qstring_is_equal(const QObject *x, const QObject=
 *y)
                    qobject_to(QString, y)->string);
 }
=20
+/**
+ * qstring_free(): Free the memory allocated by a QString object
+ *
+ * Return: if @return_str, return the underlying string, to be
+ * g_free(), otherwise NULL is returned.
+ */
+char *qstring_free(QString *qstring, bool return_str)
+{
+    char *rv =3D NULL;
+
+    if (return_str) {
+        rv =3D qstring->string;
+    } else {
+        g_free(qstring->string);
+    }
+
+    g_free(qstring);
+
+    return rv;
+}
+
 /**
  * qstring_destroy_obj(): Free all memory allocated by a QString
  * object
  */
 void qstring_destroy_obj(QObject *obj)
 {
-    QString *qs;
-
     assert(obj !=3D NULL);
-    qs =3D qobject_to(QString, obj);
-    g_free(qs->string);
-    g_free(qs);
+    qstring_free(qobject_to(QString, obj), FALSE);
 }
--=20
2.25.0.rc1.20.g2443f3f80d.dirty


