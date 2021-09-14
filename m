Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B2F40AF89
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:49:05 +0200 (CEST)
Received: from localhost ([::1]:42964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8o3-0004sT-UT
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ8j3-0006ub-11
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mQ8Vo-0001SA-CT
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631626211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZvcnE20n3FHCWkHF5Pxb9+cHRea26LR2ELuOaLfNhSE=;
 b=dSqqvMcRpji1x6PO2N3latKj/yfpbzv8a4jhPmaiI+O27ZfcQMyS+3r0fCgM5YmV+BFB2F
 UHOsQabVopIZsoVFbeslLAqXPXF/l9FY5fyINxIV1mHLd+CtaZQxZHmbzNNZCXZkzBRWB2
 kdGOxJR8DZz1jtN2pBG6v6Svd2C6phY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-4K61kaTANXq7cL69HxwUqA-1; Tue, 14 Sep 2021 09:30:10 -0400
X-MC-Unique: 4K61kaTANXq7cL69HxwUqA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l27-20020a05600c1d1b00b00308ef9d8a98so35180wms.9
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 06:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZvcnE20n3FHCWkHF5Pxb9+cHRea26LR2ELuOaLfNhSE=;
 b=SS09UplzU8IhDH7lSMXviNdqJDwPr8LrDueLyvBXOP0bMgwto8n4CgsnI1af/5RAY4
 MzXD2tmkFEC2boEpT1usd8UEp3jAVOKSsxKRbe7BBEoOsVDe4WD31MCUbmlElE92C+i4
 W/a1pzlQp9zai9MEbsceVJ3RUK+Xni9v2ymAs+TOy4fzeMyhmADmZSOxc9s0h92zBnFv
 qpsZQyMl90Np3HvoXnjF6ezmP7kxZjV3P7sBBBBpZfv7g5/l5yBLyG9OAVhEaRKd99v5
 K2LppVF7LKjjbJ2sk3t0LFi2CyL64HLh74PPmGTkvHxqHMAwdvILbF4pUyGcyT2AjkR2
 R6wA==
X-Gm-Message-State: AOAM53391ALQ/Yx6gG35Q0p3fnu86h5b7PaJHItyHnKXxQc+pT4d/M8z
 J+GgNwZGDkgOlcprRlQqoaVTGgk7XJpKJKbYD6w/rLD7T9hPsArYYjZS9vK8NNiWMX6V9BeK6fL
 APBIkG4GMcuMTtNo=
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr2313015wmm.57.1631626209243; 
 Tue, 14 Sep 2021 06:30:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZHF9Qt9t+o89KA7yZO1JWAXnGFKOIUnGqRjiD3zVItFgUEbBl+91xGSiZc7K+P//sukuvDg==
X-Received: by 2002:a05:600c:225a:: with SMTP id
 a26mr2312989wmm.57.1631626209054; 
 Tue, 14 Sep 2021 06:30:09 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id c135sm1178985wme.6.2021.09.14.06.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:30:08 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:30:06 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio-balloon: Fix page-poison subsection name
Message-ID: <YUCj3i2BK1HzuztT@work-vm>
References: <20210914131716.102851-1-dgilbert@redhat.com>
 <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <535891c6-237b-6d37-7492-ef8c1e19e6ca@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: stefanha@redhat.com, qemu-devel@nongnu.org,
 Alexander Duyck <alexander.duyck@gmail.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Hildenbrand (david@redhat.com) wrote:
> On 14.09.21 15:17, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > The subsection name for page-poison was typo'd as:
> > 
> >    vitio-balloon-device/page-poison
> > 
> > Note the missing 'r' in virtio.
> > 
> > When we have a machine type that enables page poison, and the guest
> > enables it (which needs a new kernel), things fail rather unpredictably.
> > 
> > The fallout from this is that most of the other subsections fail to
> > load, including things like the feature bits in the device, one
> > possible fallout is that the physical addresses of the queues
> > then get aligned differently and we fail with an error about
> > last_avail_idx being wrong.
> > It's not obvious to me why this doesn't produce a more obvious failure,
> > but virtio's vmstate loading is a bit open-coded.
> > 
> > Fixes: 7483cbbaf82 ("virtio-balloon: Implement support for page poison reporting feature")
> > bz: https://bugzilla.redhat.com/show_bug.cgi?id=1984401
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >   hw/virtio/virtio-balloon.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> > index 5a69dce35d..c6962fcbfe 100644
> > --- a/hw/virtio/virtio-balloon.c
> > +++ b/hw/virtio/virtio-balloon.c
> > @@ -852,7 +852,7 @@ static const VMStateDescription vmstate_virtio_balloon_free_page_hint = {
> >   };
> >   static const VMStateDescription vmstate_virtio_balloon_page_poison = {
> > -    .name = "vitio-balloon-device/page-poison",
> > +    .name = "virtio-balloon-device/page-poison",
> >       .version_id = 1,
> >       .minimum_version_id = 1,
> >       .needed = virtio_balloon_page_poison_support,
> > 
> 
> Oh, that's very subtle. I wasn't even aware that the prefix really has to
> match the actual device ... I thought the whole idea of the prefix here was
> just to make the string unique ...

Subsection naming is *very* critical; the logic is something like:
  'we're loading the X device'
a subsection arrives for 'N/P'
if 'X==N' then it looks in X for subsection P.
If 'X!=N' then it assumes we've finished loading X
and P is really for an outer device that X is part of.
This is horrible.

Dave

> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> Thanks!
> 
> -- 
> Thanks,
> 
> David / dhildenb
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


