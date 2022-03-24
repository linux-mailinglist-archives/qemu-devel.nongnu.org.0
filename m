Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E044F4E6054
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 09:28:57 +0100 (CET)
Received: from localhost ([::1]:41090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXIq0-00066h-Tt
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 04:28:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhm-0005wo-UL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:27 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXIhk-0003Ov-D5
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 04:20:26 -0400
Received: from quad ([82.142.12.150]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MTi9N-1nd6WR0H8v-00U5V1; Thu, 24
 Mar 2022 09:20:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/10] linux-user: Properly handle sigset arg to epoll_pwait
Date: Thu, 24 Mar 2022 09:20:11 +0100
Message-Id: <20220324082016.3463521-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324082016.3463521-1-laurent@vivier.eu>
References: <20220324082016.3463521-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:v2D7+tvf13oh60xk8WP5a54Aq2Ag0XesnjnpCQnlE84OKqPPW2P
 Z9oOu5HCdhO33syVBaDqaiLIEPt6tvxefn75XXxfp2uvQm5DjYb7UBwJt4o4H6Qi7hnzGHh
 RUJlpHP1zhH/YUF5zV3mv+turQpE4kHov+wjQbFQoXKjRCjHoIftsgb8nDLYaqxoSgqeVNc
 ryBGzUWWilo2FfMbFoPxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2mnjocTbFFw=:JdZptCg3aeanSe9c6vNYX8
 oj2PXYKQ997yF4dVBzFauOnSxL4enzx1zjIQM/vNq8y7uVO+Fl1CllTaXJdMf62yZdD8Dx44S
 Uzzklkd/9m5l6fnZVhYbv/i3KAz7VV1xJIzrGNGfDd4P6tvkU8ofHq3zhV9/APM2dDPayUfr2
 bLVmwEJ+Sf8EbGZVXDFHq1Ucil3gXcvGFN01vE82y+PjonK5xgj4hUog5mtuLDuKddg+Dsgl8
 QReoVM4ECc5N2HHZpVQt7z/CEGY3KFESXDGx3LNXBY6h5fpZ8Vr9hoNkFXoloM1PDtFHxTYr4
 cDQihkO6hyJgYF5ip099OQJ6h1anwgdPKlhiu4JoTImwFHrrdyMeidauU4WFevaKij4FePk5L
 kaEePSXhoKTQqpZZWrAwRlxzqpJG4WKwSk5c1aqd5q98u5HqDD7pqg//VsB88TAuYi+F2ADyE
 iS1WaYZoZAVO6KQTbvpHy3h/S5e0ZY/qvlTf7AgH5PUReja0c/kPpMGvjEX3spNaB8gPKOVY0
 nzzpqr7IrwyvMbEDY6PPScFhA3R0/9ZIPUdfpKd+RJV9WcPaYpsh9pIvLGaJPEToBXsPKiIVf
 wR31wfqm9pp9LesExumhCzapIlzm+b14+K4B8LGd1Ah8KN0bVn7fcp9i7Y8r50vG7taMF26fS
 yVptMAjTomlvnrQI6QG1E73Urei+/hv2E8LTxlA9TgIjwIJ3ntlF2dIrf8bWbIJDi134=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220315084308.433109-5-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ffd4cefc8b7a..67af40deac07 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12694,29 +12694,21 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
 #if defined(TARGET_NR_epoll_pwait)
         case TARGET_NR_epoll_pwait:
         {
-            target_sigset_t *target_set;
-            sigset_t _set, *set = &_set;
+            sigset_t *set = NULL;
 
             if (arg5) {
-                if (arg6 != sizeof(target_sigset_t)) {
-                    ret = -TARGET_EINVAL;
-                    break;
-                }
-
-                target_set = lock_user(VERIFY_READ, arg5,
-                                       sizeof(target_sigset_t), 1);
-                if (!target_set) {
-                    ret = -TARGET_EFAULT;
+                ret = process_sigsuspend_mask(&set, arg5, arg6);
+                if (ret != 0) {
                     break;
                 }
-                target_to_host_sigset(set, target_set);
-                unlock_user(target_set, arg5, 0);
-            } else {
-                set = NULL;
             }
 
             ret = get_errno(safe_epoll_pwait(epfd, ep, maxevents, timeout,
                                              set, SIGSET_T_SIZE));
+
+            if (set) {
+                finish_sigsuspend_mask(ret);
+            }
             break;
         }
 #endif
-- 
2.35.1


