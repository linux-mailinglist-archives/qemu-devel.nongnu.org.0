Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4076825F2
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 08:55:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMlSu-0004SG-0t; Tue, 31 Jan 2023 02:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMlSi-0004Rp-0R
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:53:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMlSg-0001Nt-9q
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 02:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675151628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cEXGVPuR+1kIiNEBYWErS+zaRqJ4DsRo7by95aOufks=;
 b=dWIpTW9BBfYvTb3To2ZBw5QCZPr3UwSt7C6tI4cwySH560DjDKQ5pqMK5HpaffG3Knj1qU
 J3Ws+NSsKYPXbkMEsoWaV427maOvYDQ1bTFUGIGyLMmJanxSR958Wx94uUqVbc/57VRzMS
 eijRL+KJVZWH401nV2uVyCJy/Zn/n2Q=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-192-4qQSLXygOrO-Z-xSpmUsow-1; Tue, 31 Jan 2023 02:53:47 -0500
X-MC-Unique: 4qQSLXygOrO-Z-xSpmUsow-1
Received: by mail-qv1-f72.google.com with SMTP id
 lp6-20020a056214590600b0053a07384c95so4574500qvb.4
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 23:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cEXGVPuR+1kIiNEBYWErS+zaRqJ4DsRo7by95aOufks=;
 b=lrJFCQ+nWnQEW2z4C1ysfADFTnurEOopbiJ6k4aLargTfASbhKWZS1Vb337NMIIxgs
 4r1BAqy9yVYAkBworbhPFtw/OTzRQSKYHDm7BFLgQfSMvL3Z7LTdFlMGkd/wO+4sMDh9
 O6v25xFcv8L3jqRsd7IaGanBW7aHLtYYtn3WmjmuQjF0aCjBCRmD6SOsGF7lL61S8tWu
 SbkfAkiEJaHQ7Ez9kX2MsVN+Wl6SCGubCaKdcYPM3qy96B6f/1yP/9As3jhE4CdIIR2L
 ey3Y7C6roIPNYZMRd/2oBPcDAFiAJUCSqUL1bqLHYp7e+2rshr3u+kjEX7fzRucwz7K8
 zwbA==
X-Gm-Message-State: AFqh2kp27Ukp0oZL1X50KQpd+pX2xm/krevb/5khOPPtEfOqdC2ql6oc
 ShVyrfb5cX6X6TqNv5rA/3uuKMakUuVc8Td7GkjOruX9XsX/t9SKHOgkEDU7E7i262TqhxFqBCW
 fB7XWKzx9uB156Es=
X-Received: by 2002:ac8:4cc7:0:b0:3ab:2a7f:83e4 with SMTP id
 l7-20020ac84cc7000000b003ab2a7f83e4mr67619100qtv.35.1675151627126; 
 Mon, 30 Jan 2023 23:53:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsH1tOqDduzHdrKnjQGvNCRILkeNy1zeupGW7e9aOHCn/cN3RN8jqWNyTMgz7PVGRJWEtbmQw==
X-Received: by 2002:ac8:4cc7:0:b0:3ab:2a7f:83e4 with SMTP id
 l7-20020ac84cc7000000b003ab2a7f83e4mr67619089qtv.35.1675151626843; 
 Mon, 30 Jan 2023 23:53:46 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-155.web.vodafone.de.
 [109.43.176.155]) by smtp.gmail.com with ESMTPSA id
 l25-20020a37f519000000b006bb82221013sm9537212qkk.0.2023.01.30.23.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 23:53:45 -0800 (PST)
Message-ID: <50f8f9a1-7e88-f6b4-5e1e-4a00c428018e@redhat.com>
Date: Tue, 31 Jan 2023 08:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 5/6] gitlab-ci.d/buildtest: Merge the two gprof-gcov jobs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-6-thuth@redhat.com> <87tu076hpq.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87tu076hpq.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 30/01/2023 18.42, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> There is only one job depending on the build-gprof-gcov job, so
>> there is no real need for keeping this separate. It likely only
>> has been split since the complete runtime is more than 60 minutes,
>> but that can be better handled with a proper timeout setting instead.
>> By merging the two jobs, we safe some precious CI minutes for starting
>> a new container for the second job each time.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 15 ++-------------
>>   1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 86f9c37a07..91c7467a66 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -468,26 +468,15 @@ tsan-build:
>>       MAKE_CHECK_ARGS: bench V=1
>>   
>>   # gprof/gcov are GCC features
>> -build-gprof-gcov:
>> +gprof-gcov:
>>     extends: .native_build_job_template
>>     needs:
>>       job: amd64-ubuntu2004-container
>> +  timeout: 80m
>>     variables:
>>       IMAGE: ubuntu2004
>>       CONFIGURE_ARGS: --enable-gprof --enable-gcov
>>       TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
>> -  artifacts:
>> -    expire_in: 1 days
>> -    paths:
>> -      - build
>> -
>> -check-gprof-gcov:
>> -  extends: .native_test_job_template
>> -  needs:
>> -    - job: build-gprof-gcov
>> -      artifacts: true
>> -  variables:
>> -    IMAGE: ubuntu2004
>>       MAKE_CHECK_ARGS: check
>>     after_script:
>>       - cd build
> 
> I'm tempted to deprecate gprof altogether as I find it hard to believe
> anyone uses it when perf tools give you a much clearer indication of
> where the bottlenecks are in "real world" environments.

Sounds fine to me, too. I'll drop this patch here from my queue. Could you 
send a patch for removing the jobs instead?

  Thomas


