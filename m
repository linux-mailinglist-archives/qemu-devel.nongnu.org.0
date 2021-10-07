Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C40824260CA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 01:55:01 +0200 (CEST)
Received: from localhost ([::1]:36718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYdE4-0004t4-F0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 19:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mYdCm-00040X-O7
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 19:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mYdCi-0005gP-Kx
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 19:53:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633650814;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RJ5vUnqYcvP9fEf/+z769Tx6TSOznOl5mOAW1lWwcM=;
 b=RKXa78VKFJROZsIfoxw+DvxaphYHi6W460muLrHXZK33hKvGXW6yD1kR98A8a3WZ5j+3fG
 u9aITFPDaOKKso723Xspsxdi0F+kHR+QgwGbG09SbNn/U4WxA1bnLTVY98culSTGQTWNYO
 B9lKj/gxMX5oCIWg8vKheW3b/QF7PVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-kJ7Lx76XOdqYIysIA2OYkA-1; Thu, 07 Oct 2021 19:53:31 -0400
X-MC-Unique: kJ7Lx76XOdqYIysIA2OYkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E87BBEFA;
 Thu,  7 Oct 2021 23:51:30 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B9D26DC2;
 Thu,  7 Oct 2021 23:51:26 +0000 (UTC)
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
To: Andrew Jones <drjones@redhat.com>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211006103529.25vjtmkmijmomq4u@gator.home>
 <688560f5-19a4-7a08-41ec-132266f76725@redhat.com>
 <20211006115643.p5b2qcoi4eagluqc@gator.home>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <9e51e29e-8792-18e7-7b38-68af15a3fdf5@redhat.com>
Date: Fri, 8 Oct 2021 10:51:24 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211006115643.p5b2qcoi4eagluqc@gator.home>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Drew,

On 10/6/21 10:56 PM, Andrew Jones wrote:
> On Wed, Oct 06, 2021 at 10:03:25PM +1100, Gavin Shan wrote:
>> On 10/6/21 9:35 PM, Andrew Jones wrote:
>>> On Wed, Oct 06, 2021 at 06:22:08PM +0800, Gavin Shan wrote:
>>>> The following option is used to specify the distance map. It's
>>>> possible the option isn't provided by user. In this case, the
>>>> distance map isn't populated and exposed to platform. On the
>>>> other hand, the empty NUMA node, where no memory resides, is
>>>> allowed on ARM64 virt platform. For these empty NUMA nodes,
>>>> their corresponding device-tree nodes aren't populated, but
>>>> their NUMA IDs should be included in the "/distance-map"
>>>> device-tree node, so that kernel can probe them properly if
>>>> device-tree is used.
>>>>
>>>>     -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>>>
>>>> So when user doesn't specify distance map, we need to generate
>>>> the default distance map, where the local and remote distances
>>>> are 10 and 20 separately. This adds an extra parameter to the
>>>> exiting complete_init_numa_distance() to generate the default
>>>> distance map for this case.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/core/numa.c | 13 +++++++++++--
>>>>    1 file changed, 11 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>>>> index 510d096a88..fdb3a4aeca 100644
>>>> --- a/hw/core/numa.c
>>>> +++ b/hw/core/numa.c
>>>> @@ -594,7 +594,7 @@ static void validate_numa_distance(MachineState *ms)
>>>>        }
>>>>    }
>>>> -static void complete_init_numa_distance(MachineState *ms)
>>>> +static void complete_init_numa_distance(MachineState *ms, bool is_default)
>>>>    {
>>>>        int src, dst;
>>>>        NodeInfo *numa_info = ms->numa_state->nodes;
>>>> @@ -609,6 +609,8 @@ static void complete_init_numa_distance(MachineState *ms)
>>>>                if (numa_info[src].distance[dst] == 0) {
>>>>                    if (src == dst) {
>>>>                        numa_info[src].distance[dst] = NUMA_DISTANCE_MIN;
>>>> +                } else if (is_default) {
>>>> +                    numa_info[src].distance[dst] = NUMA_DISTANCE_DEFAULT;
>>>>                    } else {
>>>>                        numa_info[src].distance[dst] = numa_info[dst].distance[src];
>>>>                    }
>>>> @@ -716,13 +718,20 @@ void numa_complete_configuration(MachineState *ms)
>>>>             * A->B != distance B->A, then that means the distance table is
>>>>             * asymmetric. In this case, the distances for both directions
>>>>             * of all node pairs are required.
>>>> +         *
>>>> +         * The default node pair distances, which are 10 and 20 for the
>>>> +         * local and remote nodes separatly, are provided if user doesn't
>>>> +         * specify any node pair distances.
>>>>             */
>>>>            if (ms->numa_state->have_numa_distance) {
>>>>                /* Validate enough NUMA distance information was provided. */
>>>>                validate_numa_distance(ms);
>>>>                /* Validation succeeded, now fill in any missing distances. */
>>>> -            complete_init_numa_distance(ms);
>>>> +            complete_init_numa_distance(ms, false);
>>>> +        } else {
>>>> +            complete_init_numa_distance(ms, true);
>>>> +            ms->numa_state->have_numa_distance = true;
>>>>            }
>>>>        }
>>>>    }
>>>> -- 
>>>> 2.23.0
>>>>
>>>
>>> With this patch we'll always generate a distance map when there's a numa
>>> config now. Is there any reason a user would not want to do that? I.e.
>>> should we still give the user the choice of presenting a distance map?
>>> Also, does the addition of a distance map in DTs for compat machine types
>>> matter?
>>>
>>> Otherwise patch looks good to me.
>>>
>>
>> Users needn't specify the distance map when the default one in kernel,
>> whose distances are 10 and 20 for local and remote nodes in linux for
>> all architectures and machines, is used. The following option is still
>> usable to specify the distance map.
>>
>>    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
>>
>> When the empty NUMA nodes are concerned, the distance map is mandatory
>> because their NUMA IDs are identified from there. So we always generate
>> the distance map as this patch does :)
>>
> 
> Yup, I knew all that already :-) I'm asking if we want to ensure the user
> can still control whether or not this distance map is generated at all. If
> a user doesn't want empty numa nodes or a distance map, then, with this
> patch, they cannot avoid the map's generation. That configurability
> question also relates to machine compatibility. Do we want to start
> generating this distance map on old, numa configured machine types? This
> patch will do that too.
> 
> But, it might be OK to just start generating this new DT node for all numa
> configured machine types and not allow the user to opt out. I do know that
> we allow hardware descriptions to be changed without compat code.  Also, a
> disable-auto-distance-map option may be considered useless and therefore
> not worth maintaining. The conservative in me says it's worth debating
> these things first though.
> 
> (Note, empty numa nodes have never worked with QEMU, so it's OK to start
>   erroring out when empty numa nodes and a disable-auto-distance-map option
>   are given together.)
> 

Sorry for the delay. I didn't fully understand "machine compatibility" even
after checking the code around. Could you please provide more details? I'm
not sure if the enforced distance-map for empty NUMA nodes will cause any
issues?

Yes, the empty NUMA node never worked with QEMU if device-tree is used.
We still need to figure out a way to support memory hotplug through
device-tree, similar thing as to what IBM's pSeries platform has.
However, it works when ACPI table is used. Taking the following
command line as an example, the hot-added memory is always put
into the last NUMA node (3). The last NUMA node can be empty node
after changing the code to allow to export ACPI SRAT table to include
the empty NUMA nodes.

    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
    -accel kvm -machine virt,gic-version=host               \
    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
    -m 1024M,slots=16,maxmem=64G                            \
    -object memory-backend-ram,id=mem0,size=512M            \
    -object memory-backend-ram,id=mem1,size=512M            \
    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
    -numa node,nodeid=2                                     \
    -numa node,nodeid=3
      :
      :
    guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
    Node 3 MemTotal:              0 kB
    (qemu) object_add memory-backend-ram,id=hpmem0,size=1G
    (qemu) device_add pc-dimm,id=dimm1,memdev=hpmem0,node=3
    guest# cat /sys/devices/system/node/node3/meminfo | grep MemTotal
    Node 3 MemTotal:        1048576 kB

Thanks,
Gavin




