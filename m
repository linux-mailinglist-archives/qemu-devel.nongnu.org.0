Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668B6B0FBB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZx7u-0004Az-2X; Wed, 08 Mar 2023 11:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7r-00049j-Ay; Wed, 08 Mar 2023 11:58:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pZx7p-0003y5-P3; Wed, 08 Mar 2023 11:58:51 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0F946400E9;
 Wed,  8 Mar 2023 19:58:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id BBBB313A;
 Wed,  8 Mar 2023 19:58:18 +0300 (MSK)
Received: (nullmailer pid 2098276 invoked by uid 1000);
 Wed, 08 Mar 2023 16:58:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 12/47] target/arm: Fix sve_probe_page
Date: Wed,  8 Mar 2023 19:57:15 +0300
Message-Id: <20230308165815.2098148-12-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
References: <20230308165035.2097594-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Don't dereference CPUTLBEntryFull until we verify that
the page is valid.  Move the other user-only info field
updates after the valid check to match.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1412
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20230104190056.305143-1-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
(cherry picked from commit ce848378b999214777fa984a8a0a3e3deb1cf687)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target/arm/sve_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 1afeadf9c8..521fc9b969 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5354,15 +5354,10 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
 #ifdef CONFIG_USER_ONLY
     flags = probe_access_flags(env, addr, access_type, mmu_idx, nofault,
                                &info->host, retaddr);
-    memset(&info->attrs, 0, sizeof(info->attrs));
-    /* Require both ANON and MTE; see allocation_tag_mem(). */
-    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
 #else
     CPUTLBEntryFull *full;
     flags = probe_access_full(env, addr, access_type, mmu_idx, nofault,
                               &info->host, &full, retaddr);
-    info->attrs = full->attrs;
-    info->tagged = full->pte_attrs == 0xf0;
 #endif
     info->flags = flags;
 
@@ -5371,6 +5366,15 @@ bool sve_probe_page(SVEHostPage *info, bool nofault, CPUARMState *env,
         return false;
     }
 
+#ifdef CONFIG_USER_ONLY
+    memset(&info->attrs, 0, sizeof(info->attrs));
+    /* Require both ANON and MTE; see allocation_tag_mem(). */
+    info->tagged = (flags & PAGE_ANON) && (flags & PAGE_MTE);
+#else
+    info->attrs = full->attrs;
+    info->tagged = full->pte_attrs == 0xf0;
+#endif
+
     /* Ensure that info->host[] is relative to addr, not addr + mem_off. */
     info->host -= mem_off;
     return true;
-- 
2.30.2


