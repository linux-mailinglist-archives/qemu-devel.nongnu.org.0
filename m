Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C448E31298C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:52:42 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xbN-0007ei-RH
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8x7O-0000mY-10
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:21:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l8x7M-00027B-6X
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612754499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qv69JfbfJKwrqwV6uPjgBAsQVMspL9CgKmtOZFZjKR4=;
 b=X0DerF8CncJ0PxJcXzZkX4gP0LDCYRSy6EPDwZm6jO8UyYWaTjaT8psfLyTgUt5PZyb+ao
 Ma3GoRxfc9ewR7kuj4zVzGKim+DJtIxPNr0N/9f6qpWebv3xmLAfShLa2WOrHLA5uZjNOL
 muxwd3hDdChY5axd8vSkLgA6Ahck6DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-HQfcsMARNom4KA0sYOpp3w-1; Sun, 07 Feb 2021 22:21:37 -0500
X-MC-Unique: HQfcsMARNom4KA0sYOpp3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FE8E192AB78;
 Mon,  8 Feb 2021 03:21:36 +0000 (UTC)
Received: from [10.72.13.185] (ovpn-13-185.pek2.redhat.com [10.72.13.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 128806F98A;
 Mon,  8 Feb 2021 03:21:24 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Peter Xu <peterx@redhat.com>, Auger Eric <eric.auger@redhat.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
Date: Mon, 8 Feb 2021 11:21:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205153107.GX6468@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Jean-Philippe Brucker <Jean-Philippe.Brucker@arm.com>,
 Eugenio Perez Martin <eperezma@redhat.com>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/5 下午11:31, Peter Xu wrote:
> On Fri, Feb 05, 2021 at 09:33:29AM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 2/5/21 4:16 AM, Jason Wang wrote:
>>> On 2021/2/5 上午3:12, Peter Xu wrote:
>>>> Previous work on dev-iotlb message broke vhost on either SMMU
>>>
>>> Have a quick git grep and it looks to me v3 support ATS and have command
>>> for device iotlb (ATC) invalidation.
>>
>> Yes I will do that. Should not be a big deal.
> Great, thanks.
>
>>>
>>>> or virtio-iommu
>>>> since dev-iotlb (or PCIe ATS)
>>>
>>> We may need to add this in the future.
>> added Jean-Philippe in CC
> So that's the part I'm unsure about..  Since everybody is cced so maybe good
> time to ask. :)
>
> The thing is I'm still not clear on whether dev-iotlb is useful for a full
> emulation environment and how that should differ from a normal iotlb, since
> after all normal iotlb will be attached with device information too.


I think vhost is a good example with device IOTLB? It solves the issue 
exactly the bottleneck of a centralized IOTLB when everything is cached 
in the vhost.


>
> For real hardwares, they make sense because they ask for two things: iotlb is
> for IOMMU, but dev-iotlb is for the device cache.  For emulation environment
> (virtio-iommu is the case) do we really need that complexity?


I think the answer is yes it virtio-iommu is the only choice for some 
platform/archs.


>
> Note that even if there're assigned devices under virtio-iommu in the future,
> we can still isolate that and iiuc we can easily convert an iotlb (from
> virtio-iommu) into a hardware IOMMU dev-iotlb no matter what type of IOMMU is
> underneath the vIOMMU.


Looks like another topic (e.g if we need to expose ATS to guest for 
assigned device)?


>
>>>
>>>> is not yet supported for those archs.
>>>
>>> Rethink about this, it looks to me the point is that we should make
>>> vhost work when ATS is disabled like what ATS spec defined:
>>>
>>> """
>>>
>>> ATS is enabled through a new Capability and associated configuration
>>> structure.  To enable 15 ATS, software must detect this Capability and
>>> enable the Function to issue ATS TLP.  If a Function is not enabled, the
>>> Function is required not to issue ATS Translation Requests and is
>>> required to issue all DMA Read and Write Requests with the TLP AT field
>>> set to “untranslated.”
>>>
>>> """
>>>
>>> Maybe we can add this in the commit log.
> I saw Michael was super fast on handling this patch and already got it in a
> pull, so I may not directly post a new version.  But I'll add it if I'll post a
> new version.
>
> [...]


Right.


>
>>> Patch looks good. I wonder whether we should fix intel when ATS is
>>> disabled.
>> good point
> I'm not sure I remember it right, but we seem to have similar discussion
> previously on "what if the user didn't specify ats=on" - I think at that time
> the conclusion was that we ignore the failure since that's not a valid
> configuration for qemu.


Yes, but I think I was wrong at that time.


>
> But I agree it would be nicer to be able to fallback.


So see my reply quoted from ATS spec. My understanding is that the 
device should behave correctly if ATS is disabled.


>
> The other issue I'm worried is (I think I mentioned it somewhere, but just to
> double confirm): I'd like to make sure SMMU and virtio-iommu are the only IOMMU
> platform that will use vhost.


For upstream, it won't be easy :)


>    Otherwise IIUC we need to fix those vIOMMUs too.


Right, last time I check AMD IOMMU emulation, it simply trigger device 
IOTLB invalidation during IOTLB invalidation which looks wrong.

Thanks


>
> Thanks,
>


