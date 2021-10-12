Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFE1429D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:14:28 +0200 (CEST)
Received: from localhost ([::1]:34506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maB3T-0000H9-SZ
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maB2S-0007m7-6i
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1maB2N-0005jS-W5
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634019197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqNJFCranloYqu6sKB4zkZLNaH+lIU2x2TS1zNgYlps=;
 b=f5T0BTnzWP8VAMzCtfajEpAq5ET81JTN7ES8iXVr3sjT+bDz8r+bXygN3PdAydMkvDYpZe
 Vk1AACLV63B+2yxXXgwkCMygewxmDffmpPQ26G2xKVXIsIrXsB1Esy7vW9H5l8ywynmfpr
 OlDKpoPsVQ3qYrseG9u5SOelrD+PDA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-SnoSwnPfPBCzJfZPFaI9HA-1; Tue, 12 Oct 2021 02:13:13 -0400
X-MC-Unique: SnoSwnPfPBCzJfZPFaI9HA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8682410144E8;
 Tue, 12 Oct 2021 06:13:12 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF7419C79;
 Tue, 12 Oct 2021 06:13:09 +0000 (UTC)
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
To: Andrew Jones <drjones@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211006103529.25vjtmkmijmomq4u@gator.home>
 <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
 <20211006115643.p5b2qcoi4eagluqc@gator.home>
 <9e51e29e-8792-18e7-7b38-68af15a3fdf5@redhat.com>
 <20211008060723.i7wxmuzi5g25r42n@gator.home>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0b46d9c2-1c3b-ab71-5a78-e602eadc5539@redhat.com>
Date: Tue, 12 Oct 2021 17:13:06 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211008060723.i7wxmuzi5g25r42n@gator.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 10/8/21 5:07 PM, Andrew Jones wrote:
> On Fri, Oct 08, 2021 at 10:51:24AM +1100, Gavin Shan wrote:
>> On 10/6/21 10:56 PM, Andrew Jones wrote:
>>> On Wed, Oct 06, 2021 at 10:03:25PM +1100, Gavin Shan wrote:
>>>> On 10/6/21 9:35 PM, Andrew Jones wrote:
>>>>> On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
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
>>>>>>      -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>>>
>>>>>> So when user doesn't specify distance map, we need to generate
>>>>>> the default distance map, where the local and remote distances
>>>>>> are 10 and 20 separately. This adds an extra parameter to the
>>>>>> exiting complete_init_numa_distance() to generate the default
>>>>>> distance map for this case.
>>>>>>
>>>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>>>> ---
>>>>>>     hw/core/numa.c | 13 +++++++++++--
>>>>>>     1 file changed, 11 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>>>>>> index 510d096a88..fdb3a4aeca 100644
>>>>>> --- a/hw/core/numa.c
>>>>>> +++ b/hw/core/numa.c
>>>>>> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
>>>>>>         }
>>>>>>     }
>>>>>> -static void complete_init_numa_distance(MachineState *ms)
>>>>>> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
>>>>>>     {
>>>>>>         int src, dst;
>>>>>>         NodeInfo *numa_info = ms->numa_state->nodes;
>>>>>> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
>>>>>>                 if (numa_info[src].distance[dst] == 0) {
>>>>>>                     if (src == dst) {
>>>>>>                         numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
>>>>>> +                } else if (is_default) {
>>>>>> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
>>>>>>                     } else {
>>>>>>                         numa_info[src].distance[dst] = numa_info[dst].distance[src];
>>>>>>                     }
>>>>>> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
>>>>>>              * A->B != distance B->A, then that means the distance table is
>>>>>>              * asymmetric. In this case, the distances for both directions
>>>>>>              * of all node pairs are required.
>>>>>> +         *
>>>>>> +         * The default node pair distances, which are 10 and 20 for the
>>>>>> +         * local and remote nodes separatly, are provided if user doesn't
>>>>>> +         * specify any node pair distances.
>>>>>>              */
>>>>>>             if (ms->numa_state->have_numa_distance) {
>>>>>>                 /* Validate enough NUMA distance information was provided. */
>>>>>>                 validate_numa_distance(ms);
>>>>>>                 /* Validation succeeded, now fill in any missing distances. */
>>>>>> -            complete_init_numa_distance(ms);
>>>>>> +            complete_init_numa_distance(ms, false);
>>>>>> +        } else {
>>>>>> +            complete_init_numa_distance(ms, true);
>>>>>> +            ms->numa_state->have_numa_distance = true;
>>>>>>             }
>>>>>>         }
>>>>>>     }
>>>>>> -- 
>>>>>> 2.23.0
>>>>>>
>>>>>
>>>>> With this patch we'll always generate a distance map when there's a numa
>>>>> config now. Is there any reason a user would not want to do that? I.e.
>>>>> should we still give the user the choice of presenting a distance map?
>>>>> Also, does the addition of a distance map in DTs for compat machine types
>>>>> matter?
>>>>>
>>>>> Otherwise patch looks good to me.
>>>>>
>>>>
>>>> Users needn't specify the distance map when the default one in kernel,
>>>> whose distances are 10 and 20 for local and remote nodes in linux for
>>>> all architectures and machines, is used. The following option is still
>>>> usable to specify the distance map.
>>>>
>>>>     -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>
>>>> When the empty NUMA nodes are concerned, the distance map is mandatory
>>>> because their NUMA IDs are identified from there. So we always generate
>>>> the distance map as this patch does :)
>>>>
>>>
>>> Yup, I knew all that already :-) I'm asking if we want to ensure the user
>>> can still control whether or not this distance map is generated at all. If
>>> a user doesn't want empty numa nodes or a distance map, then, with this
>>> patch, they cannot avoid the map's generation. That configurability
>>> question also relates to machine compatibility. Do we want to start
>>> generating this distance map on old, numa configured machine types? This
>>> patch will do that too.
>>>
>>> But, it might be OK to just start generating this new DT node for all numa
>>> configured machine types and not allow the user to opt out. I do know that
>>> we allow hardware descriptions to be changed without compat code.  Also, a
>>> disable-auto-distance-map option may be considered useless and therefore
>>> not worth maintaining. The conservative in me says it's worth debating
>>> these things first though.
>>>
>>> (Note, empty numa nodes have never worked with QEMU, so it's OK to start
>>>    erroring out when empty numa nodes and a disable-auto-distance-map option
>>>    are given together.)
>>>
>>
>> Sorry for the delay. I didn't fully understand "machine compatibility" even
>> after checking the code around. Could you please provide more details? I'm
>> not sure if the enforced distance-map for empty NUMA nodes will cause any
>> issues?
> 
> On QEMU, currently booting/running VMs on machine type X should not notice
> when QEMU has been updated and they are still boot with machine type X.
> That's what the "compat machine types" stuff means and what I'm referring
> to above. I think it may be fine to boot a VM that never had a
> distance-map before on an updated QEMU with machine type X and suddenly
> get a distance-map, because we claim this is similar to a firmware update
> that will change hardware descriptions on reboot. We expect guest kernels
> to be tolerant of that. That said, there's always some risk, so we need
> to consciously make that decision. Also, if we choose to expose a switch
> to disable to the auto-distance-map to the user, then it's pretty trivial
> to automatically set that on older machine types in order to avoid the
> concern. So, do we think we need to expose a disable-auto-distance-map
> type of option? Or would that be a useless burden? Also, if the decision
> is to not worry about it, then the commit message should be updated to
> add the rationale for that decision.
> 
>>
>> Yes, the empty NUMA node never worked with QEMU if device-tree is used.
>> We still need to figure out a way to support memory hotplug through
>> device-tree, similar thing as to what IBM's pSeries platform has.
> 
> That's for the guest kernel to figure out. I doubt it'll be a high
> priority, though, because, as you've shown below, memory hotplug works
> with ACPI, which is what Arm servers use. I don't expect smaller DT
> platforms to care much about memory hotplug.
> 

[...]

Thanks for the detailed explanation about the compatible machine type
issue. I don't think we need to introduce the switch to disable the
distance map as I think the guest is tolerant in this case: There
are two cases for machine type X to boot when distance map is missed.
The distance map is either not parsed or expected to be correct and
complete. If we provide correct and complete (default) distance map,
the machine type X won't be affected. So I will amend the changelog
to explain why we needn't the switch in v2, to be posted shortly.

Yup, It's different topic to support memory hotplug device-tree. I
agree it's not urgent to support it as ACPI is required or event
mandatory to boot Linux ARM64 servers. The embedded systems would
be different, but people might be not concerned to memory hotplug
on embedded systems.

Thanks,
Gavin


