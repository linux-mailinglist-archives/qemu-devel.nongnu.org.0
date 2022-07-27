Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26479582308
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:25:13 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdI0-0000nu-08
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEr-00056z-8d
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oGdEg-0002Kt-OJ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658913705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7E52Yw+qU8n+tA0+HHOkK58HGtvoypfpIYgC64H3JM=;
 b=dEqj76xkzo2WetjdK4w5788OpN/wrmsfZugrxBHqynPsb26khN90O8J9p1Zlgu03nss1Tk
 m9SlHUxr/F4pv3gjnwHas0kkLZ/0eRlW8qQI81xtq2T5Crj6k5LBsGJlWFUQ2f/mb2SiG1
 XzDy7v9ZH8UVv+zIZhNVhfxI6qfLWk0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-JeRTGOYgPHOuFRka5V5m4w-1; Wed, 27 Jul 2022 05:21:43 -0400
X-MC-Unique: JeRTGOYgPHOuFRka5V5m4w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6234A101A54E;
 Wed, 27 Jul 2022 09:21:43 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CB5A492C3B;
 Wed, 27 Jul 2022 09:21:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/3] qga: Replace 'blacklist' command line and config file
 options by 'block-rpcs'
Date: Wed, 27 Jul 2022 11:21:33 +0200
Message-Id: <20220727092135.302915-2-thuth@redhat.com>
In-Reply-To: <20220727092135.302915-1-thuth@redhat.com>
References: <20220727092135.302915-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's use a more appropriate wording for this command line and config
file option. The old ones are still accepted for compatibility reasons,
but marked as deprecated now so that it could be removed in a future
version of QEMU.

This change is based on earlier patches from Philippe Mathieu-Daudé,
with the idea for the new option name suggested by BALATON Zoltan.

And while we're at it, replace the "?" in the help text with "help"
since that does not have the problem of conflicting with the wildcard
character of the shells.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst  | 19 +++++++++++++++++++
 docs/interop/qemu-ga.rst   |  8 ++++----
 qga/main.c                 | 18 +++++++++++++-----
 tests/unit/test-qga.c      |  2 +-
 tests/data/test-qga-config |  2 +-
 5 files changed, 38 insertions(+), 11 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 7ee26626d5..61c505db97 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -379,3 +379,22 @@ be deleted from this tree.
 New deployments should use the Rust version, and existing systems
 should consider moving to it.  The command line and feature set
 is very close and moving should be simple.
+
+
+QEMU guest agent
+----------------
+
+``--blacklist`` command line option (since 7.2)
+'''''''''''''''''''''''''''''''''''''''''''''''
+
+``--blacklist`` has been replaced by ``--block-rpcs`` (which is a better
+wording for what this option does). The short form ``-b`` still stays
+the same and thus is the preferred way for scripts that should run with
+both, older and future versions of QEMU.
+
+``blacklist`` config file option (since 7.2)
+''''''''''''''''''''''''''''''''''''''''''''
+
+The ``blacklist`` config file option has been renamed to ``block-rpcs``
+(to be in sync with the renaming of the corresponding command line
+option).
diff --git a/docs/interop/qemu-ga.rst b/docs/interop/qemu-ga.rst
index 3063357bb5..a9183802d1 100644
--- a/docs/interop/qemu-ga.rst
+++ b/docs/interop/qemu-ga.rst
@@ -79,10 +79,10 @@ Options
 
   Daemonize after startup (detach from terminal).
 
-.. option:: -b, --blacklist=LIST
+.. option:: -b, --block-rpcs=LIST
 
-  Comma-separated list of RPCs to disable (no spaces, ``?`` to list
-  available RPCs).
+  Comma-separated list of RPCs to disable (no spaces, use ``help`` to
+  list available RPCs).
 
 .. option:: -D, --dump-conf
 
@@ -125,7 +125,7 @@ pidfile        string
 fsfreeze-hook  string
 statedir       string
 verbose        boolean
-blacklist      string list
+block-rpcs     string list
 =============  ===========
 
 See also
diff --git a/qga/main.c b/qga/main.c
index 5f1efa2333..74e5c9b10c 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -260,8 +260,8 @@ QEMU_COPYRIGHT "\n"
 #ifdef _WIN32
 "  -s, --service     service commands: install, uninstall, vss-install, vss-uninstall\n"
 #endif
-"  -b, --blacklist   comma-separated list of RPCs to disable (no spaces, \"?\"\n"
-"                    to list available RPCs)\n"
+"  -b, --block-rpcs  comma-separated list of RPCs to disable (no spaces,\n"
+"                    use \"help\" to list available RPCs)\n"
 "  -D, --dump-conf   dump a qemu-ga config file based on current config\n"
 "                    options / command-line parameters to stdout\n"
 "  -r, --retry-path  attempt re-opening path if it's unavailable or closed\n"
@@ -963,6 +963,7 @@ static void config_load(GAConfig *config)
     GError *gerr = NULL;
     GKeyFile *keyfile;
     g_autofree char *conf = g_strdup(g_getenv("QGA_CONF")) ?: get_relocated_path(QGA_CONF_DEFAULT);
+    const gchar *blockrpcs_key = "block-rpcs";
 
     /* read system config */
     keyfile = g_key_file_new();
@@ -1009,9 +1010,15 @@ static void config_load(GAConfig *config)
         config->retry_path =
             g_key_file_get_boolean(keyfile, "general", "retry-path", &gerr);
     }
+
     if (g_key_file_has_key(keyfile, "general", "blacklist", NULL)) {
+        g_warning("config using deprecated 'blacklist' key, should be replaced"
+                  " with the 'block-rpcs' key.");
+        blockrpcs_key = "blacklist";
+    }
+    if (g_key_file_has_key(keyfile, "general", blockrpcs_key, NULL)) {
         config->bliststr =
-            g_key_file_get_string(keyfile, "general", "blacklist", &gerr);
+            g_key_file_get_string(keyfile, "general", blockrpcs_key, &gerr);
         config->blacklist = g_list_concat(config->blacklist,
                                           split_list(config->bliststr, ","));
     }
@@ -1073,7 +1080,7 @@ static void config_dump(GAConfig *config)
     g_key_file_set_boolean(keyfile, "general", "retry-path",
                            config->retry_path);
     tmp = list_join(config->blacklist, ',');
-    g_key_file_set_string(keyfile, "general", "blacklist", tmp);
+    g_key_file_set_string(keyfile, "general", "block-rpcs", tmp);
     g_free(tmp);
 
     tmp = g_key_file_to_data(keyfile, NULL, &error);
@@ -1105,7 +1112,8 @@ static void config_parse(GAConfig *config, int argc, char **argv)
         { "method", 1, NULL, 'm' },
         { "path", 1, NULL, 'p' },
         { "daemonize", 0, NULL, 'd' },
-        { "blacklist", 1, NULL, 'b' },
+        { "block-rpcs", 1, NULL, 'b' },
+        { "blacklist", 1, NULL, 'b' },  /* deprecated alias for 'block-rpcs' */
 #ifdef _WIN32
         { "service", 1, NULL, 's' },
 #endif
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 530317044b..c398866f46 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -729,7 +729,7 @@ static void test_qga_config(gconstpointer data)
     g_assert_true(g_key_file_get_boolean(kf, "general", "verbose", &error));
     g_assert_no_error(error);
 
-    strv = g_key_file_get_string_list(kf, "general", "blacklist", &n, &error);
+    strv = g_key_file_get_string_list(kf, "general", "block-rpcs", &n, &error);
     g_assert_cmpint(n, ==, 2);
     g_assert_true(g_strv_contains((const char * const *)strv,
                                   "guest-ping"));
diff --git a/tests/data/test-qga-config b/tests/data/test-qga-config
index 4bb721a4a1..b6b7bc9dfd 100644
--- a/tests/data/test-qga-config
+++ b/tests/data/test-qga-config
@@ -5,4 +5,4 @@ path=/path/to/org.qemu.guest_agent.0
 pidfile=/var/foo/qemu-ga.pid
 statedir=/var/state
 verbose=true
-blacklist=guest-ping;guest-get-time
+block-rpcs=guest-ping;guest-get-time
-- 
2.31.1


