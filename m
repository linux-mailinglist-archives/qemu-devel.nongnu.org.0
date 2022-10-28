Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A8610EBD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:40:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMm4-0002Jb-Qq; Fri, 28 Oct 2022 06:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlq-0002DG-Dh
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:26 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nborisov@suse.com>) id 1ooMlo-00021e-MK
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 06:39:26 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 705F11F38D;
 Fri, 28 Oct 2022 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1666953563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ifcleT7pBfKzPGQ0kfkVrXFW2VaaxuRXmqqwY5FzkBw=;
 b=jeqKnnp6o7Q4C5THJsAZqVB4Vmfsx7MpGuvPof/AsFf+WBTfQva+oINiwXpPP5XMJaWQSk
 ZpTyvlr74OxD46e2Zpt/5m0Jv9PSyUHmOBT0NWI2OkYBRMc619qYM+5Liow8kgpgEALmwr
 0Js2VvXNs+vPSweqvygO+2zJDJmkBrE=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BC9C13A6E;
 Fri, 28 Oct 2022 10:39:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wFo/AFuxW2PVPwAAMHmgww
 (envelope-from <nborisov@suse.com>); Fri, 28 Oct 2022 10:39:23 +0000
From: Nikolay Borisov <nborisov@suse.com>
To: dgilbert@redhat.com,
	berrange@redhat.com
Cc: qemu-devel@nongnu.org, jfehlig@suse.com, Claudio.Fontana@suse.com,
 dfaggioli@suse.com, Nikolay Borisov <nborisov@suse.com>
Subject: [PATCH v3 14/14] tests/qtest: migration-test: Add tests for
 file-based migration
Date: Fri, 28 Oct 2022 13:39:14 +0300
Message-Id: <20221028103914.908728-15-nborisov@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028103914.908728-1-nborisov@suse.com>
References: <20221028103914.908728-1-nborisov@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=nborisov@suse.com;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add basic tests for file-based migration as well as for the 'fixed-ram'
feature.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
---
 tests/qtest/migration-test.c | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ef4427ff4d41..de877473f193 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -748,6 +748,7 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
     cleanup("migsocket");
     cleanup("src_serial");
     cleanup("dest_serial");
+    cleanup("migfile");
 }
 
 #ifdef CONFIG_GNUTLS
@@ -1359,6 +1360,14 @@ static void test_precopy_common(MigrateCommon *args)
          * hanging forever if migration didn't converge */
         wait_for_migration_complete(from);
 
+        /*
+         * For file based migration the target must begin its migration after
+         * the source has finished
+         */
+        if (strstr(args->connect_uri, "file:")) {
+            migrate_incoming_qmp(to, args->connect_uri, "{}");
+        }
+
         if (!got_stop) {
             qtest_qmp_eventwait(from, "STOP");
         }
@@ -1514,6 +1523,39 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
 
+static void test_precopy_unix_file(void)
+{
+    g_autofree char *uri = g_strdup_printf("file:%s/migfile", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = "defer",
+    };
+
+    test_precopy_common(&args);
+}
+
+static void *
+test_migrate_fixed_ram_start(QTestState *from,
+                             QTestState *to)
+{
+    migrate_set_capability(from, "fixed-ram", true);
+    migrate_set_capability(to, "fixed-ram", true);
+
+    return NULL;
+}
+
+static void test_precopy_unix_fixed_ram(void)
+{
+    g_autofree char *uri = g_strdup_printf("file:%s/migfile", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = "defer",
+        .start_hook = test_migrate_fixed_ram_start,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args = {
@@ -2506,6 +2548,10 @@ int main(int argc, char **argv)
                    test_precopy_unix_tls_psk);
 #endif
 
+    qtest_add_func("/migration/precopy/unix/file", test_precopy_unix_file);
+    qtest_add_func("/migration/precopy/unix/fixed-ram",
+                   test_precopy_unix_fixed_ram);
+
     if (has_uffd) {
         /*
          * NOTE: psk test is enough for postcopy, as other types of TLS
-- 
2.34.1


