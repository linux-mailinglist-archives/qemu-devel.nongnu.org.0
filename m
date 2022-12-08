Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123E646A48
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3C5P-0001Dx-1L; Thu, 08 Dec 2022 03:16:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3C5B-0001DV-I0
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p3C59-0006gR-Mi
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670487397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zN9U0efMPEc915ydvcaa9UwETYt+1CD4B9QG77wgKRw=;
 b=DlH4EjdRcAIOpqmHOtZQOn8zqD4w6laoa++zxFYF/dWkGoJgrqDrsK9np+Pgc3Mqog9UMG
 TZKcMnVYG8VRni7eHHqMPlcZGWcYwm8spiE5Azz0Ud5XqRrA8SEh4Z7OoztcvIgJgamb0Z
 pBONmXZu+QV36viN0OXLSa/AEtKCGjA=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-eHR-xw0OM-q4e-TMKUB-7g-1; Thu, 08 Dec 2022 03:16:36 -0500
X-MC-Unique: eHR-xw0OM-q4e-TMKUB-7g-1
Received: by mail-vk1-f200.google.com with SMTP id
 c144-20020a1f1c96000000b003bc20c37566so241826vkc.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 00:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zN9U0efMPEc915ydvcaa9UwETYt+1CD4B9QG77wgKRw=;
 b=WYV00mcjUUp6FHNHW7H/8VoEz1XjQwupwDsAGZYaNwxRSY7vKaTvZ24ijEQ9vi999Z
 KFj8ZgbeBjaBlCwWXJcj8WPXBJIYjGlv3TqDgM20zDRPtzVoc1U0xOLgfb3EbnPv2Ju7
 lo1ECYeEHn3VUj00ENFNjs21nT6jkkSdy/2z/dysNpe9rY6smbfi4MV2lqftZqE9j5Kg
 q9FeMdBnOAF0aD9/5NfNVjoL2NKeYwHRhBuuL5TqLQYHBBxHN52e9xWZxQ7zncRNLUJ3
 sMZP/etiJaoB0/nx0PMtadRY54Hfjuu3A6i8JIzXWKSNDWynZoHlHE69609NxDFAoLJj
 Z/XA==
X-Gm-Message-State: ANoB5pkeWI8EQVPBaL8y7pacaA27zlrB0PHkJdjr8WigaleD+SdaQIRw
 1JSFTmvNqySTSoSMVxytG90Fq41GrFYQ4zlxhl9NRB0+P499FgnpVDtklGUpjAhAmoXynvwAWH5
 Y65q3ze0RjBU5dDOCzNKtGC+kmT8PE6s=
X-Received: by 2002:a05:6102:3354:b0:3a9:8207:bb1a with SMTP id
 j20-20020a056102335400b003a98207bb1amr43724620vse.58.1670487395627; 
 Thu, 08 Dec 2022 00:16:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5CRgDSKMr0WD4TZEb2w8tzxc2eUifbb5W8iZR1NTwVTwO0db3Y/ymMz3/33iVGCDQsxlKj1vCCWAIlXF2xk+4=
X-Received: by 2002:a05:6102:3354:b0:3a9:8207:bb1a with SMTP id
 j20-20020a056102335400b003a98207bb1amr43724615vse.58.1670487395393; Thu, 08
 Dec 2022 00:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20221130053251.2606831-1-lulu@redhat.com>
 <20221130053251.2606831-2-lulu@redhat.com>
 <CACGkMEvhg1gpF73XaNTYn_qRa9oOsye7rhkXHMSJ425M=f3cBw@mail.gmail.com>
In-Reply-To: <CACGkMEvhg1gpF73XaNTYn_qRa9oOsye7rhkXHMSJ425M=f3cBw@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 8 Dec 2022 16:15:59 +0800
Message-ID: <CACLfguVoaqWEQa5vA8k+igZcpHxLfCQh5R_V_mH2nPfzMcyCMg@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] vhost-vdpa: Skip the range check while MR is IOMMU
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

On Thu, 8 Dec 2022 at 15:42, Jason Wang <jasowang@redhat.com> wrote:
>
> On Wed, Nov 30, 2022 at 1:33 PM Cindy Lu <lulu@redhat.com> wrote:
> >
> > Skip the check in vhost_vdpa_listener_skipped_section() while
> > MR is IOMMU, Move this check to  vhost_vdpa_iommu_map_notify()
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >  hw/virtio/vhost-vdpa.c | 21 ++++++++++++++-------
> >  1 file changed, 14 insertions(+), 7 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 3ff9ce3501..f0e9963d19 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -60,15 +60,22 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
> >                       iova_min, section->offset_within_address_space);
> >          return true;
> >      }
> > +    /*
> > +     * While using vIOMMU, Sometimes the section will be larger than iova_max
> > +     * but the memory that  actually mapping is smaller, So skip the check
> > +     * here. Will add the check in vhost_vdpa_iommu_map_notify,
> > +     *There is the real size that maps to the kernel
> > +     */
> >
>
> I suggest squashing this into the next patch since we haven't
> implemented vhost_vdpa_iommu_map_notify() yet.
>
> Thanks
>
Sure, will do
Thanks
Cindy
> > -    llend = vhost_vdpa_section_end(section);
> > -    if (int128_gt(llend, int128_make64(iova_max))) {
> > -        error_report("RAM section out of device range (max=0x%" PRIx64
> > -                     ", end addr=0x%" PRIx64 ")",
> > -                     iova_max, int128_get64(llend));
> > -        return true;
> > +    if (!memory_region_is_iommu(section->mr)) {
> > +        llend = vhost_vdpa_section_end(section);
> > +        if (int128_gt(llend, int128_make64(iova_max))) {
> > +            error_report("RAM section out of device range (max=0x%" PRIx64
> > +                         ", end addr=0x%" PRIx64 ")",
> > +                         iova_max, int128_get64(llend));
> > +            return true;
> > +        }
> >      }
> > -
> >      return false;
> >  }
> >
> > --
> > 2.34.3
> >
>


