Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37075139AC
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:23:04 +0200 (CEST)
Received: from localhost ([::1]:54764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6v0-00045p-IU
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nk6sh-0002I7-CY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nk6sd-00005G-It
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651162834;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=w6jTMRTmocpg1Nvgw3o/2tbVC8SGMp40x4ChFwEWYcw=;
 b=JSvZXxcMilJaUF8BoiE/IQk2RbCcn1/eryvc7E29gWtyQ1sw5xyKybGV+I7RC5BlW5QrZJ
 ErisQXatkkSyRF1a54fgJrgVS4+6qRrIaXoJnjZP6279jMixlkXw66VSaPU5ECuTe1ouTh
 WvpKdAZohoMLuRUxABY628xUWvk/mr4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-YZVfkQmuOIeu_rErbZ01qQ-1; Thu, 28 Apr 2022 12:20:30 -0400
X-MC-Unique: YZVfkQmuOIeu_rErbZ01qQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1FB1811E9B;
 Thu, 28 Apr 2022 16:20:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D062C407E1C7;
 Thu, 28 Apr 2022 16:20:26 +0000 (UTC)
Date: Thu, 28 Apr 2022 17:20:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <Ymq+x9EgSpWMYnCR@redhat.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <20220422160943.6ff4f330.alex.williamson@redhat.com>
 <YmZzhohO81z1PVKS@redhat.com>
 <20220425083748.3465c50f.alex.williamson@redhat.com>
 <BN9PR11MB5276F549912E03553411736D8CFB9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220426102159.5ece8c1f.alex.williamson@redhat.com>
 <BN9PR11MB5276189A2A8EACFBF75B22238CFD9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20220428082448.318385ed.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220428082448.318385ed.alex.williamson@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Peng, Chao P" <chao.p.peng@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>, Laine Stump <laine@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 28, 2022 at 08:24:48AM -0600, Alex Williamson wrote:
> On Thu, 28 Apr 2022 03:21:45 +0000
> "Tian, Kevin" <kevin.tian@intel.com> wrote:
> 
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Wednesday, April 27, 2022 12:22 AM  
> > > > >
> > > > > My expectation would be that libvirt uses:
> > > > >
> > > > >  -object iommufd,id=iommufd0,fd=NNN
> > > > >  -device vfio-pci,fd=MMM,iommufd=iommufd0
> > > > >
> > > > > Whereas simple QEMU command line would be:
> > > > >
> > > > >  -object iommufd,id=iommufd0
> > > > >  -device vfio-pci,iommufd=iommufd0,host=0000:02:00.0
> > > > >
> > > > > The iommufd object would open /dev/iommufd itself.  Creating an
> > > > > implicit iommufd object is someone problematic because one of the
> > > > > things I forgot to highlight in my previous description is that the
> > > > > iommufd object is meant to be shared across not only various vfio
> > > > > devices (platform, ccw, ap, nvme, etc), but also across subsystems, ex.
> > > > > vdpa.  
> > > >
> > > > Out of curiosity - in concept one iommufd is sufficient to support all
> > > > ioas requirements across subsystems while having multiple iommufd's
> > > > instead lose the benefit of centralized accounting. The latter will also
> > > > cause some trouble when we start virtualizing ENQCMD which requires
> > > > VM-wide PASID virtualization thus further needs to share that
> > > > information across iommufd's. Not unsolvable but really no gain by
> > > > adding such complexity. So I'm curious whether Qemu provide
> > > > a way to restrict that certain object type can only have one instance
> > > > to discourage such multi-iommufd attempt?  
> > > 
> > > I don't see any reason for QEMU to restrict iommufd objects.  The QEMU
> > > philosophy seems to be to let users create whatever configuration they
> > > want.  For libvirt though, the assumption would be that a single
> > > iommufd object can be used across subsystems, so libvirt would never
> > > automatically create multiple objects.  
> > 
> > I like the flexibility what the objection approach gives in your proposal.
> > But with the said complexity in mind (with no foreseen benefit), I wonder
> 
> What's the actual complexity?  Front-end/backend splits are very common
> in QEMU.  We're making the object connection via name, why is it
> significantly more complicated to allow multiple iommufd objects?  On
> the contrary, it seems to me that we'd need to go out of our way to add
> code to block multiple iommufd objects.
> 
> > whether an alternative approach which treats iommufd as a global
> > property instead of an object is acceptable in Qemu, i.e.:
> > 
> > -iommufd on/off
> > -device vfio-pci,iommufd,[fd=MMM/host=0000:02:00.0]
> > 
> > All devices with iommufd specified then implicitly share a single iommufd
> > object within Qemu.
> 
> QEMU requires key-value pairs AFAIK, so the above doesn't work, then
> we're just back to the iommufd=on/off.
>  
> > This still allows vfio devices to be specified via fd but just requires Libvirt
> > to grant file permission on /dev/iommu. Is it a worthwhile tradeoff to be
> > considered or just not a typical way in Qemu philosophy e.g. any object
> > associated with a device must be explicitly specified?
> 
> Avoiding QEMU opening files was a significant focus of my alternate
> proposal.  Also note that we must be able to support hotplug, so we
> need to be able to dynamically add and remove the iommufd object, I
> don't see that a global property allows for that.  Implicit
> associations of devices to shared resources doesn't seem particularly
> desirable to me.  Thanks,

Adding new global properties/options is rather an anti-pattern for QEMU
these days. Using -object is the right approach. If you only want to
allow for one of them, just document this requirement. We've got other
objects which are singletons like all the confidential guest classes
for each arch.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


