Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F298E2AD9DD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 16:13:03 +0100 (CET)
Received: from localhost ([::1]:50232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcVKQ-0005ui-W1
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 10:13:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcVEm-000803-EV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcVEk-0000vM-IP
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605020828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B670suUMSVRUcZGG0HwvqYPgg3FUPHCSChuX1oOBACo=;
 b=Eg3VrpAO3hExl28J1+YLxI4KUAjToc9VXnlI/bSNLUFLct9hiUv1chpYTP7RML+gfOOgsf
 c0dwTiuFp9b6QF1YuTSIuQUb8aJs5TNuZooPR5cvr6DPM8ZSqQtPsA2v+YTgxG4eRvS73y
 QEC80ou5MDjus0umy8/MWMRTSmdDTzA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-xFmaJW1UNmitJnwJo96KeA-1; Tue, 10 Nov 2020 10:07:07 -0500
X-MC-Unique: xFmaJW1UNmitJnwJo96KeA-1
Received: by mail-wm1-f71.google.com with SMTP id u207so1384373wmu.4
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B670suUMSVRUcZGG0HwvqYPgg3FUPHCSChuX1oOBACo=;
 b=MZtOkN8DdMgXI774+Vjec9Dc1FpFDOpq4lFxFab2B+6ske6ChuZM1iRWjwZ1wGYwO8
 mIWf2PSIrojOT5yQbX3JD5SkeN1kz97soXZAihSg/VuhKUacnzZNJhLPdW17aJCLpcRv
 DiiLKMH9rdNYcEbJKylzNYqK1N7NlOfNVCjJiHsKXrLeObMg96cfo0GcvKmSnyRJJING
 38Vx7qOBBsMjPsJlmRMtIS+MtLIG/skCFCVfYTtVOlMIpQxAnWntBfJm6F7JwrCdZvXY
 fSlTmNqPGoJXnZxrSsLlG0Dq8I35T/7ejsp9REmV4O8x+uBgVyZAvw9H+TGQWMuFiDZa
 OzpQ==
X-Gm-Message-State: AOAM533OaZII/6Pno0wMrves4omS8ras4epmFnW2ecaArynAhGaGpOuG
 zjdXQoLydhYQemAGkI0fhwnpe1+evUx0N3G8vhd83OU475TbZJ++JOT4f60AYGM5YNZY8DyXlO9
 Hia1X/KZN41t1Coo=
X-Received: by 2002:a7b:c453:: with SMTP id l19mr142410wmi.2.1605020823007;
 Tue, 10 Nov 2020 07:07:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTdODycK5M3lJXOAP4CVoVfLNIfHTWmI8NLjy9pDNEOOTYXNkTi+NSb3iERNvbOcRwRC0MuA==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr142383wmi.2.1605020822741;
 Tue, 10 Nov 2020 07:07:02 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id n15sm11542081wrq.48.2020.11.10.07.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 07:07:02 -0800 (PST)
Subject: Re: [PATCH-for-5.2 1/2] gitlab-ci: Avoid running the OpenSBI job when
 not necessary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-2-philmd@redhat.com>
 <20201110143335.GG869656@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <387cbcfa-abed-16a6-e4cf-207a424ec59b@redhat.com>
Date: Tue, 10 Nov 2020 16:07:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110143335.GG869656@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 3:33 PM, Daniel P. Berrangé wrote:
> $SUBJECT seems to contradict the comment message and code.
> 
> Shouldn't it say  "always run the OpenSBI job"  since you're
> removing all the conditional logic ?

Sorry, bad copy/paste from previous patch.

> 
> On Tue, Nov 10, 2020 at 01:16:05PM +0100, Philippe Mathieu-Daudé wrote:
>> The OpenSBI jobs use the 'changes' keyword, which "makes it
>> possible to define if a job should be created based on files
>> modified by a Git push event." (see [*]). This keyword comes
>> with a warning:
>>
>>   Caution:
>>
>>     In pipelines with sources other than the three above
>>     changes can’t determine if a given file is new or old
>>     and always returns true."
>>
>> In commit 922febe2af we moved the YAML config file from the
>> repository root directory to the .gitlab-ci.d/ directory.
>>
>> We didn't respect the previous warning and disabled the
>> 'changes' filter rule, as the files are now in a (directory)
>> three above the YAML config file.
>>
>> As this job doesn't take much (less than 1min), run it by
>> default.
>>
>> [*] https://docs.gitlab.com/ee/ci/yaml/#onlychangesexceptchanges
>>
>> Fixes: 922febe2af ("Move edk2 and opensbi YAML files to .gitlab-ci.d folder")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  .gitlab-ci.d/opensbi.yml | 13 -------------
>>  1 file changed, 13 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
>> index 5b13047e2ab..b1fa244fda4 100644
>> --- a/.gitlab-ci.d/opensbi.yml
>> +++ b/.gitlab-ci.d/opensbi.yml
>> @@ -1,10 +1,5 @@
>>  docker-opensbi:
>>   stage: containers
>> - rules: # Only run this job when the Dockerfile is modified
>> - - changes:
>> -   - .gitlab-ci.d/opensbi.yml
>> -   - .gitlab-ci.d/opensbi/Dockerfile
>> -   when: always
>>   image: docker:19.03.1
>>   services:
>>   - docker:19.03.1-dind
>> @@ -25,14 +20,6 @@ docker-opensbi:
>>  
>>  build-opensbi:
>>   stage: build
>> - rules: # Only run this job when ...
>> - - changes: # ... roms/opensbi/ is modified (submodule updated)
>> -   - roms/opensbi/*
>> -   when: always
>> - - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
>> -   when: always
>> - - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
>> -   when: always
>>   artifacts:
>>     paths: # 'artifacts.zip' will contains the following files:
>>     - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
>> -- 
>> 2.26.2
>>
> 
> Regards,
> Daniel
> 


