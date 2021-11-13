Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E974F44F147
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 05:58:40 +0100 (CET)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mll7f-0000Yc-HM
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 23:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5x-00074P-Kx
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:53 -0500
Received: from [2607:f8b0:4864:20::d35] (port=36720
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mll5u-0003M4-W2
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 23:56:53 -0500
Received: by mail-io1-xd35.google.com with SMTP id e144so13841176iof.3
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 20:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4egYozRm7U7NQXEyCWl8Lc8HUibmPJzJwscSTLs3FU=;
 b=ku1O8mWYujK3gguCwXMJYAO6hHTLU2ycanJoeXQVeTPyo4FH/eM3iD1hujnLcSNvux
 T0bLVseogVkD/dEBjlUy7uLE/gLnN1KvwJFIMgxWwHT4yMj9qOrPHikjoFu7bJJFEyJm
 ylNVP8bdvcKOjsMzbqFz92wSIQmdXmQaBTWVcAGDdKsyPRuS15LN0boPu28TmvgadZGw
 fpxuFUEJFG/sUAc7njqv8RB8rWwE5SHgChapp3fVexApC35S5tQ0UdL7BoyFH8NIfylP
 wKo4zYHHoTLxH0gS2CHx6j+xslBHNS7TXqwE929E40RjeChWSDZleVKFXkmlN43kdK9P
 ZZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k4egYozRm7U7NQXEyCWl8Lc8HUibmPJzJwscSTLs3FU=;
 b=ZiGPgUjmycTva/G3ZKeJ71QadIndCz6eYVBU4g/XB0tz+cgaSZtcrlrC46mWFY9Ogh
 SdY3DHqfIYUklrPXQegoozbJJ/2trDCTgF1w1YK4GaE7yBmofIIFVhJ9bx9ko15+17Tl
 Hy4DEzCKn48EScKcTHdTNoDNCVU4bqqYZZJcRErRmfZ/vHopx8ymWURNbsRBO8GV6dWj
 bR8IXukgZpPGaWuDnnClXxXJpAGUpnJtsGmcTDO131lt3qGW69bVmuJ5VZ28tcTow27R
 PNHw1gmEOgiM/XEhCq6malSp/W8Zfu1/owbW+1QKL1cd3aFDmAN0EwkTG7kjVRwPWwum
 1cvA==
X-Gm-Message-State: AOAM532h4aQmyFIK/iAhTX6zWQXOIX4RewqK6kmnH49w8KZ83FEVhTnk
 GveKsYB49GuyROkfCYYqeItftskdKzOeYw==
X-Google-Smtp-Source: ABdhPJyXM4PT5LI8KcPyII4ohMQWeLElF4LJes36g+7/SSYhx5BPj0LS+1o408qPrx562g9kQXM7aA==
X-Received: by 2002:a6b:fc11:: with SMTP id r17mr13965477ioh.59.1636779408761; 
 Fri, 12 Nov 2021 20:56:48 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id r14sm5414455iov.14.2021.11.12.20.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 20:56:48 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 0/5] linux-user: simplify safe signal handling
Date: Fri, 12 Nov 2021 21:55:58 -0700
Message-Id: <20211113045603.60391-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Konrad Witaszczyk <def@freebsd.org>, Warner Losh <imp@bsdimp.com>
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

v3:	o Make arm and aarch64 fixes as suggested in the review
	o Fix a stray & that remained after some churn for 32-bit sparc,
	  clearly not compiled in our CI pipeline...
	o Fix the comments to be more descriptive as to the errno convetion
	  and not characterize it as the Linux way.

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

Warner Losh (5):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall
  linux-user/safe-syscall.inc.S: Move to common-user
  common-user: Adjust system call return on FreeBSD
  *-user: move safe-syscall.* to common-user

 common-user/common-safe-syscall.S             | 30 ++++++++++++++++++
 .../host/aarch64/safe-syscall.inc.S           |  8 +++++
 .../host/arm/safe-syscall.inc.S               |  7 +++++
 .../host/i386/safe-syscall.inc.S              |  9 ++++++
 .../host/ppc64/safe-syscall.inc.S             |  0
 .../host/riscv/safe-syscall.inc.S             |  0
 .../host/s390x/safe-syscall.inc.S             |  0
 .../host/x86_64/safe-syscall.inc.S            |  9 ++++++
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
 29 files changed, 137 insertions(+), 171 deletions(-)
 create mode 100644 common-user/common-safe-syscall.S
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (92%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (93%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (93%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (100%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (94%)
 rename {linux-user => common-user}/safe-syscall.h (98%)

-- 
2.33.0


