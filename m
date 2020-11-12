Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC82B043C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 12:47:03 +0100 (CET)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdB49-0004zX-T6
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 06:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1kdB2W-000497-VK
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:45:21 -0500
Received: from mx2.suse.de ([195.135.220.15]:49304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schwab@suse.de>) id 1kdB2V-0007sE-AL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 06:45:20 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A581ACE0
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 11:45:16 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: Implement copy_file_range
X-Yow: ..  or were you driving the PONTIAC that HONKED at me
 in MIAMI last Tuesday?
Date: Thu, 12 Nov 2020 12:45:16 +0100
Message-ID: <mvm361eer3n.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=195.135.220.15; envelope-from=schwab@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 06:19:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 linux-user/syscall.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 3160a9ba06..c3373af4c7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -813,6 +813,12 @@ safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
 safe_syscall5(int, mq_timedreceive, int, mqdes, char *, msg_ptr,
               size_t, len, unsigned *, prio, const struct timespec *, timeout)
 #endif
+#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
+safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
+              int, outfd, loff_t *, poutoff, size_t, length,
+              unsigned int, flags)
+#endif
+
 /* We do ioctl like this rather than via safe_syscall3 to preserve the
  * "third argument might be integer or pointer or not present" behaviour of
  * the libc function.
@@ -13057,6 +13063,40 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return get_errno(membarrier(arg1, arg2));
 #endif
 
+#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
+    case TARGET_NR_copy_file_range:
+        {
+            loff_t inoff, outoff;
+            loff_t *pinoff = NULL, *poutoff = NULL;
+
+            if (arg2) {
+                if (get_user_u64(inoff, arg2)) {
+                    return -TARGET_EFAULT;
+                }
+                pinoff = &inoff;
+            }
+            if (arg4) {
+                if (get_user_u64(outoff, arg4)) {
+                    return -TARGET_EFAULT;
+                }
+                poutoff = &outoff;
+            }
+            ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
+                                                 arg5, arg6));
+            if (arg2) {
+                if (put_user_u64(inoff, arg2)) {
+                    return -TARGET_EFAULT;
+                }
+            }
+            if (arg4) {
+                if (put_user_u64(outoff, arg4)) {
+                    return -TARGET_EFAULT;
+                }
+            }
+        }
+        return ret;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
-- 
2.29.0


-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

