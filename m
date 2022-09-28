Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893A5EDB04
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 13:02:52 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUq3-0007Ot-Hf
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 07:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE9-0008Ao-NQ
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:33 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSE7-0008BS-0o
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:32 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N95qT-1pH2OA30XH-0169Tk; Wed, 28
 Sep 2022 10:15:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 14/38] linux-user: Fix madvise(MADV_DONTNEED) on alpha
Date: Wed, 28 Sep 2022 10:14:53 +0200
Message-Id: <20220928081517.734954-15-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:YJ2Fz7ylUNUSpktpFd2hCRX88lJktvIAzWgwH94sVjTR5aQDtC1
 I7WcOXbE+YbznAjZKKipe/K7cp8nqvX3jHaVixyhRSeiHY083wnsFdHecB9tRfMs/1RuYhB
 3ov337uyBwfKhCFpqHJLaeu57skhgImp3EKMioE1XmbqaIoSmgggCnDtjjg1697swqWvFgX
 94jG6YNvQi4+8X72vli4g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:avgZ+ZqByG4=:6Phr5hOuEiufSsQRuQubvA
 UUz6QIolkuQa4qzz7CzMBgaoK2jHiHUs18c6SU0bzvhjlNMfnHXnZ+x2GOI3asHOfWkzm35jl
 tLbsFrkpYYI+RcP+twttZ8KbzLehr4VzHKSVtOiLdkriAqYNWYrhDaZ2pl6O6JBBfpizOqCJI
 8w+vvQzPdp1eJAGRAOTb9ahWkMNEEa629vXKudBBWeIycX75aQDgoY19uAg6XNkc3KxZfPJLK
 lRT22NI7k7y/3oiDoZTMt8HJKQWIDu71wMVsFFi+Ilq644r7OMbtvsgSAtoFy6eCZwUHa/WZu
 2PZQGhXjtcVsiSTFjHN0qdxXM9mPfQxGxE6cqHc1PwJeVj6arIQStwCJBNTVw+0xiluLqtivW
 7T1L/xyDcm5pESKhMkVBz49uVCbCJTforTplZlO2QjagdXIPM4LDrIyh+6Hi/2W7lI19lqtRJ
 RpXdI5Y2ROXkxM1FHHMdtNmA5c3Tt9a3jU9Qa0OgXAhwdKRoGzi6wzI1VeId8sOAPSZBUDNC6
 5Kn1V7wHxHphYBL64Zc1UFnuSQ5xoE/vEqDA7kEvwne0Dd/ybXAD3ORgOAbFJP8DQdCHaqy8O
 ma2ro+vudO8ZCH9Rct5jigLHlMAIgMllCn4zZE6OwMVpL7jA5HBbTT9joinRPCUwXz0oXoPiE
 YWqPv/jydnLy06FOge7P04oHkqonfae7waDd8WtKyEO8NK9zlL8kr/XKI11mcCBcy0hrdLdXR
 Te950xnxv/QiZeTOnim8/EEirOrGeZGmVH+Ft6RD6TSBVmaqO3njWKM/WkUwFqQNcZoysT6om
 ozL9hBc
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

MADV_DONTNEED has a different value on alpha, compared to all the other
architectures. Fix by using TARGET_MADV_DONTNEED instead of
MADV_DONTNEED.

Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220906000839.1672934-3-iii@linux.ibm.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 83fdae7034ea..942bec7e8528 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "user-mmap.h"
+#include "target_mman.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
@@ -897,7 +898,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * anonymous mappings. In this case passthrough is safe, so do it.
      */
     mmap_lock();
-    if (advice == MADV_DONTNEED &&
+    if (advice == TARGET_MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
         if (ret == 0) {
-- 
2.37.3


