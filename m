Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA373CB697
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:12:46 +0200 (CEST)
Received: from localhost ([::1]:38256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Llt-0003Og-RG
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m4LiB-0006mD-V3
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:08:55 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:37234
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m4Li9-0003yL-CS
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:08:55 -0400
HMM_SOURCE_IP: 172.18.0.48:53240.814476691
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-1296ba80555d44f48fdbc417a7cadc3f
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 5A56928008F;
 Fri, 16 Jul 2021 19:08:39 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 1296ba80555d44f48fdbc417a7cadc3f for
 qemu-devel@nongnu.org; Fri Jul 16 19:08:48 2021
X-Transaction-ID: 1296ba80555d44f48fdbc417a7cadc3f
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/2] support dirtyrate measurement with dirty bitmap 
Date: Fri, 16 Jul 2021 19:13:45 +0800
Message-Id: <cover.1626433753.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.227;
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

v6:
- pre-check if dirty tracking for dirtyrate is running
  before stating the dirty pages

v5:
- let recording dirty pages after memory_global_dirty_log_sync
  make dirtyrate result more accurate

v4:
- drop the first commit:
  "KVM: introduce kvm_get_manual_dirty_log_protect"

- clear dirty log unconditionally so that the first commit
  can be dropped.

- rename global var DirtyRateDirtyPages to total_dirty_pages

- stat the dirty pages along with the existing loop in
  cpu_physical_memory_set_dirty_lebitmap

- stat the increased dirty pages like the way of dirty-ring

- add BQL when fetch dirty log and clear dirty log

- do not clear dirty log after measuring.

v4 implementation clear log unconditionally so that the
kvm_get_manual_dirty_log_protect can be dropped and so do the
first commit.

other main modification is add the BQL when fetch and clear
dirty log.

last modification is do not clear dirty log after measuring.
if dirty tracking be stopped after measuring, clear dirty
log make no sense.if dirty tracking is running after mesauring,
clear dirty log can be handled by the caller who is interested in it.

v3:
- do not touch cpu_physical_memory_sync_dirty_bitmap

- rename global var DirtyRateIncreasedPages to DirtyRateDirtyPages

- stat dirty pages in cpu_physical_memory_set_dirty_lebitmap, which
  is on the execution path of memory_global_dirty_log_sync and can
  be used for dirty rate measuring.

the v3 implemention runs well, we could get accurate dirtyrate
as v1 and simplify the implementation heavyly. it do not touch
the any ram_list.dirty_memory[*], so do has no conflict with migraion
at all.
if migration is running at the same time with dirtyrate measuring,
measuring may reset protection of pages after
memory_global_dirty_log_sync before migration iteration, but it has
no side affect because kvm_log_clear_one_slot can guarantee that
same dirty_bmap in a slot shouldn't be cleared twice.

v2:
- drop the DIRTY_MEMORY_DIRTY_RATE dirty bits

- reuse the DIRTY_MEMORY_MIGRATION dirty bits to stat the dirty
  pages.

- introduce global var DirtyRateIncreasedPages to stat the
  increased dirty pages

- simplify the logic of calculation. skip the 1'round of
  log sync unconditionally

changes of this version are based on Peter's advice,
like the version 1, it is posted for the sake of RFC.
ideally, this patshset may be merged after the commit:
"migration/dirtyrate: implement dirty-ring dirtyrate calculation"

v1:
the dirtyrate measurement implemented by page-sampling originally, it
is not accurate in some scenarios, so we have introduced dirty-ring
based dirtyrate measurement(maybe it will be merged soon), it fix the
accuracy of page-sampling, and more importantly, it is at the
granualrity of vcpu.

dirty-ring method can be used when dirty-ring enable, as supplementary,
we introduce dirty-bitmap method to calculating dirtyrate when dirty log
enable, so that we can also get the accurate dirtyrate if needed in the
absence of dirty-ring.

three things has done to implement the measurement:
- introduce a fresh new dirty bits named DIRTY_MEMORY_DIRTY_RATE, which
  is used to store dirty bitmap after fetching it from kvm. why we do
  not reuse the existing DIRTY_MEMORY_MIGRATION dirty bits is we do not
  want to interfere with migration of and let implementation clear, this
  is also the reason why dirty_memory be split.

  DIRTY_MEMORY_DIRTY_RATE dirty bits will be filled when
  memory_global_dirty_log_sync executed if GLOBAL_DIRTY_DIRTY_RATE bit
  be set in the global_dirty_tracking flag.

- introduce kvm_get_manual_dirty_log_protect function so that we can
  probe the protect caps of kvm when calculating.

- implement dirtyrate measurement with dirty bitmap with following step:
  1. start the dirty log.

  2. probe the protect cap, if KVM_DIRTY_LOG_INITIALLY_SET enable, skip
     skip the 1'R and do the reset page protection manually, since kvm
     file bitmap with 1 bits if this cap is enabled.

  3. clear the DIRTY_MEMORY_DIRTY_RATE dirty bits, prepare to store
     the dirty bitmap.

  4. start memory_global_dirty_log_sync and fetch dirty bitmap from kvm

  5. reap the DIRTY_MEMORY_DIRTY_RATE dirty bits and do the calculation.

this patchset rebases on the commit
"migration/dirtyrate: implement dirty-ring dirtyrate calculation",
since the above feature has not been merged, so we post this patch
for the sake of RFC. ideally, this patshset may be merged after it.

Please, review, thanks !

Best Regards !

Hyman Huang(黄勇) (2):
  memory: introduce total_dirty_pages to stat dirty pages
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation

 hmp-commands.hx         |   9 ++--
 include/exec/ram_addr.h |   9 ++++
 migration/dirtyrate.c   | 122 ++++++++++++++++++++++++++++++++++++++++++++----
 qapi/migration.json     |   6 ++-
 4 files changed, 131 insertions(+), 15 deletions(-)

-- 
1.8.3.1


