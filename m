Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234711BEFD1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 07:36:52 +0200 (CEST)
Received: from localhost ([::1]:33488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU1sR-00072E-1V
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 01:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n9-0005B7-4o
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n3-0002g9-1T
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49989
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jU1n2-0002fS-JM
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588224674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/eCgajyJf8qICR/WUvMK6vNNdBXJnB7b0Ca5U2RoNKM=;
 b=EpRln0+8QFByCvyz2Dab+etxqMMz1AYmTnZeMPGDBiQsTo8SHn0DEVsSORwIjZC9viCuFp
 5U9TqKEL6oa+OtiuPgg6rt7pssj/s3bRyi/JFwfe9ZNmY9v5kporci+Q5kldFroOCkxCCf
 HFlZW2HHIyDkJnFjAizY1id7Jbuq8bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-jlypbqiQOFqfVkcTDHrx1g-1; Thu, 30 Apr 2020 01:31:09 -0400
X-MC-Unique: jlypbqiQOFqfVkcTDHrx1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B6D18015CB
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 05:31:08 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0412B1000079;
 Thu, 30 Apr 2020 05:31:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 061F511358CA; Thu, 30 Apr 2020 07:31:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/20] qapi: Assert output visitors see only valid enum values
Date: Thu, 30 Apr 2020 07:30:57 +0200
Message-Id: <20200430053104.32204-14-armbru@redhat.com>
In-Reply-To: <20200430053104.32204-1-armbru@redhat.com>
References: <20200430053104.32204-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

output_type_enum() fails when *obj is not a valid value of the enum
type.  Should not happen.  Drop the check, along with its unit tests.
This unmasks qapi_enum_lookup()'s assertion.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200424084338.26803-9-armbru@redhat.com>
[Commit message tweaked]
---
 qapi/qapi-visit-core.c              |  9 -------
 tests/test-qobject-output-visitor.c | 39 -----------------------------
 tests/test-string-output-visitor.c  | 19 --------------
 3 files changed, 67 deletions(-)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index d4aac206cf..80ca83bcb9 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -341,15 +341,6 @@ static void output_type_enum(Visitor *v, const char *n=
ame, int *obj,
     int value =3D *obj;
     char *enum_str;
=20
-    /*
-     * TODO why is this an error, not an assertion?  If assertion:
-     * delete, and rely on qapi_enum_lookup()
-     */
-    if (value < 0 || value >=3D lookup->size) {
-        error_setg(errp, QERR_INVALID_PARAMETER, name ? name : "null");
-        return;
-    }
-
     enum_str =3D (char *)qapi_enum_lookup(lookup, value);
     visit_type_str(v, name, &enum_str, errp);
 }
diff --git a/tests/test-qobject-output-visitor.c b/tests/test-qobject-outpu=
t-visitor.c
index d7761ebf84..1c856d9bd2 100644
--- a/tests/test-qobject-output-visitor.c
+++ b/tests/test-qobject-output-visitor.c
@@ -141,21 +141,6 @@ static void test_visitor_out_enum(TestOutputVisitorDat=
a *data,
     }
 }
=20
-static void test_visitor_out_enum_errors(TestOutputVisitorData *data,
-                                         const void *unused)
-{
-    EnumOne i, bad_values[] =3D { ENUM_ONE__MAX, -1 };
-
-    for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        Error *err =3D NULL;
-
-        visit_type_EnumOne(data->ov, "unused", &bad_values[i], &err);
-        error_free_or_abort(&err);
-        visitor_reset(data);
-    }
-}
-
-
 static void test_visitor_out_struct(TestOutputVisitorData *data,
                                     const void *unused)
 {
@@ -234,26 +219,6 @@ static void test_visitor_out_struct_nested(TestOutputV=
isitorData *data,
     qapi_free_UserDefTwo(ud2);
 }
=20
-static void test_visitor_out_struct_errors(TestOutputVisitorData *data,
-                                           const void *unused)
-{
-    EnumOne bad_values[] =3D { ENUM_ONE__MAX, -1 };
-    UserDefOne u =3D {0};
-    UserDefOne *pu =3D &u;
-    int i;
-
-    for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        Error *err =3D NULL;
-
-        u.has_enum1 =3D true;
-        u.enum1 =3D bad_values[i];
-        visit_type_UserDefOne(data->ov, "unused", &pu, &err);
-        error_free_or_abort(&err);
-        visitor_reset(data);
-    }
-}
-
-
 static void test_visitor_out_list(TestOutputVisitorData *data,
                                   const void *unused)
 {
@@ -821,14 +786,10 @@ int main(int argc, char **argv)
                             &out_visitor_data, test_visitor_out_no_string)=
;
     output_visitor_test_add("/visitor/output/enum",
                             &out_visitor_data, test_visitor_out_enum);
-    output_visitor_test_add("/visitor/output/enum-errors",
-                            &out_visitor_data, test_visitor_out_enum_error=
s);
     output_visitor_test_add("/visitor/output/struct",
                             &out_visitor_data, test_visitor_out_struct);
     output_visitor_test_add("/visitor/output/struct-nested",
                             &out_visitor_data, test_visitor_out_struct_nes=
ted);
-    output_visitor_test_add("/visitor/output/struct-errors",
-                            &out_visitor_data, test_visitor_out_struct_err=
ors);
     output_visitor_test_add("/visitor/output/list",
                             &out_visitor_data, test_visitor_out_list);
     output_visitor_test_add("/visitor/output/any",
diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-=
visitor.c
index 1be1540767..3bd732222c 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -203,19 +203,6 @@ static void test_visitor_out_enum(TestOutputVisitorDat=
a *data,
     }
 }
=20
-static void test_visitor_out_enum_errors(TestOutputVisitorData *data,
-                                         const void *unused)
-{
-    EnumOne i, bad_values[] =3D { ENUM_ONE__MAX, -1 };
-
-    for (i =3D 0; i < ARRAY_SIZE(bad_values) ; i++) {
-        Error *err =3D NULL;
-
-        visit_type_EnumOne(data->ov, "unused", &bad_values[i], &err);
-        error_free_or_abort(&err);
-    }
-}
-
 static void
 output_visitor_test_add(const char *testpath,
                         TestOutputVisitorData *data,
@@ -260,12 +247,6 @@ int main(int argc, char **argv)
                             &out_visitor_data, test_visitor_out_enum, fals=
e);
     output_visitor_test_add("/string-visitor/output/enum-human",
                             &out_visitor_data, test_visitor_out_enum, true=
);
-    output_visitor_test_add("/string-visitor/output/enum-errors",
-                            &out_visitor_data, test_visitor_out_enum_error=
s,
-                            false);
-    output_visitor_test_add("/string-visitor/output/enum-errors-human",
-                            &out_visitor_data, test_visitor_out_enum_error=
s,
-                            true);
     output_visitor_test_add("/string-visitor/output/intList",
                             &out_visitor_data, test_visitor_out_intList, f=
alse);
     output_visitor_test_add("/string-visitor/output/intList-human",
--=20
2.21.1


