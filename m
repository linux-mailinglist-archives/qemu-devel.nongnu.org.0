Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE4652AF7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 02:27:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7nZw-0003q3-BO; Tue, 20 Dec 2022 20:07:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZK-0002tg-Sq
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:52 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p7nZG-0004EL-Pk
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 20:06:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=q95r/1GoOft/+2uOxcMmIak//i25t5q2wDFuIGI2Lic=; b=Jd8S1OOz04IkA8Hw96cREgT08t
 Fh0Q13pRj/PsPpYdGbnHdfiQsnweX1pFAaDGebj0FAzA2H5GaHv14YRo9LEL/bDWiy0O39+iVZRZd
 pobnmNvLgVfXMIROlofMIfdGCIwWNjCYiiBWcR0xxmYEjxnbDKJUsl6Tl406gqgluwCT31doOhDOu
 xKPhhvsKcnRTbafnUkknvuOJ0aGJ9jaAXfK7+nJxT8J5sVh++N3YcoLL1CB6rgiNW1NUneos9iAf9
 4vgwtvVvlRPoy7XrH2lh6vyUgSLP4dCFpMrMa5ZAHHu7mUPcN+0Zr/LvB5LZqRBt8KEbnTscESWWk
 E/eWp+ag==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p7nZ8-002Kcm-Dn; Wed, 21 Dec 2022 01:06:39 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p7nYw-004CMe-S3; Wed, 21 Dec 2022 01:06:26 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [RFC PATCH v4 26/47] i386/xen: implement HVMOP_set_param
Date: Wed, 21 Dec 2022 01:06:02 +0000
Message-Id: <20221221010623.1000191-27-dwmw2@infradead.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221221010623.1000191-1-dwmw2@infradead.org>
References: <20221221010623.1000191-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b12bb331c036832273ad+7059+infradead.org+dwmw2@casper.srs.infradead.org;
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

From: Ankur Arora <ankur.a.arora@oracle.com>

This is the hook for adding the HVM_PARAM_CALLBACK_IRQ parameter in a
subsequent commit.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Split out from another commit]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 target/i386/kvm/xen-emu.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 9f0ade9325..cb2c243629 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -488,6 +488,36 @@ static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool handle_set_param(struct kvm_xen_exit *exit, X86CPU *cpu,
+                             uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    struct xen_hvm_param hp;
+    int err = 0;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(hp) == 16);
+
+    if (kvm_copy_from_gva(cs, arg, &hp, sizeof(hp))) {
+        err = -EFAULT;
+        goto out;
+    }
+
+    if (hp.domid != DOMID_SELF && hp.domid != xen_domid) {
+        err = -EINVAL;
+        goto out;
+    }
+
+    switch (hp.index) {
+    default:
+        return false;
+    }
+
+out:
+    exit->u.hcall.result = err;
+    return true;
+}
+
 static int kvm_xen_hcall_evtchn_upcall_vector(struct kvm_xen_exit *exit,
                                               X86CPU *cpu, uint64_t arg)
 {
@@ -529,6 +559,9 @@ static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
         ret = -ENOSYS;
         break;
 
+    case HVMOP_set_param:
+        return handle_set_param(exit, cpu, arg);
+
     default:
         return false;
     }
-- 
2.35.3


