Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622731C01DF
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 18:14:29 +0200 (CEST)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jUBpU-0004WQ-Ec
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 12:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jUBX2-0007q0-Bq
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jUBV3-0004FQ-Gd
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:55:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30829
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jUBV3-0004Cw-2z
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 11:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588262000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jjf7hPbI7KdA+lLE8XE56+2q4XG1FvMCPO0SQLAxrxk=;
 b=EsRL+lfD3eD5SiT0c/itMQF/mvORmM2g2sLRWTFZHpRMN4Hwpw1D63WJXXbzUHxZPgeIOC
 4Rw+Q3JQ2t594WQb78sld11k+vNOAvISM70TcaA9+Hck6l8rdC0yBu87BB3FRnLE3FuNl8
 vkJjKp0WA+1b+LFSTbqbiOBtMr9ySKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-WUP2--XMPFGqi6bPlBEajg-1; Thu, 30 Apr 2020 11:53:18 -0400
X-MC-Unique: WUP2--XMPFGqi6bPlBEajg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 828371B18BC0;
 Thu, 30 Apr 2020 15:53:17 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8549160C84;
 Thu, 30 Apr 2020 15:53:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/15] qemu-storage-daemon: Fix non-string --object properties
Date: Thu, 30 Apr 2020 17:52:31 +0200
Message-Id: <20200430155231.473156-16-kwolf@redhat.com>
In-Reply-To: <20200430155231.473156-1-kwolf@redhat.com>
References: <20200430155231.473156-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 23:34:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After processing the option string with the keyval parser, we get a
QDict that contains only strings. This QDict must be fed to a keyval
visitor which converts the strings into the right data types.

qmp_object_add(), however, uses the normal QObject input visitor, which
expects a QDict where all properties already have the QType that matches
the data type required by the QOM object type.

Change the --object implementation in qemu-storage-daemon so that it
doesn't call qmp_object_add(), but calls user_creatable_add_dict()
directly instead and pass it a new keyval boolean that decides which
visitor must be used.

Reported-by: Coiby Xu <coiby.xu@gmail.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qom/object_interfaces.h | 6 +++++-
 qemu-storage-daemon.c           | 4 +---
 qom/object_interfaces.c         | 8 ++++++--
 qom/qom-qmp-cmds.c              | 2 +-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/qom/object_interfaces.h b/include/qom/object_interface=
s.h
index a0037968a4..65172120fa 100644
--- a/include/qom/object_interfaces.h
+++ b/include/qom/object_interfaces.h
@@ -90,6 +90,10 @@ Object *user_creatable_add_type(const char *type, const =
char *id,
 /**
  * user_creatable_add_dict:
  * @qdict: the object definition
+ * @keyval: if true, use a keyval visitor for processing @qdict (i.e.
+ *          assume that all @qdict values are strings); otherwise, use
+ *          the normal QObject visitor (i.e. assume all @qdict values
+ *          have the QType expected by the QOM object type)
  * @errp: if an error occurs, a pointer to an area to store the error
  *
  * Create an instance of the user creatable object that is defined by
@@ -97,7 +101,7 @@ Object *user_creatable_add_type(const char *type, const =
char *id,
  * ID from the key 'id'. The remaining entries in @qdict are used to
  * initialize the object properties.
  */
-void user_creatable_add_dict(QDict *qdict, Error **errp);
+void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp);
=20
 /**
  * user_creatable_add_opts:
diff --git a/qemu-storage-daemon.c b/qemu-storage-daemon.c
index dd128978cc..9e7adfe3a6 100644
--- a/qemu-storage-daemon.c
+++ b/qemu-storage-daemon.c
@@ -278,7 +278,6 @@ static void process_options(int argc, char *argv[])
                 QemuOpts *opts;
                 const char *type;
                 QDict *args;
-                QObject *ret_data =3D NULL;
=20
                 /* FIXME The keyval parser rejects 'help' arguments, so we=
 must
                  * unconditionall try QemuOpts first. */
@@ -291,9 +290,8 @@ static void process_options(int argc, char *argv[])
                 qemu_opts_del(opts);
=20
                 args =3D keyval_parse(optarg, "qom-type", &error_fatal);
-                qmp_object_add(args, &ret_data, &error_fatal);
+                user_creatable_add_dict(args, true, &error_fatal);
                 qobject_unref(args);
-                qobject_unref(ret_data);
                 break;
             }
         default:
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 739e3e5172..bc36f96e47 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -106,7 +106,7 @@ out:
     return obj;
 }
=20
-void user_creatable_add_dict(QDict *qdict, Error **errp)
+void user_creatable_add_dict(QDict *qdict, bool keyval, Error **errp)
 {
     Visitor *v;
     Object *obj;
@@ -127,7 +127,11 @@ void user_creatable_add_dict(QDict *qdict, Error **err=
p)
     }
     qdict_del(qdict, "id");
=20
-    v =3D qobject_input_visitor_new(QOBJECT(qdict));
+    if (keyval) {
+        v =3D qobject_input_visitor_new_keyval(QOBJECT(qdict));
+    } else {
+        v =3D qobject_input_visitor_new(QOBJECT(qdict));
+    }
     obj =3D user_creatable_add_type(type, id, qdict, v, errp);
     visit_free(v);
     object_unref(obj);
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 35db44b50e..c5249e44d0 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -263,7 +263,7 @@ void qmp_object_add(QDict *qdict, QObject **ret_data, E=
rror **errp)
         qobject_unref(pdict);
     }
=20
-    user_creatable_add_dict(qdict, errp);
+    user_creatable_add_dict(qdict, false, errp);
 }
=20
 void qmp_object_del(const char *id, Error **errp)
--=20
2.25.3


