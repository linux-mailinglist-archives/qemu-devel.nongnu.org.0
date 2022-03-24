Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D74E6064
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:34:14 +0100 (CET)
Received: from localhost ([::1]:49664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIv7-0003fe-LL
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:34:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhm-0005wn-V1
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:27 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:54823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhk-0003On-Bm
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MEVJq-1nIQc32Yuo-00G0tU; Thu, 24
 Mar 2022 09:20:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] linux-user: Properly handle sigset arg to pselect
Date: Thu, 24 Mar 2022 09:20:10 +0100
Message-Id: <20220324082016.3463521-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bfJ3jrAxtj2L4It4OZ/JdzQGDXMGqrZYZOJ9DbZJkKRuPxDZgVo
 5q0HsXVLAYHGZb24Zaumk/+GVjS8LRZxNv3d8sPSQck5QYdT8BcBwDaw+prLDMrf5zooBlk
 OKkzN2vhbonA4vDZxRW/kr3jld30s4bLgWY5JyzdaH3V6GI7Flt7witUp7/kcthobYaYXCW
 6ja4doaNCJWAHJENaAwIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sJYDj1PbD/c=:aZVY0KofkaVghyr4xM3rHy
 dnAMZgXmoNDlXzMDioxhJ8St2vKkZ7ctrZKU4BUDCXhg3j/U+71RmPHkInqTKFplJx6FyMa5U
 QoP9NF8ZUNJ9YIkupeWWhE8NHmudShn6KM2+2rI2l/uqC+k6QUQpsEGPW2rujQNvlakxYB9HE
 r4WGwRP5ZqUdApCUilxNLTM30U8wR9H5coLpMwUSJxht1C4daIqY4XiKE7wFf/u9ytsMi2YrE
 69UzjrnTWrHaSMWtn7tnFbpTt4CPPM414dQjPXNnTHzFUKGOLimrVz3PCxrCrGmjmlcpeSu0y
 ebDNk8fQN9xx6TM3pWzfTTZbTW6hgq0XF8cXHqI/dmEmUQkNRq2vIWfSf6rUSS8SBNK2XU5yd
 Sb1HL9K+uELhOy8s9lWhO5Ddw5D/7cNm8pW7TwyAJ4Kel1/v0FdLCl5m5WvPS8CsMr7a7OJG1
 sWR4CdfLn/GhtlS456HysWAO0cLvZn1yGcEgcrnTvJXj+s3JO+GtzbradjDOIToLhdjQ922lo
 A9/edBmU2MF/XE5rWbpuHoyl56SFoZh9wE0p069gAZilac2FklspUzUlPQP57Jgsx8+OmRu+P
 MTDeba03AwJEUIQesnc6QSa+lBX+uMQjXSh/Ygtlxs5cDkiPogKxlb4Yhh1jSlnBlioXqN8L0
 kWvwu730FM2YwcCq00wdSwnxDvYz+/zLJoW91zn3JZENq/Fg5hADWqZD4VK1L1uLpRGQ=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Unblocked signals are never delivered, because we
didn't record the new mask for process_pending_signals.
Handle this with the same mechanism as sigsuspend.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/834
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220315084308.433109-4-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d9b5662ff820..ffd4cefc8b7a 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1391,14 +1391,12 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
      * The 6th arg is actually two args smashed together,
      * so we cannot use the C library.
      */
-    sigset_t set;
     struct {
         sigset_t *set;
         size_t size;
     } sig, *sig_ptr;
 
     abi_ulong arg_sigset, arg_sigsize, *arg7;
-    target_sigset_t *target_sigset;
 
     n = arg1;
     rfd_addr = arg2;
@@ -1439,10 +1437,8 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
     }
 
     /* Extract the two packed args for the sigset */
+    sig_ptr = NULL;
     if (arg6) {
-        sig_ptr = &sig;
-        sig.size = SIGSET_T_SIZE;
-
         arg7 = lock_user(VERIFY_READ, arg6, sizeof(*arg7) * 2, 1);
         if (!arg7) {
             return -TARGET_EFAULT;
@@ -1452,28 +1448,22 @@ static abi_long do_pselect6(abi_long arg1, abi_long arg2, abi_long arg3,
         unlock_user(arg7, arg6, 0);
 
         if (arg_sigset) {
-            sig.set = &set;
-            if (arg_sigsize != sizeof(*target_sigset)) {
-                /* Like the kernel, we enforce correct size sigsets */
-                return -TARGET_EINVAL;
-            }
-            target_sigset = lock_user(VERIFY_READ, arg_sigset,
-                                      sizeof(*target_sigset), 1);
-            if (!target_sigset) {
-                return -TARGET_EFAULT;
+            ret = process_sigsuspend_mask(&sig.set, arg_sigset, arg_sigsize);
+            if (ret != 0) {
+                return ret;
             }
-            target_to_host_sigset(&set, target_sigset);
-            unlock_user(target_sigset, arg_sigset, 0);
-        } else {
-            sig.set = NULL;
+            sig_ptr = &sig;
+            sig.size = SIGSET_T_SIZE;
         }
-    } else {
-        sig_ptr = NULL;
     }
 
     ret = get_errno(safe_pselect6(n, rfds_ptr, wfds_ptr, efds_ptr,
                                   ts_ptr, sig_ptr));
 
+    if (sig_ptr) {
+        finish_sigsuspend_mask(ret);
+    }
+
     if (!is_error(ret)) {
         if (rfd_addr && copy_to_user_fdset(rfd_addr, &rfds, n)) {
             return -TARGET_EFAULT;
-- 
2.35.1


