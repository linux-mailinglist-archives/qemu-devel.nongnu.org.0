Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61574541D55
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:12:39 +0200 (CEST)
Received: from localhost ([::1]:48214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhRG-0000Yx-FV
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5S-0006o0-Pw
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:02 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5Q-0001Iw-JZ
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:02 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so21958880pjo.0
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6vcY8qogonlajNUBXAIjuy6oECLrCgUeezvtV2Vc+E=;
 b=Z2E4zpVQb9yLaGs2s4IkL1AatdNs/juygz0dW3oEPMycy31JzG3FgnW3+f1ZUg1cpv
 r+pbShQcRgVqZ1mjlR/wQ6JHyACJocFvywBwuLM8LjKY7uMK8yBK9uQNksYvvqzjJ4sJ
 n2+qznLJn/MVBWF6LZ/4c73rkdHWKxCGVNWeZGw7vj/00R0+cn3cnQHhrPQqtJXLC1Fk
 n2BvkafaoKKXAzhrzRTqTN0KrzSnfigOj83yQB/I4dfevUNHgM4ghxMmsn7bgJEIoI9p
 Rg5Vj8nPz1i/EytdnT2aPqBGwuaLbc4g5knjJcVMUHO0qX0ObPLEjVXVZ6fGgpo/V3CB
 Rbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6vcY8qogonlajNUBXAIjuy6oECLrCgUeezvtV2Vc+E=;
 b=prunjUruUP2UOd20dHI4jo8Q2hYxxlM551zWW9aRCsTNirAFzX72JX6xGBXMhQuWAr
 wpEwXIR0rarlOab44iBFMXUWOsAbr8sjRhvL0IQzQnINsyOjkkieJTRzwt5p5NXxiO4M
 fkiQOtDytANfmHKoFBhuF1STQRwfcyR9p7F+YiF9ARL1adltSrs3YZOu3Y8Ubu2GuM6d
 NGj6vO34ubuk58ZRLWqkqyZF+uEq4oJ47CCJSX/0hdrFeTH+FEBo/8atFO73QoE1vUBn
 Veq9oYbaMy9syU4aiMXjzCEUNjzCsn19pID3vzeMliOAs2lYipXZlUzzF7rfexA+QZFe
 LjTg==
X-Gm-Message-State: AOAM531j6GimEK2roFmwiLD1xCvZWPOymw3r1jdJQbc3nutYyeHUzJSL
 Q/ProwgYm/oadOhqSfucd57DVZybjtlsyw==
X-Google-Smtp-Source: ABdhPJz8r+Y310bzlzxFMptf1paIo0UJmM1vkP5pVlyJz7AyWtczbknlo8sJjLF6Ef1MoYbnY/oUFQ==
X-Received: by 2002:a17:90b:1a8f:b0:1e8:7dfe:c4f with SMTP id
 ng15-20020a17090b1a8f00b001e87dfe0c4fmr13832274pjb.17.1654634759055; 
 Tue, 07 Jun 2022 13:45:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.45.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:45:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/53] semihosting cleanup
Date: Tue,  7 Jun 2022 13:45:04 -0700
Message-Id: <20220607204557.658541-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Standarize on host errno in callbacks.  So, from gdbstub, convert
    back to host errors, mapping GDB_EUNKNOWN to EINVAL.
  * Add tcg stub for probe_access_flags, to match existing stubs.
  * Misc tweaks per review.

Richard Henderson (53):
  semihosting: Move exec/softmmu-semi.h to semihosting/softmmu-uaccess.h
  semihosting: Return failure from softmmu-uaccess.h functions
  semihosting: Improve condition for config.c and console.c
  semihosting: Move softmmu-uaccess.h functions out of line
  accel/stubs: Add tcg stub for probe_access_flags
  semihosting: Add target_strlen for softmmu-uaccess.h
  semihosting: Simplify softmmu_lock_user_string
  semihosting: Split out guestfd.c
  semihosting: Inline set_swi_errno into common_semi_cb
  semihosting: Adjust error checking in common_semi_cb
  semihosting: Clean up common_semi_flen_cb
  semihosting: Clean up common_semi_open_cb
  semihosting: Return void from do_common_semihosting
  semihosting: Move common-semi.h to include/semihosting/
  semihosting: Remove GDB_O_BINARY
  include/exec: Move gdb open flags to gdbstub.h
  include/exec: Move gdb_stat and gdb_timeval to gdbstub.h
  include/exec: Define errno values in gdbstub.h
  gdbstub: Convert GDB error numbers to host error numbers
  semihosting: Use struct gdb_stat in common_semi_flen_cb
  semihosting: Split is_64bit_semihosting per target
  semihosting: Split common_semi_flen_buf per target
  semihosting: Split out common_semi_has_synccache
  semihosting: Split out common-semi-target.h
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
  gdbstub: Adjust gdb_syscall_complete_cb declaration
  semihosting: Fix docs comment for qemu_semihosting_console_inc
  semihosting: Pass CPUState to qemu_semihosting_console_inc
  semihosting: Expand qemu_semihosting_console_inc to read
  semihosting: Cleanup chardev init
  semihosting: Create qemu_semihosting_console_write
  semihosting: Add GuestFDConsole
  semihosting: Create qemu_semihosting_guestfd_init
  semihosting: Use console_in_gf for SYS_READC
  semihosting: Use console_out_gf for SYS_WRITEC
  semihosting: Remove qemu_semihosting_console_outc
  semihosting: Use console_out_gf for SYS_WRITE0
  semihosting: Remove qemu_semihosting_console_outs
  semihosting: Create semihost_sys_poll_one

 configs/targets/aarch64-linux-user.mak        |    1 +
 configs/targets/aarch64_be-linux-user.mak     |    1 +
 configs/targets/arm-linux-user.mak            |    1 +
 configs/targets/armeb-linux-user.mak          |    1 +
 configs/targets/riscv32-linux-user.mak        |    1 +
 configs/targets/riscv64-linux-user.mak        |    1 +
 include/exec/gdbstub.h                        |   64 +-
 include/exec/softmmu-semi.h                   |  101 --
 .../semihosting}/common-semi.h                |    2 +-
 include/semihosting/console.h                 |   71 +-
 include/semihosting/guestfd.h                 |   91 ++
 include/semihosting/semihost.h                |   14 +-
 include/semihosting/softmmu-uaccess.h         |   59 +
 include/semihosting/syscalls.h                |   75 ++
 target/arm/common-semi-target.h               |   62 +
 target/riscv/common-semi-target.h             |   50 +
 accel/stubs/tcg-stub.c                        |    7 +
 gdbstub.c                                     |   38 +-
 linux-user/aarch64/cpu_loop.c                 |    2 +-
 linux-user/arm/cpu_loop.c                     |    2 +-
 linux-user/main.c                             |    9 +
 linux-user/riscv/cpu_loop.c                   |    2 +-
 linux-user/semihost.c                         |   48 +-
 semihosting/arm-compat-semi.c                 | 1010 ++++-------------
 semihosting/config.c                          |   17 +-
 semihosting/console.c                         |  153 +--
 semihosting/guestfd.c                         |  160 +++
 semihosting/syscalls.c                        |  978 ++++++++++++++++
 semihosting/uaccess.c                         |   91 ++
 softmmu/vl.c                                  |    3 +-
 stubs/semihost.c                              |    6 +-
 target/arm/helper.c                           |    4 +-
 target/arm/m_helper.c                         |    2 +-
 target/m68k/m68k-semi.c                       |   52 +-
 target/mips/tcg/sysemu/mips-semi.c            |    2 +-
 target/nios2/nios2-semi.c                     |   48 +-
 target/riscv/cpu_helper.c                     |    2 +-
 semihosting/meson.build                       |    6 +
 38 files changed, 2081 insertions(+), 1156 deletions(-)
 delete mode 100644 include/exec/softmmu-semi.h
 rename {semihosting => include/semihosting}/common-semi.h (96%)
 create mode 100644 include/semihosting/guestfd.h
 create mode 100644 include/semihosting/softmmu-uaccess.h
 create mode 100644 include/semihosting/syscalls.h
 create mode 100644 target/arm/common-semi-target.h
 create mode 100644 target/riscv/common-semi-target.h
 create mode 100644 semihosting/guestfd.c
 create mode 100644 semihosting/syscalls.c
 create mode 100644 semihosting/uaccess.c

-- 
2.34.1


