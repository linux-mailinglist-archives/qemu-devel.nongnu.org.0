Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973242AD353
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:18:11 +0100 (CET)
Received: from localhost ([::1]:48964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcQj4-0005Ql-5t
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcQiI-0004w9-Re
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcQiH-0001wA-1j
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605003440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZt0x+HV0maK4vw8aVkC2Iyy+4rD9VM6Q15KcLgLyic=;
 b=jPs7X3s3jM5vHCQOD6uDyDOzlR3kH54kriRP1d3rHl5c1dfGbYEE0MYhbj5DvEAeqEYKx+
 DBCFSxX6CY2B2NYH/PrYUY2gGAyOOHZXnXvOMAGJTfnacNxyAXW6WoZEnTYpYfp2s3sU2M
 9q7C+/RNZQQdWNpoNS0kDNFJc4rpTBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-9xwv-n_nPv2YDcjcf4xVjA-1; Tue, 10 Nov 2020 05:17:18 -0500
X-MC-Unique: 9xwv-n_nPv2YDcjcf4xVjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 038D0106B201;
 Tue, 10 Nov 2020 10:17:17 +0000 (UTC)
Received: from gondolin (ovpn-112-243.ams2.redhat.com [10.36.112.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA085C1C4;
 Tue, 10 Nov 2020 10:17:08 +0000 (UTC)
Date: Tue, 10 Nov 2020 11:15:14 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH 1/1] virtio-blk-ccw: tweak the default for num_queues
Message-ID: <20201110111514.44ea55c2.cohuck@redhat.com>
In-Reply-To: <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
References: <20201109154831.20779-1-pasic@linux.ibm.com>
 <20201109170616.6875f610.cohuck@redhat.com>
 <20201109195303.459f6fba.pasic@linux.ibm.com>
 <0a6d17ce-ed7f-98e8-2937-f266bb4f0f5a@de.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org,
 Michael Mueller <mimu@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 09:47:51 +0100
Christian Borntraeger <borntraeger@de.ibm.com> wrote:

> On 09.11.20 19:53, Halil Pasic wrote:
> > On Mon, 9 Nov 2020 17:06:16 +0100
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >   
> >>> @@ -20,6 +21,11 @@ static void virtio_ccw_blk_realize(VirtioCcwDevice *ccw_dev, Error **errp)
> >>>  {
> >>>      VirtIOBlkCcw *dev = VIRTIO_BLK_CCW(ccw_dev);
> >>>      DeviceState *vdev = DEVICE(&dev->vdev);
> >>> +    VirtIOBlkConf *conf = &dev->vdev.conf;
> >>> +
> >>> +    if (conf->num_queues == VIRTIO_BLK_AUTO_NUM_QUEUES) {
> >>> +        conf->num_queues = MIN(4, current_machine->smp.cpus);
> >>> +    }    
> >>
> >> I would like to have a comment explaining the numbers here, however.
> >>
> >> virtio-pci has a pretty good explanation (use 1:1 for vqs:vcpus if
> >> possible, apply some other capping). 4 seems to be a bit arbitrary
> >> without explanation, although I'm sure you did some measurements :)  
> > 
> > Frankly, I don't have any measurements yet. For the secure case,
> > I think Mimu has assessed the impact of multiqueue, hence adding Mimu to
> > the cc list. @Mimu can you help us out.
> > 
> > Regarding the normal non-protected VMs I'm in a middle of producing some
> > measurement data. This was admittedly a bit rushed because of where we
> > are in the cycle. Sorry to disappoint you.
> > 
> > The number 4 was suggested by Christian, maybe Christian does have some
> > readily available measurement data for the normal VM case. @Christian:
> > can you help me out?  
> My point was to find a balance between performance gain and memory usage.
> As a matter of fact, virtqueue do consume memory. So 4 looked like a
> reasonable default for me for large guests as long as we do not have directed
> interrupts.

Yes, 4 does not look like a bad number, but I still don't feel really
comfortable with it without at least some data.

What about large guests with slow vs. fast storage?

> 
> Now, thinking about this again: If we want to change the default to something
> else in the future (e.g. to num vcpus) then the compat handling will get
> really complicated.

Yes, I fear that will be messy. Just picking a value later will need
compat handling, but not a really complicated one.

> 
> So we can
> - go with num queues = num cpus. But this will consume memory
> for guests with lots of CPUs.

I'm not sure that would be a good choice, as we don't have the benefits
that pci has.

> - go with the proposed logic of min(4,vcpus) and accept that future compat handling
> is harder

With a bit more data, I'd be way more comfortable. Might still be ok
for the next rc.

> - defer this change

We might end up with that, given the timing :( (not blaming anyone)


