Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E368307C2D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:24:07 +0100 (CET)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5B1a-0007pA-7L
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@mini.fritz.box>)
 id 1l5Az6-0006LK-47
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:32 -0500
Received: from p5b1511bf.dip0.t-ipconnect.de ([91.21.17.191]:51065
 helo=mini.fritz.box) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefan@mini.fritz.box>) id 1l5Az4-0000Yz-BD
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:21:31 -0500
Received: by mini.fritz.box (Postfix, from userid 502)
 id 5682692C9A9; Thu, 28 Jan 2021 18:11:30 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] tests: Fix runtime error in test-authz-pam
Date: Thu, 28 Jan 2021 18:11:27 +0100
Message-Id: <20210128171127.45808-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=91.21.17.191; envelope-from=stefan@mini.fritz.box;
 helo=mini.fritz.box
X-Spam_score_int: 21
X-Spam_score: 2.1
X-Spam_bar: ++
X-Spam_report: (2.1 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, RCVD_IN_PBL=3.335, RCVD_IN_SORBS_DUL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A test with sanitizers on macOS shows this error:

    authz/pamacct.c:50:25: runtime error: null pointer passed as argument 1, which is declared to never be null
    /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/security/pam_appl.h:56:2: note: nonnull attribute specified here

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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
2.24.3 (Apple Git-128)


