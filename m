Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D2F508F15
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:09:14 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhElN-0000Mo-5L
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEie-0005Fc-I7
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:24 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:54112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEic-0001AP-82
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:24 -0400
Received: by mail-pj1-x1034.google.com with SMTP id bx5so2663983pjb.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5W43CSk7ekDIBcgmOaRjhSBHZ+fyPxz/OW3Wr7epQI=;
 b=AZ2pqmDTlVbTbkRxq3XmuSgz4xMeWNT9ASR73xR4poP1d8I8ViILMiid7b9V60Tb7A
 6v6yEgl1nBjzbTp8ruTQy9CBafc64mwTTxDhPo+c2jyFOaWlwD9q7wM6Gn+z39YpK6E6
 2BpRg2IyxJ/NYNy1nryBrdK6IH0W7UWSguBccoZidGLXVASJyrTM9k5sL7hBIO3qxkZ6
 XIan87tYePUJWf9IaLouQE6G3FjDLpvKRYehsiikn8QeL/VBDqtERSx12Y9Kug/z8HxU
 FQx7QcL3srn6873rWp6RNvLj2vlujKAE0t/LHNK/vegwF8/dFx2oYJded0JRDgpxMT7T
 cfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G5W43CSk7ekDIBcgmOaRjhSBHZ+fyPxz/OW3Wr7epQI=;
 b=628ewiY9jog1VVwklxpbLFwKZaNaL3eWfHSF5Ixc0hMQ0R+tO8TPJR6gfXysVNKiRP
 N9uzb7SUcka7FGmyXc/qq5WDMdVwYgl86uDo9TtFjIK/Qa3jmuf5mpgl1sX+SXcCgC8H
 LIlWfx81urryfT+OAvtBuXd67TGTtRaQibBJNTI9PCdr0j4RNKFghPFNqflCmcE//j4J
 LkasygAN61BsZqJNOvalWtZXs4J+ai6KWvbkPl1h5FvH/BYAlpHhEHlVqyX7smknp322
 9+WtV6zF5PNtAtBQwJTmIrpuZTR5k34g3M3DsGLhJ6LJKTG47V0FopBmn54sPJTd++vJ
 gMtw==
X-Gm-Message-State: AOAM533fODZjApe+dCQaEXY9yxhSaEwFN3AtTGIag8nuIG3IomNsvl9Z
 3MIcZC5l6kOL+46AGAgwuF/wBi1IEBQIsQ==
X-Google-Smtp-Source: ABdhPJxl5QzxthgEX/hlCDne0OFKvj4OcLAGseQbWJdFOmWo8orMLFPe6+lKEQHpKsiAIpkecfpDxA==
X-Received: by 2002:a17:90b:4a05:b0:1d2:bdc9:df39 with SMTP id
 kk5-20020a17090b4a0500b001d2bdc9df39mr5827164pjb.51.1650477980163; 
 Wed, 20 Apr 2022 11:06:20 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/39] Logging cleanup and per-thread logfiles
Date: Wed, 20 Apr 2022 11:05:39 -0700
Message-Id: <20220420180618.1183855-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

The following changes since commit 40a4b96eb08b3a3e83895f46b2394748dac7a641:

  Merge tag 'pull-block-2022-04-20' of https://gitlab.com/hreitz/qemu into staging (2022-04-20 09:39:33 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-log-20220420

for you to fetch changes up to 4e51069d679348d2617512e56e28cdc7bb34c833:

  util/log: Support per-thread log files (2022-04-20 10:51:11 -0700)

----------------------------------------------------------------
Clean up log locking.
Use the FILE* from qemu_log_trylock more often.
Support per-thread log files with -d tid.

----------------------------------------------------------------
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

 meson.build                          |  12 ++
 include/exec/log.h                   |  52 +----
 include/exec/translator.h            |   2 +-
 include/qemu/log-for-trace.h         |   2 +-
 include/qemu/log.h                   |  93 +--------
 include/sysemu/os-win32.h            |  16 +-
 accel/tcg/cpu-exec.c                 |  18 +-
 accel/tcg/translate-all.c            | 118 +++++------
 accel/tcg/translator.c               |  12 +-
 bsd-user/main.c                      |  54 ++---
 cpu.c                                |  16 +-
 hw/net/can/can_sja1000.c             |  25 +--
 hw/xen/xen_pvdev.c                   |  45 +++--
 linux-user/main.c                    |  55 +++--
 linux-user/mmap.c                    |   7 +-
 monitor/misc.c                       |   9 +-
 net/can/can_socketcan.c              |  24 ++-
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
 tcg/tcg.c                            | 184 ++++++++---------
 tests/unit/test-logging.c            |  42 ++--
 util/log.c                           | 377 +++++++++++++++++++++++------------
 49 files changed, 724 insertions(+), 659 deletions(-)

