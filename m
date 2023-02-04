Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CD168AB0D
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:09:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL68-0005Tw-0X; Sat, 04 Feb 2023 11:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5o-00059c-2B
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:44 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5l-0006vv-Vw
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:43 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7bJ5-1pGwZZ12Cr-0085Fw; Sat, 04
 Feb 2023 17:08:40 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 12/22] linux-user: Add strace output for clock_getres_time64()
 and futex_time64()
Date: Sat,  4 Feb 2023 17:08:20 +0100
Message-Id: <20230204160830.193093-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:LCimNpfcYEuESv6q3mNEdhG5rgaF6JAhH3rIuk5LEBXQ7ca6Z95
 HMGHhMksrFu5sI9F8V/+2kIWsCr/YP3zhNIkjXOfT9SJNp/o2TNhVaovF5XdEkFaQu4hoOC
 ibGjIJk46FYHUHwDrN3uvZDN1AmGNKJiivxdXagvN77gSOoeUc28j4ansOkQ7QLkNg6sUqB
 67y8OXnIq/znKyaTRZBFQ==
UI-OutboundReport: notjunk:1;M01:P0:0SOrIXwGa5Y=;Lvxd8CK+cJofO26MfI6W/D2gGIM
 0RR/PxBohvs5b/ESPICZkYI7Ki7XyFY0Lt0aYGIJKhdOvwkA1dL/pZSgFLq0c+Pa9eIgBSFzk
 RkACN7xiWukB3jpMJpW0Gon24UrK0xfFno6S2lt9Y1Ex3hZsyLhcKeqjjbiUFxbz6U2EAyCxP
 asAMuFK3v5BwmbVz21DDhUy/LrOrRfWVZWGPGydRYUffwAy11kHhxYmSsio8j1j2SLUlca+VP
 wVtGYlTzH8WK/GuiZIqzc5KXD5fIL6VZwngpapI/97XwyciPmrCPJ7LNWyzmM6nP/YRQK28aT
 RdST5UB7x0yn4O+EGRtaoNb4YGd5HwmHRo1Y/aPtoCOqawGLmu1NkvRtnTNMYBsj8ygXpnYHe
 R8f49IhCuHZGKBaDdLBRGVDrvjTEMiHkTmbME8mTZjgAj4qZw2nmyQLRwignadIV+onLYPG5b
 GDtFtmqyeAOqxluQJORBvVvdKSi2cwruZNqjVWIYoYhxOUTx6gfOcrHW00y4HT2KtJSywZLqx
 EdIhlWo66MClVlzLPBhUt18pGdtGmAC712sZDV9pMPGV9xscabOp5YJm5v6k1YwIP9kYyWkMC
 MuVcVdYwppa8F5C7cKhZjXUX/PE2+al3tHZ4PqTQ97T8KQOMU7DJ96+a7txcCR5CEBSk0ndIm
 /bLiwPCERNrdSbGUcJNCUHc73DnWl9MsVi+iE+yeGQ==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

Add the two syscalls to strace output to avoid "Unknown syscall" message.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230115113517.25143-1-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index bb21c054148e..64db8e6b8412 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -86,6 +86,9 @@
 { TARGET_NR_clock_getres, "clock_getres" , NULL, print_clock_getres,
                           print_syscall_ret_clock_getres },
 #endif
+#ifdef TARGET_NR_clock_getres_time64
+{ TARGET_NR_clock_getres_time64, "clock_getres_time64" , NULL, NULL, NULL },
+#endif
 #ifdef TARGET_NR_clock_gettime
 { TARGET_NR_clock_gettime, "clock_gettime" , NULL, print_clock_gettime,
                            print_syscall_ret_clock_gettime },
@@ -275,6 +278,9 @@
 #ifdef TARGET_NR_futex
 { TARGET_NR_futex, "futex" , NULL, print_futex, NULL },
 #endif
+#ifdef TARGET_NR_futex_time64
+{ TARGET_NR_futex_time64, "futex_time64" , NULL, NULL, NULL },
+#endif
 #ifdef TARGET_NR_futimesat
 { TARGET_NR_futimesat, "futimesat" , NULL, print_futimesat, NULL },
 #endif
-- 
2.39.1


