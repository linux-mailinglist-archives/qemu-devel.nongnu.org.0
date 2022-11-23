Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19A635FB3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 14:32:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxpqC-00040g-Eh; Wed, 23 Nov 2022 08:31:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxpq7-000400-5E
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxpq3-00084j-5m
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 08:30:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669210254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tbnt6rmGGYe3g7lXuavFzybhsNMJMM+B1Fl6lbw6jhM=;
 b=BLgQGPTgNCfTpWnWyUbJaTVIntbMplxCuCKBPQsao5zqgWszBGb9KQubKzvUxwXjkZnB+I
 zZGQZXH0iBXT6tpsvY4pmQT+KdikoXxr5Te9C+j8UE4Bdml7shDcIND9lflsArmktDjVU/
 xo0Ll4zv3i8J1D7emNkUVM4znYFRofE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-XkXGoL60MzSlwnurcC8aJQ-1; Wed, 23 Nov 2022 08:30:52 -0500
X-MC-Unique: XkXGoL60MzSlwnurcC8aJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 l8-20020adfc788000000b00241ef50e89eso371924wrg.0
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 05:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tbnt6rmGGYe3g7lXuavFzybhsNMJMM+B1Fl6lbw6jhM=;
 b=x66/N9EnFwDkRWSEG/XV0fEHSuPJtpLMhrK2ywZ7XXq4OHqLdPF9TitERQvMc0JWyI
 JvToRgM/neZAVBt5WMYOVL5c2n7YIsGhZOnlZjNrdSzRjbI4fHBdlr3nlCTTX+95qLjd
 1+dkDchJOqRx2BsGb5v0UDE+cbWbe5jqkl4dJxDuimCjDHX2Xhfy3lNVCsCHGAAsI1it
 Cl3VSy8ZVIx6ow8rbPwQHmQlC0tyVVF1K3zxMNpxfhy/EcWtxB9rRQsF9PQSCVBWs2/o
 z5Qs8bOqhntUqaqonkLy71F1Ec8Vd4WcOJn9qT0jwVKEPExThfFqMjNDdU1UFcrgOpOg
 gL4Q==
X-Gm-Message-State: ANoB5pk/tDOwyjw7gj7IP1T/9IhoG3rDw1rZu3IajnYiAEKPXqDF4SGE
 InwDIxqGRV3e+qDAGZE7EIDvsAabGqh1aHaPKM7TN6Pa1iaCAbceOnmQGLX777GRlNI+sNKPsdm
 EPys8gRmS47lmPJg=
X-Received: by 2002:a05:600c:46c8:b0:3cf:8896:e1de with SMTP id
 q8-20020a05600c46c800b003cf8896e1demr13180133wmo.4.1669210251606; 
 Wed, 23 Nov 2022 05:30:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4sap0wjSKhT7xYPF1bCVJ/3aL89S7NOo1OAIY4sM/wn44/CYbIGr4eWHC9iCxne0eX93LC+w==
X-Received: by 2002:a05:600c:46c8:b0:3cf:8896:e1de with SMTP id
 q8-20020a05600c46c800b003cf8896e1demr13180113wmo.4.1669210251311; 
 Wed, 23 Nov 2022 05:30:51 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 m16-20020adffe50000000b00241bee11825sm15569612wrs.103.2022.11.23.05.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 05:30:50 -0800 (PST)
Date: Wed, 23 Nov 2022 08:30:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, eperezma@redhat.com, eric.auger@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Message-ID: <20221123082944-mutt-send-email-mst@kernel.org>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
 <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
 <20221123022126-mutt-send-email-mst@kernel.org>
 <c9b007eb-b1e4-121f-378d-12357a426939@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9b007eb-b1e4-121f-378d-12357a426939@linaro.org>
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

On Wed, Nov 23, 2022 at 12:25:58PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/11/22 08:23, Michael S. Tsirkin wrote:
> > On Wed, Nov 23, 2022 at 11:20:41AM +0400, Marc-André Lureau wrote:
> > > Hi
> > > 
> > > On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > 
> > >      On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com
> > >      wrote:
> > >      > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >      >
> > >      > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> > >      > warning") removed the warning on vfio_listener_region_add() path.
> > >      >
> > >      > An error is reported for vhost-vdpa case:
> > >      > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> > >      >
> > >      > Skip the CRB device.
> > >      >
> > >      > Fixes:
> > >      > https://bugzilla.redhat.com/show_bug.cgi?id=2141965
> > >      >
> > >      > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >      > ---
> > >      >  hw/virtio/vhost-vdpa.c | 6 ++++++
> > >      >  1 file changed, 6 insertions(+)
> > >      >
> > >      > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >      > index 7468e44b87..9d7206e4b8 100644
> > >      > --- a/hw/virtio/vhost-vdpa.c
> > >      > +++ b/hw/virtio/vhost-vdpa.c
> > >      > @@ -19,6 +19,7 @@
> > >      >  #include "hw/virtio/virtio-net.h"
> > >      >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> > >      >  #include "hw/virtio/vhost-vdpa.h"
> > >      > +#include "sysemu/tpm.h"
> > >      >  #include "exec/address-spaces.h"
> > >      >  #include "migration/blocker.h"
> > >      >  #include "qemu/cutils.h"
> > >      > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section
> > >      (MemoryRegionSection *section,
> > >      >  {
> > >      >      Int128 llend;
> > >      >
> > >      > +    if (TPM_IS_CRB(section->mr->owner)) {
> > >      > +        /* The CRB command buffer has its base address unaligned. */
> > >      > +        return true;
> > >      > +    }
> > >      > +
> > > 
> > >      Quite a hack. We can't really keep adding dependency on random devices
> > > 
> > > 
> > > Agree it's not great. but it's not strictly a dependency. At least you can
> > > still build with !CONFIG_TPM.
> > 
> > but what does it have to do with tpm?
> > 
> > 
> > > 
> > >      to vhost. And would you add hacks like this to listeners?
> > >      Pls figure out what's special about this buffer.
> > >      Also if this section is unaligned then doesn't it break up
> > >      other aligned sections?
> > > 
> > > 
> > > See the original discussion:
> > > https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/
> > > 20220208133842.112017-2-eric.auger@redhat.com/
> > > 
> > > It is not clear whether aligning the tpm-crb-cmd region would work (overlapping
> > > tpm-crb-mmio).
> > > 
> > > Peter Maydell said: "There's nothing that guarantees alignment for memory
> > > regions at all, whether they're RAM, IO or anything else.".
> > > 
> > > Maybe vfio/vhost should simply skip those odd regions silently.
> > 
> > 
> > How do we detect them? Are these regions not DMA-able on real hardware?
> 
> Are you suggesting expanding the Memory API?
> 
> - Add 'base_address_unaligned' to MemoryRegion structure (default to
>   false)
> 
> - Add memory_region_set_..._unaligned()
> 
> Then have TYPE_TPM_CRB use this API?

Fundamentally since we for some reason don't seem to want to use
existing dma ram api, then yes. But let's have it say what exactly
it means, the fact it's not aligned is not the reason we don't need
to DMA there.


-- 
MST


