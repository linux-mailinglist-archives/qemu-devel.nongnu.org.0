Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDD3C463E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 11:26:50 +0200 (CEST)
Received: from localhost ([::1]:57026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2sDB-0006ca-9p
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 05:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2sCK-0005xB-Ej
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:25:56 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m2sCI-0006fN-TL
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 05:25:56 -0400
Received: by mail-io1-xd2d.google.com with SMTP id 62so9843504iob.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4+twl76yHpRe2vqVnwCiz+byWlOw0MacuFNAZwhTLY=;
 b=UTY0uqRWwyXsIMcVDNfJwW4CMs/c6SSPs+PtGLzzQtk8m8llPvQeHbjxQ/dLTT/XCO
 yawF7pvTiE15iX2yB7aCG8/2TF+QwBgcxlF11u5E5DvrkV1/7ZmCymNOjUkP8THfwEED
 IEr2o+w+kM4WwQgN93Lz7fh15x4ILx+B+snsOlEuzEjCvobEzvH8cV1gmHtG3cfsPSMR
 7+lbLfObp1egCwYSNbIJ22By5ysKaiRRNpvq23SWb2nix2B3Mk5PfOG9rAld6cvhDbmo
 thdKIq2MsgUCqW5oXB5DA6Ln8dV5u3PMNqCqhCcFG9se7hqRvbnhDQPu4fx0cf1RkFWD
 QYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4+twl76yHpRe2vqVnwCiz+byWlOw0MacuFNAZwhTLY=;
 b=AdCsdcv+/2mgtc4Jn0j06ETBtDBq4l+TRluoLA2vLbPoJuEqtNt4bHXuTffkbY5FRh
 gkd9RhYeEYSBRj/GU4WsIijEvDxMQIg0p6x0T5TQfhg7cA7AJRYqpQOFgP5sqRbpStZC
 19M8BuZrWfMxH0/rDsMVi41b5Ge0AJE+FojEBnaQ9sBL/OMyfRs4XZUJElm/uyA/tAkr
 zsQTYxl4CRetGGlx+OzVJhrA9ZMXo6jSEbUxY3aI9Dz7ZI5tfx5oUdAbvHbqC9gpQn4T
 VNN5HhLlo3OgimlYNGL8uaZuNsXlCal5R78E9uQhWQM+D3riMdiD+sRTKZprq7ZgV/Eg
 r+Kw==
X-Gm-Message-State: AOAM530WSCejedRnUaIJr2VdRdSwfU2KnJ2eX5WMHMMiZo8aGAjwn5WT
 4bCzhwvzJX+YGhv56SRZvxfzI70kjEVpexr8J64=
X-Google-Smtp-Source: ABdhPJzBY1JWcmAWOtAtaXp2IHLO0hv2jdlDtOab9XssKfsqyiOgJZ/cSUK8ZvOWEnlZ8B6zD7m/RXAmC57vvn2EdCs=
X-Received: by 2002:a5d:9cd9:: with SMTP id w25mr26954783iow.36.1626081953346; 
 Mon, 12 Jul 2021 02:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210712083135.15755-1-david@redhat.com>
In-Reply-To: <20210712083135.15755-1-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 12 Jul 2021 11:25:42 +0200
Message-ID: <CAM9Jb+gZbV85hmBMBDgY7FjBs6FJftCyB4jHvVquyS8dCaBTTQ@mail.gmail.com>
Subject: Re: [PATCH v1] vfio: Fix CID 1458134 in
 vfio_register_ram_discard_listener()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>   CID 1458134:  Integer handling issues  (BAD_SHIFT)
>     In expression "1 << ctz64(container->pgsizes)", left shifting by more
>     than 31 bits has undefined behavior.  The shift amount,
>     "ctz64(container->pgsizes)", is 64.
>
> Commit 5e3b981c330c ("vfio: Support for RamDiscardManager in the !vIOMMU
> case") added an assertion that our granularity is at least as big as the
> page size.
>
> Although unlikely, we could have a page size that does not fit into
> 32 bit. In that case, we'd try shifting by more than 31 bit.
>
> Let's use 1ULL instead and make sure we're not shifting by more than 63
> bit by asserting that any bit in container->pgsizes is set.
>
> Fixes: CID 1458134
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Auger Eric <eric.auger@redhat.com>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: teawater <teawaterz@linux.alibaba.com>
> Cc: Marek Kedzierski <mkedzier@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/vfio/common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3f0d111360..8728d4d5c2 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -783,7 +783,8 @@ static void vfio_register_ram_discard_listener(VFIOContainer *container,
>                                                                  section->mr);
>
>      g_assert(vrdl->granularity && is_power_of_2(vrdl->granularity));
> -    g_assert(vrdl->granularity >= 1 << ctz64(container->pgsizes));
> +    g_assert(container->pgsizes &&
> +             vrdl->granularity >= 1ULL << ctz64(container->pgsizes));
>
>      ram_discard_listener_init(&vrdl->listener,
>                                vfio_ram_discard_notify_populate,

> Fixes: d5015b801340 ("softmmu/memory: Pass ram_flags to
> qemu_ram_alloc_from_fd()")
>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/remote/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 472ed2a272..6e21ab1a45 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -46,7 +46,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>          subregion = g_new(MemoryRegion, 1);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
> -                                       true, msg->fds[region],
> +                                       RAM_SHARED, msg->fds[region],
>                                         sysmem_info->offsets[region],
>                                         errp);
>

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

