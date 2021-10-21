Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161074359CD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:22:33 +0200 (CEST)
Received: from localhost ([::1]:56876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPb5-0007Gh-Kw
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdPZL-0005T2-43
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 00:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdPZG-0007KM-7i
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 00:20:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634790036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N+TwV2vq4POafBZ9Oj5d4zS5xmDaFBrtt1KzuI6MxoY=;
 b=GjRWnbRmbHA+is2ebcBmCZSKdnZPg7uhlduvUFt3Lkg7s9rn8XAWI8L3qNooLp8ehdzQNY
 NcUHLyJUU5quxYle/v52698+Rv1J5bdg3ODcB3Uf+VkNMDqHIxOTR0Kv3L+xBB1HjwfFQs
 HAwmq2TE6W0yoCHVDPhPJXwcQr54f3Q=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-0ziHRYYkPFisd_AhGFcFGA-1; Thu, 21 Oct 2021 00:20:33 -0400
X-MC-Unique: 0ziHRYYkPFisd_AhGFcFGA-1
Received: by mail-pl1-f200.google.com with SMTP id
 s15-20020a170902b18f00b0013fb4449cecso5923012plr.19
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 21:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N+TwV2vq4POafBZ9Oj5d4zS5xmDaFBrtt1KzuI6MxoY=;
 b=q31j4iJqxhFWemd0oXwpcdeu18FIQMojpiVbLOKw13Fc05sBwP3p8nQ4GcDM4TeIbP
 NH0yWYM6VXqKteNREzkQagHFL/un5FWxbvD0oreyuDA7oSsRk/grbl4NJh0J8Pg9aNTg
 ze7iYncbR7lrvioLIGdElc3RgtMi0W4HpyCdHEH5pVX5wUiqO8T87NhpORPJEzo2H9W9
 BrqzYWnupVcc1mValOHvfC/Jjprk24DNDntExmaQRkMZzl0D2bZC9XA5/yu85Dvvy3jn
 d+5NMi44AvW24UPNPn03huV9a4G0crj+UhlJH8cX4VInLaoyoGrk+JI7ZebfgCdMthkB
 bf+g==
X-Gm-Message-State: AOAM5329ihk81wXZflCp2NOWAblklH9NsCb7PcBkkXasAvkhurN+tP1X
 3ZTdgje+s4JVV2c5WEjn7ZsUI8N6YHBIK+CrbYwag+XKMtzmMVrQuFR6i6MFh628kgnhWdawOgI
 uVX/L/gHr1TKM7ls=
X-Received: by 2002:a17:902:8d8b:b0:13f:ed59:7950 with SMTP id
 v11-20020a1709028d8b00b0013fed597950mr2992394plo.61.1634790032704; 
 Wed, 20 Oct 2021 21:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxF6rtStdJvvHxxUghCVXeLbUnthiyWH4qcUJ0c8NnL3yIrbxOOK1Xvwyl5PknbnFMVnIfABQ==
X-Received: by 2002:a17:902:8d8b:b0:13f:ed59:7950 with SMTP id
 v11-20020a1709028d8b00b0013fed597950mr2992358plo.61.1634790032320; 
 Wed, 20 Oct 2021 21:20:32 -0700 (PDT)
Received: from xz-m1.local ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id z5sm3598868pge.2.2021.10.20.21.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 21:20:31 -0700 (PDT)
Date: Thu, 21 Oct 2021 12:20:25 +0800
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 0/4] vl: Prioritize device realizations
Message-ID: <YXDqaZL71DCEghbr@xz-m1.local>
References: <20210818194217.110451-1-peterx@redhat.com>
 <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2817620d-facb-eeee-b854-64193fa4da33@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 03:44:08PM +0200, David Hildenbrand wrote:
> On 18.08.21 21:42, Peter Xu wrote:
> > This is a long pending issue that we haven't fixed.  The issue is in QEMU we
> > have implicit device ordering requirement when realizing, otherwise some of the
> > device may not work properly.
> > 
> > The initial requirement comes from when vfio-pci starts to work with vIOMMUs.
> > To make sure vfio-pci will get the correct DMA address space, the vIOMMU device
> > needs to be created before vfio-pci otherwise vfio-pci will stop working when
> > the guest enables the vIOMMU and the device at the same time.
> > 
> > AFAIU Libvirt should have code that guarantees that.  For QEMU cmdline users,
> > they need to pay attention or things will stop working at some point.
> > 
> > Recently there's a growing and similar requirement on vDPA.  It's not a hard
> > requirement so far but vDPA has patches that try to workaround this issue.
> > 
> > This patchset allows us to realize the devices in the order that e.g. platform
> > devices will be created first (bus device, IOMMU, etc.), then the rest of
> > normal devices.  It's done simply by ordering the QemuOptsList of "device"
> > entries before realization.  The priority so far comes from migration
> > priorities which could be a little bit odd, but that's really about the same
> > problem and we can clean that part up in the future.
> > 
> > Libvirt can still keep its ordering for sure so old QEMU will still work,
> > however that won't be needed for new qemus after this patchset, so with the new
> > binary we should be able to specify qemu cmdline as wish on '-device'.
> > 
> > Logically this should also work for vDPA and the workaround code can be done
> > with more straightforward approaches.
> > 
> > Please review, thanks.
> 
> Hi Peter, looks like I have another use case:

Hi, David,

> 
> vhost devices can heavily restrict the number of available memslots:
> e.g., upstream KVM ~64k, vhost-user usually 32 (!). With virtio-mem
> intending to make use of multiple memslots [1] and auto-detecting how
> many to use based on currently avilable memslots when plugging and
> realizing the virtio-mem device, this implies that realizing vhost
> devices (especially vhost-user device) after virtio-mem devices can
> similarly result in issues: when trying realization of the vhost device
> with restricted memslots, QEMU will bail out.
> 
> So similarly, we'd want to realize any vhost-* before any virtio-mem device.
> 
> Do you have any updated version of this patchset? Thanks!

Yes I should follow this up, thanks for asking.

Though after Markus and Igor pointed out to me that it's much more than types
of device and objects to order, I don't have a good way to fix the ordering
issue for good on all the problems; obviously current solution only applies to
device class ordering.

Examples that Markus provided:

https://lore.kernel.org/qemu-devel/87ilzj81q7.fsf@dusky.pond.sub.org/

Also there can be inter-dependency issue too for single device class, e.g., for
pci buses if bus pcie.2 has a parent pci bus of pcie.1, then we must speficy
the "-device" for pcie.1 before the "-device" of pcie.2, otherwise qemu will
fail to boot too.

Any of above examples means ordering based on device class can only solve
partial of the problems, not all.

And I can buy in with what people worry about on having yet another way to fix
ordering, since the root issue is still unsettled, even if the current solution
seems to work for vIOMMU/vfio, and I had a feeling it could work too with the
virtio-mem issue you're tackling with.

My plan is to move on with what Igor suggested, on using either pre_plug hook
for vIOMMU to make sure no special devices like vfio are realized before that.
I think it'll be as silly as a pci bus scan on all the pcie host bridges
looking for vfio-pci, it can even be put directly into realize() I think as I
don't see an obvious difference on failing pre_plug() or realize() so far.
Then I'll just drop this series so the new version may not really help with
virtio-mem anymore; though not sure virtio-mem can do similar thing.

One step back, OTOH, I do second on what Daniel commented in the other thread
on leaving that problem to the user; sad to know that we already have pmem
restriction so hot plugging some device already start to fail, but maybe
failing is fine as long as nothing will crash? :)

I also do think it's nice to at least allow the user to specify the exact value
of virtio-mem slot number without any smart tricks to be played when the user
wants - I think it's still okay to do automatic detection, but that's already
part of "policy" not "mechanism" to me so imho it should be better optional,
and now I had a feeling that maybe qemu should be good enough on providing
these mechanisms first then we leave the rest of the problems to libvirt, maybe
that's a better place to do all these sanity checks and doing smart things on
deciding the slot numbers.  For qemu failing at the right point without
interrupting the guest seems to be good enough so far.

I think "early failing" seems to not be a problem for virtio-mem already since
if there's a conflict on the slot number then e.g. vhost-user will already fail
early, not sure whether it means it's good enough.  For vIOMMU I may need to
work on the other bus scanning patchset to make sure when vfio is specified
before vIOMMU then we should fail qemu early, and that's still missing.

Thanks,

-- 
Peter Xu


