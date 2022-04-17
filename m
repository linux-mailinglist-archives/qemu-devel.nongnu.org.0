Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCBE50491B
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 20:58:23 +0200 (CEST)
Received: from localhost ([::1]:36976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA6I-0004Ia-Ht
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 14:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fG-0000P4-37
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:31 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:39927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fD-0001j7-QV
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 mp16-20020a17090b191000b001cb5efbcab6so15555238pjb.4
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYZWMLCOPqytMKjpTxt4PChntLmKz4ywnYurORPkagE=;
 b=JxIVY3nVJ3MUMsa7dVmmv0b3U+xljxlVhNPig5a6y7/XyVDcdha6+KfyFvfmRsZhW1
 UOnXEl4l8oVMfrrGhlLeDjm0K7CzTRMKhKnZIDpzcK5BkW+yUwmT1tS7AlOMv5dRjJ6m
 1dMqvGETTGnJPNjMk2ypNklVdrlBqton+XgPJ99p/r5uIvKYzUoOEZc/M56L09+wjaVi
 psUJyquCAjoMHnYQOaRHmWH95B89K8EuTijmlV655ooPso3zSMD5J63xv8GQiuvPhbYU
 izx1RNmDUyPZmm8goRUJnsCEIdHE5QyKbP7Ir8pTOANuOnnJisNoDPQbAhsSEIMP2SD/
 4Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KYZWMLCOPqytMKjpTxt4PChntLmKz4ywnYurORPkagE=;
 b=FkJCB7UaxZZajeA1bg+hTTIT4ohCGhOkKVVxYVOwiY/wdJs0NBkm2Hv+Ds5ZSXv/jG
 Iz3Zo+CwMzlI7rNna8D+tp1ssJzolEqbguDaKEM2m/8yvpp4pu5ImyHYuiV6qlKRPrXa
 FaplVKfm9hADT1J7kmbt9/R2tRsjZHG97WWy05oGRtIK9jx85ezXwwvDr7vGmstDUlxt
 +IiaPNcxlVteYxH0EioPLbmtBS83wJHKMDv7FOkbRpwL5teqBn3ikaNbAyrh8HmcE34+
 9H1lY9+SOYYRIuxhQM7hgVkV7A0NAhcfw/TQjpafjWKn3E1Eh3+Rq5FQ9o/jjEpwI8OG
 F6sA==
X-Gm-Message-State: AOAM5320qKys6buW8xbBmpW0XlkWLHy2n0PFv5N1G0dsCVXk/4n057Mc
 HC2Bcd5EWd1frdO/u0R3ZBaj06WBQYHcPg==
X-Google-Smtp-Source: ABdhPJyYMLAy8xTmKQR0YCPwByIpWKGqif0K2kUjBE93uUivNGZ/mJa+Zl6COz2GJTbTSo3oepmoaQ==
X-Received: by 2002:a17:90b:1a8b:b0:1d1:a447:7419 with SMTP id
 ng11-20020a17090b1a8b00b001d1a4477419mr9201209pjb.169.1650220220579; 
 Sun, 17 Apr 2022 11:30:20 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/39] Logging cleanup and per-thread logfiles
Date: Sun, 17 Apr 2022 11:29:40 -0700
Message-Id: <20220417183019.755276-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Changes for v3:
  * Updates for review:
    - use 0x%x
    - use enum for valid_filename_template

Changes for v2:
  * Rename qemu_log_lock to qemu_log_trylock to emphasize that
    the call is not guaranteed to succeed.
  * Work around a musl compilation error, caused by our own
    typeof_strip_qual macro not working with incomplete structs.
  * Use CONFIG_GETTID properly.

Patches lacking review:
  24-include-exec-log-Do-not-reference-QemuLogFile-dir.patch
  27-util-log-Introduce-qemu_set_log_filename_flags.patch


r~


Richard Henderson (39):
  util/log: Drop manual log buffering
  target/hexagon: Remove qemu_set_log in hexagon_translate_init
  util/log: Return bool from qemu_set_log_filename
  util/log: Pass Error pointer to qemu_set_log
  os-posix: Use qemu_log_enabled
  util/log: Move qemu_log_lock, qemu_log_unlock out of line
  util/log: Rename qemu_log_lock to qemu_log_trylock
  hw/xen: Split out xen_pv_output_msg
  *: Use fprintf between qemu_log_trylock/unlock
  util/log: Remove qemu_log_vprintf
  tcg: Pass the locked filepointer to tcg_dump_ops
  exec/translator: Pass the locked filepointer to disas_log hook
  exec/log: Remove log_disas and log_target_disas
  accel/tcg: Use cpu_dump_state between qemu_log_trylock/unlock
  target/nios2: Remove log_cpu_state from reset
  util/log: Use qemu_log_trylock/unlock in qemu_log
  util/log: Drop return value from qemu_log
  util/log: Mark qemu_log_trylock as G_GNUC_WARN_UNUSED_RESULT
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
 include/exec/log.h                   |  52 +---
 include/exec/translator.h            |   2 +-
 include/qemu/log-for-trace.h         |   2 +-
 include/qemu/log.h                   |  93 +------
 include/sysemu/os-win32.h            |  16 +-
 accel/tcg/cpu-exec.c                 |  18 +-
 accel/tcg/translate-all.c            | 118 +++++----
 accel/tcg/translator.c               |  12 +-
 bsd-user/main.c                      |  54 ++--
 cpu.c                                |  16 +-
 hw/net/can/can_sja1000.c             |  25 +-
 hw/xen/xen_pvdev.c                   |  45 ++--
 linux-user/main.c                    |  55 ++--
 linux-user/mmap.c                    |   7 +-
 monitor/misc.c                       |   9 +-
 net/can/can_socketcan.c              |  24 +-
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
 target/i386/tcg/translate.c          |  22 +-
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
 tcg/tcg.c                            | 184 ++++++-------
 tests/unit/test-logging.c            |  42 ++-
 util/log.c                           | 377 +++++++++++++++++----------
 49 files changed, 724 insertions(+), 659 deletions(-)

-- 
2.25.1


