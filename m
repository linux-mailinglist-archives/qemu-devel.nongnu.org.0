Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1536EA283
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 05:58:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pphtl-0005nT-EL; Thu, 20 Apr 2023 23:57:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphth-0005nF-NZ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1pphtZ-0002f0-DT
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 23:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682049427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2R9+j84v3SZps6ZPoxuZMk+JbRfFMGX4gEN52VNSbY=;
 b=ZwLIULtoiR52oxTRoLSFbENEchePXzGW1fSa69Cv6k8eW0WW7lWzqeDkMdYX5VVHYrgJjh
 4jCulEgqOVqLq4S+3WX6N7VWAit+hmPyvj9qRtyFH7xY6UNIPt8RLUWkK9gvZOGjdNKQqe
 4x5409wyURjkYQOWZVFndPEn5fajNtk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-Y42mi4QHPm2s5XGLkIG_rg-1; Thu, 20 Apr 2023 23:57:02 -0400
X-MC-Unique: Y42mi4QHPm2s5XGLkIG_rg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-3ef3c41a1ceso9509121cf.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 20:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682049422; x=1684641422;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D2R9+j84v3SZps6ZPoxuZMk+JbRfFMGX4gEN52VNSbY=;
 b=Ms6YPjw45l4fU2+GBCU10zDxGqmTXhuEWmWOkMGiRZfTdC2mHhuVV9piw21RsKTfTr
 ULHVl7QgjWXlwrkZFHfZg8c5+5omWqRuWFL7pKAxuT1G/PbyoSkzLugSgDNGneJNlTLL
 V6bs3II+4sPq73pJSsde5WXh7vzlTvN8kAHDgnCeWUg7adWtSkRGPzSqDMbNzQPVXmWp
 0K85uYai9Lnq7FrcxMBRey0MvCn3fLwQo4WUf35GCxF+MhMjWdTGTZ8gP34tUhC5zWe1
 Aq+6EJw7bjIeER4lkWuKJFXJ3xVBT5ed8F9L0B1oyqOnA8lVVHCgTNBd3nxrd67n3Prj
 E6hQ==
X-Gm-Message-State: AAQBX9cQ3+k7fhPbdF8Zb4JhO20jGd1QQBwvkBf4C+fI5qsVeSgcMDy/
 flfqvz9C1cduIS7OUenmeunk++TlLj1wHFkE8+ziFzXgWchkJx2S3ir80wantkKiy/4fmgKITCv
 0wsOq6oFg/E1Ij0Y=
X-Received: by 2002:ac8:7d50:0:b0:3ed:ac62:1039 with SMTP id
 h16-20020ac87d50000000b003edac621039mr6299376qtb.8.1682049422133; 
 Thu, 20 Apr 2023 20:57:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/7ZHEJbOVyZQBJqIi2dbRuv5TBlvJJ8qgBKkAwZMCAoAsIYNrOJtIclp3+sN/EnLboqGRyw==
X-Received: by 2002:ac8:7d50:0:b0:3ed:ac62:1039 with SMTP id
 h16-20020ac87d50000000b003edac621039mr6299347qtb.8.1682049421856; 
 Thu, 20 Apr 2023 20:57:01 -0700 (PDT)
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5?
 ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
 by smtp.gmail.com with ESMTPSA id
 1-20020a370701000000b0070648cf78bdsm985413qkh.54.2023.04.20.20.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 20:57:01 -0700 (PDT)
Message-ID: <6096da77-6488-7702-78bb-3c0390bb825d@redhat.com>
Date: Thu, 20 Apr 2023 23:56:59 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Jan Richter <jarichte@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
 <20230417134321.3627231-2-alex.bennee@linaro.org>
 <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <CAFn=p-bqK-RsMo8wVy2zCxU=iAkXG1t9xVuoqLSN0UbTYKPgwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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


On 4/17/23 12:50, John Snow wrote:
> On Mon, Apr 17, 2023 at 9:43 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>
>> Avocado version 101.0 has a fix to re-compute the checksum
>> of an asset file if the algorithm used in the *-CHECKSUM
>> file isn't the same as the one being passed to it by the
>> avocado user (i.e. the avocado_qemu python module).
>> In the earlier avocado versions this fix wasn't there due
>> to which if the checksum wouldn't match the earlier
>> checksum (calculated by a different algorithm), the avocado
>> code would start downloading a fresh image from the internet
>> URL thus making the test-cases take longer to execute.
>>
>> Bump up the avocado-framework version to 101.0.
>>
>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>> Message-Id: <20230330101141.30199-10-alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>> ---
>>   tests/Makefile.include | 18 +++++++++++-------
>>   tests/requirements.txt |  2 +-
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>   # download all vm images, according to defined targets
>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
>>
>> +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter -j%,$(MAKEFLAGS))))
>> +
>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -       $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -                       --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +       $(call quiet-command,                                                   \
>> +            $(TESTS_PYTHON) -m avocado                                                 \
>> +            --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR)  \
>> +            $(if $(AVOCADO_TAGS),,                                             \
>> +                       --filter-by-tags-include-empty                          \
>> +                       --filter-by-tags-include-empty-key)                     \
>> +               --max-parallel-tasks $(JOBS_OPTION:-j%=%)                       \
>> +            $(AVOCADO_CMDLINE_TAGS)                                            \
>> +            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS),                   \
>>               "AVOCADO", "tests/avocado")
>>
>>   check-acceptance-deprecated-warning:
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..a6f73da681 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -2,5 +2,5 @@
>>   # in the tests/venv Python virtual environment. For more info,
>>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>   # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework==88.1
>> +avocado-framework==101.0
>>   pycdlib==1.11.0
>> --
>> 2.39.2
>>
> I thought there were test failures that prohibited us from bumping the
> Avocado-Framework version. Did those get rectified recently?
>
Hi John,

While testing before and after behavior of pretty much every test in 
tests/avocado/,  I've found that some tests may get affected by the 
extra isolation (and overhead) of the new runner in recent Avocado and 
may get interrupted more often than on the previous runner.  But this is 
highly dependent on the amount of resources the machine you run the 
tests on has, and how tight the current timeout is.

Running all the tests under old and new Avocado also revealed some tests 
that are equally broken under both versions.  Thomas has bisected some, 
and Cedric has come up with some patches too.

To risk not being too verbose by default, let me know if you want the 
full details.  Also, see my previous reply about the two issues I'm 
aware that would make this bump as seamless as possible.

Thanks,

- Cleber.


