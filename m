Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B563656AC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:49:40 +0200 (CEST)
Received: from localhost ([::1]:46474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnwp-00064d-AZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkW-00011s-Pw; Tue, 20 Apr 2021 06:36:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:38260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lYnkU-0003tm-PC; Tue, 20 Apr 2021 06:36:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4BA2B4A2;
 Tue, 20 Apr 2021 10:36:22 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v2 10/13] target/s390x: remove kvm-stub.c
Date: Tue, 20 Apr 2021 12:36:13 +0200
Message-Id: <20210420103616.32731-11-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210420103616.32731-1-cfontana@suse.de>
References: <20210420103616.32731-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

all function calls are protected by kvm_enabled(),
so we should not need the stubs.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/kvm-stub.c  | 126 ---------------------------------------
 target/s390x/meson.build |   2 +-
 2 files changed, 1 insertion(+), 127 deletions(-)
 delete mode 100644 target/s390x/kvm-stub.c

diff --git a/target/s390x/kvm-stub.c b/target/s390x/kvm-stub.c
deleted file mode 100644
index 9970b5a8c7..0000000000
--- a/target/s390x/kvm-stub.c
+++ /dev/null
@@ -1,126 +0,0 @@
-/*
- * QEMU KVM support -- s390x specific function stubs.
- *
- * Copyright (c) 2009 Ulrich Hecht
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_s390x.h"
-
-void kvm_s390_access_exception(S390CPU *cpu, uint16_t code, uint64_t te_code)
-{
-}
-
-int kvm_s390_mem_op(S390CPU *cpu, vaddr addr, uint8_t ar, void *hostbuf,
-                    int len, bool is_write)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_program_interrupt(S390CPU *cpu, uint16_t code)
-{
-}
-
-int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_vcpu_interrupt_pre_save(S390CPU *cpu)
-{
-}
-
-int kvm_s390_vcpu_interrupt_post_load(S390CPU *cpu)
-{
-    return 0;
-}
-
-int kvm_s390_get_hpage_1m(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_ri(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_gs(void)
-{
-    return 0;
-}
-
-int kvm_s390_get_clock(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_get_clock_ext(uint8_t *tod_high, uint64_t *tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-int kvm_s390_set_clock_ext(uint8_t tod_high, uint64_t tod_low)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_enable_css_support(S390CPU *cpu)
-{
-}
-
-int kvm_s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch,
-                                    int vq, bool assign)
-{
-    return -ENOSYS;
-}
-
-void kvm_s390_cmma_reset(void)
-{
-}
-
-void kvm_s390_reset_vcpu_initial(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_clear(S390CPU *cpu)
-{
-}
-
-void kvm_s390_reset_vcpu_normal(S390CPU *cpu)
-{
-}
-
-int kvm_s390_set_mem_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    return 0;
-}
-
-void kvm_s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-}
-
-void kvm_s390_crypto_reset(void)
-{
-}
-
-void kvm_s390_stop_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_restart_interrupt(S390CPU *cpu)
-{
-}
-
-void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
-{
-}
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index bbcaede384..6c8e03b8fb 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -8,7 +8,7 @@ s390x_ss.add(files(
   'cpu-dump.c',
 ))
 
-s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
+s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'))
 
 gen_features = executable('gen-features', 'gen-features.c', native: true,
                           build_by_default: false)
-- 
2.26.2


