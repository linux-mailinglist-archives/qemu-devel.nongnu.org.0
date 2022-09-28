Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F025EE73D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 23:03:49 +0200 (CEST)
Received: from localhost ([::1]:38196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odeDc-0004TT-Q9
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 17:03:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddex-0000AV-0c
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:59 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:37825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddev-0006U6-Bf
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1McXs5-1pE3wC43dl-00d2Qx; Wed, 28
 Sep 2022 22:27:54 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 21/37] linux-user/hppa: Drop stack guard page on hppa target
Date: Wed, 28 Sep 2022 22:27:21 +0200
Message-Id: <20220928202737.793171-22-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5Y3lpqbSBbvfU+KgElufzVsDShBRX8RapRIfmeRnhhiK37PALjY
 Y2ruyLjSmUIF4tlt8QXWuB8xjaLZPRToJWNOIyItf5jk/P2rPsHkFAJfWClO0b9Wv9AlJ6Z
 O6iXSEa9lyIgfOFLoyQ3casHcdc+AyXpKtJOhV4r3PMG6TEFQshExWdM8/H9kANER2XiW9I
 SQYT6ZtCC4hRVbbsqWUmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1XursJTPiaM=:EDL0VUUdli0iRHD6j8LkH6
 z6/qxH5gugHIA8LTD8RH+ghp8ycWWAAqfMGsA6sdpConVYyJ7qsBR1XVqbCH8/iZqq10YzInH
 xCZrHOAtQCjygUKiSzS19FIjcwIh1lTVC9PnAhmodai6jzKyPd4Uol4vxcdK6rYe9LiLOI3sj
 8tm+p2shOaoiaFiMwIdNqKDpylLYuFlazmaKedGlb+HnU5OGmflwxlXyECccN28a9j1yT5YJB
 PJ5Fy4CxbOOLcT57rheg2sITr+Wo1gIRR8Zrz6tzlmF3b1UikSKNVhXkcF3GP7ZgX7j4BOsbV
 Z12ztklmiyGoD63dpJ1BBNq+v6Sj6FZGxEETGM+zXszOlRjXkOQW4FgMpU1lofRpnehp3quqG
 Wt2XxqVz9+bwtTkVXMhPuM4yLeJb6G60IguNvpU79pwtCFzSDZZMHZZr9IETW8gFVp7AjhiHr
 NDGH7E4lcpKyDNbUFDsGRmh834Zf6G55BXlu1bG83RmNIHL9XND7KFE+qb0kqjBsZZ2d0SB34
 SW6qwuQoJ+GO8eLnYUAVopQQlQJkQgy/0OoMPsJHZE6jxWlhzENbdKsvSHwbx4ly9kgEs8cA9
 h+aza4wgJUmCwGHC/nEnNJZHuqLZKKPGGWWjPHwOw0zHpvG48RwtC1uGfWON2HkPnQQnHqKhw
 +rE+iIqRUy9QEEvlVD/oQWCPkT39K0tXzfCAz+c0eozOXoubcHhywKDV/KxHDfD5JGJKmpgDt
 596W42t1R92HGCo60/egNZ7gIIy4vYM8qVALriVT3Dnd78PqXknBFa9UP7oWS64okDtAKg8mh
 Zrt45g6
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

From: Helge Deller <deller@gmx.de>

The stack-overflow check when building the "grep" debian package fails
on the debian hppa target. Reason is, that the guard page at the top
of the stack (which is added by qemu) prevents the fault handler in the
grep program to properly detect the stack overflow.

The Linux kernel on a physical machine doesn't install a guard page
either, so drop it and as such fix the build of "grep".

Signed-off-by: Helge Deller <deller@gmx.de>
Message-Id: <20220924114501.21767-5-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/elfload.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ba5c4c02e591..c7e3f1d47c16 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2096,9 +2096,15 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
     if (size < STACK_LOWER_LIMIT) {
         size = STACK_LOWER_LIMIT;
     }
-    guard = TARGET_PAGE_SIZE;
-    if (guard < qemu_real_host_page_size()) {
-        guard = qemu_real_host_page_size();
+
+    if (STACK_GROWS_DOWN) {
+        guard = TARGET_PAGE_SIZE;
+        if (guard < qemu_real_host_page_size()) {
+            guard = qemu_real_host_page_size();
+        }
+    } else {
+        /* no guard page for hppa target where stack grows upwards. */
+        guard = 0;
     }
 
     prot = PROT_READ | PROT_WRITE;
@@ -2118,7 +2124,6 @@ static abi_ulong setup_arg_pages(struct linux_binprm *bprm,
         info->stack_limit = error + guard;
         return info->stack_limit + size - sizeof(void *);
     } else {
-        target_mprotect(error + size, guard, PROT_NONE);
         info->stack_limit = error + size;
         return error;
     }
-- 
2.37.3


