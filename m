Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 826BB617919
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 09:51:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqVv1-0006ds-QF; Thu, 03 Nov 2022 04:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVuq-0006YO-Hg
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:41 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqVum-0004BB-AC
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 04:49:34 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M60HD-1owJjg2PRz-007QLv; Thu, 03
 Nov 2022 09:49:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/4] linux-user: Add close_range() syscall
Date: Thu,  3 Nov 2022 09:49:23 +0100
Message-Id: <20221103084925.3860524-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221103084925.3860524-1-laurent@vivier.eu>
References: <20221103084925.3860524-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OMuKM6XGJRrCYJA0EyyV0txYvybMK6TNBtMkOcxwpyg7/u5rc5t
 E8lcFnodQ3lmOO1KPmBgkXW98Z9svnng1QIScnSO8p1/TKGpV+UwhVAC59Hudy7x7Sg1HyQ
 BxnJX6DkECmgp1yagXvMAlFZ8nrtrN3JAglt3PFGLO5Y3bK5DT/GwtajcggBTxDH895PBky
 5kpsPQq2RuqqG71YboPyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:pDPZUDN2Qlg=:spj9zDi3mqo0QxqM+PSwZf
 pvpER+Hf5Rn7OCuD2xGNQXQC923XjNm2BfiiVEBogxEQsowX7wMMiTpDb3Cfwxsz2ZMjBKcHJ
 vcQ9ZpifZ6dVfbnA/3WP4WKRSzeOAL+Cizi29oJn+QorCGF/lp1lt01NMHpBEluFBHRZVTx4q
 EZcKUDRVrw+LjL7GNjnrEVxjvoAj2N1Ux4ebT93FHZgWcaCsTLYMRlWAuq8TMRJ2lU3pgk+P/
 W8di5B9D3BS1Cq1AJHStvEBP9aZOZY2a4STpzgbzde9HCjb6o/emGazO0GIq8jeatw4j8DZC7
 /ClLGovtcN5S7ECOVDnEFbA+r8eyxY9fY/xWLVszcpPTgiGQScbJbNlGOVw7DoD3YjqHSoLT2
 gqYy1d45HdNkb70kk13CAaAaP4eNlmWbAqmZOa4g/FjjgqP1eXtnkUxj01WQ6r4bzNIPfckyu
 x60kOM4Mu9slrWHZzON2x3AILIs3TH2ZYvfpoJcpaJr2topEBZOLuqtysBYxlxU9pkfPPhUYV
 CSCpyIs1ZNzyOT00LZ1XLnzXgu3JCUeyHPjn2ic0X2Y0xsIEw4QBYqHXMluTnVTY8QR+6es3F
 4YO9ulW5LBDewwno2a3n5gNC+bIkZCUpEYsWQki+Ixbfaz65wxDCLcWsa81x9vTp2dQlThcr8
 SAaS6PnCysZI7bEb2QQnwRevOdnvloLsjSYrA6kYaiAqgdyb8ZzLV9QVBc/fpC1TSiaVFYKZ2
 9/aBGFg0JtK23hdWzOv/0X5tX7nV82YsmT4GoeqZbTXfqD+2f/pKzz/WjJh0fG1x4KxYnL8/z
 ZB3wt5z
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Helge Deller <deller@gmx.de>

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <Y1dLJoEDhJ2AAYDn@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.list |  3 +++
 linux-user/syscall.c   | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index 3df2184580aa..cd995e5d56db 100644
--- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -103,6 +103,9 @@
 #ifdef TARGET_NR_close
 { TARGET_NR_close, "close" , "%s(%d)", NULL, NULL },
 #endif
+#ifdef TARGET_NR_close_range
+{ TARGET_NR_close_range, "close_range" , "%s(%u,%u,%u)", NULL, NULL },
+#endif
 #ifdef TARGET_NR_connect
 { TARGET_NR_connect, "connect" , "%s(%d,%#x,%d)", NULL, NULL },
 #endif
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 8402c1399d3c..8b18adfba894 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -364,6 +364,13 @@ _syscall3(int,sys_syslog,int,type,char*,bufp,int,len)
 #ifdef __NR_exit_group
 _syscall1(int,exit_group,int,error_code)
 #endif
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+#define __NR_sys_close_range __NR_close_range
+_syscall3(int,sys_close_range,int,first,int,last,int,flags)
+#ifndef CLOSE_RANGE_CLOEXEC
+#define CLOSE_RANGE_CLOEXEC     (1U << 2)
+#endif
+#endif
 #if defined(__NR_futex)
 _syscall6(int,sys_futex,int *,uaddr,int,op,int,val,
           const struct timespec *,timeout,int *,uaddr2,int,val3)
@@ -8756,6 +8763,18 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
     case TARGET_NR_close:
         fd_trans_unregister(arg1);
         return get_errno(close(arg1));
+#if defined(__NR_close_range) && defined(TARGET_NR_close_range)
+    case TARGET_NR_close_range:
+        ret = get_errno(sys_close_range(arg1, arg2, arg3));
+        if (ret == 0 && !(arg3 & CLOSE_RANGE_CLOEXEC)) {
+            abi_long fd, maxfd;
+            maxfd = MIN(arg2, target_fd_max);
+            for (fd = arg1; fd < maxfd; fd++) {
+                fd_trans_unregister(fd);
+            }
+        }
+        return ret;
+#endif
 
     case TARGET_NR_brk:
         return do_brk(arg1);
-- 
2.37.3


