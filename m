Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165E515D8F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:32:32 +0200 (CEST)
Received: from localhost ([::1]:43598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknD4-0007pc-UF
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAH-0004df-U6
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAG-0006CO-0E
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:37 -0400
Received: by mail-pg1-x532.google.com with SMTP id r83so8515415pgr.2
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQqYxKXvc2LM8QQo+XpVU94vV3gOrqBTiyRv1lA5ssg=;
 b=ojTeEGKKG4x9n0fi2I1w6JM1bMiBHmzuFWevbhydqGoL8Dnp4ZeGOMvzwrXXaeTBcF
 XiDEGMbky3gpxcsXYXGKTtVjC7Uugw0SfF9lTJUZWQbfoNT7C2dKTMMaxsR3XgqqHyPC
 aSpJPdj5hmH0du9MR6h+zNb8tWK+E8zskNjEfmNDcqJ2s9Lx7XghYZCYqhSVJ8FopEZW
 u3wc5VQtzSjPtKFCq5rlEt8+opCoLF6jwvGQxYEnddDMcPax+F+p7q0h7m2SQv56ewQv
 pvs2afF5B5fvfuVhJtuePlYDSePq3HRpH90xxwaFJcwE4Sg6h52aQ4VF0mBmN+yatt4h
 s80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FQqYxKXvc2LM8QQo+XpVU94vV3gOrqBTiyRv1lA5ssg=;
 b=ILKVvjJCRrd9pL6u7lnwJSCZDl9ig779xj6Gs3I4y1Ra28bV4j4atmjFN5i8QmyOi2
 AeS65y9OFhu0TWQ7N0QM0QQUgioUHAHBGM2G2Qh8kXIsC/f7y1x6S8Y1AXAdNdV2DmoG
 4ezG82AzeaxXkYw7BsWqyCUtWtSqF1WA6+cp+KUaCHkpCKSF/eDxhhkZubYbBSqrEsZs
 fevAc+M8rOJ8wNpGVdmhFPQk4Fwx1zvxXZRyWW/4lz/Cd+etKnVocqQHtnLzfeEJMgpu
 9HViSo9GxbesFeqW6TWC4sbetQyNikfzI/Qo1DTVT4+xKE4HGWDpPqzW/4T1cQu8jdEH
 IUXA==
X-Gm-Message-State: AOAM5318dFuxXY0e1I8tDTdmIgwlmNh15DjCATdI+1T9ZrLB0kcreWFr
 dNjSQhKG5KaDgMitQh9noKAKx7iHLI61qw==
X-Google-Smtp-Source: ABdhPJyA1QM4RrlUWnc90zhFTBPFcBg2cmm2gYYml48MsneOBvwbWo5T3mOUGEqaV1ticQNMZUhXNw==
X-Received: by 2002:a62:1687:0:b0:50d:3364:46d4 with SMTP id
 129-20020a621687000000b0050d336446d4mr3726855pfw.74.1651325374084; 
 Sat, 30 Apr 2022 06:29:34 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/43] semihosting cleanup
Date: Sat, 30 Apr 2022 06:28:49 -0700
Message-Id: <20220430132932.324018-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had whipped up an rx-elf cross toolchain to test something
recently, and since I had built it, thought it would be easy
to use libgloss to run the multiarch hello and memory tests.
But we haven't implemented libgloss-style semihosting for rx.

I had forgotten how much boilerplate there is currently for
implementing semihosting for an architecture.  And we have 3
implementations that really could share much more code.

So: split out semihosting syscalls to individual functions,
and allow them to be wired up with a minimum of fuss.  Fix a
few bugs and to-do items on the way.

Still to do:

  * Merge semihosting console.c into GuestFD.
    The ARM semihosting spec has separate syscalls for console output,
    and expects the read/write syscalls to only apply to files.
    But the other semihosting implementations assume stdin/stdout,
    and we should be able to wire those up via the same mechanism.

  * Errno.  The ARM spec punts this entirely.  But we aren't even
    self-consistant, some paths returning host <errno.h> values,
    and anything going through gdbstub using the gdb remote
    file-io errno values.  The arm and nios2 specs explicitly
    call for the gdb values, which we are not doing.

  * tests/tcg/m68k semihosting implementation.

  * target/rx semihosting implementation.


r~


Richard Henderson (43):
  semihosting: Move exec/softmmu-semi.h to semihosting/softmmu-uaccess.h
  semihosting: Return failure from softmmu-uaccess.h functions
  semihosting: Improve condition for config.c and console.c
  semihosting: Move softmmu-uaccess functions out of line
  semihosting: Add target_strlen for softmmu-uaccess.h
  semihosting: Simplify softmmu_lock_user_string
  semihosting: Split out guestfd.c
  semihosting: Generalize GuestFDFeatureFile
  semihosting: Return void from do_common_semihosting
  semihosting: Adjust error checking in common_semi_cb
  semihosting: Move common-semi.h to include/semihosting/
  include/exec: Move gdb open flags to gdbstub.h
  include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
  semihosting: Use struct gdb_stat in common_semi_flen_cb
  semihosting: Split is_64bit_semihosting per target
  semihosting: Split common_semi_flen_buf per target
  semihosting: Split out common_semi_has_synccache
  semihosting: Use env more often in do_common_semihosting
  semihosting: Move GET_ARG/SET_ARG earlier in the file
  semihosting: Split out semihost_sys_open
  semihosting: Split out semihost_sys_close
  semihosting: Split out semihost_sys_read
  semihosting: Split out semihost_sys_write
  semihosting: Bound length for semihost_sys_{read,write}
  semihosting: Split out semihost_sys_lseek
  semihosting: Split out semihost_sys_isatty
  semihosting: Split out semihost_sys_flen
  semihosting: Split out semihost_sys_remove
  semihosting: Split out semihost_sys_rename
  semihosting: Split out semihost_sys_system
  semihosting: Create semihost_sys_{stat,fstat}
  semihosting: Create semihost_sys_gettimeofday
  gdbstub: Widen gdb_syscall_complete_cb return value
  target/m68k: Eliminate m68k_semi_is_fseek
  target/m68k: Make semihosting system only
  target/m68k: Use guestfd.h to implement syscalls.
  target/m68k: Do semihosting call as a normal helper
  target/m68k: Enable semihosting for non-coldfire
  target/m68k: Remove EXCP_HALT_INSN
  target/nios2: Eliminate nios2_semi_is_lseek
  target/nios2: Move nios2-semi.c to nios2_softmmu_ss
  target/nios2: Use guestfd.h to implement syscalls.
  target/nios2: Do semihosting call as a normal helper

 configs/targets/aarch64-linux-user.mak        |   1 +
 configs/targets/aarch64_be-linux-user.mak     |   1 +
 configs/targets/arm-linux-user.mak            |   1 +
 configs/targets/armeb-linux-user.mak          |   1 +
 configs/targets/riscv32-linux-user.mak        |   1 +
 configs/targets/riscv64-linux-user.mak        |   1 +
 include/exec/gdbstub.h                        |  43 +-
 include/exec/softmmu-semi.h                   | 101 --
 .../semihosting}/common-semi.h                |   2 +-
 include/semihosting/guestfd.h                 |  95 ++
 include/semihosting/softmmu-uaccess.h         |  59 ++
 target/arm/common-semi-target.h               |  62 ++
 target/m68k/cpu.h                             |   3 -
 target/m68k/helper.h                          |   1 +
 target/nios2/cpu.h                            |   3 -
 target/nios2/helper.h                         |   1 +
 target/riscv/common-semi-target.h             |  50 +
 gdbstub.c                                     |   7 +-
 linux-user/aarch64/cpu_loop.c                 |   2 +-
 linux-user/arm/cpu_loop.c                     |   2 +-
 linux-user/m68k/cpu_loop.c                    |   5 -
 linux-user/riscv/cpu_loop.c                   |   2 +-
 semihosting/arm-compat-semi.c                 | 955 ++++--------------
 semihosting/console.c                         |   7 +-
 semihosting/guestfd.c                         | 935 +++++++++++++++++
 semihosting/uaccess.c                         |  71 ++
 target/arm/helper.c                           |   4 +-
 target/arm/m_helper.c                         |   2 +-
 target/m68k/m68k-semi.c                       | 374 +------
 target/m68k/op_helper.c                       |  15 -
 target/m68k/translate.c                       |  38 +-
 target/mips/tcg/sysemu/mips-semi.c            |   2 +-
 target/nios2/helper.c                         |   7 -
 target/nios2/nios2-semi.c                     | 357 +------
 target/nios2/translate.c                      |   2 +-
 target/riscv/cpu_helper.c                     |   2 +-
 semihosting/meson.build                       |   5 +
 target/m68k/meson.build                       |   6 +-
 target/nios2/meson.build                      |   4 +-
 39 files changed, 1686 insertions(+), 1544 deletions(-)
 delete mode 100644 include/exec/softmmu-semi.h
 rename {semihosting => include/semihosting}/common-semi.h (96%)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 include/semihosting/softmmu-uaccess.h
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h
 create mode 100644 semihosting/guestfd.c
 create mode 100644 semihosting/uaccess.c

-- 
2.34.1


