Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D9243C456
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 09:48:26 +0200 (CEST)
Received: from localhost ([::1]:34660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfdfd-0001P0-SR
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 03:48:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfddA-0008LK-TJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mfdd8-0000Ha-Ah
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 03:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635320749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5DPNqAMSYufyfCrG1iJTTsUYiHddrXoBhRdfoOYnALo=;
 b=VMUq45S/lfifd3s5qvUqsdxHbX7SMfviP5JDMa7jKZOvuRnTetNCLlaRj7RA0F84HSwoVc
 wHv2py2PWARwNUt/SPPGdkwfPLbve42MUk24AuOyraZ39nqOj2dpLL1PDGLENFXaZQVI5e
 fysFuhwfISQ0YJDxTFhlX6dG4GR861Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-7aROxDilNMiK2BLWt2b-AA-1; Wed, 27 Oct 2021 03:45:45 -0400
X-MC-Unique: 7aROxDilNMiK2BLWt2b-AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CD918125C2;
 Wed, 27 Oct 2021 07:45:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFEB67086D;
 Wed, 27 Oct 2021 07:45:43 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
Date: Wed, 27 Oct 2021 03:45:42 -0400
Message-Id: <20211027074542.2607865-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, thuth@redhat.com, Jason Andryuk <jandryuk@gmail.com>,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If KVM is disabled or not present, qtest library build
may fail with:
   libqtest.c: In function 'qtest_has_accel':
      comparison of unsigned expression < 0 is always false
      [-Werror=type-limits]
         for (i = 0; i < ARRAY_SIZE(targets); i++) {

due to empty 'targets' array.
Fix it by compiling KVM related part only if
CONFIG_KVM_TARGETS is set.

Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
Reported-by: Jason Andryuk <jandryuk@gmail.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/libqtest.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 25aeea385b..9833e16f84 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -931,6 +931,7 @@ bool qtest_has_accel(const char *accel_name)
         return false;
 #endif
     } else if (g_str_equal(accel_name, "kvm")) {
+#if defined(CONFIG_KVM_TARGETS)
         int i;
         const char *arch = qtest_get_arch();
         const char *targets[] = { CONFIG_KVM_TARGETS };
@@ -942,6 +943,9 @@ bool qtest_has_accel(const char *accel_name)
                 }
             }
         }
+#else
+        return false;
+#endif
     } else {
         /* not implemented */
         g_assert_not_reached();
-- 
2.27.0


