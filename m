Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DBC533AD4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:46:09 +0200 (CEST)
Received: from localhost ([::1]:33066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoWm-0000OU-9I
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRz-0005nA-85
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:11 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:40229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRu-0002FG-HG
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:10 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MnZwp-1nSksz3MYf-00jd4D; Wed, 25
 May 2022 12:41:01 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 4/8] linux-user: Have do_syscall() use CPUArchState* instead of
 void*
Date: Wed, 25 May 2022 12:40:53 +0200
Message-Id: <20220525104057.543354-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525104057.543354-1-laurent@vivier.eu>
References: <20220525104057.543354-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1TWpHDo3e0PbiWCWZB7BVBS9OGvdZVJNK80WqzBcUVvoDKrqMZy
 wlHvwfcdWJrxKaeFwelOc8hIeAIRZ4f2mwv4GwbzevJuRKVcgPp8v43pLsok8GLJNKyTvyn
 wWy6Rz42rvc5botlcFPuO8jq0cwPMbWMkTDiZofpAhivs1Daz05Slt/4LelMUhxNK1Elcc7
 lnZ/pZXUrwhSRA5isEV5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JEIGb+/W8e8=:zvF8oeCIS9pwJPJdzUuqFt
 aGT1+AdsZKI4mSXzpWfW/xLrGt29Q2NcqrnBsfoC6e2th6tJpUgLXY+Bwv47XyaxLY9Gbwdkq
 1c3FxaTD4K0onB9/wgRHhcEZsxlQHRC1jqNyOnfGrHqb3Qj//G2tp5GZo50IuJ6a9sE0aQ7xg
 yH9uhlk+7y6Z0n6/qauxZy1ssZd0S78YhTpPo7BcFBM3Sa5XYQvnCwgs7u/QId6uG+k8iHkWG
 hQBCWaor4GW2ncuLWxQilnnAv3qMMZBXkeUV7WJHwNDDlTpdUhdZFC7vpEVptuKZsmJUTmS/z
 JHgUgJ8Xo/hvzSzwRs2oMsiYs9isgawPjdIFx7sjlKUqw7FX4gr+KIw9ZbjIMgA3b2zSDMmp2
 XlMVdopUFr38/Td5tlhuoV5hDP80GMTyZ8PU/DSjZocQkZs5EZa112uZaOmuig9JyfcacsDkI
 rbALGJwdQAq9RmS47JsEw05MIP0OPQtq7dARJ/s5+4SE3Yl6f75+g9uggznNMmAP1Ds36w4tA
 8MeAJPs6KlsojaaiIq/nmmp5niEXIpnHmQjqimLM0O03k2gxF4yX6TMD+qBihFKtJjpYkjHq+
 t9gJO5vwp4mFi2pPbGsV9Tesf0Ps0UAQkJBCDSGuierQjzCRVgeTc3oLs9TQkKXm5l0rXN1bw
 yXdXsILx78k7XiuW8fLZsWz7YWr2CQD8hXHKrVBeIqxgLcYZ8GG4EveI1H0FP02iJ2EtdJn0M
 Q9jXlIhdUPLuCgr5GGbZyjz1wTOfFcoFEPrUjQ==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220509205728.51912-3-philippe.mathieu.daude@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c         | 202 ++++++++++++++++++------------------
 linux-user/strace.h         |   4 +-
 linux-user/syscall.c        |  32 +++---
 linux-user/uname.c          |   2 +-
 linux-user/uname.h          |   2 +-
 linux-user/user-internals.h |  16 +--
 6 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 2cdbf030ba44..9fa681dea9bb 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -22,10 +22,10 @@ struct syscallname {
     int nr;
     const char *name;
     const char *format;
-    void (*call)(void *, const struct syscallname *,
+    void (*call)(CPUArchState *, const struct syscallname *,
                  abi_long, abi_long, abi_long,
                  abi_long, abi_long, abi_long);
-    void (*result)(void *, const struct syscallname *, abi_long,
+    void (*result)(CPUArchState *, const struct syscallname *, abi_long,
                    abi_long, abi_long, abi_long,
                    abi_long, abi_long, abi_long);
 };
@@ -593,7 +593,7 @@ print_fdset(int n, abi_ulong target_fds_addr)
 /* select */
 #ifdef TARGET_NR__newselect
 static void
-print_newselect(void *cpu_env, const struct syscallname *name,
+print_newselect(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg1, abi_long arg2, abi_long arg3,
                 abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -611,7 +611,7 @@ print_newselect(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_semctl
 static void
-print_semctl(void *cpu_env, const struct syscallname *name,
+print_semctl(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg1, abi_long arg2, abi_long arg3,
              abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -623,7 +623,7 @@ print_semctl(void *cpu_env, const struct syscallname *name,
 #endif
 
 static void
-print_execve(void *cpu_env, const struct syscallname *name,
+print_execve(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg1, abi_long arg2, abi_long arg3,
              abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -656,7 +656,7 @@ print_execve(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_ipc
 static void
-print_ipc(void *cpu_env, const struct syscallname *name,
+print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
           abi_long arg1, abi_long arg2, abi_long arg3,
           abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -700,7 +700,7 @@ print_syscall_err(abi_long ret)
 }
 
 static void
-print_syscall_ret_addr(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_addr(CPUArchState *cpu_env, const struct syscallname *name,
                        abi_long ret, abi_long arg0, abi_long arg1,
                        abi_long arg2, abi_long arg3, abi_long arg4,
                        abi_long arg5)
@@ -721,7 +721,7 @@ print_syscall_ret_raw(struct syscallname *name, abi_long ret)
 
 #ifdef TARGET_NR__newselect
 static void
-print_syscall_ret_newselect(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_newselect(CPUArchState *cpu_env, const struct syscallname *name,
                             abi_long ret, abi_long arg0, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5)
@@ -751,7 +751,7 @@ print_syscall_ret_newselect(void *cpu_env, const struct syscallname *name,
 #define TARGET_TIME_ERROR    5   /* clock not synchronized */
 #ifdef TARGET_NR_adjtimex
 static void
-print_syscall_ret_adjtimex(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_adjtimex(CPUArchState *cpu_env, const struct syscallname *name,
                            abi_long ret, abi_long arg0, abi_long arg1,
                            abi_long arg2, abi_long arg3, abi_long arg4,
                            abi_long arg5)
@@ -786,7 +786,7 @@ print_syscall_ret_adjtimex(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_clock_gettime) || defined(TARGET_NR_clock_getres)
 static void
-print_syscall_ret_clock_gettime(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_clock_gettime(CPUArchState *cpu_env, const struct syscallname *name,
                                 abi_long ret, abi_long arg0, abi_long arg1,
                                 abi_long arg2, abi_long arg3, abi_long arg4,
                                 abi_long arg5)
@@ -805,7 +805,7 @@ print_syscall_ret_clock_gettime(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_gettimeofday
 static void
-print_syscall_ret_gettimeofday(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_gettimeofday(CPUArchState *cpu_env, const struct syscallname *name,
                                abi_long ret, abi_long arg0, abi_long arg1,
                                abi_long arg2, abi_long arg3, abi_long arg4,
                                abi_long arg5)
@@ -824,7 +824,7 @@ print_syscall_ret_gettimeofday(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_getitimer
 static void
-print_syscall_ret_getitimer(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_getitimer(CPUArchState *cpu_env, const struct syscallname *name,
                             abi_long ret, abi_long arg0, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5)
@@ -843,7 +843,7 @@ print_syscall_ret_getitimer(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_getitimer
 static void
-print_syscall_ret_setitimer(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_setitimer(CPUArchState *cpu_env, const struct syscallname *name,
                             abi_long ret, abi_long arg0, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5)
@@ -862,7 +862,7 @@ print_syscall_ret_setitimer(void *cpu_env, const struct syscallname *name,
 #if defined(TARGET_NR_listxattr) || defined(TARGET_NR_llistxattr) \
  || defined(TARGGET_NR_flistxattr)
 static void
-print_syscall_ret_listxattr(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_listxattr(CPUArchState *cpu_env, const struct syscallname *name,
                             abi_long ret, abi_long arg0, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5)
@@ -894,7 +894,7 @@ print_syscall_ret_listxattr(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_ioctl
 static void
-print_syscall_ret_ioctl(void *cpu_env, const struct syscallname *name,
+print_syscall_ret_ioctl(CPUArchState *cpu_env, const struct syscallname *name,
                         abi_long ret, abi_long arg0, abi_long arg1,
                         abi_long arg2, abi_long arg3, abi_long arg4,
                         abi_long arg5)
@@ -1760,7 +1760,7 @@ print_termios(void *arg)
 
 #ifdef TARGET_NR_accept
 static void
-print_accept(void *cpu_env, const struct syscallname *name,
+print_accept(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1774,7 +1774,7 @@ print_accept(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_access
 static void
-print_access(void *cpu_env, const struct syscallname *name,
+print_access(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1787,7 +1787,7 @@ print_access(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_acct
 static void
-print_acct(void *cpu_env, const struct syscallname *name,
+print_acct(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1799,7 +1799,7 @@ print_acct(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_brk
 static void
-print_brk(void *cpu_env, const struct syscallname *name,
+print_brk(CPUArchState *cpu_env, const struct syscallname *name,
           abi_long arg0, abi_long arg1, abi_long arg2,
           abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1811,7 +1811,7 @@ print_brk(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_chdir
 static void
-print_chdir(void *cpu_env, const struct syscallname *name,
+print_chdir(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1823,7 +1823,7 @@ print_chdir(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_chroot
 static void
-print_chroot(void *cpu_env, const struct syscallname *name,
+print_chroot(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1835,7 +1835,7 @@ print_chroot(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_chmod
 static void
-print_chmod(void *cpu_env, const struct syscallname *name,
+print_chmod(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1848,7 +1848,7 @@ print_chmod(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_chown) || defined(TARGET_NR_lchown)
 static void
-print_chown(void *cpu_env, const struct syscallname *name,
+print_chown(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1863,7 +1863,7 @@ print_chown(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_clock_adjtime
 static void
-print_clock_adjtime(void *cpu_env, const struct syscallname *name,
+print_clock_adjtime(CPUArchState *cpu_env, const struct syscallname *name,
                     abi_long arg0, abi_long arg1, abi_long arg2,
                     abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1887,7 +1887,7 @@ static void do_print_clone(unsigned int flags, abi_ulong newsp,
 }
 
 static void
-print_clone(void *cpu_env, const struct syscallname *name,
+print_clone(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg1, abi_long arg2, abi_long arg3,
             abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -1907,7 +1907,7 @@ print_clone(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_creat
 static void
-print_creat(void *cpu_env, const struct syscallname *name,
+print_creat(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1920,7 +1920,7 @@ print_creat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_execv
 static void
-print_execv(void *cpu_env, const struct syscallname *name,
+print_execv(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1933,7 +1933,7 @@ print_execv(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_faccessat
 static void
-print_faccessat(void *cpu_env, const struct syscallname *name,
+print_faccessat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1948,7 +1948,7 @@ print_faccessat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_fallocate
 static void
-print_fallocate(void *cpu_env, const struct syscallname *name,
+print_fallocate(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1968,7 +1968,7 @@ print_fallocate(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_fchmodat
 static void
-print_fchmodat(void *cpu_env, const struct syscallname *name,
+print_fchmodat(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1983,7 +1983,7 @@ print_fchmodat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_fchownat
 static void
-print_fchownat(void *cpu_env, const struct syscallname *name,
+print_fchownat(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -1999,7 +1999,7 @@ print_fchownat(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_fcntl) || defined(TARGET_NR_fcntl64)
 static void
-print_fcntl(void *cpu_env, const struct syscallname *name,
+print_fcntl(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2135,7 +2135,7 @@ print_fcntl(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_fgetxattr
 static void
-print_fgetxattr(void *cpu_env, const struct syscallname *name,
+print_fgetxattr(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2150,7 +2150,7 @@ print_fgetxattr(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_flistxattr
 static void
-print_flistxattr(void *cpu_env, const struct syscallname *name,
+print_flistxattr(CPUArchState *cpu_env, const struct syscallname *name,
                  abi_long arg0, abi_long arg1, abi_long arg2,
                  abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2164,7 +2164,7 @@ print_flistxattr(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_getxattr) || defined(TARGET_NR_lgetxattr)
 static void
-print_getxattr(void *cpu_env, const struct syscallname *name,
+print_getxattr(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2180,7 +2180,7 @@ print_getxattr(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_listxattr) || defined(TARGET_NR_llistxattr)
 static void
-print_listxattr(void *cpu_env, const struct syscallname *name,
+print_listxattr(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2195,7 +2195,7 @@ print_listxattr(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_fremovexattr)
 static void
-print_fremovexattr(void *cpu_env, const struct syscallname *name,
+print_fremovexattr(CPUArchState *cpu_env, const struct syscallname *name,
                    abi_long arg0, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2208,7 +2208,7 @@ print_fremovexattr(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_removexattr) || defined(TARGET_NR_lremovexattr)
 static void
-print_removexattr(void *cpu_env, const struct syscallname *name,
+print_removexattr(CPUArchState *cpu_env, const struct syscallname *name,
                   abi_long arg0, abi_long arg1, abi_long arg2,
                   abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2222,7 +2222,7 @@ print_removexattr(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_futimesat
 static void
-print_futimesat(void *cpu_env, const struct syscallname *name,
+print_futimesat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2237,7 +2237,7 @@ print_futimesat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_gettimeofday
 static void
-print_gettimeofday(void *cpu_env, const struct syscallname *name,
+print_gettimeofday(CPUArchState *cpu_env, const struct syscallname *name,
                    abi_long arg0, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2250,7 +2250,7 @@ print_gettimeofday(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_settimeofday
 static void
-print_settimeofday(void *cpu_env, const struct syscallname *name,
+print_settimeofday(CPUArchState *cpu_env, const struct syscallname *name,
                    abi_long arg0, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2263,7 +2263,7 @@ print_settimeofday(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_clock_gettime) || defined(TARGET_NR_clock_getres)
 static void
-print_clock_gettime(void *cpu_env, const struct syscallname *name,
+print_clock_gettime(CPUArchState *cpu_env, const struct syscallname *name,
                     abi_long arg0, abi_long arg1, abi_long arg2,
                     abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2277,7 +2277,7 @@ print_clock_gettime(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_clock_settime
 static void
-print_clock_settime(void *cpu_env, const struct syscallname *name,
+print_clock_settime(CPUArchState *cpu_env, const struct syscallname *name,
                     abi_long arg0, abi_long arg1, abi_long arg2,
                     abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2290,7 +2290,7 @@ print_clock_settime(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_getitimer
 static void
-print_getitimer(void *cpu_env, const struct syscallname *name,
+print_getitimer(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2303,7 +2303,7 @@ print_getitimer(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_setitimer
 static void
-print_setitimer(void *cpu_env, const struct syscallname *name,
+print_setitimer(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2317,7 +2317,7 @@ print_setitimer(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_link
 static void
-print_link(void *cpu_env, const struct syscallname *name,
+print_link(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2330,7 +2330,7 @@ print_link(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_linkat
 static void
-print_linkat(void *cpu_env, const struct syscallname *name,
+print_linkat(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2346,7 +2346,7 @@ print_linkat(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR__llseek) || defined(TARGET_NR_llseek)
 static void
-print__llseek(void *cpu_env, const struct syscallname *name,
+print__llseek(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2369,7 +2369,7 @@ print__llseek(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_lseek
 static void
-print_lseek(void *cpu_env, const struct syscallname *name,
+print_lseek(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2400,7 +2400,7 @@ print_lseek(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_truncate
 static void
-print_truncate(void *cpu_env, const struct syscallname *name,
+print_truncate(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2413,7 +2413,7 @@ print_truncate(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_truncate64
 static void
-print_truncate64(void *cpu_env, const struct syscallname *name,
+print_truncate64(CPUArchState *cpu_env, const struct syscallname *name,
                  abi_long arg0, abi_long arg1, abi_long arg2,
                  abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2430,7 +2430,7 @@ print_truncate64(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_ftruncate64
 static void
-print_ftruncate64(void *cpu_env, const struct syscallname *name,
+print_ftruncate64(CPUArchState *cpu_env, const struct syscallname *name,
                   abi_long arg0, abi_long arg1, abi_long arg2,
                   abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2447,7 +2447,7 @@ print_ftruncate64(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mlockall
 static void
-print_mlockall(void *cpu_env, const struct syscallname *name,
+print_mlockall(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2459,7 +2459,7 @@ print_mlockall(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_socket)
 static void
-print_socket(void *cpu_env, const struct syscallname *name,
+print_socket(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2920,7 +2920,7 @@ static struct {
 };
 
 static void
-print_socketcall(void *cpu_env, const struct syscallname *name,
+print_socketcall(CPUArchState *cpu_env, const struct syscallname *name,
                  abi_long arg0, abi_long arg1, abi_long arg2,
                  abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2941,7 +2941,7 @@ print_socketcall(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_bind)
 static void
-print_bind(void *cpu_env, const struct syscallname *name,
+print_bind(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2955,7 +2955,7 @@ print_bind(void *cpu_env, const struct syscallname *name,
 #if defined(TARGET_NR_stat) || defined(TARGET_NR_stat64) || \
     defined(TARGET_NR_lstat) || defined(TARGET_NR_lstat64)
 static void
-print_stat(void *cpu_env, const struct syscallname *name,
+print_stat(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2971,7 +2971,7 @@ print_stat(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_fstat) || defined(TARGET_NR_fstat64)
 static void
-print_fstat(void *cpu_env, const struct syscallname *name,
+print_fstat(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2985,7 +2985,7 @@ print_fstat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mkdir
 static void
-print_mkdir(void *cpu_env, const struct syscallname *name,
+print_mkdir(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -2998,7 +2998,7 @@ print_mkdir(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mkdirat
 static void
-print_mkdirat(void *cpu_env, const struct syscallname *name,
+print_mkdirat(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3012,7 +3012,7 @@ print_mkdirat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rmdir
 static void
-print_rmdir(void *cpu_env, const struct syscallname *name,
+print_rmdir(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3024,7 +3024,7 @@ print_rmdir(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rt_sigaction
 static void
-print_rt_sigaction(void *cpu_env, const struct syscallname *name,
+print_rt_sigaction(CPUArchState *cpu_env, const struct syscallname *name,
                    abi_long arg0, abi_long arg1, abi_long arg2,
                    abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3038,7 +3038,7 @@ print_rt_sigaction(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rt_sigprocmask
 static void
-print_rt_sigprocmask(void *cpu_env, const struct syscallname *name,
+print_rt_sigprocmask(CPUArchState *cpu_env, const struct syscallname *name,
                      abi_long arg0, abi_long arg1, abi_long arg2,
                      abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3058,7 +3058,7 @@ print_rt_sigprocmask(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rt_sigqueueinfo
 static void
-print_rt_sigqueueinfo(void *cpu_env, const struct syscallname *name,
+print_rt_sigqueueinfo(CPUArchState *cpu_env, const struct syscallname *name,
                       abi_long arg0, abi_long arg1, abi_long arg2,
                       abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3083,7 +3083,7 @@ print_rt_sigqueueinfo(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rt_tgsigqueueinfo
 static void
-print_rt_tgsigqueueinfo(void *cpu_env, const struct syscallname *name,
+print_rt_tgsigqueueinfo(CPUArchState *cpu_env, const struct syscallname *name,
                         abi_long arg0, abi_long arg1, abi_long arg2,
                         abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3167,7 +3167,7 @@ print_syslog_action(abi_ulong arg, int last)
 }
 
 static void
-print_syslog(void *cpu_env, const struct syscallname *name,
+print_syslog(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3181,7 +3181,7 @@ print_syslog(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mknod
 static void
-print_mknod(void *cpu_env, const struct syscallname *name,
+print_mknod(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3200,7 +3200,7 @@ print_mknod(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mknodat
 static void
-print_mknodat(void *cpu_env, const struct syscallname *name,
+print_mknodat(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3220,7 +3220,7 @@ print_mknodat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mq_open
 static void
-print_mq_open(void *cpu_env, const struct syscallname *name,
+print_mq_open(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3239,7 +3239,7 @@ print_mq_open(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_open
 static void
-print_open(void *cpu_env, const struct syscallname *name,
+print_open(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3256,7 +3256,7 @@ print_open(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_openat
 static void
-print_openat(void *cpu_env, const struct syscallname *name,
+print_openat(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3274,7 +3274,7 @@ print_openat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mq_unlink
 static void
-print_mq_unlink(void *cpu_env, const struct syscallname *name,
+print_mq_unlink(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3286,7 +3286,7 @@ print_mq_unlink(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_fstatat64) || defined(TARGET_NR_newfstatat)
 static void
-print_fstatat64(void *cpu_env, const struct syscallname *name,
+print_fstatat64(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3302,7 +3302,7 @@ print_fstatat64(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_readlink
 static void
-print_readlink(void *cpu_env, const struct syscallname *name,
+print_readlink(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3316,7 +3316,7 @@ print_readlink(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_readlinkat
 static void
-print_readlinkat(void *cpu_env, const struct syscallname *name,
+print_readlinkat(CPUArchState *cpu_env, const struct syscallname *name,
                  abi_long arg0, abi_long arg1, abi_long arg2,
                  abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3331,7 +3331,7 @@ print_readlinkat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_rename
 static void
-print_rename(void *cpu_env, const struct syscallname *name,
+print_rename(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3344,7 +3344,7 @@ print_rename(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_renameat
 static void
-print_renameat(void *cpu_env, const struct syscallname *name,
+print_renameat(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3359,7 +3359,7 @@ print_renameat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_statfs
 static void
-print_statfs(void *cpu_env, const struct syscallname *name,
+print_statfs(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3372,7 +3372,7 @@ print_statfs(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_statfs64
 static void
-print_statfs64(void *cpu_env, const struct syscallname *name,
+print_statfs64(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3385,7 +3385,7 @@ print_statfs64(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_symlink
 static void
-print_symlink(void *cpu_env, const struct syscallname *name,
+print_symlink(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3398,7 +3398,7 @@ print_symlink(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_symlinkat
 static void
-print_symlinkat(void *cpu_env, const struct syscallname *name,
+print_symlinkat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3412,7 +3412,7 @@ print_symlinkat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mount
 static void
-print_mount(void *cpu_env, const struct syscallname *name,
+print_mount(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3428,7 +3428,7 @@ print_mount(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_umount
 static void
-print_umount(void *cpu_env, const struct syscallname *name,
+print_umount(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3440,7 +3440,7 @@ print_umount(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_umount2
 static void
-print_umount2(void *cpu_env, const struct syscallname *name,
+print_umount2(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3453,7 +3453,7 @@ print_umount2(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_unlink
 static void
-print_unlink(void *cpu_env, const struct syscallname *name,
+print_unlink(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3465,7 +3465,7 @@ print_unlink(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_unlinkat
 static void
-print_unlinkat(void *cpu_env, const struct syscallname *name,
+print_unlinkat(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3479,7 +3479,7 @@ print_unlinkat(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_unshare
 static void
-print_unshare(void *cpu_env, const struct syscallname *name,
+print_unshare(CPUArchState *cpu_env, const struct syscallname *name,
               abi_long arg0, abi_long arg1, abi_long arg2,
               abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3491,7 +3491,7 @@ print_unshare(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_utime
 static void
-print_utime(void *cpu_env, const struct syscallname *name,
+print_utime(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3504,7 +3504,7 @@ print_utime(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_utimes
 static void
-print_utimes(void *cpu_env, const struct syscallname *name,
+print_utimes(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3517,7 +3517,7 @@ print_utimes(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_utimensat
 static void
-print_utimensat(void *cpu_env, const struct syscallname *name,
+print_utimensat(CPUArchState *cpu_env, const struct syscallname *name,
                 abi_long arg0, abi_long arg1, abi_long arg2,
                 abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3532,7 +3532,7 @@ print_utimensat(void *cpu_env, const struct syscallname *name,
 
 #if defined(TARGET_NR_mmap) || defined(TARGET_NR_mmap2)
 static void
-print_mmap(void *cpu_env, const struct syscallname *name,
+print_mmap(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3550,7 +3550,7 @@ print_mmap(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_mprotect
 static void
-print_mprotect(void *cpu_env, const struct syscallname *name,
+print_mprotect(CPUArchState *cpu_env, const struct syscallname *name,
                abi_long arg0, abi_long arg1, abi_long arg2,
                abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3564,7 +3564,7 @@ print_mprotect(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_munmap
 static void
-print_munmap(void *cpu_env, const struct syscallname *name,
+print_munmap(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3617,7 +3617,7 @@ if( cmd == val ) { \
 }
 
 static void
-print_futex(void *cpu_env, const struct syscallname *name,
+print_futex(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3634,7 +3634,7 @@ print_futex(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_kill
 static void
-print_kill(void *cpu_env, const struct syscallname *name,
+print_kill(CPUArchState *cpu_env, const struct syscallname *name,
            abi_long arg0, abi_long arg1, abi_long arg2,
            abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3647,7 +3647,7 @@ print_kill(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_tkill
 static void
-print_tkill(void *cpu_env, const struct syscallname *name,
+print_tkill(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3660,7 +3660,7 @@ print_tkill(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_tgkill
 static void
-print_tgkill(void *cpu_env, const struct syscallname *name,
+print_tgkill(CPUArchState *cpu_env, const struct syscallname *name,
              abi_long arg0, abi_long arg1, abi_long arg2,
              abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3674,7 +3674,7 @@ print_tgkill(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_statx
 static void
-print_statx(void *cpu_env, const struct syscallname *name,
+print_statx(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3690,7 +3690,7 @@ print_statx(void *cpu_env, const struct syscallname *name,
 
 #ifdef TARGET_NR_ioctl
 static void
-print_ioctl(void *cpu_env, const struct syscallname *name,
+print_ioctl(CPUArchState *cpu_env, const struct syscallname *name,
             abi_long arg0, abi_long arg1, abi_long arg2,
             abi_long arg3, abi_long arg4, abi_long arg5)
 {
@@ -3775,7 +3775,7 @@ static int nsyscalls = ARRAY_SIZE(scnames);
  * The public interface to this module.
  */
 void
-print_syscall(void *cpu_env, int num,
+print_syscall(CPUArchState *cpu_env, int num,
               abi_long arg1, abi_long arg2, abi_long arg3,
               abi_long arg4, abi_long arg5, abi_long arg6)
 {
@@ -3804,7 +3804,7 @@ print_syscall(void *cpu_env, int num,
 
 
 void
-print_syscall_ret(void *cpu_env, int num, abi_long ret,
+print_syscall_ret(CPUArchState *cpu_env, int num, abi_long ret,
                   abi_long arg1, abi_long arg2, abi_long arg3,
                   abi_long arg4, abi_long arg5, abi_long arg6)
 {
diff --git a/linux-user/strace.h b/linux-user/strace.h
index 1e232d07fc85..d5e7f26bcb83 100644
--- a/linux-user/strace.h
+++ b/linux-user/strace.h
@@ -18,10 +18,10 @@
 #ifndef LINUX_USER_STRACE_H
 #define LINUX_USER_STRACE_H
 
-void print_syscall(void *cpu_env, int num,
+void print_syscall(CPUArchState *cpu_env, int num,
                    abi_long arg1, abi_long arg2, abi_long arg3,
                    abi_long arg4, abi_long arg5, abi_long arg6);
-void print_syscall_ret(void *cpu_env, int num, abi_long ret,
+void print_syscall_ret(CPUArchState *cpu_env, int num, abi_long ret,
                        abi_long arg1, abi_long arg2, abi_long arg3,
                        abi_long arg4, abi_long arg5, abi_long arg6);
 /**
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 488facb3560e..2395988e66cb 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1598,7 +1598,7 @@ static abi_long do_pipe2(int host_pipe[], int flags)
 #endif
 }
 
-static abi_long do_pipe(void *cpu_env, abi_ulong pipedes,
+static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
                         int flags, int is_pipe2)
 {
     int host_pipe[2];
@@ -7252,7 +7252,7 @@ void syscall_init(void)
 }
 
 #ifdef TARGET_NR_truncate64
-static inline abi_long target_truncate64(void *cpu_env, const char *arg1,
+static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1,
                                          abi_long arg2,
                                          abi_long arg3,
                                          abi_long arg4)
@@ -7266,7 +7266,7 @@ static inline abi_long target_truncate64(void *cpu_env, const char *arg1,
 #endif
 
 #ifdef TARGET_NR_ftruncate64
-static inline abi_long target_ftruncate64(void *cpu_env, abi_long arg1,
+static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
                                           abi_long arg2,
                                           abi_long arg3,
                                           abi_long arg4)
@@ -7561,7 +7561,7 @@ static inline int target_to_host_mlockall_arg(int arg)
 #if (defined(TARGET_NR_stat64) || defined(TARGET_NR_lstat64) ||     \
      defined(TARGET_NR_fstat64) || defined(TARGET_NR_fstatat64) ||  \
      defined(TARGET_NR_newfstatat))
-static inline abi_long host_to_target_stat64(void *cpu_env,
+static inline abi_long host_to_target_stat64(CPUArchState *cpu_env,
                                              abi_ulong target_addr,
                                              struct stat *host_st)
 {
@@ -7963,7 +7963,7 @@ int host_to_target_waitstatus(int status)
     return status;
 }
 
-static int open_self_cmdline(void *cpu_env, int fd)
+static int open_self_cmdline(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     struct linux_binprm *bprm = ((TaskState *)cpu->opaque)->bprm;
@@ -7980,7 +7980,7 @@ static int open_self_cmdline(void *cpu_env, int fd)
     return 0;
 }
 
-static int open_self_maps(void *cpu_env, int fd)
+static int open_self_maps(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     TaskState *ts = cpu->opaque;
@@ -8042,7 +8042,7 @@ static int open_self_maps(void *cpu_env, int fd)
     return 0;
 }
 
-static int open_self_stat(void *cpu_env, int fd)
+static int open_self_stat(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     TaskState *ts = cpu->opaque;
@@ -8080,7 +8080,7 @@ static int open_self_stat(void *cpu_env, int fd)
     return 0;
 }
 
-static int open_self_auxv(void *cpu_env, int fd)
+static int open_self_auxv(CPUArchState *cpu_env, int fd)
 {
     CPUState *cpu = env_cpu((CPUArchState *)cpu_env);
     TaskState *ts = cpu->opaque;
@@ -8143,7 +8143,7 @@ static int is_proc(const char *filename, const char *entry)
 #endif
 
 #if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
-static int open_net_route(void *cpu_env, int fd)
+static int open_net_route(CPUArchState *cpu_env, int fd)
 {
     FILE *fp;
     char *line = NULL;
@@ -8188,7 +8188,7 @@ static int open_net_route(void *cpu_env, int fd)
 #endif
 
 #if defined(TARGET_SPARC)
-static int open_cpuinfo(void *cpu_env, int fd)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
     dprintf(fd, "type\t\t: sun4u\n");
     return 0;
@@ -8196,7 +8196,7 @@ static int open_cpuinfo(void *cpu_env, int fd)
 #endif
 
 #if defined(TARGET_HPPA)
-static int open_cpuinfo(void *cpu_env, int fd)
+static int open_cpuinfo(CPUArchState *cpu_env, int fd)
 {
     dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
     dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
@@ -8208,18 +8208,18 @@ static int open_cpuinfo(void *cpu_env, int fd)
 #endif
 
 #if defined(TARGET_M68K)
-static int open_hardware(void *cpu_env, int fd)
+static int open_hardware(CPUArchState *cpu_env, int fd)
 {
     dprintf(fd, "Model:\t\tqemu-m68k\n");
     return 0;
 }
 #endif
 
-static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
+static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int flags, mode_t mode)
 {
     struct fake_open {
         const char *filename;
-        int (*fill)(void *cpu_env, int fd);
+        int (*fill)(CPUArchState *cpu_env, int fd);
         int (*cmp)(const char *s1, const char *s2);
     };
     const struct fake_open *fake_open;
@@ -8531,7 +8531,7 @@ _syscall2(int, pivot_root, const char *, new_root, const char *, put_old)
  * of syscall results, can be performed.
  * All errnos that do_syscall() returns must be -TARGET_<errcode>.
  */
-static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
+static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                             abi_long arg2, abi_long arg3, abi_long arg4,
                             abi_long arg5, abi_long arg6, abi_long arg7,
                             abi_long arg8)
@@ -13155,7 +13155,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
     return ret;
 }
 
-abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
+abi_long do_syscall(CPUArchState *cpu_env, int num, abi_long arg1,
                     abi_long arg2, abi_long arg3, abi_long arg4,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8)
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 415fdf31b62d..1e3e98156da0 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -28,7 +28,7 @@
  * NB: the default emulated CPU ("any") might not match any existing CPU, e.g.
  * on ARM it has all features turned on, so there is no perfect arch string to
  * return here */
-const char *cpu_to_uname_machine(void *cpu_env)
+const char *cpu_to_uname_machine(CPUArchState *cpu_env)
 {
 #if defined(TARGET_ARM) && !defined(TARGET_AARCH64)
 
diff --git a/linux-user/uname.h b/linux-user/uname.h
index 4503094211f9..4ae563f46c29 100644
--- a/linux-user/uname.h
+++ b/linux-user/uname.h
@@ -4,7 +4,7 @@
 #include <sys/utsname.h>
 #include <linux/utsname.h>
 
-const char *cpu_to_uname_machine(void *cpu_env);
+const char *cpu_to_uname_machine(CPUArchState *cpu_env);
 int sys_uname(struct new_utsname *buf);
 
 #endif /* UNAME_H */
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index ddc260e465dc..0bb26331c171 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -59,7 +59,7 @@ int info_is_fdpic(struct image_info *info);
 
 void target_set_brk(abi_ulong new_brk);
 void syscall_init(void);
-abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
+abi_long do_syscall(CPUArchState *cpu_env, int num, abi_long arg1,
                     abi_long arg2, abi_long arg3, abi_long arg4,
                     abi_long arg5, abi_long arg6, abi_long arg7,
                     abi_long arg8);
@@ -132,22 +132,22 @@ void print_termios(void *arg);
 
 /* ARM EABI and MIPS expect 64bit types aligned even on pairs or registers */
 #ifdef TARGET_ARM
-static inline int regpairs_aligned(void *cpu_env, int num)
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
     return ((((CPUARMState *)cpu_env)->eabi) == 1) ;
 }
 #elif defined(TARGET_MIPS) && defined(TARGET_ABI_MIPSO32)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
 #elif defined(TARGET_PPC) && !defined(TARGET_PPC64)
 /*
  * SysV AVI for PPC32 expects 64bit parameters to be passed on odd/even pairs
  * of registers which translates to the same as ARM/MIPS, because we start with
  * r3 as arg1
  */
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
 #elif defined(TARGET_SH4)
 /* SH4 doesn't align register pairs, except for p{read,write}64 */
-static inline int regpairs_aligned(void *cpu_env, int num)
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num)
 {
     switch (num) {
     case TARGET_NR_pread64:
@@ -159,11 +159,11 @@ static inline int regpairs_aligned(void *cpu_env, int num)
     }
 }
 #elif defined(TARGET_XTENSA)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
 #elif defined(TARGET_HEXAGON)
-static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 1; }
 #else
-static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
+static inline int regpairs_aligned(CPUArchState *cpu_env, int num) { return 0; }
 #endif
 
 /**
-- 
2.36.1


