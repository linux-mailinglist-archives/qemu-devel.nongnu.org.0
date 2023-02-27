Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD4F6A3CAA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:26:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYRp-0000DC-BO; Mon, 27 Feb 2023 03:01:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWYRV-0008Tp-P5
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:01:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWYRR-0003lJ-MZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677484860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cSB2JpodE8sZyJM1yWA/wzyyEAdvIrDjsUCzMJhckF4=;
 b=W+dbbV8/23UuGIa2JpkZW40LOrKsrPH0ZL/7VQnXK+inwKCVETQ0tKKxMlCZzIpHwywih7
 MH4/lgmN1oM9KNo+cn3exT4+a9LZj6vGGL0nJ8uJVa37/++1V/JDxLq9viXoE4557j9U/V
 xQ2CzxaHT7fu91SQ25slIitUtJyee50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-sETcoTYrOpuQbG-c4j0TOA-1; Mon, 27 Feb 2023 02:59:20 -0500
X-MC-Unique: sETcoTYrOpuQbG-c4j0TOA-1
Received: by mail-wm1-f70.google.com with SMTP id
 x18-20020a1c7c12000000b003e1e7d3cf9fso4983158wmc.3
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:59:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSB2JpodE8sZyJM1yWA/wzyyEAdvIrDjsUCzMJhckF4=;
 b=YoJWuQV1WTG+AgyyGWhi9RkL/Qq7cqS5K5Y2rW3zj5E7afy784bVeOJiiXNJOzqsVo
 JhgJX8VRLhvHc86uYVLHjBOJjLkyy5eEBaMVU0krXYgm+6p/6x1eiT1ms60TJekZ9Wzo
 P+KJo4LvNSzFVSJRIQexJVbHalS41O4duqQNpDaI/e3rU7qdgMilt0qriAUI4JQiTbtb
 iOuJTG9KQeTE5fzroI1mriCfDaTWxIGlFC7uqFeYkCSLqxW329fQaDjXPMnJhmpj50hT
 mL81DjFlNN4E826Eed/kkT/flKrSPUCvZF4m5XlEee8C6bIavp4QlCJVNiM4iavTpChr
 Ij/w==
X-Gm-Message-State: AO0yUKUAkTdZp6AsxzULiM4xN2Yq/IrW5Ik9+Nc8ODpaw6AOu+UJwJtX
 qkgFdERTIGtXoOWdyWhoKvqZaFONw1uO1C4fnmujwIx5XMzsEgqbBvQHxhhq9/3ZAdE/01h4lOE
 z2/dCu+Ry1VdImzg=
X-Received: by 2002:a05:6000:1005:b0:2c9:97f8:2604 with SMTP id
 a5-20020a056000100500b002c997f82604mr4642054wrx.14.1677484758990; 
 Sun, 26 Feb 2023 23:59:18 -0800 (PST)
X-Google-Smtp-Source: AK7set+Osqlt3nxOK14nQvtcQm9/Yl2gx2MpF2q5Ms1VYsaRJiZZ3XljP9gj61qAn8kHnrdci+cfPg==
X-Received: by 2002:a05:6000:1005:b0:2c9:97f8:2604 with SMTP id
 a5-20020a056000100500b002c997f82604mr4642047wrx.14.1677484758691; 
 Sun, 26 Feb 2023 23:59:18 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 a4-20020a5d5704000000b002c559843748sm6361875wrv.10.2023.02.26.23.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:59:18 -0800 (PST)
Message-ID: <0a93eb0e-2552-07b7-2067-f46d542126f4@redhat.com>
Date: Mon, 27 Feb 2023 08:59:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-9-pmorel@linux.ibm.com>
 <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/02/2023 18.15, Nina Schoetterl-Glausch wrote:
> On Wed, 2023-02-22 at 15:21 +0100, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> command.
>>
>> It allows to move the core inside the topology tree to optimize
>> the cache usage in the case the host's hypervisor previously
>> moved the CPU.
>>
>> The same command allows to modify the CPU attributes modifiers
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
>>
>> The command has a feature unstable for the moment.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine-target.json |  35 +++++++++
>>   include/monitor/hmp.h    |   1 +
>>   hw/s390x/cpu-topology.c  | 154 +++++++++++++++++++++++++++++++++++++++
>>   hmp-commands.hx          |  17 +++++
>>   4 files changed, 207 insertions(+)
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index a52cc32f09..baa9d273cf 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -354,3 +354,38 @@
>>   { 'enum': 'CpuS390Polarization',
>>     'prefix': 'S390_CPU_POLARIZATION',
>>     'data': [ 'horizontal', 'vertical' ] }
>> +
>> +##
>> +# @set-cpu-topology:
>> +#
>> +# @core-id: the vCPU ID to be moved
>> +# @socket-id: optional destination socket where to move the vCPU
>> +# @book-id: optional destination book where to move the vCPU
>> +# @drawer-id: optional destination drawer where to move the vCPU
>> +# @entitlement: optional entitlement
>> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
>> +#
>> +# Features:
>> +# @unstable: This command may still be modified.
>> +#
>> +# Modifies the topology by moving the CPU inside the topology
>> +# tree or by changing a modifier attribute of a CPU.
>> +# Default value for optional parameter is the current value
>> +# used by the CPU.
>> +#
>> +# Returns: Nothing on success, the reason on failure.
>> +#
>> +# Since: 8.0
>> +##
>> +{ 'command': 'set-cpu-topology',
>> +  'data': {
>> +      'core-id': 'uint16',
>> +      '*socket-id': 'uint16',
>> +      '*book-id': 'uint16',
>> +      '*drawer-id': 'uint16',
>> +      '*entitlement': 'str',
> 
> How about you add a machine-common.json and define CpuS390Entitlement there,
> and then include it from both machine.json and machine-target.json?

I'm not sure whether double inclusion works with the QAPI parser (since this 
might code to be generated twice) ... have you tried?

  Thomas


