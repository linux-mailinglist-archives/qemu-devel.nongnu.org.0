Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86A1BEFE4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 07:42:35 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU1xy-0007ph-8M
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 01:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n7-00057C-CA
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jU1n0-0002fI-I7
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47189
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jU1mz-0002db-QD
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 01:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588224672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4HsA9U+rvpLBK6iF7tlzwC1Ku+M+asiBgZ8TbiTWsk=;
 b=hy3tWjjoTXfOzEKtVrmr/+gZTb8KTOUxNcPNIOZLfzgP4YJlsBhjWZsEwCOidno2IwjZHo
 lIvk24IbZFArJkBri6MqWyKufir16Q+tmBbYgwdWTZ7BBVjyMSsuNUY1OYDSLw0xTevdt4
 IOCqlfK3ng4N85oMj69bsvLmdPIdYAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-atICTm6HNJOOfRfLiMg3Lw-1; Thu, 30 Apr 2020 01:31:10 -0400
X-MC-Unique: atICTm6HNJOOfRfLiMg3Lw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7326E107B265
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 05:31:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4257960638;
 Thu, 30 Apr 2020 05:31:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1C98211358D1; Thu, 30 Apr 2020 07:31:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/20] qapi: Generate simpler marshalling code when no arguments
Date: Thu, 30 Apr 2020 07:31:04 +0200
Message-Id: <20200430053104.32204-21-armbru@redhat.com>
In-Reply-To: <20200430053104.32204-1-armbru@redhat.com>
References: <20200430053104.32204-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

When command FOO has no arguments, its generated qmp_marshal_FOO() is
a bit confusing.  Make it simpler:

     visit_start_struct(v, NULL, NULL, 0, &err);
     if (err) {
         goto out;
     }
-
-    if (!err) {
-        visit_check_struct(v, &err);
-    }
+    visit_check_struct(v, &err);
     visit_end_struct(v, NULL);
     if (err) {
         goto out;
     }

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20200424084338.26803-16-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/commands.py | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index f545903567..6809b0fb6e 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -115,14 +115,10 @@ def gen_marshal(name, arg_type, boxed, ret_type):
                      c_type=3Dret_type.c_type())
=20
     if have_args:
-        visit_members =3D ('visit_type_%s_members(v, &arg, &err);'
-                         % arg_type.c_name())
         ret +=3D mcgen('''
     %(c_name)s arg =3D {0};
 ''',
                      c_name=3Darg_type.c_name())
-    else:
-        visit_members =3D ''
=20
     ret +=3D mcgen('''
=20
@@ -131,16 +127,27 @@ def gen_marshal(name, arg_type, boxed, ret_type):
     if (err) {
         goto out;
     }
-    %(visit_members)s
+''')
+
+    if have_args:
+        ret +=3D mcgen('''
+    visit_type_%(c_arg_type)s_members(v, &arg, &err);
     if (!err) {
         visit_check_struct(v, &err);
     }
+''',
+                     c_arg_type=3Darg_type.c_name())
+    else:
+        ret +=3D mcgen('''
+    visit_check_struct(v, &err);
+''')
+
+    ret +=3D mcgen('''
     visit_end_struct(v, NULL);
     if (err) {
         goto out;
     }
-''',
-                 visit_members=3Dvisit_members)
+''')
=20
     ret +=3D gen_call(name, arg_type, boxed, ret_type)
=20
@@ -151,20 +158,21 @@ out:
     visit_free(v);
 ''')
=20
-    if have_args:
-        visit_members =3D ('visit_type_%s_members(v, &arg, NULL);'
-                         % arg_type.c_name())
-    else:
-        visit_members =3D ''
-
     ret +=3D mcgen('''
     v =3D qapi_dealloc_visitor_new();
     visit_start_struct(v, NULL, NULL, 0, NULL);
-    %(visit_members)s
+''')
+
+    if have_args:
+        ret +=3D mcgen('''
+    visit_type_%(c_arg_type)s_members(v, &arg, NULL);
+''',
+                     c_arg_type=3Darg_type.c_name())
+
+    ret +=3D mcgen('''
     visit_end_struct(v, NULL);
     visit_free(v);
-''',
-                 visit_members=3Dvisit_members)
+''')
=20
     ret +=3D mcgen('''
 }
--=20
2.21.1


