Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 644DB6A408E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbev-0003Ga-9F; Mon, 27 Feb 2023 06:27:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbet-0003GG-LG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:27:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWber-0003oN-S2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:27:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=usVkUNlkroDegW9nfri6NWDP4Mttqk+PRKDXK6b1Xd4=;
 b=hPW+1XlKG3HaA/rQb90HxwBklapRNBtQPRPrlYXUNx8cmOY/Y/FE3VYC2Uv+SDcLr0w2cG
 67yrS0Qt4MPmfkr6hTS//uZOnpot3/Axzy6r0qxq84COsl++2evhngE4R/9L5+YtLelXKQ
 rmram6180li0faQxH+GibnH666axnOo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-48vUue4ZPB2h5mYgOkyV1g-1; Mon, 27 Feb 2023 06:27:03 -0500
X-MC-Unique: 48vUue4ZPB2h5mYgOkyV1g-1
Received: by mail-wr1-f72.google.com with SMTP id
 4-20020a5d47a4000000b002c5699ff08aso742015wrb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usVkUNlkroDegW9nfri6NWDP4Mttqk+PRKDXK6b1Xd4=;
 b=67DmJ0v5/T2cNavIceKQvxRCLC95IK9202OQ8INtG0D4H/536xpgBGndkML+kTAZ/8
 PD5fQ8zNLs9sQbsVHQYNC73+VpmFhUwnnWS4g1+mcb9yUjcY0F0ekwFciiFwcOYxyeZu
 9xKpmVIF9XGF3aw8R+ap19dk1s7qDqwxSXAy333WUasoV7k16ldxcQnBEi+JCvSevXAQ
 C37C/6M4JsQS1bV2F510PB5anDy9dscaWyfttaL+/RQV6V9/SUE1qU4hM8098jLe6csp
 g7MbUS49H5LYN1eLmmQE4DfnrrNU001qcikySJEUd2l0E2SuCOvr8/leGQLlHjfNHMQL
 nBbQ==
X-Gm-Message-State: AO0yUKUPI8+UfV20JVBOM4YVgy3vuHGLurcaxAOrduziNkSseNUrolpJ
 dDaBi5a1R3f+nkLi5zeo6ez2m6a7XaA9bkgnB2yV6YubvRECNOeTm4HvcdlqdIbWrRHzvqV6SsJ
 x6tqXS/LK/UPHHAA=
X-Received: by 2002:a05:600c:4929:b0:3dc:d5c:76d9 with SMTP id
 f41-20020a05600c492900b003dc0d5c76d9mr19013016wmp.0.1677497222451; 
 Mon, 27 Feb 2023 03:27:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+Dyb6pK1UFYS5nwu04lZDEnJ3AOeymWXyaqrDysUCzmOcIFKy0xwFwKoHjkV91ZwHHdTLkFQ==
X-Received: by 2002:a05:600c:4929:b0:3dc:d5c:76d9 with SMTP id
 f41-20020a05600c492900b003dc0d5c76d9mr19012993wmp.0.1677497222135; 
 Mon, 27 Feb 2023 03:27:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 m33-20020a05600c3b2100b003eaee9e0d22sm9371610wms.33.2023.02.27.03.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:27:01 -0800 (PST)
Message-ID: <c4fe1937-f16f-b2d8-efde-3e60d94f4166@redhat.com>
Date: Mon, 27 Feb 2023 12:26:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-9-pmorel@linux.ibm.com>
 <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
 <4335eac8-ba5d-5b6c-b19f-4b10a793ba0c@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
In-Reply-To: <4335eac8-ba5d-5b6c-b19f-4b10a793ba0c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 27/02/2023 11.57, Pierre Morel wrote:
> 
> On 2/24/23 18:15, Nina Schoetterl-Glausch wrote:
>> On Wed, 2023-02-22 at 15:21 +0100, Pierre Morel wrote:
>>> The modification of the CPU attributes are done through a monitor
>>> command.
>>>
>>> It allows to move the core inside the topology tree to optimize
>>> the cache usage in the case the host's hypervisor previously
>>> moved the CPU.
>>>
>>> The same command allows to modify the CPU attributes modifiers
>>> like polarization entitlement and the dedicated attribute to notify
>>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>>
>>> With this knowledge the guest has the possibility to optimize the
>>> usage of the vCPUs.
>>>
>>> The command has a feature unstable for the moment.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>   qapi/machine-target.json |  35 +++++++++
>>>   include/monitor/hmp.h    |   1 +
>>>   hw/s390x/cpu-topology.c  | 154 +++++++++++++++++++++++++++++++++++++++
>>>   hmp-commands.hx          |  17 +++++
>>>   4 files changed, 207 insertions(+)
>>>
>>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>>> index a52cc32f09..baa9d273cf 100644
>>> --- a/qapi/machine-target.json
>>> +++ b/qapi/machine-target.json
>>> @@ -354,3 +354,38 @@
>>>   { 'enum': 'CpuS390Polarization',
>>>     'prefix': 'S390_CPU_POLARIZATION',
>>>     'data': [ 'horizontal', 'vertical' ] }
>>> +
>>> +##
>>> +# @set-cpu-topology:
>>> +#
>>> +# @core-id: the vCPU ID to be moved
>>> +# @socket-id: optional destination socket where to move the vCPU
>>> +# @book-id: optional destination book where to move the vCPU
>>> +# @drawer-id: optional destination drawer where to move the vCPU
>>> +# @entitlement: optional entitlement
>>> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
>>> +#
>>> +# Features:
>>> +# @unstable: This command may still be modified.
>>> +#
>>> +# Modifies the topology by moving the CPU inside the topology
>>> +# tree or by changing a modifier attribute of a CPU.
>>> +# Default value for optional parameter is the current value
>>> +# used by the CPU.
>>> +#
>>> +# Returns: Nothing on success, the reason on failure.
>>> +#
>>> +# Since: 8.0
>>> +##
>>> +{ 'command': 'set-cpu-topology',
>>> +  'data': {
>>> +      'core-id': 'uint16',
>>> +      '*socket-id': 'uint16',
>>> +      '*book-id': 'uint16',
>>> +      '*drawer-id': 'uint16',
>>> +      '*entitlement': 'str',
>> How about you add a machine-common.json and define CpuS390Entitlement there,
>> and then include it from both machine.json and machine-target.json?
>>
>> Then you can declare it as CpuS390Entitlement and don't need to do the 
>> parsing
>> manually.
>>
>> You could also put it in common.json, but that seems a bit too generic.
>>
>> Anyone have objections?
> 
> Seems Thomas has questions, I wait until every body agree or not agree.

I'd be fine with such a change if it works ... I just got no clue whether it 
works or not, so you've got to try it, I guess.

But I think I'd rather avoid naming the file "machine-common.json" ... 
"machine.json" is already supposed to be the common code that can be shared 
between all targets, so having a "machine-common.json" file would be super 
confusing, I think.

OTOH, what's the reason again for having CpuS390Entitlement in machine.json? 
Couldn't it be moved to machine-target.json instead?

  Thomas


