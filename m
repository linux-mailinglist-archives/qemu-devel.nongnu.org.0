Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5261BD5EB
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:23:33 +0200 (CEST)
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTh48-0001G4-9T
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1p-0007tQ-3i
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1c-0003tb-0V
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:21:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30876
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTh1b-0003qF-Bg
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eT+R0I/VElMw3JWqlTxOEPXFaLiuh2Ap2kR+8RrELrE=;
 b=OCB9f5+3EOOctKAlC283MpCKDmGimcUCMD4ATv95Vc/NBkTWb7ZgrUpeeNbYuYnRW1wjD4
 tUDwNj36rhG/g4z1HmK1TFys3IIjWxFZ6zyTi7NxqJlS1lblftowiZ4dt1qfjYX5Tcfupw
 sn/vKZxkzJ4+El5IebMbqdn2j6K90ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-JI5jaD9AOxuCaPvbR1R_jw-1; Wed, 29 Apr 2020 03:20:51 -0400
X-MC-Unique: JI5jaD9AOxuCaPvbR1R_jw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD79107ACCD
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 07:20:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A7B95D715;
 Wed, 29 Apr 2020 07:20:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8E4C11358BF; Wed, 29 Apr 2020 09:20:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/32] qemu-options: Factor out get_opt_name_value() helper
Date: Wed, 29 Apr 2020 09:20:19 +0200
Message-Id: <20200429072048.29963-4-armbru@redhat.com>
In-Reply-To: <20200429072048.29963-1-armbru@redhat.com>
References: <20200429072048.29963-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:42:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The next commits will put it to use.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200415074927.19897-3-armbru@redhat.com>
---
 util/qemu-option.c | 102 +++++++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 46 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 97172b5eaa..f08f4bc458 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -805,61 +805,71 @@ void qemu_opts_print(QemuOpts *opts, const char *sepa=
rator)
     }
 }
=20
+static const char *get_opt_name_value(const char *params,
+                                      const char *firstname,
+                                      char **name, char **value)
+{
+    const char *p, *pe, *pc;
+
+    pe =3D strchr(params, '=3D');
+    pc =3D strchr(params, ',');
+
+    if (!pe || (pc && pc < pe)) {
+        /* found "foo,more" */
+        if (firstname) {
+            /* implicitly named first option */
+            *name =3D g_strdup(firstname);
+            p =3D get_opt_value(params, value);
+        } else {
+            /* option without value, must be a flag */
+            p =3D get_opt_name(params, name, ',');
+            if (strncmp(*name, "no", 2) =3D=3D 0) {
+                memmove(*name, *name + 2, strlen(*name + 2) + 1);
+                *value =3D g_strdup("off");
+            } else {
+                *value =3D g_strdup("on");
+            }
+        }
+    } else {
+        /* found "foo=3Dbar,more" */
+        p =3D get_opt_name(params, name, '=3D');
+        assert(*p =3D=3D '=3D');
+        p++;
+        p =3D get_opt_value(p, value);
+    }
+
+    assert(!*p || *p =3D=3D ',');
+    if (*p =3D=3D ',') {
+        p++;
+    }
+    return p;
+}
+
 static void opts_do_parse(QemuOpts *opts, const char *params,
                           const char *firstname, bool prepend,
                           bool *invalidp, Error **errp)
 {
-    char *option =3D NULL;
-    char *value =3D NULL;
-    const char *p,*pe,*pc;
     Error *local_err =3D NULL;
+    char *option, *value;
+    const char *p;
=20
-    for (p =3D params; *p !=3D '\0'; p++) {
-        pe =3D strchr(p, '=3D');
-        pc =3D strchr(p, ',');
-        if (!pe || (pc && pc < pe)) {
-            /* found "foo,more" */
-            if (p =3D=3D params && firstname) {
-                /* implicitly named first option */
-                option =3D g_strdup(firstname);
-                p =3D get_opt_value(p, &value);
-            } else {
-                /* option without value, probably a flag */
-                p =3D get_opt_name(p, &option, ',');
-                if (strncmp(option, "no", 2) =3D=3D 0) {
-                    memmove(option, option+2, strlen(option+2)+1);
-                    value =3D g_strdup("off");
-                } else {
-                    value =3D g_strdup("on");
-                }
-            }
-        } else {
-            /* found "foo=3Dbar,more" */
-            p =3D get_opt_name(p, &option, '=3D');
-            assert(*p =3D=3D '=3D');
-            p++;
-            p =3D get_opt_value(p, &value);
-        }
-        if (strcmp(option, "id") !=3D 0) {
-            /* store and parse */
-            opt_set(opts, option, value, prepend, invalidp, &local_err);
-            value =3D NULL;
-            if (local_err) {
-                error_propagate(errp, local_err);
-                goto cleanup;
-            }
-        }
-        if (*p !=3D ',') {
-            break;
+    for (p =3D params; *p;) {
+        p =3D get_opt_name_value(p, firstname, &option, &value);
+        firstname =3D NULL;
+
+        if (!strcmp(option, "id")) {
+            g_free(option);
+            g_free(value);
+            continue;
         }
+
+        opt_set(opts, option, value, prepend, invalidp, &local_err);
         g_free(option);
-        g_free(value);
-        option =3D value =3D NULL;
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return;
+        }
     }
-
- cleanup:
-    g_free(option);
-    g_free(value);
 }
=20
 /**
--=20
2.21.1


