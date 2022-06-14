Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E624F54A837
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:36:45 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yIH-0000WM-25
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yCf-0003Rg-DJ
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:30:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o0yCc-0003K9-As
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655181053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAkgUVoIihxvqPGRWWs5cZ3mRqCepECImWtcwEa/t8k=;
 b=KnXGISEnvFWGYS9hkBTZONciMs7ofue2oUiMoAEBhMtJXrbcNSwVB+lDDjRrG4LsXWc1RT
 mv2Jny1n4mGiaqtiINWh7Afc9XWvoM0Zz0dxD1nrnt764pSFKCRDkPJNYh4jAVUJ0yvNfT
 gbdcgI2rDZgDGlZT7KA2srMrKXLr9/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-LG6yVzqWMeiw3mKQvr6UJQ-1; Tue, 14 Jun 2022 00:30:50 -0400
X-MC-Unique: LG6yVzqWMeiw3mKQvr6UJQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j20-20020a05600c1c1400b0039c747a1e5aso4237693wms.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KAkgUVoIihxvqPGRWWs5cZ3mRqCepECImWtcwEa/t8k=;
 b=bMWeN5WS8bEUJLI1b1K2z4l9LrArqkw3QBZYISjMVt5T9fbmMIF0LO1srpFVD4hkPZ
 EbjToczyEVQFFaTNhSmC2NDbKX6e5Vn9S1zzsFe91XuCrZ8UWf7Gq8EGUzbTJCjUpvkH
 5d8vkfJLneeVsjICrCOLXC9bV+gg0X+JTQgkzFpbhr4/ScKiudSQ7Gf24br9hT04Y935
 dy6ed1jUOhLlacAxmks2pRDcJQzQLRNYjUefxMF62L+B7eVTXXPKlDZa0ReQ4eIXCrQb
 TfhcVNa6NlMonkZ++YjgwYDmg+WhxlcqqCDeSLwXlIfMfNfBd1iQFl0VBSPnOkt/sSEu
 8aHA==
X-Gm-Message-State: AJIora+tQWBZZhC0LmRzHLlDjiyqFgAJTxr9SPDWafZTPGmJ6T4UU0kM
 v3/hQRITDzTmTItEDS30hQzBKip7ROr1JjHmpILCgUcf8CPcHvgrzv3BMaRQ7wGhLMjFXQrmW38
 B+zJOxx/vD7XcuCI=
X-Received: by 2002:adf:f610:0:b0:213:b4e1:7276 with SMTP id
 t16-20020adff610000000b00213b4e17276mr2704843wrp.712.1655181049312; 
 Mon, 13 Jun 2022 21:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uMG+KrPAZm/7KaEVal9Jko8bfq5VGK6XK8qb1WNZLRAmEQftrsGkvxef47T7GsTAq3eLlKMQ==
X-Received: by 2002:adf:f610:0:b0:213:b4e1:7276 with SMTP id
 t16-20020adff610000000b00213b4e17276mr2704825wrp.712.1655181049047; 
 Mon, 13 Jun 2022 21:30:49 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-42-114-75.web.vodafone.de.
 [109.42.114.75]) by smtp.gmail.com with ESMTPSA id
 w3-20020a5d6083000000b00219b932ffc8sm10546908wrt.1.2022.06.13.21.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 21:30:48 -0700 (PDT)
Message-ID: <8ad852ab-9580-fc52-b641-679a70212245@redhat.com>
Date: Tue, 14 Jun 2022 06:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 3/7] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220613171258.1905715-1-alex.bennee@linaro.org>
 <20220613171258.1905715-4-alex.bennee@linaro.org>
 <39615b6d-6454-2a4f-013e-478766e0c3f8@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <39615b6d-6454-2a4f-013e-478766e0c3f8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/06/2022 23.46, Richard Henderson wrote:
> On 6/13/22 10:12, Alex Bennée wrote:
>> From: Thomas Huth <thuth@redhat.com>
>>
>> The job definitions recently got a second "variables:" section by
>> accident and thus are failing now if one tries to run them. Merge
>> the two sections into one again to fix the issue.
>>
>> And while we're at it, bump the timeout here (70 minutes are currently
>> not enough for the aarch64 job). The jobs are marked as manual anyway,
>> so if the user starts them, they want to see their result for sure and
>> then it's annoying if the job timeouts too early.
>>
>> Fixes: e312d1fdbb ("gitlab: convert build/container jobs to 
>> .base_job_template")
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>> Message-Id: <20220603124809.70794-1-thuth@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
>>   1 file changed, 10 insertions(+), 12 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 544385f5be..cb7cad44b5 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -357,16 +357,15 @@ build-cfi-aarch64:
>>         --enable-safe-stack --enable-slirp=git
>>       TARGETS: aarch64-softmmu
>>       MAKE_CHECK_ARGS: check-build
>> -  timeout: 70m
>> -  artifacts:
>> -    expire_in: 2 days
>> -    paths:
>> -      - build
>> -  variables:
>>       # FIXME: This job is often failing, likely due to out-of-memory 
>> problems in
>>       # the constrained containers of the shared runners. Thus this is 
>> marked as
>>       # skipped until the situation has been solved.
>>       QEMU_JOB_SKIPPED: 1
>> +  timeout: 90m
>> +  artifacts:
>> +    expire_in: 2 days
>> +    paths:
>> +      - build
> 
> FWIW, 90 minutes was close, but insufficient:
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/2584472225

Hmm, it was working at least once for me while I was working on the patch. 
But as I already wrote here:

  https://lists.gnu.org/archive/html/qemu-devel/2022-06/msg00463.html

I think nobody really used this build-cfi-aarch64 in month ... so we should 
maybe have a try with the 90 min timeout first (maybe the CI servers were 
just a little bit overloaded when you tried), but if the test continues to 
hit the 90 minutes timeout, I'd say we rather delete it instead of bumping 
the timeout even further. 90 minutes are really very close to the pain level 
already - at least for me.

> But certainly, let us fix the job definition:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

  Thomas


