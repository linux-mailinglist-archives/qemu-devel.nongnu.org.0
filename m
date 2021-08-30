Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C84E3FBE08
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:19:24 +0200 (CEST)
Received: from localhost ([::1]:36118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKogd-0003SJ-31
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKoe7-00020y-02
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKoe5-000470-7r
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:16:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630358204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XK1yBDsygLs1595gcBD/t7eR975mkG6pMDh5UZnfyyc=;
 b=Xs5jR95IwokE57FBW1Ye5rQt4z0JKmlV4kl63EfNH4wOOpv7oXE/YlCxjsIXhFZSd6tqWS
 Hvv8WMEEgWqMSgoK1+KylV0GN6Vk7cQB3e6+xUD+U/DtlbjMnuca5/jRKogAxXUJg71AIM
 i67LLPj4lNpR2NhU7nbqilPIOsHyvPI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-1u7Bgmf8N_Ka62u9-oSrOQ-1; Mon, 30 Aug 2021 17:16:42 -0400
X-MC-Unique: 1u7Bgmf8N_Ka62u9-oSrOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y24-20020a7bcd98000000b002eb50db2b62so466937wmj.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XK1yBDsygLs1595gcBD/t7eR975mkG6pMDh5UZnfyyc=;
 b=Gz4YPoFyyZ6dm6u2ud9kPjuo8qWmxSsv5hU4wbqipUqvaFXWLY3eXfq/KUrAAqoaAy
 8ppf8tyuUJpNTocxzauyRpasXQX59NczeQfagf+FjwxG9gmrnkfZbe9rAJtbBU8CWfoM
 +NP/IeUb0JW7qkpxh97n+QgTX3WbD8KavunUWqD1Ug3L9AXsd42PIBhIgNdWiU0pm8FD
 Hkb2MowVGwRfDlmqTTKaUYi06uvnnoQYZNlUNgrrFjAQNhcjVTxay/0LbozZUHMhoJA/
 NWav6mEZesXOs+9MXcup40pNdeCjrR/i6JwrV50vLnOkerDrlJ8lA0p4j4r90tMXkwuf
 4QKA==
X-Gm-Message-State: AOAM532jYyQ24SekqsnCHn9TZnWViTaC2nMCxeKd+fp8KTUMzd5dSLE+
 1jn9cQSqjfqGXjktrsW//7XZ7hS6fXOlZYSU4/nAGM1czrti3i1X9Q8nbzXd0ijZZJ2j5h2pn5j
 FN748gE8c+0K6L8o=
X-Received: by 2002:adf:9783:: with SMTP id s3mr28368370wrb.349.1630358199970; 
 Mon, 30 Aug 2021 14:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLx+zUu0nnre4jd0fCTge8dUr938qd4wJCCvW3NqWlr6CgW/fAurInfIb86izjZttW7X3AuQ==
X-Received: by 2002:adf:9783:: with SMTP id s3mr28368355wrb.349.1630358199783; 
 Mon, 30 Aug 2021 14:16:39 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
 by smtp.gmail.com with ESMTPSA id y6sm19442812wrm.54.2021.08.30.14.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 14:16:39 -0700 (PDT)
Date: Mon, 30 Aug 2021 17:16:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
Message-ID: <20210830171528-mutt-send-email-mst@kernel.org>
References: <20210825224256.1750286-1-philmd@redhat.com>
 <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
 <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 10:40:47AM +0200, Philippe Mathieu-Daudé wrote:
> On 8/26/21 5:28 AM, Jason Wang wrote:
> > On Thu, Aug 26, 2021 at 6:43 AM Philippe Mathieu-Daudé
> > <philmd@redhat.com> wrote:
> >>
> >> When a ring queue size is modified, we need to call
> >> virtio_queue_update_rings() to re-init the memory region
> >> caches. Otherwise the region might have outdated memory
> >> size, and later load/store access might trigger an
> >> assertion, such:
> >>
> >>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
> >>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
> >>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> >>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
> >>   (gdb) bt
> >>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
> >>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
> >>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
> >>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
> >>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
> >>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
> >>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
> >>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
> >>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
> >>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
> >>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
> >>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
> >>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
> >>
> >> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> >> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> >> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> ---
> >>  hw/virtio/virtio.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >> index 874377f37a7..04ffe5f420e 100644
> >> --- a/hw/virtio/virtio.c
> >> +++ b/hw/virtio/virtio.c
> >> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
> >>          return;
> >>      }
> >>      vdev->vq[n].vring.num = num;
> >> +    virtio_queue_update_rings(vdev, n);
> >>  }
> >>
> > 
> > Spec said:
> > 
> > "
> > The driver MUST configure the other virtqueue fields before enabling
> > the virtqueue with queue_enable.
> > "
> > 
> > So I think we should forbid the num to be changed if the virtqueue is ready?
> 
> Alright. virtio_pci_common_write() doesn't report errors although.

It can't - just log guest error and ignore. Maybe set needs_reset ...

-- 
MST


