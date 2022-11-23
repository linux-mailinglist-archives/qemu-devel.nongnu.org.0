Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BF635724
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 10:39:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxmCO-0001Vt-Cv; Wed, 23 Nov 2022 04:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxmCB-0001UW-Hj
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:37:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxmC9-0006iA-HE
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 04:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669196247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4RcDVTyAiPW+0z4xmhVr1TzfyzMtAvLSSk/uCnp4OPY=;
 b=G+q+l+ELgY/80X8X59yAWdetHt9ZfsAmqYOgtxiXsyPG1t8dGu5qn2p1SwUE6IDMWMBlq7
 Ub6XrrQ+h4nApWvkIaW2D304gpjW+WeubPrunkvWmmEE0TKrvAGqJOBGVXPEH9SiIQMwxp
 Vd6+e/ScdkUMKrLHV5oDvAXNCn08FRc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-48-9Nu_Ax9POxSujRBTLMF1AQ-1; Wed, 23 Nov 2022 04:37:25 -0500
X-MC-Unique: 9Nu_Ax9POxSujRBTLMF1AQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 m17-20020a05600c3b1100b003cf9cc47da5so9369532wms.9
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 01:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4RcDVTyAiPW+0z4xmhVr1TzfyzMtAvLSSk/uCnp4OPY=;
 b=h89yYxt8RPucJyOMW1fJ+EftC4NmBqLKNS9aZasW/pod3xp6cK/tdCwCbCDUSkdFod
 9uhOl32x4j5Ox3lFskh1QU9HHtb0GJexF7fijPsZnR1nChPk6/lDBqA5+lAYJGNWz4bD
 yBIraXFRKR3aMYEhzaaWRHyXLon/ATcZH2HyAER0+R6Lmx0ciAX7SGkybu1RbJm6V9KG
 nX1KSV3YaQ47+QV6Mym61KnH1fpPeZwBfamsaqnrRhy5HbG0etMlGZTtLI4q8kCtbYxB
 0PYiHXT7PQsoWw2ZqbbTMz056W0ySn7g7vcElAks37mH5neAr+MqI7JhxUIgyfoaImmj
 07pw==
X-Gm-Message-State: ANoB5pmp6hmjelKdp2f78Eg0JShiEiEUgaZGhQDIRSlCQ7oMw2KqNUOW
 rWX8IGmM3oKHmm1QWsZ3jxHFCFSft6DfhnfykWuM5GxVMp+nVicBniAQDsV/3neYRaMjX0rP1Or
 f1RqQAxjFQ5ucCNA=
X-Received: by 2002:adf:f30e:0:b0:22c:e002:74c0 with SMTP id
 i14-20020adff30e000000b0022ce00274c0mr17347908wro.593.1669196244660; 
 Wed, 23 Nov 2022 01:37:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6KiDhj4IdAaZDmdwUdtA/a/zmGcQ7QT6ZswS2yaWfm7eybSjBpgBqFTtBHhRp6P5ZBaZ5DbA==
X-Received: by 2002:adf:f30e:0:b0:22c:e002:74c0 with SMTP id
 i14-20020adff30e000000b0022ce00274c0mr17347889wro.593.1669196244409; 
 Wed, 23 Nov 2022 01:37:24 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm1700939wmq.44.2022.11.23.01.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 01:37:23 -0800 (PST)
Date: Wed, 23 Nov 2022 04:37:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, eric.auger@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] vhost-vdpa: skip TPM CRB memory section
Message-ID: <20221123043249-mutt-send-email-mst@kernel.org>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
 <20221122152944-mutt-send-email-mst@kernel.org>
 <CAMxuvaySOMOs=0hwOeP4O6b2nO+ANiEsoDaAzduRRpDcUd=OFw@mail.gmail.com>
 <CAJaqyWdmGPeGxTyYgzYK-G+7Bqk2Mr0BrVtvdX4tjnTv=qUnQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdmGPeGxTyYgzYK-G+7Bqk2Mr0BrVtvdX4tjnTv=qUnQQ@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Wed, Nov 23, 2022 at 08:31:52AM +0100, Eugenio Perez Martin wrote:
> On Wed, Nov 23, 2022 at 8:20 AM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
> >
> > Hi
> >
> > On Wed, Nov 23, 2022 at 12:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >>
> >> On Tue, Nov 22, 2022 at 06:53:49PM +0400, marcandre.lureau@redhat.com wrote:
> >> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> >> > warning") removed the warning on vfio_listener_region_add() path.
> >> >
> >> > An error is reported for vhost-vdpa case:
> >> > qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> >> >
> >> > Skip the CRB device.
> >> >
> >> > Fixes:
> >> > https://bugzilla.redhat.com/show_bug.cgi?id=2141965
> >> >
> >> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> >> > ---
> >> >  hw/virtio/vhost-vdpa.c | 6 ++++++
> >> >  1 file changed, 6 insertions(+)
> >> >
> >> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> > index 7468e44b87..9d7206e4b8 100644
> >> > --- a/hw/virtio/vhost-vdpa.c
> >> > +++ b/hw/virtio/vhost-vdpa.c
> >> > @@ -19,6 +19,7 @@
> >> >  #include "hw/virtio/virtio-net.h"
> >> >  #include "hw/virtio/vhost-shadow-virtqueue.h"
> >> >  #include "hw/virtio/vhost-vdpa.h"
> >> > +#include "sysemu/tpm.h"
> >> >  #include "exec/address-spaces.h"
> >> >  #include "migration/blocker.h"
> >> >  #include "qemu/cutils.h"
> >> > @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> >> >  {
> >> >      Int128 llend;
> >> >
> >> > +    if (TPM_IS_CRB(section->mr->owner)) {
> >> > +        /* The CRB command buffer has its base address unaligned. */
> >> > +        return true;
> >> > +    }
> >> > +
> >>
> >> Quite a hack. We can't really keep adding dependency on random devices
> >
> >
> > Agree it's not great. but it's not strictly a dependency. At least you can still build with !CONFIG_TPM.
> >
> >> to vhost. And would you add hacks like this to listeners?
> >> Pls figure out what's special about this buffer.
> >> Also if this section is unaligned then doesn't it break up
> >> other aligned sections?
> >
> >
> > See the original discussion:
> > https://patchew.org/QEMU/20220208133842.112017-1-eric.auger@redhat.com/20220208133842.112017-2-eric.auger@redhat.com/
> >
> 
> Based on that, I'd tune the comment to something like:
> QEMU represents the CRB cmd/response buffer as a standard RAM region
> to the listeners, but real HW would not be able to access them.

But e.g. virtio can access it now with no issues, no?
Is that a problem? Given it's TPM ...

> Besides, these regions may not be properly page aligned.
> 
> Is that more accurate?
> 
> Thanks!
> 
> > It is not clear whether aligning the tpm-crb-cmd region would work (overlapping tpm-crb-mmio).
> >
> > Peter Maydell said: "There's nothing that guarantees alignment for memory regions at all, whether they're RAM, IO or anything else.".
> >
> > Maybe vfio/vhost should simply skip those odd regions silently.
> >
> >
> >>
> >>
> >> >      if ((!memory_region_is_ram(section->mr) &&
> >> >           !memory_region_is_iommu(section->mr)) ||
> >> >          memory_region_is_protected(section->mr) ||
> >> > --
> >> > 2.38.1
> >>


