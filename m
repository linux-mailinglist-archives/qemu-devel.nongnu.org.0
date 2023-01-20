Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCC4675554
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:16:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrDa-0006a8-SF; Fri, 20 Jan 2023 08:14:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pIrDU-0006Ws-7L
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:14:00 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pIrDQ-0000ff-9r
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MHOmhDd79CJ/VF3tcCBRmWulTzbFIxXLDGiTzA2SW0o=; b=ZTDC+qd7E8hEtyvkp6o9L6wfdR
 jud/zqeIEkdyDm4P8kKiGw87IRtankgUecd7OiK57h+B/8cjVlBOaQ/uXp7JxwJpEi/UkdznS2GNP
 TPzOHSrHL9N8yTcxrF+o4eo5y38aGoEk5xvQDe3UaoXlVS7eTbqGk1ELeUQm2ZUdSZDOkq6Xs6b1T
 YJA9Xe/qkcpGYcqQiUDUidca+oP0NQNdYa/IN5EW0+JXYBo9yTKq7lZVyD3GNykeMQSZdGqYQ1BiB
 gGHKHzW7TzVgGkd7xnWX6cLMm6r/s2vgv3ldxsQI2aaZDMTPusc9HBR3JEPbeKcMyKabfM41DTUyC
 lm+fUSrw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pIrDI-001yEo-MN; Fri, 20 Jan 2023 13:13:49 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pIrDI-0063E7-23; Fri, 20 Jan 2023 13:13:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
Subject: [PATCH v8 23/58] i386/xen: implement HYPERVISOR_event_channel_op
Date: Fri, 20 Jan 2023 13:13:08 +0000
Message-Id: <20230120131343.1441939-24-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120131343.1441939-1-dwmw2@infradead.org>
References: <20230120131343.1441939-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+010e331da30354bf639d+7089+infradead.org+dwmw2@casper.srs.infradead.org;
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

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Ditch event_channel_op_compat which was never available to HVM guests]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/xen-emu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 8450b162ad..7ef3d8e520 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -28,6 +28,7 @@
 #include "standard-headers/xen/memory.h"
 #include "standard-headers/xen/hvm/hvm_op.h"
 #include "standard-headers/xen/vcpu.h"
+#include "standard-headers/xen/event_channel.h"
 
 #include "xen-compat.h"
 
@@ -588,6 +589,27 @@ static bool kvm_xen_hcall_vcpu_op(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+static bool kvm_xen_hcall_evtchn_op(struct kvm_xen_exit *exit,
+                                    int cmd, uint64_t arg)
+{
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case EVTCHNOP_init_control:
+    case EVTCHNOP_expand_array:
+    case EVTCHNOP_set_priority:
+        /* We do not support FIFO channels at this point */
+        err = -ENOSYS;
+        break;
+
+    default:
+        return false;
+    }
+
+    exit->u.hcall.result = err;
+    return true;
+}
+
 int kvm_xen_soft_reset(void)
 {
     CPUState *cpu;
@@ -694,6 +716,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     case __HYPERVISOR_sched_op:
         return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
                                       exit->u.hcall.params[1]);
+    case __HYPERVISOR_event_channel_op:
+        return kvm_xen_hcall_evtchn_op(exit, exit->u.hcall.params[0],
+                                       exit->u.hcall.params[1]);
     case __HYPERVISOR_vcpu_op:
         return kvm_xen_hcall_vcpu_op(exit, cpu,
                                      exit->u.hcall.params[0],
-- 
2.39.0


