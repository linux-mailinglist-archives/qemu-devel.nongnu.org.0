Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2561A951D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:51:23 +0200 (CEST)
Received: from localhost ([::1]:45442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcpO-0000WQ-4W
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:51:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOcnd-0006Ko-Dt
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOcnc-0007Iy-7k
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:33 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26808
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOcnc-0007IQ-3P
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586936971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvuqjXhJLnLeqwthQBgW9+Jz4hAncjgDWrmt3VVcZBA=;
 b=GCY5+D2gZRGDvXv1EyhCuOC3s/SCGLoftOmck6ae+KTLIY9EIUl2OuQp8kHx8gtGlFGem/
 urYuV2mwnhNEE0ygf39k38wijGclTUkASH6OKEBMx3uTK6lvYMw19jDr4S8q8ASV0bEm/9
 E7Xv5faHXn1g86qbCKeOACklRuna8e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-Jl3IJNT2OsqnAgGPhlXnKQ-1; Wed, 15 Apr 2020 03:49:30 -0400
X-MC-Unique: Jl3IJNT2OsqnAgGPhlXnKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C86A107ACCC;
 Wed, 15 Apr 2020 07:49:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C7460BE2;
 Wed, 15 Apr 2020 07:49:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B7BC511358B0; Wed, 15 Apr 2020 09:49:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1 3/9] qemu-option: Fix sloppy recognition of
 "id=..." after ", , "
Date: Wed, 15 Apr 2020 09:49:21 +0200
Message-Id: <20200415074927.19897-4-armbru@redhat.com>
In-Reply-To: <20200415074927.19897-1-armbru@redhat.com>
References: <20200415074927.19897-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-qemu-opts.c |  4 ++--
 util/qemu-option.c     | 27 +++++++++++++++++++--------
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 88a3e7bdf4..8ff97268d8 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -500,10 +500,10 @@ static void test_opts_parse(void)
     g_assert(!opts);
     /* TODO Cover .merge_lists =3D true */
=20
-    /* Buggy ID recognition */
+    /* Buggy ID recognition (fixed) */
     opts =3D qemu_opts_parse(&opts_list_03, "x=3D,,id=3Dbar", false, &erro=
r_abort);
     g_assert_cmpuint(opts_count(opts), =3D=3D, 1);
-    g_assert_cmpstr(qemu_opts_id(opts), =3D=3D, "bar"); /* BUG */
+    g_assert(!qemu_opts_id(opts));
     g_assert_cmpstr(qemu_opt_get(opts, "x"), =3D=3D, ",id=3Dbar");
=20
     /* Anti-social ID */
diff --git a/util/qemu-option.c b/util/qemu-option.c
index f08f4bc458..d2956082bd 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -872,6 +872,24 @@ static void opts_do_parse(QemuOpts *opts, const char *=
params,
     }
 }
=20
+static char *opts_parse_id(const char *params)
+{
+    const char *p;
+    char *name, *value;
+
+    for (p =3D params; *p;) {
+        p =3D get_opt_name_value(p, NULL, &name, &value);
+        if (!strcmp(name, "id")) {
+            g_free(name);
+            return value;
+        }
+        g_free(name);
+        g_free(value);
+    }
+
+    return NULL;
+}
+
 /**
  * Store options parsed from @params into @opts.
  * If @firstname is non-null, the first key=3Dvalue in @params may omit
@@ -889,20 +907,13 @@ static QemuOpts *opts_parse(QemuOptsList *list, const=
 char *params,
                             bool *invalidp, Error **errp)
 {
     const char *firstname;
-    char *id =3D NULL;
-    const char *p;
+    char *id =3D opts_parse_id(params);
     QemuOpts *opts;
     Error *local_err =3D NULL;
=20
     assert(!permit_abbrev || list->implied_opt_name);
     firstname =3D permit_abbrev ? list->implied_opt_name : NULL;
=20
-    if (strncmp(params, "id=3D", 3) =3D=3D 0) {
-        get_opt_value(params + 3, &id);
-    } else if ((p =3D strstr(params, ",id=3D")) !=3D NULL) {
-        get_opt_value(p + 4, &id);
-    }
-
     /*
      * This code doesn't work for defaults && !list->merge_lists: when
      * params has no id=3D, and list has an element with !opts->id, it
--=20
2.21.1


