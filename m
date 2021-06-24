Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6C73B249B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 03:43:47 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwEPC-0007Wi-8T
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 21:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lwENn-0006cw-Rv
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 21:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1lwENl-0003iB-LT
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 21:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624498937;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dd6dNVoB6ZBlj/72egNbaE3t4ewvu9dQej4R1Cwj2eA=;
 b=bSv7cmCWSUG7KycmiVpexeWkfE2fKS3O+k4vJqLXbGvSWUTZUZYg5JpOcG2EgrQ5rYTmX8
 sQK/+kpkL+NYSMtv8cyg7IBRf1KS5qX1cVAXbz/0xJ9ukI3aCT+dZJaos/RukXYQJN9e3J
 rvB88YBK/2oDhcmMzRtB9chwB69pIk4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-rSzik58SOJSLDIpm40IzIA-1; Wed, 23 Jun 2021 21:42:13 -0400
X-MC-Unique: rSzik58SOJSLDIpm40IzIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0136800D55;
 Thu, 24 Jun 2021 01:42:11 +0000 (UTC)
Received: from [10.64.54.70] (vpn2-54-70.bne.redhat.com [10.64.54.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B582760871;
 Thu, 24 Jun 2021 01:42:05 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
To: Andrew Jones <drjones@redhat.com>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
 <20210602113642.axaxxgnw2haghas4@gator.home>
 <493194a5-bf72-de17-8de9-4b3556a011be@redhat.com>
 <7e9e4127-ba08-29e3-fd62-5d686baa9012@redhat.com>
 <20210622071349.ibni4btfjrb2v2p2@gator>
 <707a90ca-4a12-5813-4834-6ed5c77200b5@redhat.com>
 <20210623080736.ds6pptd7bogrxy4j@gator.home>
 <20210623081637.c7fyfxuochzlufq3@gator.home>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b5db8f45-43a6-a5b4-f24a-2fd9cdd8e0c4@redhat.com>
Date: Thu, 24 Jun 2021 13:43:34 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20210623081637.c7fyfxuochzlufq3@gator.home>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 6:16 PM, Andrew Jones wrote:
> On Wed, Jun 23, 2021 at 10:07:36AM +0200, Andrew Jones wrote:
>> On Wed, Jun 23, 2021 at 02:43:49PM +1000, Gavin Shan wrote:
>>> On 6/22/21 5:13 PM, Andrew Jones wrote:
>>>> On Tue, Jun 22, 2021 at 06:53:41PM +1000, Gavin Shan wrote:
>>>>> On 6/3/21 2:48 PM, Gavin Shan wrote:
>>>>>> On 6/2/21 9:36 PM, Andrew Jones wrote:
>>>>>>> On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
>>>>>>>> On 6/1/21 5:50 PM, Andrew Jones wrote:
>>>>>>>>> On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:

[...]

>>>>> After rethinking about it,
>>>>> I plan to fix this like this way, but please let me know if it sounds sensible
>>>>> to you.
>>>>>
>>>>> The idea is to assign a (not overlapped) dummy base address to each memory
>>>>> node in the device-tree. The dummy is (last_valid_memory_address + NUMA ID).
>>>>> The 'length' of the 'reg' property in the device-tree nodes, corresponding
>>>>> to empty NUMA nodes, is still zero. This ensures the nodes are still invalid
>>>>> until memory is added to these nodes.
>>
>> Since we don't know of any other established way to do this, then
>> proposing a solution makes sense. However, QEMU isn't the place to put it
>> first. Please write a Documentation/devicetree/bindings/ document and post
>> the patch to the kernel. If it gets accepted, then we can implement what
>> you've documented there.
>>
>> Hopefully you'll get more interest and activity on your patch than on your
>> inquiry.
> 
> Also, before posting the documentation, you may want to confirm that this
> configuration is valid for real hardware. If not, then the solution to
> this QEMU bug is to not allow this configuration.
> 

Thanks for the nice suggestion, Drew. I've posted one patch and you've
copied. The real hardware could contain empty NUMA node. For example,
all memory DIMM are removed from that node and it becomes empty :)

Lets see what feedback will be provided by device-tree guys. If they
think empty NUMA nodes are allowed. Then I will repost the patch to
use the dummy base address to avoid breaking device-tree specification
at least.

Thanks,
Gavin


