Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0303C6156
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:02:31 +0200 (CEST)
Received: from localhost ([::1]:50474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zKA-0002Xs-IO
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1m2zF4-0005hj-Go
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:14 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.227]:60827
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1m2zEz-0007Ex-Tl
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:57:13 -0400
HMM_SOURCE_IP: 172.18.0.48:50580.4574419
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.181.19?logid-d6ee1067a9e34bf398e4104729ee285e
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id D5CAF28008B;
 Tue, 13 Jul 2021 00:57:04 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 5f487c777cb1474681e0b37319fd179a for
 qemu-devel@nongnu.org; Tue Jul 13 00:57:04 2021
X-Transaction-ID: 5f487c777cb1474681e0b37319fd179a
X-filter-score: 
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] KVM: introduce kvm_get_manual_dirty_log_protect
Date: Tue, 13 Jul 2021 00:56:50 +0800
Message-Id: <3a027c3e0d431c331cfe83be1996e269f5a19f0e.1626108969.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1626107174.git.huangy81@chinatelecom.cn>
References: <cover.1626107174.git.huangy81@chinatelecom.cn>
In-Reply-To: <cover.1626108969.git.huangy81@chinatelecom.cn>
References: <cover.1626108969.git.huangy81@chinatelecom.cn>
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

introduce kvm_get_manual_dirty_log_protect for measureing
dirtyrate via dirty bitmap. calculation of dirtyrate need
to sync dirty log and depends on the features of dirty log.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 accel/kvm/kvm-all.c  | 6 ++++++
 include/sysemu/kvm.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e0e88a2..f7d9ae0 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -245,6 +245,12 @@ int kvm_get_max_memslots(void)
     return s->nr_slots;
 }
 
+uint64_t kvm_get_manual_dirty_log_protect(void)
+{
+    KVMState *s = KVM_STATE(current_accel());
+    return s->manual_dirty_log_protect;
+}
+
 /* Called with KVMMemoryListener.slots_lock held */
 static KVMSlot *kvm_get_free_slot(KVMMemoryListener *kml)
 {
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 7b22aeb..b668d49 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -533,6 +533,7 @@ int kvm_set_one_reg(CPUState *cs, uint64_t id, void *source);
 int kvm_get_one_reg(CPUState *cs, uint64_t id, void *target);
 struct ppc_radix_page_info *kvm_get_radix_page_info(void);
 int kvm_get_max_memslots(void);
+uint64_t kvm_get_manual_dirty_log_protect(void);
 
 /* Notify resamplefd for EOI of specific interrupts. */
 void kvm_resample_fd_notify(int gsi);
-- 
1.8.3.1


