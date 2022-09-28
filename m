Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B910B5EE6AF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:40:33 +0200 (CEST)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddr3-0008VO-Ql
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddek-0007wS-8e
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddei-0006N2-AU
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:45 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MLA2e-1ovr1l42xG-00IGQE; Wed, 28
 Sep 2022 22:27:40 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Jameson Nash <vtjnash@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 02/37] linux-user: fix readlinkat handling with magic exe
 symlink
Date: Wed, 28 Sep 2022 22:27:02 +0200
Message-Id: <20220928202737.793171-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y5LNxxin6TgZD2LbViOEQruAAyLh8MnkAu+bgNMdrQtyUWA4QAQ
 3yBxqgOQoc7vtM91st7C3kaC6acwYUvRtiVb5LZTC4/lW4E9A9sH8obR34PToDq2SBWdsBN
 lcNkX9BqHneJxEcvYOfFNBe2LgjH3K4RFyxVMUMBGOH3Qig0FZiu/ggpLzR/fy0PFhi5cUB
 rf3N4huH0ikl8+CI0GWyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RJrbQmFocrQ=:RR6xWnaKt7KNvQizsDolR7
 Kcxbxb0TEjCPS5cX363MpILIQMPFZLbQOTloAyyd1rTuHgP3P2jtLmJXZZYpwAQbJ0HuO6IWs
 BgIzoNlH8PnrlQHE91fOs5uL/tWjvLD4FO3mh6XKxs1qH1yZk4WLreFqN9DY5Ss7aWW75l1zh
 OUBHSqu+0bfYZrCQU4+vCkfbXrOOLg4UIWV3Woch35xB5x8S5OF8oaz588mgz/L32Iv54jhDz
 cq4AW5/iR4K5I9XaQzimm8daAr4CYFMXF8dDplMLBIcASil9r1UA0K7yylLYqMPXI9+mF63vd
 /LtDcQNuupIBtQkgKDI4T7vQcZT+7gI3VgaIMpoQNhgPmhttD/vltUuwjoyj+zlff6aLZHFCV
 4OgvM8BRkpdljTVxSftgsRbDuxr309DOWB4qcxZorPeji70hyz2oDkcERsVnQGGrpdgsTW6Yd
 GbmI2M/KAwWurhbuBzmsXpdqk7OBO80NQPv7LNt989TVKwTPumK7Xjd9mduAaxfKemkPtNA/2
 AyzokmguYX6f8UIwbPGv1Xp77sj3Gi7UDKWVed0dRN/aHPrtvi8vPtsMV+FPcnl0afGDmrzIo
 nQ+kfzJpDuI12Ek8OgRIdEi3HJYkyFAHMVlxYKp7OfbPQzNIEuo3oUf52E+GzlqOt05NXt3Ds
 LbN6mNbWrKvlarsE8KmHobtjTOXOv7zxLBUEPjkMhI1v1TJusUOXbghTlyq/brZo4/QNNXUk6
 Op0Oykv6I+p7srXwG80hvjPAg+ZbcpPC71IB9ni9WJjTZ+iS13PhMUIy4VH/EPsoJf1Q/gdkD
 2dCvHEC
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Jameson Nash <vtjnash@gmail.com>

Exactly the same as f17f4989fa193fa8279474c5462289a3cfe69aea before was
for readlink. I suppose this was simply missed at the time.

Signed-off-by: Jameson Nash <vtjnash@gmail.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220808190727.875155-1-vtjnash@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f4091212027c..abf82bab2a18 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -9912,11 +9912,22 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
             p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
             if (!p || !p2) {
                 ret = -TARGET_EFAULT;
+            } else if (!arg4) {
+                /* Short circuit this for the magic exe check. */
+                ret = -TARGET_EINVAL;
             } else if (is_proc_myself((const char *)p, "exe")) {
                 char real[PATH_MAX], *temp;
                 temp = realpath(exec_path, real);
-                ret = temp == NULL ? get_errno(-1) : strlen(real) ;
-                snprintf((char *)p2, arg4, "%s", real);
+                /* Return value is # of bytes that we wrote to the buffer. */
+                if (temp == NULL) {
+                    ret = get_errno(-1);
+                } else {
+                    /* Don't worry about sign mismatch as earlier mapping
+                     * logic would have thrown a bad address error. */
+                    ret = MIN(strlen(real), arg4);
+                    /* We cannot NUL terminate the string. */
+                    memcpy(p2, real, ret);
+                }
             } else {
                 ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
             }
-- 
2.37.3


