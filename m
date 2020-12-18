Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B452DF1AF
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Dec 2020 21:58:13 +0100 (CET)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqjIo-000135-PQ
	for lists+qemu-devel@lfdr.de; Sat, 19 Dec 2020 15:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@dune.bsdimp.com>)
 id 1kqj5T-0007SV-Nb
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 15:44:27 -0500
Received: from 50-253-99-174-static.hfc.comcastbusiness.net
 ([50.253.99.174]:31469 helo=dune.bsdimp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@dune.bsdimp.com>)
 id 1kqj5S-000412-1B
 for qemu-devel@nongnu.org; Sat, 19 Dec 2020 15:44:23 -0500
Received: from dune.bsdimp.com (localhost [127.0.0.1])
 by dune.bsdimp.com (8.15.2/8.15.2) with ESMTPS id 0BIKqrxW086424
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Dec 2020 13:52:53 -0700 (MST)
 (envelope-from imp@dune.bsdimp.com)
Received: (from imp@localhost)
 by dune.bsdimp.com (8.15.2/8.15.2/Submit) id 0BIKqrpV086423;
 Fri, 18 Dec 2020 13:52:53 -0700 (MST) (envelope-from imp)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] A few preliminary bsd-user patches
Date: Fri, 18 Dec 2020 13:52:46 -0700
Message-Id: <20201218205250.86382-1-imp@freebsd.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=50.253.99.174; envelope-from=imp@dune.bsdimp.com;
 helo=dune.bsdimp.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.267,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Warner Losh <imp@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@freebsd.org>

Here's the first round of bsd-user patches. There's on the order of 280 that
we've done, but that's too much to review all at once. In addition, 3.1 release
was the last rebase point that we've been successful with for a number of reasons
unrelated to qemu. Now that those have been resolved, we have a new push under way
to push things forward, but wanted to upstream as many of the patches as we can
directly to qemu's head to lighten the load of carrying all these.

This first small series updates the system call lists, moves things around to
make it easier to support divergence in the BSD world, and adjusts to the new
meson build. It's also designed to help me learn how to land such a large set
upstream.

These patches have passed through several hands, with different tweaks over the
years so have an unusually large number of signed-off-by lines that are the
result of this refinement process where several hands have touched the patches
in the last 7 years.

Sean Bruno (1):
  tcg: Additional Trap type for FreeBSD

Stacey Son (1):
  bsd-user: move strace OS/arch dependent code to host/arch dirs

Warner Losh (2):
  bsd-user: regenerate FreeBSD's system call numbers
  bsd-user: Update strace.list for FreeBSD's latest syscalls

 accel/tcg/user-exec.c                  |   8 +-
 bsd-user/arm/target_arch_sysarch.h     |  78 +++
 bsd-user/arm/target_syscall.h          |  36 ++
 bsd-user/freebsd/os-strace.h           |  29 ++
 bsd-user/freebsd/strace.list           |  65 ++-
 bsd-user/freebsd/syscall_nr.h          | 695 ++++++++++++++-----------
 bsd-user/i386/target_arch_sysarch.h    |  77 +++
 bsd-user/i386/target_syscall.h         |  19 +
 bsd-user/mips/target_arch_sysarch.h    |  69 +++
 bsd-user/mips/target_syscall.h         |  52 ++
 bsd-user/mips64/target_arch_sysarch.h  |  69 +++
 bsd-user/mips64/target_syscall.h       |  53 ++
 bsd-user/netbsd/os-strace.h            |   1 +
 bsd-user/openbsd/os-strace.h           |   1 +
 bsd-user/sparc/target_arch_sysarch.h   |  52 ++
 bsd-user/sparc/target_syscall.h        |  24 +-
 bsd-user/sparc64/target_arch_sysarch.h |  52 ++
 bsd-user/sparc64/target_syscall.h      |  24 +-
 bsd-user/strace.c                      |  11 +
 bsd-user/x86_64/target_arch_sysarch.h  |  76 +++
 bsd-user/x86_64/target_syscall.h       |  21 +-
 meson.build                            |   1 +
 22 files changed, 1186 insertions(+), 327 deletions(-)
 create mode 100644 bsd-user/arm/target_arch_sysarch.h
 create mode 100644 bsd-user/arm/target_syscall.h
 create mode 100644 bsd-user/freebsd/os-strace.h
 create mode 100644 bsd-user/i386/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_syscall.h
 create mode 100644 bsd-user/mips64/target_arch_sysarch.h
 create mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/netbsd/os-strace.h
 create mode 100644 bsd-user/openbsd/os-strace.h
 create mode 100644 bsd-user/sparc/target_arch_sysarch.h
 create mode 100644 bsd-user/sparc64/target_arch_sysarch.h
 create mode 100644 bsd-user/x86_64/target_arch_sysarch.h

-- 
2.22.1


