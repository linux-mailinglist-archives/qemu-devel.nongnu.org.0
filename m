Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194F52CAA5D
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 19:01:40 +0100 (CET)
Received: from localhost ([::1]:59950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk9y7-0007Vu-5H
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 13:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kk9dR-0001v1-5b
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:40:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kk9dM-0005Iv-Qf
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 12:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606844411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tmaW7BusmBwUBnqjl8/wvjBn3YrtTbN7RCbDd5MRSws=;
 b=CVGOhT/Y3FFN9gTCfUCYpnYqmf5sl80xLy3hRPHU2tYNF8laSR7jHXPxDaACUk8nJsrqVq
 2P/5n/TJeWzwTh87xls+XPqhwBJvoiiIdBXfV15ILOaDJE1pU4VSTmEhhX+d2r0qtyxwrS
 L9nPnISQPxaZypCqH5G0BZHosegCbDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-M8xO522BNz2r66UN7WS7LA-1; Tue, 01 Dec 2020 12:40:07 -0500
X-MC-Unique: M8xO522BNz2r66UN7WS7LA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A669818C89E5;
 Tue,  1 Dec 2020 17:40:05 +0000 (UTC)
Received: from [10.36.112.89] (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5725D6086F;
 Tue,  1 Dec 2020 17:40:04 +0000 (UTC)
Subject: Re: [RFC v7 09/26] vfio: Force nested if iommu requires it
To: Kunkun Jiang <jiangkunkun@huawei.com>
References: <c3d0f094-cffe-16c8-69fc-de7bdefc3680@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c7681a9d-3e14-a095-e03c-3857cfef02b5@redhat.com>
Date: Tue, 1 Dec 2020 18:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c3d0f094-cffe-16c8-69fc-de7bdefc3680@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org, zhukeqian1@huawei.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Kunkun,

On 11/28/20 10:01 AM, Kunkun Jiang wrote:
> Hi Eric,
>> @@ -1668,6 +1679,14 @@ static int vfio_connect_container(VFIOGroup *group, 
>> AddressSpace *as,
>>      VFIOContainer *container;
>>      int ret, fd;
>>      VFIOAddressSpace *space;
>> +    IOMMUMemoryRegion *iommu_mr;
>> +    bool nested = false;
>> +
>> +    if (as != &address_space_memory && memory_region_is_iommu(as->root)) {
>> +        iommu_mr = IOMMU_MEMORY_REGION(as->root);
>> +        memory_region_iommu_get_attr(iommu_mr, IOMMU_ATTR_VFIO_NESTED,
>> +                                     (void *)&nested);
>> +    }
>>  
>>      space = vfio_get_address_space(as);
> Is the condition "as != &address_space_memory" needed to determine whether
> a vIOMMU is in place? I think "memory_region_is_iommu(as->root)" is enough.
> 
> Looking forward to your reply.:)

Yes I think so.

Thank you for your report!

Eric
> 
> Thanks,
> 
> Kunkun Jiang
> 


