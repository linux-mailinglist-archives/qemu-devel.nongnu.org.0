Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D4C4753EF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:56:14 +0100 (CET)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxP93-0005lt-TS
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:56:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOny-0003E4-BF
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnv-0004Iu-Dw
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nlJ4r6AtKSzzhlkkGjMpvMBWY7RfMrRTwn1yyrykKjo=;
 b=LOa6lLJQy74dO/eEuavW5j+Hls2p1rifL3waKw5akxHmKCfNC4LPyjMlHs2+7uOvOJu+aY
 A5BHJcDhkW3a2XCQzvZClSsZ2Kx/a32J/0tsT/FA1JgX2pGSnsfeWJST6/6nvFzJvtamm4
 uV7s7++30njevaDwCZsnae52cO87NG8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-0sn_LjtRMfaEk4NP2RaAMQ-1; Wed, 15 Dec 2021 02:34:19 -0500
X-MC-Unique: 0sn_LjtRMfaEk4NP2RaAMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07A7B2F43;
 Wed, 15 Dec 2021 07:34:18 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D00B1092797;
 Wed, 15 Dec 2021 07:34:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/16] tests/qtest: Add a function to check whether a machine
 is available
Date: Wed, 15 Dec 2021 08:33:54 +0100
Message-Id: <20211215073402.144286-9-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is nowadays possible to build QEMU with a reduced set of machines
in each binary. However, the qtests still hard-code the expected
machines and fail if the binary does not feature the required machine.
Let's get a little bit more flexible here: Add a function that can be
used to query whether a certain machine is available or not, and use
it in some tests as an example (more work has to be done in other
tests which will follow later).

Message-Id: <20211201104347.51922-5-thuth@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-serial-test.c |  3 ++-
 tests/qtest/cdrom-test.c       |  8 +++++---
 tests/qtest/libqos/libqtest.h  |  8 ++++++++
 tests/qtest/libqtest.c         | 17 +++++++++++++++++
 tests/qtest/prom-env-test.c    |  8 +++++---
 5 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 83828ba270..4d8e1343bd 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -285,7 +285,8 @@ int main(int argc, char *argv[])
     g_test_init(&argc, &argv, NULL);
 
     for (i = 0; tests[i].arch != NULL; i++) {
-        if (strcmp(arch, tests[i].arch) == 0) {
+        if (g_str_equal(arch, tests[i].arch) &&
+            qtest_has_machine(tests[i].machine)) {
             char *name = g_strdup_printf("boot-serial/%s", tests[i].machine);
             qtest_add_data_func(name, &tests[i], test_machine);
             g_free(name);
diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
index 5af944a5fb..c1fcac5c45 100644
--- a/tests/qtest/cdrom-test.c
+++ b/tests/qtest/cdrom-test.c
@@ -109,9 +109,11 @@ static void test_cdrom_param(gconstpointer data)
 static void add_cdrom_param_tests(const char **machines)
 {
     while (*machines) {
-        char *testname = g_strdup_printf("cdrom/param/%s", *machines);
-        qtest_add_data_func(testname, *machines, test_cdrom_param);
-        g_free(testname);
+        if (qtest_has_machine(*machines)) {
+            char *testname = g_strdup_printf("cdrom/param/%s", *machines);
+            qtest_add_data_func(testname, *machines, test_cdrom_param);
+            g_free(testname);
+        }
         machines++;
     }
 }
diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index 59e9271195..dff6b31cf0 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -710,6 +710,14 @@ QDict *qmp_fd(int fd, const char *fmt, ...) GCC_FMT_ATTR(2, 3);
 void qtest_cb_for_every_machine(void (*cb)(const char *machine),
                                 bool skip_old_versioned);
 
+/**
+ * qtest_has_machine:
+ * @machine: The machine to look for
+ *
+ * Returns: true if the machine is available in the target binary.
+ */
+bool qtest_has_machine(const char *machine);
+
 /**
  * qtest_qmp_device_add_qdict:
  * @qts: QTestState instance to operate on
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 7ae2dc4e1d..65ed949685 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1401,6 +1401,23 @@ void qtest_cb_for_every_machine(void (*cb)(const char *machine),
     }
 }
 
+bool qtest_has_machine(const char *machine)
+{
+    struct MachInfo *machines;
+    int i;
+
+    machines = qtest_get_machines();
+
+    for (i = 0; machines[i].name != NULL; i++) {
+        if (g_str_equal(machine, machines[i].name) ||
+            (machines[i].alias && g_str_equal(machine, machines[i].alias))) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 /*
  * Generic hot-plugging test via the device_add QMP commands.
  */
diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
index f41d80154a..bdbb01d8e5 100644
--- a/tests/qtest/prom-env-test.c
+++ b/tests/qtest/prom-env-test.c
@@ -71,9 +71,11 @@ static void add_tests(const char *machines[])
     char *name;
 
     for (i = 0; machines[i] != NULL; i++) {
-        name = g_strdup_printf("prom-env/%s", machines[i]);
-        qtest_add_data_func(name, machines[i], test_machine);
-        g_free(name);
+        if (qtest_has_machine(machines[i])) {
+            name = g_strdup_printf("prom-env/%s", machines[i]);
+            qtest_add_data_func(name, machines[i], test_machine);
+            g_free(name);
+        }
     }
 }
 
-- 
2.27.0


