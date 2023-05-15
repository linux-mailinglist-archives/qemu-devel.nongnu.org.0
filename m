Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B724702735
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 10:32:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyTcD-0003hl-9Q; Mon, 15 May 2023 04:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc2-0003go-Lo
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:22 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pyTc0-00022P-Ud
 for qemu-devel@nongnu.org; Mon, 15 May 2023 04:31:22 -0400
Received: from quad ([37.169.188.112]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MZl1l-1pdlP01VCR-00WpZ7; Mon, 15
 May 2023 10:31:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 2/9] linux-user: report ENOTTY for unknown ioctls
Date: Mon, 15 May 2023 10:31:06 +0200
Message-Id: <20230515083113.107056-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515083113.107056-1-laurent@vivier.eu>
References: <20230515083113.107056-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LtgmVMo/BSUpEoACASLJAFnPCT6PkCC/8v4YG7dtY2VesgjS59Z
 kekhZm5/2JNCQlKi5xyYS6xkvbfLHJCN4tydwf1NQ51L4QOrT8P11VvYjv79894IYdeb7YS
 1rUlsQdBpKvSlbyWBT3ZC8KHhxoLolMWd9MW1otIilOz3e/C137LY4x+2u/HzyZTzgPtIBp
 xTg6jEmbtX2BFz6cjmTlQ==
UI-OutboundReport: notjunk:1;M01:P0:PuFugyMtHtc=;4tApUvxHICnmRBAuQlkAOHbbdHo
 EBtXwguu1Y+4vzxO5HbLojnujwN7iWNnFLf5NOkaADIhRqLdIDRESJOZODcVbTRvDyDrkUBbP
 JeaIATEUWcxBHZLd2CTdw2+NBb++ucv1IZ+NIXegYQg1HuodsUdnEY3wLd4AI/hteeBv5+FPd
 ZuecdiCAl4Ffv5Rjm5AIXF8auKkRQ9iVvynRTYqgfyjlLOZdRiwrY54tKLTRUmJDu16p9IWdB
 q3iU5og9Kxb5Dpnub69rfSYX5WJGditDpGdLt5wBTC9xm/QdsOTWoOhE4u4P7QXO3KJDfiyQS
 3ufGgg8xYqzPYKW1H2x/9yevivWU7Su2kj3mNvdZB6gowNYfjpnjquprNCpkdZ3wmOrx7KTQt
 RylG6jDNclBy2fZ3jZkgot9qlel60b5xATsM0OHUQQirC6nVuAc8+/h31uF7qpOHHrP0jGxdJ
 XBy5seFBOIXe1uzk960r9C/gd3x1Xj3lDV9qlcATTnN3FFfiQAx8l1NyOjZKMZFWgbA+NTqtZ
 +gvoQ+PIZpbuH+jjepTNo1sEZJO9wMJOlDaSd1+jvwQ0Ou4nqQR56fYQjp6qbn4HAYPapeso+
 SKQkQ1iH7DGiOJ5QJwpRACVXCZW0NaOS3q/yqO8gRWHz+fzx85hx+tnTWnAKFTk1VospmgBC7
 Rw1FfbCOEzojDKLDYbFF8Wqs0MSEhnyRGyxhqad5oQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

The correct error number for unknown ioctls is ENOTTY.

ENOSYS would mean that the ioctl() syscall itself is not implemented,
which is very improbable and unexpected for userspace.

ENOTTY means "Inappropriate ioctl for device". This is what the kernel
returns on unknown ioctls, what qemu is trying to express and what
userspace is prepared to handle.

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230426070659.80649-1-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 085ce530213e..954ed14df4c0 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5747,7 +5747,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         if (ie->target_cmd == 0) {
             qemu_log_mask(
                 LOG_UNIMP, "Unsupported ioctl: cmd=0x%04lx\n", (long)cmd);
-            return -TARGET_ENOSYS;
+            return -TARGET_ENOTTY;
         }
         if (ie->target_cmd == cmd)
             break;
@@ -5759,7 +5759,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
     } else if (!ie->host_cmd) {
         /* Some architectures define BSD ioctls in their headers
            that are not implemented in Linux.  */
-        return -TARGET_ENOSYS;
+        return -TARGET_ENOTTY;
     }
 
     switch(arg_type[0]) {
@@ -5817,7 +5817,7 @@ static abi_long do_ioctl(int fd, int cmd, abi_long arg)
         qemu_log_mask(LOG_UNIMP,
                       "Unsupported ioctl type: cmd=0x%04lx type=%d\n",
                       (long)cmd, arg_type[0]);
-        ret = -TARGET_ENOSYS;
+        ret = -TARGET_ENOTTY;
         break;
     }
     return ret;
-- 
2.40.1


