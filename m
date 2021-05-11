Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F8437A180
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:16:09 +0200 (CEST)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgNYm-0004Jo-1u
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWh-0001N2-OE
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgNWf-0000ge-T1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620720837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oik8IFTeBv6jNvNUoWrJU2eOqfLcIDd2Jzvyt6ZQcGI=;
 b=SRLGOi9gXPiETlS7T20feZ8LFDo1A4GF3jGwUVKbvyx3Xo1IHGlftv7qvkMjmeA9HK0pcE
 SCYg8fFflDtVRBt2mbVnYpsyYjhXy2+Cc0gFEOsEMR3GycYUSd/Iocf71qYIvzDLckZ6XT
 J9kEMjKW+eEiK9gToX6/B/8KzW4ycQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-48KfOOBiMLOD1u7uT8ElNA-1; Tue, 11 May 2021 04:13:54 -0400
X-MC-Unique: 48KfOOBiMLOD1u7uT8ElNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BCC01854E24;
 Tue, 11 May 2021 08:13:53 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A4EC5D9E3;
 Tue, 11 May 2021 08:13:53 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] cpu: call AccelCPUClass::cpu_realizefn in
 cpu_exec_realizefn
Date: Tue, 11 May 2021 04:13:21 -0400
Message-Id: <20210511081350.419428-5-pbonzini@redhat.com>
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

move the call to accel_cpu->cpu_realizefn to the general
cpu_exec_realizefn from target/i386, so it does not need to be
called for every target explicitly as we enable more targets.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210322132800.7470-6-cfontana@suse.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpu.c             |  6 ++++++
 target/i386/cpu.c | 20 +++++++-------------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/cpu.c b/cpu.c
index bfbe5a66f9..ba5d272c1e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -36,6 +36,7 @@
 #include "sysemu/replay.h"
 #include "exec/translate-all.h"
 #include "exec/log.h"
+#include "hw/core/accel-cpu.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -130,6 +131,11 @@ void cpu_exec_realizefn(CPUState *cpu, Error **errp)
 
     cpu_list_add(cpu);
 
+    if (cc->accel_cpu) {
+        /* NB: errp parameter is unused currently */
+        cc->accel_cpu->cpu_realizefn(cpu, errp);
+    }
+
 #ifdef CONFIG_TCG
     /* NB: errp parameter is unused currently */
     if (tcg_enabled()) {
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index da4142a69f..fb7a7be2fd 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6457,16 +6457,19 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
 static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     X86CPU *cpu = X86_CPU(dev);
     X86CPUClass *xcc = X86_CPU_GET_CLASS(dev);
     CPUX86State *env = &cpu->env;
     Error *local_err = NULL;
     static bool ht_warned;
 
-    /* The accelerator realizefn needs to be called first. */
-    if (cc->accel_cpu) {
-        cc->accel_cpu->cpu_realizefn(cs, errp);
+    /* Process Hyper-V enlightenments */
+    x86_cpu_hyperv_realize(cpu);
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
     }
 
     if (xcc->host_cpuid_required && !accel_uses_host_cpuid()) {
@@ -6584,15 +6587,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
         env->cache_info_amd.l3_cache = &legacy_l3_cache;
     }
 
-    /* Process Hyper-V enlightenments */
-    x86_cpu_hyperv_realize(cpu);
-
-    cpu_exec_realizefn(cs, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
-        return;
-    }
-
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
     qemu_register_reset(x86_cpu_machine_reset_cb, cpu);
-- 
2.26.2



