Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2139668D3C2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKwC-0000p5-Db; Tue, 07 Feb 2023 05:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPKw7-0000ay-FY
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPKw5-0003FL-NX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675764648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GaJ1eqGYVO2m1fzMUCWDV4TzJSQxwVKtY4hpu6q92yM=;
 b=DFGHNCTnf/36GodMf+WbL+yhuu7ULj5gkDolB9oUGT76gvT/BMeTg1lHiFeYvio13QQd/A
 wZyASlJ+PMD33ejTZbxJWXv8YFtzO3zE1K9NTzI1ZmCAmEwQ66HemisJzsIuJsXei+8yWM
 n0kl+zqDcMe5TBWYKxYkntC3wsQ3Kcg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-311-jeb00kjYO56JXFm8xUIAOw-1; Tue, 07 Feb 2023 05:10:47 -0500
X-MC-Unique: jeb00kjYO56JXFm8xUIAOw-1
Received: by mail-qt1-f198.google.com with SMTP id
 c16-20020ac85190000000b003b841d1118aso8281625qtn.17
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 02:10:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GaJ1eqGYVO2m1fzMUCWDV4TzJSQxwVKtY4hpu6q92yM=;
 b=iQz8VX/20JrApvcfuKgst14LoeBooZDNYHMImGliu8frHJzZRk70CBJ6+rI/e9++/b
 TmdQqqkewlZaNUwM7FC+n/cB3uQoGHou3Z4Nfsc6aq4ApqZk9AVN3gMdVJBGZkDzhHm5
 VvxfR0onu97mZIVtjTt8gBF7wNPT0Ww5ZNYgx1wYUMPmyGCzXwlxhUdJOlx9+VHpCsIj
 mz3oHEgh4OtgowDaVXPYzKNJT9RBvrOu1DidriKVePUiLgdNsssISt2Wl7+0euyj2g5E
 2BKYkH8vFnTqGEWM8grTzW9ZpVgvCwYhHqZHTp6NYVk+BC6Ua7SN5EZC5WNDrAjdtPpv
 96aw==
X-Gm-Message-State: AO0yUKV9PGxJVWzQRXiKmKYfj4M//k48hI6i7+75Jtsoxu36vdv3do7o
 svoDD78HalHb3daaZwJOoXyklXfrWH25FupsjUJPkJdUsjK0drWNkt11synkpRBQw6o6Avo1vfW
 xykKaM74qewLKYcQ=
X-Received: by 2002:a05:6214:5191:b0:56b:4e51:acd5 with SMTP id
 kl17-20020a056214519100b0056b4e51acd5mr4038574qvb.12.1675764646783; 
 Tue, 07 Feb 2023 02:10:46 -0800 (PST)
X-Google-Smtp-Source: AK7set8brvIiymTcOybCkThVC+EK+7hv6UVOws47+1hKcCfznHu8FN7x3UaTighSEXeQRFrtWTpMiA==
X-Received: by 2002:a05:6214:5191:b0:56b:4e51:acd5 with SMTP id
 kl17-20020a056214519100b0056b4e51acd5mr4038547qvb.12.1675764646545; 
 Tue, 07 Feb 2023 02:10:46 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05620a13cc00b00706a452c074sm8989347qkl.104.2023.02.07.02.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 02:10:45 -0800 (PST)
Message-ID: <969ce73e-1266-7c15-991b-e56c0d748335@redhat.com>
Date: Tue, 7 Feb 2023 11:10:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: armbru@redhat.com, Michael Roth <michael.roth@amd.com>,
 Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, nsg@linux.ibm.com,
 frankja@linux.ibm.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
 <a7a235d5-4ded-b83d-dcb6-2cf81ad5f283@redhat.com>
 <Y+D3PH0EkUPshIMO@redhat.com>
 <e1828071-551a-b5cb-8da5-cea91f075548@redhat.com>
 <Y+ETxSadUGC/UJGY@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y+ETxSadUGC/UJGY@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 15.50, Daniel P. Berrangé wrote:
> On Mon, Feb 06, 2023 at 02:09:57PM +0100, Thomas Huth wrote:
>> On 06/02/2023 13.49, Daniel P. Berrangé wrote:
>>> On Mon, Feb 06, 2023 at 01:41:44PM +0100, Thomas Huth wrote:
>>>> On 01/02/2023 14.20, Pierre Morel wrote:
>>>>> S390x provides two more topology containers above the sockets,
>>>>> books and drawers.
>>>>>
>>>>> Let's add these CPU attributes to the QAPI command query-cpu-fast.
>>>>>
>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>> ---
>>>>>     qapi/machine.json          | 13 ++++++++++---
>>>>>     hw/core/machine-qmp-cmds.c |  2 ++
>>>>>     2 files changed, 12 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>>>> index 3036117059..e36c39e258 100644
>>>>> --- a/qapi/machine.json
>>>>> +++ b/qapi/machine.json
>>>>> @@ -53,11 +53,18 @@
>>>>>     #
>>>>>     # Additional information about a virtual S390 CPU
>>>>>     #
>>>>> -# @cpu-state: the virtual CPU's state
>>>>> +# @cpu-state: the virtual CPU's state (since 2.12)
>>>>> +# @dedicated: the virtual CPU's dedication (since 8.0)
>>>>> +# @polarity: the virtual CPU's polarity (since 8.0)
>>>>>     #
>>>>>     # Since: 2.12
>>>>>     ##
>>>>> -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
>>>>> +{ 'struct': 'CpuInfoS390',
>>>>> +    'data': { 'cpu-state': 'CpuS390State',
>>>>> +              'dedicated': 'bool',
>>>>> +              'polarity': 'int'
>>>>
>>>> I think it would also be better to mark the new fields as optional and only
>>>> return them if the guest has the topology enabled, to avoid confusing
>>>> clients that were written before this change.
>>>
>>> FWIW, I would say that the general expectation of QMP clients is that
>>> they must *always* expect new fields to appear in dicts that are
>>> returned in QMP replies. We add new fields at will on a frequent basis.
>>
>> Did we change our policy here? I slightly remember I've been told
>> differently in the past ... but I can't recall where this was, it's
>> certainly been a while.
>>
>> So a question to the QAPI maintainers: What's the preferred handling for new
>> fields nowadays in such situations?
> 
> I think you're mixing it up with policy for adding new fields to *input*
> parameters. You can't add a new mandatory field to input params of a
> command because no existing client will be sending that. Only optional
> params are viable, without a deprecation cycle. For output parameters
> such as this case, there's no compatibilty problem.

Ah, right, I likely mixed it up with that. Thanks for the clarification!

  Thomas



