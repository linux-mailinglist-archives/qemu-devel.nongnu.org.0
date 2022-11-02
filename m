Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C87861689C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGL7-0002ze-5I; Wed, 02 Nov 2022 12:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL3-0002oG-TA
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGL2-0003Ri-4y
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5PFs7dvFWSm4KAxARiJdmAa3zvpoXTxhtCqbnGVoPOY=;
 b=iBNGBdeYw0sZns3LKPSI1rFN6Vrtu5fO6hDYj7nDSdaSoiDa+Otc+7u+1DlCgW//htnPJ0
 pz4g9h/AIos7fSSP9E00cwoX9QcuYLY3VyNIktZI3Orhj/Y2j1S/orCRQmI6PZjQoieW0w
 2UFgi1Yv6i/NfZB+iFhgX2USGH9yIXw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-m5HO99vlOxayOtumKT5vCw-1; Wed, 02 Nov 2022 12:11:34 -0400
X-MC-Unique: m5HO99vlOxayOtumKT5vCw-1
Received: by mail-wm1-f70.google.com with SMTP id
 9-20020a1c0209000000b003cf6fce8005so521106wmc.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PFs7dvFWSm4KAxARiJdmAa3zvpoXTxhtCqbnGVoPOY=;
 b=cHkzsKFeaxaD/vTVdDXqk/MKAD+VC1LpG3+RrCstR/3Qw0PMiAtdvF3MjLfPxYhpaf
 KqAULplnc5wRgXtjqkddC+Q7ZjyNFqCL3Q94hkpgIvzZZJiE70dO6E5tDdY9sxzVwuqh
 sVgW/akOKzve6MM8bxDD2Rlm6t1AHDNFcHl7poSmKY4HXiUWLCH5RviUtCUJKrDPbu/x
 g0DKCWZFYu9GH+fXzubo0nIDIusP4HQU+WBR8To0i4nJmzaHOHUwPwvYHURGFtAXGgQ6
 S0CxpUceW/5f/6kSLK0+WBKJ/LjWiVfnLfpfZm7WLXP/DcC3ArM79e4Ziyz1bWBdyHms
 0z/A==
X-Gm-Message-State: ACrzQf06r8qdp0QZ0lCI+qnGoK0cN7Z+CwJZiFnCIV/Y1gRDkWpvwtnB
 p7mP2zq1vqWtvVQvX4MrFsK08ZGHO/zGMIvJBMXm7QrSF7YxW+0IHU4SEdXpy6gb3bX+Af2To6O
 VhV0eRCy4+0VXvyrgnIioOZQDE52Q7Ikvxo8z1J26ZkXXonrnLXi9D+dZG7bu
X-Received: by 2002:adf:de10:0:b0:236:73c0:75ae with SMTP id
 b16-20020adfde10000000b0023673c075aemr15921171wrm.530.1667405492614; 
 Wed, 02 Nov 2022 09:11:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM604YCsySrnLNk1vw2H9AvjfQtpiwCXRG3ZtFeb58spMPy9KNGat5sIzUS8Wp2Uo+JvgetGFw==
X-Received: by 2002:adf:de10:0:b0:236:73c0:75ae with SMTP id
 b16-20020adfde10000000b0023673c075aemr15921134wrm.530.1667405492317; 
 Wed, 02 Nov 2022 09:11:32 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 r2-20020adfe682000000b002365b759b65sm13353006wrm.86.2022.11.02.09.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:31 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Gregory Price <gourry.memverge@gmail.com>,
 Gregory Price <gregory.price@memverge.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 66/82] hw/i386/pc.c: CXL Fixed Memory Window should not
 reserve e820 in bios
Message-ID: <20221102160336.616599-67-mst@redhat.com>
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


