Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1395642AFE0
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 01:00:51 +0200 (CEST)
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maQlN-00042X-Ia
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 19:00:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maQk0-00030v-RW
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maQjv-00074H-ME
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 18:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634079557;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rdYQoBQDeH/Ekbl0n3VEbzfiDMzK/AslOIpjJPdEsSU=;
 b=Zdbi7aBy/IaMg2NiBl5c5R9myoGglZbEBsiD17XjNyvX0zjE4qNj7cvJ/qIWuFQ7lc2G8Y
 GPTlp4qfcVqrea3CaNIz5IgC+7nTbgHOukSoOtXdhiPrILp83uzT6lUw0cOW+l+eo5klqe
 tng8/E+lO2vzsTjuuMrdIK8onknzvPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-F09EVmqKPHGuotlDzKrYYQ-1; Tue, 12 Oct 2021 18:59:12 -0400
X-MC-Unique: F09EVmqKPHGuotlDzKrYYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0226800FF0;
 Tue, 12 Oct 2021 22:59:10 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07A5822719;
 Tue, 12 Oct 2021 22:59:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
To: Andrew Jones <drjones@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com> <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
 <20211012114802.u3og3lmei35qacpx@gator> <20211012143430.17b7ca99@redhat.com>
 <20211012130525.ubzeatio4kntidqj@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <aeb6fa39-4be8-86a8-1c87-ace34478f583@redhat.com>
Date: Wed, 13 Oct 2021 09:59:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211012130525.ubzeatio4kntidqj@gator>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew and Igor,

On 10/13/21 12:05 AM, Andrew Jones wrote:
> On Tue, Oct 12, 2021 at 02:34:30PM +0200, Igor Mammedov wrote:
>> On Tue, 12 Oct 2021 13:48:02 +0200
>>> On Tue, Oct 12, 2021 at 09:31:55PM +1100, Gavin Shan wrote:
>>>> On 10/12/21 8:40 PM, Igor Mammedov wrote:
>>>>> On Wed,  6 Oct 2021 18:22:08 +0800
>>>>> Gavin Shan <gshan@redhat.com> wrote:
>>>>>    
>>>>>> The following option is used to specify the distance map. It's
>>>>>> possible the option isn't provided by user. In this case, the
>>>>>> distance map isn't populated and exposed to platform. On the
>>>>>> other hand, the empty NUMA node, where no memory resides, is
>>>>>> allowed on ARM64 virt platform. For these empty NUMA nodes,
>>>>>> their corresponding device-tree nodes aren't populated, but
>>>>>> their NUMA IDs should be included in the "/distance-map"
>>>>>> device-tree node, so that kernel can probe them properly if
>>>>>> device-tree is used.
>>>>>>
>>>>>>     -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>>>
>>>>>> So when user doesn't specify distance map, we need to generate
>>>>>> the default distance map, where the local and remote distances
>>>>>> are 10 and 20 separately. This adds an extra parameter to the
>>>>>> exiting complete_init_numa_distance() to generate the default
>>>>>> distance map for this case.
>>>>>>
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>
>>>>>
>>>>> how about error-ing out if distance map is required but
>>>>> not provided by user explicitly and asking user to fix
>>>>> command line?
>>>>>
>>>>> Reasoning behind this that defaults are hard to maintain
>>>>> and will require compat hacks and being raod blocks down
>>>>> the road.
>>>>> Approach I was taking with generic NUMA code, is deprecating
>>>>> defaults and replacing them with sanity checks, which bail
>>>>> out on incorrect configuration and ask user to correct command line.
>>>>> Hence I dislike approach taken in this patch.
>>>>>
>>>>> If you really wish to provide default, push it out of
>>>>> generic code into ARM specific one
>>>>> (then I won't oppose it that much (I think PPC does
>>>>> some magic like this))
>>>>> Also behavior seems to be ARM specific so generic
>>>>> NUMA code isn't a place for it anyways
>>>>>    
>>>>
>>>> Thanks for your comments.
>>>>
>>>> Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
>>>> error-ing out will block the existing configuration where the distance
>>>> map isn't provided by user. After moving the logic to hw/arm/virt,
>>>> this patch is consistent with PATCH[02/02] and the specific platform
>>>> is affected only.
>>>
>>> Please don't move anything NUMA DT generic to hw/arm/virt. If the spec
>>> isn't arch-specific, then the modeling shouldn't be either.
>>
>>
>>> If you want to error-out for all configs missing the distance map, then
>>> you'll need compat code.
>>
>>> If you only want to error-out for configs that
>>> have empty NUMA nodes and are missing a distance map, then you don't
>>> need compat code, because those configs never worked before anyway.
>>
>> I think memory-less configs without distance map worked for x86 just fine.
> 
> Ah, yes, we should make the condition for erroring-out be
> 
>   have-memoryless-nodes && !have-distance-map && generate-DT
> 
> ACPI only architectures, x86, don't need to care about this.
> 

Sure, I will change the code accordingly in v3. Thanks for discussing
it through with Igor :)

>>
>> After looking at this thread all over again it seems to me that using
>> distance map as a source of numa ids is a mistake.
> 
> You'll have to discuss that with Rob Herring, as that was his proposal.
> He'll expect a counterproposal though, which we don't have...
> 

However, Getting the NUMA node IDs from PCI host bridge and CPUs aren't
working out. I will explain in another thread.

Thanks,
Gavin


