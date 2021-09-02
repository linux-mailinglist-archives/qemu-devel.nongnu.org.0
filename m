Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECB3FEF02
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:55:03 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLnBG-0002sh-2u
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLn2P-0006RP-5j
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mLn2L-00078X-4j
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 09:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630590347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=spftsMNLMWVco5NaahiFxW2oJmkB027x5gdS0e8Hnks=;
 b=KGeRIqmwy4GPXbFBoQXIjq5ICmcFfPxgmjNtPDs2x+OeUl28XGEO//DMg2r//Gzc8dyq+Y
 OXcW/255q/yNce52U9Yu7mpRcv8ElWfpTOCVYMPoluFNAV/YmQUi/soQ4iBSnjJGKvwEYi
 R5wvCptODK7ma3ejxh2JoTKVs2i5thE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-Akfz_AnXNI6kZAVKj-8O3w-1; Thu, 02 Sep 2021 09:45:46 -0400
X-MC-Unique: Akfz_AnXNI6kZAVKj-8O3w-1
Received: by mail-qv1-f71.google.com with SMTP id
 t12-20020ad45bcc000000b003772069d04aso1543037qvt.19
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 06:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=spftsMNLMWVco5NaahiFxW2oJmkB027x5gdS0e8Hnks=;
 b=fm8narwFSt16L1D5lEbSnNafli2G3zEeHVK6PFptYBgDqNakcd7YN+5VsXJM4DH1Ez
 1Ye8TBPCpVl8BZkaKPtu3qMFzgaApId51Vq/YXpb1vmgC5MBoZEYqqdjw7vyJQmt9j+W
 NgSMVJrNktOhr+7hdCXxgUUQmPzkhXoC8EeM9MzenMAh8DYDiZGotTlfhVd2w4fPzl9u
 2zULn/IfB5WvXMCgxzgKCbXF/hJKuj8EEop205bdibllSfQSmuwdwCdDaZscCHmTNuX5
 erWuy3lWIcVZte+TcIcoQthx+bZd64Bg/PdJHYvgpI4zrmf/hoMqzP/GtTef52f8BgbN
 rCjw==
X-Gm-Message-State: AOAM531in0B9yN/Lw9hCdKnHTWKWIhkE5VSJTkOGkZ+TGEj/0cxchLP0
 nQmYnHRiosGZGqcKxUVGwwe4GlbO9kA57JimKJ2MmCGBzeLBpsgwD97V4NnbFE2e8irsCYNd9ns
 24shNXYCz6HkPgh8=
X-Received: by 2002:ac8:5796:: with SMTP id v22mr3041608qta.373.1630590345865; 
 Thu, 02 Sep 2021 06:45:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGW8HadwTOB9A4FGltV9yQblOlAv/waVfCHYyd12NCsrnXOaA9VOhBYlEYEJo97/dGyHJ/tw==
X-Received: by 2002:ac8:5796:: with SMTP id v22mr3041566qta.373.1630590345530; 
 Thu, 02 Sep 2021 06:45:45 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id h13sm1412726qkk.67.2021.09.02.06.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 06:45:44 -0700 (PDT)
Date: Thu, 2 Sep 2021 09:45:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <YTDVh9/MVAfCdkeu@t490s>
References: <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210902102616.1b596104@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 10:26:16AM +0200, Igor Mammedov wrote:
> On Mon, 30 Aug 2021 15:02:53 -0400
> Peter Xu <peterx@redhat.com> wrote:
> 
> > On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:
> > > > > A simple state machine can track "has IOMMU" state.  It has three states
> > > > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > > > that needs to know".  State diagram:
> > > > > 
> > > > >                           no so far
> > > > >                    +--- (start state) ---+
> > > > >                    |                     |
> > > > >          add IOMMU |                     | add device that
> > > > >                    |                     |  needs to know
> > > > >                    v                     v
> > > > >              +--> yes                    no <--+
> > > > >              |     |   add device that   |     |
> > > > >              +-----+    needs to know    +-----+
> > > > > 
> > > > > "Add IOMMU" in state "no" is an error.  
> > > > 
> > > > question is how we distinguish "device that needs to know"
> > > > from device that doesn't need to know, and then recently
> > > > added feature 'bypass IOMMU' adds more fun to this.  
> > > 
> > > Maybe we can start from "no device needs to know"? Then add more into it when
> > > the list expands.
> > > 
> > > vfio-pci should be a natural fit because we're sure it won't break any valid
> > > old configurations.  However we may need to be careful on adding more devices,
> > > e.g. when some old configuration might work on old binaries, but I'm not sure.  
> > 
> > Btw, I think this state machine is indeed bringing some complexity on even
> > understanding it - it is definitely working but it's not obvious to anyone at
> > the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
> > yet another state machine for some other ordering constraints?
> >
> > From that POV, I don't like this solution more than the simple "assign priority
> > for device realization" idea..
> It seems simple but implicit dependencies are fragile (good or
> I'd rather say bad example implicit dependencies is vl.c magic code,
> where changing order of initialization can easily break QEMU,
> which happens almost every time it's refactored),

True.  I was never able of telling whether that comes from natural complexity
of the piece of software or there's indeed some smarter moves.

> and as Markus already mentioned it won't work in QMP case.

I didn't ask before, but I do have a question on whether that's a real problem.

When QMP interface is ready, we should have a last phase of "preconfig done"
command, right?  I thought it was "x-exit-preconfig" now, but I'm not sure so
am guessing.  If so, can we do the reorder there and postpone all device
creations, maybe?  Then the ordering properties can be applied there too.

The other thing is I think only libvirt will use the QMP case even if it'll be
ready, and libvirt will need to know the ordering already like vIOMMU and vfio
and pci buses - even if a new qemu supported the ordering of all these, libvirt
still need to support old qemu binaries (and the code is already there anyway)
and it's fairly natural they initiate the QMP commands using the same ordering.

IMHO it means ordering for QMP is not as important as cmdline if that's always
initiated by another software.

> 
> What could work for both cases is explicit dependencies,
> however it would be hard to describe such dependency in this case,
> where device can work both with and without IOMMU depending
> on the bus settings it's attached to.
> 
> Have you considered another approach, i.e. instead of reordering,
> change vfio-pci device model to reconfigure DMA address space
> after realize time (ex: at reset time)?

Yes, I agree this seems to be the cleanest appproach.  It may just need more
changes and they'll be on vfio, and I'm not aware of the rest (Jason should
know better on virtio/vdpa).

The other thing is some dependency cannot be resolved by this, e.g., the pci
bus issue where we put the pci bus to be after the device that it owns.  But
indeed we're already early-fail that now so it seems ok.

Side note: from my gut feeling I still think at some point we shouldn't do the
early-failure for cases in the case of pci bus and device - the cmdline
obviously contains enough information on the dependency on "this pci device
needs that pci bus", and early-fail does seem to be an work-around to me just
because they specified in the wrong order.

Thanks,

-- 
Peter Xu


