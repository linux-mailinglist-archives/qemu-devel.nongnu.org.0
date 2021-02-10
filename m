Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2987315E08
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 05:07:28 +0100 (CET)
Received: from localhost ([::1]:40984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9gml-0001h7-D9
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 23:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9glI-0001H9-J9
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 23:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l9glF-0006e7-DP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 23:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612929951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+eeJUlvc0pnXLjpnDCtbkfnnf8iLNikSvzBpTdlDUiw=;
 b=OyIMwAuOZTrkl/YAseaEhwZv1AI4dAyY12ihn6znIYBdKsGKfLTLbLuaYIcIwlhxVhWqZ4
 5k8PazjYysBfEdCqUxf/TzRyntCgg6IX3/CX2Tp4/ljQozXfWnTv2V4z0tRVgF8QpbY8Ky
 JBhFqldZ/zTBbs6z4CvGq7xKN+eJed8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-zTih6tZoOXCF8TKIDHza2g-1; Tue, 09 Feb 2021 23:05:49 -0500
X-MC-Unique: zTih6tZoOXCF8TKIDHza2g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 343C5107ACE6;
 Wed, 10 Feb 2021 04:05:48 +0000 (UTC)
Received: from [10.72.12.223] (ovpn-12-223.pek2.redhat.com [10.72.12.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1592060C4D;
 Wed, 10 Feb 2021 04:05:34 +0000 (UTC)
Subject: Re: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
To: Peter Xu <peterx@redhat.com>, "Tian, Kevin" <kevin.tian@intel.com>
References: <20210204191228.187550-1-peterx@redhat.com>
 <2382a93d-41c1-24fd-144f-87ee18171bc9@redhat.com>
 <213acf9a-d1c0-3a1d-4846-877d90fadc03@redhat.com>
 <20210205153107.GX6468@xz-x1>
 <MWHPR11MB1886DACA066190C94FD2C27F8CB09@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210207144715.GG3195@xz-x1>
 <MWHPR11MB1886766DF6F20BC4153918C08C8F9@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210208182607.GA68242@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5cfe00bd-7cc3-c1f7-8dfd-3781a289357a@redhat.com>
Date: Wed, 10 Feb 2021 12:05:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208182607.GA68242@xz-x1>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.265, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/2/9 上午2:26, Peter Xu wrote:
> Kevin,
>
> On Mon, Feb 08, 2021 at 07:03:08AM +0000, Tian, Kevin wrote:
>> It really depends on the definition of dev-iotlb in this context. To me the
>> fact that virtio-iommu needs to notify the kernel for updating split cache
>> is already sort of dev-iotlb semantics, regardless of whether it's delivered
>> through a iotlb message or dev-iotlb message in a specific implementation. 😊
> Yeah maybe it turns out that we'll just need to implement dev-iotlb for
> virtio-iommu.


Note that on top of device-IOTLB, device may choose to implement an 
IOMMU which support #PF. In this case, dev-iotlb semantic is not a must. 
(Or it can co-operate with things like ATS if driver wants)

Virtio will probably provide this feature in the future.

Thanks


>
> I am completely fine with that and I'm never against it. :) I was throwing out
> a pure question only, because I don't know the answer.
>
> My question was majorly based on the fact that dev-iotlb and iotlb messages
> really look the same; it's not obvious then whether it would always matter a
> lot when in a full emulation environment.
>
> One example is current vhost - vhost previously would work without dev-iotlb
> (ats=on) because trapping UNMAP would work too for vhost to work.  It's also
> simply because at least for VT-d the driver needs to send both one dev-iotlb
> and one (probably same) iotlb message for a single page invalidation.  The
> dev-iotlb won't help a lot in full emulation here but instead it slows thing
> down a little bit (QEMU has full knowledge as long as it receives either of the
> message).
>
> Thanks,
>


