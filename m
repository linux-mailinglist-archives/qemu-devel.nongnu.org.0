Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B47A16EA2A3
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 06:20:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppiEz-00060u-Or; Fri, 21 Apr 2023 00:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ppiEx-00060k-NT
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:19:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ppiEw-0006gL-5i
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 00:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682050757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L1oZHDQLPG2gM87D0eT39CvXVL5Vz97NndtTXVulh3U=;
 b=YvVdVczzm2VOvQSPh0Vm+4bJZmnU/o4NcYLEpWLHvvKoi2S1nijZB8kMOVFSoJjIdv8mKi
 IA4mTb84I6epG8wExwoQBhIe3ONIabN3btOsKDKc6Q5GkOKc3DznsfP0gaJqEWM5753lIv
 jtGIllqhdsINmplZbqaJRXm6zg3fYSU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-sHgeV1-CPtmRgh7B5znyFw-1; Fri, 21 Apr 2023 00:19:15 -0400
X-MC-Unique: sHgeV1-CPtmRgh7B5znyFw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5ef4b68f47bso9252216d6.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 21:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682050755; x=1684642755;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L1oZHDQLPG2gM87D0eT39CvXVL5Vz97NndtTXVulh3U=;
 b=JWHymT8BNIXD1vScy1PCOB1a2Wt7YhhnXYZQdgPy3vuGiIHHFIcNGkhHkZPmp23rpH
 38nuKhHEZhxZojf75EJfGi3Zqps+Oy4tpyoq1oKAOD8AHoYKh8N0IoaC/UrpOcyBEh2m
 miCjwkdJOZqNI9YQdIMTWkPt0WGPo4M54SKbvL83TEFbiuc8aUJWYPWnX/QCVaji9QZi
 nwBT54Na/9WpfXQKTOeuKQwt0X7AXC/ptCcsCgGnHlvY268yY1ROtVBycNZpP+4xQgNo
 8ph18AG8PaXa1+bImJa9METJR9uY27coBHTY2P3xs2CdfIze4W9REWxXPf47iEps2EN0
 SCRg==
X-Gm-Message-State: AAQBX9eN1iHuv4u4gfodBq3C7Ujtf9aatZd9goN+51qccFrS607KoVEr
 Kjglcis2N9P4JFATX96oox2Xf4eaYTxaohOfR+7DexcWaLmVqgcvk44AEd2MF70Yu8LEvWcThln
 SiG+tRIsPynySfpc=
X-Received: by 2002:a05:6214:f6c:b0:5c5:6e60:eacd with SMTP id
 iy12-20020a0562140f6c00b005c56e60eacdmr3233247qvb.28.1682050754978; 
 Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350bbIjReMT3E/c8N75nZG5z8tmH3vaLCw5iZ05KxyYqZrz/692FVigGXoi+7PRvzhEY3Xq4m3A==
X-Received: by 2002:a05:6214:f6c:b0:5c5:6e60:eacd with SMTP id
 iy12-20020a0562140f6c00b005c56e60eacdmr3233226qvb.28.1682050754692; 
 Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
Received: from ?IPV6:2601:18d:8a00:cfa:780e:7574:2b4c:7be5?
 ([2601:18d:8a00:cfa:780e:7574:2b4c:7be5])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a0c8e03000000b005eab96abc9esm875884qvb.140.2023.04.20.21.19.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 21:19:14 -0700 (PDT)
Message-ID: <edcd817b-826f-f437-4ea3-33c5a567770a@redhat.com>
Date: Fri, 21 Apr 2023 00:19:12 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/6] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
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
From: Cleber Rosa <crosa@redhat.com>
In-Reply-To: <2a2124d2-5fcf-cfd2-4f68-c3f602f2824e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


On 4/18/23 03:10, Thomas Huth wrote:
> On 17/04/2023 15.43, Alex Bennée wrote:
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
>>    - limit --max-parallel-tasks $(JOBS_OPTION:-j%=%)
>> ---
>>   tests/Makefile.include | 18 +++++++++++-------
>>   tests/requirements.txt |  2 +-
>>   2 files changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 9422ddaece..a4de0ad5a2 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -138,14 +138,18 @@ get-vm-image-fedora-31-%: check-venv
>>   # download all vm images, according to defined targets
>>   get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, 
>> $(FEDORA_31_DOWNLOAD))
>>   +JOBS_OPTION=$(lastword -j1 $(filter-out -j, $(filter 
>> -j%,$(MAKEFLAGS))))
>> +
>>   check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
>> -    $(call quiet-command, \
>> -            $(TESTS_PYTHON) -m avocado \
>> -            --show=$(AVOCADO_SHOW) run 
>> --job-results-dir=$(TESTS_RESULTS_DIR) \
>> -            $(if $(AVOCADO_TAGS),, --filter-by-tags-include-empty \
>> -            --filter-by-tags-include-empty-key) \
>> -            $(AVOCADO_CMDLINE_TAGS) \
>> -            $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
>> +    $(call quiet-command,                             \
>> +            $(TESTS_PYTHON) -m avocado \
>> +            --show=$(AVOCADO_SHOW) run 
>> --job-results-dir=$(TESTS_RESULTS_DIR)     \
>> +            $(if $(AVOCADO_TAGS),,                         \
>> +            --filter-by-tags-include-empty                 \
>> +            --filter-by-tags-include-empty-key)             \
>> +        --max-parallel-tasks $(JOBS_OPTION:-j%=%)             \
>> +            $(AVOCADO_CMDLINE_TAGS)                         \
>> +            $(if $(GITLAB_CI),,--failfast) 
>> $(AVOCADO_TESTS),             \
>
> We might need to revisit this --failfast logic, too. If I've got that 
> right, failfast is now the default with the new system? So we might 
> want to disable it by default again if GITLAB_CI is not set?
>
>  Thomas
>
Hi Thomas,

I must be missing something, because under Avocado 101.0, I'm getting 
the following behavior without the --failfast flag:

   $ avocado run --max-parallel-tasks=1 -- /bin/true /bin/false /bin/true
   JOB ID     : 646f476f01b8d5599a57530606de543f2d9a5366
   JOB LOG    : 
/root/avocado/job-results/job-2023-04-21T04.15-646f476/job.log
    (1/3) /bin/true: STARTED
    (1/3) /bin/true: PASS (0.01 s)
    (2/3) /bin/false: STARTED
    (2/3) /bin/false: FAIL (0.01 s)
    (3/3) /bin/true: STARTED
    (3/3) /bin/true: PASS (0.01 s)
   RESULTS    : PASS 2 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 
0 | CANCEL 0
   JOB TIME   : 1.01 s

   Test summary:
   /bin/false: FAIL

And this with --failfast:

   $ avocado run --failfast --max-parallel-tasks=1 -- /bin/true 
/bin/false /bin/true
   JOB ID     : ae4894607a42194a7382efa545eccaccf7495fa3
   JOB LOG    : 
/root/avocado/job-results/job-2023-04-21T04.17-ae48946/job.log
    (1/3) /bin/true: STARTED
    (1/3) /bin/true: PASS (0.01 s)
    (2/3) /bin/false: STARTED
    (2/3) /bin/false: FAIL (0.01 s)
   Interrupting job (failfast).
   RESULTS    : PASS 1 | ERROR 0 | FAIL 1 | SKIP 1 | WARN 0 | INTERRUPT 
0 | CANCEL 0
   JOB TIME   : 0.75 s

   Test summary:
   /bin/false: FAIL

Maybe it's something in the Makefile I'm missing, or something specific 
to these tests, but that would be a long shot.

Thanks,

- Cleber.


