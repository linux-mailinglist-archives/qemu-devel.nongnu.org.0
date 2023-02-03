Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE06897A4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:23:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNu8L-0001QW-9l; Fri, 03 Feb 2023 06:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNu85-0001N3-5T
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:21:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pNu82-00054n-W8
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675423273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qC5KX9oA+s0yDAQv5Vu1JAndP1FtDrSNVvzF24V+jHQ=;
 b=EiaoBYV//iH9DVm4cwOZ5/VfuaP9/7etl9V7GB63TwY20lKimni4qE7eAfcIUJ+g7szAiV
 zVLv4aj9F8Gx9zWSyeYJf++SudWGOEJrII44SBc/KX1yhoMMoLflgnY5Dk6kHD5BjNEWWo
 2/r0A2JTBi5dw6bG1kHpOf8/+47WqjE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-513-oA5Prbp1Pu-YRZGQcfj98Q-1; Fri, 03 Feb 2023 06:21:12 -0500
X-MC-Unique: oA5Prbp1Pu-YRZGQcfj98Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 p6-20020a05622a048600b003b9a3ab9153so2451969qtx.8
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:21:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qC5KX9oA+s0yDAQv5Vu1JAndP1FtDrSNVvzF24V+jHQ=;
 b=PYbm6z6nzxiNUU9Fm1DlGIHzg94rxkf/BDJHB1ZgW3rdVKTN3yKPE1kf6t1jWIjnda
 8ICInUTpzkFB8z17PyVvw8Nzvm1TSfw8oLlHAD4RkZvPl1mNyK88Tz9ZRc6mQ6SrSoly
 UXiQdwnBbpDj5lKKueaxDwYQLPxmeG2j8HWqry3orLHwXeXLNzMlF7sb049GhLmZ2z13
 1AkyDAjf7//wvfP0aVTd0QqXpcoIcoDCgDH8HCqCfHGqmEVqaFJuM3bCCSIKBYFxH4xX
 GXUWGW4iAi3CGquIsqyBKy1cs5x1n/hS46xQq3moCpAh4QWvz9uuw42RNJbgkVcnAjIY
 kVoQ==
X-Gm-Message-State: AO0yUKXU5GkDHEIx+zA1z/GHL0O0QkJozopAXQk+eDUUe8GR4BTDBuUO
 tY2+Zu2aZaabtSWn+1Vx/qWe7T10w4mgh3TdJSM7Qo2NdjU6qBSI2uCai9JJ0RTzTPBpLWcPWJK
 a1M6OvUc5ZWPkrXk=
X-Received: by 2002:a0c:c349:0:b0:53b:bcf5:843f with SMTP id
 j9-20020a0cc349000000b0053bbcf5843fmr14484989qvi.36.1675423271798; 
 Fri, 03 Feb 2023 03:21:11 -0800 (PST)
X-Google-Smtp-Source: AK7set+xoSXGyg8lTuml8la4W/ra3P+BuT+ZKC30r0i0uqVwXdk5dZAeJuu7odItq/RD9ap+vOSnUQ==
X-Received: by 2002:a0c:c349:0:b0:53b:bcf5:843f with SMTP id
 j9-20020a0cc349000000b0053bbcf5843fmr14484965qvi.36.1675423271545; 
 Fri, 03 Feb 2023 03:21:11 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-179-40.web.vodafone.de.
 [109.43.179.40]) by smtp.gmail.com with ESMTPSA id
 g19-20020ac84b73000000b003b8558eabd0sm1400316qts.23.2023.02.03.03.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 03:21:10 -0800 (PST)
Message-ID: <95b6cc32-77f6-5364-5293-be0f9944517c@redhat.com>
Date: Fri, 3 Feb 2023 12:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-2-pmorel@linux.ibm.com>
 <9fed7aba2819a6564b785e90c2284b2a83f35431.camel@linux.ibm.com>
 <4ef7d6a2-c9aa-9994-48ac-21d6ed865a45@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <4ef7d6a2-c9aa-9994-48ac-21d6ed865a45@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 03/02/2023 10.39, Pierre Morel wrote:
> 
> @Thomas, these changes look good to me.
> What do you think, do I make the change and keep your RB ?

Yes, splitting that enum sounds cleaner, indeed.

  Thomas


> On 2/2/23 17:05, Nina Schoetterl-Glausch wrote:
>> Nit patch title: s390x/cpu topology: add s390 specifics to CPU topology ?
>>
> 
> OK
> 
>> On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
>>> S390 adds two new SMP levels, drawers and books to the CPU
>>> topology.
>>> The S390 CPU have specific toplogy features like dedication
>>                                  ^o
> 
> Yes thx
> 
>>> and polarity to give to the guest indications on the host
>>> vCPUs scheduling and help the guest take the best decisions
>>> on the scheduling of threads on the vCPUs.
>>>
>>> Let us provide the SMP properties with books and drawers levels
>>> and S390 CPU with dedication and polarity,
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   qapi/machine.json               | 14 ++++++++--
>>>   include/hw/boards.h             | 10 ++++++-
>>>   include/hw/s390x/cpu-topology.h | 24 +++++++++++++++++
>>>   target/s390x/cpu.h              |  5 ++++
>>>   hw/core/machine-smp.c           | 48 ++++++++++++++++++++++++++++-----
>>>   hw/core/machine.c               |  4 +++
>>>   hw/s390x/s390-virtio-ccw.c      |  2 ++
>>>   softmmu/vl.c                    |  6 +++++
>>>   target/s390x/cpu.c              |  7 +++++
>>>   qemu-options.hx                 |  7 +++--
>>>   10 files changed, 115 insertions(+), 12 deletions(-)
>>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>>
>> [...]
>>>
>>> diff --git a/include/hw/s390x/cpu-topology.h 
>>> b/include/hw/s390x/cpu-topology.h
>>> new file mode 100644
>>> index 0000000000..7a84b30a21
>>> --- /dev/null
>>> +++ b/include/hw/s390x/cpu-topology.h
>>> @@ -0,0 +1,24 @@
>>> +/*
>>> + * CPU Topology
>>> + *
>>> + * Copyright IBM Corp. 2022
>>> + *
>>> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
>>> + * your option) any later version. See the COPYING file in the top-level
>>> + * directory.
>>> + */
>>> +#ifndef HW_S390X_CPU_TOPOLOGY_H
>>> +#define HW_S390X_CPU_TOPOLOGY_H
>>> +
>>> +#define S390_TOPOLOGY_CPU_IFL   0x03
>>> +
>>> +enum s390_topology_polarity {
>>> +    POLARITY_HORIZONTAL,
>>> +    POLARITY_VERTICAL,
>>> +    POLARITY_VERTICAL_LOW = 1,
>>> +    POLARITY_VERTICAL_MEDIUM,
>>> +    POLARITY_VERTICAL_HIGH,
>>> +    POLARITY_MAX,
>>> +};
>>
>> Probably a good idea to keep the S390 prefix.
>> This works, but aliasing VERTICAL and VERTICAL_LOW is not
>> entirely straight forward.
>>
>> Why not have two enum?
>> enum s390_topology_polarity {
>>     S390_POLARITY_HORIZONTAL,
>>     S390_POLARITY_VERTICAL,
>> };
>>
>> enum s390_topology_entitlement {
>>     S390_ENTITLEMENT_LOW = 1,
>>     S390_ENTITLEMENT_MEDIUM,
>>     S390_ENTITLEMENT_HIGH,
>>     S390_ENTITLEMENT_MAX,
>> };
>> Maybe add an ENTITLEMENT_INVALID/NONE, if you need that, as first value.
>>
> 
> If Thomas agree, I do the changes.
> 
> Regards,
> Pierre
> 
> 


