Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083AC675385
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:41:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIpk8-0008Fv-84; Fri, 20 Jan 2023 06:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpk4-0008Av-TW
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:39:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIpk3-0006Op-8q
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674214769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ajl2DcMrgtFUAhvmjfmss1MrYMGMO7s7JUUQvhzsUP4=;
 b=N8ES20InF6k5U/zpk6xd2rgUaq0l4gqICIaxPLXLoqsgTh1V7fjRVM/tocnkrk1GLbc3xX
 rcJ4c7Etko35ovY7AIoMuKJ5HdC8SkYJnwoD/UrHw/OEx80p839S2xVs8VZB5D4LgkY8Nz
 RjYGazO7QxCX2O7IojWtmBoNq0vqA6A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-IBJf-RIiMVee79vYjWuzrg-1; Fri, 20 Jan 2023 06:39:26 -0500
X-MC-Unique: IBJf-RIiMVee79vYjWuzrg-1
Received: by mail-qt1-f199.google.com with SMTP id
 bs22-20020ac86f16000000b003b686e0ef0bso2283064qtb.19
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:39:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ajl2DcMrgtFUAhvmjfmss1MrYMGMO7s7JUUQvhzsUP4=;
 b=oX+TdPpq2wsHurucS8QHGxT/ORIULd6V8MTuZExhYJ6TypDMFkDYs7DZFAJaYV0ETq
 oog0mRmTIsM+K4RFLz45k+mJOtCJgn7T768e1+R1sLY1vLVF0kjOJ2VJqsNCVaVBHWzm
 6F46g1vj0tPTqnHMCML9xIYIkIMvSSGBp2cn5SRyDdV+s4qNkSn/VjLSFj0egOsSnDOd
 E+PJ2ydW5rFFaiF3ceCKvjCrlXG7HQWl7V8xs/T/NblfJdETqolqjYYO7udrJj22j5zU
 LOPo24KzBDO6eiRYUWUSJdezfvccG122R1xr+o0oWzDaGA/niT7VtH301w2JtipkcEka
 Rdjg==
X-Gm-Message-State: AFqh2kokCN0+TXSlUzWgijYfNS/NbEs33eFoe0tX3zOYRjJ9ddrYNC3d
 2scGOViHtlxYcWHcBnQmQYUt+rAHuL//CTwQXhbDcele+eIbNX163VgO/0yDHEvqapKU/JAAgIy
 6GS3euFdEheKzHFE=
X-Received: by 2002:ac8:7208:0:b0:3a6:8da6:65bc with SMTP id
 a8-20020ac87208000000b003a68da665bcmr20353614qtp.13.1674214765943; 
 Fri, 20 Jan 2023 03:39:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtr1XdoFWU2u+JbZiT3eYyuxnSktmiQ6WR4hWReXqSU4hGr6dIc9OL9UDp/6YHCE1Sx/I62VQ==
X-Received: by 2002:ac8:7208:0:b0:3a6:8da6:65bc with SMTP id
 a8-20020ac87208000000b003a68da665bcmr20353595qtp.13.1674214765695; 
 Fri, 20 Jan 2023 03:39:25 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 x22-20020ac87316000000b003a530a32f67sm8220487qto.65.2023.01.20.03.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:39:24 -0800 (PST)
Message-ID: <15e767e5-a576-0599-77ed-974d0d412f80@redhat.com>
Date: Fri, 20 Jan 2023 12:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH 6/8] tests/qtest/libqtest: Allow checking for HVF
 accelerator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-7-philmd@linaro.org>
 <fc7802c3-afd7-2cd0-438e-7b75f4789879@redhat.com>
 <b61a6249-3b84-e0cf-6220-029086c72254@linaro.org>
 <147a979d-2d16-4ad3-4330-3e8187f88a2e@redhat.com>
 <c41c336a-d435-ec2a-ab05-2f50c05645df@redhat.com>
 <7fff2e79-16c6-f49e-476d-53db0ce58474@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7fff2e79-16c6-f49e-476d-53db0ce58474@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 20/01/2023 12.18, Philippe Mathieu-Daudé wrote:
> On 20/1/23 11:26, Thomas Huth wrote:
>> On 19/01/2023 13.05, Thomas Huth wrote:
>>> On 19/01/2023 12.30, Philippe Mathieu-Daudé wrote:
>>>> On 19/1/23 12:24, Thomas Huth wrote:
>>>>> On 19/01/2023 11.05, Philippe Mathieu-Daudé wrote:
>>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>>> ---
>>>>>> RFC: CONFIG_HVF is poisoned.
>>>>>>
>>>>>> We could pass host config definitions to qtest using:
>>>>>>
>>>>>>    diff --git a/meson.build b/meson.build
>>>>>>    @@ -2547,6 +2547,7 @@ foreach target : target_dirs
>>>>>>
>>>>>>       accel_kconfig = []
>>>>>>       foreach sym: accelerators
>>>>>>    +    config_host_data.set(sym + '_QTEST', '')
>>>>>>         if sym == 'CONFIG_TCG' or target in 
>>>>>> accelerator_targets.get(sym, [])
>>>>>>           config_target += { sym: 'y' }
>>>>>>           config_all += { sym: 'y' }
>>>>>>
>>>>>> Then test for CONFIG_HVF_QTEST ...
>>>>>
>>>>> I don't think that would really work well. The qtests are build once 
>>>>> for all targets, and HVF is only available in the target that matches 
>>>>> the host architecture. It's poisoned on purpose.
>>>>>
>>>>> The TCG accelerator is special, since we have it in either none or in 
>>>>> all targets, that's why we can use CONFIG_TCG there.
>>>>>
>>>>> The kvm part is also rather a hack... we should maybe rather 
>>>>> additionally use the "query-kvm" QAPI command to check whether it is 
>>>>> really available...?
>>>>>
>>>>> To fix this properly for HVF, I think you'd need a way to query the 
>>>>> available accelerators via QMP, too... Hmmm, weren't there some patches 
>>>>> for something like that in the past ... can't remember right now ...
>>>>
>>>> https://lore.kernel.org/qemu-devel/20210505125806.1263441-3-philmd@redhat.com/ 
>>>> :(
>>>
>>> Ah, right, and we ended up with the competing patch from Igor since we 
>>> could not quite settle on the QAPI extensions?
>>>
>>> Hmm, what happens if you execute "query-qmp-schema" on a HVF-enabled host 
>>> these days? Is there a "hvf"-related entry somewhere in the response?
>>
>> Alternative idea: execute QEMU once with "-accel help" via 
>> g_spawn_command_line_sync() or g_spawn_sync() once and look for the 
>> accelerator in the standard output.
> 
> There is no stability guaranty with the help output.

Sure, it's rather meant as a temporary solution until a proper QMP method is 
in place. We also have the advantage here that it is internal to the QEMU 
repository only - it's not like libvirt or some other upper layers are 
trying to parse the output here.

> QMP is a stable API, we should really rely on it here IMO.

I agree, QMP should certainly be the final goal.

  Thomas


