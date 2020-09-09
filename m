Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE875262F83
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 16:09:20 +0200 (CEST)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kG0ml-0002DV-QH
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 10:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kG0lK-0000UY-Ng
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:07:50 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4722 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1kG0lH-0001hj-5w
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 10:07:50 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8EF92B847DAED8829EAF;
 Wed,  9 Sep 2020 22:07:32 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 22:07:24 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <eblake@redhat.com>, <dgilbert@redhat.com>,
 <berrange@redhat.com>, <dme@dme.org>
Subject: [PATCH v7 00/12] *** A Method for evaluating dirty page rate ***
Date: Wed, 9 Sep 2020 22:18:04 +0800
Message-ID: <1599661096-127913-1-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 10:07:33
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 zhang.zhanghailiang@huawei.com, xiexiangyou@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v6-> v7:
    fix minior comments and coding style by review
    add review-by for patches

v5 -> v6:
    fix coding style according to review
    use TARGET_PAGE_SIZE and TARGET_PAGE_BITS instead of self-defined macros
    return start-time and calc-time by qmp command

v4 -> v5:
    fix git apply failed due to meson-build
    add review-by for patches in v3

v3 -> v4:
    use crc32 to get hash result instead of md5
    add DirtyRateStatus to denote calculation status
    add some trace_calls to make it easier to debug
    fix some comments accroding to review

v2 -> v3:
    fix size_t compile warning
    fix codestyle checked by checkpatch.pl

v1 -> v2:
    use g_rand_new() to generate rand_buf
    move RAMBLOCK_FOREACH_MIGRATABLE into migration/ram.h
    add skip_sample_ramblock to filter sampled ramblock
    fix multi-numa vm coredump when query dirtyrate
    rename qapi interface and rename some structures and functions
    succeed to compile by appling each patch
    add test for migrating vm

Sometimes it is neccessary to evaluate dirty page rate before migration.
Users could decide whether to proceed migration based on the evaluation
in case of vm performance loss due to heavy workload.
Unlikey simulating dirtylog sync which could do harm on runnning vm,
we provide a sample-hash method to compare hash results for samping page.
In this way, it would have hardly no impact on vm performance.

Evaluate the dirtypage rate both on running and migration vm.
The VM specifications for migration are as follows:
- VM use 4-K page;
- the number of VCPU is 32;
- the total memory is 32Gigabit;
- use 'mempress' tool to pressurize VM(mempress 4096 1024);
- migration bandwidth is 1GB/s

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
|                      |  running  |                  migrating                           |
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
| no mempress          |   4MB/s   |          8MB/s      (migrated success)               |
-------------------------------------------------------------------------------------------
| mempress 4096 1024   |  1060MB/s |     456MB/s ~ 1142MB/s (cpu throttle triggered)      |
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
| mempress 4096 4096   |  4114MB/s |     688MB/s ~ 4132MB/s (cpu throttle triggered)      |
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Test dirtyrate by qmp command like this:
1.  virsh qemu-monitor-command [vmname] '{"execute":"calc-dirty-rate", "arguments": {"calc-time": [sleep-time]}}'; 
2.  sleep specific time which is a bit larger than sleep-time
3.  virsh qemu-monitor-command [vmname] '{"execute":"query-dirty-rate"}'

The qmp command returns like this:
{"return":{"status":"measured","dirty-rate":374,"start-time":3718293,"calc-time":1},"id":"libvirt-15"}

Further test dirtyrate by libvirt api like this:
virsh getdirtyrate [vmname] [sleep-time]

Chuan Zheng (12):
  migration/dirtyrate: setup up query-dirtyrate framwork
  migration/dirtyrate: add DirtyRateStatus to denote calculation status
  migration/dirtyrate: Add RamblockDirtyInfo to store sampled page info
  migration/dirtyrate: Add dirtyrate statistics series functions
  migration/dirtyrate: move RAMBLOCK_FOREACH_MIGRATABLE into ram.h
  migration/dirtyrate: Record hash results for each sampled page
  migration/dirtyrate: Compare page hash results for recorded sampled
    page
  migration/dirtyrate: skip sampling ramblock with size below
    MIN_RAMBLOCK_SIZE
  migration/dirtyrate: Implement set_sample_page_period() and
    get_sample_page_period()
  migration/dirtyrate: Implement calculate_dirtyrate() function
  migration/dirtyrate: Implement
    qmp_cal_dirty_rate()/qmp_get_dirty_rate() function
  migration/dirtyrate: Add trace_calls to make it easier to debug

 migration/dirtyrate.c  | 435 +++++++++++++++++++++++++++++++++++++++++++++++++
 migration/dirtyrate.h  |  70 ++++++++
 migration/meson.build  |   2 +-
 migration/ram.c        |  11 +-
 migration/ram.h        |  10 ++
 migration/trace-events |   8 +
 qapi/migration.json    |  67 ++++++++
 7 files changed, 592 insertions(+), 11 deletions(-)
 create mode 100644 migration/dirtyrate.c
 create mode 100644 migration/dirtyrate.h

-- 
1.8.3.1


