Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67999CD68
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 12:40:22 +0200 (CEST)
Received: from localhost ([::1]:51626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2CQ9-00027M-ER
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 06:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1i2COD-0000ok-8r
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yury-kotov@yandex-team.ru>) id 1i2COB-0002Eg-17
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:21 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:60138)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yury-kotov@yandex-team.ru>)
 id 1i2COA-0002EE-Ma
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 06:38:18 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 85EA72E0DE9;
 Mon, 26 Aug 2019 13:38:17 +0300 (MSK)
Received: from smtpcorp1j.mail.yandex.net (smtpcorp1j.mail.yandex.net
 [2a02:6b8:0:1619::137])
 by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 Tt7YIrEX5P-cGcabDA3; Mon, 26 Aug 2019 13:38:17 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1566815897; bh=YN6EgW8ol0EXRMv85rr3KZoNtqSTSXiAcYn2Pd5Cca0=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=NW2h4MnDM6kh7+ePsQ83U3Oc1OSmsjb/y3+WKf3bS3AtN8EHRRw4BV9gDl12xgExq
 OlOY8TLWh+LcHS5gJpklU9M+psUzePHPia46qSiAksGEjOaO5ntLbpPCc6nGsmLBAT
 e4t37oXIWvALzJqMJUEwpUzDbWdVa0od33nmwFlQ=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
 [2a02:6b8:0:408:dc67:69ff:2705:c046])
 by smtpcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 mDIbqN0Ee6-cG0S3FgO; Mon, 26 Aug 2019 13:38:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Date: Mon, 26 Aug 2019 13:37:26 +0300
Message-Id: <20190826103726.25538-4-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826103726.25538-1-yury-kotov@yandex-team.ru>
References: <20190826103726.25538-1-yury-kotov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1a2d::193
Subject: [Qemu-devel] [PATCH v5 3/3] tests/migration: Add a test for auto
 converge
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:Overall" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/migration-test.c | 120 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 109 insertions(+), 11 deletions(-)

diff --git a/tests/migration-test.c b/tests/migration-test.c
index b87ba99a9e..e5caf93dfa 100644
--- a/tests/migration-test.c
+++ b/tests/migration-test.c
@@ -240,6 +240,17 @@ static int64_t read_ram_property_int(QTestState *who=
, const char *property)
     return result;
 }
=20
+static int64_t read_migrate_property_int(QTestState *who, const char *pr=
operty)
+{
+    QDict *rsp_return;
+    int64_t result;
+
+    rsp_return =3D migrate_query(who);
+    result =3D qdict_get_try_int(rsp_return, property, 0);
+    qobject_unref(rsp_return);
+    return result;
+}
+
 static uint64_t get_migration_pass(QTestState *who)
 {
     return read_ram_property_int(who, "dirty-sync-count");
@@ -254,20 +265,22 @@ static void read_blocktime(QTestState *who)
     qobject_unref(rsp_return);
 }
=20
+static bool check_migration_status(QTestState *who, const char *status)
+{
+    bool completed;
+    char *current_status;
+
+    current_status =3D migrate_query_status(who);
+    completed =3D strcmp(current_status, status) =3D=3D 0;
+    g_assert_cmpstr(current_status, !=3D, "failed");
+    g_free(current_status);
+    return completed;
+}
+
 static void wait_for_migration_status(QTestState *who,
                                       const char *goal)
 {
-    while (true) {
-        bool completed;
-        char *status;
-
-        status =3D migrate_query_status(who);
-        completed =3D strcmp(status, goal) =3D=3D 0;
-        g_assert_cmpstr(status, !=3D,  "failed");
-        g_free(status);
-        if (completed) {
-            return;
-        }
+    while (!check_migration_status(who, goal)) {
         usleep(1000);
     }
 }
@@ -1125,6 +1138,90 @@ static void test_migrate_fd_proto(void)
     test_migrate_end(from, to, true);
 }
=20
+static void test_migrate_auto_converge(void)
+{
+    char *uri =3D g_strdup_printf("unix:%s/migsocket", tmpfs);
+    QTestState *from, *to;
+    int64_t remaining, percentage;
+
+    /*
+     * We want the test to be stable and as fast as possible.
+     * E.g., with 1Gb/s bandwith migration may pass without throttling,
+     * so we need to decrease a bandwidth.
+     */
+    const int64_t init_pct =3D 5, inc_pct =3D 50, max_pct =3D 95;
+    const int64_t max_bandwidth =3D 400000000; /* ~400Mb/s */
+    const int64_t downtime_limit =3D 250; /* 250ms */
+    /*
+     * We migrate through unix-socket (> 500Mb/s).
+     * Thus, expected migration speed ~=3D bandwidth limit (< 500Mb/s).
+     * So, we can predict expected_threshold
+     */
+    const int64_t expected_threshold =3D max_bandwidth * downtime_limit =
/ 1000;
+
+    if (test_migrate_start(&from, &to, uri, false, false)) {
+        return;
+    }
+
+    migrate_set_capability(from, "auto-converge", true);
+    migrate_set_parameter_int(from, "cpu-throttle-initial", init_pct);
+    migrate_set_parameter_int(from, "cpu-throttle-increment", inc_pct);
+    migrate_set_parameter_int(from, "max-cpu-throttle", max_pct);
+
+    /*
+     * Set the initial parameters so that the migration could not conver=
ge
+     * without throttling.
+     */
+    migrate_set_parameter_int(from, "downtime-limit", 1);
+    migrate_set_parameter_int(from, "max-bandwidth", 100000000); /* ~100=
Mb/s */
+
+    /* To check remaining size after precopy */
+    migrate_set_capability(from, "pause-before-switchover", true);
+
+    /* Wait for the first serial output from the source */
+    wait_for_serial("src_serial");
+
+    migrate(from, uri, "{}");
+
+    /* Wait for throttling begins */
+    percentage =3D 0;
+    while (percentage =3D=3D 0) {
+        percentage =3D read_migrate_property_int(from, "cpu-throttle-per=
centage");
+        usleep(100);
+        g_assert_false(got_stop);
+    }
+    /* The first percentage of throttling should be equal to init_pct */
+    g_assert_cmpint(percentage, =3D=3D, init_pct);
+    /* Now, when we tested that throttling works, let it converge */
+    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
+    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
+
+    /*
+     * Wait for pre-switchover status to check last throttle percentage
+     * and remaining. These values will be zeroed later
+     */
+    wait_for_migration_status(from, "pre-switchover");
+
+    /* The final percentage of throttling shouldn't be greater than max_=
pct */
+    percentage =3D read_migrate_property_int(from, "cpu-throttle-percent=
age");
+    g_assert_cmpint(percentage, <=3D, max_pct);
+
+    remaining =3D read_ram_property_int(from, "remaining");
+    g_assert_cmpint(remaining, <, expected_threshold);
+
+    wait_command(from, "{ 'execute': 'migrate-continue' , 'arguments':"
+                       "  { 'state': 'pre-switchover' } }");
+
+    qtest_qmp_eventwait(to, "RESUME");
+
+    wait_for_serial("dest_serial");
+    wait_for_migration_complete(from);
+
+    g_free(uri);
+
+    test_migrate_end(from, to, true);
+}
+
 int main(int argc, char **argv)
 {
     char template[] =3D "/tmp/migration-test-XXXXXX";
@@ -1180,6 +1277,7 @@ int main(int argc, char **argv)
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); *=
/
     qtest_add_func("/migration/xbzrle/unix", test_xbzrle_unix);
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
+    qtest_add_func("/migration/auto_converge", test_migrate_auto_converg=
e);
=20
     ret =3D g_test_run();
=20
--=20
2.22.0


