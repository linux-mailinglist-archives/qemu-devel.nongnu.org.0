Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D8A49722B
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 15:40:01 +0100 (CET)
Received: from localhost ([::1]:55828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBe2C-0000tV-IU
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 09:40:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nBZs9-0002b0-40; Sun, 23 Jan 2022 05:13:21 -0500
Received: from depni-mx.sinp.msu.ru ([213.131.7.21]:39481)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <belyshev@depni.sinp.msu.ru>)
 id 1nBZs6-0003LI-FN; Sun, 23 Jan 2022 05:13:20 -0500
Received: from spider (unknown [176.195.59.180])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id 329D71BF45A;
 Sun, 23 Jan 2022 13:13:24 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall: Do not ignore info.si_pid == 0 in waitid()
Date: Thu, 13 Jan 2022 12:37:46 +0300
Message-ID: <8735len4jt.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: none client-ip=213.131.7.21;
 envelope-from=belyshev@depni.sinp.msu.ru; helo=depni-mx.sinp.msu.ru
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 23 Jan 2022 09:38:31 -0500
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When called with WNOHANG and no child has exited, waitid returns with
info.si_pid set to zero and thus check for info.si_pid != 0 will cause
target siginfo structure to be uninitialized.  Fixed by removing the check.

Signed-off-by: Serge Belyshev <belyshev@depni.sinp.msu.ru>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/817
---
 linux-user/syscall.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5950222a77..b80531ac4c 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8724,9 +8724,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_waitid:
         {
             siginfo_t info;
-            info.si_pid = 0;
             ret = get_errno(safe_waitid(arg1, arg2, &info, arg4, NULL));
-            if (!is_error(ret) && arg3 && info.si_pid != 0) {
+            if (!is_error(ret) && arg3) {
                 if (!(p = lock_user(VERIFY_WRITE, arg3, sizeof(target_siginfo_t), 0)))
                     return -TARGET_EFAULT;
                 host_to_target_siginfo(p, &info);
-- 
2.34.1


