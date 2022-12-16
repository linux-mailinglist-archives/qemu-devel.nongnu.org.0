Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B09064EA48
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:24:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68n7-00021q-UK; Fri, 16 Dec 2022 06:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n5-00021E-D6
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:11 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n3-00067I-7X
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:10 -0500
Received: by mail-wm1-x32d.google.com with SMTP id m19so1620756wms.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BVjUIAv0VcoY5sHYYZW+J4ocC/Chj2cplXNd+0lHjJI=;
 b=vfQJ+kkTj04zxdeD8i7CPuik35xI51iUjR22GlPD6FQYmppAD3izN24nAyAk2xAMoL
 BhrAuhAJ7mZjNQRbQKo6Kv3+Q+EEbwxBHu952A/mQUi0m24sr0KXNltnb8mw31eRBXoi
 2zKr20/l5guwb4ngN1prUJ7Fg6ubP4Ul2oT/W9zck1OTyolKFLYQxriaiKRcefCb1klR
 jxOOHIgixp68Nm/SPDdsSziGnSwpldMxDJYbu7/z5xFsKS4gTXoggBE2aTN1ffEvgVUV
 GnpYWTh+okYiA0GmhP1TFKcloJeOjJYnks4B0TwVRhuGUZBU0vqpOgHMjxpEV5UnBjqF
 tvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVjUIAv0VcoY5sHYYZW+J4ocC/Chj2cplXNd+0lHjJI=;
 b=qWBn37+JgePXxCbRhJRzGCBlY4+WHCbKH8JTtk/RDSZn+9QUAW/gx/6wwxVbdEYRCu
 DiszdrswpJpVgWJLy+Ttko8gtE+6kEinFGOp/W4XuEA2cF26WCa8tn0wDRALbwNVicPy
 KXF6IkzGTKELuytWZhKUQ+IgIUNspWI/+0LES6e1u7rqEQe2lQxzusTMer06uz/oW/my
 R9XV4hPPWWajU64SQxN1pxkHTSXAxkICQfAo/JyOcJo+IQzC/Zsv94V93iAMnqkXshLf
 zELUpwr+4mZHjxcbl9OibO4bpyWHAgYW9RLUw2erbrx74KhhnRnNX5TuRAog3bk7CIBg
 JdCQ==
X-Gm-Message-State: ANoB5pmBUTYJAhbDNzl4PSxZknxEl3h5MYCt0hCsPd00QQNFr/D6Iq7I
 WwUeI7MOm/Hm0BpXXfbKYDi82A==
X-Google-Smtp-Source: AA0mqf4nLyYMQsxLdcZTYNF3Rt1Ul/GOHW2+ZZxsSu0m2rfOLezPU2MuYSF+xL3yj/6PLppxVtiS7A==
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id
 g14-20020a05600c310e00b003cfa39feb2amr25285065wmo.11.1671189727721; 
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a1c7710000000b003c6f3f6675bsm8968906wmi.26.2022.12.16.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DC4AC1FFB7;
 Fri, 16 Dec 2022 11:22:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 00/10] split user and system code in gdbstub
Date: Fri, 16 Dec 2022 11:21:56 +0000
Message-Id: <20221216112206.3171578-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi,

We currently re-compile gdbstub for every single target on the system.
Part of the reason for this is we have a lot of conditional #ifdefs to
handle the differences between user and system mode debugging. To use
the CONFIG_USER_ONLY and CONFIG_SOFTMMU defines you require using
NEED_CPU which ensures CONFIG_TARGET is included.

This series starts to pull things apart so we split user and system
specific code into their appropriate files and reduce the amount of
#ifdef stuff in gdbstub. The work is not complete but hopefully shows
the direction of travel.

We also split up the public headers so other parts of the code aren't
forced to bring in all the additional NEED_CPU stuff just to access
the core API. The GDB helpers which do have to be host/target aware to
deal with byte swaps are now in their own mini-header.

What remains:

  - re-factoring inline #ifdef blocks
  - eliminating target_ulong usage
  - once no longer target dependent move gdbstub to common_ss

The command table is one section that still requires handling the
differences between user and system mode so I think that might end up
being split into a separate file or possibly figuring out how to
compile gdbstub just twice, once for user_ss (with CONFIG_USER_ONLY
manually defined) and once for system_ss. Any pointers on the meson
magic to do that gratefully received.

Please review

Alex Bennée (9):
  gdbstub/internals.h: clean up include guard
  gdbstub: fix-up copyright and license files
  gdbstub: split GDBConnection from main structure
  gdbstub: move GDBState to shared internals header
  includes: move tb_flush into its own header
  includes: add new gdbstub include directory
  gdbstub: move chunk of softmmu functionality to own file
  gdbstub: move chunks of user code into own files
  gdbstub: retire exec/gdbstub.h

Philippe Mathieu-Daudé (1):
  gdbstub: Make syscall_complete/[gs]et_reg target-agnostic typedefs

 bsd-user/qemu.h                              |    2 +-
 gdbstub/internals.h                          |  139 +-
 include/exec/exec-all.h                      |    1 -
 include/exec/tb-flush.h                      |   19 +
 include/{exec/gdbstub.h => gdbstub/common.h} |  141 +-
 include/gdbstub/helpers.h                    |  101 ++
 include/gdbstub/user.h                       |   43 +
 linux-user/user-internals.h                  |    1 +
 accel/kvm/kvm-all.c                          |    2 +-
 accel/stubs/tcg-stub.c                       |    1 +
 accel/tcg/tb-maint.c                         |    1 +
 accel/tcg/tcg-accel-ops.c                    |    2 +-
 accel/tcg/translate-all.c                    |    1 +
 cpu.c                                        |    1 +
 gdbstub/gdbstub.c                            | 1331 ++----------------
 gdbstub/softmmu.c                            |  514 ++++++-
 gdbstub/user-target.c                        |  283 ++++
 gdbstub/user.c                               |  348 ++++-
 hw/ppc/spapr_hcall.c                         |    1 +
 linux-user/exit.c                            |    2 +-
 linux-user/main.c                            |    3 +-
 linux-user/signal.c                          |    2 +-
 monitor/misc.c                               |    2 +-
 plugins/core.c                               |    1 +
 plugins/loader.c                             |    2 +-
 semihosting/arm-compat-semi.c                |    2 +-
 semihosting/console.c                        |    2 +-
 semihosting/guestfd.c                        |    2 +-
 semihosting/syscalls.c                       |    3 +-
 softmmu/cpus.c                               |    2 +-
 softmmu/runstate.c                           |    2 +-
 softmmu/vl.c                                 |    2 +-
 stubs/gdbstub.c                              |    2 +-
 target/alpha/gdbstub.c                       |    2 +-
 target/alpha/sys_helper.c                    |    1 +
 target/arm/gdbstub.c                         |    3 +-
 target/arm/gdbstub64.c                       |    2 +-
 target/arm/helper-a64.c                      |    2 +-
 target/arm/kvm64.c                           |    2 +-
 target/arm/m_helper.c                        |    2 +-
 target/avr/gdbstub.c                         |    2 +-
 target/cris/gdbstub.c                        |    2 +-
 target/hexagon/gdbstub.c                     |    2 +-
 target/hppa/gdbstub.c                        |    2 +-
 target/i386/gdbstub.c                        |    2 +-
 target/i386/kvm/kvm.c                        |    2 +-
 target/i386/whpx/whpx-all.c                  |    2 +-
 target/loongarch/gdbstub.c                   |    3 +-
 target/m68k/gdbstub.c                        |    2 +-
 target/m68k/helper.c                         |    3 +-
 target/m68k/m68k-semi.c                      |    4 +-
 target/microblaze/gdbstub.c                  |    2 +-
 target/mips/gdbstub.c                        |    2 +-
 target/mips/tcg/sysemu/mips-semi.c           |    3 +-
 target/nios2/cpu.c                           |    2 +-
 target/nios2/nios2-semi.c                    |    3 +-
 target/openrisc/gdbstub.c                    |    2 +-
 target/openrisc/interrupt.c                  |    2 +-
 target/openrisc/mmu.c                        |    2 +-
 target/ppc/cpu_init.c                        |    2 +-
 target/ppc/gdbstub.c                         |    3 +-
 target/ppc/kvm.c                             |    2 +-
 target/riscv/csr.c                           |    1 +
 target/riscv/gdbstub.c                       |    3 +-
 target/rx/gdbstub.c                          |    2 +-
 target/s390x/gdbstub.c                       |    3 +-
 target/s390x/helper.c                        |    2 +-
 target/s390x/kvm/kvm.c                       |    2 +-
 target/sh4/gdbstub.c                         |    2 +-
 target/sparc/gdbstub.c                       |    2 +-
 target/tricore/gdbstub.c                     |    2 +-
 target/xtensa/core-dc232b.c                  |    2 +-
 target/xtensa/core-dc233c.c                  |    2 +-
 target/xtensa/core-de212.c                   |    2 +-
 target/xtensa/core-de233_fpu.c               |    2 +-
 target/xtensa/core-dsp3400.c                 |    2 +-
 target/xtensa/core-fsf.c                     |    2 +-
 target/xtensa/core-lx106.c                   |    2 +-
 target/xtensa/core-sample_controller.c       |    2 +-
 target/xtensa/core-test_kc705_be.c           |    2 +-
 target/xtensa/core-test_mmuhifi_c3.c         |    2 +-
 target/xtensa/gdbstub.c                      |    2 +-
 target/xtensa/helper.c                       |    2 +-
 MAINTAINERS                                  |    2 +-
 gdbstub/meson.build                          |    2 +
 gdbstub/trace-events                         |    4 +-
 scripts/feature_to_c.sh                      |    2 +-
 target/xtensa/import_core.sh                 |    2 +-
 88 files changed, 1680 insertions(+), 1401 deletions(-)
 create mode 100644 include/exec/tb-flush.h
 rename include/{exec/gdbstub.h => gdbstub/common.h} (61%)
 create mode 100644 include/gdbstub/helpers.h
 create mode 100644 include/gdbstub/user.h
 create mode 100644 gdbstub/user-target.c

-- 
2.34.1


