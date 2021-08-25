Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4B3F7EC2
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 00:48:52 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ1hT-0006vS-0Z
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 18:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1gY-00062I-Dg
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:47:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJ1gV-000757-Rh
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 18:47:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629931670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P/ngl0etwyafRz90FsWI37IS5vLR23GhXwj2Qwwg+vI=;
 b=POL6fgIsBB9d5CSV83u/OkjHKZzYnP9B27OOoGtRWDm0tFES/Jqh89Cjel79ktqhDpyDU8
 yV9lMD7iAqmEEHUMayYU6xr22Lqfda/ogFqeeoD/dfTciY/ytmuCBwkZe4X++1xVefAZ37
 4BbcqowXRAWbHTUn1AhzQEssfekOA8k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-2nrn0dbEPRWlfvMLKcNLpg-1; Wed, 25 Aug 2021 18:47:49 -0400
X-MC-Unique: 2nrn0dbEPRWlfvMLKcNLpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p5-20020a7bcc85000000b002e7563efc4cso251621wma.4
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 15:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P/ngl0etwyafRz90FsWI37IS5vLR23GhXwj2Qwwg+vI=;
 b=LyPy0tgyWgulsHJvSCsbWLxSfL8uxagE/CG/+owcEtuyIp2iVKbKiGQMAIEYnNVABH
 vKR+zO2YUSs6iJ/a8Gg6AGbXvcJpQGubiah2b20ZGp2ztWTqj5Kb76VTbX1KDMC0mRSI
 B3FOKsQWjcS+0V0cnomjStO43454hw50YPyPD3AzbhdLVQp7COWLV1/TwYlDWKOZgBCo
 abLhSc4dRJDxTUpt5HHlg8IJRZ6T3dasZAORgRmXdMFXtGtnMCn3+rfw/XInuy7QpUmf
 z/CrX6VuDUAnWtzAAP6+XwfbAga9LIduAk73hkn513wBns9uI8zXmIfyR7o0thQTUIyz
 Vouw==
X-Gm-Message-State: AOAM531blEVZ8+I6NJg4o6scTnG7mApSold002DIGX4/uJQ4bB019+yh
 ocnF5YIz/NyIKQtuvFWSvKoeyQ5RniCHR0rpHVQaqHY0psFgUTmb4h6ibIRpmfeUXytVsEg7qVM
 p2stSb7t5bKG13zs=
X-Received: by 2002:adf:f991:: with SMTP id f17mr467963wrr.56.1629931667652;
 Wed, 25 Aug 2021 15:47:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD+ajN0QPLCAgpvSsQkE/NLaOndJ7xYZyCNbxmxfdogNxP29olu6PYF4kIsSUuSNqWBXvvfw==
X-Received: by 2002:adf:f991:: with SMTP id f17mr467958wrr.56.1629931667472;
 Wed, 25 Aug 2021 15:47:47 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n188sm6496951wmn.48.2021.08.25.15.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 15:47:47 -0700 (PDT)
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
To: qemu-devel@nongnu.org
References: <20210825224256.1750286-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a41731f9-4a7e-6bff-d2bf-281b36f2040c@redhat.com>
Date: Thu, 26 Aug 2021 00:47:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825224256.1750286-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.24, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/26/21 12:42 AM, Philippe Mathieu-Daudé wrote:
> When a ring queue size is modified, we need to call
> virtio_queue_update_rings() to re-init the memory region
> caches. Otherwise the region might have outdated memory
> size, and later load/store access might trigger an
> assertion, such:
> 
>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
>   (gdb) bt
>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492

Earlier call which updated vring.num:

memory_region_ops_write cpu -1 mr 0x62d000032e60 addr 0xe0004018 value
0x41 size 1 name 'virtio-pci-common-virtio-input'
Thread 1 "qemu-system-i38" hit Breakpoint 1, virtio_queue_set_num
(vdev=0x62d00003a680, n=1, num=65) at hw/virtio/virtio.c:2276
2276        if (!!num != !!vdev->vq[n].vring.num ||
(gdb) bt
#0  virtio_queue_set_num (vdev=0x62d00003a680, n=1, num=65) at
hw/virtio/virtio.c:2276
#1  0x00005555583f2a2c in virtio_pci_common_write
(opaque=0x62d000032400, addr=24, val=65, size=1) at
hw/virtio/virtio-pci.c:1297
#2  0x0000555558b81b04 in memory_region_write_accessor
(mr=0x62d000032e60, addr=24, value=0x7fffffff8eb0, size=1, shift=0,
mask=255, attrs=...) at softmmu/memory.c:492
#3  0x0000555558b81442 in access_with_adjusted_size (addr=24,
value=0x7fffffff8eb0, size=1, access_size_min=1, access_size_max=4,
access_fn=
    0x555558b81500 <memory_region_write_accessor>, mr=0x62d000032e60,
attrs=...) at softmmu/memory.c:554
#4  0x0000555558b7fd57 in memory_region_dispatch_write
(mr=0x62d000032e60, addr=24, data=65, op=MO_8, attrs=...) at
softmmu/memory.c:1504
#5  0x0000555558b513f4 in flatview_write_continue (fv=0x60600005cc00,
addr=3758112792, attrs=..., ptr=0x6020000dbb90, len=1, addr1=24, l=1,
mr=0x62d000032e60)
    at softmmu/physmem.c:2777
#6  0x0000555558b3fdd0 in flatview_write (fv=0x60600005cc00,
addr=3758112792, attrs=..., buf=0x6020000dbb90, len=1) at
softmmu/physmem.c:2817
#7  0x0000555558b3f959 in address_space_write (as=0x60800000d920,
addr=3758112792, attrs=..., buf=0x6020000dbb90, len=1) at
softmmu/physmem.c:2909

> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302

BTW this also fixes #300 and #301 :)

> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/virtio/virtio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 874377f37a7..04ffe5f420e 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
>          return;
>      }
>      vdev->vq[n].vring.num = num;
> +    virtio_queue_update_rings(vdev, n);
>  }
>  
>  VirtQueue *virtio_vector_first_queue(VirtIODevice *vdev, uint16_t vector)
> 


