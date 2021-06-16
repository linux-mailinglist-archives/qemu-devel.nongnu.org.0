Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E241D3AA5E2
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 23:04:33 +0200 (CEST)
Received: from localhost ([::1]:34332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltci8-0002S2-VS
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 17:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPu-0003zp-K1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcPs-0001Yd-2f
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0afWzhBhI6klZY1Mb1UVWAL8VD89TP6dUzvV5tmy8sQ=;
 b=RfgX7MebQLau+1CmkDwzA6NDJ8b2QrK55VVGjotiBCealbUVSpzyzgGcxoS49jKKM19LzF
 TYrjqwHrzrwo1x/o+T5nILqc+mti6Z06UrRFqERb6hE0C2hnJzBG6doKjCiFDeNz0xs3Pz
 WA1B6kZnbedO+pIQX4Rw1tvNHRhqYhk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-IWkQOw7xPmOtl6zInDqWPA-1; Wed, 16 Jun 2021 16:45:38 -0400
X-MC-Unique: IWkQOw7xPmOtl6zInDqWPA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso1868082wrf.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0afWzhBhI6klZY1Mb1UVWAL8VD89TP6dUzvV5tmy8sQ=;
 b=nzH0HE51li+hqw0LNn9pEiiim4uhgixJX1JAQxlaiHgkxIRjYMfhMFqnjKlNNxjPL7
 6iI373DLvimytojxSPQinpHhzlTcZIolMD89AhlXDLsV0X6vc+JZafbf02qq6zJJgEFR
 I+WuPI97LlEiYWEG+J4LkYsSuVE6ZPo7QxJc14wyB/d/ToAyhQKYoZPZmX5e/phdh75L
 RoQKS33IigLK3R0PseCCycFtPaiMntDK+R7XT+6D+AgjcIpIQi3wd8t4idPIJTPLrTK7
 SRn2KuAigPGCWxELskqqilZXhB053b8BeB6iRxhk0ryCFmov6oxKl+fnuYlpqGFZlFNN
 CInw==
X-Gm-Message-State: AOAM530PCJGYSGwCy4u27GKEEl8etWgR3D7Vr8PH4VcPbnzw39QUAUqM
 t43n5T7gEKd56vIFVUIMXtd2iKFQWpXDsKokMY8V7wZ26odZ/wgIYYI/fFNj6Jo/JCeNkUAPBaU
 9q869ofhbLrCPT1s5KDenz4wDPeJ5oWbKx+DmHHnqFLCng2K6ivj6e5Vok+muPz1A
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr1155106wrt.295.1623876336834; 
 Wed, 16 Jun 2021 13:45:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUC/tZ8s6XNrVekxXp5jptFYsfWEF20aEVsOupWx3tUUgx67GngNVDdl2X1IRcoU7sqbFGCw==
X-Received: by 2002:a5d:4cd1:: with SMTP id c17mr1155077wrt.295.1623876336679; 
 Wed, 16 Jun 2021 13:45:36 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z17sm3218172wrt.60.2021.06.16.13.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:45:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/23] hw/acpi/Kconfig: Add missing Kconfig dependencies
 (build error)
Date: Wed, 16 Jun 2021 22:43:27 +0200
Message-Id: <20210616204328.2611406-23-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616204328.2611406-1-philmd@redhat.com>
References: <20210616204328.2611406-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'microvm' machine misses various dependencies:

  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
  hw/i386/acpi-microvm.c:247: undefined reference to `acpi_build_tables_init'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
  hw/i386/acpi-microvm.c:192: undefined reference to `bios_linker_loader_alloc'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
  hw/i386/acpi-microvm.c:121: undefined reference to `init_aml_allocator'
  /usr/bin/ld: hw/i386/acpi-microvm.c:124: undefined reference to `acpi_data_push'
  /usr/bin/ld: hw/i386/acpi-microvm.c:126: undefined reference to `aml_scope'
  /usr/bin/ld: hw/i386/acpi-microvm.c:129: undefined reference to `build_ged_aml'
  /usr/bin/ld: hw/i386/acpi-microvm.c:131: undefined reference to `acpi_dsdt_add_power_button'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_virtio':
  hw/i386/acpi-microvm.c:77: undefined reference to `aml_string'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `build_dsdt_microvm':
  hw/i386/acpi-microvm.c:138: undefined reference to `aml_scope'
  /usr/bin/ld: hw/i386/acpi-microvm.c:149: undefined reference to `build_header'
  /usr/bin/ld: hw/i386/acpi-microvm.c:152: undefined reference to `free_aml_allocator'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_build_microvm':
  hw/i386/acpi-microvm.c:202: undefined reference to `acpi_add_table'
  /usr/bin/ld: hw/i386/acpi-microvm.c:203: undefined reference to `build_fadt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:206: undefined reference to `acpi_add_table'
  /usr/bin/ld: hw/i386/acpi-microvm.c:207: undefined reference to `acpi_build_madt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:212: undefined reference to `build_xsdt'
  /usr/bin/ld: hw/i386/acpi-microvm.c:224: undefined reference to `build_rsdp'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_setup_microvm':
  hw/i386/acpi-microvm.c:251: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:253: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:255: undefined reference to `acpi_add_rom_blob'
  /usr/bin/ld: hw/i386/acpi-microvm.c:258: undefined reference to `acpi_build_tables_cleanup'
  /usr/bin/ld: libqemu-i386-softmmu.fa.p/hw_i386_acpi-microvm.c.o: in function `acpi_dsdt_add_pci':
  hw/i386/acpi-microvm.c:105: undefined reference to `acpi_dsdt_add_gpex'
  collect2: error: ld returned 1 exit status
  ninja: build stopped: subcommand failed.

Update the ACPI_HW_REDUCED symbol to select ACPI_MEMORY_HOTPLUG /
ACPI_NVDIMM / ACPI.

Fixes: 8045df14bcc ("microvm/acpi: add minimal acpi support")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 1932f66af8d..cfc4ede8d91 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -42,3 +42,7 @@ config ACPI_VMGENID
     depends on PC
 
 config ACPI_HW_REDUCED
+    bool
+    select ACPI
+    select ACPI_MEMORY_HOTPLUG
+    select ACPI_NVDIMM
-- 
2.31.1


