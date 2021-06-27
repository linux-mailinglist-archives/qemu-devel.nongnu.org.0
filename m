Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7413B523F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 07:46:06 +0200 (CEST)
Received: from localhost ([::1]:33074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxNcL-0005sw-Ux
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 01:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lxNVH-0007e3-Sl
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:47 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:44578
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lxNV7-0001EB-Qm
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 01:38:47 -0400
HMM_SOURCE_IP: 172.18.0.218:60506.95674552
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-171.223.99.176?logid-0210caab79734a8b87be68778a878dff
 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 74466280096;
 Sun, 27 Jun 2021 13:38:24 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 0210caab79734a8b87be68778a878dff for
 qemu-devel@nongnu.org; Sun Jun 27 13:38:24 2021
X-Transaction-ID: 0210caab79734a8b87be68778a878dff
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] support dirtyrate measurement with dirty bitmap
Date: Sun, 27 Jun 2021 13:38:13 +0800
Message-Id: <cover.1624768443.git.huangy81@chinatelecom.cn>
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

Hyman Huang(黄勇) (4):
  memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits
  KVM: introduce kvm_get_manual_dirty_log_protect
  memory: introduce DIRTY_MEMORY_DIRTY_RATE dirty bits functions
  migration/dirtyrate: implement dirty-bitmap dirtyrate calculation

 accel/kvm/kvm-all.c     |   6 ++
 hmp-commands.hx         |   9 +--
 include/exec/ram_addr.h | 140 +++++++++++++++++++++++++++++++++++++++++++++-
 include/exec/ramlist.h  |   9 +--
 include/sysemu/kvm.h    |   1 +
 migration/dirtyrate.c   | 146 +++++++++++++++++++++++++++++++++++++++++++++---
 migration/trace-events  |   2 +
 qapi/migration.json     |   6 +-
 softmmu/physmem.c       |  60 ++++++++++++++++++++
 9 files changed, 358 insertions(+), 21 deletions(-)

-- 
1.8.3.1


