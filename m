Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA46D2258
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:24:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piFfL-0004K3-OH; Fri, 31 Mar 2023 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@umbrella>) id 1piFfI-0004If-Jw
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:40 -0400
Received: from c-71-237-47-177.hsd1.co.comcast.net ([71.237.47.177]
 helo=umbrella) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imp@umbrella>) id 1piFfF-0003ua-Vo
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:23:40 -0400
Received: from imp (uid 730) (envelope-from imp@umbrella) id 18019
 by umbrella (DragonFly Mail Agent v0.13+ on umbrella);
 Fri, 31 Mar 2023 08:18:33 -0600
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Ryo ONODERA <ryoon@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Kyle Evans <kevans@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Subject: [PATCH 0/7] bsd-user: remove bitrotted NetBSD and OpenBSD bsd-user
 support
Date: Fri, 31 Mar 2023 08:18:26 -0600
Message-Id: <20230331141833.3647-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=71.237.47.177; envelope-from=imp@umbrella;
 helo=umbrella
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, FSL_HELO_NON_FQDN_1=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, HELO_NO_DOMAIN=0.001,
 KHOP_HELO_FCRDNS=0.399, PDS_RDNS_DYNAMIC_FP=0.01, RCVD_IN_PBL=3.335,
 RCVD_IN_SORBS_DUL=0.001, RDNS_DYNAMIC=0.982, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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

The NetBSD and OpenBSD support in bsd-user hasn't built since before the meson
conversion. It's also out of sync with many of the recent changes in the
bsd-user fork and has just been removed there. Remove it from master for the
same reasons: it generates a number of false positives with grep and has
increasingly gotten in the way. The bsd-user fork code is much more advanced,
and even it doesn't compile and is out of date. Remove this from both
branches. If others wish to bring it up to speed, I'm happy to help them.

Warner Losh (7):
  bsd-user: Remove obsolete prototypes
  bsd-user: Remove netbsd system call inclusion and defines
  bsd-user: Remove netbsd system call tracing
  bsd-user: Remove openbsd system call inclusion and defines
  bsd-user: Remove openbsd system call tracing
  bsd-user: Remove netbsd directory
  bsd-user: Remove openbsd directory

 bsd-user/netbsd/host-os.h            |  25 --
 bsd-user/netbsd/os-strace.h          |   1 -
 bsd-user/netbsd/strace.list          | 145 -----------
 bsd-user/netbsd/syscall_nr.h         | 373 ---------------------------
 bsd-user/netbsd/target_os_elf.h      | 147 -----------
 bsd-user/netbsd/target_os_siginfo.h  |  82 ------
 bsd-user/netbsd/target_os_signal.h   |  69 -----
 bsd-user/netbsd/target_os_stack.h    |  56 ----
 bsd-user/netbsd/target_os_thread.h   |  25 --
 bsd-user/openbsd/host-os.h           |  25 --
 bsd-user/openbsd/os-strace.h         |   1 -
 bsd-user/openbsd/strace.list         | 187 --------------
 bsd-user/openbsd/syscall_nr.h        | 225 ----------------
 bsd-user/openbsd/target_os_elf.h     | 147 -----------
 bsd-user/openbsd/target_os_siginfo.h |  82 ------
 bsd-user/openbsd/target_os_signal.h  |  69 -----
 bsd-user/openbsd/target_os_stack.h   |  56 ----
 bsd-user/openbsd/target_os_thread.h  |  25 --
 bsd-user/qemu.h                      |  16 --
 bsd-user/strace.c                    |  34 ---
 bsd-user/syscall_defs.h              |  29 +--
 21 files changed, 1 insertion(+), 1818 deletions(-)
 delete mode 100644 bsd-user/netbsd/host-os.h
 delete mode 100644 bsd-user/netbsd/os-strace.h
 delete mode 100644 bsd-user/netbsd/strace.list
 delete mode 100644 bsd-user/netbsd/syscall_nr.h
 delete mode 100644 bsd-user/netbsd/target_os_elf.h
 delete mode 100644 bsd-user/netbsd/target_os_siginfo.h
 delete mode 100644 bsd-user/netbsd/target_os_signal.h
 delete mode 100644 bsd-user/netbsd/target_os_stack.h
 delete mode 100644 bsd-user/netbsd/target_os_thread.h
 delete mode 100644 bsd-user/openbsd/host-os.h
 delete mode 100644 bsd-user/openbsd/os-strace.h
 delete mode 100644 bsd-user/openbsd/strace.list
 delete mode 100644 bsd-user/openbsd/syscall_nr.h
 delete mode 100644 bsd-user/openbsd/target_os_elf.h
 delete mode 100644 bsd-user/openbsd/target_os_siginfo.h
 delete mode 100644 bsd-user/openbsd/target_os_signal.h
 delete mode 100644 bsd-user/openbsd/target_os_stack.h
 delete mode 100644 bsd-user/openbsd/target_os_thread.h

-- 
2.39.2


