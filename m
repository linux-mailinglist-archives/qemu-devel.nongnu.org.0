Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE86DE201
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHVo-0003pV-Kp; Tue, 11 Apr 2023 13:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVj-0003op-Nu
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:27 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVh-00065u-7n
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:27 -0400
Received: by mail-il1-x134.google.com with SMTP id r11so3643288ilb.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bxsQnx9ehE1zVOHOPgeTZP3tJgtOOXVldWzNoyovNdA=;
 b=tp4g7zSlpu8o0EYqJc0RXXmcU4JLDILPCOVfj7tHOlaZnFZXD8s1LcjQL2f8PoGihi
 ERzswkoJJE8fD9vOc57XnbQSOEAGY2kLZ30EnSv9HBtqxgBIox1o1eBxFYOyP2LiP9gM
 aUv3eVB+xcWg1lnZbD4Ty8K2I0HbJBealNosucixH1oDvd4P87WRA/AXqhfk7KKJ3C8h
 2Fouva7EVwRVAihmFl9xTFH7j/q9H0dE9vN8fmvAE1xUDgVfgTweTiMt3BCMaaoekWaW
 VnHmpSyTNmMKgXGz7lXJMCm7+9j7fELnqOhLky5LDKxok+AuDv9nlEeUI6XfKVmq8YUY
 F5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bxsQnx9ehE1zVOHOPgeTZP3tJgtOOXVldWzNoyovNdA=;
 b=gzzkfc9SPkk8AxZ765kUziU6Ppw4QWsefKyH0a9Lt6pu6wc6pyDGQknMTRrmbqzFnN
 6sGY4Qi5s7WhV9U8tilCU5hz6aOGUTq1FCs0SEWaX9OsCMDuch5jnLEFjB0flU3c028P
 HQ1A4eJmlzytSsOhJwamAwZQIv+C8WTI8Fmcc4GVPQNRFP/fgxCayrM7jEPcb7l5fiFr
 yrde7olQ2E2Uazwk6SPKA4GT+1HHlHHJi/PGv0QCjucFtjMd12nl4kwNabPLQYcNBc68
 t8FUHJyJDcy8x0XY3TBFs2b1uzyEPi3N1buLTjtIV09d5swo/aXkVeho8z+vx+kpUKVo
 Y3ng==
X-Gm-Message-State: AAQBX9f2EBzFhi1l5F5qDP9feuXDdfF3yZzGzWrFOkyvEXN/ypOq144J
 755JcZOgpogtdQfAw+xX+kDQj7v9SoUclQCuu10=
X-Google-Smtp-Source: AKy350b69PcFzNTOxTcbCJ1r/HuwBiefgjgQRQMtbmgZk+atu4pmrpbGGqZCRHer3XtfDpy5z7hmHg==
X-Received: by 2002:a05:6e02:546:b0:327:ff13:1de6 with SMTP id
 i6-20020a056e02054600b00327ff131de6mr6551968ils.31.1681233021909; 
 Tue, 11 Apr 2023 10:10:21 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Subject: [PATCH v3 00/20] bsd-user 2023 Q2 first batch
Date: Tue, 11 Apr 2023 11:09:35 -0600
Message-Id: <20230411170955.17358-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

This series is a number of misc cleanups.

First, this replaces my plans to remove netbsd and openbsd code entirely. I've
been in contact with the NetBSD folks that would like to make things work. The
plan is that I'll not remove it in qemu-project, and restore them in bsd-user
fork. These changes clean up some of the mess that's here: I've moved the bits
that make sense here, and removed the ones that don't (but upstream I've moved
them when it makes sense). My intention is to work with the NetBSD folks (and
OpenBSD too if they want) to cope with the structural issues I'm aware of in
bsd-user fork. Future contributions should go via that route at a rate of
contributions (I have little time to do the work, but will commit to finding
time to do the coordination and review work).

Next I've #ifdef'd some mmap handling based on certain flags being defined or
not. This was something I'd removed before, and were in what Taylor sent me, so
I've restored the relevant ones. The rest of the patch that Taylor sent me
conflicts with bsd-user and needs some work to get it in upstream. I removed a
few unused mmap defines as well. And I cleanup mmap.c to remove gratuitous
differences and pass checkpatch.pl.

Next, I've made unimplmeneted system calls generate SIGSYS. For the moment, this
is the best we should do since so much is unimplemented and as things get
implemented this will allow controlled testing of code to ensure it doesn't
silently succeed, giving the impression things are working when they aren't. I
also add SIGSYS to the uncaught coredump signal list, to match FreeBSD's
behavior. I only do this on arm, though, because the signal implementation on
x86 is incomplete (even upstream) and I didn't want to take chances.

Finally, I've included the core dump code. There's about 600 lines of sysctl
support that I've included as separate commits of ~150 lines each (and
incidentlaly, added the translation to os-sys.c for those bits). The core dump
code itself is largely copied from linux-user/elfload.c by sson (so he gets the
author credit). I moved it to elfcore.c when I was upstremaing in the past and
upstreamed a stub. One of the patches in this series replaces elfcore.c and is
1300 lines long. It's not easily sliced up into smaller bits that compile, but
I'm open to suggestions. It's known to "work" in the sense that it will generate
core files that gdb can read and intelligently parse.

This patch series is for after 8.0 is done, but before any GSoC projects start,
and will be independent of any GSoC contribution tasks.

v3: Review comments:
- Delete syscall_nr.h and generate it from source (just did FreeBSD, but this
  will work for any BSD in the future when those compile again).

v2: A few more 'high line count, easy to review' changes:
- Remove a few more files
- Regenerate FreeBSD system calls
- Remove host-os.h, since we no longer plan to support multiple BSDs in one
  binary.
- Review comments: Remove USE_ELF_CORE_DUMP and change ifdefs for MAP_

Need reviews for parts 2, 17, 18, 19 for sure. Parts 3 and 14 just have Acked-by.

Stacey Son (6):
  bsd-user: h2g_rusage
  bsd-user: Implement do_sysctl_kern_getprocs
  bsd-user: Implement do_sysctl_kern_proc_filedesc
  bsd-user: Implement do_sysctl_kern_proc_vmmap
  bsd-user: Implement sysctl kern.proc, except kern.proc.full_path
  bsd-user: Implement core dumps

Warner Losh (14):
  bsd-user: Make print_* public
  bsd-user: Ifdef a few MAP_ constants for NetBSD / OpenBSD.
  bsd-user: Cleanup style.
  bsd-user: Move system FreeBSD call table to freebsd/os-syscall.c
  bsd-user: Remove NetBSD specific syscall printing
  bsd-user: Remove OpenBSD specific syscall printing
  bsd-user: Move system call include to os-syscall.h
  bsd-user: Remove useless mmap definitions
  bsd-user: Add SIGSYS to core dump signals.
  bsd-user: Implement SIGSYS on arm
  bsd-user: Remove host-os.h
  bsd-user: Automatically generate syscall_nr.h
  bsd-user: remove syscall_nr.h
  bsd-user: Eliminate USE_ELF_CORE_DUMP

 bsd-user/arm/target_arch_cpu.h             |    8 +
 bsd-user/arm/target_arch_elf.h             |    1 -
 bsd-user/bsd-proc.c                        |   48 +
 bsd-user/elfcore.c                         | 1315 +++++++++++++++++++-
 bsd-user/elfload.c                         |    5 -
 bsd-user/freebsd/os-sys.c                  |  508 +++++++-
 bsd-user/freebsd/os-syscall.c              |   19 +
 bsd-user/freebsd/os-syscall.h              |   21 +
 bsd-user/freebsd/syscall_nr.h              |  515 --------
 bsd-user/i386/target_arch_elf.h            |    1 -
 bsd-user/main.c                            |    1 -
 bsd-user/meson.build                       |    5 +
 bsd-user/mmap.c                            |  105 +-
 bsd-user/netbsd/host-os.h                  |   25 -
 bsd-user/netbsd/os-syscall.h               |   16 +
 bsd-user/openbsd/host-os.h                 |   25 -
 bsd-user/openbsd/os-syscall.h              |   16 +
 bsd-user/{freebsd/host-os.h => qemu-bsd.h} |   15 +-
 bsd-user/qemu.h                            |   44 +-
 bsd-user/signal.c                          |   13 +-
 bsd-user/strace.c                          |   88 +-
 bsd-user/syscall_defs.h                    |   69 +-
 bsd-user/syscallhdr.sh                     |    7 +
 bsd-user/x86_64/target_arch_elf.h          |    1 -
 meson.build                                |    2 +
 25 files changed, 2100 insertions(+), 773 deletions(-)
 create mode 100644 bsd-user/bsd-proc.c
 create mode 100644 bsd-user/freebsd/os-syscall.h
 delete mode 100644 bsd-user/freebsd/syscall_nr.h
 delete mode 100644 bsd-user/netbsd/host-os.h
 create mode 100644 bsd-user/netbsd/os-syscall.h
 delete mode 100644 bsd-user/openbsd/host-os.h
 create mode 100644 bsd-user/openbsd/os-syscall.h
 rename bsd-user/{freebsd/host-os.h => qemu-bsd.h} (72%)
 create mode 100644 bsd-user/syscallhdr.sh

-- 
2.40.0


