Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B8949A213
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:38:15 +0100 (CET)
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAmk-0006Rs-6D
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:38:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAej-0001gY-P1
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:57 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=39489
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeh-0001KE-Ep
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:29:57 -0500
Received: by mail-io1-xd2c.google.com with SMTP id p20so224036iod.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgdXFbKPsl0pGi+jLAeZL5i7Cl9XXdNsblwyezsNLS8=;
 b=YVBVybzGJxn5TOKGGujepo43CqldFLNz28okyVh2DisypjRU2hHYuGxr/fGejpR32d
 8dbNIi3f808ZUw3MAh3vKTrzcHqk9avxX5T1foX4UnWDPJBq1KPK64ZQu6IO9UwprkEp
 f2f4OVN3UoFK3hFxKNjJXMSLkg78w22MFUZpgPuQGWFEAjX1fgIPdL5QZG0UukFIIXAK
 DDnBQJsrf4CCxfrlTUFX6DQVuPzlHcKNValGOyfVio6v4ArRbI2zOne8mc+P9Q6l9R8X
 wZqVk5yqARlLwe45ct8IpvRYcNXMSvCrK/jiyWXbx84rjtZCgPzOb6/sTBROeDMM4h+t
 Edww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QgdXFbKPsl0pGi+jLAeZL5i7Cl9XXdNsblwyezsNLS8=;
 b=rSGRjfH9A7LRyTI4r8Xhayc0Tkepc/vtwCFnzeXlRLSdZY8HQADOJ4KoXwd41XdaGD
 Y/uLykobodQ9Rm+qHcCvP35uuYdreFlKA5RYoDseJ93f8HZr/SBAN+KBqlyC7yTCHI0p
 Sbb+hUxlzakdj4FRx19L5vw2YrdtR6WEVAOvzZMxcBtjK/ced8wOHNKgdVjM0nVx2XPB
 +FV9CXwB1+Vzm2JxFb/uehzYDoGoyIQS7nU5+DGQLCVWjyBuihuAIuVuj3Gms7V/rdoN
 NHE96d7sQ5Vi/7bvSEu/yW9Z+4+Mlasd4ViGpZitQaE64ISQ09lns8zMC5HOJU6/OLCq
 u4HA==
X-Gm-Message-State: AOAM533BWg434bjnWSHLeZszZYdXJJ9o+1lnmEOp7RaLT5v+Dh92iV4s
 nYLSMHKg/8gpMvGNr6HsQyqDgluf103RCg==
X-Google-Smtp-Source: ABdhPJxnWHZTec3NPg9J4qifdLtqCcZ7he8+XY4pkNDAcPrSKYedowGdIMhwAu+pCT6IhgvsVdaJ+g==
X-Received: by 2002:a05:6638:3287:: with SMTP id
 f7mr8090100jav.121.1643074193170; 
 Mon, 24 Jan 2022 17:29:53 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:29:52 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/40] bsd-user: upstream our signal implementation
Date: Mon, 24 Jan 2022 18:29:07 -0700
Message-Id: <20220125012947.14974-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upstream the bsd-user fork signal implementation, for the most part.  This
series of commits represents nearly all of the infrastructure that surround
signals, except the actual system call glue (that was also reworked in the
fork and needs its own series). In addition, this adds the sigsegv and sigbus
code to arm. Even in the fork, we don't have good x86 signal implementation,
so there's little to upstream for that at the moment.

bsd-user's signal implementation is similar to linux-user's. However, all
signals are always queued for batch processing (except synchronous ones that
kill the process). The full context can be found in the fork's 'blitz branch'
at https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz which shows how
these are used to implement various system calls. Since this was built from
linux-user's stack stuff, evolved for BSD with the passage of a few years,
it no-doubt missed some bug fixes from linux-user (though nothing obvious
stood out in the quick comparison I made).

I lumped thinks slightly larger than past patch sets, but none of the patches
should exceed about 100 lines of diffs (there is one that clocks in at 166
though, but I had trouble splitting it smaller). With over 30k lines of diffs
between the two repos, I need to find more efficient ways of getting things
reviewed and each extra chunk takes time to curate so I'm searching for a good
happy medium.

New in version 2:

Lots of changes based on feedback garnered in v1. The patch numbers are only
loosely related as some were dropped or merged and others were added. I've
not rebased this yet to a newer revision due to the volume of changes.

o Removed an unnecessary memset for the signal table, it's already all 0's.
o Fixed a number of comments as suggested in the first round of review.
o yoda speak removed have I.
o added a path to the MAINTAINERS entry for bsd related VMs
o removed MIPS code from trapframe construction
o Add si_code call to queue_signal
o Remove final remnants of signal queueing on BSD
o Add documentation of fields of the task structure
o Remove a bunch of comments that are no longer correct or turned out to
  be false...
o Get FSR directly from the siginfo rather than doing crazy things to
  find it.
o Move target_sigaltstack_used to ts->sigaltstack_used and adjust all
  references to be per-stack.
o rename force_sig to dump_core_and_abort
o Create a new setup_sigframe_arch to save/restore context. Most
  architectures this is just get_mcontext, but arm needs special
  setup.
o Move to generating SIGILL when we can't write the signal trap frame.
o Add comments about a few extreme edge cases for SIGILL instructions
o rewrite arm's host_signal_write to use the trap frame it needs to
  get the data rather than the prior bogus assumptions.
o Add more comments to the signal related Task elements, cribbed from
  linux-user
o Move to storing QEMU supecific signal si_code, stored in the top
  8 bits of si_code. BSD uses bit 16 to indicate the code is 'generic'
  and not tied to a specific signal type, so we have to preserve that
  bit. Only bit 16 is used, but steer clear by using the top 8 bits.
o Don't gratuitously move fatal_signal
o add has_trapno function for those signals that have si_trapno.
o Move to using synchronous signals or signals artificially crated by
  qemu. Since only one of these can ever happen at the time, we
  can simplify the code in a manner similar to linux-user.
o Fix a number of "see this routine" pointers to match modern FreeBSD
  and/or remove obsolete architectures from the generic pointers.
o Fixed the division of labor between host_to_target_siginfo_noswap
  and tswap_siginfo. We now record a 'si_type' field that can be
  used to determine which parts of the siginfo are valid. _noswap
  will record its guess and if that guess is present, tswap_siginfo
  will use it.
o Fix arm get_mcontext to match what FreeBSD does by removing saving
  of vfp there and zeroing the vfp pointers.
o Exclude SIGPROF when CONFIG_GPROF active.
o A few formatting issues that I'd ignored for version 1.
o consistently used env as the name for CPUArchState (noted in one
  patch, but present in more and in a couple places in upstream so
  I fixed those too).

Not adressed:
o Signal mask issues around sigaction and sigreturn. These will be
  addressed while people comment on the rest of these changes. I've
  noted the exact details in a couple of commit messages.

Warner Losh (40):
  bsd-user: Complete FreeBSD siginfo
  bsd-user: Create setup_sigframe_arch to setup sigframe context
  bsd-user/arm/signal.c: Implement setup_sigframe_arch for arm
  bsd-user/arm/signal.c: get_mcontext should zero vfp data
  bsd-user: Remove vestiges of signal queueing code
  bsd-user: Bring in docs from linux-user for signal_pending
  bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to match linux-user
  bsd-user/signal.c: implement force_sig_fault
  bsd-user/signal-common.h: Move signal functions prototypes to here
  bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
  bsd-user/signal.c: implement cpu_loop_exit_sigbus
  bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and EXCP_BKPT together
  bsd-user/arm/target_arch_cpu.h: Correct code pointer
  bsd-user/arm/target_arch_cpu.h: Use force_sig_fault for EXCP_UDEF
  bsd-user/arm/target_arch_cpu.h: Implement data faults
  bsd-user/signal.c: implement abstract target / host signal translation
  bsd-user/signal.c: Implement signal_init()
  bsd-user/signal.c: Add si_type argument to queue_signal
  bsd-user/host/arm/host-signal.h: Implement host_signal_*
  bsd-user/host/i386/host-signal.h: Implement host_signal_*
  bsd-user/host/x86_64/host-signal.h: Implement host_signal_*
  bsd-user: Add host signals to the build
  bsd-user: Add trace events for bsd-user
  bsd-user/signal.c: host_to_target_siginfo_noswap
  bsd-user/signal.c: Implement rewind_if_in_safe_syscall
  bsd-user/signal.c: Implement host_signal_handler
  bsd-user/strace.c: print_taken_signal
  bsd-user/signal.c: Implement dump_core_and_abort
  bsd-user/signal.c: Fill in queue_signal
  bsd-user/signal.c: sigset manipulation routines.
  bsd-user/signal.c: setup_frame
  bsd-user/signal.c: handle_pending_signal
  bsd-user/signal.c: tswap_siginfo
  bsd-user/signal.c: process_pending_signals
  bsd-user/signal.c: implement do_sigreturn
  bsd-user/signal.c: implement do_sigaction
  bsd-user/signal.c: do_sigaltstack
  MAINTAINERS: Add tests/vm/*bsd to the list to get reviews on
  bsd-user: Rename arg name for target_cpu_reset to env
  bsd-user/freebsd/target_os_ucontext.h: Prefer env as arg name for
    CPUArchState args

 MAINTAINERS                           |    1 +
 bsd-user/arm/signal.c                 |   58 +-
 bsd-user/arm/target_arch_cpu.h        |  101 +--
 bsd-user/freebsd/target_os_siginfo.h  |   15 +-
 bsd-user/freebsd/target_os_signal.h   |    3 +
 bsd-user/freebsd/target_os_ucontext.h |    6 +-
 bsd-user/host/arm/host-signal.h       |   35 +
 bsd-user/host/i386/host-signal.h      |   37 +
 bsd-user/host/x86_64/host-signal.h    |   37 +
 bsd-user/i386/signal.c                |   13 +
 bsd-user/i386/target_arch_cpu.h       |    4 +-
 bsd-user/main.c                       |   14 +-
 bsd-user/meson.build                  |    1 +
 bsd-user/qemu.h                       |   62 +-
 bsd-user/signal-common.h              |   70 ++
 bsd-user/signal.c                     | 1001 ++++++++++++++++++++++++-
 bsd-user/strace.c                     |   97 +++
 bsd-user/syscall_defs.h               |    1 +
 bsd-user/trace-events                 |   11 +
 bsd-user/trace.h                      |    1 +
 bsd-user/x86_64/signal.c              |   13 +
 bsd-user/x86_64/target_arch_cpu.h     |    4 +-
 meson.build                           |    6 +-
 23 files changed, 1477 insertions(+), 114 deletions(-)
 create mode 100644 bsd-user/host/arm/host-signal.h
 create mode 100644 bsd-user/host/i386/host-signal.h
 create mode 100644 bsd-user/host/x86_64/host-signal.h
 create mode 100644 bsd-user/signal-common.h
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

-- 
2.33.1


