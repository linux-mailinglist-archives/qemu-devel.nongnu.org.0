Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834F26472C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 15:44:45 +0200 (CEST)
Received: from localhost ([::1]:50410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGMsW-00052Z-7o
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 09:44:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mingli.Yu@windriver.com>)
 id 1kGCYX-0003af-4f
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 22:43:25 -0400
Received: from mail5.windriver.com ([192.103.53.11]:52382 helo=mail5.wrs.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Mingli.Yu@windriver.com>)
 id 1kGCYU-0005pq-52
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 22:43:24 -0400
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
 [147.11.189.40])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08A2gaZj008399
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <qemu-devel@nongnu.org>; Wed, 9 Sep 2020 19:43:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Sep 2020 19:42:42 -0700
From: <mingli.yu@windriver.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] lockable.h: always define unknown_lock_type
Date: Thu, 10 Sep 2020 10:36:35 +0800
Message-ID: <20200910023635.3677276-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=192.103.53.11;
 envelope-from=Mingli.Yu@windriver.com; helo=mail5.wrs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 22:43:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Sep 2020 09:42:38 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mingli Yu <mingli.yu@windriver.com>

There comes below build failure when use gcc 10.1.0 and
"-Og" passed to compiler.
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:25: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o: in function `fsdev_co_throttle_request':
 | /mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: undefined reference to `unknown_lock_type'
 | /usr/lib/gcc/x86_64-wrs-linux/10.1.0/../../../../x86_64-wrs-linux/bin/ld.bfd: ../fsdev/qemu-fsdev-throttle.o:/mnt/build/tmp/work/x86_64-linux/qemu-system-native/5.1.0-r0/qemu-5.1.0/fsdev/qemu-fsdev-throttle.c:103: more undefined references to `unknown_lock_type' follow
 | collect2: error: ld returned 1 exit status

So always define unknown_lock_type to fix the above error.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 include/qemu/lockable.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
index b620023141..e792ed9a69 100644
--- a/include/qemu/lockable.h
+++ b/include/qemu/lockable.h
@@ -25,17 +25,12 @@ struct QemuLockable {
 };
 
 /* This function gives an error if an invalid, non-NULL pointer type is passed
- * to QEMU_MAKE_LOCKABLE.  For optimized builds, we can rely on dead-code elimination
- * from the compiler, and give the errors already at link time.
+ * to QEMU_MAKE_LOCKABLE.
  */
-#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
-void unknown_lock_type(void *);
-#else
 static inline void unknown_lock_type(void *unused)
 {
     abort();
 }
-#endif
 
 static inline __attribute__((__always_inline__)) QemuLockable *
 qemu_make_lockable(void *x, QemuLockable *lockable)
-- 
2.26.2


