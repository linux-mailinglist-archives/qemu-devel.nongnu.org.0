Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0913146D8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 04:14:10 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9JTc-0002wM-Ke
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 22:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9JSj-0002TC-3E
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9JSf-0005W6-QZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 22:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612840388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY09RZMYcKrMEPQlY50zxs9xUAWyTS4OFsVEXUukDlQ=;
 b=cwwJLpHIla9iRGqStGl1NjVmQKUyPohcwztBn8O57BDOHrDPsVVIR5Sj30EIir4k0TJqYF
 ns6o1fILBalb1Pysnd9chtTVxRSe1EhvYTM2jtfBE6952iyEAI/RkoAv5J5Wd5KBxr93C3
 Grh1vFpC1TEWmK28U/DxMhD4bwGb2sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-BmKgnYkNORS9mE_5724PmA-1; Mon, 08 Feb 2021 22:13:06 -0500
X-MC-Unique: BmKgnYkNORS9mE_5724PmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C315107ACF5;
 Tue,  9 Feb 2021 03:13:05 +0000 (UTC)
Received: from [10.72.13.32] (ovpn-13-32.pek2.redhat.com [10.72.13.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 179BB5C626;
 Tue,  9 Feb 2021 03:12:53 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Peter Xu <peterx@redhat.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <a28ba439-758e-4b5b-86d9-5008b220b106@redhat.com>
 <20210208183721.GB68242@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a5e3c11e-fa31-3013-1e7e-3b2d6193bd7b@redhat.com>
Date: Tue, 9 Feb 2021 11:12:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208183721.GB68242@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Auger Eric <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 上午2:37, Peter Xu wrote:
> On Mon, Feb 08, 2021 at 11:21:23AM +0800, Jason Wang wrote:
>
> [...]
>
>>> I'm not sure I remember it right, but we seem to have similar discussion
>>> previously on "what if the user didn't specify ats=on" - I think at that time
>>> the conclusion was that we ignore the failure since that's not a valid
>>> configuration for qemu.
>>
>> Yes, but I think I was wrong at that time.
> I can't say you're wrong - I actually still agree with you that at least
> there's a priority of things we'd do, and this one is not extremely important
> if that's not a major use case (say, if you will 100% always suggest an user to
> use ats=on for a viommu enabled vhost).


Right, but it depends on e.g how libvirt use that. As far as I know, 
they do enable ATS. But it would still an issue if libvirt want to 
support vIOMMUs other than intel.


>
>>> The other issue I'm worried is (I think I mentioned it somewhere, but just to
>>> double confirm): I'd like to make sure SMMU and virtio-iommu are the only IOMMU
>>> platform that will use vhost.
>>
>> For upstream, it won't be easy :)
> Sorry I definitely didn't make myself clear... :)
>
> To be explicit, does ppc use vhost kernel too?


I think the answer is yes.


>   Since I know at least ppc has
> its own translation unit and its iommu notifier in qemu, so I'm unsure whether
> the same patch would break ppc too, because vhost could also ignore all UNMAP
> sent by the ppc vIOMMU.


If this is true, we probably need to fix that.


>
>>
>>>     Otherwise IIUC we need to fix those vIOMMUs too.
>>
>> Right, last time I check AMD IOMMU emulation, it simply trigger device IOTLB
>> invalidation during IOTLB invalidation which looks wrong.
> I did quickly grep IOMMU_NOTIFIER_UNMAP in amd_iommu.c and saw nothing. It
> seems amd iommu is not ready for any kind of IOMMU notifiers yet.
>
> Thanks,


Right.

Thanks


>


