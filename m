Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 356181A9555
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:58:52 +0200 (CEST)
Received: from localhost ([::1]:45582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcwd-0004Vc-97
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOcnf-0006PF-Fq
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOcnd-0007Kx-QH
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58533
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOcnd-0007KG-KY
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586936973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxYhS6566ynMu6iYQOxJwhg94SejROMl4YRxPGotvqc=;
 b=ZPbKrBGwsBL8ljZVEf8rSP6pIFl2+2LjK+wOJsGfuaT7BoNrnnUaSKHNbF9m1VxDWxbedM
 hNEA/LAwp5ICntDeibdtTUdkARGB6ptg3sUK3k4M656G7kew0wMtBPn8Q6sZo8HmiBnlAS
 m93oM625A7ACxiqi68nfc3uCSwlcem0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-QW6mK9fkPD-_F0BW9hHWuA-1; Wed, 15 Apr 2020 03:49:31 -0400
X-MC-Unique: QW6mK9fkPD-_F0BW9hHWuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84E38018A9;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 64689116D96;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C1A9E11358B3; Wed, 15 Apr 2020 09:49:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1 6/9] qemu-option: Avoid has_help_option() in
 qemu_opts_parse_noisily()
Date: Wed, 15 Apr 2020 09:49:24 +0200
Message-Id: <20200415074927.19897-7-armbru@redhat.com>
In-Reply-To: <20200415074927.19897-1-armbru@redhat.com>
References: <20200415074927.19897-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When opts_parse() sets @invalidp to true, qemu_opts_parse_noisily()
uses has_help_option() to decide whether to print help.  This parses
the input string a second time.

Easy to avoid: replace @invalidp by @help_wanted.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 util/qemu-option.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 0abf26b61f..2d0d24ee27 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -519,7 +519,7 @@ int qemu_opt_unset(QemuOpts *opts, const char *name)
 }
=20
 static void opt_set(QemuOpts *opts, const char *name, char *value,
-                    bool prepend, bool *invalidp, Error **errp)
+                    bool prepend, bool *help_wanted, Error **errp)
 {
     QemuOpt *opt;
     const QemuOptDesc *desc;
@@ -529,8 +529,8 @@ static void opt_set(QemuOpts *opts, const char *name, c=
har *value,
     if (!desc && !opts_accepts_any(opts)) {
         g_free(value);
         error_setg(errp, QERR_INVALID_PARAMETER, name);
-        if (invalidp) {
-            *invalidp =3D true;
+        if (help_wanted && is_help_option(name)) {
+            *help_wanted =3D true;
         }
         return;
     }
@@ -827,7 +827,7 @@ static const char *get_opt_name_value(const char *param=
s,
=20
 static void opts_do_parse(QemuOpts *opts, const char *params,
                           const char *firstname, bool prepend,
-                          bool *invalidp, Error **errp)
+                          bool *help_wanted, Error **errp)
 {
     Error *local_err =3D NULL;
     char *option, *value;
@@ -843,7 +843,7 @@ static void opts_do_parse(QemuOpts *opts, const char *p=
arams,
             continue;
         }
=20
-        opt_set(opts, option, value, prepend, invalidp, &local_err);
+        opt_set(opts, option, value, prepend, help_wanted, &local_err);
         g_free(option);
         if (local_err) {
             error_propagate(errp, local_err);
@@ -903,7 +903,7 @@ void qemu_opts_do_parse(QemuOpts *opts, const char *par=
ams,
=20
 static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
                             bool permit_abbrev, bool defaults,
-                            bool *invalidp, Error **errp)
+                            bool *help_wanted, Error **errp)
 {
     const char *firstname;
     char *id =3D opts_parse_id(params);
@@ -928,7 +928,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const c=
har *params,
         return NULL;
     }
=20
-    opts_do_parse(opts, params, firstname, defaults, invalidp, &local_err)=
;
+    opts_do_parse(opts, params, firstname, defaults, help_wanted, &local_e=
rr);
     if (local_err) {
         error_propagate(errp, local_err);
         qemu_opts_del(opts);
@@ -964,11 +964,11 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list,=
 const char *params,
 {
     Error *err =3D NULL;
     QemuOpts *opts;
-    bool invalidp =3D false;
+    bool help_wanted =3D false;
=20
-    opts =3D opts_parse(list, params, permit_abbrev, false, &invalidp, &er=
r);
+    opts =3D opts_parse(list, params, permit_abbrev, false, &help_wanted, =
&err);
     if (err) {
-        if (invalidp && has_help_option(params)) {
+        if (help_wanted) {
             qemu_opts_print_help(list, true);
             error_free(err);
         } else {
--=20
2.21.1


