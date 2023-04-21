Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6276EA3C5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:22:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppk9M-000148-Pq; Fri, 21 Apr 2023 02:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppk9K-00013r-JT
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:21:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppk9I-0002wP-I4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:21:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682058094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P9aCUW1rzu5AelnfWVsFeaoXGem/sTQovNbaiabceSE=;
 b=PQGJmbQ2YIUPcp9Q/mW2Lni0bdgtrR1GqcDp/1gNfb1i9Z9aI6uxMoIsVITD8TVSzw3cMs
 hXhUkAivT8AEIwolE7oQFlrpz4A6OqCxD/94H7KtOKhvsgxRTL/1Rj9A45mqL60zEHuGVc
 v4IFBSBp25D+RaqPlNUj2VWh2G1IyEA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-h3SlFm9UPT-tSd0Q4PvkOw-1; Fri, 21 Apr 2023 02:21:32 -0400
X-MC-Unique: h3SlFm9UPT-tSd0Q4PvkOw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-50470d68f1eso1173297a12.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682058092; x=1684650092;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P9aCUW1rzu5AelnfWVsFeaoXGem/sTQovNbaiabceSE=;
 b=NRbV88yKUolW+Rk8RsY3YbRVs2ASlYqkBYC1hUfNDrTEOPizj7rw6WM5zkQ5n8/Vz5
 C4IMQjMM33WgF3AXEaop7gGdcgUazU2wxH0GuCk3BwYep3vHOZ+zePHquolve06emZWJ
 RB5zBF1MG2CFRPAmO8dB/Hy94zMj0qhJT5vGBDMTyyEurcJvsCjuQLU8+kNrLx5/mX3J
 SMOQbamK5tbScRi2oOjsV+s80MtUgd1VdulYQ3gVOcIJO24EGVncMqZodzULD5OzObGr
 OJeCqDIhU2owTFvMlOHXEB1iDA7cwX6F4OcHf1IDFKpgHujOIoTTKMCukUZZR2jpNeSW
 qbvw==
X-Gm-Message-State: AAQBX9c9fjag8Nb+thPFvpzW7j+vspK0ov1cqwxWDK2BytIvIZvCYQDF
 DVdQCLzR0PpvsWDgqVZyOYeQtwdJrA2uFJN81KGrko/WgpigEDLiuCfJTEemb20otYzqrjdjBRr
 2PFz8BLub/4dnr10=
X-Received: by 2002:a05:6402:798:b0:506:adea:aaf2 with SMTP id
 d24-20020a056402079800b00506adeaaaf2mr3793350edy.18.1682058091832; 
 Thu, 20 Apr 2023 23:21:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350a/SyN05q3H6/AYdIvmfe/CFsWmC/jvFi3hhnKWa05YBxPhQQTaiVuB92esqvq8vVXPuVhMVA==
X-Received: by 2002:a05:6402:798:b0:506:adea:aaf2 with SMTP id
 d24-20020a056402079800b00506adeaaaf2mr3793333edy.18.1682058091496; 
 Thu, 20 Apr 2023 23:21:31 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 r22-20020aa7cb96000000b0050696c2d2f6sm1506487edt.88.2023.04.20.23.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:21:30 -0700 (PDT)
Message-ID: <7836af42-9969-a01a-3c8c-717987b0b27e@redhat.com>
Date: Fri, 21 Apr 2023 08:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
 <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21/04/2023 06.19, Cleber Rosa wrote:
> 
> On 4/18/23 03:10, Thomas Huth wrote:
>> On 17/04/2023 15.43, Alex Bennée wrote:
>>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>>
>>> Avocado version 101.0 has a fix to re-compute the checksum
>>> of an asset file if the algorithm used in the *-CHECKSUM
>>> file isn't the same as the one being passed to it by the
>>> avocado user (i.e. the avocado_qemu python module).
>>> In the earlier avocado versions this fix wasn't there due
>>> to which if the checksum wouldn't match the earlier
>>> checksum (calculated by a different algorithm), the avocado
>>> code would start downloading a fresh image from the internet
>>> URL thus making the test-cases take longer to execute.
>>>
>>> Bump up the avocado-framework version to 101.0.
>>>
>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>>
>>> ---
>>> v2
>>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>>> ---
>>>   tests/Makefile.include | 18 +++++++++++-------
>>>   tests/requirements.txt |  2 +-
>>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 9422ddaece..a4de0ad5a2 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>>   # download all vm images, according to defined targets
>>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, 
>>> $(FEDORA_31_DOWNLOAD))
>>>   +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
>>> +
>>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>> -    $(call quiet-command, \
>>> -            $(TESTS_PYTHON) -m avocado \
>>> -            --show=$(AVOCADO_SHOW) run 
>>> --job-results-dir=$(TESTS_RESULTS_DIR) \
>>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>>> -            --filter-by-tags-include-empty-key) \
>>> -            $(AVOCADO_CMDLINE_TAGS) \
>>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>>> +    $(call quiet-command,                             \
>>> +            $(TESTS_PYTHON) -m avocado \
>>> +            --show=$(AVOCADO_SHOW) run 
>>> --job-results-dir=$(TESTS_RESULTS_DIR)     \
>>> +            $(if $(AVOCADO_TAGS),,                         \
>>> +            --filter-by-tags-include-empty                 \
>>> +            --filter-by-tags-include-empty-key)             \
>>> +        --max-parallel-tasks $(JOBS_OPTION:-j%=%)             \
>>> +            $(AVOCADO_CMDLINE_TAGS)                         \
>>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),             \
>>
>> We might need to revisit this --failfast logic, too. If I've got that 
>> right, failfast is now the default with the new system? So we might want 
>> to disable it by default again if GITLAB_CI is not set?
>>
>>  Thomas
>>
> Hi Thomas,
> 
> I must be missing something, because under Avocado 101.0, I'm getting the 
> following behavior without the --failfast flag:
> 
>    $ avocado run --max-parallel-tasks=1 -- /bin/true /bin/false /bin/true
>    JOB ID     : 646f476f01b8d5599a57530606de543f2d9a5366
>    JOB LOG    : /root/avocado/job-results/job-2023-04-21T04.15-646f476/job.log
>     (1/3) /bin/true: STARTED
>     (1/3) /bin/true: PASS (0.01 s)
>     (2/3) /bin/false: STARTED
>     (2/3) /bin/false: FAIL (0.01 s)
>     (3/3) /bin/true: STARTED
>     (3/3) /bin/true: PASS (0.01 s)
>    RESULTS    : PASS 2 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | 
> CANCEL 0
>    JOB TIME   : 1.01 s
> 
>    Test summary:
>    /bin/false: FAIL
> 
> And this with --failfast:
> 
>    $ avocado run --failfast --max-parallel-tasks=1 -- /bin/true /bin/false 
> /bin/true
>    JOB ID     : ae4894607a42194a7382efa545eccaccf7495fa3
>    JOB LOG    : /root/avocado/job-results/job-2023-04-21T04.17-ae48946/job.log
>     (1/3) /bin/true: STARTED
>     (1/3) /bin/true: PASS (0.01 s)
>     (2/3) /bin/false: STARTED
>     (2/3) /bin/false: FAIL (0.01 s)
>    Interrupting job (failfast).
>    RESULTS    : PASS 1 | ERROR 0 | FAIL 1 | SKIP 1 | WARN 0 | INTERRUPT 0 | 
> CANCEL 0
>    JOB TIME   : 0.75 s
> 
>    Test summary:
>    /bin/false: FAIL
> 
> Maybe it's something in the Makefile I'm missing, or something specific to 
> these tests, but that would be a long shot.

Ah, thanks, I think I simply got it mixed up while trying to read the above 
Makefile logic - never mind my question, it should be fine.

  Thomas


