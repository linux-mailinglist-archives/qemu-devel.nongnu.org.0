Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28A2585FE
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 05:06:32 +0200 (CEST)
Received: from localhost ([::1]:49952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCwcx-0007KK-CW
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 23:06:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwcE-0006ug-E2
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 23:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1kCwcA-0006g7-Cy
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 23:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598929540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Fyn0gCjam4nARPV+CwlT19Ra7/wDQ8icSa/O1xGo8o=;
 b=ggp1qC5r1NQsq2cVdCILT3OXdwTLogObBtDeOuHCgfETzrn92IGXnmV/ozKDrid1G70Inf
 0JHmjsSxXNgUmqzGb3AHJHpK4t9kNATujoT+zNrKzn6bdY0HECAdTRQXa1NpYywgK7xWEZ
 /+vCo1V848xtf/Knrjp+NNDUkCvo13g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-47u1nec9Nh66m8cO90jTSg-1; Mon, 31 Aug 2020 23:05:38 -0400
X-MC-Unique: 47u1nec9Nh66m8cO90jTSg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB4310054FF;
 Tue,  1 Sep 2020 03:05:37 +0000 (UTC)
Received: from [10.72.13.164] (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 830D81002D40;
 Tue,  1 Sep 2020 03:05:22 +0000 (UTC)
Subject: Re: [RFC v3 1/1] memory: Skip bad range assertion if notifier
 supports arbitrary masks
To: Peter Xu <peterx@redhat.com>
References: <20200626064122.9252-1-eperezma@redhat.com>
 <20200811175533.7359-1-eperezma@redhat.com>
 <20200811175533.7359-2-eperezma@redhat.com>
 <2443886f-2109-e048-b47f-886c896613ab@redhat.com>
 <CAJaqyWe0_wcXHgbAVAVNCTpG7O4YKF6FMkgKsf6SfW4dEZ4A5g@mail.gmail.com>
 <CAJaqyWe+KgnVegtprpRmVvXo7kFVFDL_erK_5Nyp4K=gTUcN=Q@mail.gmail.com>
 <eb26c5d7-465a-34ed-3f8f-bad11eda5bee@redhat.com>
 <20200819155051.GA275003@xz-x1>
 <f010e8c0-6713-a2bc-ce6b-98af5e4638be@redhat.com>
 <20200821141250.GC358043@xz-x1>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5e06e59d-7810-6863-20c7-d1660099cc51@redhat.com>
Date: Tue, 1 Sep 2020 11:05:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200821141250.GC358043@xz-x1>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:05:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, Eugenio Perez Martin <eperezma@redhat.com>,
 Avi Kivity <avi@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/8/21 下午10:12, Peter Xu wrote:
> On Thu, Aug 20, 2020 at 10:28:00AM +0800, Jason Wang wrote:
>> On 2020/8/19 下午11:50, Peter Xu wrote:
>>> On Wed, Aug 19, 2020 at 03:15:26PM +0800, Jason Wang wrote:
>>>> Yes, actually, I feel confused after reading the codes. Is notifier->start
>>>> IOVA or GPA?
>>>>
>>>> In vfio.c, we did:
>>>>
>>>>           iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
>>>>                               IOMMU_NOTIFIER_ALL,
>>>>                               section->offset_within_region,
>>>>                               int128_get64(llend),
>>>>                               iommu_idx);
>>>>
>>>> So it looks to me the start and end are GPA, but the assertion above check
>>>> it against IOVA which seems to be wrong ....
>>> It should be iova; both section->offset_within_region and llend are for the
>>> device's iova address space.  Thanks,
>>>
>> Interesting, how can memory region know which IOVA is used by guest?
> Does it need to know? :)
>
> AFAICT what we do here is only register with the whole possible IOVA address
> space (e.g., across the whole 64bit address space).  Then vfio will get
> notifications when there're new iova ranges mapped into it.


Right, but the whole IOVA address space should be something vIOMMU 
specific, e.g for Intel it should be calculated by GAW, but I found:

         memory_region_init_iommu(&vtd_dev_as->iommu, 
sizeof(vtd_dev_as->iommu),
                                  TYPE_INTEL_IOMMU_MEMORY_REGION, OBJECT(s),
                                  name, UINT64_MAX);

which assumes UINT64_MAX.

Thanks



>


