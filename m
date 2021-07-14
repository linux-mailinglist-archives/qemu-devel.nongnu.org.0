Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869193C9212
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:26:56 +0200 (CEST)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lT5-0005GO-6T
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lRG-0004LL-LV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:25:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lRC-0002MU-Qf
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626294297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCLHHrFV7R4IQgoLn5Ud+opStwh5CO58Hrg9T6B1vmE=;
 b=EEVml+ZA+qFPSq41oAHiDZifHe0KuqJSU7RBETmMd2A/2Jzd5l6j1oM8G+WC4ZA71zC7QW
 vkLkX76W+JM9dPkYgMOGoLWtLgmoZWIlL3YRLbgIeSEj5KT/5L171fNq/QdziQ9xzulr04
 TOvZ2hmJ3w7WROTXSz4wn7UTm1MZzuM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-K9IFsWZ1PvqzCh8n1bV2pA-1; Wed, 14 Jul 2021 16:24:55 -0400
X-MC-Unique: K9IFsWZ1PvqzCh8n1bV2pA-1
Received: by mail-wr1-f71.google.com with SMTP id
 m4-20020adffa040000b02901404c442853so2131412wrr.12
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCLHHrFV7R4IQgoLn5Ud+opStwh5CO58Hrg9T6B1vmE=;
 b=ItXlanqqndJdVfYOFUlbCQ2/0k5eFpcVqzhH4MargEw6ns2lKTmpl+1UdUpzTjBfNP
 kfMffynj7MyKT/OnD+ZrD9NCxlo0NdkBby8IMI4t7WCLKO+cgbIhZiMWy0uOpttOAds1
 cIB8h0t25QUkX5Wxck9zdFfGVsmBMY2RaUbOnEFhQEXMVvZR7zvKhZRLou1kDc8yVhej
 gc+KmAK7M0s5dS5hYh9PmWxLSWdjPwg1KHvNOer65RC/LGx0T7R0ZtpyKSNr0MDcaOTH
 XhOR440zDAnWp2s4NW6tD6fIbNspiXrM/eMZLSl2s6OgNk7/EF442PtU/uDLsOGxpFm8
 dNwg==
X-Gm-Message-State: AOAM530ed2Sxd8lOp5A2ZbFTRvSpF5Ytl/GzXNMaYk3YsIPrTSy+6PNX
 495kWzOA4LHLroW23m0nFjx2ttxJc8/v9OKioOKFZAdD94YqcC97cL+Sz9KXuEQ1INFEBl/lLVn
 ydCgjwCvQs3FH0We5WT7DDJOxLhs9zLe9UvkFQCzilcXbDKUW0uFDQXqAGncOcRW5
X-Received: by 2002:a5d:644c:: with SMTP id d12mr14848535wrw.129.1626294294344; 
 Wed, 14 Jul 2021 13:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ8uyIZiJXbNUlJhDncHwFW/R4pjm8p0H1Z99QWzDTM6dAhV28oAcsXQGDH3N3demVWrsU+w==
X-Received: by 2002:a5d:644c:: with SMTP id d12mr14848518wrw.129.1626294294138; 
 Wed, 14 Jul 2021 13:24:54 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id j10sm3814529wrt.35.2021.07.14.13.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 13:24:53 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] gitlab-ci: Extract EDK2 job rules to reusable
 section
To: Cleber Rosa <crosa@redhat.com>
References: <20210714101003.3113726-1-philmd@redhat.com>
 <871r8069us.fsf@p50.localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ff3f5bc5-2dad-17aa-31c8-4a794a61d59b@redhat.com>
Date: Wed, 14 Jul 2021 22:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <871r8069us.fsf@p50.localhost.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 8:14 PM, Cleber Rosa wrote:
> 
> Philippe Mathieu-Daudé writes:
> 
>> All jobs depending on 'docker-edk2' job must use at most all
>> the rules that triggers it. The simplest way to ensure that
>> is to always use the same rules. Extract all the rules to a
>> reusable section, and include this section (with the 'extends'
>> keyword) in both 'docker-edk2' and 'build-edk2' jobs.
>>
>> The problem was introduced in commit 71920809cea ("gitlab-ci.yml:
>> Add jobs to build EDK2 firmware binaries"), but was revealed in
>> commit 1925468ddbf ("docker: EDK2 build job depends on EDK2
>> container") and eventually failed on CI:
>> https://gitlab.com/qemu-project/qemu/-/pipelines/335995843
>>
>> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> If this is a correct fix, I'll send a similar fix for the
>> OpenSBI jobs.
>> ---
>>  .gitlab-ci.d/edk2.yml | 27 ++++++++++++++++-----------
>>  1 file changed, 16 insertions(+), 11 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
>> index ba7280605c4..aae2f7ad880 100644
>> --- a/.gitlab-ci.d/edk2.yml
>> +++ b/.gitlab-ci.d/edk2.yml
>> @@ -1,10 +1,22 @@
>> -docker-edk2:
>> - stage: containers
>> - rules: # Only run this job when the Dockerfile is modified
>> +# All jobs needing docker-edk2 must use the same rules it uses.
>> +.edk2_job_rules:
>> + rules: # Only run this job when ...
>>   - changes:
>> +   # this file is modified
>>     - .gitlab-ci.d/edk2.yml
>> +   # or the Dockerfile is modified
>>     - .gitlab-ci.d/edk2/Dockerfile
>> +   # or roms/edk2/ is modified (submodule updated)
>> +   - roms/edk2/*
>>     when: always
>> + - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
>> +   when: always
>> + - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
>> +   when: always
>> +
>> +docker-edk2:
>> + extends: .edk2_job_rules
>> + stage: containers
>>   image: docker:19.03.1
>>   services:
>>   - docker:19.03.1-dind
>> @@ -24,16 +36,9 @@ docker-edk2:
>>   - docker push $IMAGE_TAG
>>  
>>  build-edk2:
>> + extends: .edk2_job_rules
>>   stage: build
>>   needs: ['docker-edk2']
>> - rules: # Only run this job when ...
>> - - changes: # ... roms/edk2/ is modified (submodule updated)
>> -   - roms/edk2/*
>> -   when: always
>> - - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
>> -   when: always
>> - - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
>> -   when: always
>>   artifacts:
>>     paths: # 'artifacts.zip' will contains the following files:
>>     - pc-bios/edk2*bz2
> 
> 
> Hi Phil,
> 
> This looks good, but have you triggered a pipeline with these changes?
> It'd be helpful for an extra level of assurance for the intended results.

Yes, before sending this patch ;)

https://gitlab.com/philmd_rh/qemu/-/pipelines/336800660


