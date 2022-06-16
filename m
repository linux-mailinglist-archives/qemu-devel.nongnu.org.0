Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1212454DCD9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:28:19 +0200 (CEST)
Received: from localhost ([::1]:45144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1krS-0006DR-2y
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1kmD-0003Wv-Oe
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:22:53 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:49404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o1kmB-0001Kn-V6
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:22:53 -0400
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LNwCS4kYYz9sMC;
 Thu, 16 Jun 2022 10:22:44 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@member.fsf.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] tests/qtest/i440fx-test.c: Enable full test of i440FX PAM
 operation
Date: Thu, 16 Jun 2022 08:22:23 +0000
Message-Id: <20220616082223.622688-2-lkujaw@member.fsf.org>
In-Reply-To: <20220616082223.622688-1-lkujaw@member.fsf.org>
References: <20220616082223.622688-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LNwCS4kYYz9sMC
Received-SPF: pass client-ip=2001:67c:2050:101:465::204;
 envelope-from=lkujaw@member.fsf.org; helo=mout-u-204.mailbox.org
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With the prior patch in this series adding support for RE^WE PAM
semantics, the '#ifndef BROKEN' segments of test_i440fx_pam can now be
enabled.

Additionally:
- Verify that changing attributes does not affect the initial contents
  of the PAM region;
- Verify that that the first new mask is written before switching
  attributes;
- Switch back to PAM_RE after PAM_WE to read original contents;
- Tighten logic of the !WE write test because we know what the
  original contents were; and
- Write the last mask before testing for it.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
 tests/qtest/i440fx-test.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 6d7d4d8d8f..073a16bbed 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -236,33 +236,34 @@ static void test_i440fx_pam(gconstpointer opaque)
 
         /* Switch to WE for the area */
         pam_set(dev, i, PAM_RE | PAM_WE);
+        /* Verify the RAM is still all zeros */
+        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0));
         /* Write out a non-zero mask to the full area */
         write_area(pam_area[i].start, pam_area[i].end, 0x42);
-
-#ifndef BROKEN
-        /* QEMU only supports a limited form of PAM */
+        /* Verify the area contains the new mask */
+        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x42));
 
         /* Switch to !RE for the area */
         pam_set(dev, i, PAM_WE);
         /* Verify the area is not our mask */
         g_assert(!verify_area(pam_area[i].start, pam_area[i].end, 0x42));
-#endif
 
-        /* Verify the area is our new mask */
+        /* Switch to !WE for the area */
+        pam_set(dev, i, PAM_RE);
+        /* Verify the area is once again our mask */
         g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x42));
 
         /* Write out a new mask */
         write_area(pam_area[i].start, pam_area[i].end, 0x82);
 
-#ifndef BROKEN
-        /* QEMU only supports a limited form of PAM */
-
-        /* Verify the area is not our mask */
-        g_assert(!verify_area(pam_area[i].start, pam_area[i].end, 0x82));
+        /* Verify the area is not the new mask */
+        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x42));
 
         /* Switch to RE for the area */
         pam_set(dev, i, PAM_RE | PAM_WE);
-#endif
+        /* Write out a new mask again */
+        write_area(pam_area[i].start, pam_area[i].end, 0x82);
+
         /* Verify the area is our new mask */
         g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x82));
 
-- 
2.34.1


