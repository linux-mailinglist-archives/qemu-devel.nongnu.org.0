Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD4463510E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 08:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxk74-0008W5-Dx; Wed, 23 Nov 2022 02:24:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxk6X-0008QQ-9I
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:23:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxk6V-0005FB-0S
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:23:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669188210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFHllK1JD+rhEenGA29F4rjxM24aZHqqTZV/iMj5jXs=;
 b=PJYgaeMIZUmNnYQ1cnmU6NcxKCMs6JkCEyqgZ1gFXkLwWSxv4cEFTpKVhYHjqoHuolKYOz
 f+Xgny2AWMWcCNl76hWZSqa1yQOQ7GX4o7zCanHG9CUN55Lsv++i1Bs1IKsdQTSySdvUoO
 y2Bu7nq6WTLtCSt2MbO+LV4sKmUWmWE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-8NrSHl9yMp-8qtfq4kYYQQ-1; Wed, 23 Nov 2022 02:23:29 -0500
X-MC-Unique: 8NrSHl9yMp-8qtfq4kYYQQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi19-20020a05600c3d9300b003cf9d6c4016so665052wmb.8
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 23:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CFHllK1JD+rhEenGA29F4rjxM24aZHqqTZV/iMj5jXs=;
 b=txYsl7mxHtSDW3j1UcTwwAHtg6QkvgdsNIokR5sTjcaZjjZbeZvXVjbZqbSGmmxkns
 tumxXI3qiAB37mDr0iVVCHlFRbJypd4qCThGssvTEZJHyXrvISRdFyny7m7bjGm5HTZ8
 TMxheYgWcZFhiyjLWRqlSH1CIeyFre+lvJHph/3EFvV60fYdd+6woog+z1NCLYQauTYB
 OkQ2U4XCoaeVvCEBTzSEZ0tig4ntZ0H67BUT+zvbdjU3sHKeNoT4e74k12XXtp5j7JLu
 CTBtb0PkbHVDkpShRiw7+MI8zXOiiD6q2wZzzpN7+7n4feiM1yr+FXCaE4f3mueu0nHh
 MFHg==
X-Gm-Message-State: ANoB5pk/gjWeEV6be8FWSMvjNJlBPXjCB9FhZpKYbPC0ZRVasICkkCvX
 1z1JRYOVDuNNT6n75HKKq2sT6Xpu6rlnUESmYUkFZdMboNp3A5aKBmEPMU9uoSaM79dOut87+/1
 QYOP7JjwgJhxV/kY=
X-Received: by 2002:a05:6000:128c:b0:236:e512:1a9e with SMTP id
 f12-20020a056000128c00b00236e5121a9emr7268111wrx.416.1669188207823; 
 Tue, 22 Nov 2022 23:23:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf55oLmq8nKENrUKR6fHTdFyDQ4kwKcKvBU+5HSbhHbFyCaCrrT/bg/Mob0BWErr0pN1bhpVjA==
X-Received: by 2002:a05:6000:128c:b0:236:e512:1a9e with SMTP id
 f12-20020a056000128c00b00236e5121a9emr7268098wrx.416.1669188207608; 
 Tue, 22 Nov 2022 23:23:27 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b003a6125562e1sm1236414wmb.46.2022.11.22.23.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 23:23:27 -0800 (PST)
Date: Wed, 23 Nov 2022 02:23:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, eperezma@redhat.com, eric.auger@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Message-ID: <20221123022126-mutt-send-email-mst@kernel.org>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
 <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
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

On Wed, Nov 23, 2022 at 11:20:41AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com
>     wrote:
>     > From: Marc-André Lureau <marcandre.lureau@redhat.com>
>     >
>     > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
>     > warning") removed the warning on vfio_listener_region_add() path.
>     >
>     > An error is reported for vhost-vdpa case:
>     > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
>     >
>     > Skip the CRB device.
>     >
>     > Fixes:
>     > https://bugzilla.redhat.com/show_bug.cgi?id=2141965
>     >
>     > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>     > ---
>     >  hw/virtio/vhost-vdpa.c | 6 ++++++
>     >  1 file changed, 6 insertions(+)
>     >
>     > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>     > index 7468e44b87..9d7206e4b8 100644
>     > --- a/hw/virtio/vhost-vdpa.c
>     > +++ b/hw/virtio/vhost-vdpa.c
>     > @@ -19,6 +19,7 @@
>     >  #include "hw/virtio/virtio-net.h"
>     >  #include "hw/virtio/vhost-shadow-virtqueue.h"
>     >  #include "hw/virtio/vhost-vdpa.h"
>     > +#include "sysemu/tpm.h"
>     >  #include "exec/address-spaces.h"
>     >  #include "migration/blocker.h"
>     >  #include "qemu/cutils.h"
>     > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section
>     (MemoryRegionSection *section,
>     >  {
>     >      Int128 llend;
>     > 
>     > +    if (TPM_IS_CRB(section->mr->owner)) {
>     > +        /* The CRB command buffer has its base address unaligned. */
>     > +        return true;
>     > +    }
>     > +
> 
>     Quite a hack. We can't really keep adding dependency on random devices
> 
> 
> Agree it's not great. but it's not strictly a dependency. At least you can
> still build with !CONFIG_TPM.

but what does it have to do with tpm?


> 
>     to vhost. And would you add hacks like this to listeners?
>     Pls figure out what's special about this buffer.
>     Also if this section is unaligned then doesn't it break up
>     other aligned sections?
> 
> 
> See the original discussion:
> https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/
> 20220208133842.112017-2-eric.auger@redhat.com/
> 
> It is not clear whether aligning the tpm-crb-cmd region would work (overlapping
> tpm-crb-mmio).
> 
> Peter Maydell said: "There's nothing that guarantees alignment for memory
> regions at all, whether they're RAM, IO or anything else.".
> 
> Maybe vfio/vhost should simply skip those odd regions silently.


How do we detect them? Are these regions not DMA-able on real hardware?

> 
> 
> 
> 
>     >      if ((!memory_region_is_ram(section->mr) &&
>     >           !memory_region_is_iommu(section->mr)) ||
>     >          memory_region_is_protected(section->mr) ||
>     > --
>     > 2.38.1
> 
> 


