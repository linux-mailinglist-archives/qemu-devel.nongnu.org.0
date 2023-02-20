Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD469D65C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 23:34:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUEjZ-0000z9-CR; Mon, 20 Feb 2023 17:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUEjU-0000tC-DQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:34:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pUEjM-0007n8-Go
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:33:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676932434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TarBgDfDaWRSaGxfVqN+2xM+T/dmAAHy0AXFgMhhDYw=;
 b=a8XcnDjdohADLhZnroRHooelUVOCf/nCbQWVzR3tpei2/z1MP9XrpNNiq6rs89wSyUg9uU
 q5pJtiKQ5DseuDVHn3nzx35hAt/ZSo0zV39NF5ieGI4jTXTFgeR24vs+ieMTTAU1vCqayn
 8OVMcOOm4s4+Wm9Lh7jmh185kkIToaY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-438-c0oPFjy-PUiZF2Y66ZOr7g-1; Mon, 20 Feb 2023 17:33:53 -0500
X-MC-Unique: c0oPFjy-PUiZF2Y66ZOr7g-1
Received: by mail-wr1-f69.google.com with SMTP id
 z6-20020a5d4c86000000b002c54ce46094so572009wrs.17
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 14:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TarBgDfDaWRSaGxfVqN+2xM+T/dmAAHy0AXFgMhhDYw=;
 b=ls5923B5DWWrWnnMbN5XIInFx+hcE0wPz6DbqgZeKrh75FsXNlYn+IXHxvsj+fgogK
 HA39ifkjOsw1oN6ZIuI8cTNTceaZ0MEZTjHPIjW9MEMIpjo9dmkyYxZUWj0wcvK8+li9
 Qt68v6sKrGln0BALSAEWSCMKCiveGIm28k4CYz5qN4kbKr52Xn31BFph0HSV0RRVRm6e
 4b7a0DcQWIZxOVyZdKppQQnpT/v6BqyluOAm6paRokIkCwo/4hqHQB71OAoxwpn9Tozi
 QwNSSZqIIi0kJ1+CbpsapWYEK59WujJyBiorFppN/Bm6zZx0jRSrCB/3FWjyVX1DIr3H
 qdgg==
X-Gm-Message-State: AO0yUKW9oAPIOoq/dF4NyWgbbXg5aIY1LtWo1e6z/cqPneAK0y5lZEAl
 LP/G+YLRRPBfa+bg3c8G3U9rLT9JuH3ZGnLTD0yRtGCTBGPMxIzgsrBZLdLDbCQT682xHY3ZZyV
 nXM4efm3t0JtQIvg=
X-Received: by 2002:adf:e685:0:b0:2c5:607d:7f0 with SMTP id
 r5-20020adfe685000000b002c5607d07f0mr2576633wrm.49.1676932431251; 
 Mon, 20 Feb 2023 14:33:51 -0800 (PST)
X-Google-Smtp-Source: AK7set/Be44++qLSnaD6lvkAXOyDrPNxzVc/RQMwKWPp/9O8tufH0b3bkWFlYIrEkXOco3yVpvCwYw==
X-Received: by 2002:adf:e685:0:b0:2c5:607d:7f0 with SMTP id
 r5-20020adfe685000000b002c5607d07f0mr2576619wrm.49.1676932430894; 
 Mon, 20 Feb 2023 14:33:50 -0800 (PST)
Received: from redhat.com ([2.52.36.56]) by smtp.gmail.com with ESMTPSA id
 g11-20020a5d698b000000b002c5a1bd5280sm3758843wru.95.2023.02.20.14.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:33:50 -0800 (PST)
Date: Mon, 20 Feb 2023 17:33:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20230220172659-mutt-send-email-mst@kernel.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
 <20220119041842-mutt-send-email-mst@kernel.org>
 <20220222094021-mutt-send-email-mst@kernel.org>
 <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f9f183c4-b0b8-22c6-57f9-1b6b20e8e5a5@eik.bme.hu>
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

On Mon, Feb 20, 2023 at 07:24:59PM +0100, BALATON Zoltan wrote:
> On Tue, 22 Feb 2022, Michael S. Tsirkin wrote:
> > On Wed, Jan 19, 2022 at 04:19:14AM -0500, Michael S. Tsirkin wrote:
> > > On Sat, Nov 13, 2021 at 07:47:20PM +0100, BALATON Zoltan wrote:
> > > > On Mon, 8 Nov 2021, BALATON Zoltan wrote:
> > > > > On Mon, 8 Nov 2021, Paolo Bonzini wrote:
> > > > > > On 11/8/21 15:30, Paolo Bonzini wrote:
> > > > > > > On 11/8/21 14:05, BALATON Zoltan wrote:
> > > > > > > > When using ACPI on big endian machine (such as ppc/pegasos2 which has
> > > > > > > > a VT8231 south bridge with ACPI) writes to ACPI registers come out
> > > > > > > > byte swapped. This may be caused by a bug in memory subsystem but
> > > > > > > > until that is fixed setting the ACPI memory regions to native endian
> > > > > > > > makes it usable for big endian machines. This fixes ACPI shutdown with
> > > > > > > > pegasos2 when using the board firmware for now.
> > > > > > > > This could be reverted when the memory layer is fixed.
> > > > > > > 
> > > > > > > What is the path to the swapped writes?  Even just a backtrace
> > > > > > > might be enough to understand what's going on, and especially
> > > > > > > where the bug is.
> > > > > > 
> > > > > > Ok, Michael pointed me at https://lore.kernel.org/all/20211011080528-mutt-send-email-mst@kernel.org/.
> > > > 
> > > > Ping? I haven't seen an alternative fix yet. If you don't have time now this
> > > > could be postponed to next version with the native endian work around for
> > > > now.
> > > > 
> > > > Regards,
> > > > BALATON Zoltan
> > > 
> > > Paolo, ping?
> > 
> > ping
> 
> Can this be fixed please or my proposed workaround taken until it will be?
> Original patch I've sent is here:
> http://patchew.org/QEMU/20211108130934.59B48748F52@zero.eik.bme.hu/
> 
> I hope to make pegasos2 more usable in next release so maybe more people
> will want to use it soon.
> 
> Regards,
> BALATON Zoltan

Any chance of fixing it in memory core? No one else seems to care.


I think fundamentally you need to check for the condition
Size < mr->ops->impl.min_access_size in memory_region_dispatch_write
and then make a read, combine the result with
the value and make a write.






> > > > > I was about to say that here's the original thread:
> > > > > 
> > > > > https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01972.html
> > > > > 
> > > > > and here's the backtrace:
> > > > > 
> > > > > #0  acpi_pm1_cnt_write (val=40, ar=0x55555695f340) at ../hw/acpi/core.c:556
> > > > > #1  acpi_pm_cnt_write (opaque=0x55555695f340, addr=1, val=40, width=2)
> > > > > at ../hw/acpi/core.c:602
> > > > > #2  0x0000555555b3a82f in memory_region_write_accessor
> > > > >    (mr=mr@entry=0x55555695f590, addr=1,
> > > > > value=value@entry=0x7fffefffdd08, size=size@entry=2, shift=<optimized
> > > > > out>, mask=mask@entry=65535, attrs=...)
> > > > >    at ../softmmu/memory.c:492
> > > > > #3  0x0000555555b3813e in access_with_adjusted_size
> > > > >    (addr=addr@entry=1, value=value@entry=0x7fffefffdd08,
> > > > > size=size@entry=1, access_size_min=<optimized out>,
> > > > > access_size_max=<optimized out>, access_fn=
> > > > >    0x555555b3a7b0 <memory_region_write_accessor>, mr=0x55555695f590,
> > > > > attrs=...) at ../softmmu/memory.c:554
> > > > > #4  0x0000555555b3c449 in memory_region_dispatch_write
> > > > > (mr=mr@entry=0x55555695f590, addr=1, data=<optimized out>, op=<optimized
> > > > > out>, attrs=attrs@entry=...)
> > > > >    at ../softmmu/memory.c:1511
> > > > > #5  0x0000555555b2c121 in flatview_write_continue
> > > > >    (fv=fv@entry=0x7fff84d23b30, addr=addr@entry=4261416709,
> > > > > attrs=attrs@entry=..., ptr=ptr@entry=0x7fffefffdec0, len=len@entry=1,
> > > > > addr1=<optimized out>,
> > > > >     l=<optimized out>, mr=0x55555695f590) at host-utils.h:165
> > > > > #6  0x0000555555b2c399 in flatview_write (len=1, buf=0x7fffefffdec0,
> > > > > attrs=..., addr=4261416709, fv=0x7fff84d23b30) at
> > > > > ../softmmu/physmem.c:2822
> > > > > #7  subpage_write (opaque=<optimized out>, addr=<optimized out>,
> > > > > value=<optimized out>, len=1, attrs=...) at ../softmmu/physmem.c:2488
> > > > > #8  0x0000555555b380de in access_with_adjusted_size
> > > > >    (addr=addr@entry=3845, value=value@entry=0x7fffefffdf88,
> > > > > size=size@entry=1, access_size_min=<optimized out>,
> > > > > access_size_max=<optimized out>, access_fn=
> > > > >    0x555555b3aa80 <memory_region_write_with_attrs_accessor>,
> > > > > mr=0x7fff84710bb0, attrs=...) at ../softmmu/memory.c:549
> > > > > #9  0x0000555555b3c449 in memory_region_dispatch_write
> > > > > (mr=mr@entry=0x7fff84710bb0, addr=addr@entry=3845, data=<optimized out>,
> > > > > data@entry=40, op=op@entry=MO_8, attrs=...)
> > > > >    at ../softmmu/memory.c:1511
> > > > > #10 0x0000555555c07b4c in io_writex
> > > > >    (env=env@entry=0x55555666a820,
> > > > > iotlbentry=iotlbentry@entry=0x7fff843367f0, mmu_idx=1, val=val@entry=40,
> > > > > addr=addr@entry=4261416709,
> > > > >     retaddr=retaddr@entry=140736116523268, op=MO_8) at
> > > > > ../accel/tcg/cputlb.c:1420
> > > > > #11 0x0000555555c0b5df in store_helper (op=MO_8, retaddr=<optimized
> > > > > out>, oi=<optimized out>, val=40, addr=4261416709, env=0x55555666a820)
> > > > > at ../accel/tcg/cputlb.c:2355
> > > > > #12 full_stb_mmu (env=0x55555666a820, addr=4261416709, val=40,
> > > > > oi=<optimized out>, retaddr=140736116523268) at
> > > > > ../accel/tcg/cputlb.c:2404
> > > > > #13 0x00007fffae3b8104 in code_gen_buffer ()
> > > > > #14 0x0000555555bfcfab in cpu_tb_exec (cpu=cpu@entry=0x555556661360,
> > > > > itb=itb@entry=0x7fffae3b7fc0 <code_gen_buffer+56197011>,
> > > > > tb_exit=tb_exit@entry=0x7fffefffe668)
> > > > >    at ../accel/tcg/cpu-exec.c:357
> > > > > #15 0x0000555555bfe089 in cpu_loop_exec_tb (tb_exit=0x7fffefffe668,
> > > > > last_tb=<synthetic pointer>, tb=0x7fffae3b7fc0
> > > > > <code_gen_buffer+56197011>, cpu=0x555556661360)
> > > > >    at ../accel/tcg/cpu-exec.c:833
> > > > > #16 cpu_exec (cpu=cpu@entry=0x555556661360) at ../accel/tcg/cpu-exec.c:992
> > > > > #17 0x0000555555c1bba0 in tcg_cpus_exec (cpu=cpu@entry=0x555556661360)
> > > > > at ../accel/tcg/tcg-accel-ops.c:67
> > > > > #18 0x0000555555c1c3d7 in rr_cpu_thread_fn
> > > > > (arg=arg@entry=0x555556661360) at ../accel/tcg/tcg-accel-ops-rr.c:214
> > > > > #19 0x0000555555d5c049 in qemu_thread_start (args=0x7fffefffe750) at
> > > > > ../util/qemu-thread-posix.c:556
> > > > > #20 0x00007ffff6a95dea in start_thread () at /lib64/libpthread.so.0
> > > > > #21 0x00007ffff69c8fdf in clone () at /lib64/libc.so.6
> > > > > 
> > > 
> > 
> > 


