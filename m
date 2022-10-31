Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DC613741
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:00:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJH-0005EG-0U; Mon, 31 Oct 2022 08:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIt-0004LB-Ne
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIr-0003QH-9G
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebtgD2L9tCYItZqfvX8t8o7AED5g6ctSCii0v2zYkwg=;
 b=L4SS2hhlRqUw+Bb83kwmCHQmXpa+IEvcoZprIAEDF5ikmgTHrXLF19Ysod1MEG+wwpgDCC
 UN/thAyJAfbocL2Eic9TVmKsb2MAJBvB21Up3osVS8YryxWpu1cv7sbG6gPj/1Hhc1N5Mx
 DAzHF7RhpRhemECsX/X1MY816XNl9lI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-359-uFPzcxR8PqiPOwS8Qjs9uw-1; Mon, 31 Oct 2022 08:54:06 -0400
X-MC-Unique: uFPzcxR8PqiPOwS8Qjs9uw-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so3019377wra.15
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebtgD2L9tCYItZqfvX8t8o7AED5g6ctSCii0v2zYkwg=;
 b=gaCqRlXrMBgsCunnYBWwN64r7qRv6f4Pc3IfCzvoTQGdG3KZzbayFaICbBwzleUskD
 Toxit5BLj1T4y0JjgRqupRbcEt7UQN4LhH06B2/MbgpOYQpqDCrXN+TliZv/U23zcnIJ
 RxOTALK/DeImd0LgJgPsCeYVqPcm5CQhT5Z35FC0qha7LqhtgK4zn13jMtPCcl3b3JVG
 zVOVPOmeNqNncOF7aMxk2yVmd8c0iaL2RClu+pu6+xBpPGziv//b+Y0lDk95ydyUksHf
 gQS+YLNpAKicDAZsZgaRyXemzGeFFjagjE4Hsi1wlFwhmjKvERlhIDoKDUr5lCDjmvjt
 YsEg==
X-Gm-Message-State: ACrzQf3Z8sjHQZq2g3yqzbiKFNnL/jfo3KMdy+j9VMEKw1x2sFcKPq2b
 4lxN3Mn8vfjiB93mDkKnN+mDgJRUPDGbsKCYzAgN/6oI+QJOLnDNG/8v+I6OfLtFEA0sWqIaiIy
 VgKcb9NnRg96xkcmJmRVB9XpJHjrRX8Ew1qOnd8AO4CSi/hKPiT4EQ9p6Nw0s
X-Received: by 2002:a5d:544a:0:b0:236:77f4:6e15 with SMTP id
 w10-20020a5d544a000000b0023677f46e15mr8008888wrv.117.1667220844802; 
 Mon, 31 Oct 2022 05:54:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jdO6yXpUUNwKw7dktwo0lJMcnUO3lvgUl+epw3WC9dFXkh9/bNWYrP8q15Kf9KyjSoH/3Hw==
X-Received: by 2002:a5d:544a:0:b0:236:77f4:6e15 with SMTP id
 w10-20020a5d544a000000b0023677f46e15mr8008861wrv.117.1667220844490; 
 Mon, 31 Oct 2022 05:54:04 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b003c6f8d30e40sm7505402wmq.31.2022.10.31.05.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:03 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gregory Price <gourry.memverge@gmail.com>,
 Gregory Price <gregory.price@memverge.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 70/86] hw/i386/pc.c: CXL Fixed Memory Window should not
 reserve e820 in bios
Message-ID: <20221031124928.128475-71-mst@redhat.com>
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

From: Gregory Price <gourry.memverge@gmail.com>

Early-boot e820 records will be inserted by the bios/efi/early boot
software and be reported to the kernel via insert_resource.  Later, when
CXL drivers iterate through the regions again, they will insert another
resource and make the RESERVED memory area a child.

This RESERVED memory area causes the memory region to become unusable,
and as a result attempting to create memory regions with

    `cxl create-region ...`

Will fail due to the RESERVED area intersecting with the CXL window.

During boot the following traceback is observed:

0xffffffff81101650 in insert_resource_expand_to_fit ()
0xffffffff83d964c5 in e820__reserve_resources_late ()
0xffffffff83e03210 in pcibios_resource_survey ()
0xffffffff83e04f4a in pcibios_init ()

Which produces a call to reserve the CFMWS area:

(gdb) p *new
$54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
       flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
       child = 0x0}

Later the Kernel parses ACPI tables and reserves the exact same area as
the CXL Fixed Memory Window:

0xffffffff811016a4 in insert_resource_conflict ()
                      insert_resource ()
0xffffffff81a81389 in cxl_parse_cfmws ()
0xffffffff818c4a81 in call_handler ()
                      acpi_parse_entries_array ()

(gdb) p/x *new
$59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
       flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
       child = 0x0}

This produces the following output in /proc/iomem:

590000000-68fffffff : CXL Window 0
  590000000-68fffffff : Reserved

This reserved area causes `get_free_mem_region()` to fail due to a check
against `__region_intersects()`.  Due to this reserved area, the
intersect check will only ever return REGION_INTERSECTS, which causes
`cxl create-region` to always fail.

Signed-off-by: Gregory Price <gregory.price@memverge.com>
Message-Id: <20221026205912.8579-1-gregory.price@memverge.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3e86083db3..a3dda50912 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1062,7 +1062,6 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
-        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1078,7 +1077,6 @@ void pc_memory_init(PCMachineState *pcms,
                 memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                       "cxl-fixed-memory-region", fw->size);
                 memory_region_add_subregion(system_memory, fw->base, &fw->mr);
-                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                 cxl_fmw_base += fw->size;
                 cxl_resv_end = cxl_fmw_base;
             }
-- 
MST


