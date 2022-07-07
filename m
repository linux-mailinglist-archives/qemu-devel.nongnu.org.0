Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D808E56AB83
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 21:07:35 +0200 (CEST)
Received: from localhost ([::1]:45090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Wqc-0006So-IS
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 15:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wf0-0005xW-3V
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9Wey-0001lx-JE
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:55:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657220132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5dZRvfRbv4WzlyS1K+TxJ91b82FUR56T1ik0nvw67lk=;
 b=huCX9M53AB98C7dEB3huJ/4JEjSeD/P3CPAu1h0eO95x3//eCRO3VKKnuEPu2ePvdb5ffm
 ezGyeZ/doQHlcIiJTodBwDZRdhxBMPHMHUoo2bRiI4Ybikvol55yP2/dfvaXMnnOvcOLWL
 bN7oKzPMkRmJTVsFprNLGiO7ntPyduM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-IvTgLcDnNZqsdOHo0z40bg-1; Thu, 07 Jul 2022 14:55:31 -0400
X-MC-Unique: IvTgLcDnNZqsdOHo0z40bg-1
Received: by mail-qt1-f200.google.com with SMTP id
 bc7-20020a05622a1cc700b0031e7e46e660so10264454qtb.10
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dZRvfRbv4WzlyS1K+TxJ91b82FUR56T1ik0nvw67lk=;
 b=xlwkEJugXC6WIrkCS0Rq/D52yinl50TMiXlOwTbQigRJrI5xBWiVtWm0CRo8uDKwDK
 xSfVnuax1q1+gleGph2rzhU230DjFCjilYQndCo8hoINNSQgNDImCn9rhw2l+r98maui
 wBZ6wvW+tP9aoPhhAgccVVs+5w+ZreBnTtqOGnWUyA/BR7AhHajmMHI+Xahyf5n8fAJE
 mBNMaVSrQjvyUH4gMGm9TUIqJ7W5pfnVhF1GAiW8ijTrbtlL/sH1OYyCsdHN5yMRUO41
 3/ZpJG4yL+bTpRE6/lSCnToY8WYh5NArcn3mV0PQqCDNMZKjkz30VSenx1dv8d9ifvXd
 n7Aw==
X-Gm-Message-State: AJIora9yHwscuDys0aEi1DOZZaLWiVBa1CQ0ipyLPR+25pzS4njsp43h
 dP+360cEmCo+ywytFmiZqg1DgfAa8c+WpNiAabHO/Cd3G3qdUP7BYekh902VHkvWqrMtz4ADbxq
 t7RdIBRyZPjeZsbssPSBu8lEDoudw8rJNacYvyCRCvjKpqirttrn4oaq82188PTfA
X-Received: by 2002:ac8:5c12:0:b0:31e:9f86:1632 with SMTP id
 i18-20020ac85c12000000b0031e9f861632mr2464720qti.123.1657220130289; 
 Thu, 07 Jul 2022 11:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvprnbtq5974YrUoJH1lKM4i7aXMfYHCFqGpn7DPFpRrCEu4IB5s+IIzEU063OsoZgiQds/Q==
X-Received: by 2002:ac8:5c12:0:b0:31e:9f86:1632 with SMTP id
 i18-20020ac85c12000000b0031e9f861632mr2464701qti.123.1657220130020; 
 Thu, 07 Jul 2022 11:55:30 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 14-20020ac8594e000000b00304fc3d144esm28764902qtz.1.2022.07.07.11.55.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:55:29 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, peterx@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v9 13/14] tests: Add postcopy tls recovery migration test
Date: Thu,  7 Jul 2022 14:55:27 -0400
Message-Id: <20220707185527.27747-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220707185342.26794-1-peterx@redhat.com>
References: <20220707185342.26794-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 37 ++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index ee37ad6631..81ef9741cd 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1137,17 +1137,15 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateCommon *args)
 {
-    MigrateCommon args = {
-        .start = {
-            .hide_stderr = true,
-        },
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->start.hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1198,7 +1196,24 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateCommon args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateCommon args = {
+        .start_hook = test_migrate_tls_psk_start_match,
+        .finish_hook = test_migrate_tls_psk_finish,
+    };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2163,6 +2178,12 @@ int main(int argc, char **argv)
         qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #endif /* CONFIG_GNUTLS */
         qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+        qtest_add_func("/migration/postcopy/recovery/plain",
+                       test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+        qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                       test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
     }
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


