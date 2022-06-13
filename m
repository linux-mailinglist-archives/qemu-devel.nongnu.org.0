Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B854830D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 11:18:05 +0200 (CEST)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0gCx-0005Gq-Mm
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 05:18:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1o0g7R-0002pe-BC
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1o0g7P-0004lA-47
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 05:12:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655111537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Op55wPdILNVSGxib4ODB4ss9KRB81XlY0o1TgoXFizM=;
 b=BsKqAbQIPGZls7cw3MsW69DYEOaVlHQzhC0kWY5CUIIwCsCUn3dtURwjoqJGoWoj+VhfEL
 i0IfX7IFVIym60wPM7Ibh+VrLd1/S9P0R9GPUN1mOvQwXhQQ1h0HG0MmpzrBtodS/fFSJX
 TBOI6TXDDGbI9t/xxcAb/Va+cXVcEiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-Eoj-0_D1NYWCP8Oz9nPT2w-1; Mon, 13 Jun 2022 05:12:15 -0400
X-MC-Unique: Eoj-0_D1NYWCP8Oz9nPT2w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 697AA106655F;
 Mon, 13 Jun 2022 09:12:15 +0000 (UTC)
Received: from [10.72.12.21] (ovpn-12-21.pek2.redhat.com [10.72.12.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4373A492C3B;
 Mon, 13 Jun 2022 09:12:03 +0000 (UTC)
Subject: Re: [PATCH 2/3] hw/acpi/aml-build: Fix {socket, cluster, core} IDs in
 PPTT
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 ani@anisinha.ca, drjones@redhat.com, wangyanan55@huawei.com,
 Jonathan.Cameron@Huawei.com, peter.maydell@linaro.org, berrange@redhat.com,
 thuth@redhat.com, eduardo@habkost.net, lvivier@redhat.com,
 zhenyzha@redhat.com, shan.gavin@gmail.com
References: <20220518092141.1050852-1-gshan@redhat.com>
 <20220518092141.1050852-3-gshan@redhat.com>
 <20220526142512.32129b2e@redhat.com>
 <b2e11fe3-6590-ec7c-a437-7b4c2b66d359@redhat.com>
 <20220609180018.7b12a527@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <b592429f-8989-4ba7-3655-4207fcd433d2@redhat.com>
Date: Mon, 13 Jun 2022 17:11:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220609180018.7b12a527@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Igor,

On 6/10/22 12:00 AM, Igor Mammedov wrote:
> On Thu, 26 May 2022 22:40:05 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 5/26/22 8:25 PM, Igor Mammedov wrote:
>>> On Wed, 18 May 2022 17:21:40 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> The {socket, cluster, core} IDs detected from Linux guest aren't
>>>> matching with what have been provided in PPTT. The flag used for
>>>> 'ACPI Processor ID valid' is missed for {socket, cluster, core}
>>>> nodes.
>>>
>>> To permit this flag set  on no leaf nodes we have to have
>>> a corresponding containers built for them in DSDT so that
>>> 'ACPI Processor ID' could be matched with containers '_UID's.
>>> If we don not build such containers then setting this flag is
>>> not correct. And I don't recall QEMU building CPU hierarchy
>>> in DSDT.
>>>    
>>
>> It's true that we don't have containers in DSDT. In Linux implementation,
>> the corresponding IDs are fetched if 'ACPI Processor ID valid' is set in
>> PPTT node (entry), without checking DSDT table.
> 
> linux can makeup container IDs and it is fine as long as it
> does that consistently
> 

Ok. I think it's fine except that the container IDs aren't readable, because
the offset of PPTT entries are taken as the container IDs.

>> I don't know how the PPTT entry is linked to DSDT for _UID, after rechecking
>> ACPI specification. I was thinking 'Private Resources' fields are used for
>> the linking, but I should be wrong after checking PPTT tables on my host.
>> I'm not sure if you have idea how PPTT entry (node) is linked with one
>> specific device in DSDT table?
> 
> from spec description of 'ACPI Processor ID valid' flag:
> "
> For non-leaf entries in the processor topology, the ACPI Pro-
> cessor ID entry can relate to a Processor container in the
> namespace. The processor container will have a matching ID
> value returned through the _UID method. As not every pro-
> cessor hierarchy node structure in PPTT may have a matching
> processor container, this flag indicates whether the ACPI pro-
> cessor ID points to valid entry.
> "
> 
> i.e. nothing to do with private resources
> on can set this flag for a container only if there is
> a container device in DSDT with _UID matching 'ACPI Processor ID'
> in PPTT entry. Other possibility for setting this flag
> is that processor is described in MADT (which is unlikely for
> for a container)
> 

Agreed. I don't think the private resources are relevant to
the IDs. However, I don't understand how the DSDT is linked with
PPTT in regard of the container IDs.

>> On my host, one of the cluster node resides at offset 10B0h and it's ID
>> has been marked as valid. The 'Private Resources' fields point to the
>> type-1 cache structures, which resides in PPTT table either. The cluster
>> ID ('0x109') isn't appearing in DSDT table.
> 
> looks like they are cheating or spec is wrong
> 
> PS:
> one of the reasons we added PPTT table is to avoid building
> CPU topology hierarchy in DSDT.
> 

Yes, I don't think the spec is clear enough in this regard. Anyway,
I checked PPTT table on my host, where the container IDs are specified
by PPTT table entries without corresponding entries in DSDT.

>>
>> [C9Ch 3228   1]                Subtable Type : 01 [Cache Type]
>> [C9Dh 3229   1]                       Length : 18
>> [C9Eh 3230   2]                     Reserved : 0000
>> [CA0h 3232   4]        Flags (decoded below) : 0000005F
>>                                     Size valid : 1
>>                           Number of Sets valid : 1
>>                            Associativity valid : 1
>>                          Allocation Type valid : 1
>>                               Cache Type valid : 1
>>                             Write Policy valid : 0
>>                                Line Size valid : 1
>>                                 Cache ID valid : 0
>>                                  :
>>                                  :
>> [CB4h 3252   1]                Subtable Type : 01 [Cache Type]
>> [CB5h 3253   1]                       Length : 18
>> [CB6h 3254   2]                     Reserved : 0000
>> [CB8h 3256   4]        Flags (decoded below) : 0000007F
>>                                     Size valid : 1
>>                           Number of Sets valid : 1
>>                            Associativity valid : 1
>>                          Allocation Type valid : 1
>>                               Cache Type valid : 1
>>                             Write Policy valid : 1
>>                                Line Size valid : 1
>>                                 Cache ID valid : 0
>> [CBCh 3260   4]          Next Level of Cache : 00000CCC
>>                                    :
>>                                    :
>> [10B0h 4272   1]                Subtable Type : 00 [Processor Hierarchy Node]
>> [10B1h 4273   1]                       Length : 1C
>> [10B2h 4274   2]                     Reserved : 0000
>> [10B4h 4276   4]        Flags (decoded below) : 00000002
>>                               Physical package : 0
>>                        ACPI Processor ID valid : 1
>>                          Processor is a thread : 0
>>                                 Node is a leaf : 0
>>                       Identical Implementation : 0
>> [10B8h 4280   4]                       Parent : 00000C6C
>> [10BCh 4284   4]            ACPI Processor ID : 00000109
>> [10C0h 4288   4]      Private Resource Number : 00000002
>> [10C4h 4292   4]             Private Resource : 00000C9C
>> [10C8h 4296   4]             Private Resource : 00000CB4
>>
>> [gwshan@gshan tmp]$ grep -i 109 dsdt.dsl
>> [gwshan@gshan tmp]$ grep -i 265 dsdt.dsl
>>
>>
>>>> In this case, Linux guest takes the offset between the
>>>> node and PPTT header as the corresponding IDs, as the following
>>>> logs show.
>>>
>>> perhaps it's kernel which should be fixed to handle
>>> not set 'ACPI Processor ID valid' correctly.
>>>    
>>
>> This case is already handled by kernel. If 'ACPI Processor ID valid'
>> flag is missed, the offset between PPTT node and header is taken as
>> the ID. It's correct behaviour because 'ACPI Processor ID valid' flag
>> isn't mandatory for PPTT nodes. The problem is that the offset isn't
>> the desired ID, which is not understandable and mismatch with the
>> ID (value) we feed to PPTT table in QEMU.
> 
> as long as linux can match resources different IDs are fine.
> So if it's not a bug, I'd leave it alone.
> 

Ok. So lets ignore the series. If we need, we may revisit this
series in the future.

>>>>     /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64    \
>>>>     -accel kvm -machine virt,gic-version=host -cpu host        \
>>>>     -smp 8,sockets=2,clusters=2,cores=2,threads=1
>>>>       :
>>>>
>>>>     # cd /sys/devices/system/cpu
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>>>>       36  36  36  36  36  36  36  36
>>>>       336 336 336 336 336 336 336 336
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>>>>       56  56  56  56  196 196 196 196
>>>>       356 356 356 356 496 496 496 496
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>>>>       76  76  136 136 216 216 276 276
>>>>       376 376 436 436 516 516 576 576
>>>>
>>>> This fixes the issue by setting 'ACPI Processor ID valid' flag for
>>>> {socket, cluster, core} nodes. With this applied, the IDs are exactly
>>>> what have been provided in PPTT.
>>>>
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/physical_package_id; done
>>>>     0 0 0 0 0 0 0 0
>>>>     1 1 1 1 1 1 1 1
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/cluster_id; done
>>>>     0 0 0 0 1 1 1 1
>>>>     0 0 0 0 1 1 1 1
>>>>     # for i in `seq 0 15`; do cat cpu$i/topology/core_id; done
>>>>     0 0 1 1 0 0 1 1
>>>>     0 0 1 1 0 0 1 1
> 
> if you look at above, linux generated unique IDs for each node
> while with your patch IDs are not unique for cluster/core groups
> (i.e. you have only 2 clusters while in fact there are 4 total)
> 
> Should ID's in cpu$i/topology be unique or not, I don't really know.
> Try to see how linux uses those values and if they are supposed
> to be unique.
> 
> If you set flag to valid and provide DSDT containers
> then you will be forced to generate _unique_ (within
> the same _HID namespace) _UIDs to conform to the spec.
> 

I don't think it's required to have differentiated IDs, meaning the
IDs for multiple CPUs can be same. Note that one CPU is identified by
the combination of {socket,cluster,core,thread} IDs, instead of a
single ID.

According to the spec, it's needed to present containers IDs
in DSDT. However, the spec doesn't state how this can be done
clearly. As I said above, lets ignore the improvement in this
series for now and we may revisit this series in the future,
if needed.

> 
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/acpi/aml-build.c | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>>> index e6bfac95c7..89f191fd3b 100644
>>>> --- a/hw/acpi/aml-build.c
>>>> +++ b/hw/acpi/aml-build.c
>>>> @@ -2026,7 +2026,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                core_id = -1;
>>>>                socket_offset = table_data->len - pptt_start;
>>>>                build_processor_hierarchy_node(table_data,
>>>> -                (1 << 0), /* Physical package */
>>>> +                (1 << 0) | /* Physical package */
>>>> +                (1 << 1),  /* ACPI Processor ID valid */
>>>>                    0, socket_id, NULL, 0);
>>>>            }
>>>>    
>>>> @@ -2037,7 +2038,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                    core_id = -1;
>>>>                    cluster_offset = table_data->len - pptt_start;
>>>>                    build_processor_hierarchy_node(table_data,
>>>> -                    (0 << 0), /* Not a physical package */
>>>> +                    (0 << 0) | /* Not a physical package */
>>>> +                    (1 << 1),  /* ACPI Processor ID valid */
>>>>                        socket_offset, cluster_id, NULL, 0);
>>>>                }
>>>>            } else {
>>>> @@ -2055,7 +2057,8 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                    core_id = cpus->cpus[n].props.core_id;
>>>>                    core_offset = table_data->len - pptt_start;
>>>>                    build_processor_hierarchy_node(table_data,
>>>> -                    (0 << 0), /* Not a physical package */
>>>> +                    (0 << 0) | /* Not a physical package */
>>>> +                    (1 << 1),  /* ACPI Processor ID valid */
>>>>                        cluster_offset, core_id, NULL, 0);
>>>>                }
>>>>      
>>>    

Thanks,
Gavin


