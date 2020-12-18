Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9722DEB58
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 23:00:08 +0100 (CET)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqNnC-0006XV-Pi
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 17:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmN-0001yY-Ky
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:11 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2]:43118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@freebsd.org>) id 1kqMmK-00039K-Lq
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 15:55:11 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits)) (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 1D8B27D5EC
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 20:55:07 +0000 (UTC)
 (envelope-from imp@freebsd.org)
Received: from freefall.freebsd.org (freefall.freebsd.org [96.47.72.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "freefall.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4CyLj708nTz3hGc;
 Fri, 18 Dec 2020 20:55:07 +0000 (UTC) (envelope-from imp@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AzRi46l744C2PMlBYFDYsoBQyuRBYAU0Dp1Ax688xYc=;
 b=d3pXNrbNKToPDQFJLmuXdODn1HvqqcxGss/t20o7g+C7BDNxVh8y3Cd5/dTK4IRjHrBedv
 x1eC2yGtG4K4oKJdXP2j3TwKpVIgnklUmZ/Giixo/wT9QIyzqYcNN0rnUyjeVWO07lXzM8
 S1F2yBty7y99k4P2DGezfP79ppzTbG/IN3Z06/fsPj0/fOEavEwHayDPXL3Wv1UP1k0t3p
 Q59RsPqQGVt1oeURPiW9gmxAuHAl/X3jZOLxcCQDt3OF1d9oPNZPP4qAqLidG0LsJjXWel
 pd0V+kWcl+wlNU7uLTIFVFOjqFK1VT8G4wVL76tKg268zDc/1J6VG/F09BjMEA==
Received: by freefall.freebsd.org (Postfix, from userid 547)
 id E8DF3E741; Fri, 18 Dec 2020 20:55:06 +0000 (UTC)
From: imp@freebsd.org
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] A few preliminary bsd-user patches
Date: Fri, 18 Dec 2020 13:54:47 -0700
Message-Id: <20201218205451.10559-1-imp@freebsd.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1608324907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AzRi46l744C2PMlBYFDYsoBQyuRBYAU0Dp1Ax688xYc=;
 b=QWvEsbkM1NYWDGVuWWMEr7NlmWAzLt1GfZCw6wnl+J0L2yVQ6aOCScPqJOgw05pbtAHQVX
 OmE+c+cIHKyxHmN28hJI0OK45jakaoR5KGhOpL2MpBzktlnihWgAbDDWOSv/h/5LsXHMYQ
 j1Q1q+FYDF/wM7cD1WlDFGpP2y80bsX+jSf5ZBG00tNiwNcqWVjtEqNGDePS/hWqPxN53V
 INCHiypBx6BZ9oN0mfHteS3sAuxzRGV0LEDaS0Ra5KZ1ywrQY4yHVdlLLUDiiWNcsBbbJm
 t5JVPTg2PgIUk9MOoSIWcsJeybizlbnzKuPEwBsdUF0SwJnsBL0cB88O4Nge0Q==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1608324907; a=rsa-sha256; cv=none;
 b=eRxdRNkRUzJ4ZVhoEWZXUF4gdBbfc0gonyM/8wJE0MVWyC6JXK5U2M1I6x/cYnuuQKCtey
 +lMJ9plF7TnCKG3H3cx1py6KPG4WXp0dw7oddBMRy8r4y5G0X9adWC06Dy8OymtBD3T/7S
 hFbc/1nXkFz7w/2eHTWUpMtIVmIrdafGjOn6KeHjypbhhUhsiTwg46AGCj8Y1Evl1biABc
 gfAQ2b+D8WhvYSlffzHnivrCRUGanmO24HnxzOqIGxdscbvpjVB+k7LCWZJtI8btJLdWJr
 lSPTtN72Z8lfCUvZYFdA9HjAJhBqJKb2iHhlbf2LgdVAUifnKraGrvKWfwgeng==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=imp@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Dec 2020 16:50:11 -0500
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


