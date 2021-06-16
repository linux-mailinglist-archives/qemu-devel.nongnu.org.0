Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDD3A8E22
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:13:55 +0200 (CEST)
Received: from localhost ([::1]:34180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltK7u-0005rz-QT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1ltK2z-00071z-S3
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:08:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223]:51199
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1ltK2i-0005zA-6w
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 21:08:43 -0400
HMM_SOURCE_IP: 172.18.0.218:55640.1447589156
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-6d78197d793c4667afc4678d3a3390f7
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 706692800C6;
 Wed, 16 Jun 2021 09:08:19 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 6d78197d793c4667afc4678d3a3390f7 for
 qemu-devel@nongnu.org; Wed Jun 16 09:08:21 2021
X-Transaction-ID: 6d78197d793c4667afc4678d3a3390f7
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] support dirtyrate at the granualrity of vcpu 
Date: Wed, 16 Jun 2021 09:12:26 +0800
Message-Id: <cover.1623804189.git.huangy81@chinatelecom.cn>
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
  memory: make global_dirty_log a bitmask
  migration/dirtyrate: introduce struct and adjust DirtyRateStat
  migration/dirtyrate: adjust order of registering thread
  migration/dirtyrate: move init step of calculation to main thread
  migration/dirtyrate: implement dirty-ring dirtyrate calculation

 accel/kvm/kvm-all.c    |   7 ++
 hmp-commands.hx        |   7 +-
 include/exec/memory.h  |  14 ++-
 include/hw/core/cpu.h  |   1 +
 include/sysemu/kvm.h   |   1 +
 migration/dirtyrate.c  | 259 +++++++++++++++++++++++++++++++++++++++++++------
 migration/dirtyrate.h  |  19 +++-
 migration/ram.c        |   8 +-
 migration/trace-events |   2 +
 qapi/migration.json    |  46 ++++++++-
 softmmu/memory.c       |  31 ++++--
 softmmu/trace-events   |   1 +
 12 files changed, 343 insertions(+), 53 deletions(-)

-- 
1.8.3.1


