Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5042E6D0D56
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 20:05:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phweD-0004AY-81; Thu, 30 Mar 2023 14:05:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdr-0003vP-9D
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:59 -0400
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1phwdn-0002Bs-1F
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 14:04:52 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E6C9F21A28;
 Thu, 30 Mar 2023 18:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680199489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBctC7xfTNOsGsTjxQoB9Jw5X8LHmjUFXnq6SNzwf04=;
 b=rLM9/mNqXqK25iAcZYhUFKgYusksxGSZ30pblYjz8ncWBXyC6WU0AHV/S1bK5WuTCzIfk9
 eAQLv2khIaM+VR9p+d9KZbiwrrgyaIm/UyU9hCzxBgd/m6VKBf1lmpigW8mSWmJDQVoYY9
 wqh/LAxsRPfaISoQ217xb+X4NzzplNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680199489;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBctC7xfTNOsGsTjxQoB9Jw5X8LHmjUFXnq6SNzwf04=;
 b=ZlUUCcZ3p5yt/LYKJ3/c8Elw0HavRczLL10aFh+rKNFjnpDq/B9KHX7VGTH0TPw8BvLUIY
 zKLkSR37kY4bDkBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A7E41348E;
 Thu, 30 Mar 2023 18:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CAhdOD7PJWQ5GwAAMHmgww
 (envelope-from <farosas@suse.de>); Thu, 30 Mar 2023 18:04:46 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, jfehlig@suse.com, dfaggioli@suse.com,
 dgilbert@redhat.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [RFC PATCH v1 24/26] tests/qtest: Add a multifd + fixed-ram migration
 test
Date: Thu, 30 Mar 2023 15:03:34 -0300
Message-Id: <20230330180336.2791-25-farosas@suse.de>
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 tests/qtest/migration-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 84b4c761ad..2e0911996d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1564,6 +1564,31 @@ static void test_precopy_file_fixed_ram(void)
     test_precopy_common(&args);
 }
 
+static void *migrate_multifd_fixed_ram_start(QTestState *from, QTestState *to)
+{
+    migrate_fixed_ram_start(from, to);
+
+    migrate_set_parameter_int(from, "multifd-channels", 4);
+    migrate_set_parameter_int(to, "multifd-channels", 4);
+
+    migrate_set_capability(from, "multifd", true);
+    migrate_set_capability(to, "multifd", true);
+
+    return NULL;
+}
+
+static void test_multifd_file_fixed_ram(void)
+{
+    g_autofree char *uri = g_strdup_printf("file:%s/migfile", tmpfs);
+    MigrateCommon args = {
+        .connect_uri = uri,
+        .listen_uri = "defer",
+        .start_hook = migrate_multifd_fixed_ram_start,
+    };
+
+    test_precopy_common(&args);
+}
+
 static void test_precopy_tcp_plain(void)
 {
     MigrateCommon args = {
@@ -2560,6 +2585,8 @@ int main(int argc, char **argv)
                    test_precopy_file_stream_ram);
     qtest_add_func("/migration/precopy/file/fixed-ram",
                    test_precopy_file_fixed_ram);
+    qtest_add_func("/migration/multifd/file/fixed-ram",
+                   test_multifd_file_fixed_ram);
 
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/precopy/unix/tls/psk",
-- 
2.35.3


