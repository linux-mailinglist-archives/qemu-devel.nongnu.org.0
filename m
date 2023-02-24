Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC36A17AC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:04:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVT3F-0002uo-2Y; Fri, 24 Feb 2023 03:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVT3C-0002tE-EM
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:03:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVT39-0002R5-Mi
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:03:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677225807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DM0V2zS3o5V6dECkYKLUkAKZb/qLxy8TqFl8E5W1t20=;
 b=Sl9LMMgxToIl1/vql0Qq7RhBJiehU3RGSlZec+j0RMECV92umZ6gBAxoTpAfTyo/IArvbp
 vBNZ1w91zQXmexz0uTI/9oL5O54V1DqB6sO6PfJoG1tcWE6NpBNdyOhGCFHFDYEw3ipwNY
 /IAfr9YjJDflLwXO4OLVK6NFwbtdH/g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-CORe-uEiMkuo-YYG4M9fqg-1; Fri, 24 Feb 2023 03:03:25 -0500
X-MC-Unique: CORe-uEiMkuo-YYG4M9fqg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k20-20020a05600c1c9400b003e2249bd2b4so6190876wms.5
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:03:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DM0V2zS3o5V6dECkYKLUkAKZb/qLxy8TqFl8E5W1t20=;
 b=nriFiHXtx7c5v421gbCa2tbXRrN1eZGgLeZcBqjiMhi4ijgv0iaQPYzC4KzI/F2dPY
 WqTPJBIhbOx6+UYI/BiyvXrgRe3g+sCdTrGO2UVPxEWc+mB6Dt2peXp4EWkLbyV+TFxm
 Wc+gWvTguCGM0vc9yxC/xz3aZjFa6Uen1XUDVb7QX7GrzA75qw4wtd+SLg4SchS1OVEm
 ICXjGfD1cTdlMw482GPavJDw88FLFQARIuePF+4QIuUGzuLYJzfVdttf+eYB7ompcREu
 mgSeJ+zNCFC4MZchyasnR3sp18N9xC11uSCxgp3IjegdcU08t5J49GF3d4tH8ORTTkaJ
 ofAQ==
X-Gm-Message-State: AO0yUKVpdwHQxOwIiuFNInxGPWfnI/xdbXvldf0RKTXt11U45sjd+Mme
 klrlTAypE/KQyo2+fTTKgJx9BAxGUnQG1HJdEvkzb8dVJEp8/8I27NSV9VmViuRt4y/sS6TXNWq
 E2WN3uh64DYi6R8XQqEpyplg=
X-Received: by 2002:adf:e241:0:b0:2c3:ddbe:d7b2 with SMTP id
 bl1-20020adfe241000000b002c3ddbed7b2mr12242481wrb.62.1677225804496; 
 Fri, 24 Feb 2023 00:03:24 -0800 (PST)
X-Google-Smtp-Source: AK7set+Zj1p0XoEHfo0sxY4/xkunrgHAYTUxRr09CX8d6J2ZbIJk3sslmpEre94tnMTXYNiSZ/0vmA==
X-Received: by 2002:adf:e241:0:b0:2c3:ddbe:d7b2 with SMTP id
 bl1-20020adfe241000000b002c3ddbed7b2mr12242460wrb.62.1677225804220; 
 Fri, 24 Feb 2023 00:03:24 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 i8-20020a5d5228000000b002c70851bfcasm7671591wra.28.2023.02.24.00.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:03:23 -0800 (PST)
Message-ID: <dfbe74ab-9241-bef4-81d0-13b0550ad01e@redhat.com>
Date: Fri, 24 Feb 2023 09:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] .gitlab-ci.d/base: Mark jobs as interruptible by default
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Daniel P Berrange <berrange@redhat.com>
References: <20230223191343.1064274-1-thuth@redhat.com>
 <584c71cb-02e1-9386-44d7-ca2ce1c3253e@linaro.org>
 <56bf3f6b-92bd-0c89-b17b-1056ba02c4df@redhat.com>
 <9233b676-cc06-cc79-cd39-394d078d3109@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <9233b676-cc06-cc79-cd39-394d078d3109@linaro.org>
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

On 24/02/2023 09.01, Philippe Mathieu-Daudé wrote:
> On 24/2/23 07:22, Thomas Huth wrote:
>> On 23/02/2023 21.23, Philippe Mathieu-Daudé wrote:
>>> On 23/2/23 20:13, Thomas Huth wrote:
>>>> When handling pull requests in the staging branch, it often happens
>>>> that one of the job fails due to a problem, so that the pull request
>>>> can't be merged. Peter/Richard/Stefan then informs the sender of the
>>>> pull request and continues by pushing the next pending pull request
>>>> from another subsystem maintainer. Now the problem is that there might
>>>> still be lots of other running jobs in the pipeline of the first pull
>>>> request, eating up precious CI minutes though the pipeline is not
>>>> needed anymore. We can avoid this by marking the jobs as "interruptible".
>>>> With this setting, the jobs from previous pipelines are automatically
>>>> terminated when pushing a new one. If someone does not like this auto-
>>>> matic termination, it can still be disabled in the settings of the
>>>> repository. See this URL for details:
>>>>
>>>>   https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>   .gitlab-ci.d/base.yml | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
>>>> index 50fb59e147..0274228de8 100644
>>>> --- a/.gitlab-ci.d/base.yml
>>>> +++ b/.gitlab-ci.d/base.yml
>>>> @@ -11,6 +11,8 @@
>>>>       # and show the duration of each line.
>>>>       FF_SCRIPT_SECTIONS: 1
>>>> +  interruptible: true
>>>
>>> It makes sense for mainstream, but seems counter-productive in forks.
>>> At least in my maintainer use case.
>>>
>>> Is it possible to add a 'default' in .gitlab-ci.d/qemu-project.yml,
>>> so we can overwrite with a different namespace? 'interruptible' is
>>> listed in https://docs.gitlab.com/ee/ci/yaml/index.html#default.
>>
>> As I wrote in the commit description: "If someone does not like this 
>> automatic termination, it can still be disabled in the settings of the 
>> repository."
>>
>> See here for how to change the setting:
>>
>>
>> https://docs.gitlab.com/ee/ci/pipelines/settings.html#auto-cancel-redundant-pipelines 
>>
> 
> Oh I couldn't find this. Do you mind listing this URL in the commit
> description?

It's linked from https://docs.gitlab.com/ee/ci/yaml/index.html#interruptible 
(which I mentioned already in the commit description) ... isn't that enough?

  Thomas



