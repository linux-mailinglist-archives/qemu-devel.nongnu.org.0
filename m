Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C089659F47F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 09:44:30 +0200 (CEST)
Received: from localhost ([::1]:36366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQl3t-0005fA-GW
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 03:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQkqs-0002Qa-Cr
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQkqo-0006gn-65
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 03:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661326256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZI6L+XW0+joKvXX7bCcDey2XinRX/8HVHi6ehaHZCs=;
 b=B/3cER11SRHcOFNzX24oiBHs+r4D70JrS3HvpBKQjUONDO/OU9hxJUYrllsGLmXOlHNezG
 u9XsaXjECQDLoJqXVNrkOYaAfXFKid0QHVRCacfCGRs9Qr9atuvOajiQ65yLl1kyMMMRCu
 NAX2Z/o6SezmYEbjoKfD/9lCBsT4zrY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-00RAjM_6N1O1WGbHEX-kvw-1; Wed, 24 Aug 2022 03:30:54 -0400
X-MC-Unique: 00RAjM_6N1O1WGbHEX-kvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 h133-20020a1c218b000000b003a5fa79008bso440337wmh.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 00:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iZI6L+XW0+joKvXX7bCcDey2XinRX/8HVHi6ehaHZCs=;
 b=ZGQk2cM+LZWvjaE4CF0F8u6TPsI7mIHo+FSn/Ey5RcmMLoO9W6XyAjkIaGz60QFGMc
 /+tBq/8W9Og/ZP2d5pjALrenFJU/uc68QPWKFvBjnV728cQxVeodiJSvAYtY4y5CTnoG
 tvYD1p7ba1zlRpHMaG4fMZu71+Z/rntHJnPp/HfQD+GRHAFDHT9rOb7T+jJaIeYtOrNI
 DT7A7FOEyGe1zZOaxg0jp0cHXzz+ceqI1+qva2sIEqoQbK9LGikb83tiejncuoUEeHAd
 OeXXHxD4gcV12yLhAAhcfbljJFelOI4yKChuYaWVMCVrm5s+GGpXyU26DFtcuizTidw4
 VhRA==
X-Gm-Message-State: ACgBeo1aVUo/FEqlfekubGA00r3CeivDGR5YjfdTbjw/wRW99l0OXD4c
 0hMtMUiMfDe/EvuoalOZpEofnaYWtx4s4pJI41XRMrVeWJG5IaRzin1t7q1bpyYBprZAUiWZTrI
 ykdLZVfQC2hEw2OE=
X-Received: by 2002:a1c:a187:0:b0:3a5:e055:715b with SMTP id
 k129-20020a1ca187000000b003a5e055715bmr4404000wme.171.1661326253904; 
 Wed, 24 Aug 2022 00:30:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4BPVVDRWnSINI3f3hTjZ7cML9UdqfHfnNc0yFnEsBaCCTsHq+eBrnlQaRMVx9bq4TShjn41Q==
X-Received: by 2002:a1c:a187:0:b0:3a5:e055:715b with SMTP id
 k129-20020a1ca187000000b003a5e055715bmr4403962wme.171.1661326253560; 
 Wed, 24 Aug 2022 00:30:53 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-177.web.vodafone.de.
 [109.43.176.177]) by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b003a60f0f34b7sm948562wmq.40.2022.08.24.00.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 00:30:53 -0700 (PDT)
Message-ID: <be11a5fd-1955-2d26-38d9-3a8b9ffaf42f@redhat.com>
Date: Wed, 24 Aug 2022 09:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
 <b6c981e0-56f5-25c3-3422-ed72c8561712@redhat.com>
 <ca410180-1699-7a04-6417-b59540edc87d@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ca410180-1699-7a04-6417-b59540edc87d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/08/2022 19.41, Pierre Morel wrote:
> 
> 
> On 8/23/22 15:30, Thomas Huth wrote:
>> On 20/06/2022 16.03, Pierre Morel wrote:
>>> We use new objects to have a dynamic administration of the CPU topology.
>>> The highest level object in this implementation is the s390 book and
>>> in this first implementation of CPU topology for S390 we have a single
>>> book.
>>> The book is built as a SYSBUS bridge during the CPU initialization.
>>> Other objects, sockets and core will be built after the parsing
>>> of the QEMU -smp argument.
>>>
>>> Every object under this single book will be build dynamically
>>> immediately after a CPU has be realized if it is needed.
>>> The CPU will fill the sockets once after the other, according to the
>>> number of core per socket defined during the smp parsing.
>>>
>>> Each CPU inside a socket will be represented by a bit in a 64bit
>>> unsigned long. Set on plug and clear on unplug of a CPU.
>>>
>>> For the S390 CPU topology, thread and cores are merged into
>>> topology cores and the number of topology cores is the multiplication
>>> of cores by the numbers of threads.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   hw/s390x/cpu-topology.c         | 391 ++++++++++++++++++++++++++++++++
>>>   hw/s390x/meson.build            |   1 +
>>>   hw/s390x/s390-virtio-ccw.c      |   6 +
>>>   include/hw/s390x/cpu-topology.h |  74 ++++++
>>>   target/s390x/cpu.h              |  47 ++++
>>>   5 files changed, 519 insertions(+)
>>>   create mode 100644 hw/s390x/cpu-topology.c
>>>   create mode 100644 include/hw/s390x/cpu-topology.h
>> ...
>>> +bool s390_topology_new_cpu(MachineState *ms, int core_id, Error **errp)
>>> +{
>>> +    S390TopologyBook *book;
>>> +    S390TopologySocket *socket;
>>> +    S390TopologyCores *cores;
>>> +    int nb_cores_per_socket;
>>> +    int origin, bit;
>>> +
>>> +    book = s390_get_topology();
>>> +
>>> +    nb_cores_per_socket = ms->smp.cores * ms->smp.threads;
>>> +
>>> +    socket = s390_get_socket(ms, book, core_id / nb_cores_per_socket, 
>>> errp);
>>> +    if (!socket) {
>>> +        return false;
>>> +    }
>>> +
>>> +    /*
>>> +     * At the core level, each CPU is represented by a bit in a 64bit
>>> +     * unsigned long. Set on plug and clear on unplug of a CPU.
>>> +     * The firmware assume that all CPU in the core description have the 
>>> same
>>> +     * type, polarization and are all dedicated or shared.
>>> +     * In the case a socket contains CPU with different type, polarization
>>> +     * or dedication then they will be defined in different CPU containers.
>>> +     * Currently we assume all CPU are identical and the only reason to 
>>> have
>>> +     * several S390TopologyCores inside a socket is to have more than 64 
>>> CPUs
>>> +     * in that case the origin field, representing the offset of the 
>>> first CPU
>>> +     * in the CPU container allows to represent up to the maximal number of
>>> +     * CPU inside several CPU containers inside the socket container.
>>> +     */
>>> +    origin = 64 * (core_id / 64);
>>
>> Maybe faster:
>>
>>      origin = core_id & ~63;
>>
>> By the way, where is this limitation to 64 coming from? Just because we're 
>> using a "unsigned long" for now? Or is this a limitation from the 
>> architecture?
>>
>>> +    cores = s390_get_cores(ms, socket, origin, errp);
>>> +    if (!cores) {
>>> +        return false;
>>> +    }
>>> +
>>> +    bit = 63 - (core_id - origin);
>>> +    set_bit(bit, &cores->mask);
>>> +    cores->origin = origin;
>>> +
>>> +    return true;
>>> +}
>> ...
>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>> index cc3097bfee..a586875b24 100644
>>> --- a/hw/s390x/s390-virtio-ccw.c
>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>> @@ -43,6 +43,7 @@
>>>   #include "sysemu/sysemu.h"
>>>   #include "hw/s390x/pv.h"
>>>   #include "migration/blocker.h"
>>> +#include "hw/s390x/cpu-topology.h"
>>>   static Error *pv_mig_blocker;
>>> @@ -89,6 +90,7 @@ static void s390_init_cpus(MachineState *machine)
>>>       /* initialize possible_cpus */
>>>       mc->possible_cpu_arch_ids(machine);
>>> +    s390_topology_setup(machine);
>>
>> Is this safe with regards to migration? Did you tried a ping-pong 
>> migration from an older QEMU to a QEMU with your modifications and back to 
>> the older one? If it does not work, we might need to wire this setup to 
>> the machine types...
> 
> I checked with the follow-up series :
> OLD-> NEW -> OLD -> NEW
> 
> It is working fine, of course we need to fence the CPU topology facility 
> with ctop=off on the new QEMU to avoid authorizing the new instructions, PTF 
> and STSI(15).

When using an older machine type, the facility should be disabled by 
default, so the user does not have to know that ctop=off has to be set ... 
so I think you should only do the s390_topology_setup() by default if using 
the 7.2 machine type (or newer).

  Thomas


