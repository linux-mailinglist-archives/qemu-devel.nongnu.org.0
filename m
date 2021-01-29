Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE74308BAB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 18:42:54 +0100 (CET)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5XnJ-00024X-3T
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 12:42:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLg-0006cJ-VE
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l5XLf-00089p-6e
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 12:14:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611940458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nPNfO81PlYle/zzWJjxZiJWWSFeST7l/GLvM7fvdOc=;
 b=eUi5/yCNKP/LGdvm5uMu/NG8ichIGoExleupWvjRQY3fCczUEJ+bnyfj1S9oPoA8H9efNo
 Kj+VRINaqyupxphkrOlwz8BGseAfJKmRLu2Jm2t2HI3zJMkSXTDuPifGdzztOAsde+UG4D
 fbozRJYbCSXsxt835ds/mx37yXTGqqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-65iT1uGJOmW-ry_4yEKUXQ-1; Fri, 29 Jan 2021 12:14:15 -0500
X-MC-Unique: 65iT1uGJOmW-ry_4yEKUXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A3F4107ACE3;
 Fri, 29 Jan 2021 17:14:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-94.ams2.redhat.com
 [10.36.115.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B1716267E;
 Fri, 29 Jan 2021 17:14:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] tests: Fix runtime error in test-authz-pam
Date: Fri, 29 Jan 2021 17:11:01 +0000
Message-Id: <20210129171102.4109641-13-berrange@redhat.com>
In-Reply-To: <20210129171102.4109641-1-berrange@redhat.com>
References: <20210129171102.4109641-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

A test with sanitizers on macOS shows this error:

    authz/pamacct.c:50:25: runtime error: null pointer passed as argument 1, which is declared to never be null
    /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/security/pam_appl.h:56:2: note: nonnull attribute specified here

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-authz-pam.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/test-authz-pam.c b/tests/test-authz-pam.c
index 1baeadee03..4fe1ef2603 100644
--- a/tests/test-authz-pam.c
+++ b/tests/test-authz-pam.c
@@ -28,7 +28,7 @@
 static bool failauth;
 
 /*
- * These two functions are exported by libpam.so.
+ * These three functions are exported by libpam.so.
  *
  * By defining them again here, our impls are resolved
  * by the linker instead of those in libpam.so
@@ -50,6 +50,7 @@ pam_start(const char *service_name, const char *user,
         failauth = false;
     }
 
+    *pamh = (pam_handle_t *)0xbadeaffe;
     return PAM_SUCCESS;
 }
 
@@ -65,6 +66,13 @@ pam_acct_mgmt(pam_handle_t *pamh, int flags)
 }
 
 
+int
+pam_end(pam_handle_t *pamh, int status)
+{
+    return PAM_SUCCESS;
+}
+
+
 static void test_authz_unknown_service(void)
 {
     Error *local_err = NULL;
-- 
2.29.2


