Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730561882DC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 13:05:45 +0100 (CET)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEAye-0007JA-ED
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 08:05:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEAoa-0008ER-Sp
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEAoY-0006ps-WC
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:20 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60226)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEAoY-0006mG-Pb
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584446118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iUZ3WpdIbsn1AW91ePeEuZovpH+cQrT6WloC1s+rk7g=;
 b=NtjYGCHEM1j3bs9BHibRl2HMDARkCJkYxNgOGfEIQChTt62uYieyzzZ68D+unmND7v5xS+
 Ht6QZDsJfzcNygu6+ahcaQgcgkua/5whxouTKongHyOMFuSKYp2bu4wBxQcK3BYRB6g01c
 MS+XlOgfIjo2S4irDLCOAYZoxXqTbZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-AWjWNZ_KMEqGlVYms_INNA-1; Tue, 17 Mar 2020 07:55:16 -0400
X-MC-Unique: AWjWNZ_KMEqGlVYms_INNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78AE19251A0;
 Tue, 17 Mar 2020 11:55:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73FFD5C1BB;
 Tue, 17 Mar 2020 11:55:04 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 166DD11366F1; Tue, 17 Mar 2020 12:55:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/34] tests/test-qmp-event: Check event is actually emitted
Date: Tue, 17 Mar 2020 12:54:35 +0100
Message-Id: <20200317115459.31821-11-armbru@redhat.com>
In-Reply-To: <20200317115459.31821-1-armbru@redhat.com>
References: <20200317115459.31821-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/test-qmp-event.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/test-qmp-event.c b/tests/test-qmp-event.c
index d64066139c..7dd0053190 100644
--- a/tests/test-qmp-event.c
+++ b/tests/test-qmp-event.c
@@ -26,6 +26,7 @@
=20
 typedef struct TestEventData {
     QDict *expect;
+    bool emitted;
 } TestEventData;
=20
 TestEventData *test_event_data;
@@ -52,7 +53,7 @@ void test_qapi_event_emit(test_QAPIEvent event, QDict *d)
     qdict_del(d, "timestamp");
=20
     g_assert(qobject_is_equal(QOBJECT(d), QOBJECT(test_event_data->expect)=
));
-
+    test_event_data->emitted =3D true;
 }
=20
 static void event_prepare(TestEventData *data,
@@ -87,6 +88,7 @@ static void test_event_a(TestEventData *data,
 {
     data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'EVENT_A' }");
     qapi_event_send_event_a();
+    g_assert(data->emitted);
     qobject_unref(data->expect);
 }
=20
@@ -95,6 +97,7 @@ static void test_event_b(TestEventData *data,
 {
     data->expect =3D qdict_from_jsonf_nofail("{ 'event': 'EVENT_B' }");
     qapi_event_send_event_b();
+    g_assert(data->emitted);
     qobject_unref(data->expect);
 }
=20
@@ -107,6 +110,7 @@ static void test_event_c(TestEventData *data,
         "{ 'event': 'EVENT_C', 'data': {"
         " 'a': 1, 'b': { 'integer': 2, 'string': 'test1' }, 'c': 'test2' }=
 }");
     qapi_event_send_event_c(true, 1, true, &b, "test2");
+    g_assert(data->emitted);
     qobject_unref(data->expect);
 }
=20
@@ -132,6 +136,7 @@ static void test_event_d(TestEventData *data,
         "  'string': 'test2', 'enum2': 'value2' },"
         " 'b': 'test3', 'enum3': 'value3' } }");
     qapi_event_send_event_d(&a, "test3", false, NULL, true, ENUM_ONE_VALUE=
3);
+    g_assert(data->emitted);
     qobject_unref(data->expect);
 }
=20
--=20
2.21.1


