Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2670487045
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:21:13 +0100 (CET)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5esS-0001b9-Vo
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:21:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRj-0001Y6-NK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:31 -0500
Received: from [2607:f8b0:4864:20::229] (port=33596
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRh-0003X3-MK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:31 -0500
Received: by mail-oi1-x229.google.com with SMTP id x188so107168oix.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OlX8HuBBEpOKcZDyz5xIHTxVSQa45VLEzqHLXo89ZN8=;
 b=ZqlUGb6w44eFFhqsXAnF1iQ1ZxTEHrpyyj7DZR7HvnIAoebZz5bypozVcTonof6ucu
 mar5rMcdpsLLOiFG4xX2uK1VMUyAlIRZOgR7n29M9gZm+L78+dnYzlYOfNt5ydbIjpWK
 fwlynFgqIBtK+3OOLGAXqPsaK4FqCRqyrreS4bRJishZnk6pQwIFu1/n5JXhk4KhjQGD
 pQwthwJL4hoR+JsohC0jRbt0qgcDAt2g/PAGd54dB7Ed5n3DsnJM4hxZbUFr29fMPU3d
 fdMlYgESJx81y2ZgBEvyEhJ3Qp82xa/hbApGEYLqoC7vpn+heNayKApQwsSL5P5U7RlG
 qHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OlX8HuBBEpOKcZDyz5xIHTxVSQa45VLEzqHLXo89ZN8=;
 b=Q+TD58/sBkgv8tw03sGMiku/zoRPBc0Y9AobDYi+Y8malhM+CQc3ImsNwQaN65Hvps
 ryKbImNgHnTqilrdwum6Sp6pRztmsKTRS9RoMDyvR9XRv9KFNphpRPWayZH64zJb3k0K
 OV25yD3AXXqRjRAfj/w/p8emZqkiLsVfVuYJXYBGKTfe46UTZWvZT1J4FpkO2FTP32bw
 qZMvMQTO8ZT70GAlu61lHBo7OapqNj/Lvpa/6ibXvfSODVgYbpfpNDkWqVLuEj2tXPk8
 II0Zuihx58qrJQ1JglljGgVk6HrOKiTxDWkp8gKu1dE7ELOBZT9ZgF4MjuAR+06Tq7HP
 bDIQ==
X-Gm-Message-State: AOAM5316dJbHfFuAZ4mUZEt7ArWwYdtvmw4kTfAqLfkwR7ktgIxgR2ty
 lmtm+BA/6ezLRPO5FKl6HvaNaCdYKbHmZiLA
X-Google-Smtp-Source: ABdhPJw1xkjfzTk+Bzg5t0ifbqAV1w0yJlI4ajvUhk8fZzNoWRKO5DL3ZiX3JoSMeI0F3JDwbu8gww==
X-Received: by 2002:a05:6808:2095:: with SMTP id
 s21mr1023351oiw.43.1641516566786; 
 Thu, 06 Jan 2022 16:49:26 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/11] Improve PMU support
Date: Thu,  6 Jan 2022 16:48:35 -0800
Message-Id: <20220107004846.378859-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:01 -0500
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The latest version of the SBI specification includes a Performance Monitoring
Unit(PMU) extension[1] which allows the supervisor to start/stop/configure
various PMU events. The Sscofpmf ('Ss' for Privileged arch and Supervisor-level
extensions, and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
extension[2] allows the perf like tool to handle overflow interrupts and
filtering support.

This series implements full PMU infrastructure to support
PMU in virt machine. This will allow us to add any PMU events in future.

Currently, this series enables the following omu events.
1. cycle count
2. instruction count
3. DTLB load/store miss
4. ITLB prefetch miss

The first two are computed using host ticks while last three are counted during
cpu_tlb_fill. We can do both sampling and count from guest userspace.
This series has been tested on both RV64 and RV32. Both Linux[3] and Opensbi[4]
patches are required to get the perf working.

Here is an output of perf stat/report while running hackbench with OpenSBI & Linux
kernel patches applied [3].

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
[3] https://github.com/atishp04/linux/tree/riscv_pmu_v5
[4] https://github.com/atishp04/qemu/tree/riscv_pmu_v4

Atish Patra (11):
target/riscv: Fix PMU CSR predicate function
target/riscv: Implement PMU CSR predicate function for S-mode
target/riscv: pmu: Rename the counters extension to pmu
target/riscv: pmu: Make number of counters configurable
target/riscv: Implement mcountinhibit CSR
target/riscv: Add support for hpmcounters/hpmevents
target/riscv: Support mcycle/minstret write operation
target/riscv: Add sscofpmf extension support
target/riscv: Simplify counter predicate function
target/riscv: Add few cache related PMU events
hw/riscv: virt: Add PMU DT node to the device tree

hw/riscv/virt.c           |  38 ++
target/riscv/cpu.c        |  14 +-
target/riscv/cpu.h        |  50 ++-
target/riscv/cpu_bits.h   |  59 +++
target/riscv/cpu_helper.c |  26 ++
target/riscv/csr.c        | 828 +++++++++++++++++++++++++++-----------
target/riscv/machine.c    |  26 ++
target/riscv/meson.build  |   1 +
target/riscv/pmu.c        | 419 +++++++++++++++++++
target/riscv/pmu.h        |  37 ++
10 files changed, 1268 insertions(+), 230 deletions(-)
create mode 100644 target/riscv/pmu.c
create mode 100644 target/riscv/pmu.h

--
2.30.2


