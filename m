Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2749131E35D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 01:03:42 +0100 (CET)
Received: from localhost ([::1]:43402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWnF-0002CX-1V
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 19:03:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWSE-0001Dv-J3
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:58 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRy-0004uf-2j
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:58 -0500
Received: by mail-pf1-x432.google.com with SMTP id c11so22277pfp.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4EPmjuaGE7ZBBXtu7+OR7f/4m7lqfO4FggB5/JvTrYU=;
 b=Igk+HgTnTVA4GfQIt5CeReajT8e5RmsH18Ejm96CRwDrznNarsdPIPbd0+pCq43hr+
 m3q9UwBP+/SywDkA1zgmLIslAZv/nQWeEDfaXIYf7eNB8fWzgIlOkCwJ353nABPNb7bc
 /6O4vpnyfhFSqO2MOLjOvo4GqLma8xrUNvVSdHoqfYvnnddPQdo8eYYM7uJ7iD9IhKhR
 PATa24lWYwDxiyLVdXHycofj98Locyf7Pv9K8NsEZgdZkT9bzJnDQYnFjVXwLfWGr2LV
 87C7EC/ee+4jtdXsUxdXp5OAzTKjnwdaVZbBTsO9iQOEq9zeX1ZsFGy45Qe1ZB7isW5q
 05Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4EPmjuaGE7ZBBXtu7+OR7f/4m7lqfO4FggB5/JvTrYU=;
 b=DT9unz55dFeM2KuzFl6Qp+Ff+uzbW9bC0tZ6iF3GnWJuuL0n7xpaPEt2Poo9lAQ3TP
 G/DZlk2QhUXqIX2+/qW3iSXDGHKRBPy6P/beUxlDs5FTzIb7n5wslazSTWEmHd859pOa
 SYND+Wk3+zLOFKCRN09CK+Y+LFyRg9jCORauxYrTxb89NDJZaj7JtBoXV6mkh0W8Qdvc
 ynqEWZW1JSlN9gYNsdik7CSj3AR85uWIwmz/eojhGmL9owN3QVBwQGiYGsaSEBjajgsB
 4dA1n+mX8aRn53hParYwrGewsfPFtYzJLVOmUtNr3/4366x+zW3zgYpoxvU+LQB6fCwz
 s2mg==
X-Gm-Message-State: AOAM5307XZsqqFly7z5RPScuwyRMhwWwvC91c2ogM5MQAxv/8uaylLyo
 5HAzOM3UgNVqHcNqIvk62KgAfZWZi805yA==
X-Google-Smtp-Source: ABdhPJwxZkcpi3RNEpKw+ouZnG4wYxwgLxbIPFLVYdz/h7Kkbb2AFA0fL18I2B4Vdvg+athot6VROA==
X-Received: by 2002:aa7:991c:0:b029:1e8:b29:cd69 with SMTP id
 z28-20020aa7991c0000b02901e80b29cd69mr1619827pff.50.1613605297067; 
 Wed, 17 Feb 2021 15:41:37 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/35] Hexagon (linux-user/hexagon) Linux user emulation
Date: Wed, 17 Feb 2021 15:40:19 -0800
Message-Id: <20210217234023.1742406-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Implementation of Linux user emulation for Hexagon
Some common files modified in addition to new files in linux-user/hexagon

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-31-git-send-email-tsimpson@quicinc.com>
[rth: Fix termbits.h on review by Laurent]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/hexagon/sockbits.h       |  18 ++
 linux-user/hexagon/syscall_nr.h     | 322 ++++++++++++++++++++++++++++
 linux-user/hexagon/target_cpu.h     |  44 ++++
 linux-user/hexagon/target_elf.h     |  40 ++++
 linux-user/hexagon/target_fcntl.h   |  18 ++
 linux-user/hexagon/target_signal.h  |  34 +++
 linux-user/hexagon/target_structs.h |  54 +++++
 linux-user/hexagon/target_syscall.h |  36 ++++
 linux-user/hexagon/termbits.h       |  18 ++
 linux-user/qemu.h                   |   2 +
 linux-user/syscall_defs.h           |  33 +++
 linux-user/elfload.c                |  16 ++
 linux-user/hexagon/cpu_loop.c       | 100 +++++++++
 linux-user/hexagon/signal.c         | 276 ++++++++++++++++++++++++
 scripts/gensyscalls.sh              |   1 +
 15 files changed, 1012 insertions(+)
 create mode 100644 linux-user/hexagon/sockbits.h
 create mode 100644 linux-user/hexagon/syscall_nr.h
 create mode 100644 linux-user/hexagon/target_cpu.h
 create mode 100644 linux-user/hexagon/target_elf.h
 create mode 100644 linux-user/hexagon/target_fcntl.h
 create mode 100644 linux-user/hexagon/target_signal.h
 create mode 100644 linux-user/hexagon/target_structs.h
 create mode 100644 linux-user/hexagon/target_syscall.h
 create mode 100644 linux-user/hexagon/termbits.h
 create mode 100644 linux-user/hexagon/cpu_loop.c
 create mode 100644 linux-user/hexagon/signal.c

diff --git a/linux-user/hexagon/sockbits.h b/linux-user/hexagon/sockbits.h
new file mode 100644
index 0000000000..b7ad5dc60e
--- /dev/null
+++ b/linux-user/hexagon/sockbits.h
@@ -0,0 +1,18 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "../generic/sockbits.h"
diff --git a/linux-user/hexagon/syscall_nr.h b/linux-user/hexagon/syscall_nr.h
new file mode 100644
index 0000000000..da1314f713
--- /dev/null
+++ b/linux-user/hexagon/syscall_nr.h
@@ -0,0 +1,322 @@
+/*
+ * This file contains the system call numbers.
+ * Do not modify.
+ * This file is generated by scripts/gensyscalls.sh
+ */
+#ifndef LINUX_USER_HEXAGON_SYSCALL_NR_H
+#define LINUX_USER_HEXAGON_SYSCALL_NR_H
+
+#define TARGET_NR_io_setup 0
+#define TARGET_NR_io_destroy 1
+#define TARGET_NR_io_submit 2
+#define TARGET_NR_io_cancel 3
+#define TARGET_NR_io_getevents 4
+#define TARGET_NR_setxattr 5
+#define TARGET_NR_lsetxattr 6
+#define TARGET_NR_fsetxattr 7
+#define TARGET_NR_getxattr 8
+#define TARGET_NR_lgetxattr 9
+#define TARGET_NR_fgetxattr 10
+#define TARGET_NR_listxattr 11
+#define TARGET_NR_llistxattr 12
+#define TARGET_NR_flistxattr 13
+#define TARGET_NR_removexattr 14
+#define TARGET_NR_lremovexattr 15
+#define TARGET_NR_fremovexattr 16
+#define TARGET_NR_getcwd 17
+#define TARGET_NR_lookup_dcookie 18
+#define TARGET_NR_eventfd2 19
+#define TARGET_NR_epoll_create1 20
+#define TARGET_NR_epoll_ctl 21
+#define TARGET_NR_epoll_pwait 22
+#define TARGET_NR_dup 23
+#define TARGET_NR_dup3 24
+#define TARGET_NR_fcntl64 25
+#define TARGET_NR_inotify_init1 26
+#define TARGET_NR_inotify_add_watch 27
+#define TARGET_NR_inotify_rm_watch 28
+#define TARGET_NR_ioctl 29
+#define TARGET_NR_ioprio_set 30
+#define TARGET_NR_ioprio_get 31
+#define TARGET_NR_flock 32
+#define TARGET_NR_mknodat 33
+#define TARGET_NR_mkdirat 34
+#define TARGET_NR_unlinkat 35
+#define TARGET_NR_symlinkat 36
+#define TARGET_NR_linkat 37
+#define TARGET_NR_renameat 38
+#define TARGET_NR_umount2 39
+#define TARGET_NR_mount 40
+#define TARGET_NR_pivot_root 41
+#define TARGET_NR_nfsservctl 42
+#define TARGET_NR_statfs64 43
+#define TARGET_NR_fstatfs64 44
+#define TARGET_NR_truncate64 45
+#define TARGET_NR_ftruncate64 46
+#define TARGET_NR_fallocate 47
+#define TARGET_NR_faccessat 48
+#define TARGET_NR_chdir 49
+#define TARGET_NR_fchdir 50
+#define TARGET_NR_chroot 51
+#define TARGET_NR_fchmod 52
+#define TARGET_NR_fchmodat 53
+#define TARGET_NR_fchownat 54
+#define TARGET_NR_fchown 55
+#define TARGET_NR_openat 56
+#define TARGET_NR_close 57
+#define TARGET_NR_vhangup 58
+#define TARGET_NR_pipe2 59
+#define TARGET_NR_quotactl 60
+#define TARGET_NR_getdents64 61
+#define TARGET_NR_llseek 62
+#define TARGET_NR_read 63
+#define TARGET_NR_write 64
+#define TARGET_NR_readv 65
+#define TARGET_NR_writev 66
+#define TARGET_NR_pread64 67
+#define TARGET_NR_pwrite64 68
+#define TARGET_NR_preadv 69
+#define TARGET_NR_pwritev 70
+#define TARGET_NR_sendfile64 71
+#define TARGET_NR_pselect6 72
+#define TARGET_NR_ppoll 73
+#define TARGET_NR_signalfd4 74
+#define TARGET_NR_vmsplice 75
+#define TARGET_NR_splice 76
+#define TARGET_NR_tee 77
+#define TARGET_NR_readlinkat 78
+#define TARGET_NR_fstatat64 79
+#define TARGET_NR_fstat64 80
+#define TARGET_NR_sync 81
+#define TARGET_NR_fsync 82
+#define TARGET_NR_fdatasync 83
+#define TARGET_NR_sync_file_range 84
+#define TARGET_NR_timerfd_create 85
+#define TARGET_NR_timerfd_settime 86
+#define TARGET_NR_timerfd_gettime 87
+#define TARGET_NR_utimensat 88
+#define TARGET_NR_acct 89
+#define TARGET_NR_capget 90
+#define TARGET_NR_capset 91
+#define TARGET_NR_personality 92
+#define TARGET_NR_exit 93
+#define TARGET_NR_exit_group 94
+#define TARGET_NR_waitid 95
+#define TARGET_NR_set_tid_address 96
+#define TARGET_NR_unshare 97
+#define TARGET_NR_futex 98
+#define TARGET_NR_set_robust_list 99
+#define TARGET_NR_get_robust_list 100
+#define TARGET_NR_nanosleep 101
+#define TARGET_NR_getitimer 102
+#define TARGET_NR_setitimer 103
+#define TARGET_NR_kexec_load 104
+#define TARGET_NR_init_module 105
+#define TARGET_NR_delete_module 106
+#define TARGET_NR_timer_create 107
+#define TARGET_NR_timer_gettime 108
+#define TARGET_NR_timer_getoverrun 109
+#define TARGET_NR_timer_settime 110
+#define TARGET_NR_timer_delete 111
+#define TARGET_NR_clock_settime 112
+#define TARGET_NR_clock_gettime 113
+#define TARGET_NR_clock_getres 114
+#define TARGET_NR_clock_nanosleep 115
+#define TARGET_NR_syslog 116
+#define TARGET_NR_ptrace 117
+#define TARGET_NR_sched_setparam 118
+#define TARGET_NR_sched_setscheduler 119
+#define TARGET_NR_sched_getscheduler 120
+#define TARGET_NR_sched_getparam 121
+#define TARGET_NR_sched_setaffinity 122
+#define TARGET_NR_sched_getaffinity 123
+#define TARGET_NR_sched_yield 124
+#define TARGET_NR_sched_get_priority_max 125
+#define TARGET_NR_sched_get_priority_min 126
+#define TARGET_NR_sched_rr_get_interval 127
+#define TARGET_NR_restart_syscall 128
+#define TARGET_NR_kill 129
+#define TARGET_NR_tkill 130
+#define TARGET_NR_tgkill 131
+#define TARGET_NR_sigaltstack 132
+#define TARGET_NR_rt_sigsuspend 133
+#define TARGET_NR_rt_sigaction 134
+#define TARGET_NR_rt_sigprocmask 135
+#define TARGET_NR_rt_sigpending 136
+#define TARGET_NR_rt_sigtimedwait 137
+#define TARGET_NR_rt_sigqueueinfo 138
+#define TARGET_NR_rt_sigreturn 139
+#define TARGET_NR_setpriority 140
+#define TARGET_NR_getpriority 141
+#define TARGET_NR_reboot 142
+#define TARGET_NR_setregid 143
+#define TARGET_NR_setgid 144
+#define TARGET_NR_setreuid 145
+#define TARGET_NR_setuid 146
+#define TARGET_NR_setresuid 147
+#define TARGET_NR_getresuid 148
+#define TARGET_NR_setresgid 149
+#define TARGET_NR_getresgid 150
+#define TARGET_NR_setfsuid 151
+#define TARGET_NR_setfsgid 152
+#define TARGET_NR_times 153
+#define TARGET_NR_setpgid 154
+#define TARGET_NR_getpgid 155
+#define TARGET_NR_getsid 156
+#define TARGET_NR_setsid 157
+#define TARGET_NR_getgroups 158
+#define TARGET_NR_setgroups 159
+#define TARGET_NR_uname 160
+#define TARGET_NR_sethostname 161
+#define TARGET_NR_setdomainname 162
+#define TARGET_NR_getrlimit 163
+#define TARGET_NR_setrlimit 164
+#define TARGET_NR_getrusage 165
+#define TARGET_NR_umask 166
+#define TARGET_NR_prctl 167
+#define TARGET_NR_getcpu 168
+#define TARGET_NR_gettimeofday 169
+#define TARGET_NR_settimeofday 170
+#define TARGET_NR_adjtimex 171
+#define TARGET_NR_getpid 172
+#define TARGET_NR_getppid 173
+#define TARGET_NR_getuid 174
+#define TARGET_NR_geteuid 175
+#define TARGET_NR_getgid 176
+#define TARGET_NR_getegid 177
+#define TARGET_NR_gettid 178
+#define TARGET_NR_sysinfo 179
+#define TARGET_NR_mq_open 180
+#define TARGET_NR_mq_unlink 181
+#define TARGET_NR_mq_timedsend 182
+#define TARGET_NR_mq_timedreceive 183
+#define TARGET_NR_mq_notify 184
+#define TARGET_NR_mq_getsetattr 185
+#define TARGET_NR_msgget 186
+#define TARGET_NR_msgctl 187
+#define TARGET_NR_msgrcv 188
+#define TARGET_NR_msgsnd 189
+#define TARGET_NR_semget 190
+#define TARGET_NR_semctl 191
+#define TARGET_NR_semtimedop 192
+#define TARGET_NR_semop 193
+#define TARGET_NR_shmget 194
+#define TARGET_NR_shmctl 195
+#define TARGET_NR_shmat 196
+#define TARGET_NR_shmdt 197
+#define TARGET_NR_socket 198
+#define TARGET_NR_socketpair 199
+#define TARGET_NR_bind 200
+#define TARGET_NR_listen 201
+#define TARGET_NR_accept 202
+#define TARGET_NR_connect 203
+#define TARGET_NR_getsockname 204
+#define TARGET_NR_getpeername 205
+#define TARGET_NR_sendto 206
+#define TARGET_NR_recvfrom 207
+#define TARGET_NR_setsockopt 208
+#define TARGET_NR_getsockopt 209
+#define TARGET_NR_shutdown 210
+#define TARGET_NR_sendmsg 211
+#define TARGET_NR_recvmsg 212
+#define TARGET_NR_readahead 213
+#define TARGET_NR_brk 214
+#define TARGET_NR_munmap 215
+#define TARGET_NR_mremap 216
+#define TARGET_NR_add_key 217
+#define TARGET_NR_request_key 218
+#define TARGET_NR_keyctl 219
+#define TARGET_NR_clone 220
+#define TARGET_NR_execve 221
+#define TARGET_NR_mmap2 222
+#define TARGET_NR_fadvise64_64 223
+#define TARGET_NR_swapon 224
+#define TARGET_NR_swapoff 225
+#define TARGET_NR_mprotect 226
+#define TARGET_NR_msync 227
+#define TARGET_NR_mlock 228
+#define TARGET_NR_munlock 229
+#define TARGET_NR_mlockall 230
+#define TARGET_NR_munlockall 231
+#define TARGET_NR_mincore 232
+#define TARGET_NR_madvise 233
+#define TARGET_NR_remap_file_pages 234
+#define TARGET_NR_mbind 235
+#define TARGET_NR_get_mempolicy 236
+#define TARGET_NR_set_mempolicy 237
+#define TARGET_NR_migrate_pages 238
+#define TARGET_NR_move_pages 239
+#define TARGET_NR_rt_tgsigqueueinfo 240
+#define TARGET_NR_perf_event_open 241
+#define TARGET_NR_accept4 242
+#define TARGET_NR_recvmmsg 243
+#define TARGET_NR_arch_specific_syscall 244
+#define TARGET_NR_wait4 260
+#define TARGET_NR_prlimit64 261
+#define TARGET_NR_fanotify_init 262
+#define TARGET_NR_fanotify_mark 263
+#define TARGET_NR_name_to_handle_at 264
+#define TARGET_NR_open_by_handle_at 265
+#define TARGET_NR_clock_adjtime 266
+#define TARGET_NR_syncfs 267
+#define TARGET_NR_setns 268
+#define TARGET_NR_sendmmsg 269
+#define TARGET_NR_process_vm_readv 270
+#define TARGET_NR_process_vm_writev 271
+#define TARGET_NR_kcmp 272
+#define TARGET_NR_finit_module 273
+#define TARGET_NR_sched_setattr 274
+#define TARGET_NR_sched_getattr 275
+#define TARGET_NR_renameat2 276
+#define TARGET_NR_seccomp 277
+#define TARGET_NR_getrandom 278
+#define TARGET_NR_memfd_create 279
+#define TARGET_NR_bpf 280
+#define TARGET_NR_execveat 281
+#define TARGET_NR_userfaultfd 282
+#define TARGET_NR_membarrier 283
+#define TARGET_NR_mlock2 284
+#define TARGET_NR_copy_file_range 285
+#define TARGET_NR_preadv2 286
+#define TARGET_NR_pwritev2 287
+#define TARGET_NR_pkey_mprotect 288
+#define TARGET_NR_pkey_alloc 289
+#define TARGET_NR_pkey_free 290
+#define TARGET_NR_statx 291
+#define TARGET_NR_io_pgetevents 292
+#define TARGET_NR_rseq 293
+#define TARGET_NR_kexec_file_load 294
+#define TARGET_NR_clock_gettime64 403
+#define TARGET_NR_clock_settime64 404
+#define TARGET_NR_clock_adjtime64 405
+#define TARGET_NR_clock_getres_time64 406
+#define TARGET_NR_clock_nanosleep_time64 407
+#define TARGET_NR_timer_gettime64 408
+#define TARGET_NR_timer_settime64 409
+#define TARGET_NR_timerfd_gettime64 410
+#define TARGET_NR_timerfd_settime64 411
+#define TARGET_NR_utimensat_time64 412
+#define TARGET_NR_pselect6_time64 413
+#define TARGET_NR_ppoll_time64 414
+#define TARGET_NR_io_pgetevents_time64 416
+#define TARGET_NR_recvmmsg_time64 417
+#define TARGET_NR_mq_timedsend_time64 418
+#define TARGET_NR_mq_timedreceive_time64 419
+#define TARGET_NR_semtimedop_time64 420
+#define TARGET_NR_rt_sigtimedwait_time64 421
+#define TARGET_NR_futex_time64 422
+#define TARGET_NR_sched_rr_get_interval_time64 423
+#define TARGET_NR_pidfd_send_signal 424
+#define TARGET_NR_io_uring_setup 425
+#define TARGET_NR_io_uring_enter 426
+#define TARGET_NR_io_uring_register 427
+#define TARGET_NR_open_tree 428
+#define TARGET_NR_move_mount 429
+#define TARGET_NR_fsopen 430
+#define TARGET_NR_fsconfig 431
+#define TARGET_NR_fsmount 432
+#define TARGET_NR_fspick 433
+#define TARGET_NR_pidfd_open 434
+#define TARGET_NR_syscalls 436
+
+#endif /* LINUX_USER_HEXAGON_SYSCALL_NR_H */
diff --git a/linux-user/hexagon/target_cpu.h b/linux-user/hexagon/target_cpu.h
new file mode 100644
index 0000000000..ecb76e9268
--- /dev/null
+++ b/linux-user/hexagon/target_cpu.h
@@ -0,0 +1,44 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_TARGET_CPU_H
+#define HEXAGON_TARGET_CPU_H
+
+static inline void cpu_clone_regs_child(CPUHexagonState *env,
+                                        target_ulong newsp, unsigned flags)
+{
+    if (newsp) {
+        env->gpr[HEX_REG_SP] = newsp;
+    }
+    env->gpr[0] = 0;
+}
+
+static inline void cpu_clone_regs_parent(CPUHexagonState *env, unsigned flags)
+{
+}
+
+static inline void cpu_set_tls(CPUHexagonState *env, target_ulong newtls)
+{
+    env->gpr[HEX_REG_UGP] = newtls;
+}
+
+static inline abi_ulong get_sp_from_cpustate(CPUHexagonState *state)
+{
+    return state->gpr[HEX_REG_SP];
+}
+
+#endif
diff --git a/linux-user/hexagon/target_elf.h b/linux-user/hexagon/target_elf.h
new file mode 100644
index 0000000000..b4e9f40527
--- /dev/null
+++ b/linux-user/hexagon/target_elf.h
@@ -0,0 +1,40 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_TARGET_ELF_H
+#define HEXAGON_TARGET_ELF_H
+
+static inline const char *cpu_get_model(uint32_t eflags)
+{
+    /* For now, treat anything newer than v5 as a v67 */
+    /* FIXME - Disable instructions that are newer than the specified arch */
+    if (eflags == 0x04 ||    /* v5  */
+        eflags == 0x05 ||    /* v55 */
+        eflags == 0x60 ||    /* v60 */
+        eflags == 0x61 ||    /* v61 */
+        eflags == 0x62 ||    /* v62 */
+        eflags == 0x65 ||    /* v65 */
+        eflags == 0x66 ||    /* v66 */
+        eflags == 0x67 ||    /* v67 */
+        eflags == 0x8067     /* v67t */
+       ) {
+        return "v67";
+    }
+    return "unknown";
+}
+
+#endif
diff --git a/linux-user/hexagon/target_fcntl.h b/linux-user/hexagon/target_fcntl.h
new file mode 100644
index 0000000000..2892db8098
--- /dev/null
+++ b/linux-user/hexagon/target_fcntl.h
@@ -0,0 +1,18 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "../generic/fcntl.h"
diff --git a/linux-user/hexagon/target_signal.h b/linux-user/hexagon/target_signal.h
new file mode 100644
index 0000000000..345cf1cbb8
--- /dev/null
+++ b/linux-user/hexagon/target_signal.h
@@ -0,0 +1,34 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_TARGET_SIGNAL_H
+#define HEXAGON_TARGET_SIGNAL_H
+
+typedef struct target_sigaltstack {
+    abi_ulong ss_sp;
+    abi_int ss_flags;
+    abi_ulong ss_size;
+} target_stack_t;
+
+#define TARGET_SS_ONSTACK 1
+#define TARGET_SS_DISABLE 2
+
+#define TARGET_MINSIGSTKSZ 2048
+
+#include "../generic/signal.h"
+
+#endif /* TARGET_SIGNAL_H */
diff --git a/linux-user/hexagon/target_structs.h b/linux-user/hexagon/target_structs.h
new file mode 100644
index 0000000000..c217d9442a
--- /dev/null
+++ b/linux-user/hexagon/target_structs.h
@@ -0,0 +1,54 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Hexagon specific structures for linux-user
+ */
+#ifndef HEXAGON_TARGET_STRUCTS_H
+#define HEXAGON_TARGET_STRUCTS_H
+
+struct target_ipc_perm {
+    abi_int __key;                      /* Key.  */
+    abi_uint uid;                       /* Owner's user ID.  */
+    abi_uint gid;                       /* Owner's group ID.  */
+    abi_uint cuid;                      /* Creator's user ID.  */
+    abi_uint cgid;                      /* Creator's group ID.  */
+    abi_ushort mode;                    /* Read/write permission.  */
+    abi_ushort __pad1;
+    abi_ushort __seq;                   /* Sequence number.  */
+    abi_ushort __pad2;
+    abi_ulong __unused1;
+    abi_ulong __unused2;
+};
+
+struct target_shmid_ds {
+    struct target_ipc_perm shm_perm;    /* operation permission struct */
+    abi_long shm_segsz;                 /* size of segment in bytes */
+    abi_ulong shm_atime;                /* time of last shmat() */
+    abi_ulong __unused1;
+    abi_ulong shm_dtime;                /* time of last shmdt() */
+    abi_ulong __unused2;
+    abi_ulong shm_ctime;                /* time of last change by shmctl() */
+    abi_ulong __unused3;
+    abi_int shm_cpid;                   /* pid of creator */
+    abi_int shm_lpid;                   /* pid of last shmop */
+    abi_ulong shm_nattch;               /* number of current attaches */
+    abi_ulong __unused4;
+    abi_ulong __unused5;
+};
+
+#endif
diff --git a/linux-user/hexagon/target_syscall.h b/linux-user/hexagon/target_syscall.h
new file mode 100644
index 0000000000..7f91a4abc7
--- /dev/null
+++ b/linux-user/hexagon/target_syscall.h
@@ -0,0 +1,36 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_TARGET_SYSCALL_H
+#define HEXAGON_TARGET_SYSCALL_H
+
+struct target_pt_regs {
+    abi_long sepc;
+    abi_long sp;
+};
+
+#define UNAME_MACHINE "hexagon"
+#define UNAME_MINIMUM_RELEASE "4.15.0"
+
+#define TARGET_MLOCKALL_MCL_CURRENT 1
+#define TARGET_MLOCKALL_MCL_FUTURE  2
+
+#define TARGET_MCL_CURRENT  1
+#define TARGET_MCL_FUTURE   2
+#define TARGET_MCL_ONFAULT  4
+
+#endif
diff --git a/linux-user/hexagon/termbits.h b/linux-user/hexagon/termbits.h
new file mode 100644
index 0000000000..49f974cdde
--- /dev/null
+++ b/linux-user/hexagon/termbits.h
@@ -0,0 +1,18 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "../generic/termbits.h"
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index d25a5dafc0..52c981710b 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -718,6 +718,8 @@ static inline int regpairs_aligned(void *cpu_env, int num)
 }
 #elif defined(TARGET_XTENSA)
 static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
+#elif defined(TARGET_HEXAGON)
+static inline int regpairs_aligned(void *cpu_env, int num) { return 1; }
 #else
 static inline int regpairs_aligned(void *cpu_env, int num) { return 0; }
 #endif
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 46a960fccb..6823d8646c 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -104,6 +104,14 @@
 #define TARGET_IOC_WRITE  2U
 #define TARGET_IOC_READ   1U
 
+#elif defined(TARGET_HEXAGON)
+
+#define TARGET_IOC_SIZEBITS     14
+
+#define TARGET_IOC_NONE   0U
+#define TARGET_IOC_WRITE  1U
+#define TARGET_IOC_READ          2U
+
 #else
 #error unsupported CPU
 #endif
@@ -2253,6 +2261,31 @@ struct target_stat64 {
     uint64_t   st_ino;
 };
 
+#elif defined(TARGET_HEXAGON)
+
+struct target_stat {
+    unsigned long long st_dev;
+    unsigned long long st_ino;
+    unsigned int st_mode;
+    unsigned int st_nlink;
+    unsigned int st_uid;
+    unsigned int st_gid;
+    unsigned long long st_rdev;
+    target_ulong __pad1;
+    long long st_size;
+    target_long st_blksize;
+    int __pad2;
+    long long st_blocks;
+
+    target_long target_st_atime;
+    target_long target_st_atime_nsec;
+    target_long target_st_mtime;
+    target_long target_st_mtime_nsec;
+    target_long target_st_ctime;
+    target_long target_st_ctime_nsec;
+    int __unused[2];
+};
+
 #else
 #error unsupported CPU
 #endif
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 73d750c809..bab4237e90 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1514,6 +1514,22 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 
 #endif /* TARGET_XTENSA */
 
+#ifdef TARGET_HEXAGON
+
+#define ELF_START_MMAP 0x20000000
+
+#define ELF_CLASS       ELFCLASS32
+#define ELF_ARCH        EM_HEXAGON
+
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
+{
+    regs->sepc = infop->entry;
+    regs->sp = infop->start_stack;
+}
+
+#endif /* TARGET_HEXAGON */
+
 #ifndef ELF_PLATFORM
 #define ELF_PLATFORM (NULL)
 #endif
diff --git a/linux-user/hexagon/cpu_loop.c b/linux-user/hexagon/cpu_loop.c
new file mode 100644
index 0000000000..9a68ca05c3
--- /dev/null
+++ b/linux-user/hexagon/cpu_loop.c
@@ -0,0 +1,100 @@
+/*
+ *  qemu user cpu loop
+ *
+ *  Copyright (c) 2003-2008 Fabrice Bellard
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "cpu_loop-common.h"
+#include "internal.h"
+
+void cpu_loop(CPUHexagonState *env)
+{
+    CPUState *cs = CPU(hexagon_env_get_cpu(env));
+    int trapnr, signum, sigcode;
+    target_ulong sigaddr;
+    target_ulong syscallnum;
+    target_ulong ret;
+
+    for (;;) {
+        cpu_exec_start(cs);
+        trapnr = cpu_exec(cs);
+        cpu_exec_end(cs);
+        process_queued_cpu_work(cs);
+
+        signum = 0;
+        sigcode = 0;
+        sigaddr = 0;
+
+        switch (trapnr) {
+        case EXCP_INTERRUPT:
+            /* just indicate that signals should be handled asap */
+            break;
+        case HEX_EXCP_TRAP0:
+            syscallnum = env->gpr[6];
+            env->gpr[HEX_REG_PC] += 4;
+            ret = do_syscall(env,
+                             syscallnum,
+                             env->gpr[0],
+                             env->gpr[1],
+                             env->gpr[2],
+                             env->gpr[3],
+                             env->gpr[4],
+                             env->gpr[5],
+                             0, 0);
+            if (ret == -TARGET_ERESTARTSYS) {
+                env->gpr[HEX_REG_PC] -= 4;
+            } else if (ret != -TARGET_QEMU_ESIGRETURN) {
+                env->gpr[0] = ret;
+            }
+            break;
+        case HEX_EXCP_FETCH_NO_UPAGE:
+        case HEX_EXCP_PRIV_NO_UREAD:
+        case HEX_EXCP_PRIV_NO_UWRITE:
+            signum = TARGET_SIGSEGV;
+            sigcode = TARGET_SEGV_MAPERR;
+            break;
+        case EXCP_ATOMIC:
+            cpu_exec_step_atomic(cs);
+            break;
+        default:
+            EXCP_DUMP(env, "\nqemu: unhandled CPU exception %#x - aborting\n",
+                     trapnr);
+            exit(EXIT_FAILURE);
+        }
+
+        if (signum) {
+            target_siginfo_t info = {
+                .si_signo = signum,
+                .si_errno = 0,
+                .si_code = sigcode,
+                ._sifields._sigfault._addr = sigaddr
+            };
+            queue_signal(env, info.si_signo, QEMU_SI_KILL, &info);
+        }
+
+        process_pending_signals(env);
+    }
+}
+
+void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
+{
+    env->gpr[HEX_REG_PC] = regs->sepc;
+    env->gpr[HEX_REG_SP] = regs->sp;
+    env->gpr[HEX_REG_USR] = 0x56000;
+}
diff --git a/linux-user/hexagon/signal.c b/linux-user/hexagon/signal.c
new file mode 100644
index 0000000000..fde8dc93b7
--- /dev/null
+++ b/linux-user/hexagon/signal.c
@@ -0,0 +1,276 @@
+/*
+ *  Emulation of Linux signals
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu.h"
+#include "signal-common.h"
+#include "linux-user/trace.h"
+
+struct target_sigcontext {
+    target_ulong r0,  r1,  r2,  r3;
+    target_ulong r4,  r5,  r6,  r7;
+    target_ulong r8,  r9, r10, r11;
+    target_ulong r12, r13, r14, r15;
+    target_ulong r16, r17, r18, r19;
+    target_ulong r20, r21, r22, r23;
+    target_ulong r24, r25, r26, r27;
+    target_ulong r28, r29, r30, r31;
+    target_ulong sa0;
+    target_ulong lc0;
+    target_ulong sa1;
+    target_ulong lc1;
+    target_ulong m0;
+    target_ulong m1;
+    target_ulong usr;
+    target_ulong p3_0;
+    target_ulong gp;
+    target_ulong ugp;
+    target_ulong pc;
+    target_ulong cause;
+    target_ulong badva;
+    target_ulong pad1;
+    target_ulong pad2;
+    target_ulong pad3;
+};
+
+struct target_ucontext {
+    unsigned long uc_flags;
+    target_ulong uc_link; /* target pointer */
+    target_stack_t uc_stack;
+    struct target_sigcontext uc_mcontext;
+    target_sigset_t uc_sigmask;
+};
+
+struct target_rt_sigframe {
+    uint32_t tramp[2];
+    struct target_siginfo info;
+    struct target_ucontext uc;
+};
+
+static abi_ulong get_sigframe(struct target_sigaction *ka,
+                              CPUHexagonState *regs, size_t framesize)
+{
+    abi_ulong sp = get_sp_from_cpustate(regs);
+
+    /* This is the X/Open sanctioned signal stack switching.  */
+    sp = target_sigsp(sp, ka) - framesize;
+
+    sp = QEMU_ALIGN_DOWN(sp, 8);
+
+    return sp;
+}
+
+static void setup_sigcontext(struct target_sigcontext *sc, CPUHexagonState *env)
+{
+    __put_user(env->gpr[HEX_REG_R00], &sc->r0);
+    __put_user(env->gpr[HEX_REG_R01], &sc->r1);
+    __put_user(env->gpr[HEX_REG_R02], &sc->r2);
+    __put_user(env->gpr[HEX_REG_R03], &sc->r3);
+    __put_user(env->gpr[HEX_REG_R04], &sc->r4);
+    __put_user(env->gpr[HEX_REG_R05], &sc->r5);
+    __put_user(env->gpr[HEX_REG_R06], &sc->r6);
+    __put_user(env->gpr[HEX_REG_R07], &sc->r7);
+    __put_user(env->gpr[HEX_REG_R08], &sc->r8);
+    __put_user(env->gpr[HEX_REG_R09], &sc->r9);
+    __put_user(env->gpr[HEX_REG_R10], &sc->r10);
+    __put_user(env->gpr[HEX_REG_R11], &sc->r11);
+    __put_user(env->gpr[HEX_REG_R12], &sc->r12);
+    __put_user(env->gpr[HEX_REG_R13], &sc->r13);
+    __put_user(env->gpr[HEX_REG_R14], &sc->r14);
+    __put_user(env->gpr[HEX_REG_R15], &sc->r15);
+    __put_user(env->gpr[HEX_REG_R16], &sc->r16);
+    __put_user(env->gpr[HEX_REG_R17], &sc->r17);
+    __put_user(env->gpr[HEX_REG_R18], &sc->r18);
+    __put_user(env->gpr[HEX_REG_R19], &sc->r19);
+    __put_user(env->gpr[HEX_REG_R20], &sc->r20);
+    __put_user(env->gpr[HEX_REG_R21], &sc->r21);
+    __put_user(env->gpr[HEX_REG_R22], &sc->r22);
+    __put_user(env->gpr[HEX_REG_R23], &sc->r23);
+    __put_user(env->gpr[HEX_REG_R24], &sc->r24);
+    __put_user(env->gpr[HEX_REG_R25], &sc->r25);
+    __put_user(env->gpr[HEX_REG_R26], &sc->r26);
+    __put_user(env->gpr[HEX_REG_R27], &sc->r27);
+    __put_user(env->gpr[HEX_REG_R28], &sc->r28);
+    __put_user(env->gpr[HEX_REG_R29], &sc->r29);
+    __put_user(env->gpr[HEX_REG_R30], &sc->r30);
+    __put_user(env->gpr[HEX_REG_R31], &sc->r31);
+    __put_user(env->gpr[HEX_REG_SA0], &sc->sa0);
+    __put_user(env->gpr[HEX_REG_LC0], &sc->lc0);
+    __put_user(env->gpr[HEX_REG_SA1], &sc->sa1);
+    __put_user(env->gpr[HEX_REG_LC1], &sc->lc1);
+    __put_user(env->gpr[HEX_REG_M0], &sc->m0);
+    __put_user(env->gpr[HEX_REG_M1], &sc->m1);
+    __put_user(env->gpr[HEX_REG_USR], &sc->usr);
+    __put_user(env->gpr[HEX_REG_P3_0], &sc->p3_0);
+    __put_user(env->gpr[HEX_REG_GP], &sc->gp);
+    __put_user(env->gpr[HEX_REG_UGP], &sc->ugp);
+    __put_user(env->gpr[HEX_REG_PC], &sc->pc);
+}
+
+static void setup_ucontext(struct target_ucontext *uc,
+                           CPUHexagonState *env, target_sigset_t *set)
+{
+    __put_user(0,    &(uc->uc_flags));
+    __put_user(0,    &(uc->uc_link));
+
+    target_save_altstack(&uc->uc_stack, env);
+
+    int i;
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        __put_user(set->sig[i], &(uc->uc_sigmask.sig[i]));
+    }
+
+    setup_sigcontext(&uc->uc_mcontext, env);
+}
+
+static inline void install_sigtramp(uint32_t *tramp)
+{
+    __put_user(0x7800d166, tramp + 0); /*  { r6=#__NR_rt_sigreturn } */
+    __put_user(0x5400c004, tramp + 1); /*  { trap0(#1) } */
+}
+
+void setup_rt_frame(int sig, struct target_sigaction *ka,
+                    target_siginfo_t *info,
+                    target_sigset_t *set, CPUHexagonState *env)
+{
+    abi_ulong frame_addr;
+    struct target_rt_sigframe *frame;
+
+    frame_addr = get_sigframe(ka, env, sizeof(*frame));
+    trace_user_setup_rt_frame(env, frame_addr);
+
+    if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
+        goto badframe;
+    }
+
+    setup_ucontext(&frame->uc, env, set);
+    tswap_siginfo(&frame->info, info);
+    install_sigtramp(frame->tramp);
+
+    env->gpr[HEX_REG_PC] = ka->_sa_handler;
+    env->gpr[HEX_REG_SP] = frame_addr;
+    env->gpr[HEX_REG_R00] = sig;
+    env->gpr[HEX_REG_R01] =
+        frame_addr + offsetof(struct target_rt_sigframe, info);
+    env->gpr[HEX_REG_R02] =
+        frame_addr + offsetof(struct target_rt_sigframe, uc);
+    env->gpr[HEX_REG_LR] =
+        frame_addr + offsetof(struct target_rt_sigframe, tramp);
+
+    return;
+
+badframe:
+    unlock_user_struct(frame, frame_addr, 1);
+    if (sig == TARGET_SIGSEGV) {
+        ka->_sa_handler = TARGET_SIG_DFL;
+    }
+    force_sig(TARGET_SIGSEGV);
+}
+
+static void restore_sigcontext(CPUHexagonState *env,
+                               struct target_sigcontext *sc)
+{
+    __get_user(env->gpr[HEX_REG_R00], &sc->r0);
+    __get_user(env->gpr[HEX_REG_R01], &sc->r1);
+    __get_user(env->gpr[HEX_REG_R02], &sc->r2);
+    __get_user(env->gpr[HEX_REG_R03], &sc->r3);
+    __get_user(env->gpr[HEX_REG_R04], &sc->r4);
+    __get_user(env->gpr[HEX_REG_R05], &sc->r5);
+    __get_user(env->gpr[HEX_REG_R06], &sc->r6);
+    __get_user(env->gpr[HEX_REG_R07], &sc->r7);
+    __get_user(env->gpr[HEX_REG_R08], &sc->r8);
+    __get_user(env->gpr[HEX_REG_R09], &sc->r9);
+    __get_user(env->gpr[HEX_REG_R10], &sc->r10);
+    __get_user(env->gpr[HEX_REG_R11], &sc->r11);
+    __get_user(env->gpr[HEX_REG_R12], &sc->r12);
+    __get_user(env->gpr[HEX_REG_R13], &sc->r13);
+    __get_user(env->gpr[HEX_REG_R14], &sc->r14);
+    __get_user(env->gpr[HEX_REG_R15], &sc->r15);
+    __get_user(env->gpr[HEX_REG_R16], &sc->r16);
+    __get_user(env->gpr[HEX_REG_R17], &sc->r17);
+    __get_user(env->gpr[HEX_REG_R18], &sc->r18);
+    __get_user(env->gpr[HEX_REG_R19], &sc->r19);
+    __get_user(env->gpr[HEX_REG_R20], &sc->r20);
+    __get_user(env->gpr[HEX_REG_R21], &sc->r21);
+    __get_user(env->gpr[HEX_REG_R22], &sc->r22);
+    __get_user(env->gpr[HEX_REG_R23], &sc->r23);
+    __get_user(env->gpr[HEX_REG_R24], &sc->r24);
+    __get_user(env->gpr[HEX_REG_R25], &sc->r25);
+    __get_user(env->gpr[HEX_REG_R26], &sc->r26);
+    __get_user(env->gpr[HEX_REG_R27], &sc->r27);
+    __get_user(env->gpr[HEX_REG_R28], &sc->r28);
+    __get_user(env->gpr[HEX_REG_R29], &sc->r29);
+    __get_user(env->gpr[HEX_REG_R30], &sc->r30);
+    __get_user(env->gpr[HEX_REG_R31], &sc->r31);
+    __get_user(env->gpr[HEX_REG_SA0], &sc->sa0);
+    __get_user(env->gpr[HEX_REG_LC0], &sc->lc0);
+    __get_user(env->gpr[HEX_REG_SA1], &sc->sa1);
+    __get_user(env->gpr[HEX_REG_LC1], &sc->lc1);
+    __get_user(env->gpr[HEX_REG_M0], &sc->m0);
+    __get_user(env->gpr[HEX_REG_M1], &sc->m1);
+    __get_user(env->gpr[HEX_REG_USR], &sc->usr);
+    __get_user(env->gpr[HEX_REG_P3_0], &sc->p3_0);
+    __get_user(env->gpr[HEX_REG_GP], &sc->gp);
+    __get_user(env->gpr[HEX_REG_UGP], &sc->ugp);
+    __get_user(env->gpr[HEX_REG_PC], &sc->pc);
+}
+
+static void restore_ucontext(CPUHexagonState *env, struct target_ucontext *uc)
+{
+    sigset_t blocked;
+    target_sigset_t target_set;
+    int i;
+
+    target_sigemptyset(&target_set);
+    for (i = 0; i < TARGET_NSIG_WORDS; i++) {
+        __get_user(target_set.sig[i], &(uc->uc_sigmask.sig[i]));
+    }
+
+    target_to_host_sigset_internal(&blocked, &target_set);
+    set_sigmask(&blocked);
+
+    restore_sigcontext(env, &uc->uc_mcontext);
+}
+
+long do_rt_sigreturn(CPUHexagonState *env)
+{
+    struct target_rt_sigframe *frame;
+    abi_ulong frame_addr;
+
+    frame_addr = env->gpr[HEX_REG_SP];
+    trace_user_do_sigreturn(env, frame_addr);
+    if (!lock_user_struct(VERIFY_READ, frame, frame_addr, 1)) {
+        goto badframe;
+    }
+
+    restore_ucontext(env, &frame->uc);
+
+    if (do_sigaltstack(frame_addr + offsetof(struct target_rt_sigframe,
+            uc.uc_stack), 0, get_sp_from_cpustate(env)) == -EFAULT) {
+        goto badframe;
+    }
+
+    unlock_user_struct(frame, frame_addr, 0);
+    return -TARGET_QEMU_ESIGRETURN;
+
+badframe:
+    unlock_user_struct(frame, frame_addr, 0);
+    force_sig(TARGET_SIGSEGV);
+    return 0;
+}
diff --git a/scripts/gensyscalls.sh b/scripts/gensyscalls.sh
index bba9fb052c..8fb450e3c9 100755
--- a/scripts/gensyscalls.sh
+++ b/scripts/gensyscalls.sh
@@ -98,4 +98,5 @@ generate_syscall_nr openrisc 32 "$output/linux-user/openrisc/syscall_nr.h"
 
 generate_syscall_nr riscv 32 "$output/linux-user/riscv/syscall32_nr.h"
 generate_syscall_nr riscv 64 "$output/linux-user/riscv/syscall64_nr.h"
+generate_syscall_nr hexagon 32 "$output/linux-user/hexagon/syscall_nr.h"
 rm -fr "$TMP"
-- 
2.25.1


