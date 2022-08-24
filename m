Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3559F7E9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:37:41 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnlU-000631-8r
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu7-0003UL-PH
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:31 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:51133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmu6-0001Yy-0v
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id g18so16539816pju.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Q1LOr75ldxNy4JPk8mGR6OHZijSnHEDxgtXAj7RfZ6w=;
 b=Z8jIb21aeRsix3mRDGDGTUEmGiO246Be/3Rh10eg3xB4Z5WMJ+3xpoKubcUfcv+se+
 QTmCEnbtqSP2SH6vm4xR3yX6o7NtPbOvxKls7c2j32Q9Xz1aYEzQc1nw4VUcBBEaV+Xs
 45+Ycz7mQE/1Dy41Qghn9PXMi4cTes7oAW1k8FsfKfdfRMGQTkGQoGavWHBmjC8TrSjK
 j3/yzf8snLFK3lIDMGGlg7X+oXQy6L52soZR0sC5r0TfMgpZGR09k2Bu3VlMiYNfMy+Z
 pmnEcfNr2JXcnT4B9DVmdLjGVw6DBxXzeIBF8zMOYhsF5t7pJJ5ujK9Gk/Tq+h4wEY5S
 ta8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Q1LOr75ldxNy4JPk8mGR6OHZijSnHEDxgtXAj7RfZ6w=;
 b=KVOribmIIZzeCJQUxd1hK/UuK9Y5lJLV6ObWg1tQxMBNjqwNYhcKEJNFQKWMSHpFz2
 KzabOoeXd8fWqtPq1Tqi8emoi9bR75Rr8eBIcGpCVQTLbr29B78R8RpbZW8CLuDTT//5
 IzhUOgHKu3Dpgk0LORGbK8KI4FdJpFx8Xh8P8KgKPqrurB0N9TAAvqTUowzrYbsegCOs
 2eTCYKOhir0l9TA/CYtkeEBS9asZGvacmPVvnqdFhLTqDJScLc5hEM0uzcRrNkF0SCqm
 2FLnj8JAiZJ7ukAQ750gnBPSVttcZPHc3JC/GqVU/MD9TDklCqQ7kNz83odbkQZDujNe
 wrmg==
X-Gm-Message-State: ACgBeo2G+IGO0pMN4z4HJP3OLKoXCiwx4WhQo4cHmJpbpCE8/rK6mCdC
 WczcIo3Gr8bpcH2ZqYb0yCz9kLjmCVM=
X-Google-Smtp-Source: AA6agR7Y0Q3wZwz9P+7kz5MoKZKUgdeceSrbqcZM6ENNrp+jCQDWj3QawsxqA1lWG7SyW2SaLRSmfA==
X-Received: by 2002:a17:902:864c:b0:172:bc0d:c769 with SMTP id
 y12-20020a170902864c00b00172bc0dc769mr25910815plt.146.1661334148133; 
 Wed, 24 Aug 2022 02:42:28 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:27 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 21/51] tests/qtest: migration-test: Skip running
 test_migrate_fd_proto on win32
Date: Wed, 24 Aug 2022 17:39:59 +0800
Message-Id: <20220824094029.1634519-22-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

The test case 'test_migrate_fd_proto' calls socketpair() which does
not exist on win32. Exclude it. The helper function wait_command_fd()
is not needed anymore, hence exclude it too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/migration-helpers.h | 2 ++
 tests/qtest/migration-helpers.c | 2 ++
 tests/qtest/migration-test.c    | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 59561898d0..db0684de48 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -17,8 +17,10 @@
 
 extern bool got_stop;
 
+#ifndef _WIN32
 G_GNUC_PRINTF(3, 4)
 QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
+#endif
 
 G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index c6fbeb3974..f6f3c6680f 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -34,6 +34,7 @@ static void check_stop_event(QTestState *who)
     }
 }
 
+#ifndef _WIN32
 /*
  * Events can get in the way of responses we are actually waiting for.
  */
@@ -58,6 +59,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...)
 
     return ret;
 }
+#endif
 
 /*
  * Events can get in the way of responses we are actually waiting for.
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index af9250750b..2ae7498d5d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1629,6 +1629,7 @@ static void test_precopy_tcp_tls_x509_reject_anon_client(void)
 #endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
+#ifndef _WIN32
 static void *test_migrate_fd_start_hook(QTestState *from,
                                         QTestState *to)
 {
@@ -1697,6 +1698,7 @@ static void test_migrate_fd_proto(void)
     };
     test_precopy_common(&args);
 }
+#endif /* _WIN32 */
 
 static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
 {
@@ -2531,7 +2533,9 @@ int main(int argc, char **argv)
 #endif /* CONFIG_GNUTLS */
 
     /* qtest_add_func("/migration/ignore_shared", test_ignore_shared); */
+#ifndef _WIN32
     qtest_add_func("/migration/fd_proto", test_migrate_fd_proto);
+#endif
     qtest_add_func("/migration/validate_uuid", test_validate_uuid);
     qtest_add_func("/migration/validate_uuid_error", test_validate_uuid_error);
     qtest_add_func("/migration/validate_uuid_src_not_set",
-- 
2.34.1


