Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7A4B4216
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 07:47:40 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJV98-0001b6-ON
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 01:47:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJV2T-0008UK-58
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:40:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJV2Q-0005x6-Qr
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 01:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644820842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=He06U6JoDX5LCKOEYpU+zY4doC8X5mVAD+a9nrInnyo=;
 b=O+DQNrIbP796KVsMfNCLMUVWxRrAckKtYUpeK4DrZlNMO1Tpu9NrKwFFifkc84iG1hb/X5
 2Gb7gzoaafNkLnXmhpDBfZmQI22sqBMEliZgFyNS4EXucJGNe5JARjAA1K7vYIGXXQqIPg
 GXV3Zu2PmG/LjCw+9TSlvU1ebdJOMDQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-odmvh1SVOxSkIVhbeZC53g-1; Mon, 14 Feb 2022 01:40:33 -0500
X-MC-Unique: odmvh1SVOxSkIVhbeZC53g-1
Received: by mail-lj1-f200.google.com with SMTP id
 by12-20020a05651c1a0c00b00244bf726482so691185ljb.0
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 22:40:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He06U6JoDX5LCKOEYpU+zY4doC8X5mVAD+a9nrInnyo=;
 b=V4s07Grn177/krraUgkuzneftr+3o63Z9TqBLjgu63NjEi3YiCfTa5wyufnhygaCLp
 cZWlohNLcjUpxEnPiIZrdVG6TkYpZWQ14R6sS7s1gI9uei15NoPprjGizRjuK9Vgx7GE
 bTFj/rl9tpRF59xq7px99c/KcmKAK1QIZzx8UbTJB1IRZt1EJ4AYuCkHZi62uL8ATGHL
 sqRZyaXOxeNcwkYE86nyA5X+4OWoOppSXrYj7rJNI0AyiGh9j8JjEFdQJ8Xi2TrOci8e
 Pp4nFPd9v/3expm37hJjXgS2jYgnM+lWtNc+SJy6sZWJWOCfOHbKPR0ngcaMzC4Fg9eM
 QJFg==
X-Gm-Message-State: AOAM533KbGdac1qKLZ7wZn3e/fYvrXDmCJUI2fgM+p/ajcbHb+jh5nfa
 eyC5/JHdtvYeTjzNX7nsCz96LqDd1qHg5BwlAfzzhKohFpgO7R+zdP9iDFFG0r6LmD1cix1EY9n
 6hdG0YWVbwJCtFQk24R3x7xVaiWVCh04=
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr8482609ljr.369.1644820831975; 
 Sun, 13 Feb 2022 22:40:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHhGIENDMuoDJJkyCZrB7peZpIXyt5OFtvh4fjulVa6g3tnGMJRMRAJUw7kCY/S6LCK9VprbQvSHjhQYaSnYQ=
X-Received: by 2002:a2e:bf22:: with SMTP id c34mr8482596ljr.369.1644820831710; 
 Sun, 13 Feb 2022 22:40:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214060346.72455-1-jasowang@redhat.com>
 <Ygn3I3T2DH3SHFXj@xz-m1.local>
 <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
In-Reply-To: <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 14:40:20 +0800
Message-ID: <CACGkMEswB4HA0jnHS7KAM3qH=_kWUi8KE0TBK-hPqC+a3y6xFw@mail.gmail.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 2:35 PM Jason Wang <jasowang@redhat.com> wrote:
>
> On Mon, Feb 14, 2022 at 2:31 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 02:03:46PM +0800, Jason Wang wrote:
> > > SC is required for some kernel features like vhost-vDPA. So this patch
> > > implements basic SC feature. The idea is pretty simple, for software
> > > emulated DMA it would be always coherent. In this case we can simple
> > > advertise ECAP_SC bit. For VFIO and vhost, thing will be more much
> > > complicated, so this patch simply fail the IOMMU notifier
> > > registration.
> >
> > Could we spell out which vhost branch won't work?
>
> For vhost, it should work but the problem is that we need to introduce
> more logics to demonstrate the notifier ability (e.g a dedicated
> notifier flag for cc).

Or we can do tricks like checking IOMMU_NOTIFIER_DEVIOTLB_UNMAP and
assume it's vhost.

But I'm not sure it's worth it.

Thanks

>
> > How about also mention what
> > this patch is used for (perhaps for some pure vdpa tests on fully emulated)?
>
> That's fine, the main use case so far is to test vDPA in L1 guest.
>
> >
> > >
> > > In the future, we may want to have a dedicated notifiers flag or
> > > similar mechanism to demonstrate the coherency so VFIO could advertise
> > > that if it has VFIO_DMA_CC_IOMMU, for vhost kernel backend we don't
> > > need that since it's a software backend.
> > >
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  hw/i386/intel_iommu.c          | 14 +++++++++++++-
> > >  hw/i386/intel_iommu_internal.h |  1 +
> > >  include/hw/i386/intel_iommu.h  |  1 +
> > >  3 files changed, 15 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > > index 5b865ac08c..5fa8e361b8 100644
> > > --- a/hw/i386/intel_iommu.c
> > > +++ b/hw/i386/intel_iommu.c
> > > @@ -3022,6 +3022,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
> > >      VTDAddressSpace *vtd_as = container_of(iommu, VTDAddressSpace, iommu);
> > >      IntelIOMMUState *s = vtd_as->iommu_state;
> > >
> > > +    /* TODO: add support for VFIO and vhost users */
> > > +    if (s->snoop_control) {
> > > +        error_setg_errno(errp, -ENOTSUP,
> > > +                         "Snoop Control with vhost or VFIO is not supported");
> > > +        return -ENOTSUP;
> > > +    }
> >
> > IIUC this will also fail things like e.g. vhost-kernel but afaiu that can be
> > fully emulated too.  That's expected, am I right?
>
> Yes, I try to make the patch as simple as possible, so VFIO or any
> kind of vhost won't work.
>
> Thanks
>
> >
> > Thanks,
> >
> > > +
> > >      /* Update per-address-space notifier flags */
> > >      vtd_as->notifier_flags = new;
> >
> > --
> > Peter Xu
> >


