Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C800244C51F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 17:36:17 +0100 (CET)
Received: from localhost ([::1]:38618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkqa8-0007NG-Vb
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 11:36:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWf-0007VA-Fj
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:41 -0500
Received: from [2607:f8b0:4864:20::129] (port=36673
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mkqWb-0005bc-8u
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 11:32:41 -0500
Received: by mail-il1-x129.google.com with SMTP id l8so3129180ilv.3
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 08:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckXwvPckg2E5jmckfkNeiTbg8vAvNQC+VuQTgVQ90tI=;
 b=7TtHl05MfwKSbtaHsUbuvrRLbyILndGzjruiIkc0MSl+7O+NWVHUd4Oj+2kJNmOnSI
 29B7E6qqaes/YSuBS2X766D7M4IOOMOSBz2B6CxacFvqYWw1RUMGuKVNFmgju1cqeFtv
 oU99xAvN+sz6z/fBwIwUs3Xk+XF11xC/k1uCE0GA8MLDjW0wOogZjP9Oc4TRUjBrgfOI
 +neSWTXf3Tr/McwxNFzfoQ+ta6OIQmpEiLYvY5hDdK+hD9zWeUL+lwTnWBAZroGv3rMy
 Cc//nSLgjee/BPW+KtC9gLu7t0vTZxR9yU+nfl+q/yxLloEXXMfWxmPXjDLN7HTDqusC
 NnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckXwvPckg2E5jmckfkNeiTbg8vAvNQC+VuQTgVQ90tI=;
 b=03opocQAbyq574KZY/CtZ/F5xLIjBLUgS+QD1BEx7gyYSi5W0i8r2iMJgAopaz8va1
 aEaAQyiGMcGFkd82SY52dhFTIp+e7/k62fb3e88M4oAPQ98DS3fgnFKD/4yXGmLipTVn
 EpR0zKI6atMpxYXzOpsOnBwKYA5MWv4nPU2JfyEBqm9RqoIug5PMPHlhorCuyGLbVo1K
 cXI8xg9Q/QA6L8fEM6rjFzbZ4WCq+5wO74/jxyVGNU12g7cEx3pJRwUZX/XOuUFv9Os3
 GyRpLZBLt+Giaf7TVbz90ISEs+vrAOUY7dGTRvmqI6fDNJizfUFVq6bWmUSeU9wfh5Hs
 rRkw==
X-Gm-Message-State: AOAM530V403pr0sr325LT6yIxdqiiTNxCmmBXPXWaAGiyHZDc3c7xEv5
 zl2bMAbyar/o+Ym5/FwTbMHDKMrzFAdQVw==
X-Google-Smtp-Source: ABdhPJzBQpcPcWS0fDPaPqOoomnT9RsRB12AmpB76aZYfJxuqRXZoPFwYaQhYnW0DGqQvrUQXUgiCw==
X-Received: by 2002:a05:6e02:1709:: with SMTP id
 u9mr218101ill.242.1636561955121; 
 Wed, 10 Nov 2021 08:32:35 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x2sm130403iom.46.2021.11.10.08.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 08:32:34 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 0/6] linux-user: simplify safe signal handling
Date: Wed, 10 Nov 2021 09:31:27 -0700
Message-Id: <20211110163133.76357-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a quick RFC to see if something like this is worth doing.

I've created a new interface host_signal_set_pc. This allows us to move all the
nearly identical copies of rewind_if_in_safe_syscall into signal.c.  This
reduces the amount of code that needs to be rewritten for bsd-user's adaptation
of both the safe signal handling and the sigsegv/sigbus changes that have
happened. Since BSD's mcontext_t differs in some cases, we wouldn't be able to
share this between platforms, but it reduces the number of nearly identical
routines I'd have to write.

In addition, the assembler glue for the safe system calls is almost identical
between linux and bsd-user's fork. The only difference is inverting the system
call return to comply with the -ERRNO convention *-user uses in the rest of the
code which is native to Linux, but differs for the BSDs and other traditional
unix targets.

I know the patches may not be sliced and diced in the typical desired
fashion. This is a RFC, and the changes are short enough to be easily digested
though since it's quite repetitive. They do now pass a push to gitlab and
the default CI (see note in v2 section about one ugly kludge that likely
needs discussion).

These were extracted from the 'blitz' branch we have in the bsd-user fork and
then that was adapted to use the common code. I've pushed a branch to gitlab
(viewable at https://gitlab.com/bsdimp/qemu/-/tree/blitz if you prefer that to
fetching) that shows how these will be used. I'm working on upstreaming
bsd-user/signal.c next which will take a little bit of time to work into a place
where it can be reviewed here. I wanted to get feedback because this is
one chunk I can cleave off and make landing that easier.

v2:
	o move the externs for the system call setup to safe-syscall.h
	o move to using the #ifdef __FreeBSD__ code for FreeBSD's adjustment
	  to return value from system calls.
	o move safe-syscall.inc to common-user so bsd-user can use it too
	o create a kludge for mips to allow CI to pass (but maybe we should
	  remove mips hosts as a supported platform instead)
	o side note: the blitz bsd-user branch hasn't been updated yet since
	  I think the first two of this series may be merged early to solve
	  a different problem.

Warner Losh (6):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall
  linux-user/safe-syscall.inc.S: Move to common-user
  common-user: Adjust system call return on FreeBSD
  common-user/host/mips: create, though mips hosts likely don't work
    reliably
  *-user: move safe-syscall.* to common-user

 common-user/common-safe-syscall.S             | 30 ++++++++++++++++++
 .../host/aarch64/safe-syscall.inc.S           |  5 +++
 .../host/arm/safe-syscall.inc.S               |  5 +++
 .../host/i386/safe-syscall.inc.S              |  5 +++
 common-user/host/mips/safe-syscall.inc.S      |  1 +
 .../host/ppc64/safe-syscall.inc.S             |  0
 .../host/riscv/safe-syscall.inc.S             |  0
 .../host/s390x/safe-syscall.inc.S             |  0
 .../host/x86_64/safe-syscall.inc.S            |  5 +++
 {linux-user => common-user}/safe-syscall.h    |  3 ++
 linux-user/host/aarch64/host-signal.h         |  5 +++
 linux-user/host/aarch64/hostdep.h             | 20 ------------
 linux-user/host/alpha/host-signal.h           |  5 +++
 linux-user/host/arm/host-signal.h             |  5 +++
 linux-user/host/arm/hostdep.h                 | 20 ------------
 linux-user/host/i386/host-signal.h            |  5 +++
 linux-user/host/i386/hostdep.h                | 20 ------------
 linux-user/host/mips/host-signal.h            |  5 +++
 linux-user/host/ppc/host-signal.h             |  5 +++
 linux-user/host/ppc64/hostdep.h               | 20 ------------
 linux-user/host/riscv/host-signal.h           |  5 +++
 linux-user/host/riscv/hostdep.h               | 20 ------------
 linux-user/host/s390/host-signal.h            |  5 +++
 linux-user/host/s390x/hostdep.h               | 20 ------------
 linux-user/host/sparc/host-signal.h           |  9 ++++++
 linux-user/host/x86_64/host-signal.h          |  5 +++
 linux-user/host/x86_64/hostdep.h              | 20 ------------
 linux-user/safe-syscall.S                     | 31 +------------------
 linux-user/signal.c                           | 15 ++++++++-
 meson.build                                   |  2 ++
 30 files changed, 125 insertions(+), 171 deletions(-)
 create mode 100644 common-user/common-safe-syscall.S
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (95%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (97%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (96%)
 create mode 100644 common-user/host/mips/safe-syscall.inc.S
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (97%)
 rename {linux-user => common-user}/safe-syscall.h (98%)

-- 
2.33.0


