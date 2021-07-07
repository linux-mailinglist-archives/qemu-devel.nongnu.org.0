Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BD3BEB15
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:37:05 +0200 (CEST)
Received: from localhost ([::1]:46266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m19bk-0002sn-Bu
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19ah-0002Cq-FK
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:35:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m19ad-0001yB-Vx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:35:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625672154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2W9E/ofk/FWncGxSr8OtZgA9nwUDBIltcl7pgkVB28k=;
 b=ZDgipvM61k/G8rOYFLmXTGfBbdx475dPwoi0wKrDjDbYvMe3XK8bAmBlUsFt4KXtd8nueD
 q6063VDB1vIgzLG9Cz2IXLNKhfZlSqrpEpQoExB+d3rFoWivOGGLyWsSPdpdCh5CAfOXrY
 G7vH7kHNJTzYNyYbIjTwrU3HERUb1Yc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-NSziPc9xOmO-w7pHhUQuQA-1; Wed, 07 Jul 2021 11:35:51 -0400
X-MC-Unique: NSziPc9xOmO-w7pHhUQuQA-1
Received: by mail-qv1-f70.google.com with SMTP id
 f16-20020ad442d00000b029028c5121bf35so1857447qvr.10
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 08:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2W9E/ofk/FWncGxSr8OtZgA9nwUDBIltcl7pgkVB28k=;
 b=tbHSqLU7e2foo1+I0IgF4pgNoGDdzTfb12X71hJVBnZxQM7clSvqT7Vd+vc8UqygNi
 h20TY75ryGJhOYT8Ilg+CgFyR9NVzTWijcY7V7DgqRf3z1ERa2Jwp7iWtO0sM4njpwSK
 m/hbpymTDtGjpYOF3WKZM5Gcs0MrZAi7RHdNRVZStXqSL+/YwCPflgh4l8p9npxk2pRg
 n0bUufCagnku5GwLAywgTjF9nqLE75bljkyk8y7I33AfuD0wuEVzVl659Po8WLdJ4QKT
 mkVoGmp+NoCiGKz9e6KF41P3eIlmKUKqg8hO6GZvG8bnmcfw+x/YW1U/HHYBqRbhU0Gk
 iJBg==
X-Gm-Message-State: AOAM5332prl7fUeFiSZnB4De0Mmi9X8j86+55/0qgJvJIo0J+fVuUSxC
 SPw6HsVk+Q3M9ElZxWK9Y0bwr1ueguZwRisY6IlGPGnAIk2IjCCi9KpGsN03OD5GvcFyDc57D83
 NJFuOT3CIbIwFKV8=
X-Received: by 2002:ac8:1008:: with SMTP id z8mr22496763qti.232.1625672151375; 
 Wed, 07 Jul 2021 08:35:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUR273VFbIN6CSNXuD7J//inW8KNnn9uPMxlNgAcXn1we9ZKe6lUkM7LufTHmd15HRK4dYpw==
X-Received: by 2002:ac8:1008:: with SMTP id z8mr22496743qti.232.1625672151140; 
 Wed, 07 Jul 2021 08:35:51 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id f8sm3986210qtk.49.2021.07.07.08.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:50 -0700 (PDT)
Date: Wed, 7 Jul 2021 11:35:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eauger@redhat.com>
Subject: Re: [PATCH] docs: Add '-device intel-iommu' entry
Message-ID: <YOXJ1ZKPtNuOGkuN@t490s>
References: <20210611185500.343525-1-peterx@redhat.com>
 <6355528a-5d67-f178-90f9-53103d7540f1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6355528a-5d67-f178-90f9-53103d7540f1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 Jing Zhao <jinzhao@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Chao Yang <chayang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07, 2021 at 11:29:47AM +0200, Eric Auger wrote:
> Hi Peter,

Hi, Eric,

> 
> On 6/11/21 8:55 PM, Peter Xu wrote:
> > The parameters of intel-iommu device are non-trivial to understand.  Add an
> > entry for it so that people can reference to it when using.
> > 
> > There're actually a few more options there, but I hide them explicitly because
> > they shouldn't be used by normal QEMU users.
> > 
> > Cc: Chao Yang <chayang@redhat.com>
> > Cc: Lei Yang <leiyang@redhat.com>
> > Cc: Jing Zhao <jinzhao@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  qemu-options.hx | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 14258784b3a..4bb04243907 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -926,6 +926,38 @@ SRST
> >  
> >  ``-device pci-ipmi-bt,bmc=id``
> >      Like the KCS interface, but defines a BT interface on the PCI bus.
> > +
> > +``-device intel-iommu[,option=...]``
> > +    This is only supported by ``-machine q35``, which will enable Intel VT-d
> > +    emulation within the guest.  It supports below options:
> > +
> > +    ``intremap=on|off`` (default: auto)
> > +        This enables interrupt remapping feature in the guest.  It's required
> > +        to enable complete x2apic.  Currently it only supports kvm
> > +        kernel-irqchip modes ``off`` or ``split``.  Full kernel-irqchip is not
> > +        yet supported.
> maybe explain how the default is chosen (based on kernel-irqhcip mode?)

Will do.

> > +
> > +    ``caching-mode=on|off`` (default: off)
> > +        This enables caching mode for the VT-d emulated device.  When
> > +        caching-mode is enabled, each guest DMA buffer mapping will generate an
> > +        IOTLB invalidation from the guest IOMMU driver to the vIOMMU device in
> > +        a synchronous way.  It is required for ``-device vfio-pci`` to work
> > +        with the VT-d device, because host assigned devices requires to setup
> > +        the DMA mapping on the host before guest DMA starts.
> > +
> > +    ``device-iotlb=on|off`` (default: off)
> > +        This enables device-iotlb capability for the emulated VT-d device.  So
> > +        far virtio/vhost should be the only real user for this parameter,
> I thought if was needed for vhost. What is the usage for virtio?

I used "virtio/vhost" because vhost is only one type of virtio backend, so
normally they should be used in pair.  Also, the "ats=on" parameter should be
an option to virtio frontend rather than vhost, hence I mentioned both.

> > +        paired with ats=on configured for the device.
> What is not obvious to me is whether there is a kind of diagnosis
> whether device-iotlb and caching mode settings are consistent with
> vfio/vhost usage. Does qemu exit if there is inconsistency?

Caching mode check is done in vtd_machine_done_notify_one().

I think there's no such check for vhost, however iirc vhost should work
with/without ats=on; I did't check deeper.

> > +
> > +    ``aw-bits=39|48`` (default: 39)
> > +        This decides the address width of IOVA address space.  The address
> > +        space has 39 bits width for 3-level IOMMU page tables, and 48 bits for
> > +        4-level IOMMU page tables.
> > +
> > +    Please also refer to the wiki page for general scenarios of VT-d
> > +    emulation in QEMU: https://wiki.qemu.org/Features/VT-d.
> > +
> >  ERST
> >  
> >  DEF("name", HAS_ARG, QEMU_OPTION_name,
> >
> Besides, it is quite useful.

Thanks for taking a look!

-- 
Peter Xu


