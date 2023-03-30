Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337616D0D5A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:06:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phwd6-0003EH-Ul; Thu, 30 Mar 2023 14:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwcu-0003Bh-Tx
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:56 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwct-00021L-Ei
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:03:56 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97176219E8;
 Thu, 30 Mar 2023 18:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+ZBwUdJwUxaCGnBgDhTSIaWa5ev6qXpjX6yCZCHVwA=;
 b=apOxVUCnJLDpZRp7mXox/gizyVQUdYBODUJp9cr6TbAsIPBATclFTIpWVmZqKUoEwnEDcN
 6cd9quglBhO3dOAQEEQKamFaaotQhvUHgVZeWC6qo0ppQ+uQhKQTFj8FvH4GmMNnTJtdDQ
 l3d8lygmLsG081tzPG5yDZcfN67wNe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+ZBwUdJwUxaCGnBgDhTSIaWa5ev6qXpjX6yCZCHVwA=;
 b=G2WOSJvQSxVjvEhA+GpZD5suiVllN4BRPoMUWjWVysfyNovqouhNvijTEXxBazfbL9numo
 FKYdI7sZgOYGdgAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 952971348E;
 Thu, 30 Mar 2023 18:03:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IIbAFgbPJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:03:50 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Nikolay Borisov <nborisov@suse.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v1 04/26] tests/qtest: migration-test: Add tests for
 file-based migration
Date: Thu, 30 Mar 2023 15:03:14 -0300
Message-Id: <20230330180336.2791-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230330180336.2791-1-farosas@suse.de>
References: <20230330180336.2791-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nikolay Borisov <nborisov@suse.com>

Add basic tests for file-based migration.

Signed-off-by: Nikolay Borisov <nborisov@suse.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
(farosas) fix segfault when connect_uri is not set
---
 tests/qtest/migration-test.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 3b615b0da9..13e5cdd5a4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -748,6 +748,7 @@ static void test_migrate_end(QTestState *from, QTestState *to, bool test_dest)
     cleanup("migsocket");
     cleanup("src_serial");
     cleanup("dest_serial");
+    cleanup("migfile");
 }
 
 #ifdef CONFIG_GNUTLS
@@ -1371,6 +1372,14 @@ static void test_precopy_common(MigrateCommon *args)
          * hanging forever if migration didn't converge */
         wait_for_migration_complete(from);
 
+        /*
+         * For file based migration the target must begin its migration after
+         * the source has finished
+         */
+        if (args->connect_uri && strstr(args->connect_uri, "file:")) {
+            migrate_incoming_qmp(to, args->connect_uri, "{}");
+        }
+
         if (!got_stop) {
             qtest_qmp_eventwait(from, "STOP");
         }
@@ -1524,6 +1533,17 @@ static void test_precopy_unix_xbzrle(void)
     test_precopy_common(&args);
 }
 
+static void test_precopy_file_stream_ram(void)
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
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args = {
@@ -2515,6 +2535,10 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
+
+    qtest_add_func("/migration/precopy/file/stream-ram",
+                   test_precopy_file_stream_ram);
+
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
-- 
2.35.3


