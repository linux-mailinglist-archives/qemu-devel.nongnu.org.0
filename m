Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E71224AE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 07:31:50 +0100 (CET)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih6Ob-0005wG-Ax
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 01:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ih6Jx-0000iN-AI
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:27:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ih6Jv-0000vr-S3
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:27:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24056
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ih6Jv-0000rZ-OG
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 01:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576564019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMmGA4SL0fTH3yWHfTIz2dVZZmLMWLG/6f3jbvKKD/Y=;
 b=EXl//llNFLZnIqknLGOjw55AZJrfZ+X6Pdby4A2ZyMDZ1kV+CH49lGfpUxbwqUIfNQiuPu
 Wj3Yu7b0qFhwTzDIwzYP86FQ70pBqUeyRPC75LI+V3GPJ6srUMruDugRx0cNUFagy3KEpO
 LqZ6B2q7v5ZaWvI2URdbuG6s0/qERco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-0RH6n7WPOZWIS61Om3JFag-1; Tue, 17 Dec 2019 01:26:57 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D92F88017DF;
 Tue, 17 Dec 2019 06:26:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B21B19427;
 Tue, 17 Dec 2019 06:26:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5348211385A7; Tue, 17 Dec 2019 07:26:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/34] tests: Clean up initialization of Error *err variables
Date: Tue, 17 Dec 2019 07:26:22 +0100
Message-Id: <20191217062651.9687-6-armbru@redhat.com>
In-Reply-To: <20191217062651.9687-1-armbru@redhat.com>
References: <20191217062651.9687-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 0RH6n7WPOZWIS61Om3JFag-1
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Declaring a local Error *err without initializer looks suspicious.
Fuse the declaration with the initialization to avoid that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191204093625.14836-5-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/test-qobject-output-visitor.c | 8 ++++----
 tests/test-string-output-visitor.c  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-outpu=
t-visitor.c
index 3e993e5ba8..d7761ebf84 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -145,10 +145,10 @@ static void test_visitor_out_enum_errors(TestOutputVi=
sitorData *data,
                                          const void *unused)
 {
     EnumOne i, bad_values[] =3D { ENUM_ONE__MAX, -1 };
-    Error *err;
=20
     for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        err =3D NULL;
+        Error *err =3D NULL;
+
         visit_type_EnumOne(data->ov, "unused", &bad_values[i], &err);
         error_free_or_abort(&err);
         visitor_reset(data);
@@ -240,11 +240,11 @@ static void test_visitor_out_struct_errors(TestOutput=
VisitorData *data,
     EnumOne bad_values[] =3D { ENUM_ONE__MAX, -1 };
     UserDefOne u =3D {0};
     UserDefOne *pu =3D &u;
-    Error *err;
     int i;
=20
     for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        err =3D NULL;
+        Error *err =3D NULL;
+
         u.has_enum1 =3D true;
         u.enum1 =3D bad_values[i];
         visit_type_UserDefOne(data->ov, "unused", &pu, &err);
diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-=
visitor.c
index 02766c0f65..1be1540767 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -207,10 +207,10 @@ static void test_visitor_out_enum_errors(TestOutputVi=
sitorData *data,
                                          const void *unused)
 {
     EnumOne i, bad_values[] =3D { ENUM_ONE__MAX, -1 };
-    Error *err;
=20
     for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        err =3D NULL;
+        Error *err =3D NULL;
+
         visit_type_EnumOne(data->ov, "unused", &bad_values[i], &err);
         error_free_or_abort(&err);
     }
--=20
2.21.0


