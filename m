Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B97519B9F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:25:22 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBG4-0003iS-R5
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB9a-00089F-2e
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmB9X-0002RV-LQ
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:18:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651655915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6kx50nvry8VzJhmCyYYwu7bhIg9sBCtj5QBwcWXZUtA=;
 b=G3ARCsL1TmQeqOhUx6TYVhC0hQSDaPodEMpQLizi0ZUeiO/MGFw7gWEH0ZXMsmb+tm2+NG
 vUa5l+d2FkL1fx1Pc3Pu0z3CEVR535ZdPszNWKJolF/m5MRpl7goJ3OBN9169FjGi4v4/0
 V55/hy7jQ8daJkdP13XvwgKcwRO2Fjs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-V65ErMNjP7-1MUA9ZWpwzg-1; Wed, 04 May 2022 05:18:33 -0400
X-MC-Unique: V65ErMNjP7-1MUA9ZWpwzg-1
Received: by mail-wm1-f69.google.com with SMTP id
 g14-20020a1c4e0e000000b0039425ef54d6so392091wmh.9
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6kx50nvry8VzJhmCyYYwu7bhIg9sBCtj5QBwcWXZUtA=;
 b=VXvHassfNz4rA7VWGRDjK+lHMQG3K2wq8stteB5xQLui+EGzrTB0gDlhHq16OM+eVO
 IbgXG7oErg6RWFdmB7VgwN/RufMQfdxXG17QzO21ikLPANPykeGgygDY3ikJZZHIf/p9
 cIG1usv84GcTmnYxlDcaaqWVLB/2y6aE70sZL8c4weGLDwdf4f9TwFwLHhNaZqyeXvEp
 zADt64G/LVFVPjFjtsRN2KFvAicVJBExcbdwYDiHZ3Z3ghUHNdiZ9K4cJD9nnSXEOMSw
 tX5OxMME5Z5jb1SDaxG+Nbx21/uOHdWSI6QuOvnkZUHSgqo8udH100ceIvUtAIjGPoI4
 7nsg==
X-Gm-Message-State: AOAM533z5a5U3pmuSC02Mw13j4dNE07mhuvi/VM3ZzPENvEUch0pooar
 Tbqh6a3cyW2DrTyESXk+TNYV7g65mGqFsYlE3LTQsCRt6My/Cj/IST/uoPeNu51r33JjjH28z6t
 eNPyh0vvS+z+WeSY=
X-Received: by 2002:a5d:6481:0:b0:20c:6b71:211f with SMTP id
 o1-20020a5d6481000000b0020c6b71211fmr8115451wri.666.1651655912646; 
 Wed, 04 May 2022 02:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzilk/X5o5Ir4ZrkHCt2boUJ5WA2HE5ExBhIc07KbLT0PN4Q3WzNrlYOt6Nr+X8s/dvOHng/Q==
X-Received: by 2002:a5d:6481:0:b0:20c:6b71:211f with SMTP id
 o1-20020a5d6481000000b0020c6b71211fmr8115434wri.666.1651655912423; 
 Wed, 04 May 2022 02:18:32 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-177-80.web.vodafone.de.
 [109.43.177.80]) by smtp.gmail.com with ESMTPSA id
 d14-20020adfa40e000000b0020c5253d8casm11202801wra.22.2022.05.04.02.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 02:18:31 -0700 (PDT)
Message-ID: <e3fe483b-f304-38af-bbfb-a65b2f350843@redhat.com>
Date: Wed, 4 May 2022 11:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH] gitlab-ci: Switch the 'check-patch' & 'check-dco'
 jobs to use python-container
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220503203621.243153-1-thuth@redhat.com>
 <YnJDZp809F14a0DB@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YnJDZp809F14a0DB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 04/05/2022 11.12, Daniel P. Berrangé wrote:
> On Tue, May 03, 2022 at 10:36:21PM +0200, Thomas Huth wrote:
>> The 'check-patch' and 'check-dco' jobs only need Python and git for
>> checking the patches, so it's not really necessary to use a container
>> here that has all the other build dependencies installed. By installing
>> "git" in the python container, we can use this light-weight container
>> for these jobs instead.
> 
> Our python container is far from light-weight....
> 
> $ time podman pull registry.gitlab.com/qemu-project/qemu/qemu/python
> 
> real	1m52.717s
> user	1m32.327s
> sys	0m19.453s
> 
> vs
> 
> $ time podman pull python:3.8-alpine
> 
> real	0m4.509s
> user	0m3.780s
> sys	0m1.052s
> 
> 
> It is quicker to use the alpine python container and then just
> install 'git' on every job, than it is to use the pre-built
> qemu python container
> 
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Mark as RFC since I'm not sure whether we want to have "git" in
>>   the python container or not?
>>
>>   .gitlab-ci.d/static_checks.yml         | 8 ++++----
>>   tests/docker/dockerfiles/python.docker | 1 +
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
>> index 5e955540d3..0e080bd0a0 100644
>> --- a/.gitlab-ci.d/static_checks.yml
>> +++ b/.gitlab-ci.d/static_checks.yml
>> @@ -1,8 +1,8 @@
>>   check-patch:
>>     stage: build
>> -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>     needs:
>> -    job: amd64-centos8-container
>> +    job: python-container
>>     script:
>>       - .gitlab-ci.d/check-patch.py
>>     variables:
>> @@ -15,9 +15,9 @@ check-patch:
>>   
>>   check-dco:
>>     stage: build
>> -  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
>> +  image: $CI_REGISTRY_IMAGE/qemu/python:latest
>>     needs:
>> -    job: amd64-centos8-container
>> +    job: python-container
>>     script: .gitlab-ci.d/check-dco.py
>>     variables:
>>       GIT_DEPTH: 1000
> 
> IOW this is sufficient:
> 
>    image: python:3.8-alpine
>    needs: []
>    before_script:
>      - apk update
>      - apk add git
>    script: ./gitlab-ci.d/check-dco.py
> 
> 
> I expect the same would work for check-patch.py container

... or would it make sense to switch tests/docker/dockerfiles/python.docker 
to use alpine instead of fedora?

  Thomas



