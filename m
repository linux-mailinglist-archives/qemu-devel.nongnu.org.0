Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D981396672
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:05:55 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlMQ-0006av-AV
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:05:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lnlJZ-000542-N4
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:02:57 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:57603
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lnlJW-0004Dn-Ve
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:02:57 -0400
HMM_SOURCE_IP: 172.18.0.48:36278.1609563638
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.38?logid-2b89bfe9d6a14a9583ec07acf9b45452
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id 92446280029;
 Tue,  1 Jun 2021 01:02:46 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 2b89bfe9d6a14a9583ec07acf9b45452 for
 qemu-devel@nongnu.org; Tue Jun  1 01:02:47 2021
X-Transaction-ID: 2b89bfe9d6a14a9583ec07acf9b45452
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 0/6] support dirtyrate at the granualrity of vcpu 
Date: Tue,  1 Jun 2021 01:02:45 +0800
Message-Id: <cover.1622479161.git.huangy81@chinatelecom.cn>
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
Cc: kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 Hyman <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Since the Dirty Ring on QEMU part has been merged recently, how to use
this feature is under consideration.

In the scene of migration, it is valuable to provide a more accurante
interface to track dirty memory than existing one, so that the upper
layer application can make a wise decision, or whatever. More importantly,
dirtyrate info at the granualrity of vcpu could provide a possibility to
make migration convergent by imposing restriction on vcpu. With Dirty
Ring, we can calculate dirtyrate efficiently and cheaply.

The old interface implemented by sampling pages, it consumes cpu 
resource, and the larger guest memory size become, the more cpu resource
it consumes, namely, hard to scale. New interface has no such drawback.

Please review, thanks !

Best Regards !

Hyman Huang(黄勇) (6):
  KVM: add kvm_dirty_ring_enabled function
  KVM: introduce dirty_pages into CPUState
  migration/dirtyrate: add vcpu option for qmp calc-dirty-rate
  migration/dirtyrate: adjust struct DirtyRateStat
  migration/dirtyrate: check support of calculation for vcpu
  migration/dirtyrate: implement dirty-ring dirtyrate calculation

 accel/kvm/kvm-all.c    |  11 +++
 include/hw/core/cpu.h  |   2 +
 include/sysemu/kvm.h   |   1 +
 migration/dirtyrate.c  | 179 +++++++++++++++++++++++++++++++++++++----
 migration/dirtyrate.h  |  19 ++++-
 migration/trace-events |   1 +
 qapi/migration.json    |  28 ++++++-
 7 files changed, 222 insertions(+), 19 deletions(-)

-- 
2.24.3


