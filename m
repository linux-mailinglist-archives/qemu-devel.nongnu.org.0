Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A968C680CE5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:06:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSuy-0002op-Hd; Mon, 30 Jan 2023 07:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMSuu-0002jw-2v
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:05:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMSur-0007R0-3e
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:05:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675080339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaG3dF1T1xaX7HU/HDJnXEaxPATbugvFmVqZAT4rpCQ=;
 b=M1tEFdjq/eurneb3umXOWazK/sWbz++bI+ygOLhYoK0RNR+oa9rRptmefWTJf6bAm6vXAb
 I7XwWFT0A8j0jb+K0FP7JdiVVIb7O3tM7qAK2W029Xmkr0yx2hJ0eegnfgXiZO7Qx4howp
 EqS7ubqqkZ4gaeLnNMzf5cpB27Vk8B8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-K3uF8_s4M0ewcGnAf0c3UQ-1; Mon, 30 Jan 2023 07:05:38 -0500
X-MC-Unique: K3uF8_s4M0ewcGnAf0c3UQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 i17-20020a25bc11000000b007b59a5b74aaso12528778ybh.7
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 04:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CaG3dF1T1xaX7HU/HDJnXEaxPATbugvFmVqZAT4rpCQ=;
 b=Xj6hnwgVor/6H7pmufsjVii3fXl76bAwfSwT4o4eA4YFl0Mb2cx6LVasGr/ZxNlUlO
 wnoRKFfa1G7fLkWe+UIUnR250d16NaD2Xj2QW0WGD0iM6I3LfIdFMfV1EDx3IDzSv5XS
 2gGzFSfUg9N1aIBOVR2ccbwhhCiEZEVb+i9zc40niYMO9nm5uTQIPy5WdcQOVXIv3DQr
 Vnr+tQJzPRWbe2iujD/gWMwAbY/csuYgpRoz80lJcrbsScYE+2WHdrfPQdLU62cBmmjo
 hgmDxcTIUxp0phrEzcEiEF8uFo5w7TlTKRbrzfB32g4MWzuMSjxh9Cw1CdpHYdKelzay
 LGww==
X-Gm-Message-State: AO0yUKV2FnVz/V4IWWKEHypvf+ClPsl2T6ueQFWQtxi1uYJZz0KGFnzP
 5SSBBP7GKruYnxFq1+wt5BV8Py1cPQwXcfmb6KlSJDzWCNDDxUaRN0JKQVCEPfSBaNgiHTK+2Rn
 pZgsyGiFJHlwweMU=
X-Received: by 2002:a81:17cf:0:b0:506:3a76:f4af with SMTP id
 198-20020a8117cf000000b005063a76f4afmr18639101ywx.45.1675080337459; 
 Mon, 30 Jan 2023 04:05:37 -0800 (PST)
X-Google-Smtp-Source: AK7set8LbwTykfMAGupHQacQtZ870cXggHSgnc1Zx8dGOW4Rp205Q0FctmnVOhNRDG8pAm5wY45LLw==
X-Received: by 2002:a81:17cf:0:b0:506:3a76:f4af with SMTP id
 198-20020a8117cf000000b005063a76f4afmr18639084ywx.45.1675080337224; 
 Mon, 30 Jan 2023 04:05:37 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 bi32-20020a05620a31a000b006b95b0a714esm8072662qkb.17.2023.01.30.04.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 04:05:36 -0800 (PST)
Message-ID: <7b29448f-4476-abb3-08d1-a11c6be0f804@redhat.com>
Date: Mon, 30 Jan 2023 13:05:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 6/6] gitlab-ci.d/buildtest: Disintegrate the
 build-coroutine-sigaltstack job
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>
References: <20230130104446.1286773-1-thuth@redhat.com>
 <20230130104446.1286773-7-thuth@redhat.com> <Y9eizgN9UYo5kbgx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y9eizgN9UYo5kbgx@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 30/01/2023 11.58, Daniel P. Berrangé wrote:
> On Mon, Jan 30, 2023 at 11:44:46AM +0100, Thomas Huth wrote:
>> We can get rid of the build-coroutine-sigaltstack job by moving
>> the configure flags that should be tested here to other jobs:
>> Move --with-coroutine=sigaltstack to the build-without-defaults job
>> and --enable-trace-backends=ftrace to the cross-s390x-kvm-only job.
> 
> The biggest user of coroutines is the block layer. So we probably
> ought to have coroutines aligned with a job that triggers the
> 'make check-block' for iotests.  IIUC,  the without-defaults
> job won't do that. How about, arbitrarily, using either the
> 'check-system-debian' or 'check-system-ubuntu' job. Those distros
> are closely related, so getting sigaltstack vs ucontext coverage
> between them is a good win, and they both trigger the block jobs
> IIUC.

Ok ... but let's put qemu-block@nongnu.org on CC: first, to see what the 
block layer folks think about this.

> Incidentally sigaltstack is also covered by our Cirrus CI job
> for macOS.

Oh, nice, so we already have some "check-block" test coverage there!

  Thomas


>> ---
>>   .gitlab-ci.d/buildtest.yml   | 14 ++------------
>>   .gitlab-ci.d/crossbuilds.yml |  2 +-
>>   2 files changed, 3 insertions(+), 13 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 91c7467a66..1438797a1c 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -533,19 +533,8 @@ build-tci:
>>       - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
>>       - make check-tcg
>>   
>> -# Alternate coroutines implementations are only really of interest to KVM users
>> -# However we can't test against KVM on Gitlab-CI so we can only run unit tests
>> -build-coroutine-sigaltstack:
>> -  extends: .native_build_job_template
>> -  needs:
>> -    job: amd64-ubuntu2004-container
>> -  variables:
>> -    IMAGE: ubuntu2004
>> -    CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
>> -                    --enable-trace-backends=ftrace
>> -    MAKE_CHECK_ARGS: check-unit
>> -
>>   # Check our reduced build configurations
>> +# (and an alternative coroutine implementation)
>>   build-without-defaults:
>>     extends: .native_build_job_template
>>     needs:
>> @@ -559,6 +548,7 @@ build-without-defaults:
>>         --disable-pie
>>         --disable-qom-cast-debug
>>         --disable-strip
>> +      --with-coroutine=sigaltstack
>>       TARGETS: avr-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
>>         sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
>>       MAKE_CHECK_ARGS: check-unit check-qtest-avr check-qtest-mips64
>> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
>> index 8dbbb8f881..027d2088da 100644
>> --- a/.gitlab-ci.d/crossbuilds.yml
>> +++ b/.gitlab-ci.d/crossbuilds.yml
>> @@ -159,7 +159,7 @@ cross-s390x-kvm-only:
>>       job: s390x-debian-cross-container
>>     variables:
>>       IMAGE: debian-s390x-cross
>> -    EXTRA_CONFIGURE_OPTS: --disable-tcg
>> +    EXTRA_CONFIGURE_OPTS: --disable-tcg --enable-trace-backends=ftrace
>>   
>>   cross-mips64el-kvm-only:
>>     extends: .cross_accel_build_job
>> -- 
>> 2.31.1
>>
>>
> 
> With regards,
> Daniel


