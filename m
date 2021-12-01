Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AFB464A29
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 09:47:59 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msLHS-0001l4-Dn
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 03:47:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msLEl-0007wu-Hq
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:45:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1msLER-00036m-Re
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 03:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638348289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UWUv6IQJKoCsDcyl9Za2ZI+9JPTQe4JIVRaHfxBv9X0=;
 b=hyHPdUeK+wxUxja+k2kp56tHi/kx4QuVUoqZSeuOHNP6YchTVgmdZjdQW0wGd0ttoPQh2X
 levcl5OnWZBDpwkABUthR29fSsTiu/g9wA+Xe+4VGVxcoWlboVzrCIv+YVNDu02YzE0Loe
 5UUrhjzXm+hARqQP9lFWv0Ty5x1F0VM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-sNZHviUXNb-2UkKWkV5izA-1; Wed, 01 Dec 2021 03:44:48 -0500
X-MC-Unique: sNZHviUXNb-2UkKWkV5izA-1
Received: by mail-wr1-f72.google.com with SMTP id
 d18-20020adfe852000000b001985d36817cso4071194wrn.13
 for <qemu-devel@nongnu.org>; Wed, 01 Dec 2021 00:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=UWUv6IQJKoCsDcyl9Za2ZI+9JPTQe4JIVRaHfxBv9X0=;
 b=dMG4rCLmok7pB+1ErxddShi4cm0lbfcaPG0V6YSq53u8BtK87Xv/Je91x2w5W3Fluh
 0UlM3VMaXzxjILWvsOcJfbnfsDl3kgyQsSGGhzgdSdAsHaVddQ3UaiU+43zGAscIzADL
 j4nfulSMzFFa9wWU3b38bO5jsJftyLWT80cDRQ5pAObgQNDmYoYxi858wnvB8w64hsyS
 AGQub0o6fmuFd8SjahsLoQRpU5OteikztJB+0FABGOo35ckR4J0TQYgBUMcXJ1eMYsSm
 zXB0q/qtCKuHWWxpy1BkRMxjEqXlxeKKZamL+trz2xjEvxbe5IUfdQiqtqwQv+jG6t7K
 21GA==
X-Gm-Message-State: AOAM531EpB9JBSVl5HMJV8nfFl/s8uZfdTayTt+kBrgUoN97hK+FMdBv
 KajLzMCt8rWoehEPshz1MOzvRkbZ6H6SzP1cmJnO7UxvaoxRqYTqMT++ydOk44CB6q2JdBGIhNG
 lfrKhCa/fWBHvI6A=
X-Received: by 2002:adf:e84e:: with SMTP id d14mr4970472wrn.472.1638348287411; 
 Wed, 01 Dec 2021 00:44:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYKafbwzfwV1/6SJG3ZB96CMsHRQyfLTFKHtJL4cTszHVWOQquhHKTw9UV3VvQEVKUbb4eaA==
X-Received: by 2002:adf:e84e:: with SMTP id d14mr4970448wrn.472.1638348287182; 
 Wed, 01 Dec 2021 00:44:47 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id d6sm18977263wrn.53.2021.12.01.00.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 00:44:46 -0800 (PST)
Message-ID: <a809bd28-2083-5677-be41-f64bd09f617c@redhat.com>
Date: Wed, 1 Dec 2021 09:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211126162724.1162049-1-thuth@redhat.com>
 <YaSmeFqGGFlty75h@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.d/buildtest: Add jobs that run the
 device-crash-test
In-Reply-To: <YaSmeFqGGFlty75h@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.211, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/2021 11.07, Daniel P. Berrangé wrote:
> On Fri, Nov 26, 2021 at 05:27:24PM +0100, Thomas Huth wrote:
>> The device-crash-test script has been quite neglected in the past,
>> so that it bit-rot quite often. Let's add CI jobs that run this
>> script for at least some targets, so that this script does not
>> regress that easily anymore.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest.yml | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 71d0f407ad..7e1cb0b3c2 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -100,6 +100,17 @@ avocado-system-debian:
>>       IMAGE: debian-amd64
>>       MAKE_CHECK_ARGS: check-avocado
>>   
>> +crash-test-debian:
>> +  extends: .native_test_job_template
>> +  needs:
>> +    - job: build-system-debian
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: debian-amd64
>> +  script:
>> +    - cd build
>> +    - scripts/device-crash-test -q ./qemu-system-i386
>> +
>>   build-system-fedora:
>>     extends: .native_build_job_template
>>     needs:
>> @@ -134,6 +145,18 @@ avocado-system-fedora:
>>       IMAGE: fedora
>>       MAKE_CHECK_ARGS: check-avocado
>>   
>> +crash-test-fedora:
>> +  extends: .native_test_job_template
>> +  needs:
>> +    - job: build-system-fedora
>> +      artifacts: true
>> +  variables:
>> +    IMAGE: fedora
>> +  script:
>> +    - cd build
>> +    - scripts/device-crash-test -q ./qemu-system-ppc
>> +    - scripts/device-crash-test -q ./qemu-system-riscv32
> 
> I'm curious why you picked all the 32-bit architecture targets to test
> this for, since 95% of usage these days will be on the 64-bit targets ?
> 
> I guess both 32-bit & 64-bit targets probably have the same set of
> devices built mostly, but still wondering if there was a reason for
> your choice.

There haven't been any firm reasons, it's mostly simply because the distros 
that I picked (Fedora and Debian) only offer the 32-bit versions here. I 
used those two distros since I wanted to pick a distro with a recent Python, 
and one with an older version of Python, so I first wanted to go with Fedora 
and CentOS 8. But then I remembered that  CentOS 8 will soon be EOL, and we 
haven't decided what to do here yet (I guess we should switch to CentOS 
Stream?), so I used Debian instead.

  Thomas


