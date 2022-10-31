Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5E561371E
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUFr-0000Rj-1v; Mon, 31 Oct 2022 08:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFj-0000FP-98
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUFh-0002CY-EQ
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=Fvbyde53WKAfr99ZVokUUI1JUPpNvT6pl+amNbCQMbKMTdkmyQ3DUCf6OGrxt0706iTaJk
 JhYews0CWLj+vhCCxd5S3KHsruPZzTpdD1nfoeykqZ7Lljpkb81e6Ue+J9Ykafq5sY8TyX
 jVnFzQBjvAfmx/SEfG0XnD12zopzn8c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543--HjXrHCQOiyo4fB2_8pMXA-1; Mon, 31 Oct 2022 08:50:51 -0400
X-MC-Unique: -HjXrHCQOiyo4fB2_8pMXA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso2996698wrd.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:50:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B27E8fRCGiwVLH3TSXoyliisL54NW2Z5dtJ5rq2MMJU=;
 b=Mb8vjOTpzSsiiPmRl1KdLdYrNZHy+sJ67OQnGgANLGC1ROiMC7LZFqMarztMrl83Tl
 Mq+Nr2nAca3tC7tCKQI+y6y8CUKxPd51Bu+X7+h4yd+Fue1Kxd+ggsFKajxF0vhLEH7b
 vxd3vqhnspHSfN2AQK5teRR5r72JP5UKyIKzNGWQv20jZ7fipz0wkw4NXY0MDCb7hCxG
 N7O0R7Jrb5AMab8zwqVCMM0kYqZyBrEnt5L9ET2mis57H3UGQn8gnERcMkGBO2J1KIAP
 6EbbygQcakIea2hcvOL8E5MZKJow2KQTzibQA2+hIdOCbWTqUBs6sSJ03EuB7cJTgzwz
 rbGw==
X-Gm-Message-State: ACrzQf1CbhvSHylecr4yO04hdMotqDeZTYBTvMawA/Xkiw57VEVk9FZf
 aiNOXOtJSkRKL3osnXHLtMOozHXLg3T8uzxhTEpGhrXmZnrUgdo4x5QXrGpA4ryOvDSm26+nCKJ
 zuUIVRxMdtLxUBJrpty2ZowcR32vVoMC11HETujunqpoibN70caHR22mAgTt6
X-Received: by 2002:a1c:f302:0:b0:3cf:61fc:c8c8 with SMTP id
 q2-20020a1cf302000000b003cf61fcc8c8mr8938396wmq.21.1667220649689; 
 Mon, 31 Oct 2022 05:50:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pZ9Q7GZQgjw3rGGcR2scNyzQRILsTLDnlVYYVZoSgGdfRreI/wbehXkv/NB+2g2LtjvpY2w==
X-Received: by 2002:a1c:f302:0:b0:3cf:61fc:c8c8 with SMTP id
 q2-20020a1cf302000000b003cf61fcc8c8mr8938370wmq.21.1667220649397; 
 Mon, 31 Oct 2022 05:50:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b003a601a1c2f7sm6953574wmo.19.2022.10.31.05.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:50:48 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:50:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>
Subject: [PULL 02/86] hw/i386/e820: remove legacy reserved entries for e820
Message-ID: <20221031124928.128475-3-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


