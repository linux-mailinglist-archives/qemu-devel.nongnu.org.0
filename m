Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD874E1FA8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:55:27 +0100 (CET)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWA4j-00058E-Uz
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:55:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wucy11@chinatelecom.cn>)
 id 1nW8bo-0001V2-F9
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:21:28 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.222]:49618
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wucy11@chinatelecom.cn>) id 1nW8bm-0006at-4z
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 23:21:28 -0400
HMM_SOURCE_IP: 172.18.0.188:46806.2068112412
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id DC8162800E0;
 Mon, 21 Mar 2022 11:11:59 +0800 (CST)
X-189-SAVE-TO-SEND: wucy11@chinatelecom.cn
Received: from  ([172.18.0.188])
 by app0023 with ESMTP id c7d5f93e4d684948bb53604e7b5c8242 for
 kvm@vger.kernel.org; Mon, 21 Mar 2022 11:12:11 CST
X-Transaction-ID: c7d5f93e4d684948bb53604e7b5c8242
X-Real-From: wucy11@chinatelecom.cn
X-Receive-IP: 172.18.0.188
X-MEDUSA-Status: 0
Message-ID: <97485e67-4d3a-9975-a87d-73b191d7aab2@chinatelecom.cn>
Date: Mon, 21 Mar 2022 11:11:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: Chongyun Wu <wucy11@chinatelecom.cn>
Subject: [PATCH 0/5] KVM: Dirty ring and auto converge optimization
To: kvm@vger.kernel.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.222;
 envelope-from=wucy11@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 21 Mar 2022 00:52:35 -0400
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
Cc: "ligh10@chinatelecom.cn" <ligh10@chinatelecom.cn>,
 David Hildenbrand <david@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 yubin1@chinatelecom.cn, zhengwenm@chinatelecom.cn,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Overview
============
This series of patches is to optimize the performance of
online migration using dirty ring and autoconverge.

Mainly through the following aspects to do optimization:
1. When using the dirty ring mode to traverse each memslot
to obtain dirty pages, only call log_sync_global once,
because log_sync_global collects the dirty pages of all
memslots on all CPUs.

2. Dynamically adjust the dirty ring collection thread to
reduce the occurrence of ring full, thereby reducing the
impact on customers, improving the efficiency of dirty
page collection, and thus improving the migration efficiency.

3. When collecting dirty pages from KVM,
kvm_cpu_synchronize_kick_all is not called if the rate is
limited, and it is called only once before suspending the
virtual machine. Because kvm_cpu_synchronize_kick_all will
become very time-consuming when the CPU is limited, and
there will not be too many dirty pages, so it only needs
to be called once before suspending the virtual machine to
ensure that dirty pages will not be lost and the efficiency
of migration is guaranteed .

4. Based on the characteristic of collecting dirty pages
in the dirty ring, a new dirty page rate calculation method
is proposed to obtain a more accurate dirty page rate.

5. Use a more accurate dirty page rate and calculate the
matching speed limit threshold required to complete the
migration according to the current system bandwidth and
parameters, instead of the current speed limit by constantly
trying this time-consuming method, reducing the need for
practical Meaningful trial process, greatly reducing
migration time.

Testing
=======
     Test environment:
     Host: 64 cpus(Intel(R) Xeon(R) Gold 5218 CPU @ 2.30GHz),
           512G memory,
           10G NIC
     VM: 2 cpus,4G memory and 8 cpus, 32G memory
     memory stress: run stress(qemu) in VM to generates memory stress

     Test1: Massive online migration(Run each test item 50 to 200 times)
     Test command: virsh -t migrate $vm --live --p2p --unsafe
     --undefinesource --persistent --auto-converge  --migrateuri
     tcp://${data_ip_remote}
     *********** Use optimized dirtry ring  ***********
     ring_size  mem_stress VM   average_migration_time(ms)
     4096      1G       2C4G     15888
     4096      3G       2C4G     13320
     65536     1G       2C4G     10036
     65536     3G       2C4G     12132
     4096      4G       8C32G    53629
     4096      8G       8C32G    62474
     4096      30G      8C32G    99025
     65536     4G       8C32G    45563
     65536     8G       8C32G    61114
     65536     30G      8C32G    102087
     *********** Use Unoptimized dirtry ring ***********
     ring_size  mem_stress VM   average_migration_time(ms)
     4096      1G       2C4G     23992
     4096      3G       2C4G     44234
     65536     1G       2C4G     24546
     65536     3G       2C4G     44939
     4096      4G       8C32G    88441
     4096      8G       8C32G    may not complete
     4096      30G      8C32G    602884
     65536     4G       8C32G    335535
     65536     8G       8C32G    1249232
     65536     30G      8C32G    616939
     *********** Use bitmap dirty tracking  ***********
     ring_size  mem_stress VM   average_migration_time(ms)
     0         1G       2C4G     24597
     0         3G       2C4G     45254
     0         4G       8C32G    103773
     0         8G       8C32G    129626
     0         30G      8C32G    588212

Test1 result:
     Compared with the old bitmap method and the unoptimized dirty ring,
     the migration time of the optimized dirty ring from the sorted data
     is greatly improved, especially when the virtual machine memory is
     large and the memory pressure is high, the effect is more obvious,
     can achieve five to six times the migration acceleration effect.

     And during the test, it was found that the dirty ring could not be
     completed for a long time after adding certain memory pressure.
     The optimized dirty ring did not encounter such a problem.

     Test2: qemu guestperf test
     Test ommand parameters:  --auto-converge  --stress-mem XX --downtime 300
     --bandwidth 10000
     *********** Use optimized dirtry ring  ***********
     ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                            _drop_duration(s) speed(ms/GB)
     4096       3G    2C4G        5.5           2962             23.5
     65536      3G    2C4G        6             3160             25
     4096       3G    8C32G       13            7921             38
     4096       6G    8C32G       16            11.6K            46
     4096       10G   8C32G       12.1          11.2K            47.6
     4096       20G   8C32G       20            20.2K            71
     4096       30G   8C32G       29.5          29K              94.5
     65536      3G    8C32G       14            8700             40
     65536      6G    8C32G       15            12K              46
     65536      10G   8C32G       11.5          11.1k            47.5
     65536      20G   8C32G       21            20.9K            72
     65536      30G   8C32G       29.5          29.1K            94.5
     *********** Use Unoptimized dirtry ring ***********
     ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                            _drop_duration(s) speed(ms/GB)
     4096        3G    2C4G        23            2766            46
     65536       3G    2C4G        22.2          3283            46
     4096        3G    8C32G       62            48.8K           106
     4096        6G    8C32G       68            23.87K          124
     4096        10G   8C32G       91            16.87K          190
     4096        20G   8C32G       152.8         28.65K          336.8
     4096        30G   8C32G       187           41.19K          502
     65536       3G    8C32G       71            12.7K           67
     65536       6G    8C32G       63            12K             46
     65536       10G   8C32G       88            25.3k           120
     65536       20G   8C32G       157.3         25K             391
     65536       30G   8C32G       171           30.8K           487
     *********** Use bitmap dirty tracking  ***********
     ring_size stress VM    Significant_perf  max_memory_update cost_time(s)
                            _drop_duration(s) speed(ms/GB)
     0           3G    2C4G        18             3300            38
     0           3G    8C32G       38             7571            66
     0           6G    8C32G       61.5           10.5K           115.5
     0           10G   8C32G       110            13.68k          180
     0           20G   8C32G       161.6          24.4K           280
     0           30G   8C32G       221.5          28.4K           337.5

Test2 result:
     The above test data shows that the guestperf performance of the
     optimized dirty ring during the migration process is significantly
     better than that of the unoptimized dirty ring, and slightly better
     than the bitmap method.

     During the migration process of the optimized dirty ring, the migration
     time is greatly reduced, and the time in the period of significant
     memory performance degradation is  significantly shorter than that of
     the bitmap mode and the unoptimized dirty ring mode. Therefore, the
     optimized ditry ring can better reduce the impact on guests accessing
     memory resources during the migration process.

Please review, thanks.

Chongyun Wu (5):
     kvm,memory: Optimize dirty page collection for dirty ring
     kvm: Dynamically control the load of the reaper thread
     kvm: Dirty ring autoconverge optmization for kvm_cpu_synchronize_kick_all
     kvm: Introduce a dirty rate calculation method based on dirty ring
     migration: Calculate the appropriate throttle for autoconverge

  accel/kvm/kvm-all.c   | 239 ++++++++++++++++++++++++++++++++++++--
  include/sysemu/cpus.h |   1 +
  include/sysemu/kvm.h  |   2 +
  migration/migration.c |  13 ++++++
  migration/migration.h |   2 +
  migration/ram.c       |  64 +++++++++++++++++++++++--
  softmmu/cpus.c        |  18 ++++++++
  softmmu/memory.c      |   6 +++
  8 files changed, 316 insertions(+), 29 deletions(-)
-- 
1.8.3.1

-- 
Best Regard,
Chongyun Wu

