Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CFB142852
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:40:09 +0100 (CET)
Received: from localhost ([::1]:33720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUTX-0002J2-Pg
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:40:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36999)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUNk-0003qN-9J
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUNf-0001Jf-UB
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:07 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56098
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUNf-0001JL-QX
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z5iTYPI+kH5Iq9+UEXku8qpjxmDcS2w7LEXNk7gy/QY=;
 b=fFJXL/4FpeEMpH0zMGiSGWdLLkT8hKGMyCR5H243UXz1ELk3eNSh/BXq6OtEcuZpQoOqNi
 /zx0d6ZziEN+89nAW9Dhh24EhaDIlYsVjvG8lT516RJN9Hw8GmU2O5TChZnrg1NlMdlFpH
 oRLBSHR2a/noQxxsyMbxgkk1RkhusMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-vRxEu-MLNxyt8da2QEcYCQ-1; Mon, 20 Jan 2020 05:34:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 508F31005512;
 Mon, 20 Jan 2020 10:34:00 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE2548478B;
 Mon, 20 Jan 2020 10:33:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] migration-test: Add migration multifd test
Date: Mon, 20 Jan 2020 11:33:13 +0100
Message-Id: <20200120103340.25118-3-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: vRxEu-MLNxyt8da2QEcYCQ-1
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
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set multifd-channels.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Wei Yang <richardw.yang@linux.intel.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 tests/qtest/migration-test.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 341d190922..81f65602de 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1202,6 +1202,61 @@ static void test_migrate_auto_converge(void)
     test_migrate_end(from, to, true);
 }
=20
+static void test_multifd_tcp(void)
+{
+    MigrateStart *args =3D migrate_start_new();
+    QTestState *from, *to;
+    QDict *rsp;
+    char *uri;
+
+    if (test_migrate_start(&from, &to, "defer", args)) {
+        return;
+    }
+
+    /*
+     * We want to pick a speed slow enough that the test completes
+     * quickly, but that it doesn't complete precopy even on a slow
+     * machine, so also set the downtime.
+     */
+    /* 1 ms should make it not converge*/
+    migrate_set_parameter_int(from, "downtime-limit", 1);
+    /* 1GB/s */
+    migrate_set_parameter_int(from, "max-bandwidth", 1000000000);
+
+    migrate_set_parameter_int(from, "multifd-channels", 16);
+    migrate_set_parameter_int(to, "multifd-channels", 16);
+
+    migrate_set_capability(from, "multifd", "true");
+    migrate_set_capability(to, "multifd", "true");
+
+    /* Start incoming migration from the 1st socket */
+    rsp =3D wait_command(to, "{ 'execute': 'migrate-incoming',"
+                           "  'arguments': { 'uri': 'tcp:127.0.0.1:0' }}")=
;
+    qobject_unref(rsp);
+
+    /* Wait for the first serial output from the source */
+    wait_for_serial("src_serial");
+
+    uri =3D migrate_get_socket_address(to, "socket-address");
+
+    migrate_qmp(from, uri, "{}");
+
+    wait_for_migration_pass(from);
+
+    /* 300ms it should converge */
+    migrate_set_parameter_int(from, "downtime-limit", 300);
+
+    if (!got_stop) {
+        qtest_qmp_eventwait(from, "STOP");
+    }
+    qtest_qmp_eventwait(to, "RESUME");
+
+    wait_for_serial("dest_serial");
+    wait_for_migration_complete(from);
+    test_migrate_end(from, to, true);
+    free(uri);
+}
+
 int main(int argc, char **argv)
 {
     char template[] =3D "/tmp/migration-test-XXXXXX";
@@ -1266,6 +1321,7 @@ int main(int argc, char **argv)
                    test_validate_uuid_dst_not_set);
=20
     qtest_add_func("/migration/auto_converge", test_migrate_auto_converge)=
;
+    qtest_add_func("/migration/multifd/tcp", test_multifd_tcp);
=20
     ret =3D g_test_run();
=20
--=20
2.24.1


