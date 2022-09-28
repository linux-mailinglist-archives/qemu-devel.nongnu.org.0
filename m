Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2615EDA53
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 12:45:12 +0200 (CEST)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odUYx-00005V-11
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 06:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEL-0008FB-LE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:52 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odSEB-0008DW-9H
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:15:40 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MysBI-1pQcdi1kPK-00vxKq; Wed, 28
 Sep 2022 10:15:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jon Alduan <jon.alduan@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 26/38] linux-user: Don't assume 0 is not a valid host timer_t
 value
Date: Wed, 28 Sep 2022 10:15:05 +0200
Message-Id: <20220928081517.734954-27-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
References: <20220928081517.734954-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Tu/uklV94njT6bMi4+dmALEcFTu6CJq4x+cZNxI9FMT0RZ4r46k
 rPq2QIgpiy/CprG3R4Dc3e7s4a9tc4k01LyI1WWZ+WPIAIJunFwgJmizwG4JI1de8DJ4m0R
 7CJ0pgt9FZi0gYj+c3ZGglgye5ovz2++1SGm/xnEINsJ43HQgtR3BvaXTFMIXm8fKSzcJh8
 gp4NiOMwLW8gvqT/+dcBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:B7Ln73FCUJg=:UquRtFbzNcH084GCd/yZU9
 ONL5HeM86e1zfUzQfWq16QrYhoxrp5CyCyOR21rINTY5PH/3Z3yRQp45CJU6tmfcdqu7zEqLt
 PVtf2ufvRZ4dD8Y043lwMBFYFTgs2gRSWlnFSW9yjRQbglWyrxiFsZa+TOAUAGQeGUUZMvQdd
 TrgMDIFu8z4AeRd6Kfh/EzA7BQr5sJ3zgBqn765kbFVhL4hai4clEhj85GGChqabnxSeB5E6U
 4HAACsGLzIyaizx5pL7bhc4pVqayRQKfnodzBbEKBuThu1qsYlQ+O7v6cTc+7Ll+0Jgx4mGEr
 3nus7L5pzwzEj/153jjsVjXRD4abkr2Tslz3Q45kcRn+7MLTTseUm+eHEUQbu/Vz+GxZkZ1PS
 kB1ov6G2E/oNif4tnctcFWxlf3dbs1qZa2Ec5wZs2FFKE2SQlDzlLgRbrgpaoYVEH6ieacgYF
 BZb9HFhLxWLBTPfJUpYrq0EmcQzZkVqKvD1m1ds3IiifEsxLpTTgkshLNX/IijIjAA6vxs2cV
 0Ps7GoJH4Mv9hsSHwEDUYMVlHc0u27nvfUfKWRR8ExyUuVno7PpxMqZDRAW4OjiXpT6E3EIz9
 y3eiFtokEroB/CzS/eIdtRtM13Hh4Sp379Ran2uvaKTXfXh26+qNbtqTJ+sPPMoAEzFIiLPd0
 +MpzMgyM9b5PEbiR4HCymDNzmqjVYBhmFJXspoV7yJQbx79K9US88PF4Z1k5KRInp5pARPwmN
 K/1TPcBOLqgdL1duOP7Pa8gL+ybiRDC0ueTxe+TLbG984ZeH/PRgArUPBQ8b+F7MtXAWw/ZSQ
 fpJRgyy
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Peter Maydell <peter.maydell@linaro.org>

For handling guest POSIX timers, we currently use an array
g_posix_timers[], whose entries are a host timer_t value, or 0 for
"this slot is unused".  When the guest calls the timer_create syscall
we look through the array for a slot containing 0, and use that for
the new timer.

This scheme assumes that host timer_t values can never be zero.  This
is unfortunately not a valid assumption -- for some host libc
versions, timer_t values are simply indexes starting at 0.  When
using this kind of host libc, the effect is that the first and second
timers end up sharing a slot, and so when the guest tries to operate
on the first timer it changes the second timer instead.

Rework the timer allocation code, so that:
 * the 'slot in use' indication uses a separate array from the
   host timer_t array
 * we grab the free slot atomically, to avoid races when multiple
   threads call timer_create simultaneously
 * releasing an allocated slot is abstracted out into a new
   free_host_timer_slot() function called in the correct places

This fixes:
 * problems on hosts where timer_t 0 is valid
 * the FIXME in next_free_host_timer() about locking
 * bugs in the error paths in timer_create where we forgot to release
   the slot we grabbed, or forgot to free the host timer

Reported-by: Jon Alduan <jon.alduan@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220725110035.1273441-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 54b29f3b406a..e0e0f058121f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -525,20 +525,25 @@ _syscall4(int, sys_prlimit64, pid_t, pid, int, resource,
 
 #if defined(TARGET_NR_timer_create)
 /* Maximum of 32 active POSIX timers allowed at any one time. */
-static timer_t g_posix_timers[32] = { 0, } ;
+#define GUEST_TIMER_MAX 32
+static timer_t g_posix_timers[GUEST_TIMER_MAX];
+static int g_posix_timer_allocated[GUEST_TIMER_MAX];
 
 static inline int next_free_host_timer(void)
 {
-    int k ;
-    /* FIXME: Does finding the next free slot require a lock? */
-    for (k = 0; k < ARRAY_SIZE(g_posix_timers); k++) {
-        if (g_posix_timers[k] == 0) {
-            g_posix_timers[k] = (timer_t) 1;
+    int k;
+    for (k = 0; k < ARRAY_SIZE(g_posix_timer_allocated); k++) {
+        if (qatomic_xchg(g_posix_timer_allocated + k, 1) == 0) {
             return k;
         }
     }
     return -1;
 }
+
+static inline void free_host_timer_slot(int id)
+{
+    qatomic_store_release(g_posix_timer_allocated + id, 0);
+}
 #endif
 
 static inline int host_to_target_errno(int host_errno)
@@ -12896,15 +12901,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                 phost_sevp = &host_sevp;
                 ret = target_to_host_sigevent(phost_sevp, arg2);
                 if (ret != 0) {
+                    free_host_timer_slot(timer_index);
                     return ret;
                 }
             }
 
             ret = get_errno(timer_create(clkid, phost_sevp, phtimer));
             if (ret) {
-                phtimer = NULL;
+                free_host_timer_slot(timer_index);
             } else {
                 if (put_user(TIMER_MAGIC | timer_index, arg3, target_timer_t)) {
+                    timer_delete(*phtimer);
+                    free_host_timer_slot(timer_index);
                     return -TARGET_EFAULT;
                 }
             }
@@ -13040,7 +13048,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
         } else {
             timer_t htimer = g_posix_timers[timerid];
             ret = get_errno(timer_delete(htimer));
-            g_posix_timers[timerid] = 0;
+            free_host_timer_slot(timerid);
         }
         return ret;
     }
-- 
2.37.3


