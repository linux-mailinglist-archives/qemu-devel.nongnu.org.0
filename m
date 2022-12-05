Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4A642EF1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKc-0007yn-Qg; Mon, 05 Dec 2022 12:32:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FKQ-0007tf-Q6
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:30 -0500
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1p2FJx-0007PN-Ny
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rkK9VFLmfirR8wLpY+b7Mvx04xA0mJDW6Uj3HdVY2/g=; b=eAjzTSLOM/aNAICiEwp6ygQeaL
 4q22DxShDdHcf6WePmEUBHPX0kZlpgLI2jJcEZjqeQkXLTqh+AF0qzAzw8aaWPNfgOtmyiAyT7rSR
 uirvWeysq+xz7faotIIPw6H9C7dCqEbtcIeN4zqEL0sU+kAHWGQlknIy3FYcYytZcVFt5rS4o74XB
 5Kg2ljw/pyt9v7JKPlU3R4gTinkZoXzHIpXHTtJ+6T8Keb1XhnI0v1XA9kM9Jqgg3s7PlwxnQH9K6
 JkLlkfyUmsAtuHSao33Jp1HXwLEUI/cvEpnijZ9WDYnuKdTkt1g/Jg79nyibR69D+kzt8iLBadFIt
 zAgpdK2A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJp-007fzR-0j; Mon, 05 Dec 2022 17:31:53 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKf-Ok; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 16/21] i386/xen: handle register_vcpu_time_memory_area
Date: Mon,  5 Dec 2022 17:31:32 +0000
Message-Id: <20221205173137.607044-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05;
 envelope-from=BATV+0f5700dbc1736e95d806+7043+infradead.org+dwmw2@desiato.srs.infradead.org;
 helo=desiato.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Joao Martins <joao.m.martins@oracle.com>

In order to support Linux vdso in Xen.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 59aca2ad19..1def526e08 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -43,17 +43,22 @@ static void *gpa_to_hva(uint64_t gpa)
                                              mrs.offset_within_region);
 }
 
-static void *gva_to_hva(CPUState *cs, uint64_t gva)
+static uint64_t gva_to_gpa(CPUState *cs, uint64_t gva)
 {
     struct kvm_translation t = { .linear_address = gva };
     int err;
 
     err = kvm_vcpu_ioctl(cs, KVM_TRANSLATE, &t);
     if (err || !t.valid) {
-        return NULL;
+        return 0;
     }
 
-    return gpa_to_hva(t.physical_address);
+    return t.physical_address;
+}
+
+static void *gva_to_hva(CPUState *cs, uint64_t gva)
+{
+    return gpa_to_hva(gva_to_gpa(cs, gva));
 }
 
 int kvm_xen_init(KVMState *s, uint32_t xen_version)
@@ -244,6 +249,27 @@ static int vcpuop_register_vcpu_info(CPUState *cs, CPUState *target,
     return xen_set_vcpu_attr(target, KVM_XEN_VCPU_ATTR_TYPE_VCPU_INFO, gpa);
 }
 
+static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
+                                          uint64_t arg)
+{
+    struct vcpu_register_time_memory_area *tma;
+    uint64_t gpa;
+    void *hva;
+
+    tma = gva_to_hva(cs, arg);
+    if (!tma) {
+        return -EFAULT;
+    }
+
+    hva = gva_to_hva(cs, tma->addr.p);
+    if (!hva || !tma->addr.p) {
+        return -EFAULT;
+    }
+
+    gpa = gva_to_gpa(cs, tma->addr.p);
+    return xen_set_vcpu_attr(target, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO, gpa);
+}
+
 static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                  int cmd, int vcpu_id, uint64_t arg)
 {
@@ -252,6 +278,10 @@ static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err = -ENOSYS;
 
     switch (cmd) {
+    case VCPUOP_register_vcpu_time_memory_area: {
+            err = vcpuop_register_vcpu_time_info(cs, dest, arg);
+            break;
+        }
     case VCPUOP_register_vcpu_info: {
             err = vcpuop_register_vcpu_info(cs, dest, arg);
             break;
-- 
2.35.3


