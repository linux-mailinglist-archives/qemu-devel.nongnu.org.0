Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id C830A1CA41F
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 08:35:44 +0200 (CEST)
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWwbn-0001OO-S7
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 02:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWwaV-00008A-SC
 for qemu-devel@nongnu.org; Fri, 08 May 2020 02:34:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30046
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jWwaU-000833-BC
 for qemu-devel@nongnu.org; Fri, 08 May 2020 02:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588919661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znyt2gmWunAyhQ/YOcaWlSQ+KmrrcSiMzOx8z/LLGB0=;
 b=aFRbYIaVKG7ZNF9ghS2qwUkIiI+BE8xCTEETSIF9ZMAHVr5A3uyZfU06HOOs/8hPM2bT9Z
 jnvdzflO1SqvBwmyc5F8W0x9AwwSeg5rralVjfBvrF6ERUxpSgIZsuVpo/L/he5aKOuFPU
 EgmYiVxp9kOlteb0uUGO0V8WcfuurtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-xFhURgpCMlepBpVp4bJ-OQ-1; Fri, 08 May 2020 02:34:20 -0400
X-MC-Unique: xFhURgpCMlepBpVp4bJ-OQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE84A1005510;
 Fri,  8 May 2020 06:34:18 +0000 (UTC)
Received: from [10.36.114.214] (ovpn-114-214.ams2.redhat.com [10.36.114.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D652605CE;
 Fri,  8 May 2020 06:34:11 +0000 (UTC)
Subject: Re: [PATCH 3/5] virtio-iommu: Handle reserved regions in the
 translation process
To: Peter Xu <peterx@redhat.com>
References: <20200507143201.31080-1-eric.auger@redhat.com>
 <20200507143201.31080-4-eric.auger@redhat.com>
 <20200507194736.GM228260@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b10251bc-e63f-a593-1a1b-5ac7b7c573ab@redhat.com>
Date: Fri, 8 May 2020 08:34:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200507194736.GM228260@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, qemu-arm@nongnu.org, jean-philippe@linaro.org,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 5/7/20 9:47 PM, Peter Xu wrote:
> Hi, Eric,
> 
> On Thu, May 07, 2020 at 04:31:59PM +0200, Eric Auger wrote:
>> @@ -640,6 +641,24 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>          goto unlock;
>>      }
>>  
>> +    for (i = 0; i < s->nb_reserved_regions; i++) {
>> +        if (interval.low >= s->reserved_regions[i].low &&
>> +            interval.low <= s->reserved_regions[i].high) {
> 
> Should this be s/low/high/?
I meant addr >= s->reserved_regions[i].low && addr <=
s->reserved_regions[i].high

We only compare a single iova against reserved range boundaries and
boundaries are inclusive
> 
> For this case (high==low+1) I guess maybe it's also easier to use "addr >= low
> && addr < high".
Yes using addr directly is definitively more readable ;-)

Thanks

Eric
> 
> Thanks,
> 
>> +            switch (s->reserved_regions[i].type) {
>> +            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
>> +                entry.perm = flag;
>> +                break;
>> +            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:
>> +            default:
>> +                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPING,
>> +                                          VIRTIO_IOMMU_FAULT_F_ADDRESS,
>> +                                          sid, addr);
>> +                break;
>> +            }
>> +            goto unlock;
>> +        }
>> +    }
>> +
>>      if (!ep->domain) {
>>          if (!bypass_allowed) {
>>              error_report_once("%s %02x:%02x.%01x not attached to any domain",
>> -- 
>> 2.20.1
>>
> 


