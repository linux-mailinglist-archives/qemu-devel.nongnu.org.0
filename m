Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D71415B9A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 11:59:07 +0200 (CEST)
Received: from localhost ([::1]:45664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTLVS-00016q-Ix
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 05:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTLPo-0002rZ-EV
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:53:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mTLPk-0007AX-9q
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 05:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632390790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znEKDeRfR6/eD+6k0XHcsDEDFxhZ/35Ff40JT/A5Sak=;
 b=YO92MthWBs620FXfy8PV1zamPyrwbVyPA3l2H2LYqVlYNp3U8Qkq7ON98ENi+eUdRuPLrh
 o7Uy8xPywgYIFDsLTjamm4bRSFZD0Is0ZNp5ea74aqnOQe8rR59g9rFvdMQUncViq5KY0c
 1G8tDxMDwJC8AmUT6D7yYG9BHuCtwcs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-_771_1GvNjSoSY9BnJUewQ-1; Thu, 23 Sep 2021 05:53:09 -0400
X-MC-Unique: _771_1GvNjSoSY9BnJUewQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k2-20020adfc702000000b0016006b2da9bso4677661wrg.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 02:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=znEKDeRfR6/eD+6k0XHcsDEDFxhZ/35Ff40JT/A5Sak=;
 b=zkr/6E37gqUfKTu2AOeN4I252EzuB0SL+3fMSvknT0aPC+u7CMecjOjYDsK0i5SzhM
 NmkR98rD37xPJGs1wyJ9qfmEP1fGRpKjEDfz7Wpl8f7YEo6FvFqphrUfs0E7DwCvIH7p
 yfSWyddb/7NV8Sen7pQfqLPLiDSaSE+RLQ56po+gjGzkqPCUVriOsU2+3oq+CpTWDKyR
 PjekZ0ft9pOgecFzGu/CUW65B12eEJ7RnpQr843p5+vZU17JtwAu0vqyqQXBQtG4tSof
 FlekNkU8KasDZnYue0zNPQE4FGgQ1lfcFLfwBuz3lSIqHve/EeU0v1tIPIoLvkpDt3va
 OjJQ==
X-Gm-Message-State: AOAM533dIOD6WNmxrKzzYZNJgc3VBrk31kacaS93m6Z33VA4yiqe2OvT
 TcPnZlYSePkV2yjd1b5BLhrrpUYXxSkGawX8zMN3mhbmVrL2B6PlRsC5K2lWWRSo88rN/8OrWA8
 CMIa0vmZAAv0Pwao=
X-Received: by 2002:a7b:c409:: with SMTP id k9mr14786738wmi.153.1632390788276; 
 Thu, 23 Sep 2021 02:53:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysLu4G6+LYqb1PvD87QILHrksMaYIyuWmg/Wjm7llgjWU+MGS3P9hfCnOx86KWKpvjCFk2uA==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr14786721wmi.153.1632390788117; 
 Thu, 23 Sep 2021 02:53:08 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id b207sm4923774wmb.29.2021.09.23.02.53.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 02:53:07 -0700 (PDT)
Message-ID: <b8baf1da-ca95-88b0-49eb-6245c52e60e8@redhat.com>
Date: Thu, 23 Sep 2021 11:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] tests/Makefile: add TESTFILES option to make
 check-acceptance
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210922190324.190227-1-willianr@redhat.com>
 <20210922190324.190227-3-willianr@redhat.com>
 <1fba1ffa-559b-7c5b-24e0-817f4b855fc5@redhat.com>
 <CAKJDGDbu_DeP25QtvQcM6C0Kt+tXE-7caZaoGL0rcJObZgprKg@mail.gmail.com>
 <2235e846-cfd6-6c67-1e03-dd1ecc38d198@redhat.com>
 <YUxMAJiCW+llt5ml@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YUxMAJiCW+llt5ml@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 11:42, Daniel P. Berrangé wrote:
> On Thu, Sep 23, 2021 at 11:34:18AM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/22/21 21:46, Willian Rampazzo wrote:
>>> On Wed, Sep 22, 2021 at 4:08 PM Philippe Mathieu-Daudé
>>> <philmd@redhat.com> wrote:
>>>>
>>>> On 9/22/21 21:03, Willian Rampazzo wrote:
>>>>> Add the possibility of running all the tests from a single file, or
>>>>> multiple files, running a single test within a file or multiple tests
>>>>> within multiple files using `make check-acceptance` and the TESTFILES
>>>>> environment variable.
>>>>>
>>>>> Signed-off-by: Willian Rampazzo <willianr@redhat.com>
>>>>> ---
>>>>>     docs/devel/testing.rst | 27 +++++++++++++++++++++++++++
>>>>>     tests/Makefile.include |  5 ++++-
>>>>>     2 files changed, 31 insertions(+), 1 deletion(-)
>>>>
>>>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>>>> index 6e16c05f10..82d7ef7a20 100644
>>>>> --- a/tests/Makefile.include
>>>>> +++ b/tests/Makefile.include
>>>>> @@ -88,6 +88,9 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>>>>>     TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
>>>>>     TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
>>>>>     TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
>>>>> +ifndef TESTFILES
>>>>> +     TESTFILES=tests/acceptance
>>>>> +endif
>>>>>     # Controls the output generated by Avocado when running tests.
>>>>>     # Any number of command separated loggers are accepted.  For more
>>>>>     # information please refer to "avocado --help".
>>>>> @@ -130,7 +133,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>>>>>                 --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>>>>>                 --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
>>>>>                 $(AVOCADO_TAGS) \
>>>>> -            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
>>>>> +            $(if $(GITLAB_CI),,--failfast) $(TESTFILES), \
>>>>
>>>> Since this is Avocado specific, maybe call the variable
>>>> AVOCADO_TESTFILES (similar to AVOCADO_TAGS)?
>>>
>>> I don't see a problem with changing that to AVOCADO_TESTFILES. I was
>>> trying to make things shorter and easy to remember. If the too-long
>>> variable name is not a problem, I can change that.
>>
>> This is the generic tests/Makefile, so $TESTFILES might be confusing,
>> which is why I prefer the explicit AVOCADO_ prefix (AVOCADO_SHOW,
>> AVOCADO_TAGS).
> 
> IIUC, this is not actually just test files - it is test files plus the
> test names. So better just  $(AVOCADO_TESTS)

Good point, I agree.


