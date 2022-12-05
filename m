Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9F642EDA
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2FKV-0007tv-TH; Mon, 05 Dec 2022 12:32:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FKO-0007rU-TO
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:28 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2FJx-0007Pv-Nv
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 12:32:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tYJAnzCIZvUu6kPrZmPTe2KqYRMAWIKQIKSSyvhYIz0=; b=Djkytg8nSgoPF8B+XsNb1gD+de
 LVG1Y8UDfda4X362eTEyAu5Adc3Z7xgq3GJtyGbtbHLmGjoM7ehOZ5JqNmHWDWgW7IOEBLkTc/Imz
 B9aTxttg8jglo67tYX6gpjk1uCN5zE5MTjYPIxV//P5QUr95enspDmsFPFi4OXEa/y+gdi6mLXN8Z
 5GLmQmdTeCdKigPl0zKBLKPUAf4DkItOsGfByh+l/Cs6uyfiEK4++HkBODddBMXWRI4PgZAFJY25e
 yo8/Fvx61xn48kuGE6wecyD7L+BeDyGv6v2HDmHVomwYB5scVfkLHRsysdslsg9hSMO84b8d6hJo6
 pjNw+YeA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2FJw-003TwX-SE; Mon, 05 Dec 2022 17:32:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p2FJo-002YKj-PR; Mon, 05 Dec 2022 17:31:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>
Subject: [RFC PATCH 17/21] i386/xen: handle register_runstate_memory_area
Date: Mon,  5 Dec 2022 17:31:33 +0000
Message-Id: <20221205173137.607044-18-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221205173137.607044-1-dwmw2@infradead.org>
References: <20221205173137.607044-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+f9b04eb53d39f4899ead+7043+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
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

Allow guest to setup the vcpu runstates which is used as
steal clock.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/xen.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/xen.c b/target/i386/xen.c
index 1def526e08..6f0c46c018 100644
--- a/target/i386/xen.c
+++ b/target/i386/xen.c
@@ -270,6 +270,27 @@ static int vcpuop_register_vcpu_time_info(CPUState *cs, CPUState *target,
     return xen_set_vcpu_attr(target, KVM_XEN_VCPU_ATTR_TYPE_VCPU_TIME_INFO, gpa);
 }
 
+static int vcpuop_register_runstate_info(CPUState *cs, CPUState *target,
+                                         uint64_t arg)
+{
+    struct vcpu_register_runstate_memory_area *rma;
+    uint64_t gpa;
+    void *hva;
+
+    rma = gva_to_hva(cs, arg);
+    if (!rma) {
+        return -EFAULT;
+    }
+
+    hva = gva_to_hva(cs, rma->addr.p);
+    if (!hva || !rma->addr.p) {
+        return -EFAULT;
+    }
+
+    gpa = gva_to_gpa(cs, rma->addr.p);
+    return xen_set_vcpu_attr(target, KVM_XEN_VCPU_ATTR_TYPE_RUNSTATE_ADDR, gpa);
+}
+
 static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
                                  int cmd, int vcpu_id, uint64_t arg)
 {
@@ -278,6 +299,10 @@ static int kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     int err = -ENOSYS;
 
     switch (cmd) {
+    case VCPUOP_register_runstate_memory_area: {
+            err = vcpuop_register_runstate_info(cs, dest, arg);
+            break;
+        }
     case VCPUOP_register_vcpu_time_memory_area: {
             err = vcpuop_register_vcpu_time_info(cs, dest, arg);
             break;
-- 
2.35.3


