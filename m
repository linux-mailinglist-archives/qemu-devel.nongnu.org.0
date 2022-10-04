Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9B75F45F8
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:55:23 +0200 (CEST)
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofjKM-0004tq-80
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidO-0001zK-EK
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:10:58 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofidM-0004Ha-K4
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 10:10:58 -0400
Received: by mail-pf1-x42c.google.com with SMTP id q7so5652636pfl.9
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 07:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=IKveQ/m0E5RysQc4pboDJ3G4kcoJin+r5T1Hiv1sZXM=;
 b=xxyS+0Gz6q1MW/EFTKDHC4RqDulXXkNKqbbX8Q7++Rh/Najj+cJwG4BC0vbupZG5UX
 12ezHfPoHn6dZ7Edi8aqWPoOXeKzNZHsRPOtk1Uxh2qLeW7Zu/lUAXXV3GQgmJe/Al7E
 AgOpGaFe+XLrXRdF4z7NJcc6tVJBbrEo7SXCxrMwywnOgozPdFRV3d0qOtR6OM4OHJHo
 JzAr54C3fIMuR/52NaoJcF3rcNTMIJt7XvA0BAeU3tVkaN8y7ZT3x8pxE8crPLdJT/dt
 4wa+aYuESbRmPFgTihr4GGriOnht/RHR3UT9wJ75P1bKNv+XB9Y9XaEDLPllc59dy3qL
 c6BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=IKveQ/m0E5RysQc4pboDJ3G4kcoJin+r5T1Hiv1sZXM=;
 b=uY7o76yN/tPH7GqWnPUc1ACPkCXJAjPGvnDaGGFqlCsp7jy/Whp4eCO4tTwn1zZHWg
 fP1lgXiL+xyjHz3+PQt6g68m25/nQy533IYdZJx8EReWwDhBNT1gSnWO0gW3p1mm+ETt
 z6/7mTtAdmS/Pjxy6qQ8cLAAQs+Xcmf5feoYYseGE65bM0vNW7gxpaWlJ81GFyUEHE74
 67HUBj864l9uGEpRDEf7iVll+oig0AI8Is1lKKzRztz6h0895DMzQ/lULnLymm9R6V73
 /h3P1N9KF2u5+NhEhy0nQqdVURhRG0gsMz4ztq0oEj6IasbeEj93oz4/rtdC5BLclNor
 8kcg==
X-Gm-Message-State: ACrzQf2Ydawz+0mqpl+CVYsEDeZmvDgJuFwQ4/B0Y2X3BY3cTRvFBhMR
 ibOxV3MnGt1+csSTAf7Yqu5guZ+/KR2gHQ==
X-Google-Smtp-Source: AMsMyM42ga1crS8i0FiHNWsyT1OYCJforQ8tif8QdZLhGDyt2UOg7KeC/Ir4ZN2GwFvcliiZyfe3Rw==
X-Received: by 2002:a63:5762:0:b0:43c:c1b5:3e75 with SMTP id
 h34-20020a635762000000b0043cc1b53e75mr22886723pgm.380.1664892654582; 
 Tue, 04 Oct 2022 07:10:54 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8015:12b0:403e:a15b:ff5e:d439])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa79ae5000000b00561382a5a25sm1240357pfp.26.2022.10.04.07.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 07:10:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v7 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Date: Tue,  4 Oct 2022 07:10:33 -0700
Message-Id: <20221004141051.110653-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v7:
  * Added stub for --disable-tcg (stsquad)
  * Re-worded the commit for patch 13 (stsquad)
  * Split out some more helpers around ifdefs in patch 18 (stsquad)

Patches needing review:
  13-accel-tcg-Do-not-align-tb-page_addr-0.patch
  17-accel-tcg-Introduce-tb_pc-and-log_pc.patch
  18-accel-tcg-Introduce-TARGET_TB_PCREL.patch


r~


Alex Bennée (3):
  cpu: cache CPUClass in CPUState for hot code paths
  hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
  cputlb: used cached CPUClass in our hot-paths

Richard Henderson (15):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  accel/tcg: Inline tb_flush_jmp_cache
  include/hw/core: Create struct CPUJumpCache
  hw/core: Add CPUClass.get_pc
  accel/tcg: Introduce tb_pc and log_pc
  accel/tcg: Introduce TARGET_TB_PCREL

 accel/tcg/internal.h                    |  10 +
 accel/tcg/tb-hash.h                     |   1 +
 accel/tcg/tb-jmp-cache.h                |  65 ++++++
 include/exec/cpu-common.h               |   1 +
 include/exec/cpu-defs.h                 |  48 ++++-
 include/exec/exec-all.h                 |  75 ++++++-
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |  28 ++-
 include/qemu/typedefs.h                 |   2 +
 include/tcg/tcg.h                       |   2 +-
 accel/stubs/tcg-stub.c                  |   4 +
 accel/tcg/cpu-exec.c                    |  80 ++++----
 accel/tcg/cputlb.c                      | 259 ++++++++++++++----------
 accel/tcg/plugin-gen.c                  |  22 +-
 accel/tcg/translate-all.c               | 214 +++++++++-----------
 accel/tcg/translator.c                  |   2 +-
 cpu.c                                   |   9 +-
 hw/core/cpu-common.c                    |   3 +-
 hw/core/cpu-sysemu.c                    |   5 +-
 plugins/core.c                          |   2 +-
 target/alpha/cpu.c                      |   9 +
 target/arm/cpu.c                        |  17 +-
 target/arm/mte_helper.c                 |  14 +-
 target/arm/sve_helper.c                 |   4 +-
 target/arm/translate-a64.c              |   2 +-
 target/avr/cpu.c                        |  10 +-
 target/cris/cpu.c                       |   8 +
 target/hexagon/cpu.c                    |  10 +-
 target/hppa/cpu.c                       |  12 +-
 target/i386/cpu.c                       |   9 +
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |  11 +-
 target/m68k/cpu.c                       |   8 +
 target/microblaze/cpu.c                 |  10 +-
 target/mips/cpu.c                       |   8 +
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/nios2/cpu.c                      |   9 +
 target/openrisc/cpu.c                   |  10 +-
 target/ppc/cpu_init.c                   |   8 +
 target/riscv/cpu.c                      |  17 +-
 target/rx/cpu.c                         |  10 +-
 target/s390x/cpu.c                      |   8 +
 target/s390x/tcg/mem_helper.c           |   4 -
 target/sh4/cpu.c                        |  12 +-
 target/sparc/cpu.c                      |  10 +-
 target/tricore/cpu.c                    |  11 +-
 target/xtensa/cpu.c                     |   8 +
 tcg/tcg.c                               |   8 +-
 trace/control-target.c                  |   2 +-
 50 files changed, 739 insertions(+), 355 deletions(-)
 create mode 100644 accel/tcg/tb-jmp-cache.h

-- 
2.34.1


