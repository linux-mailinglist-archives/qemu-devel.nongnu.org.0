Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC273CC6BB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:23:02 +0200 (CEST)
Received: from localhost ([::1]:57796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4te9-00049W-JJ
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcL-0001cF-4Z
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:09 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcJ-0000g0-Cl
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:08 -0400
Received: by mail-wm1-x32a.google.com with SMTP id g12so7979491wme.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9fGtdcqn5q5Zsy7soeX7Mski6gANvfjtmkKqUG0V6s=;
 b=UUCNrXt8aZQ0bQ4Tfp8gTHaAIyyPBpJNd7RJKipYcTIkLUtX/OR8tT+RtsYgra4j38
 wkPFc/NSmUh4Ipanvfk4glMGpSgJfRpgvzYzQwCLphDFVzvludlQDe8vCQEwiRHO0slh
 M2/3Hye1IFn5C+kr4wat1oNLG4cWzGymERLvzRbgxo/rX+9rTFniQ4VQ+use9zHwKfec
 EvOyDKTYAGSc13WkGjslOGH1/QUPSCWlzj34s1zdmHKFoAaBiStDx9BzVjtJxN9nDMk7
 uKPC3mK/lJY80f6GeTXXAH3/WkUcBlS/qZ2VGiGNJdbfAoq6CA2FnHKnlEXAaF0b4CrM
 yOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/9fGtdcqn5q5Zsy7soeX7Mski6gANvfjtmkKqUG0V6s=;
 b=InDX0Rwl9c5dPJNqQI4kETdUuxqvSBQTlksRJY3RPaULKEUPkG+xs0itjesLIOyepr
 Fc1gczmEzq1KvGJYjVCPH7PwlYG4bZuXJW6m1P4pXX6ySt0UEWGIZWrEYhVhbfyGjzS3
 8AvOWpH7aL3XjTbJnIEDr7IfgDtouW+JwahSvc6OXmEsX+r5ba9bDHyhboQMhaCwQHhq
 QDnJKKRXSNfLUcgDROTlT5rFbPWrZdA6ipMjVjaHo5Tf+Hx3HMhDSUjYZhFtsTEdTukk
 cYo8+/5KI/jEIxYo7PApx96hM/LhzOdEZqOQZVH5Tsc3FzBxXlC7YCl+LCNopa+ra8C8
 lgVw==
X-Gm-Message-State: AOAM533z0MFSVhMXyUT5dyddvY9yMO8newaFfCii0iEzW5HCSMLzbUOv
 VpJD1iCwObWEXhS/XjmUW3E5I65JRlccRw==
X-Google-Smtp-Source: ABdhPJwmvtf4ZLdRsns3iS12ZdCCF3KL9sPcYsY0Foh0sMPHRiDeFSSD0yqtdtXJ5fwiCIPjjFAzTg==
X-Received: by 2002:a1c:988a:: with SMTP id
 a132mr24173192wme.175.1626564065485; 
 Sat, 17 Jul 2021 16:21:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 00/10] linux-user: split internals out of qemu.h
Date: Sun, 18 Jul 2021 00:20:53 +0100
Message-Id: <20210717232103.18047-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

linux-user/qemu.h is an awkward header, for two reasons:
 (1) its name suggests it's a rather common generic header,
     but it's actually specific to the usermode emulators
 (2) it is a mix of:
   * lots of things internal to the implementation of linux-user
   * functions that a few files outside linux-user want
     (mostly the user-access functions like lock_user,
     get/put_user_*, etc, and also the TaskStruct definition)

This patchset tries to clean it up a bit by at least splitting
most of the "just internal to linux-user" parts out of qemu.h
and putting them in a handful of different .h files that are
then included by the linux-user files that need them.

I think the ideal would probably be to eventually junk
qemu.h entirely and have a few separate headers specifically
for the bits that non-linux-user code needs (eg a 'user-access.h'
for the get/put_user stuff), perhaps located somewhere that
means we don't need to put linux-user/ on the include path.
But that's awkward as it needs interaction with bsd-user too.
So this much cleanup seemed like a reasonable start...

Based-on: 20210717103017.20491-1-peter.maydell@linaro.org
("target/hexagon: Drop include of qemu.h")

thanks
-- PMM

Peter Maydell (10):
  linux-user: Fix coding style nits in qemu.h
  linux-user: Split strace prototypes into strace.h
  linux-user: Split signal-related prototypes into sighandling.h
  linux-user: Split loader-related prototypes into loader.h
  linux-user: Split mmap prototypes into user-mmap.h
  linux-user: Split safe-syscall macro into its own header
  linux-user: Split linux-user internals out of qemu.h
  linux-user: Don't include gdbstub.h in qemu.h
  linux-user: Drop unneeded includes from qemu.h
  linux-user: Move DEBUG_REMAP undef to uaccess.c

 linux-user/loader.h              |  59 +++++
 linux-user/qemu.h                | 432 ++-----------------------------
 linux-user/safe-syscall.h        | 154 +++++++++++
 linux-user/sighandling.h         |  56 ++++
 linux-user/strace.h              |  38 +++
 linux-user/user-internals.h      | 186 +++++++++++++
 linux-user/user-mmap.h           |  34 +++
 gdbstub.c                        |   2 +-
 linux-user/aarch64/cpu_loop.c    |   2 +
 linux-user/aarch64/signal.c      |   2 +
 linux-user/alpha/cpu_loop.c      |   2 +
 linux-user/alpha/signal.c        |   2 +
 linux-user/arm/cpu_loop.c        |   2 +
 linux-user/arm/signal.c          |   2 +
 linux-user/cris/cpu_loop.c       |   2 +
 linux-user/cris/signal.c         |   2 +
 linux-user/elfload.c             |   3 +
 linux-user/exit.c                |   2 +
 linux-user/fd-trans.c            |   2 +
 linux-user/flatload.c            |   3 +
 linux-user/hexagon/cpu_loop.c    |   2 +
 linux-user/hexagon/signal.c      |   2 +
 linux-user/hppa/cpu_loop.c       |   2 +
 linux-user/hppa/signal.c         |   2 +
 linux-user/i386/cpu_loop.c       |   3 +
 linux-user/i386/signal.c         |   2 +
 linux-user/linuxload.c           |   2 +
 linux-user/m68k/cpu_loop.c       |   2 +
 linux-user/m68k/signal.c         |   2 +
 linux-user/main.c                |   5 +
 linux-user/microblaze/cpu_loop.c |   2 +
 linux-user/microblaze/signal.c   |   2 +
 linux-user/mips/cpu_loop.c       |   2 +
 linux-user/mips/signal.c         |   2 +
 linux-user/mmap.c                |   2 +
 linux-user/nios2/cpu_loop.c      |   2 +
 linux-user/nios2/signal.c        |   2 +
 linux-user/openrisc/cpu_loop.c   |   2 +
 linux-user/openrisc/signal.c     |   2 +
 linux-user/ppc/cpu_loop.c        |   2 +
 linux-user/ppc/signal.c          |   2 +
 linux-user/riscv/cpu_loop.c      |   2 +
 linux-user/riscv/signal.c        |   2 +
 linux-user/s390x/cpu_loop.c      |   2 +
 linux-user/s390x/signal.c        |   2 +
 linux-user/semihost.c            |   1 +
 linux-user/sh4/cpu_loop.c        |   2 +
 linux-user/sh4/signal.c          |   2 +
 linux-user/signal.c              |   6 +
 linux-user/sparc/cpu_loop.c      |   2 +
 linux-user/sparc/signal.c        |   2 +
 linux-user/strace.c              |   3 +
 linux-user/syscall.c             |   6 +
 linux-user/uaccess.c             |   3 +
 linux-user/uname.c               |   1 +
 linux-user/vm86.c                |   1 +
 linux-user/xtensa/cpu_loop.c     |   2 +
 linux-user/xtensa/signal.c       |   2 +
 semihosting/arm-compat-semi.c    |   2 +-
 target/m68k/m68k-semi.c          |   2 +-
 target/nios2/nios2-semi.c        |   2 +-
 thunk.c                          |   1 +
 62 files changed, 661 insertions(+), 420 deletions(-)
 create mode 100644 linux-user/loader.h
 create mode 100644 linux-user/safe-syscall.h
 create mode 100644 linux-user/sighandling.h
 create mode 100644 linux-user/strace.h
 create mode 100644 linux-user/user-internals.h
 create mode 100644 linux-user/user-mmap.h

-- 
2.20.1


