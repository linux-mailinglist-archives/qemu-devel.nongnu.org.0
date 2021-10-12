Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54942A2BE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 12:58:38 +0200 (CEST)
Received: from localhost ([::1]:48970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFUT-0003ky-6m
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 06:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maF4u-00050X-Dw
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maF4p-0005AB-AT
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:32:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634034725;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2CfvhTvaFR8DXj4UsvvZLpGjYF00QztWvN84rWyvDGI=;
 b=XcNTICi1mFaHFf5QqeBKZLbwPDUTXHF6KSnBBL/A5bj7z6BzCyW6EHPAkJ/MAEKP4ce/y1
 5b7tg+6ogNh8Vp8S3O4HK/adf7jtIZH8B3vdBwlibcI6Pc3Vv5eNz+o7+RZnfCVYmywB7h
 kC59nIycJLW5wY1jHZj9qwR5zlrEaSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-FEpMRNOuMI2gQUToohzoIw-1; Tue, 12 Oct 2021 06:32:04 -0400
X-MC-Unique: FEpMRNOuMI2gQUToohzoIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C07C80158D;
 Tue, 12 Oct 2021 10:32:03 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 087FA1972D;
 Tue, 12 Oct 2021 10:31:58 +0000 (UTC)
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
To: Igor Mammedov <imammedo@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com> <20211012114016.6f4a0c10@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
Date: Tue, 12 Oct 2021 21:31:55 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211012114016.6f4a0c10@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 10/12/21 8:40 PM, Igor Mammedov wrote:
> On Wed,  6 Oct 2021 18:22:08 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The following option is used to specify the distance map. It's
>> possible the option isn't provided by user. In this case, the
>> distance map isn't populated and exposed to platform. On the
>> other hand, the empty NUMA node, where no memory resides, is
>> allowed on ARM64 virt platform. For these empty NUMA nodes,
>> their corresponding device-tree nodes aren't populated, but
>> their NUMA IDs should be included in the "/distance-map"
>> device-tree node, so that kernel can probe them properly if
>> device-tree is used.
>>
>>    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>
>> So when user doesn't specify distance map, we need to generate
>> the default distance map, where the local and remote distances
>> are 10 and 20 separately. This adds an extra parameter to the
>> exiting complete_init_numa_distance() to generate the default
>> distance map for this case.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> 
> how about error-ing out if distance map is required but
> not provided by user explicitly and asking user to fix
> command line?
> 
> Reasoning behind this that defaults are hard to maintain
> and will require compat hacks and being raod blocks down
> the road.
> Approach I was taking with generic NUMA code, is deprecating
> defaults and replacing them with sanity checks, which bail
> out on incorrect configuration and ask user to correct command line.
> Hence I dislike approach taken in this patch.
> 
> If you really wish to provide default, push it out of
> generic code into ARM specific one
> (then I won't oppose it that much (I think PPC does
> some magic like this))
> Also behavior seems to be ARM specific so generic
> NUMA code isn't a place for it anyways
> 

Thanks for your comments.

Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
error-ing out will block the existing configuration where the distance
map isn't provided by user. After moving the logic to hw/arm/virt,
this patch is consistent with PATCH[02/02] and the specific platform
is affected only.


>> ---
>>   hw/core/numa.c | 13 +++++++++++--
>>   1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 510d096a88..fdb3a4aeca 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
>>       }
>>   }
>>   
>> -static void complete_init_numa_distance(MachineState *ms)
>> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
>>   {
>>       int src, dst;
>>       NodeInfo *numa_info = ms->numa_state->nodes;
>> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
>>               if (numa_info[src].distance[dst] == 0) {
>>                   if (src == dst) {
>>                       numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
>> +                } else if (is_default) {
>> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
>>                   } else {
>>                       numa_info[src].distance[dst] = numa_info[dst].distance[src];
>>                   }
>> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
>>            * A->B != distance B->A, then that means the distance table is
>>            * asymmetric. In this case, the distances for both directions
>>            * of all node pairs are required.
>> +         *
>> +         * The default node pair distances, which are 10 and 20 for the
>> +         * local and remote nodes separatly, are provided if user doesn't
>> +         * specify any node pair distances.
>>            */
>>           if (ms->numa_state->have_numa_distance) {
>>               /* Validate enough NUMA distance information was provided. */
>>               validate_numa_distance(ms);
>>   
>>               /* Validation succeeded, now fill in any missing distances. */
>> -            complete_init_numa_distance(ms);
>> +            complete_init_numa_distance(ms, false);
>> +        } else {
>> +            complete_init_numa_distance(ms, true);
>> +            ms->numa_state->have_numa_distance = true;
>>           }
>>       }
>>   }
> 

Thanks,
Gavin


