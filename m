Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50EC3AE7EF
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:10:56 +0200 (CEST)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHpP-0008G9-QC
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:10:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjb-0002rd-0F
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:55 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lvHjW-0003v3-Rj
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:04:54 -0400
Received: from quad ([82.142.1.74]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N6Kl7-1lBOFl1aIL-016eQu; Mon, 21
 Jun 2021 13:04:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] linux-user: Implement pivot_root
Date: Mon, 21 Jun 2021 13:04:40 +0200
Message-Id: <20210621110445.231771-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621110445.231771-1-laurent@vivier.eu>
References: <20210621110445.231771-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A6OmCCPgeL2iVyeCA9xuR1w4+28en8+oAcT5AMgj3Sci6Pm/911
 CZE1vx7GBgfKOfrZL6DP7Tcx//qV+9bjAkaNItfBKI/zV150Y8pef773H0dD2nMOh675zB6
 mZuvCNQyo5Y+tJkIbSLc4wYClKpcTPpEwcbJLTRKPwIZrG4X25VzySnMBd8fT+rj4XkQN9X
 yA25MjkxWjqi3EP8FHmEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k4AAAw9JQXg=:NbfgqK2VoSBXRt4Pep7SWG
 wRPWv7ukQNxiw2ZvNeEb/+4nxlestkfNYre13wlmJo7OqRJXT5N7uVZlqXLWAPK7LfBWKMYoB
 VzLJFLM016l9oM59wKrbbFZBFDXfmftahFTqcwD16TjcvAnjd/w1NZAfbsrY+8OlmbQho68NT
 USvAy05JU6JlwRosbXacRkEn1W5eEoI5nT9Y+39dZ3SvKjYeMHj2ppFyHa0hcBc/uKHEy+xj/
 nijyERf44ro06wjq9+7dhkj2E6djLMU08aRRZLIhn3Tmqfv89MYHBKQexgvOrzje9FzeaH97m
 A8wnSUMTjcE9Kpi22ZDhItiss2j0lxZmh1e7ECRAVHAOLsj7H3HKlWh6/ZQJx4Z8xNzUCccTH
 p3XnCJ/ukR71uki1fhxCCeDDqf6ll0STIJCeBw57IQsRXtrTe6YOArqIaL0XREcYEnJkEZxPM
 fot+Z/RXAR1jTD5UPcG6docSR7nkvA4cBz76NAHSZm2p9k+hu9cpllrL7pGB369dzaC8bkd9I
 HsNMfJVHYJGjo5YwKM6vvQ=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 YAMAMOTO Takashi <yamamoto@midokura.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: YAMAMOTO Takashi <yamamoto@midokura.com>

Used by runc.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210531055019.10149-6-yamamoto@midokura.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 54037db8d66d..723cb02d2a00 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8257,6 +8257,10 @@ static int host_to_target_cpu_mask(const unsigned long *host_mask,
     return 0;
 }
 
+#if defined(TARGET_NR_pivot_root) && defined(__NR_pivot_root)
+_syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
+#endif
+
 /* This is an internal helper for do_syscall so that it is easier
  * to have a single return point, so that actions, such as logging
  * of syscall results, can be performed.
@@ -13220,6 +13224,23 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         return ret;
 #endif
 
+#if defined(TARGET_NR_pivot_root)
+    case TARGET_NR_pivot_root:
+        {
+            void *p2;
+            p = lock_user_string(arg1); /* new_root */
+            p2 = lock_user_string(arg2); /* put_old */
+            if (!p || !p2) {
+                ret = -TARGET_EFAULT;
+            } else {
+                ret = get_errno(pivot_root(p, p2));
+            }
+            unlock_user(p2, arg2, 0);
+            unlock_user(p, arg1, 0);
+        }
+        return ret;
+#endif
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         return -TARGET_ENOSYS;
-- 
2.31.1


