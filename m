Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9A6D95E0
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 13:38:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNg3-0004h6-3k; Thu, 06 Apr 2023 07:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pkNfv-0004gY-AG
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:21:07 -0400
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pkNfs-0007tI-Iu
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:21:06 -0400
X-QQ-mid: bizesmtp68t1680780043txb4wgzv
Received: from ubuntu.. ( [111.196.129.125]) by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 06 Apr 2023 19:20:41 +0800 (CST)
X-QQ-SSF: 01200000000000D0F000000A0000000
X-QQ-FEAT: y8yRZXWSBv8XDu98VW9eqYuJ+tCFttGT70X3gcnHq7waThDDGlr+vyKCoPgZd
 q+JlQxiXi5c8vzPITXLE9SaNhfnvRWNjXf+DT8Fyi2/nijsp0C7rpW/m24+36WoPJ4XFrsZ
 PfSc3Oj1X7Nx8CZsHaO1dk133Fd25Hf0Sp0Zoy8vPeFj/fOLkv6IpYJRgYGyxNMlMQfOiDp
 2WhbboVAdPyEO+rzBZyWfM4CiKVaiS5Ydey5zTagtRgJwOZXYy96LaRvGdUZwVBBrmb4hmT
 MHLnqxMrHiZRrlQZOMQKR9AJTYl3Aqfch/mrVDeNG5vQnanSXAtgCmJSVrMPdTA2H/mQmN4
 emyBGpwctmqrU9yJik=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1490128918408474589
From: Bin Meng <bmeng@tinylab.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Cc: Zhangjin Wu <falcon@tinylab.org>
Subject: [PATCH] net: tap: Drop the close of fds for child process
Date: Thu,  6 Apr 2023 19:20:41 +0800
Message-Id: <20230406112041.798585-1-bmeng@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
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

Current codes using a brute-force traversal of all file descriptors
do not scale on a system where the maximum number of file descriptors
are set to a very large value (e.g.: in a Docker container of Manjaro
distribution it is set to 1073741816). QEMU just looks freezed during
start-up.

The close-on-exec flag was introduced since a faily old Linux kernel
(2.6.23). With recent newer kernels that QEMU supports, we don't need
to manually close the fds for child process as the proper O_CLOEXEC
flag should have been set properly on files that we don't want child
process to see.

Reported-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 net/tap.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/net/tap.c b/net/tap.c
index 1bf085d422..49e1915484 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -446,13 +446,6 @@ static void launch_script(const char *setup_script, const char *ifname,
         return;
     }
     if (pid == 0) {
-        int open_max = sysconf(_SC_OPEN_MAX), i;
-
-        for (i = 3; i < open_max; i++) {
-            if (i != fd) {
-                close(i);
-            }
-        }
         parg = args;
         *parg++ = (char *)setup_script;
         *parg++ = (char *)ifname;
@@ -536,17 +529,10 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
         return -1;
     }
     if (pid == 0) {
-        int open_max = sysconf(_SC_OPEN_MAX), i;
         char *fd_buf = NULL;
         char *br_buf = NULL;
         char *helper_cmd = NULL;
 
-        for (i = 3; i < open_max; i++) {
-            if (i != sv[1]) {
-                close(i);
-            }
-        }
-
         fd_buf = g_strdup_printf("%s%d", "--fd=", sv[1]);
 
         if (strrchr(helper, ' ') || strrchr(helper, '\t')) {
-- 
2.34.1


