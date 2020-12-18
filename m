Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219692DE0F9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:28:02 +0100 (CET)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCzR-0008CM-3n
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvr-0002uI-Pa
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:19 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvo-00073l-NU
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:19 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MJm8N-1kWlAV1pQv-00KBET; Fri, 18 Dec 2020 11:24:14 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 09/14] linux-user: Implement copy_file_range
Date: Fri, 18 Dec 2020 11:24:02 +0100
Message-Id: <20201218102407.597566-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218102407.597566-1-laurent@vivier.eu>
References: <20201218102407.597566-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:M7Y6VUsinl5UsHCnR+fuTEkSA7HvYYIgUxOhWm5zrMN5cZJXslU
 +i6WKlAPfHaZmbKxtgpDv8Qfm6iqHTSsgW1A+oml+i+AUrweEcHXyUVzM5pSzgfv1wTWs7i
 ydoVs2OnIQBnYEhXixqTFazpj5tfYE9SDs0iqvkCwhPZebjV371aGeLfSD4OWHMek3Isr6W
 zTnP8c5KhCWPj3plEQF+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PDyM3IT3CiE=:HJV2/vpQnxJs2IaCyVVodN
 +DqOsyxC8MVOggPrIeiVZJqvm/H1CfarWIIbxvxZvaxY+0yUJ0t2vnU8ecAjAf529nJMFvI4I
 pOVnFGIEgtU6sth+9d26FxrmhxXLyorv6SJZn+GX6uAZCDPoEM5pfawIwJIXvpZjWDvDrbied
 gS/SuGHKaAIZ8ewjzztUnPcWQQs6VmFicyjJ+elaUKRKZO0frV2S5Iree4unFwPx4aiRlwAwS
 SIovupTxY9x7vSzGnl99bAaabWmQf4PgkshD3ZtxTCR3IZ2sSK2i56wfkb2cpEEvlIcpyABtf
 KSbP9RA0XKmD1WXb/1/Eq4y8SccFSOtMRCBaVEOkL0Dcy5ZFnzj7p7a8qB0UPA6T0inwyHgoc
 usfX5CJ5+RgleIVKp9wPxrxz8NUQcl3yTfdvfA3fWURIRxI7Dsp4rDHxgi0dN
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andreas Schwab <schwab@suse.de>

Signed-off-by: Andreas Schwab <schwab@suse.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <mvm361eer3n.fsf@suse.de>
[lv: copy back offset only if there is no error]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7bf99beb1814..6091a449fbf0 100644
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
@@ -13065,6 +13071,42 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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
+            if (!is_error(ret) && ret > 0) {
+                if (arg2) {
+                    if (put_user_u64(inoff, arg2)) {
+                        return -TARGET_EFAULT;
+                    }
+                }
+                if (arg4) {
+                    if (put_user_u64(outoff, arg4)) {
+                        return -TARGET_EFAULT;
+                    }
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
2.29.2


