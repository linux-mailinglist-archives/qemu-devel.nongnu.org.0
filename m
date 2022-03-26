Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DA4E8110
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:30:22 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6Um-0001MK-S7
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:30:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QG-0006gb-FO
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:40 -0400
Received: from [2607:f8b0:4864:20::22a] (port=46636
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6QE-0005Jp-KC
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:25:39 -0400
Received: by mail-oi1-x22a.google.com with SMTP id b188so11061153oia.13
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvDb5ML9Di+6BEqsRvZnWGjvteK4JgJhM9B5XK0ie1E=;
 b=mUs2BFYJcY+2Ee+bjTNNDpaqkbS0Nfb5mNydAKQf2oNPuppBEAQo31npc08HGP3ZK5
 8X5HxXVMJaFZWmlpO8MmI8RuoKGF02poSVFPPom1m8BYVGqfuec93x1uC+onOK3hhsI0
 c72KTSrj4k5zopH/+g9b8UbsLU2htApYbxcDdWZLO2nTbFA8I+dwjnfU35btWiCmDTdc
 9DlviV8h+t7mbpiVQVL/Zzw8zgvoZssK6HqVJ6H87WnyN6EZzaDtwRHZ94q6YNppvK/q
 9YUxb1PXYSKERCKwfpxu6xBdvqgB5ZIpANF+r8qY7fQlKDYzJEvem03SHNAty8BD+A4S
 bZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CvDb5ML9Di+6BEqsRvZnWGjvteK4JgJhM9B5XK0ie1E=;
 b=jwDUCOOFw1fbTK2igMiXhpDszaR1+B9KikZlgVuQ+AwE66Wj8Ahf3yk6kdqMKDWyKV
 OYNecDEcyE3KmbLddatrUtuz/Q/9X+cK134nm5H4f81LvDbdljQk/Necb0pOGbMGb0ZQ
 yC177oVOnvOmZqlEdr5l+QXLme/H1biple2VGi3hj4BBnba1Ki7zEF1vXKdbcb+Muq7b
 goKFfn+SqhHZWu/mv1YogSSN1x3Y92VLF3quLoe07QCudWXxqvtLrtE9+BQHVNLe59L0
 IA2+9O/eYfrX1F1Yt5iDwz514PyuJrJZbB6Awrz7KJadCS/tiOJF8eYrMmg9fjEINOj2
 Cagg==
X-Gm-Message-State: AOAM531xYpQEUklLCyUCdMtxSrVgHNFZ0WbzQ2YMjWl2zb6/JZnYUDLR
 qsvGMhF2Dm5gOlPh5fYg78pdFAVWkoWPB8HB
X-Google-Smtp-Source: ABdhPJzp4BA+vnH7kcrQbnlw/L7FHiV++y7nQGOj4+V3tHL9ljppPmyv5qPy3OVSD0tzg6xD70tURA==
X-Received: by 2002:a05:6808:658:b0:2ec:f29f:eb99 with SMTP id
 z24-20020a056808065800b002ecf29feb99mr12608067oih.226.1648301137448; 
 Sat, 26 Mar 2022 06:25:37 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:25:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v2 00/39] Logging cleanup and per-thread logfiles
Date: Sat, 26 Mar 2022 07:24:47 -0600
Message-Id: <20220326132534.543738-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
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

Changes for v2:
  * Rename qemu_log_lock to qemu_log_trylock to emphasize that
    the call is not guaranteed to succeed.
  * Work around a musl compilation error, caused by our own
    typeof_strip_qual macro not working with incomplete structs.
  * Use CONFIG_GETTID properly.


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
 tcg/tcg.c                            | 184 +++++++-------
 tests/unit/test-logging.c            |  42 ++-
 util/log.c                           | 365 +++++++++++++++++----------
 49 files changed, 712 insertions(+), 659 deletions(-)

-- 
2.25.1


