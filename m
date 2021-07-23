Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC203D3BB6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:16:23 +0200 (CEST)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vyQ-0001lh-EK
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6vwf-0000Wv-Du
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6vwb-00022b-OQ
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627049668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecGPd+pAbrWLvK0EnAvJMD0De1Oq7nb736WhOvIDG/w=;
 b=e384dMT+Qh6HD/Solnh1u1O6DgdJE8iurgZJayZlkB7FoCRAXVqPAFEchS2zqiSCIrKGKM
 egjSvHrR4T+Gj7ZlXRMsp+tq3UjHxyupRS2X3c8uqFYZDfGiw3wTLdfCL7VLOMdk5OO2o/
 s5OvQE6OdLqkhBEFD7Snz2hgzd6hwFI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-Q0ucCqCxOzyyiqzXrUzM9A-1; Fri, 23 Jul 2021 10:14:25 -0400
X-MC-Unique: Q0ucCqCxOzyyiqzXrUzM9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 a1-20020a7bc1c10000b0290225338d8f53so836459wmj.8
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 07:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ecGPd+pAbrWLvK0EnAvJMD0De1Oq7nb736WhOvIDG/w=;
 b=WqWDI53VEFVPVB/OpXAebavbPqqU/sFzWNMfMD8ye+5suSMTDaHx9zcfrI3xA8grmm
 ODOv1VUYHEo4IY9LtVucpzWpgZx4M7UqVsy6hFoDn6hzvlSXZMOnIia+Nj+gfKHAS2uy
 o9sKr0dFRrIMIQT5CJlpSiXcDO3Pz9Sk9Mvfzcan/90Ufdk0hYpajJ+DFBcm2Dd3DcTJ
 rXcvu8I8HvBCzIcOeryIJKUtH0pB6TVLrIvn8zf60wdFlVeHlXc9Dz8igPaSlJLxX387
 Sqq8vtQ5UeOrXIldisy51tB/uONnx/PQBRPB1OZk0/uY7SnRxA5gWO1EHE0B+nqsTm/w
 TOGA==
X-Gm-Message-State: AOAM532FZNGkvpfaYWgbp0/ZiBtmAosBJdo0E7hi/NpfoHoMFH6zIIk7
 lfklbh2dRjfsDXSZGtuwHhO+5sUPJhdE6gZnZ38J12GGxGSrG5GVnq8dbcqOuWjCubiH0p+r7Ss
 av0CCIu9137slTHg=
X-Received: by 2002:a05:600c:3b93:: with SMTP id
 n19mr14405190wms.3.1627049663947; 
 Fri, 23 Jul 2021 07:14:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfYaaX8oSf1V/GLJM/iKfH2dCkzyYh1IDz3HvcrsGWPfhMNrFXjYMmLxmHUulZwJzcOgp5ZQ==
X-Received: by 2002:a05:600c:3b93:: with SMTP id
 n19mr14405151wms.3.1627049663635; 
 Fri, 23 Jul 2021 07:14:23 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e6sm5249829wme.28.2021.07.23.07.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 07:14:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] modules: Improve error message when module is not
 found
To: Claudio Fontana <cfontana@suse.de>, "Jose R. Ziviani" <jziviani@suse.de>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de> <YPrJMTF+3lfeNdC5@pizza>
 <1dec44e9-3587-ff96-f8c4-81399f689e58@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7eb0823b-289f-90af-7b68-bf3607127ac3@redhat.com>
Date: Fri, 23 Jul 2021 16:14:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1dec44e9-3587-ff96-f8c4-81399f689e58@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 4:02 PM, Claudio Fontana wrote:
> On 7/23/21 3:50 PM, Jose R. Ziviani wrote:
>> On Fri, Jul 23, 2021 at 11:41:19AM +0200, Claudio Fontana wrote:
>>> On 7/23/21 12:09 AM, Jose R. Ziviani wrote:
>>>> When a module is not found, specially accelerators, QEMU displays
>>>> a error message that not easy to understand[1]. This patch improves
>>>> the readability by offering a user-friendly message[2].
>>>>
>>>> This patch also moves the accelerator ops check to runtine (instead
>>>> of the original g_assert) because it works better with dynamic
>>>> modules.
>>>>
>>>> [1] qemu-system-x86_64 -accel tcg
>>>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed:
>>>> (ops != NULL)
>>>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces:
>>>> assertion failed: (ops != NULL)
>>>>     31964 IOT instruction (core dumped)  ./qemu-system-x86_64 ...
>>>>
>>>> [2] qemu-system-x86_64 -accel tcg
>>>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>>>>
>>>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>>>> ---
>>>>  accel/accel-softmmu.c |  5 ++++-
>>>>  util/module.c         | 14 ++++++++------
>>>>  2 files changed, 12 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
>>>> index 67276e4f52..52449ac2d0 100644
>>>> --- a/accel/accel-softmmu.c
>>>> +++ b/accel/accel-softmmu.c
>>>> @@ -79,7 +79,10 @@ void accel_init_ops_interfaces(AccelClass *ac)
>>>>       * all accelerators need to define ops, providing at least a mandatory
>>>>       * non-NULL create_vcpu_thread operation.
>>>>       */
>>>> -    g_assert(ops != NULL);
>>>> +    if (ops == NULL) {
>>>> +        exit(1);
>>>> +    }
>>>> +
>>>
>>>
>>> Ah, again, why?
>>> This change looks wrong to me, 
>>>
>>> the ops code should be present when ops interfaces are initialized:
>>> it should be a code level assertion, as it has to do with the proper order of initializations in QEMU,
>>>
>>> why would we want to do anything else but to assert here?
>>>
>>> Am I blind to something obvious?
>>
>> Hello!
>>
>> Thank you for reviewing it!
>>
>> The problem is that if your TCG module is not installed and you start
>> QEMU like:
>>
>> ./qemu-system-x86_64 -accel tcg
>>
>> You'll get the error message + a crash with a core dump:
>>
>> accel-tcg-x86_64 module is missing, install the package or config the library path correctly.
>> **
>> ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>> Bail out! ERROR:../accel/accel-softmmu.c:82:accel_init_ops_interfaces: assertion failed: (ops != NULL)
>> [1]    5740 IOT instruction (core dumped)  ./qemu-system-x86_64 -accel tcg
>>
>> I was digging a little bit more in order to move this responsibility to
>> module.c but there isn't enough information there to safely exit() in
>> all situations that a module may be loaded. As Gerd mentioned, more work
>> is needed in order to achieve that.
>>
>> However, it's not nice to have a crash due to an optional module missing.
>> It's specially confusing because TCG has always been native. Considering
>> also that we're already in hard freeze for 6.1, I thought to have this
>> simpler check instead.
>>
>> What do you think if we have something like:
>>
>> /* FIXME: this isn't the right place to handle a missing module and
>>    must be reverted when the module refactoring is completely done */
>> #ifdef CONFIG_MODULES
>> if (ops == NULL) {
>>     exit(1);
>> }
>> #else
>> g_assert(ops != NULL);
>> #endif
>>
>> Regards!
> 
> 
> For the normal builds (without modular tcg), this issue does not appear right?
> So maybe there is no pressure to change anything for 6.1, and we can work on the right solution on master?
> 
> Not sure how we consider this feature for 6.1, I guess it is still not a supported option,
> (is there any CI for this? Probably not right?),
> 
> so I would consider building modular tcg in 6.1 as "experimental", and we can proceed to do the right thing on master?

+1 as I don't see this feature ready.


