Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731C560E62
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 02:57:14 +0200 (CEST)
Received: from localhost ([::1]:38442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iUb-00086b-IV
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 20:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOu-0001jG-15
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:21 -0400
Received: from mout-u-204.mailbox.org ([2001:67c:2050:101:465::204]:49114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <lkujaw@member.fsf.org>)
 id 1o6iOq-0004nw-OY
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:51:19 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-u-204.mailbox.org (Postfix) with ESMTPS id 4LYKX16y0Xz9sWb;
 Thu, 30 Jun 2022 02:51:13 +0200 (CEST)
From: Lev Kujawski <lkujaw@member.fsf.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Lev Kujawski <lkujaw@member.fsf.org>
Subject: [PATCH v4 3/3] tests/qtest/i440fx-test.c: Enable full test of i440FX
 PAM operation
Date: Thu, 30 Jun 2022 00:50:58 +0000
Message-Id: <20220630005058.500449-4-lkujaw@member.fsf.org>
In-Reply-To: <20220630005058.500449-1-lkujaw@member.fsf.org>
References: <20220630005058.500449-1-lkujaw@member.fsf.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4LYKX16y0Xz9sWb
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

* tests/qtest/i440fx-test.c
test_i440fx_pam:
- Verify that changing attributes does not affect the initial contents
  of the PAM region;
- Verify that that the first new mask is written before switching
  attributes;
- Verify that just PAM_WE works by writing a new mask;
- Switch back to PAM_RE after PAM_WE to read the new mask;
- Tighten logic of the !WE write test because we know what the
  original contents were; and
- Write the last mask before testing for it.

Signed-off-by: Lev Kujawski <lkujaw@member.fsf.org>
---
(v4) Minor tweaks:
- Use spacing to delineate the functionality being tested.
- Ensure that PAM_WE is working by writing a mask within
  that portion.
(v2-v3) No changes

 tests/qtest/i440fx-test.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 6d7d4d8d8f..b761ae53cb 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -229,6 +229,7 @@ static void test_i440fx_pam(gconstpointer opaque)
 
         g_test_message("Checking area 0x%05x..0x%05x",
                        pam_area[i].start, pam_area[i].end);
+
         /* Switch to RE for the area */
         pam_set(dev, i, PAM_RE);
         /* Verify the RAM is all zeros */
@@ -236,33 +237,35 @@ static void test_i440fx_pam(gconstpointer opaque)
 
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
-
-        /* Verify the area is our new mask */
-        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x42));
+        /* Write out a new mask */
+        write_area(pam_area[i].start, pam_area[i].end, 0xaa);
+        /* Verify the area is not our new mask */
+        g_assert(!verify_area(pam_area[i].start, pam_area[i].end, 0xaa));
 
+        /* Switch to !WE for the area */
+        pam_set(dev, i, PAM_RE);
+        /* Verify the area is the new mask */
+        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0xaa));
         /* Write out a new mask */
         write_area(pam_area[i].start, pam_area[i].end, 0x82);
-
-#ifndef BROKEN
-        /* QEMU only supports a limited form of PAM */
-
-        /* Verify the area is not our mask */
-        g_assert(!verify_area(pam_area[i].start, pam_area[i].end, 0x82));
+        /* Verify the area is not the new mask */
+        g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0xaa));
 
         /* Switch to RE for the area */
         pam_set(dev, i, PAM_RE | PAM_WE);
-#endif
+        /* Write out a new mask again */
+        write_area(pam_area[i].start, pam_area[i].end, 0x82);
         /* Verify the area is our new mask */
         g_assert(verify_area(pam_area[i].start, pam_area[i].end, 0x82));
 
-- 
2.34.1


