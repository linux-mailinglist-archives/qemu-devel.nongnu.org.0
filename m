Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E883140001C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:02:11 +0200 (CEST)
Received: from localhost ([::1]:51634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM8pe-0005OF-W6
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mM8nr-0004Ty-Mi
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mM8nk-0006I1-Dj
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:00:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I7+JdMOWWIJFX/tKwbtsasFt6lzeLauz+LC5O0rJDZY=;
 b=I6o7Na6cRopbnxfoS42J6gmLjQFwHeXgtoJw5D/UFVxnIuaJbVN5ONgSicZKKb+AZuxOoI
 fkLImEoaA4MiUkfdsfUokVao15kluPwTGypyQSB4b1h5Q9Jjw00fhd34lYl2/u5NZ3GPnz
 muzzyHS4USoeWAwgJtttKuXr2/pH7Kc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-TP8TFah8OXChAO-NKyPJSg-1; Fri, 03 Sep 2021 09:00:10 -0400
X-MC-Unique: TP8TFah8OXChAO-NKyPJSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p11-20020a05600c204b00b002f05aff1663so1940082wmg.2
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I7+JdMOWWIJFX/tKwbtsasFt6lzeLauz+LC5O0rJDZY=;
 b=BhF7L2Ss/oKayqdp6bkFKmM+JUqwWVUfPH3XCG4R7bnHRnZwV02OuLpbXTaVIGw52h
 cR5O0GU95w4C6G8Xsed0k2zePWZMpmog+vgKv6KR3in30iffqHd5+H0ZD2FRu+FtNAyB
 IYXJyxVjZSDdzsslR/rjfVkaEG/TxKUIsSeyKI4NV8YsYSg7w2ofu5cJxgYmV3WTNFIa
 DdI9cFwdpc2NY2po7ZUyUXu+s9oOAq4N3gQ3GbyHdm2gsZ2ueWZLp2UmT+emR0Mcln4J
 mlLow5ALKXGl/iBCuw5C3Pm4CVdsvN+GY9bvnLLmI5FZ3jqpNjol9GP8Npjz3HSgGdox
 J3EA==
X-Gm-Message-State: AOAM530KN8SRjoVvSkmHpUIyavEgX16BLe/k5gN48LiFcWcswKmM5Cuk
 JDCf9m5HlCppzCde1gJMin0zqjDcSBxf0TWCYb0fxXkQLFICC/TOp8CYkq4o7Hr5mFTjyYoU6HG
 k4AL2vUu2YK86wXw=
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr8343038wmq.182.1630674007777; 
 Fri, 03 Sep 2021 06:00:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrBn7GAjwX6beFnfe6jkLDtMX6/+a63agqdGxkFhHrxjQUjWMY6LXmzYl8pZfD7W2gRK2fRw==
X-Received: by 2002:a05:600c:3502:: with SMTP id
 h2mr8343017wmq.182.1630674007538; 
 Fri, 03 Sep 2021 06:00:07 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id n14sm4631072wrx.10.2021.09.03.06.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 06:00:07 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:00:05 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210903150005.58afaf10@redhat.com>
In-Reply-To: <YTDVh9/MVAfCdkeu@t490s>
References: <YSQp0Nh6Gs5equAG@t490s> <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Sep 2021 09:45:43 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Thu, Sep 02, 2021 at 10:26:16AM +0200, Igor Mammedov wrote:
> > On Mon, 30 Aug 2021 15:02:53 -0400
> > Peter Xu <peterx@redhat.com> wrote:
> >   
> > > On Thu, Aug 26, 2021 at 09:43:59AM -0400, Peter Xu wrote:  
> > > > > > A simple state machine can track "has IOMMU" state.  It has three states
> > > > > > "no so far", "yes", and "no", and two events "add IOMMU" and "add device
> > > > > > that needs to know".  State diagram:
> > > > > > 
> > > > > >                           no so far
> > > > > >                    +--- (start state) ---+
> > > > > >                    |                     |
> > > > > >          add IOMMU |                     | add device that
> > > > > >                    |                     |  needs to know
> > > > > >                    v                     v
> > > > > >              +--> yes                    no <--+
> > > > > >              |     |   add device that   |     |
> > > > > >              +-----+    needs to know    +-----+
> > > > > > 
> > > > > > "Add IOMMU" in state "no" is an error.    
> > > > > 
> > > > > question is how we distinguish "device that needs to know"
> > > > > from device that doesn't need to know, and then recently
> > > > > added feature 'bypass IOMMU' adds more fun to this.    
> > > > 
> > > > Maybe we can start from "no device needs to know"? Then add more into it when
> > > > the list expands.
> > > > 
> > > > vfio-pci should be a natural fit because we're sure it won't break any valid
> > > > old configurations.  However we may need to be careful on adding more devices,
> > > > e.g. when some old configuration might work on old binaries, but I'm not sure.    
> > > 
> > > Btw, I think this state machine is indeed bringing some complexity on even
> > > understanding it - it is definitely working but it's not obvious to anyone at
> > > the first glance, and it's only solving problem for vIOMMU.  E.g., do we need
> > > yet another state machine for some other ordering constraints?
> > >
> > > From that POV, I don't like this solution more than the simple "assign priority
> > > for device realization" idea..  
> > It seems simple but implicit dependencies are fragile (good or
> > I'd rather say bad example implicit dependencies is vl.c magic code,
> > where changing order of initialization can easily break QEMU,
> > which happens almost every time it's refactored),  
> 
> True.  I was never able of telling whether that comes from natural complexity
> of the piece of software or there's indeed some smarter moves.
> 
> > and as Markus already mentioned it won't work in QMP case.  
> 
> I didn't ask before, but I do have a question on whether that's a real problem.
> 
> When QMP interface is ready, we should have a last phase of "preconfig done"
> command, right?  I thought it was "x-exit-preconfig" now, but I'm not sure so
> am guessing.  If so, can we do the reorder there and postpone all device
> creations, maybe?  Then the ordering properties can be applied there too.

I don't think "x-exit-preconfig" would help here, ideally devices would be
created before this stage, interactively via QMP.
So whoever is calling device_add, would need to know the proper ordering
or get error as result.

And even if we had explicit dependencies, they would be easier to use
with current error-out policy if something is out of expected order,
and tell user to fix CLI/QMP command order (and replace adhoc checks
use currently).


> The other thing is I think only libvirt will use the QMP case even if it'll be
> ready, and libvirt will need to know the ordering already like vIOMMU and vfio
> and pci buses - even if a new qemu supported the ordering of all these, libvirt
> still need to support old qemu binaries (and the code is already there anyway)
> and it's fairly natural they initiate the QMP commands using the same ordering.
> 
> IMHO it means ordering for QMP is not as important as cmdline if that's always
> initiated by another software.

PS:
If I'm not wrong, we are slowly working towards to composing machine
from QMP and ideally CLI becoming a shim on top of that. Hence the reason,
QMP is mentioned in this thread and desire to avoid more magic.


> > What could work for both cases is explicit dependencies,
> > however it would be hard to describe such dependency in this case,
> > where device can work both with and without IOMMU depending
> > on the bus settings it's attached to.
> > 
> > Have you considered another approach, i.e. instead of reordering,
> > change vfio-pci device model to reconfigure DMA address space
> > after realize time (ex: at reset time)?  
> 
> Yes, I agree this seems to be the cleanest appproach.  It may just need more
> changes and they'll be on vfio, and I'm not aware of the rest (Jason should
> know better on virtio/vdpa).

It's also a bit more closer "to real world", where IOMMU dependency is
configured by firmware/OS. In addition it doesn't require any machine
specific code, a device checks if its parent bus is managed by IOMMU
and it is configured accordingly to that.
 
> The other thing is some dependency cannot be resolved by this, e.g., the pci
> bus issue where we put the pci bus to be after the device that it owns.  But
> indeed we're already early-fail that now so it seems ok.
> 
> Side note: from my gut feeling I still think at some point we shouldn't do the
> early-failure for cases in the case of pci bus and device - the cmdline
> obviously contains enough information on the dependency on "this pci device
> needs that pci bus", and early-fail does seem to be an work-around to me just
> because they specified in the wrong order.
That's how QEMU CLI works most of the time (i.e. left to right order of
initialization) where it errors out on offending CLI option,
and tells user to fix it instead of trying to fixup CLI order.
So I think current pci_bus behavior does align with that.

PS:
Another, albeit machine depended approach to resolve IOMMU ordering problem
can be adding to a specific machine  pre_plug hook, an IOMMU handling.
Which is called during IOMMU realize time and check if existing buses
without bypass enabled (iommu managed) have any children. And if they
have devices attached, error out telling user to reorder '-device iommu'
before affected devices/bus.
It should cover mixed IOMMU+bypass case and doesn't require fixing
vfio-pci address space initialization nor defining any priorities
for PCI devices.

(but I think it's more a hack compared earlier suggested
address space initialization at reset time, and it would need to be
done for every affected machine)

> Thanks,
> 


