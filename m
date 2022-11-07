Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F64962028D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:48:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAu6-0006CY-63; Mon, 07 Nov 2022 17:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAu4-0006CG-Gr
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAu2-0001SQ-QN
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=Yj//OzoiDEcOAbkJbQJroSV0wb/i8/C0dgdfvAq4VLw/8dQ5UMrOvzOnujxkqC4EQd6ymh
 DcWqxu11m2KogGtdIF3BaoP9vexMpX8SLm+Z8euzItYWvoI9hNcYZd/4kJa/rwvfxCoKBV
 g+eJKQFBNEmfR6nNB5ycNADosyej4rw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-WEGeXF9YOMaLgFMsVz6V5Q-1; Mon, 07 Nov 2022 17:47:35 -0500
X-MC-Unique: WEGeXF9YOMaLgFMsVz6V5Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 ew11-20020a05622a514b00b003a524196d31so9030529qtb.2
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=XuH3yLf9VDokAgiO6m69WYpI1bYiVdVII0XJ2BB/ffwsu3rV7PcyO0mq76RvB/1aP6
 7Kwh3rbc6qMdGitM+3hyHF8+0DmU7+H+KxpsCY1bDRzP3O18MwCZ3+y4PP4s4YfUQkKG
 9WJW+Lxxhhd6tNdDiWzUMQqFrir1xgD+TPg68iFK/75+gXRlvqL/xtyk6/RY3YXIXVH5
 Bq3Bbq6H0Tswo9LZW2A4t2KaoPjCeTi/3PQQaOxRdcnOtmujuL+2vZBgVgCcJuDek9Ho
 +u84sblsVeRrluqDXeMhV8OAZ739XCJ7BxIyaqrraeE0JooEtcX9rHmtYdYm+psgJkJy
 P9uw==
X-Gm-Message-State: ACrzQf2UdEhoLT7h+VMJVWwsLjPGgvplLWd875ud9aubvMKZ9MtiPN2r
 fXU5FPA1+k31uTQw6IrZTTegTTLjxtVJU++p3MeZ2VTQVMQpiZ4Y7xcOTkaHhHFcvKOnOGgZoBY
 xIlueBJ7MbLEwQwTJCKGLvXKyfMhDWx6izfOm5RaJVlj+GR87xcd9puDxlaby
X-Received: by 2002:a05:620a:662:b0:6f8:82a6:d6ea with SMTP id
 a2-20020a05620a066200b006f882a6d6eamr36429712qkh.133.1667861254543; 
 Mon, 07 Nov 2022 14:47:34 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5LQE6BnW1O1aXVa8uLTk1D3loLzasIhtG9xeKNxfgDHUaLdblq4m+Q1HlMFl8/6MaEl47/pw==
X-Received: by 2002:a05:620a:662:b0:6f8:82a6:d6ea with SMTP id
 a2-20020a05620a066200b006f882a6d6eamr36429687qkh.133.1667861254208; 
 Mon, 07 Nov 2022 14:47:34 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006f3e6933bacsm7950685qko.113.2022.11.07.14.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:47:33 -0800 (PST)
Date: Mon, 7 Nov 2022 17:47:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>
Subject: [PULL v4 01/83] hw/i386/e820: remove legacy reserved entries for e820
Message-ID: <20221107224600.934080-2-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


