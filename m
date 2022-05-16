Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A28C528364
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:38:10 +0200 (CEST)
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZ3B-0000hD-3r
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7W-00086U-BN
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY7U-0005Va-LZ
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jj+1GdC5ed9RjG2w4YTgAyI/dqT/LcafZe1Q5l3sISU=;
 b=Gx6h7orFnV/c73D2Q/hlV/Ot6KSXY/dsgRbcIUAGM8r6iC/gQCWCw7OTqjYtrI7/GdSE+f
 n5Sa/Of09ixNip68IxxNzptOuAdgsNwm9KurglIjri40ekzlz0t56SrDuw6fO5R9CizaRd
 yZBqzG6RkYy6rBMbnM1znZjMpShhs10=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-3wRuHJnNMP2lNPczy9IpGQ-1; Mon, 16 May 2022 06:38:30 -0400
X-MC-Unique: 3wRuHJnNMP2lNPczy9IpGQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg7-20020a05600c3c8700b0039468585269so6563068wmb.3
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jj+1GdC5ed9RjG2w4YTgAyI/dqT/LcafZe1Q5l3sISU=;
 b=BtRclhhdUZSYAEN36L8zM91RTbGrz5RMdLnYJaN0F8bHRnNir/uCxTtUWOe+zraR6s
 K0NJnmaITfG8pZ91M7JR0a5mCMoUO+fbwxRIrVjpLiYJ4CeswdvMLSR4w7xhuZQQFVEy
 PWnYThC1wodEn7dn73UD7ful+g4aRDzRF/JpUmOmMDSj+DGDU+I5OruWegBORf8DkTNA
 ASnTX7y3WELxPGooZ0i+3RzDjtx4a54Tf4EhnKMozU6bvkg5mUnbgEoutls1WbYinmON
 i8tXqR+D0OGf/O7lFIDcw6X41Vfz6oVCzy06MgP2s2orvMUWs5p9g086Ga9ijb4ioPZz
 4HUw==
X-Gm-Message-State: AOAM533zSWIQsSjpoBTb7oV96DA311Vi6v+/Tw1QAcgoXSYkXIKZaBFT
 o4a7j81iVmnnDkLU7kyl17NAIrw9BpMS4Ay9u3RVzqU/iyh7ZBXVM+NaxdnaUmMGCcd/qSZhgtk
 jbEGCWjzJw2iDWmViCDi1EagYiyHKhdHLplXc8Pd1EE2luEBmvgB83VvnTk/q
X-Received: by 2002:a5d:55cd:0:b0:20d:743:6078 with SMTP id
 i13-20020a5d55cd000000b0020d07436078mr4512169wrw.240.1652697509371; 
 Mon, 16 May 2022 03:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuLIC5azL1kewoTfpBvgMX057eM6Y2+fItaWzmV/QKn2K7lZmZOohxOfmDTBkOuxEGXGLOtQ==
X-Received: by 2002:a5d:55cd:0:b0:20d:743:6078 with SMTP id
 i13-20020a5d55cd000000b0020d07436078mr4512145wrw.240.1652697509132; 
 Mon, 16 May 2022 03:38:29 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 k20-20020a05600c1c9400b003942a244f38sm13893788wms.17.2022.05.16.03.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:38:28 -0700 (PDT)
Date: Mon, 16 May 2022 06:38:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org
Subject: [PULL 49/91] target/i386: Fix sanity check on max APIC ID / X2APIC
 enablement
Message-ID: <20220516095448.507876-50-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Woodhouse <dwmw2@infradead.org>

The check on x86ms->apic_id_limit in pc_machine_done() had two problems.

Firstly, we need KVM to support the X2APIC API in order to allow IRQ
delivery to APICs >= 255. So we need to call/check kvm_enable_x2apic(),
which was done elsewhere in *some* cases but not all.

Secondly, microvm needs the same check. So move it from pc_machine_done()
to x86_cpus_init() where it will work for both.

The check in kvm_cpu_instance_init() is now redundant and can be dropped.

Signed-off-by: David Woodhouse <dwmw2@infradead.org>
Acked-by: Claudio Fontana <cfontana@suse.de>
Message-Id: <20220314142544.150555-1-dwmw2@infradead.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c              |  8 --------
 hw/i386/x86.c             | 16 ++++++++++++++++
 target/i386/kvm/kvm-cpu.c |  2 +-
 3 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 312eb9e400..15f37d8dc6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -744,14 +744,6 @@ void pc_machine_done(Notifier *notifier, void *data)
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
     }
-
-
-    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
-        !kvm_irqchip_in_kernel()) {
-        error_report("current -smp configuration requires kernel "
-                     "irqchip support.");
-        exit(EXIT_FAILURE);
-    }
 }
 
 void pc_guest_info_init(PCMachineState *pcms)
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 79ebdface6..f79e720cc2 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -38,6 +38,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/cpu-timers.h"
+#include "sysemu/xen.h"
 #include "trace.h"
 
 #include "hw/i386/x86.h"
@@ -122,6 +123,21 @@ void x86_cpus_init(X86MachineState *x86ms, int default_cpu_version)
      */
     x86ms->apic_id_limit = x86_cpu_apic_id_from_index(x86ms,
                                                       ms->smp.max_cpus - 1) + 1;
+
+    /*
+     * Can we support APIC ID 255 or higher?
+     *
+     * Under Xen: yes.
+     * With userspace emulated lapic: no
+     * With KVM's in-kernel lapic: only if X2APIC API is enabled.
+     */
+    if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
+        (!kvm_irqchip_in_kernel() || !kvm_enable_x2apic())) {
+        error_report("current -smp configuration requires kernel "
+                     "irqchip and X2APIC API support.");
+        exit(EXIT_FAILURE);
+    }
+
     possible_cpus = mc->possible_cpu_arch_ids(ms);
     for (i = 0; i < ms->smp.cpus; i++) {
         x86_cpu_new(x86ms, possible_cpus->cpus[i].arch_id, &error_fatal);
diff --git a/target/i386/kvm/kvm-cpu.c b/target/i386/kvm/kvm-cpu.c
index 5eb955ce9a..7237378a7d 100644
--- a/target/i386/kvm/kvm-cpu.c
+++ b/target/i386/kvm/kvm-cpu.c
@@ -171,7 +171,7 @@ static void kvm_cpu_instance_init(CPUState *cs)
         /* only applies to builtin_x86_defs cpus */
         if (!kvm_irqchip_in_kernel()) {
             x86_cpu_change_kvm_default("x2apic", "off");
-        } else if (kvm_irqchip_is_split() && kvm_enable_x2apic()) {
+        } else if (kvm_irqchip_is_split()) {
             x86_cpu_change_kvm_default("kvm-msi-ext-dest-id", "on");
         }
 
-- 
MST


