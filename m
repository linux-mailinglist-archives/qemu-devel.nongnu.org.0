Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4005965FD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 01:28:21 +0200 (CEST)
Received: from localhost ([::1]:53164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO5yv-0008Pi-1K
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 19:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uE-0002oi-ND
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:31 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:41804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oO5uC-0007gy-IA
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 19:23:30 -0400
Received: by mail-pl1-x62a.google.com with SMTP id p18so10555204plr.8
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 16:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=sTup4VV/u0r80RwDu0jpxutnOePECPuysMHa3xKomXk=;
 b=FBhQ0de8IUwNumccT70jWU1uxtNIWa4YnYwDItc+HRbyKpxWbVXA47P4LBUebytVVT
 ExUV3m0MGoHo6xjq/o1unXWgEAdzCWxYj+4D+pxs7WFYsBsfxRaG+QFNMJOKKI7bRxLy
 jZnv9Bfx1DLWZQDK89ssOzlApuiD/2F67NXtKKt+IoYv2it+XypJbX0ogcz9XwpI7qNx
 Gp1QJZPEPSBuQ7Yz/ucXdLEkEFTgTl0MgM+T60snA9P+u+UH0bSZbtd6nbNq+Yge6m1d
 41c9VfV1ZYF44RZQi18LEs2bpt8UsD4L1gs42k/jqafeV7w6inob0rhiLFTCuahAn+TD
 Y8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=sTup4VV/u0r80RwDu0jpxutnOePECPuysMHa3xKomXk=;
 b=6kKywOfgdT5rrrc4O/zfiW+jm0LPkn574WhJxAFS8subvmhHYRxPL4W5jZw0gBgSAg
 dRo9VBjKprsK6a1S1aZxOUAFpmZpWerhVurAymfHOR2bEakTycUfoozfCXH/hpSqxS8M
 GNHC0X0L8ms68z/cnOgztsIZZnOeA0s7Yk2Wf6ShdHAXFz+HPw24YovioGsha69z6W9m
 hP5bUqvJQBRqqbbgnFZnySr4D0LduZgjusjhPEZYglbeYLuNaTjPto08iatpVsOYP6OQ
 +eNLMGLoBmNLwKj6/+GRqFagZbbgBf8TZR6+OFBLM1En62gUHO5nVKlUNuSvrurAUA94
 +HFQ==
X-Gm-Message-State: ACgBeo0uw3oPXaBq3x3GqB6ceTKyXjKqe7WBcmflcMo7mtRvWotdH3Gz
 1qHO+DxM+h5XLhjIqDp5EopzXj5XhTQ0kw==
X-Google-Smtp-Source: AA6agR5PaRA+9nIN/4B1HW+Cu6gNIfB5ZLERByYvU8l1k9OPOLq5q2eh38PJZHPfh8oboVUnvHhuiA==
X-Received: by 2002:a17:902:854b:b0:170:d646:d69 with SMTP id
 d11-20020a170902854b00b00170d6460d69mr24181470plo.135.1660692206587; 
 Tue, 16 Aug 2022 16:23:26 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a2c4400b001eafa265869sm78608pjm.56.2022.08.16.16.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 16:23:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v13 0/6] Improve PMU support
Date: Tue, 16 Aug 2022 16:23:15 -0700
Message-Id: <20220816232321.558250-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor-level
extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension[2] allows the perf like tool to handle overflow interrupts and
filtering support.

This series implements remaining PMU infrastructure to support
PMU in virt machine. The first seven patches from the original series
have been merged already.

This will allow us to add any PMU events in future.
Currently, this series enables the following omu events.
1. cycle count
2. instruction count
3. DTLB load/store miss
4. ITLB prefetch miss

The first two are computed using host ticks while last three are counted during
cpu_tlb_fill. We can do both sampling and count from guest userspace.
This series has been tested on both RV64 and RV32. Both Linux[3] and Opensbi[4]
patches are required to get the perf working.

Here is an output of perf stat/report while running hackbench with latest
OpenSBI & Linux kernel.

Perf stat:
==========
[root@fedora-riscv ~]# perf stat -e cycles -e instructions -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses \
> perf bench sched messaging -g 1 -l 10
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 1 groups == 40 processes run

     Total time: 0.265 [sec]

 Performance counter stats for 'perf bench sched messaging -g 1 -l 10':

     4,167,825,362      cycles                                                      
     4,166,609,256      instructions              #    1.00  insn per cycle         
         3,092,026      dTLB-load-misses                                            
           258,280      dTLB-store-misses                                           
         2,068,966      iTLB-load-misses                                            

       0.585791767 seconds time elapsed

       0.373802000 seconds user
       1.042359000 seconds sys

Perf record:
============
[root@fedora-riscv ~]# perf record -e cycles -e instructions \
> -e dTLB-load-misses -e dTLB-store-misses -e iTLB-load-misses -c 10000 \
> perf bench sched messaging -g 1 -l 10
# Running 'sched/messaging' benchmark:
# 20 sender and receiver processes per group
# 1 groups == 40 processes run

     Total time: 1.397 [sec]
[ perf record: Woken up 10 times to write data ]
Check IO/CPU overload!
[ perf record: Captured and wrote 8.211 MB perf.data (214486 samples) ]

[root@fedora-riscv riscv]# perf report
Available samples                                                               
107K cycles                                                                    ◆
107K instructions                                                              ▒
250 dTLB-load-misses                                                           ▒
13 dTLB-store-misses                                                           ▒
172 iTLB-load-misses      
..

Changes from v12->v13:
1. Rebased on top of the apply-next.
2. Addressed comments about space & comment block.

Changes from v11->v12:
1. Rebased on top of the apply-next.
2. Aligned the write function & .min_priv to the previous line.
3. Fixed the FDT generations for multi-socket scenario.
4. Dropped interrupt property from the DT.
5. Generate illegal instruction fault instead of virtual instruction fault
   for VS/VU access while mcounteren is not set.

Changes from v10->v11:
1. Rebased on top of the master where first 7 patches were already merged.
2. Removed unnecessary additional check in ctr predicate function.
3. Removed unnecessary priv version checks in mcountinhibit read/write. 
4. Added Heiko's reviewed-by/tested-by tags.

Changes from v8->v9:
1. Added the write_done flags to the vmstate.
2. Fixed the hpmcounter read access from M-mode.

Changes from v7->v8:
1. Removeding ordering constraints for mhpmcounter & mhpmevent.

Changes from v6->v7:
1. Fixed all the compilation errors for the usermode.

Changes from v5->v6:
1. Fixed compilation issue with PATCH 1.
2. Addressed other comments.

Changes from v4->v5:
1. Rebased on top of the -next with following patches.
   - isa extension
   - priv 1.12 spec
2. Addressed all the comments on v4
3. Removed additional isa-ext DT node in favor of riscv,isa string update

Changes from v3->v4:
1. Removed the dummy events from pmu DT node.
2. Fixed pmu_avail_counters mask generation.
3. Added a patch to simplify the predicate function for counters. 

Changes from v2->v3:
1. Addressed all the comments on PATCH1-4.
2. Split patch1 into two separate patches.
3. Added explicit comments to explain the event types in DT node.
4. Rebased on latest Qemu.

Changes from v1->v2:
1. Dropped the ACks from v1 as signficant changes happened after v1.
2. sscofpmf support.
3. A generic counter management framework.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc
[2] https://drive.google.com/file/d/171j4jFjIkKdj5LWcExphq4xG_2sihbfd/edit
[3] https://github.com/atishp04/qemu/tree/riscv_pmu_v13

Atish Patra (6):
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree
target/riscv: Update the privilege field for sscofpmf CSRs
target/riscv: Remove additional priv version check for mcountinhibit

hw/riscv/virt.c           |  16 ++
target/riscv/cpu.c        |  12 ++
target/riscv/cpu.h        |  25 +++
target/riscv/cpu_bits.h   |  55 +++++
target/riscv/cpu_helper.c |  25 +++
target/riscv/csr.c        | 312 +++++++++++++++++-----------
target/riscv/machine.c    |   1 +
target/riscv/pmu.c        | 414 +++++++++++++++++++++++++++++++++++++-
target/riscv/pmu.h        |   8 +
9 files changed, 749 insertions(+), 119 deletions(-)

--
2.25.1


