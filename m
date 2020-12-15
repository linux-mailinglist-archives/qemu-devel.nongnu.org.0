Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6622DA92C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 09:30:52 +0100 (CET)
Received: from localhost ([::1]:37598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp5jP-0004vI-En
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 03:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kp5g8-0003UA-JE
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:27:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kp5g2-0006e6-Sp
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 03:27:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608020842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFUqRgF+mlVd3aF0yY5lFKJdOEq8SaK9TJQHcJuy4wI=;
 b=GTIHD+/h3sbXVGL9PrjjbLZ2DBJ4LPgK87TQ+V5EUyjPrhHHDDROP582q79MS+cWgBhWpI
 7GZDtS+l5n8yK2GBwH84URAihaqoNkR9bWepDhFJssLWmwzBWCw9gmGMRhaiKNRQXKrX5e
 mEcWahNbFUzaETrCZjMfPcjz3vGoTEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-xwuUW-5AN2mgGizcuLiCvg-1; Tue, 15 Dec 2020 03:27:19 -0500
X-MC-Unique: xwuUW-5AN2mgGizcuLiCvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A080B802B53;
 Tue, 15 Dec 2020 08:27:17 +0000 (UTC)
Received: from gondolin (ovpn-114-220.ams2.redhat.com [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E7E81042A95;
 Tue, 15 Dec 2020 08:26:58 +0000 (UTC)
Date: Tue, 15 Dec 2020 09:26:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201215092656.1b95e030.cohuck@redhat.com>
In-Reply-To: <f8c4f54b-3439-1c35-2b2e-c9dae0f5241c@de.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
 <20201110114015.1ba4cdac.pasic@linux.ibm.com>
 <f8c4f54b-3439-1c35-2b2e-c9dae0f5241c@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 14:18:39 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 10.11.20 11:40, Halil Pasic wrote:
> > On Tue, 10 Nov 2020 09:47:51 +0100
> > Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> >   
> >>
> >>
> >> On 09.11.20 19:53, Halil Pasic wrote:  
> >>> On Mon, 9 Nov 2020 17:06:16 +0100
> >>> Cornelia Huck <cohuck@redhat.com> wrote:
> >>>  
> >>>>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
> >>>>>  {
> >>>>>      VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
> >>>>>      DeviceState *vdev = DEVICE(&dev->vdev);
> >>>>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
> >>>>> +
> >>>>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
> >>>>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
> >>>>> +    }    
> >>>>
> >>>> I would like to have a comment explaining the numbers here, however.
> >>>>
> >>>> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
> >>>> possible, apply some other capping). 4 seems to be a bit arbitrary
> >>>> without explanation, although I'm sure you did some measurements :)  
> >>>
> >>> Frankly, I don't have any measurements yet. For the secure case,
> >>> I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
> >>> the cc list. @Mimu can you help us out.
> >>>
> >>> Regarding the normal non-protected VMs I'm in a middle of producing some
> >>> measurement data. This was admittedly a bit rushed because of where we
> >>> are in the cycle. Sorry to disappoint you.
> >>>
> >>> The number 4 was suggested by Christian, maybe Christian does have some
> >>> readily available measurement data for the normal VM case. @Christian:
> >>> can you help me out?  
> >> My point was to find a balance between performance gain and memory usage.
> >> As a matter of fact, virtqueue do consume memory. So 4 looked like a
> >> reasonable default for me for large guests as long as we do not have directed
> >> interrupts.
> >>
> >> Now, thinking about this again: If we want to change the default to something
> >> else in the future (e.g. to num vcpus) then the compat handling will get
> >> really complicated.  
> > 
> > Regarding compat handling, I believe we would need a new property for
> > virtio-blk-ccw: something like def_num_queues_max. Then logic would
> > morph to MIN(def_num_queues_max, current_machine->smp.cpus), and we could
> > relatively freely do compat stuff on def_num_queues_max.
> > 
> > IMHO not pretty but certainly doable.
> >   
> >>
> >> So we can
> >> - go with num queues = num cpus. But this will consume memory
> >> for guests with lots of CPUs.  
> > 
> > In absence of data that showcases the benefit outweighing the obvious
> > detriment, I lean towards finding this option the least favorable.
> >   
> >> - go with the proposed logic of min(4,vcpus) and accept that future compat handling
> >> is harder  
> > 
> > IMHO not a bad option, but I think I would still feel better about a
> > more informed decision. In the end, the end user can already specify the
> > num_queues explicitly, so I don't think this is urgent.
> >   
> >> - defer this change  
> > 
> > So I tend to lean towards deferring.  
> 
> Yes, I was pushing this for 5.2 to avoid compat handling. But maybe it is better
> to wait and do it later. But we should certainly continue the discussion to have
> something for the next release.

<going through older mails>

Do we have a better idea now about which values would make sense here?

> 
> > 
> > Another thought is, provided the load is about evenly spread on the
> > different virtqueues, if the game is about vCPU locality, one could
> > think of decreasing the size of each individual virtqueue while
> > increasing their number, with the idea of not paying much more in terms
> > of memory. The queue size however needs to be a power of 2,
> > so there is a limit on the granularity.
> > 
> > Regarding secure VMs, currently we have to cramp at least the swiotlb and
> > the virtqueues into ZONE_DMA. So increasing the number of
> > virtqueues heavily may get us into new trouble with exotic configs.
> > 
> > Regards,
> > Halil
> >   
> 


