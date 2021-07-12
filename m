Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAF73C614F
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:59:22 +0200 (CEST)
Received: from localhost ([::1]:45816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zH7-0007rj-BS
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:59:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m2zF4-0005hv-9V
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:14 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:60824
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m2zF0-00070C-3d
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:13 -0400
HMM_SOURCE_IP: 172.18.0.48:50580.4574419
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.19?logid-d6ee1067a9e34bf398e4104729ee285e
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 01F04280029;
 Tue, 13 Jul 2021 00:56:58 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id d6ee1067a9e34bf398e4104729ee285e for
 qemu-devel@nongnu.org; Tue Jul 13 00:56:59 2021
X-Transaction-ID: d6ee1067a9e34bf398e4104729ee285e
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] support dirtyrate measurement with dirty bitmap 
Date: Tue, 13 Jul 2021 00:56:49 +0800
Message-Id: <cover.1626107174.git.huangy81@chinatelecom.cn>
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

Hyman Huang(黄勇) (3):
  KVM: introduce kvm_get_manual_dirty_log_protect
  memory: introduce DirtyRateIncreasedPages and util function
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation

 accel/kvm/kvm-all.c     |   6 +++
 hmp-commands.hx         |   9 ++--
 include/exec/ram_addr.h |  87 ++++++++++++++++++++++++++----
 include/sysemu/kvm.h    |   1 +
 migration/dirtyrate.c   | 138 ++++++++++++++++++++++++++++++++++++++++++++----
 migration/trace-events  |   1 +
 qapi/migration.json     |   6 ++-
 softmmu/physmem.c       |  35 ++++++++++++
 8 files changed, 259 insertions(+), 24 deletions(-)

-- 
1.8.3.1


