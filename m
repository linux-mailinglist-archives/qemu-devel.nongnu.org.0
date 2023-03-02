Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F51C6A823A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:31:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5a-0007rK-D4; Thu, 02 Mar 2023 07:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5Y-0007nC-Gt
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5W-0002xD-Sh
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QDvVm3Zp0Blyv/xh76cOuTzSZ1sC6BxoIEb7/WoO+HE=;
 b=S3nhUTFshNPEvO0hQvEf19W2T4wjEzEPPUMhPF3tTgfCdtby5qR6JjUv7kw9MXv1JDx9lY
 +1vqmpv072Fw+Rj/4pWkaJbJs9+ePSMykVjgkDvNt+Az3Azq57etaU8G7RA/zuTNamlUjx
 qYJu1aEAsCnfQZLDM+r9m1rec/Gm5Wo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-5GuZvXp5Ng-B_J1Tb2uU9g-1; Thu, 02 Mar 2023 07:31:08 -0500
X-MC-Unique: 5GuZvXp5Ng-B_J1Tb2uU9g-1
Received: by mail-wm1-f70.google.com with SMTP id
 l31-20020a05600c1d1f00b003e8626cdd42so5696906wms.3
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDvVm3Zp0Blyv/xh76cOuTzSZ1sC6BxoIEb7/WoO+HE=;
 b=ZyK6za17bJKbAUWroJFwcgWVJ9dYVyInXMYrSLAfYaLFQ+K0e171vkFHWPMoCjkNBt
 2bCMl/4K+XHLo6cPUy4HOtYeLEXX3ffjBk49Agts3UvTS48EfmTlOR1yuCaa+MvXIuce
 Wj1X5wr7XVnR2OeHv9rEBsEQCbBumvMCWGpe3izs2iX/KZM3uP+/9trmem1F45cGuJZz
 dUsq6/0bahAs+TtGLqkJ9CF26deAnOIeFgjUKqbe6TbPPGhXUBmI6T1A707TY78hylJk
 1LUHA6ch/FpUC4h6qjAbI2zz48AEm8HXydJpnTV1coRQhh5VdRie5UZS0aqIwXl0H1hv
 JsYw==
X-Gm-Message-State: AO0yUKWHliEjV5lJpsf7XoIclBTkdK9JM5+kzlYpsrybl/XoqEyiqe5m
 gzvcbHESE/x1Im/q3oG7RfyE9OIMS7hdphhhbqwRuCNmdTPEV4awDFCksk+7syUU/+4czxHhOra
 F6fkXY3wybcYv7jHOgR6wpN+eCJ333xR9cCj2KKvIUTE8nBiatRVLrvoEbO9vXECYMmjVjPbrom
 U=
X-Received: by 2002:a5d:5387:0:b0:2c7:cc8:782e with SMTP id
 d7-20020a5d5387000000b002c70cc8782emr1398679wrv.33.1677760267345; 
 Thu, 02 Mar 2023 04:31:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8CcAXwzqw1ATFfBltKl5RSMI7DUoBaiAvReQtgaiNSn7/kC09l27h4BvkyRjVbMkAiY8bBjg==
X-Received: by 2002:a5d:5387:0:b0:2c7:cc8:782e with SMTP id
 d7-20020a5d5387000000b002c70cc8782emr1398667wrv.33.1677760267106; 
 Thu, 02 Mar 2023 04:31:07 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600012cf00b002be505ab59asm15281167wrx.97.2023.03.02.04.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:06 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Joao Martins <joao.m.martins@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [PULL 11/62] i386/xen: implement HYPERVISOR_sched_op, SCHEDOP_shutdown
Date: Thu,  2 Mar 2023 13:29:38 +0100
Message-Id: <20230302123029.153265-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It allows to shutdown itself via hypercall with any of the 3 reasons:
  1) self-reboot
  2) shutdown
  3) crash

Implementing SCHEDOP_shutdown sub op let us handle crashes gracefully rather
than leading to triple faults if it remains unimplemented.

In addition, the SHUTDOWN_soft_reset reason is used for kexec, to reset
Xen shared pages and other enlightenments and leave a clean slate for the
new kernel without the hypervisor helpfully writing information at
unexpected addresses.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[dwmw2: Ditch sched_op_compat which was never available for HVM guests,
        Add SCHEDOP_soft_reset]
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 include/sysemu/kvm_xen.h     |  1 +
 target/i386/kvm/trace-events |  1 +
 target/i386/kvm/xen-emu.c    | 75 ++++++++++++++++++++++++++++++++++++
 3 files changed, 77 insertions(+)

diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index 296533f2d558..5dffcc054294 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -12,6 +12,7 @@
 #ifndef QEMU_SYSEMU_KVM_XEN_H
 #define QEMU_SYSEMU_KVM_XEN_H
 
+int kvm_xen_soft_reset(void);
 uint32_t kvm_xen_get_caps(void);
 
 #define kvm_xen_has_cap(cap) (!!(kvm_xen_get_caps() &           \
diff --git a/target/i386/kvm/trace-events b/target/i386/kvm/trace-events
index cd6f842b1fd1..bb732e1da840 100644
--- a/target/i386/kvm/trace-events
+++ b/target/i386/kvm/trace-events
@@ -8,3 +8,4 @@ kvm_x86_update_msi_routes(int num) "Updated %d MSI routes"
 
 # xen-emu.c
 kvm_xen_hypercall(int cpu, uint8_t cpl, uint64_t input, uint64_t a0, uint64_t a1, uint64_t a2, uint64_t ret) "xen_hypercall: cpu %d cpl %d input %" PRIu64 " a0 0x%" PRIx64 " a1 0x%" PRIx64 " a2 0x%" PRIx64" ret 0x%" PRIx64
+kvm_xen_soft_reset(void) ""
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 56b80a788049..4ed833656f72 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -11,14 +11,17 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/main-loop.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/kvm_xen.h"
 #include "kvm/kvm_i386.h"
 #include "exec/address-spaces.h"
 #include "xen-emu.h"
 #include "trace.h"
+#include "sysemu/runstate.h"
 
 #include "hw/xen/interface/version.h"
+#include "hw/xen/interface/sched.h"
 
 static int kvm_gva_rw(CPUState *cs, uint64_t gva, void *_buf, size_t sz,
                       bool is_write)
@@ -170,6 +173,75 @@ static bool kvm_xen_hcall_xen_version(struct kvm_xen_exit *exit, X86CPU *cpu,
     return true;
 }
 
+int kvm_xen_soft_reset(void)
+{
+    assert(qemu_mutex_iothread_locked());
+
+    trace_kvm_xen_soft_reset();
+
+    /* Nothing to reset... yet. */
+    return 0;
+}
+
+static int schedop_shutdown(CPUState *cs, uint64_t arg)
+{
+    struct sched_shutdown shutdown;
+    int ret = 0;
+
+    /* No need for 32/64 compat handling */
+    qemu_build_assert(sizeof(shutdown) == 4);
+
+    if (kvm_copy_from_gva(cs, arg, &shutdown, sizeof(shutdown))) {
+        return -EFAULT;
+    }
+
+    switch (shutdown.reason) {
+    case SHUTDOWN_crash:
+        cpu_dump_state(cs, stderr, CPU_DUMP_CODE);
+        qemu_system_guest_panicked(NULL);
+        break;
+
+    case SHUTDOWN_reboot:
+        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+        break;
+
+    case SHUTDOWN_poweroff:
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        break;
+
+    case SHUTDOWN_soft_reset:
+        qemu_mutex_lock_iothread();
+        ret = kvm_xen_soft_reset();
+        qemu_mutex_unlock_iothread();
+        break;
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
+                                   int cmd, uint64_t arg)
+{
+    CPUState *cs = CPU(cpu);
+    int err = -ENOSYS;
+
+    switch (cmd) {
+    case SCHEDOP_shutdown:
+        err = schedop_shutdown(cs, arg);
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
 static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
 {
     uint16_t code = exit->u.hcall.input;
@@ -180,6 +252,9 @@ static bool do_kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
     }
 
     switch (code) {
+    case __HYPERVISOR_sched_op:
+        return kvm_xen_hcall_sched_op(exit, cpu, exit->u.hcall.params[0],
+                                      exit->u.hcall.params[1]);
     case __HYPERVISOR_xen_version:
         return kvm_xen_hcall_xen_version(exit, cpu, exit->u.hcall.params[0],
                                          exit->u.hcall.params[1]);
-- 
2.39.1


