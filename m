Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E96A8240
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:32:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi69-0000Sv-Mx; Thu, 02 Mar 2023 07:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5j-0000Kf-Ik
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5i-0002z8-07
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nYdCu4pk04y4V7E/lWe9bJDwzN3jYmwwXeejjqIXt0=;
 b=IibRa2YTlGJz1yjn58UW7epXQK7H/DTI7uO8wzbiTXRvy3FfNjw5FTaIR2k+bjSqAK6DOA
 sQnsI4ckseTkwVPyax9Tpgo0LNoP38ZBnIB0DVlJ8xN0OzwW3vTNPnk4LxUDxR0xmkrTcP
 lPUeQAdnw5/swqzL0Z5HBdUex8TCnbw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-Q7wGXgL2NcGzBVpQJWyGRA-1; Thu, 02 Mar 2023 07:31:20 -0500
X-MC-Unique: Q7wGXgL2NcGzBVpQJWyGRA-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5711939wmj.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4nYdCu4pk04y4V7E/lWe9bJDwzN3jYmwwXeejjqIXt0=;
 b=Iw1U40VOdWjo/NizzM7Qh9rmeRfRD/08fzM0nl4nvlYVl/1mEAMTlkYlznS5JvJY07
 tSbi9Ve12KxwwiTujII0QmoU7GBeXAEXig/Yh8aaCiZSO0bKusim3p5YCBdd0szUKJFN
 TZ4fBMUtkaMOA+Ulxx6+AuD9F8RosUGcGD935xspvwl3bP9+CzGLLGKlEN6vpwESNjWV
 qOostN+R+Lvh/08nfE4+lQvQdrOknKc/QzzykS9ZY7Ef+Zu3Rir6eIqLkU/ugW8Cs67b
 0ucHVqy0GlY3Tat9Vs/ZiAoAKvt5tVHBcIN56ygRFvSsCVF3MMhxJOmt1euA1lQbkAKQ
 B85g==
X-Gm-Message-State: AO0yUKU1PWVjcXKTvku+pZnEhRCi4/iwljzfTXdjwNMfDEf6XZUspw3I
 dLPgkxMdfGcPrfqs/+kU3zKBWTEx60dbSxSDvI0zggzqGwOuLM5mHRxR++OtqcSADkeyP4/o2gs
 IBtVTcyInohX7CLAw6GVcZ3lqfp9UdbkeQviO6l6Vual/Nz/DNDvBnZAFWp44RJ45Vv8MmH2dup
 c=
X-Received: by 2002:a05:600c:90a:b0:3eb:2b88:5af1 with SMTP id
 m10-20020a05600c090a00b003eb2b885af1mr7584152wmp.18.1677760278595; 
 Thu, 02 Mar 2023 04:31:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9J3Gj1U0LBllZZcxuQeXmKDJdCjRS04qlkqKU4RyYVBdXyw1CiuZNSCRCLY9cidOxXohdkUg==
X-Received: by 2002:a05:600c:90a:b0:3eb:2b88:5af1 with SMTP id
 m10-20020a05600c090a00b003eb2b885af1mr7584130wmp.18.1677760278271; 
 Thu, 02 Mar 2023 04:31:18 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b003e2052bad94sm3092228wms.33.2023.03.02.04.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:31:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 15/62] i386/xen: add pc_machine_kvm_type to initialize
 XEN_EMULATE mode
Date: Thu,  2 Mar 2023 13:29:42 +0100
Message-Id: <20230302123029.153265-16-pbonzini@redhat.com>
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

From: David Woodhouse <dwmw@amazon.co.uk>

The xen_overlay device (and later similar devices for event channels and
grant tables) need to be instantiated. Do this from a kvm_type method on
the PC machine derivatives, since KVM is only way to support Xen emulation
for now.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/pc.c         | 11 +++++++++++
 include/hw/i386/pc.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 992951c107bd..a316a01b1594 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -90,6 +90,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/virtio-pmem-pci.h"
 #include "hw/virtio/virtio-mem-pci.h"
+#include "hw/i386/kvm/xen_overlay.h"
 #include "hw/mem/memory-device.h"
 #include "sysemu/replay.h"
 #include "target/i386/cpu.h"
@@ -1846,6 +1847,16 @@ static void pc_machine_initfn(Object *obj)
     cxl_machine_init(obj, &pcms->cxl_devices_state);
 }
 
+int pc_machine_kvm_type(MachineState *machine, const char *kvm_type)
+{
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode == XEN_EMULATE) {
+        xen_overlay_create();
+    }
+#endif
+    return 0;
+}
+
 static void pc_machine_reset(MachineState *machine, ShutdownCause reason)
 {
     CPUState *cs;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 66e3d059ef5a..467311007e06 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -291,12 +291,15 @@ extern const size_t pc_compat_1_5_len;
 extern GlobalProperty pc_compat_1_4[];
 extern const size_t pc_compat_1_4_len;
 
+int pc_machine_kvm_type(MachineState *machine, const char *vm_type);
+
 #define DEFINE_PC_MACHINE(suffix, namestr, initfn, optsfn) \
     static void pc_machine_##suffix##_class_init(ObjectClass *oc, void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
         optsfn(mc); \
         mc->init = initfn; \
+        mc->kvm_type = pc_machine_kvm_type; \
     } \
     static const TypeInfo pc_machine_type_##suffix = { \
         .name       = namestr TYPE_MACHINE_SUFFIX, \
-- 
2.39.1


