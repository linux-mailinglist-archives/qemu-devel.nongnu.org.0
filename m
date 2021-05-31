Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76557396681
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:08:57 +0200 (CEST)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnlPM-0002oA-HA
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1lnlKQ-00068U-CC
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:03:50 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:33168
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1lnlKK-0004aa-PN
 for qemu-devel@nongnu.org; Mon, 31 May 2021 13:03:50 -0400
HMM_SOURCE_IP: 172.18.0.48:58222.1682084387
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-202.80.192.39?logid-48afce8d3b6b4436b73d11f8304b4286
 (unknown [172.18.0.48])
 by chinatelecom.cn (HERMES) with SMTP id A730F2800E8;
 Tue,  1 Jun 2021 01:03:23 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([172.18.0.48])
 by app0024 with ESMTP id 48afce8d3b6b4436b73d11f8304b4286 for
 qemu-devel@nongnu.org; Tue Jun  1 01:03:30 2021
X-Transaction-ID: 48afce8d3b6b4436b73d11f8304b4286
X-filter-score: filter<0>
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 172.18.0.48
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 1/6] KVM: add kvm_dirty_ring_enabled function
Date: Tue,  1 Jun 2021 01:03:18 +0800
Message-Id: <e105cd9e381fd4ae121952aae2a79cd6ebc612a8.1622479161.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1622479161.git.huangy81@chinatelecom.cn>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.228;
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

introduce kvm_dirty_ring_enabled to show if kvm-reaper is working.
dirtyrate thread could use it to check if calculation can base on
dirty ring feature.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
---
 accel/kvm/kvm-all.c  | 5 +++++
 include/sysemu/kvm.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index c7ec538850..2e96b77b31 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2293,6 +2293,11 @@ bool kvm_vcpu_id_is_valid(int vcpu_id)
     return vcpu_id >= 0 && vcpu_id < kvm_max_vcpu_id(s);
 }
 
+bool kvm_dirty_ring_enabled(void)
+{
+    return kvm_state->kvm_dirty_ring_size ? true : false;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d..7b22aeb6ae 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -547,4 +547,5 @@ bool kvm_cpu_check_are_resettable(void);
 
 bool kvm_arch_cpu_check_are_resettable(void);
 
+bool kvm_dirty_ring_enabled(void);
 #endif
-- 
2.24.3


