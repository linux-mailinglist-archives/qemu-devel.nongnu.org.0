Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2356A8258
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:36:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXi5R-0007dy-HQ; Thu, 02 Mar 2023 07:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5M-0007V1-0P
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi5K-0002uE-5g
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6q6/SizaupC6KoqaMA/P4WJcsqqBFWg0PjVeMPJ8oGw=;
 b=HiGBQmbQh1Y3ZNkMhtOluOxEbfC39YIgJROOzcMWzpDhNWB8WIgIw/QoZGW/apDvcjcjZj
 dbx/HfmPLrd674r1QjaA/H7VWRlozm55pNCvBBnpJuAwA6GBRoT7An5/foNyfdE1AcjJ7r
 RsF80tRuVsJKaUTsGPDVmfSx1TJGpHk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-IsRdWVAYMFeDfIwHTAkQ9Q-1; Thu, 02 Mar 2023 07:30:54 -0500
X-MC-Unique: IsRdWVAYMFeDfIwHTAkQ9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so5686800wmb.8
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6q6/SizaupC6KoqaMA/P4WJcsqqBFWg0PjVeMPJ8oGw=;
 b=FzjSPxorKCkT99MJafDkBcBuMie1GSDAsmZvp1jRpz0uCutj3MqEmMIq/1MFag93GA
 BKxiAX25HRTdfFOpQl4SkWKJOCoRJ2w8rfZrXXxQjyOrNsaEOc3wRZALhGZrLo5y5CRY
 7Kq/DbixNfqdufmqN+jhayiQrRZ7kIkin0NF0FlHa/D4VfCgYlamQqpDDjOvtwdPxDo7
 z0f1xZWrWydU7wOMs/wpnD/TFGqcvt1ocn5bH6TCTQmtHpuWhMfL03+rk/dMOcGoajKB
 SnPJWeVbSIT87CoFfaDQ6h7Q/NPjByPQj5eOMX7HiE+vWkfMOEalWTkddw+OnVw2VG7B
 sDVQ==
X-Gm-Message-State: AO0yUKUf/PGPmmIzqnUJzb1hMUg0eG+YPdxVDNZf1KlYOuhH9KKuOBH2
 5TS7D1IXUFJSLxfQSyOCQxKAB2rPlekHNr1UocvZ8eJJ/apkti4RzlE3HDF0AfBp/RztEL7oHg6
 4iKjYjWuhlJKx1eLbngoCAuE6eITovPlLU6I6WMB62iM40WUkHI7sFTr4NLcgCzG/Itip4iw2lE
 g=
X-Received: by 2002:a5d:6345:0:b0:2ca:67bb:11ba with SMTP id
 b5-20020a5d6345000000b002ca67bb11bamr6457262wrw.34.1677760252262; 
 Thu, 02 Mar 2023 04:30:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/kLljRIhT5l+oiR0WOZ3kHVLitzuft6c5BkfsaMzkEqDekUIKqFcenVB1wSefuR9ZtSysy1w==
X-Received: by 2002:a5d:6345:0:b0:2ca:67bb:11ba with SMTP id
 b5-20020a5d6345000000b002ca67bb11bamr6457255wrw.34.1677760252013; 
 Thu, 02 Mar 2023 04:30:52 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adffb04000000b002c70bfe505esm15237034wrr.82.2023.03.02.04.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:30:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Paul Durrant <paul@xen.org>
Subject: [PULL 06/62] i386/kvm: Set Xen vCPU ID in KVM
Date: Thu,  2 Mar 2023 13:29:33 +0100
Message-Id: <20230302123029.153265-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302123029.153265-1-pbonzini@redhat.com>
References: <20230302123029.153265-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

There are (at least) three different vCPU ID number spaces. One is the
internal KVM vCPU index, based purely on which vCPU was chronologically
created in the kernel first. If userspace threads are all spawned and
create their KVM vCPUs in essentially random order, then the KVM indices
are basically random too.

The second number space is the APIC ID space, which is consistent and
useful for referencing vCPUs. MSIs will specify the target vCPU using
the APIC ID, for example, and the KVM Xen APIs also take an APIC ID
from userspace whenever a vCPU needs to be specified (as opposed to
just using the appropriate vCPU fd).

The third number space is not normally relevant to the kernel, and is
the ACPI/MADT/Xen CPU number which corresponds to cs->cpu_index. But
Xen timer hypercalls use it, and Xen timer hypercalls *really* want
to be accelerated in the kernel rather than handled in userspace, so
the kernel needs to be told.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 target/i386/kvm/kvm.c     |  5 +++++
 target/i386/kvm/xen-emu.c | 28 ++++++++++++++++++++++++++++
 target/i386/kvm/xen-emu.h |  1 +
 3 files changed, 34 insertions(+)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index aac43174e886..edcf8a2a65d5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1884,6 +1884,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
             }
         }
 
+        r = kvm_xen_init_vcpu(cs);
+        if (r) {
+            return r;
+        }
+
         kvm_base += 0x100;
 #else /* CONFIG_XEN_EMU */
         /* This should never happen as kvm_arch_init() would have died first. */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 34d5bc1bc964..4883b95d9d47 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -52,6 +52,34 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr)
     return 0;
 }
 
+int kvm_xen_init_vcpu(CPUState *cs)
+{
+    int err;
+
+    /*
+     * The kernel needs to know the Xen/ACPI vCPU ID because that's
+     * what the guest uses in hypercalls such as timers. It doesn't
+     * match the APIC ID which is generally used for talking to the
+     * kernel about vCPUs. And if vCPU threads race with creating
+     * their KVM vCPUs out of order, it doesn't necessarily match
+     * with the kernel's internal vCPU indices either.
+     */
+    if (kvm_xen_has_cap(EVTCHN_SEND)) {
+        struct kvm_xen_vcpu_attr va = {
+            .type = KVM_XEN_VCPU_ATTR_TYPE_VCPU_ID,
+            .u.vcpu_id = cs->cpu_index,
+        };
+        err = kvm_vcpu_ioctl(cs, KVM_XEN_VCPU_SET_ATTR, &va);
+        if (err) {
+            error_report("kvm: Failed to set Xen vCPU ID attribute: %s",
+                         strerror(-err));
+            return err;
+        }
+    }
+
+    return 0;
+}
+
 uint32_t kvm_xen_get_caps(void)
 {
     return kvm_state->xen_caps;
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 2101df01824b..d62f1d8ed8fe 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -24,5 +24,6 @@
 #define XEN_VERSION(maj, min) ((maj) << 16 | (min))
 
 int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
+int kvm_xen_init_vcpu(CPUState *cs);
 
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
-- 
2.39.1


