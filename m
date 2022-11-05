Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0668061DCA5
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqq-0000p9-G6; Sat, 05 Nov 2022 13:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoZ-0007X1-J4
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMoX-0007ks-Nf
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5PFs7dvFWSm4KAxARiJdmAa3zvpoXTxhtCqbnGVoPOY=;
 b=bXeCBvq1V5RzmF48XkECV4a0a/0MmPThRVgeMwtf3MaoPWER4PjHuUpMyums1HPsD6g9ie
 TYMVUUFBPQGuTSuhsRanOIZaaH7s70rHHtfLyCyvTwK3Y5yqpFP/nuT5Lil3BE87Di+oWN
 V+qjjeVYwFz4jg0OARSBNDlPksPS1y4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-wCj9JuBCMeuy8l2X01FjIA-1; Sat, 05 Nov 2022 13:18:35 -0400
X-MC-Unique: wCj9JuBCMeuy8l2X01FjIA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6010106wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PFs7dvFWSm4KAxARiJdmAa3zvpoXTxhtCqbnGVoPOY=;
 b=ZI/JDqeFdgDBgdjEZwIYQwABmF3yZXuCx+TnpQfym2/HMv3FFEyc2HB7ibq6KP/vkV
 Ng1xELeiAXTjuK4yBcJtLOXaBSx/XGORgVKENoOpL8VQq37+XjX/opqZQnYGiJRJywOc
 eHJF6++f9ZjVVjoa7Q6veVdLOusXpnG77xHmVbJBPKNgw6pRRVSRHFwHS1/qaTqBq5d4
 baB0DIve3qpfdzI5Lst7V2409UwNACPS6TqswrwFLyMiLJTosPIai7qR1B4iNj0eLelv
 IuSffdDE3cKH9Zur5z2qf3bRMPzffT8K7rEJFEVLUws6BAM3e0KL/OGNNdrO5e7SmTAv
 eh/Q==
X-Gm-Message-State: ACrzQf1DpCohaWqhZuSeiyRSnTKu1nKxN/qXv6X30JZVdRI4Rcx8DQl/
 pujK89sNkuwVn+o+5qFHBAWadT/uCk99Q0y6P1FpSyjwq2nD55VriYb7yxo1yPdszBAH1Pqxx+G
 ZnH/7OgIk8EhNtN0bQ87OpGcxfBhJlR0Jey+tyIoF7/nDSIhXQc4Z12epkbcz
X-Received: by 2002:adf:df82:0:b0:236:563b:6f5d with SMTP id
 z2-20020adfdf82000000b00236563b6f5dmr377963wrl.532.1667668713732; 
 Sat, 05 Nov 2022 10:18:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uSEPFb90O+DPoXwnANE8NJsjQqa8ChPGoueC9wmW7jySa1Xen6lEwaoHCTK8uUIBvPpweVw==
X-Received: by 2002:adf:df82:0:b0:236:563b:6f5d with SMTP id
 z2-20020adfdf82000000b00236563b6f5dmr377952wrl.532.1667668713203; 
 Sat, 05 Nov 2022 10:18:33 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b003cf6c2f9513sm3383649wms.2.2022.11.05.10.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:18:32 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:18:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gregory Price <gourry.memverge@gmail.com>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v3 63/81] hw/i386/pc.c: CXL Fixed Memory Window should not
 reserve e820 in bios
Message-ID: <20221105171116.432921-64-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ef14da5094..546b703cb4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1061,7 +1061,6 @@ void pc_memory_init(PCMachineState *pcms,
         hwaddr cxl_size = MiB;
 
         cxl_base = pc_get_cxl_range_start(pcms);
-        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
         cxl_resv_end = cxl_base + cxl_size;
@@ -1077,7 +1076,6 @@ void pc_memory_init(PCMachineState *pcms,
                 memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                       "cxl-fixed-memory-region", fw->size);
                 memory_region_add_subregion(system_memory, fw->base, &fw->mr);
-                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                 cxl_fmw_base += fw->size;
                 cxl_resv_end = cxl_fmw_base;
             }
-- 
MST


