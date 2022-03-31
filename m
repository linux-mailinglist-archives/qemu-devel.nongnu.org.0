Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D57F74EDCB7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:22:30 +0200 (CEST)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwd3-0006J3-8v
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:22:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwRO-0004um-6a
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwRM-0001hS-Gb
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:10:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aebwCcvLCMGoglNFedm/LJowYh+slbC5rlPrkZcazGg=;
 b=OP1K+N3x8vkOlnQjWoDnGIMvdJFPbLU6UidXW/2g3hPolQIlveZkQM6007cOpTX7waDCQG
 WDJ97xhY/C6EXTeNLdzdDvzGKizGiN19RUtt9TPqRBGMLbTZ/Q4m8l9TZs8YpBMnKSFMhK
 GxmP2KOKdf0GDCict2K3GtwgzQk7zBM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-oex6XXEDPLSls4kGKPsXfQ-1; Thu, 31 Mar 2022 11:09:21 -0400
X-MC-Unique: oex6XXEDPLSls4kGKPsXfQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 cl19-20020a05621404f300b0044103143211so18775477qvb.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aebwCcvLCMGoglNFedm/LJowYh+slbC5rlPrkZcazGg=;
 b=yjy/eGoXgkyvK47RO5FFsrVNuyyde0CuCPGWopFStiZKokzDa5oib4lagbLEMM0YW6
 kJjI9bo9vKChQSi+8UBGerFAMk0YgzDL+gMPKAJoMdNZdProW6mRfJycj6Kw/paqdtMw
 Gehd2bvSSMGXglu2+kXf8lUV+h1/i0ZOtaf3tpoyQQTiaaKh9QQt8cFLlBKFpMW/EJri
 3DMZUSLjwbI+UpKZ9m1lhYNdS6893UfMSZjBCTRAnFlU+4Cx3qPoTUg92HKW1Y9+b81V
 6JifllcNgWGPUYHjVJu74pDbAETrkZTYxCvXXjfZHytd8iscpvOWcR71VBJNHP8jSDMI
 dpFA==
X-Gm-Message-State: AOAM530bdeSi0YxgttB+V4pt2Q2uaAsvIMW5+Fdeu9OeFRBJcgmxmY47
 W7onXeUOHSpwJ/sjcRDvG4Gg9y9IKcd8C+P8Azm9W155C3uusMU21y87iPWSheIE4qnpqQJtAye
 WgTITJYXbyBlZVLoGxgiTFN4hQv/uDY+aGtBgEqbuloQl5fNbnFXNVHRo/eDeJyi+
X-Received: by 2002:a05:620a:4706:b0:67d:a135:c912 with SMTP id
 bs6-20020a05620a470600b0067da135c912mr3743068qkb.344.1648739360230; 
 Thu, 31 Mar 2022 08:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4pDE6tcjBazwJl+hzOTQRpTJYXaFAEUStydpfGxxIslZPSe2u0seSQ0midBST+AYFflqnkQ==
X-Received: by 2002:a05:620a:4706:b0:67d:a135:c912 with SMTP id
 bs6-20020a05620a470600b0067da135c912mr3743031qkb.344.1648739359904; 
 Thu, 31 Mar 2022 08:09:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/19] tests: Add postcopy preempt tests
Date: Thu, 31 Mar 2022 11:08:57 -0400
Message-Id: <20220331150857.74406-20-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Four tests are added for preempt mode:

  - Postcopy default
  - Postcopy tls
  - Postcopy recovery
  - Postcopy tls+recovery

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 49 ++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7288c64e97..7188503ae1 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -477,6 +477,7 @@ typedef struct {
      */
     bool hide_stderr;
     bool use_shmem;
+    bool postcopy_preempt;
     /* only launch the target process */
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
@@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (args->postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     /* We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
@@ -1058,6 +1064,25 @@ static void test_postcopy_tls(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateStart *args)
 {
     QTestState *from, *to;
@@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateStart args = { .postcopy_preempt = true };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2176,6 +2219,12 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
+    qtest_add_func("/migration/postcopy/preempt/recovery",
+                   test_postcopy_preempt_recovery);
+    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
+    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
+                   test_postcopy_preempt_all);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
     qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
-- 
2.32.0


