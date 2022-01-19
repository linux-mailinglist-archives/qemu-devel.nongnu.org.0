Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02A449376F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:38:14 +0100 (CET)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Px-0004Yn-H0
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:38:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nA77k-00015L-Pr
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:19:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nA77i-0004Rf-Eb
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642583960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KRth5A7ZY1rraPda/lem+YXIkoeKbm5GfxgPjFReZXQ=;
 b=GfbIciMWacC6+SbKFHx8g3q5VzvBadv3CXEiIjULzsgfxOVrQMUcA2hkm6I4MrV8hVpzOT
 ALIVQ+m6HU/1b1qLvpu/skIZpNeCsh1+TUjLX7s0KRXC+35REDBCbTPD29XTuQcbV9tHOb
 IXOSKQpd50AZTsh3an+LvA/FoOCL5FM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-2r3zw9xYMbeQKub26ygHwA-1; Wed, 19 Jan 2022 04:19:16 -0500
X-MC-Unique: 2r3zw9xYMbeQKub26ygHwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n13-20020a05600c3b8d00b0034979b7e200so897432wms.4
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 01:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=KRth5A7ZY1rraPda/lem+YXIkoeKbm5GfxgPjFReZXQ=;
 b=QZZsdRCA494s1xVXbDRjNsMNr5bMavr3Ybqn1+x/FnO+1Aj1SOGXgI46LQabOnTBUg
 5rO+ElZcdSbK+Gpii6Ur57REIboqS1nEHtdMVDSIlqlnz9HrnwUnk/m6Be8kjdbnkaYX
 frxIiFPxKl22uPX0gnKAgTrKTPjxmNrzWgKBeoNgZ3U4wuZCZYtw5mbGpq2LVUeLmrLx
 WBm1DsQWGnZfVmnJ3tEQ6kg77TURVdJmj9SnMnd+68ta9qruyi6GF0mBni6mNphcqJQC
 RWPTN5huoNsubrijF+pl1+FDDwO2bRGjl/uxME/SqYNfFY5QWP62rvBgEpnHIuCSnX7h
 xNTQ==
X-Gm-Message-State: AOAM531wuoGmiOO+ettBA3+gGMsCrj9+ivyZOK0rDsYZxstEfptQQjWO
 J+WtgLsRP4ajZpE5wpB4KjwFcOSmAcGIONtHjrvjeA0Z/OhBqTG50dKg3EM8scBLsYmNKdzY1o2
 l6nsixZ+RmRUm+Ag=
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr2600574wmq.59.1642583954321; 
 Wed, 19 Jan 2022 01:19:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG0q8RDeuYwkDXzA8EmmCH0zOJ5Uz0WMA2akNgymcUlydqlOPoxasCAFJxH8TQznAXTiZGvQ==
X-Received: by 2002:a05:600c:4e15:: with SMTP id
 b21mr2600542wmq.59.1642583954031; 
 Wed, 19 Jan 2022 01:19:14 -0800 (PST)
Received: from redhat.com ([2a10:8008:4454:0:bb37:a05d:7459:8682])
 by smtp.gmail.com with ESMTPSA id n5sm4577556wmc.47.2022.01.19.01.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 01:19:13 -0800 (PST)
Date: Wed, 19 Jan 2022 04:19:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH] hw/acpi: Set memory regions to native endian as a work
 around
Message-ID: <20220119041842-mutt-send-email-mst@kernel.org>
References: <20211108130934.59B48748F52@zero.eik.bme.hu>
 <b0787bca-8321-059e-d360-1e0a0af31228@redhat.com>
 <a7992420-e2e3-7859-b2de-f9aa88c94945@redhat.com>
 <d03380e9-b6a2-5998-cc72-6443cfdc46b5@eik.bme.hu>
 <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
MIME-Version: 1.0
In-Reply-To: <d9fcba9d-c2c6-5be3-ce5f-baf5a116bbc4@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Nov 13, 2021 at 07:47:20PM +0100, BALATON Zoltan wrote:
> On Mon, 8 Nov 2021, BALATON Zoltan wrote:
> > On Mon, 8 Nov 2021, Paolo Bonzini wrote:
> > > On 11/8/21 15:30, Paolo Bonzini wrote:
> > > > On 11/8/21 14:05, BALATON Zoltan wrote:
> > > > > When using ACPI on big endian machine (such as ppc/pegasos2 which has
> > > > > a VT8231 south bridge with ACPI) writes to ACPI registers come out
> > > > > byte swapped. This may be caused by a bug in memory subsystem but
> > > > > until that is fixed setting the ACPI memory regions to native endian
> > > > > makes it usable for big endian machines. This fixes ACPI shutdown with
> > > > > pegasos2 when using the board firmware for now.
> > > > > This could be reverted when the memory layer is fixed.
> > > > 
> > > > What is the path to the swapped writes?  Even just a backtrace
> > > > might be enough to understand what's going on, and especially
> > > > where the bug is.
> > > 
> > > Ok, Michael pointed me at https://lore.kernel.org/all/20211011080528-mutt-send-email-mst@kernel.org/.
> 
> Ping? I haven't seen an alternative fix yet. If you don't have time now this
> could be postponed to next version with the native endian work around for
> now.
> 
> Regards,
> BALATON Zoltan

Paolo, ping?

> > I was about to say that here's the original thread:
> > 
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg01972.html
> > 
> > and here's the backtrace:
> > 
> > #0  acpi_pm1_cnt_write (val=40, ar=0x55555695f340) at ../hw/acpi/core.c:556
> > #1  acpi_pm_cnt_write (opaque=0x55555695f340, addr=1, val=40, width=2)
> > at ../hw/acpi/core.c:602
> > #2  0x0000555555b3a82f in memory_region_write_accessor
> >    (mr=mr@entry=0x55555695f590, addr=1,
> > value=value@entry=0x7fffefffdd08, size=size@entry=2, shift=<optimized
> > out>, mask=mask@entry=65535, attrs=...)
> >    at ../softmmu/memory.c:492
> > #3  0x0000555555b3813e in access_with_adjusted_size
> >    (addr=addr@entry=1, value=value@entry=0x7fffefffdd08,
> > size=size@entry=1, access_size_min=<optimized out>,
> > access_size_max=<optimized out>, access_fn=
> >    0x555555b3a7b0 <memory_region_write_accessor>, mr=0x55555695f590,
> > attrs=...) at ../softmmu/memory.c:554
> > #4  0x0000555555b3c449 in memory_region_dispatch_write
> > (mr=mr@entry=0x55555695f590, addr=1, data=<optimized out>, op=<optimized
> > out>, attrs=attrs@entry=...)
> >    at ../softmmu/memory.c:1511
> > #5  0x0000555555b2c121 in flatview_write_continue
> >    (fv=fv@entry=0x7fff84d23b30, addr=addr@entry=4261416709,
> > attrs=attrs@entry=..., ptr=ptr@entry=0x7fffefffdec0, len=len@entry=1,
> > addr1=<optimized out>,
> >     l=<optimized out>, mr=0x55555695f590) at host-utils.h:165
> > #6  0x0000555555b2c399 in flatview_write (len=1, buf=0x7fffefffdec0,
> > attrs=..., addr=4261416709, fv=0x7fff84d23b30) at
> > ../softmmu/physmem.c:2822
> > #7  subpage_write (opaque=<optimized out>, addr=<optimized out>,
> > value=<optimized out>, len=1, attrs=...) at ../softmmu/physmem.c:2488
> > #8  0x0000555555b380de in access_with_adjusted_size
> >    (addr=addr@entry=3845, value=value@entry=0x7fffefffdf88,
> > size=size@entry=1, access_size_min=<optimized out>,
> > access_size_max=<optimized out>, access_fn=
> >    0x555555b3aa80 <memory_region_write_with_attrs_accessor>,
> > mr=0x7fff84710bb0, attrs=...) at ../softmmu/memory.c:549
> > #9  0x0000555555b3c449 in memory_region_dispatch_write
> > (mr=mr@entry=0x7fff84710bb0, addr=addr@entry=3845, data=<optimized out>,
> > data@entry=40, op=op@entry=MO_8, attrs=...)
> >    at ../softmmu/memory.c:1511
> > #10 0x0000555555c07b4c in io_writex
> >    (env=env@entry=0x55555666a820,
> > iotlbentry=iotlbentry@entry=0x7fff843367f0, mmu_idx=1, val=val@entry=40,
> > addr=addr@entry=4261416709,
> >     retaddr=retaddr@entry=140736116523268, op=MO_8) at
> > ../accel/tcg/cputlb.c:1420
> > #11 0x0000555555c0b5df in store_helper (op=MO_8, retaddr=<optimized
> > out>, oi=<optimized out>, val=40, addr=4261416709, env=0x55555666a820)
> > at ../accel/tcg/cputlb.c:2355
> > #12 full_stb_mmu (env=0x55555666a820, addr=4261416709, val=40,
> > oi=<optimized out>, retaddr=140736116523268) at
> > ../accel/tcg/cputlb.c:2404
> > #13 0x00007fffae3b8104 in code_gen_buffer ()
> > #14 0x0000555555bfcfab in cpu_tb_exec (cpu=cpu@entry=0x555556661360,
> > itb=itb@entry=0x7fffae3b7fc0 <code_gen_buffer+56197011>,
> > tb_exit=tb_exit@entry=0x7fffefffe668)
> >    at ../accel/tcg/cpu-exec.c:357
> > #15 0x0000555555bfe089 in cpu_loop_exec_tb (tb_exit=0x7fffefffe668,
> > last_tb=<synthetic pointer>, tb=0x7fffae3b7fc0
> > <code_gen_buffer+56197011>, cpu=0x555556661360)
> >    at ../accel/tcg/cpu-exec.c:833
> > #16 cpu_exec (cpu=cpu@entry=0x555556661360) at ../accel/tcg/cpu-exec.c:992
> > #17 0x0000555555c1bba0 in tcg_cpus_exec (cpu=cpu@entry=0x555556661360)
> > at ../accel/tcg/tcg-accel-ops.c:67
> > #18 0x0000555555c1c3d7 in rr_cpu_thread_fn
> > (arg=arg@entry=0x555556661360) at ../accel/tcg/tcg-accel-ops-rr.c:214
> > #19 0x0000555555d5c049 in qemu_thread_start (args=0x7fffefffe750) at
> > ../util/qemu-thread-posix.c:556
> > #20 0x00007ffff6a95dea in start_thread () at /lib64/libpthread.so.0
> > #21 0x00007ffff69c8fdf in clone () at /lib64/libc.so.6
> > 


