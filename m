Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FDD56AAFE
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 20:48:37 +0200 (CEST)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9WYF-0000I2-R6
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 14:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9WWB-0007LA-2b
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o9WW6-0000MR-TO
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 14:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657219581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2dqHjcy2iX6CxgakSaaHIQDHdzkBlNcbN8nhX70hJ74=;
 b=eFfA0t5BzcW6d+7q5pCaVZojXcPHLHkerUu6rrq2y+7cdUauRu7qktVDnJDtFryd8+6Ipx
 xqsmmf5bPNKf8pkOYmHc/62DwzZ+3rtfKJCG2OfbGB0Sm+DTHVIoxiGOXMbhgNqPiCOREt
 Kht+oXLwnst/genhG48AU0pc64ErKOc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-p1foH-KjPVmCRw-RZ86lOA-1; Thu, 07 Jul 2022 14:46:06 -0400
X-MC-Unique: p1foH-KjPVmCRw-RZ86lOA-1
Received: by mail-qt1-f197.google.com with SMTP id
 cr13-20020a05622a428d00b0031d3463f241so16095604qtb.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 11:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2dqHjcy2iX6CxgakSaaHIQDHdzkBlNcbN8nhX70hJ74=;
 b=H2PlkQherHtBwULPsvEhu6IBNwgx2ZHZB4ZRQ+NizuClUsdzv/+QtQB568hV7sLr2w
 r8jTb+gjI2uoTF+nCwXah/CRAav/kIjJPZnsEiNBX/1Je71AClHgkQukJvs+4m2KbzOy
 UpBTxi5aFx4jeaZddVEXmYQtInfZK6we8hhig5+QfsHrMj3EF8l8fYhqZODU8IdT1cQb
 mMPtpFUy8PnkhTrb1PrZXXNZ3t6X7NknPCkCEjj8urawQGVRpnRk8s2a8InwhAz2mvpE
 sQQN/NsI016PSMq2U29narWHU7BOvbYh2xfDaSihDmOwQiX5LxxTwGjLBjOSTDdw0mt3
 wJoQ==
X-Gm-Message-State: AJIora9xl6DNkI6+fbRBBSvruyVRgddVq8XFVELaE35OdQtaWI+R6L4y
 oFQgTvyWY61M4kieMbj+KZVHEKqn31YF0fACN7NyIodNI2ZYvpFGez325QUau47aC5RW6DMHQWy
 jJfafYqCM75C8ePnqmdEsH5LdzS0D1mGlAe+ANH+ZI1OtdTes+xlejIAA5lQam2Jb
X-Received: by 2002:ac8:5e52:0:b0:31d:3262:f26f with SMTP id
 i18-20020ac85e52000000b0031d3262f26fmr32889132qtx.244.1657219563949; 
 Thu, 07 Jul 2022 11:46:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sBhN0TMoV+p2XDRdwauoFGUvoDhz+8W0G+5iYY/hlMVjgjhD6cvGghdKbA9ZmSTd7IKIz++A==
X-Received: by 2002:ac8:5e52:0:b0:31d:3262:f26f with SMTP id
 i18-20020ac85e52000000b0031d3262f26fmr32889113qtx.244.1657219563697; 
 Thu, 07 Jul 2022 11:46:03 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-37-74-12-30-85.dsl.bell.ca. [74.12.30.85])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05620a24ce00b006af59e9ddeasm26072302qkn.18.2022.07.07.11.46.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 Jul 2022 11:46:02 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH] tests: migration-test: Allow test to run without uffd
Date: Thu,  7 Jul 2022 14:46:00 -0400
Message-Id: <20220707184600.24164-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
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

We used to stop running all tests if uffd is not detected.  However
logically that's only needed for postcopy not the rest of tests.

Keep running the rest when still possible.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 9e64125f02..55acf9612c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -2086,14 +2086,11 @@ int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
     const bool has_kvm = qtest_has_accel("kvm");
+    const bool has_uffd = ufd_version_check();
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
-    if (!ufd_version_check()) {
-        return g_test_run();
-    }
-
     /*
      * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
      * is touchy due to race conditions on dirty bits (especially on PPC for
@@ -2122,8 +2119,10 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    if (has_uffd) {
+        qtest_add_func("/migration/postcopy/unix", test_postcopy);
+        qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    }
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


