Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C0C14285B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:43:30 +0100 (CET)
Received: from localhost ([::1]:33780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUWm-0006Vo-T8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:43:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNy-0004AZ-D6
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNw-0001WO-56
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:22 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:47198
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNw-0001WC-0O
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7eHhu4RVnwR1GixjRbyFk9CcEmDhA6fspUldHGTnnA=;
 b=CKO2L4pRFqJrgwt+Qm9Oc25wIuvswow+QGAsTzEgFYtxOywdsWJx0jSScdUUWwSqLbKRv9
 N7Ms9bkFv8bNRteRmHMj/lTV3AvYjoJ7qBhWUp3SnsC2fUdbTAAZZt4K4rQ3Fd2bFWCXb0
 wXFuQQEvYnAzWvZ8vdZsVIY4K5M5j/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-EypwoyvDP2GvG02f2TrOTg-1; Mon, 20 Jan 2020 05:34:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AFABDBA3;
 Mon, 20 Jan 2020 10:34:16 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E6D1BC6D;
 Mon, 20 Jan 2020 10:34:12 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/29] migration-test: introduce functions to handle string
 parameters
Date: Mon, 20 Jan 2020 11:33:15 +0100
Message-Id: <20200120103340.25118-5-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: EypwoyvDP2GvG02f2TrOTg-1
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 81f65602de..26e2e77289 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -356,6 +356,43 @@ static void migrate_set_parameter_int(QTestState *who,=
 const char *parameter,
     migrate_check_parameter_int(who, parameter, value);
 }
=20
+static char *migrate_get_parameter_str(QTestState *who,
+                                       const char *parameter)
+{
+    QDict *rsp;
+    char *result;
+
+    rsp =3D wait_command(who, "{ 'execute': 'query-migrate-parameters' }")=
;
+    result =3D g_strdup(qdict_get_str(rsp, parameter));
+    qobject_unref(rsp);
+    return result;
+}
+
+static void migrate_check_parameter_str(QTestState *who, const char *param=
eter,
+                                        const char *value)
+{
+    char *result;
+
+    result =3D migrate_get_parameter_str(who, parameter);
+    g_assert_cmpstr(result, =3D=3D, value);
+    g_free(result);
+}
+
+__attribute__((unused))
+static void migrate_set_parameter_str(QTestState *who, const char *paramet=
er,
+                                      const char *value)
+{
+    QDict *rsp;
+
+    rsp =3D qtest_qmp(who,
+                    "{ 'execute': 'migrate-set-parameters',"
+                    "'arguments': { %s: %s } }",
+                    parameter, value);
+    g_assert(qdict_haskey(rsp, "return"));
+    qobject_unref(rsp);
+    migrate_check_parameter_str(who, parameter, value);
+}
+
 static void migrate_pause(QTestState *who)
 {
     QDict *rsp;
--=20
2.24.1


