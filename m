Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B0C1A9546
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 09:56:26 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOcuH-0008T0-Jt
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 03:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51229)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jOcnf-0006Ok-8t
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jOcnd-0007Kh-Le
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:35 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60444
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jOcnd-0007Jp-Eq
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 03:49:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586936973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fiLXMPHz393DyIEaz+0bLZVx3mR3IDR1Y7+PMw6nYOA=;
 b=HaBlahKvOpw4CdIJUjUsileoMfsWs0ismawmCZiGUizqXWa25wu1OC9lMdeA9b0nRnWCiD
 BvpvNyphEvJJPHUGxP2bjhxA/qSckRW5ImYwE05RwVbl+WSuF0K9fWxGL7sDwF7CRZZ5uU
 pLQP5mwBNu+RzHjDdjMewOeP15m2AvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-pHE-baVuPoSkBosw2_h5ow-1; Wed, 15 Apr 2020 03:49:31 -0400
X-MC-Unique: pHE-baVuPoSkBosw2_h5ow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBF810CE782;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-20.ams2.redhat.com
 [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 645CE116D95;
 Wed, 15 Apr 2020 07:49:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BE53311358B2; Wed, 15 Apr 2020 09:49:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 for-5.1 5/9] test-qemu-opts: Simplify
 test_has_help_option() after bug fix
Date: Wed, 15 Apr 2020 09:49:23 +0200
Message-Id: <20200415074927.19897-6-armbru@redhat.com>
In-Reply-To: <20200415074927.19897-1-armbru@redhat.com>
References: <20200415074927.19897-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 tests/test-qemu-opts.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 77c944c4aa..2a0f42a09b 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -732,41 +732,39 @@ static void test_has_help_option(void)
 {
     static const struct {
         const char *params;
-        /* expected value of has_help_option() */
-        bool expect_has_help_option;
         /* expected value of qemu_opt_has_help_opt() with implied=3Dfalse =
*/
-        bool expect_opt_has_help_opt;
+        bool expect;
         /* expected value of qemu_opt_has_help_opt() with implied=3Dtrue *=
/
-        bool expect_opt_has_help_opt_implied;
+        bool expect_implied;
     } test[] =3D {
-        { "help", true, true, false },
-        { "?", true, true, false },
-        { "helpme", false, false, false },
-        { "?me", false, false, false },
-        { "a,help", true, true, true },
-        { "a,?", true, true, true },
-        { "a=3D0,help,b", true, true, true },
-        { "a=3D0,?,b", true, true, true },
-        { "help,b=3D1", true, true, false },
-        { "?,b=3D1", true, true, false },
-        { "a,b,,help", true, true, true },
-        { "a,b,,?", true, true, true },
+        { "help", true, false },
+        { "?", true, false },
+        { "helpme", false, false },
+        { "?me", false, false },
+        { "a,help", true, true },
+        { "a,?", true, true },
+        { "a=3D0,help,b", true, true },
+        { "a=3D0,?,b", true, true },
+        { "help,b=3D1", true, false },
+        { "?,b=3D1", true, false },
+        { "a,b,,help", true, true },
+        { "a,b,,?", true, true },
     };
     int i;
     QemuOpts *opts;
=20
     for (i =3D 0; i < ARRAY_SIZE(test); i++) {
         g_assert_cmpint(has_help_option(test[i].params),
-                        =3D=3D, test[i].expect_has_help_option);
+                        =3D=3D, test[i].expect);
         opts =3D qemu_opts_parse(&opts_list_03, test[i].params, false,
                                &error_abort);
         g_assert_cmpint(qemu_opt_has_help_opt(opts),
-                        =3D=3D, test[i].expect_opt_has_help_opt);
+                        =3D=3D, test[i].expect);
         qemu_opts_del(opts);
         opts =3D qemu_opts_parse(&opts_list_03, test[i].params, true,
                                &error_abort);
         g_assert_cmpint(qemu_opt_has_help_opt(opts),
-                        =3D=3D, test[i].expect_opt_has_help_opt_implied);
+                        =3D=3D, test[i].expect_implied);
         qemu_opts_del(opts);
     }
 }
--=20
2.21.1


