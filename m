Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216468BD8A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 14:11:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP1GU-0003gC-Mo; Mon, 06 Feb 2023 08:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP1GL-0003T4-OK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pP1G6-00084w-05
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 08:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675689004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0F4n6oRN9d0FXsy2UfnG+aJFu5pdD1XrdXOjIiNSqM4=;
 b=hFOl7Fg3ePlgSu9RmPzs5YQxIQbMDuAbd/vVi9OnXWmO7zzZ5RrKOTJ6yCfOTTMiBinu4T
 85aysromAAFrevI2vFYXc6kzvl4gbfVEnsGPurudGQFZwEeEoMii8Y90/0l6iKxMtc+CP0
 p6qu1seziko4KAkV7UPAjmdwb1cU3j0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614--A4vSZIiNeShCRCUhCR-QQ-1; Mon, 06 Feb 2023 08:10:03 -0500
X-MC-Unique: -A4vSZIiNeShCRCUhCR-QQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 kd28-20020a056214401c00b0053cd4737a42so5823309qvb.22
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 05:10:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0F4n6oRN9d0FXsy2UfnG+aJFu5pdD1XrdXOjIiNSqM4=;
 b=aSdvJnpDBqWtqBrGOccfNosFzc61N+OrSaru6m5hSJjyFR5JAkI5AQgk2EF8v0FFn/
 IfqHIz2EZgLRvkaDyU/UAZ+L0Wa9/sfEMbZ5QHDH3gPwf1eygQJvonYUvMvKfceHLlpP
 jPyyc9XD7LiD5/H0+/+/HOkBRzoLgxyx6+IIitY+SdvBxA/Q6o3Bd4H80cTD3pDQu5ar
 aiARxy7W10wxu73GQq+pmPP292pvT1j4ZNQhQqjIRUzT2OgJvHUpO9Qcku2ZgrQzXpsY
 CNoZtegRnNWVdfE7f/VjsFdQfzfKh6GsJ4u+NhJAytaWfZ+Axu3vo1nfbEr6pqexXH35
 7vaQ==
X-Gm-Message-State: AO0yUKWCfHgJwsBSepKdry5Sk3PNF9AeS5jl3Y7bhdgIRMY48+JZmidN
 vubXBDHrqdL41Xzho5eQ7k49PTWb25Q9pz3ZecYVDv3Odjx6wo1iCfq67z4oL9PXsssyBCwLnYr
 BVdqFqxi9K7AKQCY=
X-Received: by 2002:ac8:59cb:0:b0:3b8:4951:57b7 with SMTP id
 f11-20020ac859cb000000b003b8495157b7mr34547896qtf.20.1675689002732; 
 Mon, 06 Feb 2023 05:10:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9zL72cFuFVsx2BUC3H2ZLsTV1hGvBPE85qDtnjVy85ay2pdSlUopi9QLkabRgin6oMR+J9gQ==
X-Received: by 2002:ac8:59cb:0:b0:3b8:4951:57b7 with SMTP id
 f11-20020ac859cb000000b003b8495157b7mr34547838qtf.20.1675689002426; 
 Mon, 06 Feb 2023 05:10:02 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-71.web.vodafone.de.
 [109.43.177.71]) by smtp.gmail.com with ESMTPSA id
 d8-20020a05622a100800b003b643951117sm7377910qte.38.2023.02.06.05.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 05:10:01 -0800 (PST)
Message-ID: <e1828071-551a-b5cb-8da5-cea91f075548@redhat.com>
Date: Mon, 6 Feb 2023 14:09:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 armbru@redhat.com, Michael Roth <michael.roth@amd.com>,
 Pierre Morel <pmorel@linux.ibm.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pasic@linux.ibm.com, richard.henderson@linaro.org, david@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, nsg@linux.ibm.com,
 frankja@linux.ibm.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
 <a7a235d5-4ded-b83d-dcb6-2cf81ad5f283@redhat.com>
 <Y+D3PH0EkUPshIMO@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y+D3PH0EkUPshIMO@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/02/2023 13.49, Daniel P. Berrangé wrote:
> On Mon, Feb 06, 2023 at 01:41:44PM +0100, Thomas Huth wrote:
>> On 01/02/2023 14.20, Pierre Morel wrote:
>>> S390x provides two more topology containers above the sockets,
>>> books and drawers.
>>>
>>> Let's add these CPU attributes to the QAPI command query-cpu-fast.
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>>    qapi/machine.json          | 13 ++++++++++---
>>>    hw/core/machine-qmp-cmds.c |  2 ++
>>>    2 files changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index 3036117059..e36c39e258 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -53,11 +53,18 @@
>>>    #
>>>    # Additional information about a virtual S390 CPU
>>>    #
>>> -# @cpu-state: the virtual CPU's state
>>> +# @cpu-state: the virtual CPU's state (since 2.12)
>>> +# @dedicated: the virtual CPU's dedication (since 8.0)
>>> +# @polarity: the virtual CPU's polarity (since 8.0)
>>>    #
>>>    # Since: 2.12
>>>    ##
>>> -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
>>> +{ 'struct': 'CpuInfoS390',
>>> +    'data': { 'cpu-state': 'CpuS390State',
>>> +              'dedicated': 'bool',
>>> +              'polarity': 'int'
>>
>> I think it would also be better to mark the new fields as optional and only
>> return them if the guest has the topology enabled, to avoid confusing
>> clients that were written before this change.
> 
> FWIW, I would say that the general expectation of QMP clients is that
> they must *always* expect new fields to appear in dicts that are
> returned in QMP replies. We add new fields at will on a frequent basis.

Did we change our policy here? I slightly remember I've been told 
differently in the past ... but I can't recall where this was, it's 
certainly been a while.

So a question to the QAPI maintainers: What's the preferred handling for new 
fields nowadays in such situations?

  Thomas


