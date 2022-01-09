Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41724488A7F
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:22:36 +0100 (CET)
Received: from localhost ([::1]:54642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6axk-0008GQ-QE
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:22:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auq-0005Lo-3M
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:32 -0500
Received: from [2607:f8b0:4864:20::12a] (port=41675
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6auo-00075G-0C
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:31 -0500
Received: by mail-il1-x12a.google.com with SMTP id r16so7580457ile.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Ajgwozg3paFt7418rmf8mX1DG99wM6UiWdyLPwYeRo=;
 b=J3bDqTvdKbFksf38cLdOvIFODvhX3pXeQi1G+hoh1jPtrk4GbEAgtATBhB9gVj84Ul
 ULs9jXTdZAvdUZnggfTGmAxXW+G/H6/xp6DAQHGmK+9wT36753qe+Yq9DkrYmdPfli7l
 slgc+sOKI962iarFBHrTUNza2d8ZB2TB/y1qa+LuMUc42ZvpBkjLiTdUUt657nKaxfnn
 3CuwhaarCgGzOIUjvimNwH2fUrWPA2ZHKa9og9pPGGZeETKTCKFR400yHGVWLhifJLaM
 6rUFJJMnGto0ZyxRuwESqmQH/78Zli6Wj3agVhh5SUdomw1gaP1QoOfgJ7x04sBovdmM
 A7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Ajgwozg3paFt7418rmf8mX1DG99wM6UiWdyLPwYeRo=;
 b=KahrYHAwER8GTSxHK1gXz/qBko4diuiGzSsXjsF2bVEv6AdLJUJAzHCIsSpkCQc/Jw
 VXPUT5YZb5T7oueuEWnNkZVBXacoIAmF6tq1o/EZvXdON44yrEvqoaJhWZzvFb+rFn4+
 N1gHUE1ZBnEyOfRIF8Jj2fjGdQ2o9kflFONlmZbUlA9ijWPHynUEXuLO+i3fsOpWQM3J
 +wWkVb0JVye342Iqiiz/JA/oijhAuLYRKlrf08Y9rqCEDz63/1NDCyRb5M+rUubGtA2E
 Hhc3rvtmp7rhuebyF9njX4Q8zGrITtNFEDoC/RNFanROK3/zk7cxzK9RYUcKq7O6x2+6
 2DRg==
X-Gm-Message-State: AOAM531qYpxxaaCiKDmv6jQnWw770zmYS9MBJX7NG3kEoRv0V9JZqlXc
 R3Kdzj6pikHZGKS2fh0HyIIrK06aH4ePjPrB
X-Google-Smtp-Source: ABdhPJzBnIQdHw01IwHXUj3N2DuwLKdTuH4KkXJSK4L4YIdKHEvOUYZCtyPWZQGTU7h2EFnK4F8bfg==
X-Received: by 2002:a05:6e02:1ba6:: with SMTP id
 n6mr1931358ili.69.1641745167218; 
 Sun, 09 Jan 2022 08:19:27 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:26 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/30] bsd-user: upstream our signal implementation
Date: Sun,  9 Jan 2022 09:18:53 -0700
Message-Id: <20220109161923.85683-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
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

Warner Losh (30):
  bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to match linux-user
  bsd-user/signal.c: implement force_sig_fault
  bsd-user/signal.c: Implement cpu_loop_exit_sigsegv
  bsd-user/signal.c: implement cpu_loop_exit_sigbus
  bsd-user/arm/arget_arch_cpu.h: Move EXCP_DEBUG and EXCP_BKPT together
  bsd-user/arm/target_arch_cpu.h: Correct code pointer
  bsd-user/arm/target_arch_cpu.h: Use force_sig_fault for EXCP_UDEF
  bsd-user/arm/target_arch_cpu.h: Implement data faults
  bsd-user/signal.c: implement abstract target / host signal translation
  bsd-user/signal.c: Implement signal_init()
  bsd-user/host/arm/host-signal.h: Implement host_signal_*
  bsd-user/host/i386/host-signal.h: Implement host_signal_*
  bsd-user/host/x86_64/host-signal.h: Implement host_signal_*
  bsd-user: Add host signals to the build
  bsd-user: Add trace events for bsd-usr
  bsd-user/signal.c: host_to_target_siginfo_noswap
  bsd-user/signal.c: Implement rewind_if_in_safe_syscall
  bsd-user/signal.c: Implement host_signal_handler
  bsd-user/strace.c: print_taken_signal
  bsd-user/signal.c: core_dump_signal
  bsd-user/signal.c: force_sig
  bsd-user/signal.c: Fill in queue_signal
  bsd-user/signal.c: sigset manipulation routines.
  bsd-user/signal.c: setup_frame
  bsd-user/signal.c: handle_pending_signal
  bsd-user/signal.c: tswap_siginfo
  bsd-user/signal.c: process_pending_signals
  bsd-user/signal.c: implement do_sigreturn
  bsd-user/signal.c: implement do_sigaction
  bsd-user/signal.c: do_sigaltstack

 bsd-user/arm/target_arch_cpu.h     |   91 +--
 bsd-user/host/arm/host-signal.h    |   39 ++
 bsd-user/host/i386/host-signal.h   |   37 +
 bsd-user/host/x86_64/host-signal.h |   37 +
 bsd-user/meson.build               |    1 +
 bsd-user/qemu.h                    |   46 +-
 bsd-user/signal-common.h           |   14 +
 bsd-user/signal.c                  | 1001 +++++++++++++++++++++++++++-
 bsd-user/strace.c                  |   97 +++
 bsd-user/syscall_defs.h            |    1 +
 bsd-user/trace-events              |   11 +
 bsd-user/trace.h                   |    1 +
 meson.build                        |    6 +-
 13 files changed, 1327 insertions(+), 55 deletions(-)
 create mode 100644 bsd-user/host/arm/host-signal.h
 create mode 100644 bsd-user/host/i386/host-signal.h
 create mode 100644 bsd-user/host/x86_64/host-signal.h
 create mode 100644 bsd-user/signal-common.h
 create mode 100644 bsd-user/trace-events
 create mode 100644 bsd-user/trace.h

-- 
2.33.1


