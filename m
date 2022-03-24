Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4C4E6063
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:34:12 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIv5-0003c3-PS
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:34:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhm-0005wp-Us
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:27 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:52963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhk-0003P6-Nl
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MYedH-1ncZtN2BQB-00VkSn; Thu, 24
 Mar 2022 09:20:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 06/10] linux-user: Properly handle sigset arg to ppoll
Date: Thu, 24 Mar 2022 09:20:12 +0100
Message-Id: <20220324082016.3463521-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MQj22sMYeCS9DSnLGnftAziUQubUY1cVCcQYrGZ/TXFuChSRtpp
 MBqTNR7JVpT/DmGopMRWVlAOtLxQKeUwBUlIplTmo7cxhH9hL2aeTrXDkPngF/vQoZDQPz7
 dFtA7j9AOQ9Mj+2CJDiJKg8V2WQSVCjcZnKnij0UoimmIlvpOa5n4qSARTYdzFGBiKrmMEn
 PXWGmiQYq+Y/QRZ4WQNVw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ok2kemLSHks=:xJFPqQEB73fSWlGhuF1DmZ
 oRp29qwRfb2PFvt+8d4NsZzw1+4MdBHV5rb3Kp1/Y53L/a+DNdKpjTHSSUHqrbnX2DnupuNY8
 sgJ/8XzRSzU6ZaN9tPj7eO33sy1+94zM5Jf0D4tpmKwc3UirQNmaNp/AjIQdgJ6+OnjAIJyCr
 lPANd25mJL1cGIpiCuCPWru1ogcM3QiQYvNp8OPrCyB/tjKrvSh6edq1jzXYKCiKabTP0dYvJ
 Y4H/N/d92w9chuMfWH+090RZ7ICIWVSiwk4thYT7ClpvXYTKcAqUkbOMMASnbcA7KYkgTIq4X
 9P1boUDdfMdpQKqFT31UfjHujHTYqflAHOODWoaV3Q2N3xhm7y6IhmE9MTfpclw8JZWEjNMsg
 nxdvhY7mlDkRHIS8Hu9m9yRMvoeKgpz3j9FLJRHYbbxKLVMJhdGjqr2FWfv0cpKtOEDwMeWZC
 XBIoMAVu15xohtAga5hwPGbFAjXC6fRXdEpNsTEPNMrj01qv70X9atPiHiV/zxaCv3wezVsUE
 +aidZ9gwdQ8xCX1deD/5gA9ZUi2Ts04lsjCys3HZYZlFm8a3Czxh7XgAYcDJbEpcCFeHljWoX
 VLpzeVxUJ+tdIyGVLPyCiAzbpntVxIOxNJIfpgtWB0JpSajz0PKqCdSaTKK3oVvaF4wxStam+
 XCSHCQQR2ujYy6blO5kAo22SJixXhNUBkr+fwqlJ+D4u6Bz57tlConu50sUOYsUdGjWk=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Unblocked signals are never delivered, because we
didn't record the new mask for process_pending_signals.
Handle this with the same mechanism as sigsuspend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220315084308.433109-6-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 67af40deac07..f65045efe6a2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1519,8 +1519,7 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
     }
     if (ppoll) {
         struct timespec _timeout_ts, *timeout_ts = &_timeout_ts;
-        target_sigset_t *target_set;
-        sigset_t _set, *set = &_set;
+        sigset_t *set = NULL;
 
         if (arg3) {
             if (time64) {
@@ -1539,25 +1538,19 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
         }
 
         if (arg4) {
-            if (arg5 != sizeof(target_sigset_t)) {
-                unlock_user(target_pfd, arg1, 0);
-                return -TARGET_EINVAL;
-            }
-
-            target_set = lock_user(VERIFY_READ, arg4,
-                                   sizeof(target_sigset_t), 1);
-            if (!target_set) {
+            ret = process_sigsuspend_mask(&set, arg4, arg5);
+            if (ret != 0) {
                 unlock_user(target_pfd, arg1, 0);
-                return -TARGET_EFAULT;
+                return ret;
             }
-            target_to_host_sigset(set, target_set);
-        } else {
-            set = NULL;
         }
 
         ret = get_errno(safe_ppoll(pfd, nfds, timeout_ts,
                                    set, SIGSET_T_SIZE));
 
+        if (set) {
+            finish_sigsuspend_mask(ret);
+        }
         if (!is_error(ret) && arg3) {
             if (time64) {
                 if (host_to_target_timespec64(arg3, timeout_ts)) {
@@ -1569,9 +1562,6 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
                 }
             }
         }
-        if (arg4) {
-            unlock_user(target_set, arg4, 0);
-        }
     } else {
           struct timespec ts, *pts;
 
-- 
2.35.1


