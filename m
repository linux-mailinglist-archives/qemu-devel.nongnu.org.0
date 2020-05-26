Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1391AB39A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Apr 2020 00:06:19 +0200 (CEST)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOqAk-0004gW-A9
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 18:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slyfox@gentoo.org>) id 1jOq9p-0004CX-DI
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slyfox@gentoo.org>) id 1jOq9n-00085a-S9
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:05:20 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:52682)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <slyfox@gentoo.org>) id 1jOq9n-00085F-Mv
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 18:05:19 -0400
Received: from sf.home (tunnel547699-pt.tunnel.tserv1.lon2.ipv6.he.net
 [IPv6:2001:470:1f1c:3e6::2])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: slyfox)
 by smtp.gentoo.org (Postfix) with ESMTPSA id EA05834F04D;
 Wed, 15 Apr 2020 22:05:16 +0000 (UTC)
Received: by sf.home (Postfix, from userid 1000)
 id 4A5805A22061; Wed, 15 Apr 2020 23:05:13 +0100 (BST)
From: Sergei Trofimovich <slyfox@gentoo.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user/syscall.c: add target-to-host mapping for
 epoll_create1()
Date: Wed, 15 Apr 2020 23:05:08 +0100
Message-Id: <20200415220508.5044-1-slyfox@gentoo.org>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 140.211.166.183
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Sergei Trofimovich <slyfox@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Noticed by Barnab=C3=A1s Vir=C3=A1gh as a python-3.7 failue on qemu-alpha=
.

The bug shows up on alpha as it's one of the targets where
EPOLL_CLOEXEC differs from other targets:
    sysdeps/unix/sysv/linux/alpha/bits/epoll.h: EPOLL_CLOEXEC  =3D 010000=
00
    sysdeps/unix/sysv/linux/bits/epoll.h:        EPOLL_CLOEXEC =3D 020000=
00

Bug: https://bugs.gentoo.org/717548
Reported-by: Barnab=C3=A1s Vir=C3=A1gh
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
CC: Riku Voipio <riku.voipio@iki.fi>
CC: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 674f70e70a..05f03919ff 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -12012,7 +12012,7 @@ static abi_long do_syscall1(void *cpu_env, int nu=
m, abi_long arg1,
 #endif
 #if defined(TARGET_NR_epoll_create1) && defined(CONFIG_EPOLL_CREATE1)
     case TARGET_NR_epoll_create1:
-        return get_errno(epoll_create1(arg1));
+        return get_errno(epoll_create1(target_to_host_bitmask(arg1, fcnt=
l_flags_tbl)));
 #endif
 #if defined(TARGET_NR_epoll_ctl)
     case TARGET_NR_epoll_ctl:
--=20
2.26.1


