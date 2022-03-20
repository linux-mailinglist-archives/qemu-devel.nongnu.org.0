Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9AF4E1D08
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:16:22 +0100 (CET)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzAD-0002j0-7I
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:16:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5g-0008JQ-GU
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:40 -0400
Received: from [2607:f8b0:4864:20::535] (port=34779
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5e-0003Ph-9J
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:39 -0400
Received: by mail-pg1-x535.google.com with SMTP id t187so8736966pgb.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cn7Tq9d8JU/29Z2I0zkVPYVTmmMiHTu6JIy+zbzkI4w=;
 b=iRydV+XyUOvmgRxaOt1BxfPFBSjHnki5cJTEeZXNNYWpiSmAJSgx4j/g0KI+Yc1ehp
 zq5WDeetqCfZs5kbzgXcajzccfIqd+Pv1AAZOaOYO5xnTQBlIqUyxBLkANxAEEvSJU5w
 OY9+NyMX8r5F3Es6GvGDrvUFX44KuRJOgssnAI81mRgN6MG0ZffFB1A3uYeY08WaqTV8
 BIoUqCrROC+yCakICsW4BNKu9vyAZ2yHIOL+Nzam4A5aLlzyvvWSV3xz76utM1lyqJal
 +0JNljJisHkOVub72AJUiEhe46LwQh2maoQPPmTwxel/Qk8bMhfeqkzDt4LCeydR0gav
 G1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cn7Tq9d8JU/29Z2I0zkVPYVTmmMiHTu6JIy+zbzkI4w=;
 b=nhRgxEHXvf+FfH95WlaAmCfIx/tyImusESdEXamSgInkp6EI7KOp2x2j00geYB1Sn1
 B8tc5+alsdga9ABP+RHO4H2bEvOxc+QwYM013J8GHFBZTaCoJR/p4x5QkNXCRqsyNOjH
 ydN/IaYNCFLBzpqsQDdItiO0vH6PF2UMQLaE7f5X52+mPFVvCb2ibI7MJ6Wy00xI+nk4
 /dbLKe0De3rEbfAysGUp63qhGerjjP/LBicz54Up115iJad6lSF/VmCGNGNt29wWLrDH
 HWtmY1d7x9EihdxHS3mnd8AzCsH0fDmYqH7+/zDCJHcUP64ScSbKLmi6qq/EiKPuSUKa
 IX9g==
X-Gm-Message-State: AOAM530EOOezvjJifZTrXYHHDagiJqwx4syY2jvRJKAVrksRgZFxLsXK
 kkiOTJK9aXj+bDYPMHrH8ALOkq/mQgbHCw==
X-Google-Smtp-Source: ABdhPJwajsiwEubNtu4CTG6lcjwN+wSfcfERADVwaqzq/sqK8hYE+g0BhNuTKZsKNT+W+zPYBPBMiQ==
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id
 q7-20020a056a00088700b004f26d3f5b53mr19839443pfj.21.1647796296547; 
 Sun, 20 Mar 2022 10:11:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 00/36] Logging cleanup and per-thread logfiles
Date: Sun, 20 Mar 2022 10:10:59 -0700
Message-Id: <20220320171135.2704502-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most of the changes here reduce the amount of locking involved
in logging, due to repeated qemu_log calls, each of which takes
and releases the rcu_read_lock.

This makes more use of qemu_log_lock/unlock around code blocks,
which both keeps the output together in the face of threads and
also plays the rcu_read_lock game only once for the block.

Finally, add a -d tid option to open per-thread logfiles.
This can be extremely helpful in debugging user-only threads.


r~


Richard Henderson (36):
  util/log: Drop manual log buffering
  target/hexagon: Remove qemu_set_log in hexagon_translate_init
  util/log: Pass Error pointer to qemu_set_log
  os-posix: Use qemu_log_enabled
  util/log: Move qemu_log_lock, qemu_log_unlock out of line
  util/log: Treat qemu_log_lock like trylock
  hw/xen: Split out xen_pv_output_msg
  *: Use fprintf between qemu_log_lock/unlock
  util/log: Remove qemu_log_vprintf
  tcg: Pass the locked filepointer to tcg_dump_ops
  exec/translator: Pass the locked filepointer to disas_log hook
  exec/log: Remove log_disas and log_target_disas
  accel/tcg: Use cpu_dump_state between qemu_log_lock/unlock
  target/nios2: Remove log_cpu_state from reset
  util/log: Use qemu_log_lock/unlock in qemu_log
  util/log: Remove qemu_log_flush
  util/log: Drop call to setvbuf
  bsd-user: Expand log_page_dump inline
  linux-user: Expand log_page_dump inline
  tests/unit: Do not reference QemuLogFile directly
  include/exec/log: Do not reference QemuLogFile directly
  include/qemu/log: Move entire implementation out-of-line
  sysemu/os-win32: Test for and use _lock_file/_unlock_file
  util/log: Introduce qemu_set_log_filename_flags
  bsd-user: Use qemu_set_log_filename_flags
  linux-user: Use qemu_set_log_filename_flags
  softmmu: Use qemu_set_log_filename_flags
  util/log: Remove qemu_log_close
  util/log: Rename logfilename to global_filename
  util/log: Rename qemu_logfile to global_file
  util/log: Rename qemu_logfile_mutex to global_mutex
  util/log: Hoist the eval of is_daemonized in qemu_set_log_internal
  util/log: Combine two logfile closes
  util/log: Rename QemuLogFile to RCUCloseFILE
  util/log: Limit RCUCloseFILE to file closing
  util/log: Support per-thread log files

 meson.build                          |  12 +
 include/exec/log.h                   |  52 +----
 include/exec/translator.h            |   2 +-
 include/qemu/log.h                   |  91 +-------
 include/sysemu/os-win32.h            |  16 +-
 accel/tcg/cpu-exec.c                 |  16 +-
 accel/tcg/translate-all.c            | 116 +++++-----
 accel/tcg/translator.c               |  10 +-
 bsd-user/main.c                      |  44 ++--
 cpu.c                                |  10 +-
 hw/net/can/can_sja1000.c             |  24 +-
 hw/xen/xen_pvdev.c                   |  45 ++--
 linux-user/main.c                    |  55 +++--
 linux-user/mmap.c                    |   7 +-
 monitor/misc.c                       |   7 +-
 net/can/can_socketcan.c              |  23 +-
 os-posix.c                           |   2 +-
 qemu-img.c                           |   2 +-
 qemu-io.c                            |   2 +-
 qemu-nbd.c                           |   2 +-
 scsi/qemu-pr-helper.c                |   2 +-
 softmmu/vl.c                         |  21 +-
 storage-daemon/qemu-storage-daemon.c |   2 +-
 target/alpha/translate.c             |   7 +-
 target/arm/translate-a64.c           |   6 +-
 target/arm/translate.c               |   7 +-
 target/avr/translate.c               |   7 +-
 target/cris/translate.c              |   7 +-
 target/hexagon/translate.c           |  13 +-
 target/hppa/translate.c              |  15 +-
 target/i386/tcg/translate.c          |  20 +-
 target/m68k/translate.c              |   7 +-
 target/microblaze/translate.c        |   7 +-
 target/mips/tcg/translate.c          |   7 +-
 target/nios2/cpu.c                   |   5 -
 target/nios2/translate.c             |   7 +-
 target/openrisc/translate.c          |   7 +-
 target/ppc/translate.c               |   7 +-
 target/riscv/translate.c             |  10 +-
 target/rx/translate.c                |   7 +-
 target/s390x/tcg/translate.c         |  11 +-
 target/sh4/translate.c               |   7 +-
 target/sparc/translate.c             |   7 +-
 target/tricore/translate.c           |   7 +-
 target/xtensa/translate.c            |   7 +-
 tcg/tcg.c                            | 176 +++++++-------
 tests/unit/test-logging.c            |  40 ++--
 util/log.c                           | 331 +++++++++++++++++----------
 48 files changed, 669 insertions(+), 626 deletions(-)

-- 
2.25.1


