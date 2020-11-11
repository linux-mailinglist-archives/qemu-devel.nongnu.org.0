Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C162AEC3C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 09:44:19 +0100 (CET)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcljm-0002e5-83
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 03:44:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcliT-0002Bi-JM
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:42:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcliQ-0000x0-VH
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 03:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605084172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v0MmLb/2vk0LSB9lSUomfMHueE0C+gjG88fr9aiuvJI=;
 b=b2oYBNp91UpHUv+hjttfURjNCGmuLEl9Udx/kLMl89Xy/hN41nvRHgW+IcZ63SlmqvNSLd
 q+k1m6HKMx1D9kGaYNIr8p2VaOXzGpNxS+Xe7/RwY8m0JTifSS+QHgS297DQnFf9SYfK5h
 Pi8IA981GyE+FwAgWX+xC/bpXK8i2FQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-De6QRRB4MEukkcd5ZCiDKA-1; Wed, 11 Nov 2020 03:42:50 -0500
X-MC-Unique: De6QRRB4MEukkcd5ZCiDKA-1
Received: by mail-wm1-f71.google.com with SMTP id a19so510841wmb.1
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 00:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v0MmLb/2vk0LSB9lSUomfMHueE0C+gjG88fr9aiuvJI=;
 b=BjpIzhG5oC4rcBanq0Sr2r8EgAACEZ+n3JtFqfOriI3J5vmjolWoWpzyR4r5wFNaxu
 4mlNgUi+G7zkN1XvbdBtU/YuzfJ2pKF1JZ1H9RqqDy1oOSalZ1GVVxC4JiD/um4LvM/X
 JFTWgVn8/7SxO5ZIAQhD99ibpT7i1VY+hCmpb0Zy5RpfH/9T3GJKG5QJkiLAhMeYp4G2
 Jnd2B+jhx3n8wLkOdZ/AuXbCsIFZPA3SZtU6FJo2NevqXYIIEO4hebBAbPBZGrwzyEjq
 TJlL5efyO1fNHcsoKSLVIhCuDwH2KzE9/ZXMfS8O5inZk+NeOby3yxBZoC+bc1LxO4U5
 6S2w==
X-Gm-Message-State: AOAM530LngKY8usljUoGsGwY+vlajK1lcJ2bDcKaXU1yhoPbjG/tZ4RU
 Qw+rayvFyA9dngKHgiAeU6eRfum5RC125tTIFN2W9lBurCp9cFWtkBjsjQJVTwrdpzIte/r7CFC
 wN8taNaDXOvWZFJA=
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr2667208wmb.39.1605084168822;
 Wed, 11 Nov 2020 00:42:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvDub4/yLIYQL5uN4Wt2iBwK8XeYQv1BvRydq9f/WbiTdxSJac/77FlQt7apuPGe+RLCeUDQ==
X-Received: by 2002:a1c:1c3:: with SMTP id 186mr2667178wmb.39.1605084168594;
 Wed, 11 Nov 2020 00:42:48 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y11sm1568917wmj.36.2020.11.11.00.42.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 00:42:47 -0800 (PST)
Subject: Re: [PATCH-for-6.0 v4 14/17] gitlab-ci: Move trace backend tests
 across to gitlab
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-15-philmd@redhat.com>
 <25d070b2-204a-51d5-a961-d6c56b39b758@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <892040ab-4100-3ed1-37d9-e4ae21257635@redhat.com>
Date: Wed, 11 Nov 2020 09:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <25d070b2-204a-51d5-a961-d6c56b39b758@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 7:12 PM, Wainer dos Santos Moschetta wrote:
> 
> On 11/8/20 6:45 PM, Philippe Mathieu-Daudé wrote:
>> Similarly to commit 8cdb2cef3f1, move the trace backend
>> tests to GitLab.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   .gitlab-ci.yml | 18 ++++++++++++++++++
>>   .travis.yml    | 19 -------------------
>>   2 files changed, 18 insertions(+), 19 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index 6552a832939..2f0da7b3dc1 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
>> @@ -557,6 +557,24 @@ check-crypto-only-gnutls:
>>       IMAGE: centos7
>>       MAKE_CHECK_ARGS: check
>>   +# We don't need to exercise every backend with every front-end
>> +build-trace-multi-user:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
> 
> Doesn't it need the lttng-ust-dev package in Ubuntu's image likewise you
> did for Fedora (patch 13)?

No, because ...

>> +    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog
>> --disable-system

... we don't build the User-Space Tracer there.

>> +
>> +build-trace-ftrace-system:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: ubuntu2004
>> +    CONFIGURE_ARGS: --enable-trace-backends=ftrace
>> --target-list=aarch64-softmmu
> On Travis it builds the x86_64 softmmu target. Changed to aarch64 to
> increase coverage?

Maybe because the next job already test this target? I'll change.

>> +
>> +build-trace-ust-system:
>> +  <<: *native_build_job_definition
>> +  variables:
>> +    IMAGE: fedora
> 
> Similar question here, increasing coverage by using Fedora?

No, because User-Space Tracer is a feature Red Hat cares
about, and plan to maintain, so it makes sense to test it
on Fedora. I'll comment this change in the description.

> 
> - Wainer
> 
>> +    CONFIGURE_ARGS: --enable-trace-backends=ust
>> --target-list=x86_64-softmmu --disable-tcg
>>     check-patch:
>>     stage: build
>> diff --git a/.travis.yml b/.travis.yml
>> index 8ef31f8d8b6..ff5d5ead579 100644
>> --- a/.travis.yml
>> +++ b/.travis.yml
>> @@ -182,25 +182,6 @@ jobs:
>>         compiler: clang
>>     -    # We don't need to exercise every backend with every front-end
>> -    - name: "GCC trace log,simple,syslog (user)"
>> -      env:
>> -        - CONFIG="--enable-trace-backends=log,simple,syslog
>> --disable-system"
>> -        - TEST_CMD=""
>> -
>> -
>> -    - name: "GCC trace ftrace (x86_64-softmmu)"
>> -      env:
>> -        - CONFIG="--enable-trace-backends=ftrace
>> --target-list=x86_64-softmmu"
>> -        - TEST_CMD=""
>> -
>> -
>> -    - name: "GCC trace ust (x86_64-softmmu)"
>> -      env:
>> -        - CONFIG="--enable-trace-backends=ust
>> --target-list=x86_64-softmmu"
>> -        - TEST_CMD=""
>> -
>> -
>>       # Using newer GCC with sanitizers
>>       - name: "GCC9 with sanitizers (softmmu)"
>>         dist: bionic
> 


