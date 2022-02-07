Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06E4AB7F7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:53:20 +0100 (CET)
Received: from localhost ([::1]:59866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0hz-0005k9-Ht
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:53:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00065P-W6
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:10 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-00079k-FJ
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPooP-1ndjJx3yMd-00Ms6U; Mon, 07
 Feb 2022 09:28:03 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] linux-user: rt_sigprocmask, check read perms first
Date: Mon,  7 Feb 2022 09:27:55 +0100
Message-Id: <20220207082759.180431-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
References: <20220207082759.180431-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2cTLxPYCwaWO7QuCVqzcudZI6dQKrGuRyp9Tg7YVoNq1qv+DT5O
 UgmFUtRCodcmZWzVRfBFuplrSbGBl0W01ntw10Odk0yDXADcYRZfLQgf2K6TmIEIyH/N/gB
 duQjJprrJ/A8D6mI1slcelIvJbZPSFXm186BC5CXdu3yPeJEf3BQyVyUHl6zWFATvL382ov
 GpzAYrvcC3grcXUUSfPxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zae7VvQajlQ=:bDAqzuOGZ4E3QmSRZPwkfE
 LTDhLsNAYmxqh5uy5E6pXvyNohIGbnNe7cnz7utTOjT+kQGvg9ewKzhtQmkysZ0R7Jm2/j78u
 Rp5oBEf6RoGIiq+nwWi1iFjAJJCVilUr3erIlHuPCLiJvJoRuOi624m/425WwkfMo2sbXUPIh
 8dAGetO3t2pb0bTryQ2qCQAytC0MRXNR8KpVAG1E98vtRCFRTR8RocwXSR+wAY3nauEn1cVJX
 90lYj395wBNxde6wAFBaAvfuT4VVYv10mci3+UqZq0PH4dxpBV2QV0ppVwE4jpMHx4UjtHwQY
 /yBfPNoSV+tc0z23SLrNBP0y1F5lKj+LFyQSq8XILr0IRxjFNjOG2g8slykC5yzz252ujcpbo
 8GBU09Of4VKOF+eVmZHaDrkwsBjIgy3PMQ7ocCCfvHN/I1lyU8EbEX6TjMEbI1+3X6ryOrEiq
 ZUJASiEM6X0viJ50f0LtGoazx+Mn9wn27t7SjrIfrW5WKN6k1Rbt9HeA9Avl2wbIOvkyMfX7G
 aBH+0uoFM+yhjZ7CZOa4OBgniGUAL+MkI8N1/IpopeOB75whOWzPS7tyY0W3BeZ/3SwlaNGqj
 w+R8S4pyj1L15bz4dKjVeBp9EqVMlwl4VPqiX4z9QlUAxnwrnyAIUX/E3Gz0K4xUMSVxKyXFt
 FNgbOvspJaiJ48F1Wpg/HeMMlAwIZFMNq+zQ0p833a3nmHEGDa1H7INFw3WzPXJf3VI0=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Patrick Venture <venture@google.com>, Shu-Chun Weng <scw@google.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shu-Chun Weng <scw@google.com>

Linux kernel does it this way (checks read permission before validating `how`)
and the latest version of ABSL's `AddressIsReadable()` depends on this
behavior.

c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
Reviewed-by: Patrick Venture <venture@google.com>
Signed-off-by: Shu-Chun Weng <scw@google.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Patrick Venture <venture@google.com>
Message-Id: <20220126212559.1936290-2-venture@google.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2ca0f086dbfc..9f8b497fa353 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9478,6 +9478,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             }
 
             if (arg2) {
+                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);
+                if (!p) {
+                    return -TARGET_EFAULT;
+                }
+                target_to_host_sigset(&set, p);
+                unlock_user(p, arg2, 0);
+                set_ptr = &set;
                 switch(how) {
                 case TARGET_SIG_BLOCK:
                     how = SIG_BLOCK;
@@ -9491,11 +9498,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 default:
                     return -TARGET_EINVAL;
                 }
-                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
-                    return -TARGET_EFAULT;
-                target_to_host_sigset(&set, p);
-                unlock_user(p, arg2, 0);
-                set_ptr = &set;
             } else {
                 how = 0;
                 set_ptr = NULL;
-- 
2.34.1


