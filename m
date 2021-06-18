Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AA63ACF15
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:31:50 +0200 (CEST)
Received: from localhost ([::1]:60962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luGTF-0005jl-Oj
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:31:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1luGPn-0006R0-6C
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:15 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:34102
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1luGPk-00086S-Nk
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:28:14 -0400
HMM_SOURCE_IP: 172.18.0.218:58570.1979376666
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-c4a34c2761364744ac7f6e25c2e48997
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id B7FA7280079;
 Fri, 18 Jun 2021 23:27:59 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id c4a34c2761364744ac7f6e25c2e48997 for
 qemu-devel@nongnu.org; Fri Jun 18 23:27:59 2021
X-Transaction-ID: c4a34c2761364744ac7f6e25c2e48997
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/6] support dirtyrate at the granualrity of vcpu 
Date: Fri, 18 Jun 2021 23:32:01 +0800
Message-Id: <cover.1624028590.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

v8
- drop the "none" type of DirtyRateMeasureMode

- make global_dirty_tracking a bitmask:
  1. code clean: pass the casted "flags" as input parameter in
     memory_global_dirty_log_stop, and then drop the free step.
  2. squash commit "rename global_dirty_log to global_dirty_tracking"
     into commit "make global_dirty_tracking a bitmask"
  3. move "GLOBAL_DIRTY_MASK" macro to the bits's definations.

- drop the "cleanup_dirtyrate_stat" in commit
  "move init step of calculation to main thread" so that each commit
  keeps the old way working. 

- add dirty rate unit "MB/s" in the output of hmp

please review, may be this is the last version of this patchset, :)
thanks for Peter's patient instructions and reviews.

Hyman Huang(黄勇)

v7
- fix the code style problem, sorry about that

v6:
- pick up commit "KVM: introduce dirty_pages and kvm_dirty_ring_enabled"
  which has been dropped in verison 5

v5:
- rename global_dirty_log to global_dirty_tracking on Peter's advice

- make global_dirty_tracking a bitmask:
  1. add assert statement to ensure starting dirty tracking repeatly
     not allowed.
  2. add assert statement to ensure dirty tracking cannot be stopped
     without having been started.

- protecting dirty rate stat info:
  1. drop the mutext for protecting dirty rate introduced in version 4
  2. change the code block in query_dirty_rate_info so that requirements
     of "safe racing" to the dirty rate stat can be meet

- make the helper function "record_dirtypages" inline and change
  the global var dirty_pages  to local var

- free DirtyRateVcpuList in case of memory leak

please review, thanks a lot.

v4:
- make global_dirty_log a bitmask:
  1. add comments about dirty log bitmask
  2. use assert statement to check validity of flags
  3. add trace to log bitmask changes

- introduce mode option to show what method calculation should be used,
  also, export mode option in the as last commmit

- split cleanup and init of dirty rate stat and move it in the main
  thread

- change the fields of DirtyPageRecord to uint64_t type so that we
  can calculation the increased dirty pages with the formula
  as Peter's advice: dirty pages = end_pages - start_pages

- introduce mutex to protect dirty rate stat info

- adjust order of registering thread

- drop the memory free callback

this version modify some code on Peter's advice, reference to:
https://lore.kernel.org/qemu-devel/YL5nNYXmrqMlXF3v@t490s/

thanks again.

v3:
- pick up "migration/dirtyrate: make sample page count configurable" to
  make patchset apply master correctly

v2:
- rebase to "migration/dirtyrate: make sample page count configurable"

- rename "vcpu" to "per_vcpu" to show the per-vcpu method

- squash patch 5/6 into a single one, squash patch 1/2 also

- pick up "hmp: Add "calc_dirty_rate" and "info dirty_rate" cmds"

- make global_dirty_log a bitmask to make sure both migration and dirty
  could not intefer with each other

- add memory free callback to prevent memory leaking

the most different of v2 fron v1 is that we make the global_dirty_log a
bitmask. the reason is dirty rate measurement may start or stop dirty
logging during calculation. this conflict with migration because stop
dirty log make migration leave dirty pages out then that'll be a
problem.

make global_dirty_log a bitmask can let both migration and dirty
rate measurement work fine. introduce GLOBAL_DIRTY_MIGRATION and
GLOBAL_DIRTY_DIRTY_RATE to distinguish what current dirty log aims
for, migration or dirty rate.

all references to global_dirty_log should be untouched because any bit
set there should justify that global dirty logging is enabled.

Please review, thanks !

v1:

Since the Dirty Ring on QEMU part has been merged recently, how to use
this feature is under consideration.

In the scene of migration, it is valuable to provide a more accurante
interface to track dirty memory than existing one, so that the upper
layer application can make a wise decision, or whatever. More
importantly,
dirtyrate info at the granualrity of vcpu could provide a possibility to
make migration convergent by imposing restriction on vcpu. With Dirty
Ring, we can calculate dirtyrate efficiently and cheaply.

The old interface implemented by sampling pages, it consumes cpu
resource, and the larger guest memory size become, the more cpu resource
it consumes, namely, hard to scale. New interface has no such drawback.

Please review, thanks !

Best Regards !

Hyman Huang(黄勇) (6):
  KVM: introduce dirty_pages and kvm_dirty_ring_enabled
  memory: make global_dirty_tracking a bitmask
  migration/dirtyrate: introduce struct and adjust DirtyRateStat
  migration/dirtyrate: adjust order of registering thread
  migration/dirtyrate: move init step of calculation to main thread
  migration/dirtyrate: implement dirty-ring dirtyrate calculation

 accel/kvm/kvm-all.c     |   7 ++
 hmp-commands.hx         |   7 +-
 include/exec/memory.h   |  20 +++-
 include/exec/ram_addr.h |   4 +-
 include/hw/core/cpu.h   |   1 +
 include/sysemu/kvm.h    |   1 +
 migration/dirtyrate.c   | 265 +++++++++++++++++++++++++++++++++++++++++-------
 migration/dirtyrate.h   |  19 +++-
 migration/ram.c         |   8 +-
 migration/trace-events  |   2 +
 qapi/migration.json     |  46 ++++++++-
 softmmu/memory.c        |  32 ++++--
 softmmu/trace-events    |   1 +
 13 files changed, 351 insertions(+), 62 deletions(-)

-- 
1.8.3.1


