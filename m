Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E684A0448
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:38:26 +0100 (CET)
Received: from localhost ([::1]:45114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaoz-0001LG-RK
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:38:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaf1-0008Uc-V2
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:08 -0500
Received: from [2607:f8b0:4864:20::131] (port=36725
 helo=mail-il1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDaey-0001Vh-0x
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:07 -0500
Received: by mail-il1-x131.google.com with SMTP id c18so169202ilr.3
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmi0rSnuMmuGV+LBZTaMcE2m6go10QepAirogcigrCA=;
 b=mUH1Xqu4h/h43a5kwDuItIyZHEjJG1mrips+W+TRjxOnOtNcb4W9Nk4wmGoCwFfefh
 yZ72/G9hTf+g+OUn3TnzBRoGsQEKU230arV7pXcKyPFQ2IGjecx7v8KWkQroqCIkHfIq
 fKZM+1l2XxC7qYpBQmpDZHiENmdEVZzT0uMMLrjZHJp7AO714aPj/QYfJMCfblDOrerq
 QWqKhs99C7iyDwtFDuLDMNIFvt+mWf2M09JoF8DV9T4Ine6SeRFMgMard1UOacDJOTUv
 HM3JaRPBGUNY3jqlDFIi/SlG9A4t0CrLlXrvhpVJ3+ausjIryOsHGhW0d5HdGCyZtObp
 pydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmi0rSnuMmuGV+LBZTaMcE2m6go10QepAirogcigrCA=;
 b=Qa4hTrPJU7HxHHsfgBupkHI6aALDaMvNESnF1tXV8vdtxMnJ4sAog104oq/Up5jZlk
 C9xHrEhG3NunfdSY+BTdagxkA5CaX++Bd7AfWe8UMGwIq50ig7roeq3XEzADGrdyTeVU
 /00J6IePfXtI094OYqpima8Rg6fuCnKWychwNoegrHc9zCRNfTxFhxbmqOtVj3XfB4eO
 /mGGWXCmhHQcxbllFW+FaDJvoyA0pZHJlamQzIjKx55MYhWY4311X1LLs2fvCS+gk/gW
 o8h91SeeHabRz5bF9tl5OaAAx1HRi8gXSEPDEhQ/iqrkWlnZ8POpbWhAdHMJDnS+ycnS
 QUJw==
X-Gm-Message-State: AOAM531MMWRiFBUbu8E6M7do963ffBTHqKaSdmu3g39HfdmOL/va/JOa
 b0RZgAKLOemtTjV8NRwhibVqE1xCKoAs3g==
X-Google-Smtp-Source: ABdhPJxbX950eLkEpxkMSVKL6GrgTGjpkrMN7wH7v2PybV1N9x1VSlbgy7fn7/zoSWa9ZqtzFrdFSg==
X-Received: by 2002:a92:a001:: with SMTP id e1mr7382270ili.108.1643412481123; 
 Fri, 28 Jan 2022 15:28:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/40] bsd-user: upstream signal implementation
Date: Fri, 28 Jan 2022 16:27:25 -0700
Message-Id: <20220128232805.86191-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::131
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::131;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x131.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

bsd-user's signal implementation is similar to linux-user's. The full context
can be found in the bsd-user's fork's 'blitz branch' at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz which shows how these
are used to implement various system calls. Since this was built from
linux-user's stack stuff, evolved for BSD with the passage of a few years, it
no-doubt missed some bug fixes from linux-user (though nothing obvious stood out
in the quick comparison I made). After the first round of reviews, many of these
improvements have been incorporated.

All the patches have been reviewed by at least one person, except these hunks:
    bsd-user/signal.c: implement do_sigaction
    bsd-user/signal.c: implement do_sigreturn
though more eyes on any if these changes is quite welcome. All the patches have
also been forward ported to the bsd-user 'blitz' branch and we now pass more
tests there than we did before (though it's only back up to a similar number of
tests to our ancient rebase-3.2 version).

New in version 3:

o Fixed do_sigcation to allow querying of SIGKILL or SIGSTOP.
o Fixed host/target confusion for do_sigaction return codes. Also added comments
  about why we use sigprocmask(2) instead of pthread_sigmask(3) since a question
  about this came up in review.
o For do_sigreturn, don't set the actual signal mask, but instead defer that
  to the main loop to avoid races with signals that are newly active, but
  blocked by the signal handler's signal mask and the main loop, as is done
  in linux-user.
o Fixed or added a number of comments based on review feedback for typos or todo
  items.
o bsd-user/signal-common.h: Move signal functions prototypes to here
  Move includes of signal-common.h to this patch hunk in */target_arch_cpu.h to fix
  compile issues.
o Also, rebased to current tip of master and fixed a minor conflict or two (which
  should get rid of the does not apply warning on patchew).

Patchew history: https://patchew.org/QEMU/20220125012947.14974-1-imp@bsdimp.com/

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
 bsd-user/arm/signal.c                 |   59 +-
 bsd-user/arm/target_arch_cpu.h        |  101 +--
 bsd-user/freebsd/target_os_siginfo.h  |   15 +-
 bsd-user/freebsd/target_os_signal.h   |    3 +
 bsd-user/freebsd/target_os_ucontext.h |    6 +-
 bsd-user/host/arm/host-signal.h       |   35 +
 bsd-user/host/i386/host-signal.h      |   37 +
 bsd-user/host/x86_64/host-signal.h    |   37 +
 bsd-user/i386/signal.c                |   13 +
 bsd-user/i386/target_arch_cpu.h       |    5 +-
 bsd-user/main.c                       |   14 +-
 bsd-user/qemu.h                       |   66 +-
 bsd-user/signal-common.h              |   70 ++
 bsd-user/signal.c                     | 1008 ++++++++++++++++++++++++-
 bsd-user/strace.c                     |   97 +++
 bsd-user/syscall_defs.h               |    1 +
 bsd-user/trace-events                 |   11 +
 bsd-user/trace.h                      |    1 +
 bsd-user/x86_64/signal.c              |   13 +
 bsd-user/x86_64/target_arch_cpu.h     |    5 +-
 meson.build                           |    6 +-
 22 files changed, 1490 insertions(+), 114 deletions(-)
 create mode 100644 bsd-user/host/arm/host-signal.h
 create mode 100644 bsd-user/host/i386/host-signal.h
 create mode 100644 bsd-user/host/x86_64/host-signal.h
 create mode 100644 bsd-user/signal-common.h
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

-- 
2.33.1


