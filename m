Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447C1A9559
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 10:00:04 +0200 (CEST)
Received: from localhost ([::1]:45598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcxn-00063m-Dp
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 04:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOcnf-0006Pe-Kx
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOcnd-0007LJ-Sj
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53989
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOcnd-0007KS-NB
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586936973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4/aCNwhpA9m3Y65zS8cEH4smCxfFNnQD2MenRfIuZ0=;
 b=MgnNG0qcjGcaWBgFJ+wodoLTpRvQ/htL5OtELYmzYyPJA+fZM/gzMOtFIXkNDiw+/K27aB
 4kI/MCmPWeU7gswnZ/MfJsAV2LHmRM/Z97LUHb6OjzxDtMoG2AHg1BERNmvAn6StYmjRAL
 FIq4WiNCa2BAfkqKnZaGPWpvcPMrMk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-bo95N2rdM3KrbxLdV2EKCQ-1; Wed, 15 Apr 2020 03:49:31 -0400
X-MC-Unique: bo95N2rdM3KrbxLdV2EKCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89AE8018AB;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A56B9F9B6;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C838511358BB; Wed, 15 Apr 2020 09:49:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1 8/9] qemu-img: Move is_valid_option_list() to
 qemu-img.c and rewrite
Date: Wed, 15 Apr 2020 09:49:26 +0200
Message-Id: <20200415074927.19897-9-armbru@redhat.com>
In-Reply-To: <20200415074927.19897-1-armbru@redhat.com>
References: <20200415074927.19897-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

is_valid_option_list()'s purpose is ensuring qemu-img.c's can safely
join multiple parameter strings separated by ',' like this:

        g_strdup_printf("%s,%s", params1, params2);

How it does that is anything but obvious.  A close reading of the code
reveals that it fails exactly when its argument starts with ',' or
ends with an odd number of ','.  Makes sense, actually, because when
the argument starts with ',', a separating ',' preceding it would get
escaped, and when it ends with an odd number of ',', a separating ','
following it would get escaped.

Move it to qemu-img.c and rewrite it the obvious way.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 include/qemu/option.h |  1 -
 qemu-img.c            | 26 ++++++++++++++++++++++++++
 util/qemu-option.c    | 22 ----------------------
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index 844587cab3..eb4097889d 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -33,7 +33,6 @@ const char *get_opt_value(const char *p, char **value);
 void parse_option_size(const char *name, const char *value,
                        uint64_t *ret, Error **errp);
 bool has_help_option(const char *param);
-bool is_valid_option_list(const char *param);
=20
 enum QemuOptType {
     QEMU_OPT_STRING =3D 0,  /* no parsing (use string as-is)              =
          */
diff --git a/qemu-img.c b/qemu-img.c
index d36b21b758..cc51db7ed4 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -223,6 +223,32 @@ static bool qemu_img_object_print_help(const char *typ=
e, QemuOpts *opts)
     return true;
 }
=20
+/*
+ * Is @optarg safe for accumulate_options()?
+ * It is when multiple of them can be joined together separated by ','.
+ * To make that work, @optarg must not start with ',' (or else a
+ * separating ',' preceding it gets escaped), and it must not end with
+ * an odd number of ',' (or else a separating ',' following it gets
+ * escaped).
+ */
+static bool is_valid_option_list(const char *optarg)
+{
+    size_t len =3D strlen(optarg);
+    size_t i;
+
+    if (optarg[0] =3D=3D ',') {
+        return false;
+    }
+
+    for (i =3D len; i > 0 && optarg[i - 1] =3D=3D ','; i--) {
+    }
+    if ((len - i) % 2) {
+        return false;
+    }
+
+    return true;
+}
+
 static int accumulate_options(char **options, char *optarg)
 {
     char *new_options;
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 2d0d24ee27..9542988183 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -165,28 +165,6 @@ void parse_option_size(const char *name, const char *v=
alue,
     *ret =3D size;
 }
=20
-bool is_valid_option_list(const char *p)
-{
-    char *value =3D NULL;
-    bool result =3D false;
-
-    while (*p) {
-        p =3D get_opt_value(p, &value);
-        if ((*p && !*++p) ||
-            (!*value || *value =3D=3D ',')) {
-            goto out;
-        }
-
-        g_free(value);
-        value =3D NULL;
-    }
-
-    result =3D true;
-out:
-    g_free(value);
-    return result;
-}
-
 static const char *opt_type_to_string(enum QemuOptType type)
 {
     switch (type) {
--=20
2.21.1


