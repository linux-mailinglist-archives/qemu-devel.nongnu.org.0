Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 474FC6A82C2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 13:53:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXiB2-0007FG-RQ; Thu, 02 Mar 2023 07:36:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi8H-0003KR-Fc
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:34:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pXi7l-0003yW-1l
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 07:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677760408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyNcGYRsToJBaZAojwc5TFuaatxE+niPZBYctJyD+ek=;
 b=Lss9NQD7tziCEwCq9HB6QCEStOECznLeFP5e62T7CQstcUbfo9RWfl5MM1um8fZ1DGT8RP
 t7NvCcIIoz2Hu7dFtja1tRenmD16MEIqhTOY1nuMuDci5W1HMxH+hxjdKaS3nCsQ1GvbCq
 LFI74U3wUJD36Em2MdpzdHImjJNkszc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-bnRmH-BaPkqY7wGtlmpT6Q-1; Thu, 02 Mar 2023 07:33:27 -0500
X-MC-Unique: bnRmH-BaPkqY7wGtlmpT6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so1019120wmj.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 04:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LyNcGYRsToJBaZAojwc5TFuaatxE+niPZBYctJyD+ek=;
 b=XUdhqY+O1G9zWh6nMMHi+IMsbdgnsCFhtP/rCRzDQHCgfY5kEgmolSSIMJYcDbee2M
 yh+Xh9sMLCUJYHU8Dt73G9WJK3UtGvMoe1KIcMAeYgGsX9/8nC+WHBlPVcVz1qx/Zigd
 96VqaS7Rc+782mr5AesKI3bUblJ6RUG8RvaGtZmOtbr16MGTHnXFHCUNcFhxtDH/yINc
 l7/p+Wlrk223TyKdNFx1ZeQBhogncYEeO3AsWX3YZtFsiq2VHYJl6M1yAvzKc3PbF6XE
 7AQbraanCNYFkhPVW+CShBM5jw14xVMX0TIdIBbGHa8vnE0Moa5nNYkm2vFrqJUgJ6/j
 O67g==
X-Gm-Message-State: AO0yUKU9g8jA+63A2b6SHx1ffD9jBO6PsnkTT9jaK0IeN1BalBhrMQwo
 vMRbEvhh/nyj+LLfVsTIB1/o/iul9vM+1+BHKeHGk6dQtgmAX5aKCAcRZ5YnZyeyP0HP5LJJOHI
 RcJ7pbShTlA4IDJHBFwN9QkkPisdTMfUHQ3NuZHP43tka+aWcyHKNAO52OPkqSeKV2tk6Jw3gws
 o=
X-Received: by 2002:a05:600c:3ac7:b0:3ea:f6c4:5f3f with SMTP id
 d7-20020a05600c3ac700b003eaf6c45f3fmr7982148wms.13.1677760405221; 
 Thu, 02 Mar 2023 04:33:25 -0800 (PST)
X-Google-Smtp-Source: AK7set8avSyF/oe0OjB2nXAEr6RtBPCHrAN2kg8F/UowWKxC+zFHlvmPOdJ9HI8F+iretGe3IWUaUg==
X-Received: by 2002:a05:600c:3ac7:b0:3ea:f6c4:5f3f with SMTP id
 d7-20020a05600c3ac700b003eaf6c45f3fmr7982130wms.13.1677760404848; 
 Thu, 02 Mar 2023 04:33:24 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003e8dc7a03basm2949351wmb.41.2023.03.02.04.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 04:33:24 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@amazon.co.uk>,
 Paul Durrant <paul@xen.org>
Subject: [PULL 59/62] i386/xen: Document Xen HVM emulation
Date: Thu,  2 Mar 2023 13:30:26 +0100
Message-Id: <20230302123029.153265-60-pbonzini@redhat.com>
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

Signed-off-by: David Woodhouse <dwmw2@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 docs/system/i386/xen.rst    | 76 +++++++++++++++++++++++++++++++++++++
 docs/system/target-i386.rst |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 docs/system/i386/xen.rst

diff --git a/docs/system/i386/xen.rst b/docs/system/i386/xen.rst
new file mode 100644
index 000000000000..a00523b492e9
--- /dev/null
+++ b/docs/system/i386/xen.rst
@@ -0,0 +1,76 @@
+Xen HVM guest support
+=====================
+
+
+Description
+-----------
+
+KVM has support for hosting Xen guests, intercepting Xen hypercalls and event
+channel (Xen PV interrupt) delivery. This allows guests which expect to be
+run under Xen to be hosted in QEMU under Linux/KVM instead.
+
+Setup
+-----
+
+Xen mode is enabled by setting the ``xen-version`` property of the KVM
+accelerator, for example for Xen 4.10:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x4000a
+
+Additionally, virtual APIC support can be advertised to the guest through the
+``xen-vapic`` CPU flag:
+
+.. parsed-literal::
+
+  |qemu_system| --accel kvm,xen-version=0x4000a --cpu host,+xen_vapic
+
+When Xen support is enabled, QEMU changes hypervisor identification (CPUID
+0x40000000..0x4000000A) to Xen. The KVM identification and features are not
+advertised to a Xen guest. If Hyper-V is also enabled, the Xen identification
+moves to leaves 0x40000100..0x4000010A.
+
+The Xen platform device is enabled automatically for a Xen guest. This allows
+a guest to unplug all emulated devices, in order to use Xen PV block and network
+drivers instead. Note that until the Xen PV device back ends are enabled to work
+with Xen mode in QEMU, that is unlikely to cause significant joy. Linux guests
+can be dissuaded from this by adding 'xen_emul_unplug=never' on their command
+line, and it can also be noted that AHCI disk controllers are exempt from being
+unplugged, as are passthrough VFIO PCI devices.
+
+Properties
+----------
+
+The following properties exist on the KVM accelerator object:
+
+``xen-version``
+  This property contains the Xen version in ``XENVER_version`` form, with the
+  major version in the top 16 bits and the minor version in the low 16 bits.
+  Setting this property enables the Xen guest support.
+
+``xen-evtchn-max-pirq``
+  Xen PIRQs represent an emulated physical interrupt, either GSI or MSI, which
+  can be routed to an event channel instead of to the emulated I/O or local
+  APIC. By default, QEMU permits only 256 PIRQs because this allows maximum
+  compatibility with 32-bit MSI where the higher bits of the PIRQ# would need
+  to be in the upper 64 bits of the MSI message. For guests with large numbers
+  of PCI devices (and none which are limited to 32-bit addressing) it may be
+  desirable to increase this value.
+
+``xen-gnttab-max-frames``
+  Xen grant tables are the means by which a Xen guest grants access to its
+  memory for PV back ends (disk, network, etc.). Since QEMU only supports v1
+  grant tables which are 8 bytes in size, each page (each frame) of the grant
+  table can reference 512 pages of guest memory. The default number of frames
+  is 64, allowing for 32768 pages of guest memory to be accessed by PV backends
+  through simultaneous grants. For guests with large numbers of PV devices and
+  high throughput, it may be desirable to increase this value.
+
+OS requirements
+---------------
+
+The minimal Xen support in the KVM accelerator requires the host to be running
+Linux v5.12 or newer. Later versions add optimisations: Linux v5.17 added
+acceleration of interrupt delivery via the Xen PIRQ mechanism, and Linux v5.19
+accelerated Xen PV timers and inter-processor interrupts (IPIs).
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index e64c0130772d..77c2f3b97999 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -27,6 +27,7 @@ Architectural features
 
    i386/cpu
    i386/hyperv
+   i386/xen
    i386/kvm-pv
    i386/sgx
    i386/amd-memory-encryption
-- 
2.39.1


