Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC454310D0D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:16:29 +0100 (CET)
Received: from localhost ([::1]:41630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82qS-00012E-KT
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eP-00041o-E7
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l82eN-0002zt-98
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:04:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612537438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NQXW1/SZyEseosS3Pdw5NegFFGQKTt5n2ODFCN2dPLY=;
 b=f2rRz97gNDTaN2AjjHsc42xg58OYMWbqb7Y8XqtfDILpKlBQhjUtcuu9XsuI5vR2rVw2wo
 3mjhkk+8mAayrFENIznTomXZYcIutnNXquqQ/iu5r+dyNF4+4x8UWMDbNsBeKCW5PV1R0f
 saUWoXQQlqoDucOEBG48wBZlXjZTj9E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-0KGGVqNDP8yCi89ZoB_QIw-1; Fri, 05 Feb 2021 10:03:56 -0500
X-MC-Unique: 0KGGVqNDP8yCi89ZoB_QIw-1
Received: by mail-ed1-f71.google.com with SMTP id ck25so7031458edb.16
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NQXW1/SZyEseosS3Pdw5NegFFGQKTt5n2ODFCN2dPLY=;
 b=pVlMwvZhT6mTKDqq00w8OejBcMOYkHnzLqwC2auwvsZnGR6bll6XJ1lZmxXbpJGMtj
 DeQCQtOWDveyZaTK2HzYuhig4lRXupBdClJBhaPQwEt7A/sdnXz9WSE/YvQSQEd5vePu
 CHQXMHes1VwhtpWAbAdcUUlpdYg3/CMt1X2HoLPGskoHSHFNESSjOCTCB4nGY3cFq4d4
 OtbWOZY8dDGgwBS/jBuFCVtkr5X8Z6/v3qSyaRLC24fq+bN3MQiJLk4wH/ahNKMY9/L4
 OXL1LAqOQ2NFUprGKNTYo81SpiUfdM0zyEkJao9G5euKtlUE8QNk6qYsLU3h2s60Fe7j
 1NwQ==
X-Gm-Message-State: AOAM530gWqVAfM8riQSP+oPyEZfELzC+Tjo4y9xKl4D+Wo+k5IKuh3Kf
 5SiEYmQdf7WQJMiMmJW9jiV4xk9XtB2+1m+DV5oancpCiSyD/D5BWncycVFFDCxYxgml2AH73b8
 O2LukbHuw8ZIVqlg/DTyv+mczpdbYBwlxXWL1MrQ2oldx1B403V6R/MQtR+8W
X-Received: by 2002:a17:906:4c4b:: with SMTP id
 d11mr4426770ejw.387.1612537434917; 
 Fri, 05 Feb 2021 07:03:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ6wGeqSOagw/8jmeSUqXi7g60Csz3C+pzWJ5D17OzyTpAM9E3fBhB026TdXEUPdMqpna/RA==
X-Received: by 2002:a17:906:4c4b:: with SMTP id
 d11mr4426733ejw.387.1612537434710; 
 Fri, 05 Feb 2021 07:03:54 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id ah20sm4000000ejc.99.2021.02.05.07.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 07:03:54 -0800 (PST)
Date: Fri, 5 Feb 2021 10:03:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/16] hw/i386: Remove the deprecated pc-1.x machine types
Message-ID: <20210205150135.94643-9-mst@redhat.com>
References: <20210205150135.94643-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210205150135.94643-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

They have been deprecated since QEMU v5.0, time to remove them now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210203171832.483176-2-thuth@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/i386/pc_piix.c                | 94 --------------------------------
 docs/system/deprecated.rst       |  6 --
 docs/system/removed-features.rst |  6 ++
 3 files changed, 6 insertions(+), 100 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 6188c3e97e..2904b40163 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -359,18 +359,6 @@ static void pc_compat_1_4_fn(MachineState *machine)
     pc_compat_1_5_fn(machine);
 }
 
-static void pc_compat_1_3(MachineState *machine)
-{
-    pc_compat_1_4_fn(machine);
-}
-
-/* PC compat function for pc-1.0 to pc-1.2 */
-static void pc_compat_1_2(MachineState *machine)
-{
-    pc_compat_1_3(machine);
-    x86_cpu_change_kvm_default("kvm-pv-eoi", NULL);
-}
-
 static void pc_init_isa(MachineState *machine)
 {
     pc_init1(machine, TYPE_I440FX_PCI_HOST_BRIDGE, TYPE_I440FX_PCI_DEVICE);
@@ -772,88 +760,6 @@ static void pc_i440fx_1_4_machine_options(MachineClass *m)
 DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1.4", pc_compat_1_4_fn,
                       pc_i440fx_1_4_machine_options);
 
-static void pc_i440fx_1_3_machine_options(MachineClass *m)
-{
-    X86MachineClass *x86mc = X86_MACHINE_CLASS(m);
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.3.0")
-        { "usb-tablet", "usb_version", "1" },
-        { "virtio-net-pci", "ctrl_mac_addr", "off" },
-        { "virtio-net-pci", "mq", "off" },
-        { "e1000", "autonegotiation", "off" },
-    };
-
-    pc_i440fx_1_4_machine_options(m);
-    m->hw_version = "1.3.0";
-    m->deprecation_reason = "use a newer machine type instead";
-    x86mc->compat_apic_id_mode = true;
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_3, "pc-1.3", pc_compat_1_3,
-                      pc_i440fx_1_3_machine_options);
-
-
-static void pc_i440fx_1_2_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.2.0")
-        { "nec-usb-xhci", "msi", "off" },
-        { "nec-usb-xhci", "msix", "off" },
-        { "qxl", "revision", "3" },
-        { "qxl-vga", "revision", "3" },
-        { "VGA", "mmio", "off" },
-    };
-
-    pc_i440fx_1_3_machine_options(m);
-    m->hw_version = "1.2.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_2, "pc-1.2", pc_compat_1_2,
-                      pc_i440fx_1_2_machine_options);
-
-
-static void pc_i440fx_1_1_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.1.0")
-        { "virtio-scsi-pci", "hotplug", "off" },
-        { "virtio-scsi-pci", "param_change", "off" },
-        { "VGA", "vgamem_mb", "8" },
-        { "vmware-svga", "vgamem_mb", "8" },
-        { "qxl-vga", "vgamem_mb", "8" },
-        { "qxl", "vgamem_mb", "8" },
-        { "virtio-blk-pci", "config-wce", "off" },
-    };
-
-    pc_i440fx_1_2_machine_options(m);
-    m->hw_version = "1.1.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_1, "pc-1.1", pc_compat_1_2,
-                      pc_i440fx_1_1_machine_options);
-
-static void pc_i440fx_1_0_machine_options(MachineClass *m)
-{
-    static GlobalProperty compat[] = {
-        PC_CPU_MODEL_IDS("1.0")
-        { TYPE_ISA_FDC, "check_media_rate", "off" },
-        { "virtio-balloon-pci", "class", stringify(PCI_CLASS_MEMORY_RAM) },
-        { "apic-common", "vapic", "off" },
-        { TYPE_USB_DEVICE, "full-path", "no" },
-    };
-
-    pc_i440fx_1_1_machine_options(m);
-    m->hw_version = "1.0";
-    compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
-}
-
-DEFINE_I440FX_MACHINE(v1_0, "pc-1.0", pc_compat_1_2,
-                      pc_i440fx_1_0_machine_options);
-
-
 typedef struct {
     uint16_t gpu_device_id;
     uint16_t pch_device_id;
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 6ac757ed9f..2fcac7861e 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -322,12 +322,6 @@ The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
 System emulator machines
 ------------------------
 
-``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-These machine types are very old and likely can not be used for live migration
-from old QEMU versions anymore. A newer machine type should be used instead.
-
 Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 88b81a6156..c8481cafbd 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -136,6 +136,12 @@ mips ``fulong2e`` machine alias (removed in 6.0)
 
 This machine has been renamed ``fuloong2e``.
 
+``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+These machine types were very old and likely could not be used for live
+migration from old QEMU versions anymore. Use a newer machine type instead.
+
 Related binaries
 ----------------
 
-- 
MST


