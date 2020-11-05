Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3462A77C9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 08:11:38 +0100 (CET)
Received: from localhost ([::1]:42484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaZQn-0004jP-Fb
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 02:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kaZOA-0000Iu-4D
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 02:08:54 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:39399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kaZO7-0007Xt-Bc
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 02:08:53 -0500
Received: from localhost.localdomain ([82.252.154.198]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mdevh-1k0xaM4Bd3-00ZgXB; Thu, 05 Nov 2020 08:08:44 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] linux-user/syscall: Fix missing
 target_to_host_timespec64() check
Date: Thu,  5 Nov 2020 08:08:36 +0100
Message-Id: <20201105070837.558332-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105070837.558332-1-laurent@vivier.eu>
References: <20201105070837.558332-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nhYnG5QhwgCnkzuQyYDBGPnpGnHbLD2aCzUxPzGvcxAA9hBHnLc
 1BVFVSyTnA2o2zrt+UFHT5kxmWKjq+YOMtn5PalhNKNYI5H0bAfJvPyvxjHMikw2YSgZUJv
 dC6evrnDQEUdP9esuwmupIUu6Erp6W3jShSJaWv3SLizRvNbdDZqeHBpyUxAGOKgqtNYYi9
 JN3Z8vsEBR6c19BHePxXw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NjR5CYtZrgc=:h/NQVx6aOYhj9RRh/Ak9tW
 C2eJg+9li8qdgLR0Owd4791s9yB5YDDpNW1egIU7XLB++sbjGq5cSGQH/NOSrx64YOtdxEXbL
 6+P0okAqI+DN++AgRwEYaYeOiOm5CPwloiaE/4rIf9SP3BuLHMwXWOvha1fYXDBu8YNg7vPl2
 CsGRSLaENcJH1K0McqplyMSTHFFMPPh13ZiHaPNh6N9D2xklF8u/nOnlT/v7xc+FTGxmMl9f0
 wI9pVOnh7el+JRi4bqQISTJBG8/i3YKcGjpVPnthyl0Og0lsr3GX36/6yzm1twZ6B4UQZSe2s
 bp+TsvPe4uChB4xiGu3FYYHJS4gD1jAvB3LmMU5g9bJZv+fsenJ3syJjjDT42+9JlUnh9KacA
 6diFg+5EQE0pcg0YwajTkEILoZMCzRqaJdQAy/H3tfLVNPDfcokyjq5Yc/tEGbTmbZ4u2EY+S
 Z2EgwBqrUA==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 02:08:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Coverity pointed out (CID 1432339) that target_to_host_timespec64() can
fail with -TARGET_EFAULT but we never check the return value. This patch
checks the return value and handles the error.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <cad74fae734d2562746b94acd9c34b00081c89bf.1604432881.git.alistair.francis@wdc.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6fef8181e738..3160a9ba06bd 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7592,7 +7592,9 @@ static int do_futex_time64(target_ulong uaddr, int op, int val, target_ulong tim
     case FUTEX_WAIT_BITSET:
         if (timeout) {
             pts = &ts;
-            target_to_host_timespec64(pts, timeout);
+            if (target_to_host_timespec64(pts, timeout)) {
+                return -TARGET_EFAULT;
+            }
         } else {
             pts = NULL;
         }
-- 
2.28.0


