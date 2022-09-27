Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41595EC445
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:22:29 +0200 (CEST)
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAXc-00058T-He
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8ST-00045Y-DK
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:09:01 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SN-0005MW-UG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:57 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so9752813pjk.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8xQxX3aLwKGUXMI2hUqbIbF5Q3YkMuwq57oZfcmhgr8=;
 b=Vt3xoFHOj4JRADuFraQKickwsvy/WizFngsnGCQCG9Ae/ynoydE7K1gxowHRWV6u0Z
 4Gj6IkhOe5KnZhwgypdAGc6aoCf1nckhSfGnGvMN4sxqw1QdwPkLK/9Yyb45HtunRm0D
 H2ScADRcJXOuiPB5EI6oSgvhsdsOrM4RwLdUnxSj3n1jdMAAdsfZMMdIs6FloP+Y95EY
 Dxb4ivTAR+YXEeZSH5aOgxqdBrf0Y+rcjEqCljmMLKNUrqM76Nd3mdUBDsqOtp+DR2AK
 dY0wCYZt89X/fDDI739o3754SBTPjtnHP9chT0cjPXmDj49im/cC//G+so9EKaOpP0JO
 wyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8xQxX3aLwKGUXMI2hUqbIbF5Q3YkMuwq57oZfcmhgr8=;
 b=O3JbCAy9GEkn+KfIORyhd+qDMFZ/8bpRWt5uKQJbDSfFSEcg+eTeOuZ+5RqI51jRop
 xKL0RHjITUi0ooRWI6MPW3ou0Wi51G4zDakb+wFpFmB0NSwBEo/CAx3tx6taObxaZvLr
 X6EBh1CnCsOKU7UfGF+wgIf9F1XKli4UtKSRbI4Max8zthUH9D2BiiK9j3BHnVH3EKQq
 LyL91/iO/DxWeKzQfLZdQCXZOjS473LEraSPFC+u/z5JpXzs854W3qvIGCVkPd6Zt7b3
 Hg5qAEQ2rR+cOR02qImDAF7aafGAFhb7koOvGkv66MMqTyWGG70ft7tHDx1Xh0odYgl/
 PQAQ==
X-Gm-Message-State: ACrzQf2CicT5Dp2m9/vPBzRXMEyLjlzRAvhZxTqrztrRuQdCJc6sRW8m
 NWn4yK/Qcy9NisZtEgH8/ZTm//50UuI=
X-Google-Smtp-Source: AMsMyM6MKE/9QBjZ84xBFkmkjef4h4XKNPSr41XfYoeiJOJmWciwp/GR4YAMZNv2zPRZstReI5EvLQ==
X-Received: by 2002:a17:902:eb90:b0:176:b24a:e69b with SMTP id
 q16-20020a170902eb9000b00176b24ae69bmr26414075plg.86.1664276934260; 
 Tue, 27 Sep 2022 04:08:54 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:54 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 50/54] tests/qtest: migration-test: Skip running some TLS
 cases for win32
Date: Tue, 27 Sep 2022 19:06:28 +0800
Message-Id: <20220927110632.1973965-51-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Some migration test cases use TLS to communicate, but they fail on
Windows with the following error messages:

  qemu-system-x86_64: TLS handshake failed: Insufficient credentials for that request.
  qemu-system-x86_64: TLS handshake failed: Error in the pull function.
  query-migrate shows failed migration: TLS handshake failed: Error in the pull function.

Disable them temporarily.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---
I am not familar with the gnutls and simply enabling the gnutls debug
output does not give me an immedidate hint on why it's failing on
Windows. Disable these cases for now until someone or maintainers
who may want to test this on Windows.

(no changes since v1)

 tests/qtest/migration-test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 6f9fe13488..5c1aaa700e 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1402,6 +1402,7 @@ static void test_precopy_unix_dirty_ring(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_unix_tls_psk(void)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
@@ -1414,6 +1415,7 @@ static void test_precopy_unix_tls_psk(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 #ifdef CONFIG_TASN1
 static void test_precopy_unix_tls_x509_default_host(void)
@@ -1522,6 +1524,7 @@ static void test_precopy_tcp_plain(void)
 }
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void test_precopy_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1532,6 +1535,7 @@ static void test_precopy_tcp_tls_psk_match(void)
 
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_precopy_tcp_tls_psk_mismatch(void)
 {
@@ -1929,6 +1933,7 @@ static void test_multifd_tcp_zstd(void)
 #endif
 
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
 static void *
 test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
                                              QTestState *to)
@@ -1936,6 +1941,7 @@ test_migrate_multifd_tcp_tls_psk_start_match(QTestState *from,
     test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
     return test_migrate_tls_psk_start_match(from, to);
 }
+#endif /* _WIN32 */
 
 static void *
 test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
@@ -1987,6 +1993,7 @@ test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
 }
 #endif /* CONFIG_TASN1 */
 
+#ifndef _WIN32
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1996,6 +2003,7 @@ static void test_multifd_tcp_tls_psk_match(void)
     };
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void test_multifd_tcp_tls_psk_mismatch(void)
 {
@@ -2498,8 +2506,10 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/unix/tls/psk",
                    test_precopy_unix_tls_psk);
+#endif
 
     if (has_uffd) {
         /*
@@ -2525,8 +2535,10 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/precopy/tcp/plain", test_precopy_tcp_plain);
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/precopy/tcp/tls/psk/match",
                    test_precopy_tcp_tls_psk_match);
+#endif
     qtest_add_func("/migration/precopy/tcp/tls/psk/mismatch",
                    test_precopy_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
@@ -2570,8 +2582,10 @@ int main(int argc, char **argv)
                    test_multifd_tcp_zstd);
 #endif
 #ifdef CONFIG_GNUTLS
+#ifndef _WIN32
     qtest_add_func("/migration/multifd/tcp/tls/psk/match",
                    test_multifd_tcp_tls_psk_match);
+#endif
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
 #ifdef CONFIG_TASN1
-- 
2.34.1


