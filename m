Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBCD36DE91
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:44:47 +0200 (CEST)
Received: from localhost ([::1]:54546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboEw-0002Hc-IE
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnzz-0004qN-53
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbnzv-00087E-9R
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619630954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ft7AsfLT38lKQnO0Vzs1l8qjmjgwtYnPzE/amFKSrLQ=;
 b=Ph6CgyXraTlw/GDwHNa5SzID6lq9rzNWDpL1iQ3f2lErG1qKuWisgAEBLNDGcPLO8Ucj4y
 w7ERAGM5+GeGlb58AhgHyfsJJAF2a6nStbdb9S+pYfQEGoyt2dLYgunDrwSP19XzOomOI2
 lzjxvX1/nVKZ2SJoyhVGOJrmd2EO7DQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-0tqeNMe3P2SFGIrk2I6tjA-1; Wed, 28 Apr 2021 13:29:11 -0400
X-MC-Unique: 0tqeNMe3P2SFGIrk2I6tjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso244367wmj.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ft7AsfLT38lKQnO0Vzs1l8qjmjgwtYnPzE/amFKSrLQ=;
 b=r8+IcayCgbvX0lVRqGvx6niXL8+tPhz9MNGJnFRBvewApfMp+jp70lFRy1CJganhyY
 P790aFuFBJ+zGJ8Iu5ahUH3OvnfCqWoFyOYs9MNMuy9IwScxS59iOJQk+MIV880CcKSQ
 F1/k2jXNgxfe56Px/OVBkwfRdyZ/zHBJ+VBT1WUsZslLbfh5O2OLwFGUgHKf1Urh28b0
 HcD5zVO3Tj6+alNVyt995qzQU/Qu5Xgl4uMv1IB/Xwg74z11vV48FtDVR+rvkxo0Gou/
 cv/ValQgWyzFAkJAHu0enNSttkSxgDHAjbjX7N0j0AX5JMvp2urDmiT257V7QdY2e/Ib
 WT5A==
X-Gm-Message-State: AOAM533ye8cm2BDev3r320QhuXbUJ7UrWstkzVpZgpo+nl61nDYsU1l7
 9xrbRhhjRf3e6+RAIfxwuBjAbSZDKU9UenJ2UKj87ShYAzgS+q2eSuFIIk9yPdrHDC7Bc+4p132
 Oqj7SJu1yh8XirD4=
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr978515wmq.177.1619630950651; 
 Wed, 28 Apr 2021 10:29:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOfka5HVv7TZUOtcJ8Jz+7yNoK9tdJuphFL+Cw/D7OTBEe1WO4BhXCIEvxB0La069jEaIzCg==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr978497wmq.177.1619630950420; 
 Wed, 28 Apr 2021 10:29:10 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j22sm520721wra.46.2021.04.28.10.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 10:29:10 -0700 (PDT)
Subject: Re: [PATCH 7/7] hw/nvram: Do not build FW_CFG if not required
To: qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
 <20210426193520.4115528-8-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9174c9b8-bd6e-fde3-fb70-f563d7f99d58@redhat.com>
Date: Wed, 28 Apr 2021 19:29:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426193520.4115528-8-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/21 9:35 PM, Philippe Mathieu-Daudé wrote:
> If the Kconfig 'FW_CFG' symbol is not selected, it is pointless
> to build the fw_cfg device. Update the stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  stubs/fw_cfg.c       | 49 ++++++++++++++++++++++++++++++++++++++++++--
>  hw/nvram/meson.build |  2 +-
>  2 files changed, 48 insertions(+), 3 deletions(-)

Answering here to Laszlo's comment from:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg05858.html

On 4/28/21 6:44 PM, Laszlo Ersek wrote:
> I don't understand why we need to add *more code* (stubs / boilerplate)
> if our goal is (apparently) to build QEMU with *fewer* devices.

The list of callers:

hw/acpi/bios-linker-loader.c:177:    return fw_cfg &&
fw_cfg_dma_enabled(fw_cfg);
hw/acpi/core.c:640:        fw_cfg_add_file(fw_cfg, "etc/system-states",
g_memdup(suspend, 6), 6);
hw/acpi/ghes.c:383:    fw_cfg_add_file(s, ACPI_GHES_ERRORS_FW_CFG_FILE,
hardware_error->data,
hw/acpi/ghes.c:387:    fw_cfg_add_file_callback(s,
ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
hw/acpi/nvdimm.c:912:    fw_cfg_add_file(fw_cfg, NVDIMM_DSM_MEM_FILE,
state->dsm_mem->data,
hw/acpi/vmgenid.c:128:    fw_cfg_add_file(s, VMGENID_GUID_FW_CFG_FILE,
guid->data,
hw/acpi/vmgenid.c:131:    fw_cfg_add_file_callback(s,
VMGENID_ADDR_FW_CFG_FILE, NULL, NULL, NULL,
hw/arm/virt-acpi-build.c:870:    fw_cfg_add_file(vms->fw_cfg,
ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
hw/arm/virt.c:1531:        fw_cfg_add_file(vms->fw_cfg,
"etc/smbios/smbios-tables",
hw/arm/virt.c:1533:        fw_cfg_add_file(vms->fw_cfg,
"etc/smbios/smbios-anchor",
hw/core/loader.c:1017:        fw_cfg_add_file(fw_cfg, fw_file_name,
data, rom->romsize);
hw/core/loader.c:1074:        fw_cfg_add_file_callback(fw_cfg, fw_file_name,
hw/core/loader.c:1254:    fw_cfg_set_order_override(fw_cfg, order);
hw/core/loader.c:1261:    fw_cfg_reset_order_override(fw_cfg);
hw/core/loader.c:919:        fw_cfg_modify_file(fw_cfg, id +
strlen("/rom@"), host, length);
hw/display/ramfb.c:131:    fw_cfg_add_file_callback(fw_cfg, "etc/ramfb",
hw/hppa/machine.c:104:    fw_cfg_add_file(fw_cfg,
"/etc/firmware-min-version",
hw/hppa/machine.c:108:    fw_cfg_add_file(fw_cfg, "/etc/cpu/tlb_entries",
hw/hppa/machine.c:112:    fw_cfg_add_file(fw_cfg, "/etc/cpu/btlb_entries",
hw/hppa/machine.c:116:    fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
hw/i386/acpi-build.c:2638:    fw_cfg_add_file(x86ms->fw_cfg,
ACPI_BUILD_TPMLOG_FILE,
hw/i386/acpi-build.c:2648:        fw_cfg_add_file(x86ms->fw_cfg,
"etc/tpm/config",
hw/i386/acpi-build.c:2667:
fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
hw/i386/fw_cfg.c:130:    fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
hw/i386/fw_cfg.c:181:    fw_cfg_add_file(fw_cfg,
"etc/msr_feature_control", val, sizeof(*val));
hw/i386/fw_cfg.c:85:        fw_cfg_add_file(fw_cfg,
"etc/smbios/smbios-tables",
hw/i386/fw_cfg.c:87:        fw_cfg_add_file(fw_cfg,
"etc/smbios/smbios-anchor",
hw/i386/microvm.c:329:    fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
hw/i386/pc.c:977:        fw_cfg_add_file(fw_cfg,
"etc/reserved-memory-end", val, sizeof(*val));
hw/i386/x86.c:1078:    if (linuxboot_dma_enabled &&
fw_cfg_dma_enabled(fw_cfg)) {
hw/isa/lpc_ich9.c:421:        fw_cfg_add_file(fw_cfg,
"etc/smi/supported-features",
hw/isa/lpc_ich9.c:428:        fw_cfg_add_file_callback(fw_cfg,
"etc/smi/requested-features",
hw/isa/lpc_ich9.c:433:        fw_cfg_add_file_callback(fw_cfg,
"etc/smi/features-ok",
hw/misc/pvpanic-isa.c:60:    fw_cfg_add_file(fw_cfg, "etc/pvpanic-port",
pvpanic_port,
hw/misc/vmcoreinfo.c:60:    fw_cfg_add_file_callback(fw_cfg,
FW_CFG_VMCOREINFO_FILENAME,
hw/ppc/mac_newworld.c:526:            fw_cfg_add_file(fw_cfg,
"ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
hw/ppc/mac_oldworld.c:371:            fw_cfg_add_file(fw_cfg,
"ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
hw/vfio/igd.c:565:    fw_cfg_add_file(fw_cfg_find(), "etc/igd-bdsm-size",
hw/vfio/pci-quirks.c:1201:    fw_cfg_add_file(fw_cfg_find(),
"etc/igd-opregion",
softmmu/vl.c:1183:        if (!fw_cfg_add_from_generator(fw_cfg, name,
gen_id, errp)) {
softmmu/vl.c:1196:    fw_cfg_set_order_override(fw_cfg,
FW_CFG_ORDER_OVERRIDE_USER);
softmmu/vl.c:1197:    fw_cfg_add_file(fw_cfg, name, buf, size);
softmmu/vl.c:1198:    fw_cfg_reset_order_override(fw_cfg);

From this list,

I'd like to simplify hw/acpi/bios-linker-loader.c, but later.

The remaining core components are hw/core/loader.c and softmmu/vl.c:

hw/core/loader.c:1017:        fw_cfg_add_file(fw_cfg, fw_file_name,
data, rom->romsize);
hw/core/loader.c:1074:        fw_cfg_add_file_callback(fw_cfg, fw_file_name,
hw/core/loader.c:1254:    fw_cfg_set_order_override(fw_cfg, order);
hw/core/loader.c:1261:    fw_cfg_reset_order_override(fw_cfg);
hw/core/loader.c:919:        fw_cfg_modify_file(fw_cfg, id +
strlen("/rom@"), host, length);

softmmu/vl.c:1183:        if (!fw_cfg_add_from_generator(fw_cfg, name,
gen_id, errp)) {
softmmu/vl.c:1196:    fw_cfg_set_order_override(fw_cfg,
FW_CFG_ORDER_OVERRIDE_USER);
softmmu/vl.c:1197:    fw_cfg_add_file(fw_cfg, name, buf, size);
softmmu/vl.c:1198:    fw_cfg_reset_order_override(fw_cfg);

Bah, I thought vl.c was generic code, but it is target-specific,
so we could add '#include CONFIG_DEVICES' and add more #ifdef'ry
on CONFIG_FW_CFG.

Less stubs VS more #ifdef'ry...

It is not clear to me how to modularize this from the core code.

TBC...

Thanks,

Phil.


