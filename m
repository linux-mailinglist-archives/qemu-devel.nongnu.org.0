Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEFD1B6FFB
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 10:47:17 +0200 (CEST)
Received: from localhost ([::1]:55052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRtzQ-0002m4-3Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 04:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36786)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRtw5-0005jY-Bz
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jRtw3-0002Eq-Id
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35073
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jRtw2-00026b-2E
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 04:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587717824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hr3YG+KjfcK59fxwDqq0zT0dktaKoHpEMtoEYHOt+0s=;
 b=Qy/i23R02kHsHiF8ujRbj9iAAX086ZTHpWMnV3sYuHRu+SCqnGv+2pdXLMvN0GMZSw1XV8
 xdCnmTRCnOILHQb2F50/fwM3F7prkzxF9LYxVJr2MRjGTBA8RTgYmUPvYRVr6hSDnCUxMI
 m73+UWWHvLh0tRVI0pp1D7CnFjgjykw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-FdfTyFVsNqmFUhW4UCogHQ-1; Fri, 24 Apr 2020 04:43:43 -0400
X-MC-Unique: FdfTyFVsNqmFUhW4UCogHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2841F107ACCD;
 Fri, 24 Apr 2020 08:43:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAB5699CD;
 Fri, 24 Apr 2020 08:43:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EC4CD11358C5; Fri, 24 Apr 2020 10:43:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/15] qapi: Assert non-input visitors see only valid
 narrow integers
Date: Fri, 24 Apr 2020 10:43:32 +0200
Message-Id: <20200424084338.26803-10-armbru@redhat.com>
In-Reply-To: <20200424084338.26803-1-armbru@redhat.com>
References: <20200424084338.26803-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 03:54:07
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

visit_type_intN() and visit_type_uintN() fail when the value is out of
bounds.

This is appropriate with an input visitor: the value comes from input,
and input may be bad.

It should never happen with the other visitors: the value comes from
the caller, and callers must keep it within bounds.  Assert that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 qapi/qapi-visit-core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index 80ca83bcb9..74aa9c04bd 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -160,10 +160,13 @@ static void visit_type_uintN(Visitor *v, uint64_t *ob=
j, const char *name,
     Error *err =3D NULL;
     uint64_t value =3D *obj;
=20
+    assert(v->type =3D=3D VISITOR_INPUT || value <=3D max);
+
     v->type_uint64(v, name, &value, &err);
     if (err) {
         error_propagate(errp, err);
     } else if (value > max) {
+        assert(v->type =3D=3D VISITOR_INPUT);
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    name ? name : "null", type);
     } else {
@@ -219,10 +222,13 @@ static void visit_type_intN(Visitor *v, int64_t *obj,=
 const char *name,
     Error *err =3D NULL;
     int64_t value =3D *obj;
=20
+    assert(v->type =3D=3D VISITOR_INPUT || (value >=3D min && value <=3D m=
ax));
+
     v->type_int64(v, name, &value, &err);
     if (err) {
         error_propagate(errp, err);
     } else if (value < min || value > max) {
+        assert(v->type =3D=3D VISITOR_INPUT);
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    name ? name : "null", type);
     } else {
--=20
2.21.1


