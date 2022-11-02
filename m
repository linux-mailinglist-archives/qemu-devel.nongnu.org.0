Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C981C6167A4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGHs-0002Wa-8P; Wed, 02 Nov 2022 12:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHq-0002WQ-U4
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGHp-000204-9Z
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=Zqkv9m+/Rezk39o8SMTCvOEnPUqUmgeapHU8w9lxW91CS7MIZlATI0Jt4jDruJj989gWnM
 JYPwUF5aoN6IttEf9WKviGQJUhVgFkVWggSzbYtZaw7ygPMSTb1BgyINc1H6gMSmJpWTLl
 XtibTlyBmtDQEMwOFGcaZnXUiBUPNzQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-MZBvu0pnP0CbCuJoy0FUWw-1; Wed, 02 Nov 2022 12:08:15 -0400
X-MC-Unique: MZBvu0pnP0CbCuJoy0FUWw-1
Received: by mail-wr1-f70.google.com with SMTP id
 w23-20020adf8bd7000000b002358f733307so5025984wra.17
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:08:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=LNnLfdRGj6u8705X8ZwElWkFRaCsbepp4lT6WX0Xkq5Qj8A9Rg0uOjIDTJDJDcloyT
 yOFk0syEPs2/cRWRWOu08HqXTMuZF4j8lWUmzav6ILANZv0WG85dioxQTPaIvBQ5GhQj
 ZajGWCV9unXJgZEJRLRhwwa0xNivbrRkaLdfCuD/00YPpDRtpeMo+dtdFubuWXpOTfNR
 71zIvvmWkl9kTdq49hZsUyov1d7lJ3QjoqdgVmYwd0z7sYvELJNnYDTq4z0vXNrvbX4u
 lKspSPAcaIFRDGXuoKbsDAflYfHNPz/VkcWqV7S3e3JKaMZW0pTTjJl1Cmiir7UbKMjy
 ZviA==
X-Gm-Message-State: ACrzQf0gYVG4bQQ3GfqLYdSvylKnQ1aLMuPzsuweFNMhoJmkuNcFgySB
 L3tpq4020WXnrTjPcr1gNAYwO0hf91/ayg5UfKGsU2mNAuJiA4TgUvqe2WbBCAV1WAvOtROxIQj
 7kl9okW6mk9PArEAAgf9V2dM5/I11uDuzf+CUMYnLLaS1qBwI0p5DZ6vA6yx8
X-Received: by 2002:a5d:6da1:0:b0:231:c189:e077 with SMTP id
 u1-20020a5d6da1000000b00231c189e077mr15881030wrs.114.1667405294013; 
 Wed, 02 Nov 2022 09:08:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5UDjxmZs6b/751LYNVchfQPjdYi39ebvyoXerg8QOcUD8qGWeTfDBGgb1Es+h1uiyOmq9NTw==
X-Received: by 2002:a5d:6da1:0:b0:231:c189:e077 with SMTP id
 u1-20020a5d6da1000000b00231c189e077mr15880996wrs.114.1667405293663; 
 Wed, 02 Nov 2022 09:08:13 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c35d600b003c6f1732f65sm2700076wmq.38.2022.11.02.09.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:08:12 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:08:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sergio Lopez <slp@redhat.com>
Subject: [PULL v2 01/82] hw/i386/e820: remove legacy reserved entries for e820
Message-ID: <20221102160336.616599-2-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

e820 reserved entries were used before the dynamic entries with fw config files
were intoduced. Please see the following change:
7d67110f2d9a6("pc: add etc/e820 fw_cfg file")

Identical support was introduced into seabios as well with the following commit:
ce39bd4031820 ("Add support for etc/e820 fw_cfg file")

Both the above commits are now quite old. QEMU machines 1.7 and newer no longer
use the reserved entries. Seabios uses fw config files and
dynamic e820 entries by default and only falls back to using reserved entries
when it has to work with old qemu (versions earlier than 1.7). Please see
functions qemu_cfg_e820() and qemu_early_e820(). It is safe to remove legacy
FW_CFG_E820_TABLE and associated code now as QEMU 7.0 has deprecated i440fx
machines 1.7 and older. It would be incredibly rare to run the latest qemu
version with a very old version of seabios that did not support fw config files
for e820.

As far as I could see, edk2/ovfm never supported reserved entries and uses fw
config files from the beginning. So there should be no incompatibilities with
ovfm as well.

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220831045311.33083-1-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/e820_memory_layout.h |  8 --------
 hw/i386/fw_cfg.h             |  1 -
 hw/i386/e820_memory_layout.c | 20 +-------------------
 hw/i386/fw_cfg.c             |  3 ---
 hw/i386/microvm.c            |  2 --
 5 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 04f93780f9..7c239aa033 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -16,20 +16,12 @@
 #define E820_NVS        4
 #define E820_UNUSABLE   5
 
-#define E820_NR_ENTRIES 16
-
 struct e820_entry {
     uint64_t address;
     uint64_t length;
     uint32_t type;
 } QEMU_PACKED __attribute((__aligned__(4)));
 
-struct e820_table {
-    uint32_t count;
-    struct e820_entry entry[E820_NR_ENTRIES];
-} QEMU_PACKED __attribute((__aligned__(4)));
-
-extern struct e820_table e820_reserve;
 extern struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type);
diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 275f15c1c5..86ca7c1c0c 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -17,7 +17,6 @@
 #define FW_CFG_ACPI_TABLES      (FW_CFG_ARCH_LOCAL + 0)
 #define FW_CFG_SMBIOS_ENTRIES   (FW_CFG_ARCH_LOCAL + 1)
 #define FW_CFG_IRQ0_OVERRIDE    (FW_CFG_ARCH_LOCAL + 2)
-#define FW_CFG_E820_TABLE       (FW_CFG_ARCH_LOCAL + 3)
 #define FW_CFG_HPET             (FW_CFG_ARCH_LOCAL + 4)
 
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..06970ac44a 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -11,29 +11,11 @@
 #include "e820_memory_layout.h"
 
 static size_t e820_entries;
-struct e820_table e820_reserve;
 struct e820_entry *e820_table;
 
 int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
 {
-    int index = le32_to_cpu(e820_reserve.count);
-    struct e820_entry *entry;
-
-    if (type != E820_RAM) {
-        /* old FW_CFG_E820_TABLE entry -- reservations only */
-        if (index >= E820_NR_ENTRIES) {
-            return -EBUSY;
-        }
-        entry = &e820_reserve.entry[index++];
-
-        entry->address = cpu_to_le64(address);
-        entry->length = cpu_to_le64(length);
-        entry->type = cpu_to_le32(type);
-
-        e820_reserve.count = cpu_to_le32(index);
-    }
-
-    /* new "etc/e820" file -- include ram too */
+    /* new "etc/e820" file -- include ram and reserved entries */
     e820_table = g_renew(struct e820_entry, e820_table, e820_entries + 1);
     e820_table[e820_entries].address = cpu_to_le64(address);
     e820_table[e820_entries].length = cpu_to_le64(length);
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index a283785a8d..72a42f3c66 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -36,7 +36,6 @@ const char *fw_cfg_arch_key_name(uint16_t key)
         {FW_CFG_ACPI_TABLES, "acpi_tables"},
         {FW_CFG_SMBIOS_ENTRIES, "smbios_entries"},
         {FW_CFG_IRQ0_OVERRIDE, "irq0_override"},
-        {FW_CFG_E820_TABLE, "e820_table"},
         {FW_CFG_HPET, "hpet"},
     };
 
@@ -127,8 +126,6 @@ FWCfgState *fw_cfg_arch_create(MachineState *ms,
 #endif
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
 
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index ffd1884100..170a331e3f 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -324,8 +324,6 @@ static void microvm_memory_init(MicrovmMachineState *mms)
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, machine->smp.max_cpus);
     fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)machine->ram_size);
     fw_cfg_add_i32(fw_cfg, FW_CFG_IRQ0_OVERRIDE, 1);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_E820_TABLE,
-                     &e820_reserve, sizeof(e820_reserve));
     fw_cfg_add_file(fw_cfg, "etc/e820", e820_table,
                     sizeof(struct e820_entry) * e820_get_num_entries());
 
-- 
MST


