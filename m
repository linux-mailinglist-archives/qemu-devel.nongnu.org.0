Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3937A1A1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:22:00 +0200 (CEST)
Received: from localhost ([::1]:45136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNeR-0007OC-Uo
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWo-0001hV-8C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWh-0000i6-FK
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9PmpnED5fUrD9QZqsJgK7n1PianKfhxxvBKHprYuBe4=;
 b=PYxV18+xNDP6H3pfKSgwA6A+G/9I8gvGbMz5VLqKOxPFutoQzo8CXM6WLWZ1t4Xvv8vr8g
 s7Y606ztdoSgpQMHVPMX4o0J28/1TGvhQXBIeQyaoOqFtKuo7nMf3+lJ2zgdpzahtrjqZK
 bQuPtXQ2O4/iG0yH5bpIBfnEMKEJnzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-YgblzeA3OASnM_YEecmNhg-1; Tue, 11 May 2021 04:13:55 -0400
X-MC-Unique: YgblzeA3OASnM_YEecmNhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22BE36D246;
 Tue, 11 May 2021 08:13:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B567E5D9E3;
 Tue, 11 May 2021 08:13:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/33] accel: introduce new accessor functions
Date: Tue, 11 May 2021 04:13:22 -0400
Message-Id: <20210511081350.419428-6-pbonzini@redhat.com>
In-Reply-To: <20210511081350.419428-1-pbonzini@redhat.com>
References: <20210511081350.419428-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

avoid open coding the accesses to cpu->accel_cpu interfaces,
and instead introduce:

accel_cpu_instance_init,
accel_cpu_realizefn

to be used by the targets/ initfn code,
and by cpu_exec_realizefn respectively.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-7-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/accel-common.c | 19 +++++++++++++++++++
 cpu.c                |  6 +-----
 include/qemu/accel.h | 13 +++++++++++++
 target/i386/cpu.c    |  9 ++-------
 4 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index 9901b0531c..0f6fb4fb66 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -89,6 +89,25 @@ void accel_init_interfaces(AccelClass *ac)
     accel_init_cpu_interfaces(ac);
 }
 
+void accel_cpu_instance_init(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_instance_init) {
+        cc->accel_cpu->cpu_instance_init(cpu);
+    }
+}
+
+void accel_cpu_realizefn(CPUState *cpu, Error **errp)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->accel_cpu && cc->accel_cpu->cpu_realizefn) {
+        /* NB: errp parameter is unused currently */
+        cc->accel_cpu->cpu_realizefn(cpu, errp);
+    }
+}
+
 static const TypeInfo accel_cpu_type = {
     .name = TYPE_ACCEL_CPU,
     .parent = TYPE_OBJECT,
diff --git a/cpu.c b/cpu.c
index ba5d272c1e..25e6fbfa2c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -130,11 +130,7 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
     cpu_list_add(cpu);
-
-    if (cc->accel_cpu) {
-        /* NB: errp parameter is unused currently */
-        cc->accel_cpu->cpu_realizefn(cpu, errp);
-    }
+    accel_cpu_realizefn(cpu, errp);
 
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index b9d6d69eb8..da0c8ab523 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -78,4 +78,17 @@ int accel_init_machine(AccelState *accel, MachineState *ms);
 void accel_setup_post(MachineState *ms);
 #endif /* !CONFIG_USER_ONLY */
 
+/**
+ * accel_cpu_instance_init:
+ * @cpu: The CPU that needs to do accel-specific object initializations.
+ */
+void accel_cpu_instance_init(CPUState *cpu);
+
+/**
+ * accel_cpu_realizefn:
+ * @cpu: The CPU that needs to call accel-specific cpu realization.
+ * @errp: currently unused.
+ */
+void accel_cpu_realizefn(CPUState *cpu, Error **errp);
+
 #endif /* QEMU_ACCEL_H */
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index fb7a7be2fd..010db23379 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -28,7 +28,6 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
-#include "hw/core/accel-cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
 #include "kvm/kvm_i386.h"
@@ -6800,8 +6799,6 @@ static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(obj);
-    CPUClass *cc = CPU_CLASS(xcc);
-
     CPUX86State *env = &cpu->env;
 
     env->nr_dies = 1;
@@ -6850,10 +6847,8 @@ static void x86_cpu_initfn(Object *obj)
         x86_cpu_load_model(cpu, xcc->model);
     }
 
-    /* if required, do the accelerator-specific cpu initialization */
-    if (cc->accel_cpu) {
-        cc->accel_cpu->cpu_instance_init(CPU(obj));
-    }
+    /* if required, do accelerator-specific cpu initializations */
+    accel_cpu_instance_init(CPU(obj));
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
-- 
2.26.2



