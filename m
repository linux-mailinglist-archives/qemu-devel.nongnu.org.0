Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB5160EA4F
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:36:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onn6P-0001gu-Dr; Wed, 26 Oct 2022 16:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onn6I-0001RB-2E
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onn6F-0006Fq-Nf
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666816445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDK9SpcJnRkQ5dTXycF8Cb/E18YCPCYXacs1p51bQak=;
 b=DQ6qhewk/puugCbMHvlIBYwcCPdkM0chdR48mQiaWI9asVsbeAx9T8M0V4sxuy25bFfYiA
 Uih5yIXAUG6Wlo95ZeUeTUltE+do4sw8tHy0LXb0KbrU4b+j6VKIqGsAkkKz6zIdKd1GgE
 WedD5gfib29R4bm1gC5lydoxGfsiv5c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-138-fTr-LPzoNoedp8DA8_FbaQ-1; Wed, 26 Oct 2022 16:34:04 -0400
X-MC-Unique: fTr-LPzoNoedp8DA8_FbaQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 v125-20020a1cac83000000b003bd44dc5242so1593555wme.7
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDK9SpcJnRkQ5dTXycF8Cb/E18YCPCYXacs1p51bQak=;
 b=dec13gYtYDzTz26GrdM4XmRjwrLqJGdc4QZUNMsuB2xkt2Urh5PDaw9Od6OLtBZzBI
 jtv6bJM/eAyeSARqYcOYSBx/gHqoFj5zTyvX/wmd0KWMusF4pJySaH0HlUQmvXzvdy7y
 wl9Jd6LQO4XwNNGMt4LvZzrasHJJVPhCdoFglrDG4vHCo8wUIN4fIshmTWsAWoTdjpNi
 YPQrMdTTa8I9b+nXvpxfSeDRcIKF3PTf1TcKqsJWvxEMEs/96ic+yxKe6nrKAr6V9rKD
 uQBxGOIV1mmzf1EGYK12u//SRLETlIzUfov7+moqRoVyzFRtvlKURI4jzJFCy6SpvxFd
 Pd3Q==
X-Gm-Message-State: ACrzQf1VagQRhLd85boZZaTEJVXnbOhtWpBa6O/63i2SulUBg+jd4fcB
 5wQxdav9foA0crbjawr8JIPVuhXzaacuXJZZUyhq2+NZ6XAkO0cCkNChLWhDJURc8k/GAfTGWyB
 on/yt5y5QitymtpA=
X-Received: by 2002:a5d:6887:0:b0:236:8ead:47ab with SMTP id
 h7-20020a5d6887000000b002368ead47abmr2753412wru.372.1666816440703; 
 Wed, 26 Oct 2022 13:34:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GmenqTPA7iRI0ZDrJomr1ijVzSUIu6/rEK7vvw1vz1m3nBfwuc2A/W2Cg6xK15egWeXwPrQ==
X-Received: by 2002:a5d:6887:0:b0:236:8ead:47ab with SMTP id
 h7-20020a5d6887000000b002368ead47abmr2753389wru.372.1666816440453; 
 Wed, 26 Oct 2022 13:34:00 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 bi15-20020a05600c3d8f00b003b497138093sm2589298wmb.47.2022.10.26.13.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:33:59 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:33:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH 1/4] hw/i386/pc.c: CXL Fixed Memory Window should not
 reserve e820 in bios
Message-ID: <20221026163336-mutt-send-email-mst@kernel.org>
References: <20221026004737.3646-1-gregory.price@memverge.com>
 <20221026004737.3646-2-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026004737.3646-2-gregory.price@memverge.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On Tue, Oct 25, 2022 at 08:47:34PM -0400, Gregory Price wrote:
> Early-boot e820 records will be inserted by the bios/efi/early boot
> software and be reported to the kernel via insert_resource.  Later, when
> CXL drivers iterate through the regions again, they will insert another
> resource and make the RESERVED memory area a child.
> 
> This RESERVED memory area causes the memory region to become unusable,
> and as a result attempting to create memory regions with
> 
>     `cxl create-region ...`
> 
> Will fail due to the RESERVED area intersecting with the CXL window.
> 
> During boot the following traceback is observed:
> 
> 0xffffffff81101650 in insert_resource_expand_to_fit ()
> 0xffffffff83d964c5 in e820__reserve_resources_late ()
> 0xffffffff83e03210 in pcibios_resource_survey ()
> 0xffffffff83e04f4a in pcibios_init ()
> 
> Which produces a call to reserve the CFMWS area:
> 
> (gdb) p *new
> $54 = {start = 0x290000000, end = 0x2cfffffff, name = "Reserved",
>        flags = 0x200, desc = 0x7, parent = 0x0, sibling = 0x0,
>        child = 0x0}
> 
> Later the Kernel parses ACPI tables and reserves the exact same area as
> the CXL Fixed Memory Window:
> 
> 0xffffffff811016a4 in insert_resource_conflict ()
>                       insert_resource ()
> 0xffffffff81a81389 in cxl_parse_cfmws ()
> 0xffffffff818c4a81 in call_handler ()
>                       acpi_parse_entries_array ()
> 
> (gdb) p/x *new
> $59 = {start = 0x290000000, end = 0x2cfffffff, name = "CXL Window 0",
>        flags = 0x200, desc = 0x0, parent = 0x0, sibling = 0x0,
>        child = 0x0}
> 
> This produces the following output in /proc/iomem:
> 
> 590000000-68fffffff : CXL Window 0
>   590000000-68fffffff : Reserved
> 
> This reserved area causes `get_free_mem_region()` to fail due to a check
> against `__region_intersects()`.  Due to this reserved area, the
> intersect check will only ever return REGION_INTERSECTS, which causes
> `cxl create-region` to always fail.
> 
> Signed-off-by: Gregory Price <gregory.price@memverge.com>


Do we want this as a bugfix, separate from the rest of the
patchset?

> ---
>  hw/i386/pc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 768982ae9a..203c90fedb 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1062,7 +1062,6 @@ void pc_memory_init(PCMachineState *pcms,
>          hwaddr cxl_size = MiB;
>  
>          cxl_base = pc_get_cxl_range_start(pcms);
> -        e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>          memory_region_add_subregion(system_memory, cxl_base, mr);
>          cxl_resv_end = cxl_base + cxl_size;
> @@ -1078,7 +1077,6 @@ void pc_memory_init(PCMachineState *pcms,
>                  memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
>                                        "cxl-fixed-memory-region", fw->size);
>                  memory_region_add_subregion(system_memory, fw->base, &fw->mr);
> -                e820_add_entry(fw->base, fw->size, E820_RESERVED);
>                  cxl_fmw_base += fw->size;
>                  cxl_resv_end = cxl_fmw_base;
>              }
> -- 
> 2.37.3


