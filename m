Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E074BAEF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 16:14:35 +0200 (CEST)
Received: from localhost ([::1]:38758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdbM9-0000Aa-K6
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 10:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52994)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbJY-00078T-K3
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:11:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hdbJX-00044U-Jn
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:11:52 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56957 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hdbJX-0003LK-CO
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 10:11:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 000261A1FC3;
 Wed, 19 Jun 2019 16:10:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id DCA881A1E7D;
 Wed, 19 Jun 2019 16:10:45 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 16:10:24 +0200
Message-Id: <1560953429-29203-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v11 0/5] linux-user: A set of miscellaneous
 patches
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
Cc: lvivier@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This is a collection of misc patches for Linux user that I recently
accumulated from variuous sources. All of them originate from problems
observed on mips target. However, most of these changes actually
affect and fix linux-user problems on multiple targets.

v10->v11:

  - patch on <ADD|DROP>_MEMEBERSHIP basically reverted to its first
    version
  - corrected patch on statx()
  - added patch on strace support for statx()
  - added patch on fixing flock structure for MIPS O64 ABI

v9->v10:

  - improved commit messages for patches 2 and 3

v8->v9:

  - fixed build error on some systems related to SOL_ALG

v7->v8:

  - added a patch on setsockopt() option SOL_ALG

v6->v7:

  - fixed a build error for older kernels related to the patch on
    setsockopt() options
  - removed four patches that on the meantime got accepted into the
    main source tree

v5->v6:

  - fixed a mistake in patch #4
  - improved commit messages in patches #4 and #6

v4->v5:

  - added the patch on statx() support
  - improved the patch on IPV6_<ADD|DROP>_MEMBERSHIP to take into
    account the possibility of different names for a field
  - minor corrections in commit messages

v3->v4:

  - improved commit messages (fixed some typos, improved relevance)

v2->v3:

  - updated and improved commit messages
  - added IPV6_DROP_MEMBERSHIP support to the patch on setsockopt()'s
    option

v1->v2:

  - added the patch on setsockopt()'s option IPV6_ADD_MEMBERSHIP
  - improved the commit messages

Aleksandar Markovic (1):
  linux-user: Fix flock structure for MIPS O64 ABI

Aleksandar Rikalo (1):
  linux-user: Add support for translation of statx() syscall

Jim Wilson (1):
  linux-user: Add support for strace for statx() syscall

Neng Chen (1):
  linux-user: Add support for setsockopt() options
    IPV6_<ADD|DROP>_MEMBERSHIP

Yunqiang Su (1):
  linux-user: Add support for setsockopt() option SOL_ALG

 linux-user/generic/fcntl.h     |   2 +-
 linux-user/mips/target_fcntl.h |   4 +
 linux-user/strace.c            |  86 +++++++++++++++++++
 linux-user/strace.list         |   3 +
 linux-user/syscall.c           | 186 ++++++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h      |  37 ++++++++
 6 files changed, 316 insertions(+), 2 deletions(-)

-- 
2.7.4


