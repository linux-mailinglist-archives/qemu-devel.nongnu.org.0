Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08968AB1C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5u-0005Ff-D2; Sat, 04 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5q-0005Cb-HB
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5o-0006xM-ME
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:46 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MV5KC-1pDzmm26I2-00S4yJ; Sat, 04
 Feb 2023 17:08:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 17/22] linux-user: Improve strace output of personality() and
 sysinfo()
Date: Sat,  4 Feb 2023 17:08:25 +0100
Message-Id: <20230204160830.193093-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5ub0z4qieGImvYnch3nUWUbLXig7P1ruyKLLApSuJaoJ4Y575Zg
 UxZy4ksqD83eaD4zBEPQu5LevT3wSRdcHUj39mZQ9Kuj2+mrryhI5S/1+uGxPpvrpqyPQHa
 51FKeR7XAzFde01dgHn8Mm6PHAE7UiqEx9wOkzz/0WgmJDR7tO9r9uWPr4ArbMRZfaxgeI8
 +LTUjzOup16saINM7mlUQ==
UI-OutboundReport: notjunk:1;M01:P0:qN2MgOJK2PM=;7PZwp8T9OFu6ZL/YjXbM8nfuA5g
 lF3KHwzwKjFTZILDfaQSMCvglXSLdE6P4hKzBVf5SQSnSx7vowO2Hgs9dLdjbHhOBBL8AYS74
 SAPxd4T6kBH/Wu75SU9QZQTjqKmJeSqZrofKkWyatiI/LyDjjWFWXVtBTLulgxGDV4c2leC2e
 jIsHpH+M9EiPUwUiUaRVtQ8ELmtcTYu/H1nRdeee2To6aMCbNWfRv2o2QEXmeKk9R8dTowdTN
 uJeHycTQCDILPxHAecOWgqXbZqkBiHVzToldtTTaMYTmzubyyYz9kDATbnlJvKecZm/2FQ6MW
 zLDcWxCUtpLX7C9nAGrxQKlXW/PsY/ifpFxs20/YTQmimOs/3bGC44nIR2PaaHIr6FErxw5TU
 gCtfzfjUXSrz8YPhrimsYynWnVOsCVtgENqxBfpytYJXCq0fCTQWGCxMRUd8IXQILAFlnAW/N
 PtqIGJ1nZMlbCgywRWn8Ecsc0V6vt1jjZ0oEIJ9vurr7kD3PchDqAsVBeDpcdQVgWy21ziksy
 f8LNc0wMGRJx1WvQwJbU3tZH5BGQQG7o7fXx4wJ+lAYByc6lI9YICa7Hj88oWlmp6fFnBvnEB
 ZrnY/1I7a+TwwvLiqkkCFspE4OlcFmDoFueSnxEqLdi14SHuSXKqbhus0ER6Jn61gdXImQIWQ
 AOc4/Rdejs8ADJkZd94nt6r4uJnMgS3/bvS1jf89lQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Make the strace look nicer for those two syscalls.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <Y9QxskymWJjrKQmT@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index cf291d02edfe..3a1f61803a39 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -1049,7 +1049,8 @@
 { TARGET_NR_perfctr, "perfctr" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_personality
-{ TARGET_NR_personality, "personality" , NULL, NULL, NULL },
+{ TARGET_NR_personality, "personality" , "%s(0x"TARGET_ABI_FMT_lx")", NULL,
+  print_syscall_ret_addr },
 #endif
 #ifdef TARGET_NR_pipe
 { TARGET_NR_pipe, "pipe" , NULL, NULL, NULL },
@@ -1504,7 +1505,7 @@
 { TARGET_NR_sysfs, "sysfs" , NULL, NULL, NULL },
 #endif
 #ifdef TARGET_NR_sysinfo
-{ TARGET_NR_sysinfo, "sysinfo" , NULL, NULL, NULL },
+{ TARGET_NR_sysinfo, "sysinfo" , "%s(%p)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_sys_kexec_load
 { TARGET_NR_sys_kexec_load, "sys_kexec_load" , NULL, NULL, NULL },
-- 
2.39.1


