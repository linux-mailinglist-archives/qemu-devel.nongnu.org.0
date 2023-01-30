Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC368141F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 16:09:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVl5-0006WY-91; Mon, 30 Jan 2023 10:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVl2-0006WE-VG
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMVl0-0003M4-FY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 10:07:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675091258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4x1gnZS9k4/GIcMjjBoAA6dHcNj/nwozxh2x6hC/RV0=;
 b=XY6F8fMaBogg2nbapoQuZZsWBHK+I3L/vqy58D4SE3YRGHdOnJ3fllQgceI060BntMBpFQ
 kBgyzNDAgbjeQrDgT74jjqHRStitBjcoQuvBDRAUYjxuZANgoW0UJ9I8FgqMKK2pv7oLRY
 LC4/vsbvkS0G6z/JJP1MfgvzmLDRc+A=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-67-awEjKoYNNrCCFpI7XEsYNg-1; Mon, 30 Jan 2023 10:07:36 -0500
X-MC-Unique: awEjKoYNNrCCFpI7XEsYNg-1
Received: by mail-ej1-f71.google.com with SMTP id
 nc27-20020a1709071c1b00b0086dae705676so7705084ejc.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 07:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4x1gnZS9k4/GIcMjjBoAA6dHcNj/nwozxh2x6hC/RV0=;
 b=14BPq6Xp2McOF8UE7TJHCLQVjmEwIN1D4UhmAjVJ1lVlqrEHcKRKPIYmrcznYzo/Xx
 Ydk+9MzijEvzzHLdb67lVzgvXsB5BhH78UVxMOfZPEJnx0ShoSiifh2Hasx3JkTKOeZ0
 mCi7EEOps/jJ79lk8jd6e1zeMHgZiT/JhDRdjzBD5XJGGUYRw2tVq5qzxYolW5mzO12w
 sUoge6r+Ya/MVQWt3L/ZWnoOZCJG5JArD1g/dPAYHuIxXOH4ZBIAxYU1HpNzsH4GYSVU
 qMfc4AujsStwKJj5bgTtSqSOGT5fdkQ6GQswknBybxjwJAyQJY+L280kVl+JMmxK8CSl
 hVQw==
X-Gm-Message-State: AO0yUKXIRZuNM4qb9GpHreTCnfUgqlfV1xjPaa0MmgiSD229qABz5wdB
 B7RvkcUVLcImJHusmOyCH2D7D193T4nVxrKVGXVWDz5VyfL1phA/fo6XlwwGvheYKr4x5r/GXa7
 6evmEsVMYFGna5TY=
X-Received: by 2002:a17:906:1112:b0:87b:d3f3:dcf3 with SMTP id
 h18-20020a170906111200b0087bd3f3dcf3mr11895549eja.35.1675091255516; 
 Mon, 30 Jan 2023 07:07:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9MOnanr/XvaePivZKP2Y+8zImt6UrgLXpJJcR7LtwoiuK6Kd8oqhymeQJ0V0gcnSzdqb000w==
X-Received: by 2002:a17:906:1112:b0:87b:d3f3:dcf3 with SMTP id
 h18-20020a170906111200b0087bd3f3dcf3mr11895533eja.35.1675091255240; 
 Mon, 30 Jan 2023 07:07:35 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 jr6-20020a170906a98600b00780b1979adesm7021159ejb.218.2023.01.30.07.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 07:07:34 -0800 (PST)
Date: Mon, 30 Jan 2023 10:07:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Feng Sun <loyou85@gmail.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, ani@anisinha.ca
Subject: Re: [PATCH] acpi: Set maximum size to 64k for "etc/acpi/rsdp" blob
Message-ID: <20230130100531-mutt-send-email-mst@kernel.org>
References: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
 <20230124113029.7a02e5ff@imammedo.users.ipa.redhat.com>
 <CAAiCvkiFL7PWYSF24YxaOvu_v2fFfaWkuaQgUBr_9AFwsxHOrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAiCvkiFL7PWYSF24YxaOvu_v2fFfaWkuaQgUBr_9AFwsxHOrQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Jan 30, 2023 at 10:47:25PM +0800, Feng Sun wrote:
> Igor Mammedov <imammedo@redhat.com> 于2023年1月24日周二 18:30写道：
> >
> > On Tue, 17 Jan 2023 19:15:21 +0800
> > Sun Feng <loyou85@gmail.com> wrote:
> >
> > > Migrate from aarch64 host with PAGE_SIZE 64k to 4k failed with following errors:
> > >
> > > qmp_cmd_name: migrate-incoming, arguments: {"uri": "tcp:[::]:49152"}
> > > {"timestamp": {"seconds": 1673922775, "microseconds": 534702}, "event": "MIGRATION", "data": {"status": "setup"}}
> > > {"timestamp": {"seconds": 1673922776, "microseconds": 53003}, "event": "MIGRATION", "data": {"status": "active"}}
> > > 2023-01-17T02:32:56.058827Z qemu-system-aarch64: Length too large: /rom@etc/acpi/rsdp: 0x10000 > 0x1000: Invalid argument
> >
> > this should mention/explain why it's happening.
> >
> > i.e we now have 4k limit for RSDP, but then source somehow managed to start with 64k
> > allocated to for RSDP. It looks like limit isn't working as expected to me.
> 
> 4k limit should be romsize limit. I can see Rom '/rom@etc/acpi/rsdp'
> with romsize:4096, datasize:36.
> RAMBlock's used_length is set with datasize aligned to PAGE_SIZE, so
> it become 64k when PAGE_SIZE is 64k.
> ```
> static
> RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>                                   void (*resized)(const char*,
>                                                   uint64_t length,
>                                                   void *host),
>                                   void *host, uint32_t ram_flags,
>                                   MemoryRegion *mr, Error **errp)
> {
>     RAMBlock *new_block;
>     Error *local_err = NULL;
> 
>     assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
>                           RAM_NORESERVE)) == 0);
>     assert(!host ^ (ram_flags & RAM_PREALLOC));
> 
>     size = HOST_PAGE_ALIGN(size);
>     max_size = HOST_PAGE_ALIGN(max_size);
>     new_block = g_malloc0(sizeof(*new_block));
>     new_block->mr = mr;
>     new_block->resized = resized;
>     new_block->used_length = size;
> ```
> So when migrate to 4k PAGE_SIZE, it will report the errors.
> 
> ramblock information for PAGE_SIZE 64k and 4k.
> ```
> # getconf PAGE_SIZE
> 65536
> # virsh qemu-monitor-command testvm --hmp 'info ramblock'
>               Block Name    PSize              Offset
> Used              Total
>            mach-virt.ram   64 KiB  0x0000000000000000
> 0x0000000040000000 0x0000000040000000
>              virt.flash0   64 KiB  0x0000000040000000
> 0x0000000004000000 0x0000000004000000
>              virt.flash1   64 KiB  0x0000000044000000
> 0x0000000004000000 0x0000000004000000
>     /rom@etc/acpi/tables   64 KiB  0x0000000048040000
> 0x0000000000020000 0x0000000000200000
> 0000:00:01.2:00.0/virtio-net-pci.rom   64 KiB  0x0000000048000000
> 0x0000000000040000 0x0000000000040000
>    /rom@etc/table-loader   64 KiB  0x0000000048240000
> 0x0000000000010000 0x0000000000010000
>       /rom@etc/acpi/rsdp   64 KiB  0x0000000048280000
> 0x0000000000010000 0x0000000000010000
> 
> # getconf PAGE_SIZE
> 4096
> # virsh qemu-monitor-command testvm --hmp 'info ramblock'
>               Block Name    PSize              Offset
> Used              Total
>            mach-virt.ram    4 KiB  0x0000000000000000
> 0x0000000800000000 0x0000000800000000
>              virt.flash0    4 KiB  0x0000000800000000
> 0x0000000004000000 0x0000000004000000
>              virt.flash1    4 KiB  0x0000000804000000
> 0x0000000004000000 0x0000000004000000
>     /rom@etc/acpi/tables    4 KiB  0x0000000808000000
> 0x0000000000020000 0x0000000000200000
>    /rom@etc/table-loader    4 KiB  0x0000000808200000
> 0x0000000000001000 0x0000000000010000
>       /rom@etc/acpi/rsdp    4 KiB  0x0000000808240000
> 0x0000000000001000 0x0000000000001000
> ```

Oh interesting. I don't remember why I decided to align in.
What does the following do (warning: completely untested):


diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cb998cdf23..5c732101b9 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2154,7 +2154,7 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
                           RAM_NORESERVE)) == 0);
     assert(!host ^ (ram_flags & RAM_PREALLOC));
 
-    size = HOST_PAGE_ALIGN(size);
+    // size = HOST_PAGE_ALIGN(size);
     max_size = HOST_PAGE_ALIGN(max_size);
     new_block = g_malloc0(sizeof(*new_block));
     new_block->mr = mr;


