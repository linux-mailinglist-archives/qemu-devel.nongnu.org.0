Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A181BD5FC
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 09:27:02 +0200 (CEST)
Received: from localhost ([::1]:39920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTh7V-00008H-Ov
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 03:27:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1n-0007tN-In
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:22:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jTh1c-0003tS-03
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:21:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26660
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jTh1b-0003q8-C6
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 03:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588144853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pJdX+A1mES63QPyAbifOauLBYN0jMpBgWHmzfmjgvzc=;
 b=ORR6jnQkDRqREJ7xbm6bc1QGrDAHOgxo4PRUisoFckRTYrXya7B2uiYZjd4F1cHg1PstiZ
 l6QHeHlnW9jEo1jWKDg/uq9E/FuFb84n7ObBgKFnCRrhhOATnExVNXNJHBEMgbq0Ikg4GU
 lEXUtn7uRPQbwriFi23g5Zw1RQ/XTh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-FpGMlk_RMvyJXONHIULWQg-1; Wed, 29 Apr 2020 03:20:51 -0400
X-MC-Unique: FpGMlk_RMvyJXONHIULWQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BFAA1895A28
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 07:20:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A87127CC4;
 Wed, 29 Apr 2020 07:20:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C5FF811358BE; Wed, 29 Apr 2020 09:20:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/32] tests-qemu-opts: Cover has_help_option(),
 qemu_opt_has_help_opt()
Date: Wed, 29 Apr 2020 09:20:18 +0200
Message-Id: <20200429072048.29963-3-armbru@redhat.com>
In-Reply-To: <20200429072048.29963-1-armbru@redhat.com>
References: <20200429072048.29963-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The two turn out to be inconsistent for "a,b,,help".  Test case
marked /* BUG */.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200415074927.19897-2-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/test-qemu-opts.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index ef96e84aed..88a3e7bdf4 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -728,6 +728,49 @@ static void test_opts_parse_size(void)
     qemu_opts_reset(&opts_list_02);
 }
=20
+static void test_has_help_option(void)
+{
+    static const struct {
+        const char *params;
+        /* expected value of has_help_option() */
+        bool expect_has_help_option;
+        /* expected value of qemu_opt_has_help_opt() with implied=3Dfalse =
*/
+        bool expect_opt_has_help_opt;
+        /* expected value of qemu_opt_has_help_opt() with implied=3Dtrue *=
/
+        bool expect_opt_has_help_opt_implied;
+    } test[] =3D {
+        { "help", true, true, false },
+        { "?", true, true, false },
+        { "helpme", false, false, false },
+        { "?me", false, false, false },
+        { "a,help", true, true, true },
+        { "a,?", true, true, true },
+        { "a=3D0,help,b", true, true, true },
+        { "a=3D0,?,b", true, true, true },
+        { "help,b=3D1", true, true, false },
+        { "?,b=3D1", true, true, false },
+        { "a,b,,help", false /* BUG */, true, true },
+        { "a,b,,?", false /* BUG */, true, true },
+    };
+    int i;
+    QemuOpts *opts;
+
+    for (i =3D 0; i < ARRAY_SIZE(test); i++) {
+        g_assert_cmpint(has_help_option(test[i].params),
+                        =3D=3D, test[i].expect_has_help_option);
+        opts =3D qemu_opts_parse(&opts_list_03, test[i].params, false,
+                               &error_abort);
+        g_assert_cmpint(qemu_opt_has_help_opt(opts),
+                        =3D=3D, test[i].expect_opt_has_help_opt);
+        qemu_opts_del(opts);
+        opts =3D qemu_opts_parse(&opts_list_03, test[i].params, true,
+                               &error_abort);
+        g_assert_cmpint(qemu_opt_has_help_opt(opts),
+                        =3D=3D, test[i].expect_opt_has_help_opt_implied);
+        qemu_opts_del(opts);
+    }
+}
+
 static void append_verify_list_01(QemuOptDesc *desc, bool with_overlapping=
)
 {
     int i =3D 0;
@@ -990,6 +1033,7 @@ int main(int argc, char *argv[])
     g_test_add_func("/qemu-opts/opts_parse/bool", test_opts_parse_bool);
     g_test_add_func("/qemu-opts/opts_parse/number", test_opts_parse_number=
);
     g_test_add_func("/qemu-opts/opts_parse/size", test_opts_parse_size);
+    g_test_add_func("/qemu-opts/has_help_option", test_has_help_option);
     g_test_add_func("/qemu-opts/append_to_null", test_opts_append_to_null)=
;
     g_test_add_func("/qemu-opts/append", test_opts_append);
     g_test_add_func("/qemu-opts/to_qdict/basic", test_opts_to_qdict_basic)=
;
--=20
2.21.1


