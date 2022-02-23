Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492D4C0B2D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 05:38:54 +0100 (CET)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMjQT-0000zE-ET
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 23:38:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMjOu-0000GV-Cx
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 23:37:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nMjOq-0001Lv-9v
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 23:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645591030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LZAW4hOnd+sZQru3bZ8LmmtWQWOZ729pCn0fa2pH/4E=;
 b=OJQM/WKoH52qfmxMK6TxjvvK74A1jssn3WW+YGHTviQAyxegMt4S0BaZmjvqais5G2Eun0
 qy3AcP6XNbEr5tK7BX+PTHvqE/tn6MO6nTKUGuLGOYAzgQmpWEkK82Usj+2T10M9LJbovH
 HZKEFrKJ38f4ww0SbybYHT37R9e1l3g=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-y4UzOQLDPjS0Ap7VNtCF5Q-1; Tue, 22 Feb 2022 23:37:09 -0500
X-MC-Unique: y4UzOQLDPjS0Ap7VNtCF5Q-1
Received: by mail-pj1-f72.google.com with SMTP id
 dw23-20020a17090b095700b001bc4ebc7285so737143pjb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 20:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=LZAW4hOnd+sZQru3bZ8LmmtWQWOZ729pCn0fa2pH/4E=;
 b=MktgNhSCI7wrQejA4pl3opMHv1M3SzvHptIxTyWRwt8KhTvouUa2X0WvPpN7BJZLlI
 GZU/vkvYoWsOT7BNvSjL54kYmHqCSivlbi/LpgCvc6CW8IGmRgbaT/zPzYj+ONlIpnYu
 /F3qDZ/ZUYc2waLY5JSlAaW6eMw4j4t/P59QeI9qFRdouzX3lmVVixlrzjjx90UK9m3B
 aspOeoyybItC3DfojPXRtU6KeZ+8LgD4pE7/rkoalF7/Dr15IKd7OtX66/s0i26IwTpy
 1Tn8LyvG7NCm+cFe0+E30iqW1aW+VNi1MoNoJ6YFqXuz9A+iV1lRWKEN0AMnAkF4yAih
 qc/Q==
X-Gm-Message-State: AOAM53049VjLLu0GN2KM7QGSQFPvxyavLzvObUFmOIx2j7ik6jGD+TqL
 ZLIMWUeA90JSbtd/qAxoCLrXbCfXoBg8cHC2QZDnIVfThWimtOU4WoYe5vYG9r/lneDvalv/u90
 hzq5PyTgeNbG8/4Q=
X-Received: by 2002:a17:90a:bf91:b0:1b9:bda3:10ff with SMTP id
 d17-20020a17090abf9100b001b9bda310ffmr7445875pjs.38.1645591028248; 
 Tue, 22 Feb 2022 20:37:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxT+u4Trr6CX4y+a4mGzD/9xZnpyKcUqCVdt0yZmJEd+41YNqvAqufKpAcdL02nwkVawOCOfg==
X-Received: by 2002:a17:90a:bf91:b0:1b9:bda3:10ff with SMTP id
 d17-20020a17090abf9100b001b9bda310ffmr7445855pjs.38.1645591027920; 
 Tue, 22 Feb 2022 20:37:07 -0800 (PST)
Received: from [10.72.13.161] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id e13sm18471620pfv.190.2022.02.22.20.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 20:37:07 -0800 (PST)
Message-ID: <7ef3d447-1ee5-dbeb-b1c8-4b471d556e2a@redhat.com>
Date: Wed, 23 Feb 2022 12:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
To: Stefan Hajnoczi <stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Subject: virtio-blk issue with vIOMMU
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan:

Recently I found intel vIOMMU gives the following warning when using 
virtio-blk:

qemu-system-x86_64: vtd_iova_to_slpte: detected slpte permission error 
(iova=0x7ffde000, level=0x3, slpte=0x0, write=0)
qemu-system-x86_64: vtd_iommu_translate: detected translation failure 
(dev=01:00:00, iova=0x7ffde000)
qemu-system-x86_64: New fault is not recorded due to compression of faults
qemu-system-x86_64: virtio: zero sized buffers are not allowed

It happens on the boot (device start), and virtio-blk works well after 
this. A quick stack trace is:

Thread 1 "qemu-system-x86" hit Breakpoint 1, vtd_iova_to_slpte 
(s=0x555557a9f710, ce=0x7fffffffd6e0, iova=2147344384, is_write=false, 
slptep=0x7fffffffd6b8,
     slpte_level=0x7fffffffd6b0, reads=0x7fffffffd6aa, 
writes=0x7fffffffd6ab, aw_bits=39 '\'') at ../hw/i386/intel_iommu.c:1055
1055                error_report_once("%s: detected slpte permission error "
(gdb) bt
#0  vtd_iova_to_slpte
     (s=0x555557a9f710, ce=0x7fffffffd6e0, iova=2147344384, 
is_write=false, slptep=0x7fffffffd6b8, slpte_level=0x7fffffffd6b0, 
reads=0x7fffffffd6aa, writes=0x7fffffffd6ab, aw_bits=39 '\'') at 
../hw/i386/intel_iommu.c:1055
#1  0x0000555555b45734 in vtd_do_iommu_translate (vtd_as=0x5555574cd000, 
bus=0x55555766e700, devfn=0 '\000', addr=2147344384, is_write=false, 
entry=0x7fffffffd780)
     at ../hw/i386/intel_iommu.c:1785
#2  0x0000555555b48543 in vtd_iommu_translate (iommu=0x5555574cd070, 
addr=2147344384, flag=IOMMU_RO, iommu_idx=0) at 
../hw/i386/intel_iommu.c:2996
#3  0x0000555555bd3f4d in address_space_translate_iommu
     (iommu_mr=0x5555574cd070, xlat=0x7fffffffd9f0, 
plen_out=0x7fffffffd9e8, page_mask_out=0x0, is_write=false, 
is_mmio=true, target_as=0x7fffffffd938, attrs=...)
     at ../softmmu/physmem.c:433
#4  0x0000555555bdbdd1 in address_space_translate_cached 
(cache=0x7fffed3d02e0, addr=0, xlat=0x7fffffffd9f0, plen=0x7fffffffd9e8, 
is_write=false, attrs=...)
     at ../softmmu/physmem.c:3388
#5  0x0000555555bdc519 in address_space_lduw_internal_cached_slow 
(cache=0x7fffed3d02e0, addr=0, attrs=..., result=0x0, 
endian=DEVICE_LITTLE_ENDIAN)
     at /home/devel/git/qemu/memory_ldst.c.inc:209
#6  0x0000555555bdc6ac in address_space_lduw_le_cached_slow 
(cache=0x7fffed3d02e0, addr=0, attrs=..., result=0x0) at 
/home/devel/git/qemu/memory_ldst.c.inc:253
#7  0x0000555555c71719 in address_space_lduw_le_cached 
(cache=0x7fffed3d02e0, addr=0, attrs=..., result=0x0)
     at /home/devel/git/qemu/include/exec/memory_ldst_cached.h.inc:35
#8  0x0000555555c7196a in lduw_le_phys_cached (cache=0x7fffed3d02e0, 
addr=0) at /home/devel/git/qemu/include/exec/memory_ldst_phys.h.inc:67
#9  0x0000555555c728fd in virtio_lduw_phys_cached (vdev=0x555557743720, 
cache=0x7fffed3d02e0, pa=0) at 
/home/devel/git/qemu/include/hw/virtio/virtio-access.h:166
#10 0x0000555555c73485 in vring_used_flags_set_bit (vq=0x7ffff4ee5010, 
mask=1) at ../hw/virtio/virtio.c:383
#11 0x0000555555c736a8 in virtio_queue_split_set_notification 
(vq=0x7ffff4ee5010, enable=0) at ../hw/virtio/virtio.c:433
#12 0x0000555555c73896 in virtio_queue_set_notification 
(vq=0x7ffff4ee5010, enable=0) at ../hw/virtio/virtio.c:490
#13 0x0000555555c19064 in virtio_blk_handle_vq (s=0x555557743720, 
vq=0x7ffff4ee5010) at ../hw/block/virtio-blk.c:782
#14 0x0000555555c191f5 in virtio_blk_handle_output (vdev=0x555557743720, 
vq=0x7ffff4ee5010) at ../hw/block/virtio-blk.c:819
#15 0x0000555555c78453 in virtio_queue_notify_vq (vq=0x7ffff4ee5010) at 
../hw/virtio/virtio.c:2315
#16 0x0000555555c7b523 in virtio_queue_host_notifier_aio_poll_ready 
(n=0x7ffff4ee5084) at ../hw/virtio/virtio.c:3516
#17 0x0000555555eff158 in aio_dispatch_handler (ctx=0x55555680fac0, 
node=0x7fffeca5bbe0) at ../util/aio-posix.c:350
#18 0x0000555555eff390 in aio_dispatch_handlers (ctx=0x55555680fac0) at 
../util/aio-posix.c:406
#19 0x0000555555eff3ea in aio_dispatch (ctx=0x55555680fac0) at 
../util/aio-posix.c:416
#20 0x0000555555f184eb in aio_ctx_dispatch (source=0x55555680fac0, 
callback=0x0, user_data=0x0) at ../util/async.c:311
#21 0x00007ffff7b6b17d in g_main_context_dispatch () at 
/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0
#22 0x0000555555f299ed in glib_pollfds_poll () at ../util/main-loop.c:232
#23 0x0000555555f29a6b in os_host_main_loop_wait (timeout=0) at 
../util/main-loop.c:255
#24 0x0000555555f29b7c in main_loop_wait (nonblocking=0) at 
../util/main-loop.c:531
#25 0x0000555555be097c in qemu_main_loop () at ../softmmu/runstate.c:727
#26 0x00005555558367fa in main (argc=26, argv=0x7fffffffe058, 
envp=0x7fffffffe130) at ../softmmu/main.c:50

The slpte is 0x0 and level is 3 which probably means the device is 
kicked before it was attached to any IOMMU domain.

Bisecting points to the first bad commit:

commit 826cc32423db2a99d184dbf4f507c737d7e7a4ae
Author: Stefan Hajnoczi <stefanha@redhat.com>
Date:   Tue Dec 7 13:23:31 2021 +0000

     aio-posix: split poll check from ready handler

A wild guess is that this lead some false kick to the device, any 
thought on this?

Thanks


