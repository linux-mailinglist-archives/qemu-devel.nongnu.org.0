Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305ED3FBE02
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:17:20 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKoec-0001nz-G3
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKod0-0000zm-Gy
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mKocw-0003HT-GE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630358132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TMbEY93rn6a/i9ZhwNMaLTtA5wRGjF60Au9SdvcST+E=;
 b=iuTtAA5D9PD1NPDxbXKI9B+Zq6+x4ZPTWBdDMaDK0s6c0+Dug3pYNWZIwntRUFB5PckH76
 Y9Tai0h8WRmVBpV+LKeBs73XQWPopn6dPktHN0533cVcdEPJtnaQRJWLKlk/4838HUI/XI
 JxUMFYN1qqgPnStWOB46TAOHV/zBNbw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-D4cstIS7P2SPNr9Z9mZcgg-1; Mon, 30 Aug 2021 17:15:29 -0400
X-MC-Unique: D4cstIS7P2SPNr9Z9mZcgg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so5177494wmj.8
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TMbEY93rn6a/i9ZhwNMaLTtA5wRGjF60Au9SdvcST+E=;
 b=YLtVf3GjFQmlJlIqgw8n8tCJuOcag3+OTBHsY5ddsM1ZPpE7aimi+UmGNEhG0OZIBT
 qbTQlilldg4h3Ij6UedPd2nHMC0bl4b2WP9DMsgOIn1OMl//QkbHBq/IqXXuwuZRGi8O
 VUpS6slB92j1tFwbaSvdlg8sAfnrjVkTIL/IrOrruy9fXxgQczCWgVtLPlfA+NjWw0cP
 1pz/bhU+ksaVQdvuUl2ir27Gnq1/Z0Vr45/SylCJBKSVbwCTKIoOoxB5dgxPy9uDv3+E
 SjyWxnwQErQpyG7SEvBhItZr00gq1qtYtv/2314YlSgf3wwhjENVGg/0Dax0acpc0Jm0
 ch8Q==
X-Gm-Message-State: AOAM533jXBqDJkE2QosN0aIyzt/SETESatM374w1zc9MdPA/5hCGP/SF
 WhGWmD8k2DnCi+i8CaxFQhMSk7pKI3Agy6XmW4GwDIrsW7VwQCZinNbcgf6TtW7sEmWavo0bS1D
 bMssYvW+Jg/93nEI=
X-Received: by 2002:adf:9f05:: with SMTP id l5mr27158176wrf.188.1630358126493; 
 Mon, 30 Aug 2021 14:15:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzECbO+VJ0+zch2OkhIaRsul9Gqu417yelyZWBCkOtlzxTtNZPXKRMeMmoXfwBamdUz1P3C9w==
X-Received: by 2002:adf:9f05:: with SMTP id l5mr27158153wrf.188.1630358126243; 
 Mon, 30 Aug 2021 14:15:26 -0700 (PDT)
Received: from redhat.com ([2.55.138.60])
 by smtp.gmail.com with ESMTPSA id y6sm19440455wrm.54.2021.08.30.14.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 14:15:25 -0700 (PDT)
Date: Mon, 30 Aug 2021 17:15:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Update vring after modifying its queue size
Message-ID: <20210830171505-mutt-send-email-mst@kernel.org>
References: <20210825224256.1750286-1-philmd@redhat.com>
 <CACGkMEv5qiA7D2LphdzvEZDE+bgiPHsyX++R21xNYtJA_e+AVQ@mail.gmail.com>
 <6824eed8-30e6-dbbf-4a4f-92e394c5430c@redhat.com>
 <ff371c04-555b-1a73-a82f-e3b7ddc3bc64@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ff371c04-555b-1a73-a82f-e3b7ddc3bc64@redhat.com>
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

On Thu, Aug 26, 2021 at 05:16:03PM +0200, Philippe Mathieu-Daudé wrote:
> On 8/26/21 10:40 AM, Philippe Mathieu-Daudé wrote:
> > On 8/26/21 5:28 AM, Jason Wang wrote:
> >> On Thu, Aug 26, 2021 at 6:43 AM Philippe Mathieu-Daudé
> >> <philmd@redhat.com> wrote:
> >>>
> >>> When a ring queue size is modified, we need to call
> >>> virtio_queue_update_rings() to re-init the memory region
> >>> caches. Otherwise the region might have outdated memory
> >>> size, and later load/store access might trigger an
> >>> assertion, such:
> >>>
> >>>   qemu-system-i386: include/exec/memory_ldst_cached.h.inc:30: uint16_t address_space_lduw_le_cached(MemoryRegionCache *, hwaddr, MemTxAttrs, MemTxResult *):
> >>>   Assertion `addr < cache->len && 2 <= cache->len - addr' failed.
> >>>   Thread 1 "qemu-system-i38" received signal SIGABRT, Aborted.
> >>>   0x00007ffff4d312a2 in raise () from /lib64/libc.so.6
> >>>   (gdb) bt
> >>>   #1  0x00007ffff4d1a8a4 in abort () at /lib64/libc.so.6
> >>>   #4  0x0000555558f2b8ec in address_space_lduw_le_cached (cache=0x61300010a7c0, addr=134, attrs=..., result=0x0) at include/exec/memory_ldst_cached.h.inc:30
> >>>   #5  0x0000555558f2ac6b in lduw_le_phys_cached (cache=0x61300010a7c0, addr=134) at include/exec/memory_ldst_phys.h.inc:67
> >>>   #6  0x0000555558f2a3cd in virtio_lduw_phys_cached (vdev=0x62d00003a680, cache=0x61300010a7c0, pa=134) at include/hw/virtio/virtio-access.h:166
> >>>   #7  0x0000555558f300ea in vring_avail_ring (vq=0x7fffdd55d8a0, i=65) at hw/virtio/virtio.c:326
> >>>   #8  0x0000555558f33b10 in vring_get_used_event (vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:332
> >>>   #9  0x0000555558f33677 in virtio_split_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2471
> >>>   #10 0x0000555558f1859f in virtio_should_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2523
> >>>   #11 0x0000555558f188cc in virtio_notify (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/virtio/virtio.c:2565
> >>>   #12 0x0000555557c2bd52 in virtio_input_handle_sts (vdev=0x62d00003a680, vq=0x7fffdd55d8a0) at hw/input/virtio-input.c:100
> >>>   #13 0x0000555558f16df7 in virtio_queue_notify (vdev=0x62d00003a680, n=1) at hw/virtio/virtio.c:2363
> >>>   #14 0x00005555583f45c0 in virtio_pci_notify_write (opaque=0x62d000032400, addr=7, val=0, size=1) at hw/virtio/virtio-pci.c:1369
> >>>   #15 0x0000555558b80b04 in memory_region_write_accessor (mr=0x62d000033190, addr=7, value=0x7fffffff8eb0, size=1, shift=0, mask=255, attrs=...) at softmmu/memory.c:492
> >>>
> >>> Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> >>> Fixes: ab223c9518e ("virtio: allow virtio-1 queue layout")
> >>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/302
> >>> BugLink: https://bugs.launchpad.net/qemu/+bug/1913510
> >>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >>> ---
> >>>  hw/virtio/virtio.c | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> >>> index 874377f37a7..04ffe5f420e 100644
> >>> --- a/hw/virtio/virtio.c
> >>> +++ b/hw/virtio/virtio.c
> >>> @@ -2255,6 +2255,7 @@ void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
> >>>          return;
> >>>      }
> >>>      vdev->vq[n].vring.num = num;
> >>> +    virtio_queue_update_rings(vdev, n);
> >>>  }
> >>>
> >>
> >> Spec said:
> >>
> >> "
> >> The driver MUST configure the other virtqueue fields before enabling
> >> the virtqueue with queue_enable.
> >> "
> >>
> >> So I think we should forbid the num to be changed if the virtqueue is ready?
> 
> What about virtio_queue_set_addr() and virtio_queue_set_align()?

Same thing I guess.

-- 
MST


