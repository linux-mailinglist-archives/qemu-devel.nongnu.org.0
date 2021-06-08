Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB639F0C6
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:24:46 +0200 (CEST)
Received: from localhost ([::1]:38950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqX2T-0001pL-4g
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqX1d-0000ho-5i
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:23:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqX1b-0004Pq-FA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:23:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623140630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mWaoMaH5sAthTY7wE/FmtMQ4xtoKpzrj9/htyrCTsmo=;
 b=adCAPGuDjIHY1JupsCH6vktzd0GIMN9S6Ns+KS5KJaoXgHJ718PTC41mJqeFE7JCMLXIaI
 JIkmmnS82xBTGQIHyDA6fSvVZ5HWE8cYcj+c+xbYzxve795MDjmWVcSurZNYSLdAPkn1Uh
 7HSZ84vOJmE2Jx2fQ9HshqXbpnGSP8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-y-KP9U94MkuJrOCaF98OvA-1; Tue, 08 Jun 2021 04:23:49 -0400
X-MC-Unique: y-KP9U94MkuJrOCaF98OvA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g81-20020a1c9d540000b02901a3d4d3f7fcso951643wme.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWaoMaH5sAthTY7wE/FmtMQ4xtoKpzrj9/htyrCTsmo=;
 b=chcoucs5BGk24HCpzScSaeGZVTT9E+zNvdGhY2bmF03HVItORJ9yWFx88JYLmzJG45
 DOBoBDo359uGilPrlblLRY8RJCThnWumNS291sZ2t6NM3OZN8FrpBLFMe81Ec2UrRE/X
 wx8o3dH1Qfu3/gqK4xjF3B3a4k6k1Pj4Umu+ZBDiQaKq3696xKN/KJJC0ooeNqSXrXu8
 E+6pTb1eLN3iEuBrUfHptZPd2jAq7uqiiwSQZ81mWP/EzfOhRiF46zO4WmGNy7V0hYO7
 laGNFiDAB5elPctty9l94EjpVax54ApxMDfWKPZsVDePdBdoDVRAi0sYydQdAWPN18FM
 S5vg==
X-Gm-Message-State: AOAM533PthdU/NpaCTuiWFSx0j9lbsuH8fGLB/Z+tZjdsTbNTMzyNDdL
 MjG3Zj4yrU6IKuBh9SbtpBYHMZblTNhbKHkSDtH4leq0oZi0UNn33PMtN1cJ56HYyvFc3OdSwKh
 oHNpgCZZsAdAhJdQ=
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr21278014wrf.351.1623140628329; 
 Tue, 08 Jun 2021 01:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuIKOw05dr/Z0MFalVKXjrjP+uIa4oOIhrZnotH6tRWSQJufceQ4yDS7Qe+jrA5zDzloMNTw==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr21277991wrf.351.1623140628158; 
 Tue, 08 Jun 2021 01:23:48 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id a4sm17317021wme.45.2021.06.08.01.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:23:47 -0700 (PDT)
Subject: Re: [PATCH v16 06/99] qtest/arm-cpu-features: Remove TCG fallback to
 KVM specific tests
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-7-alex.bennee@linaro.org>
 <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d9c4b3fc-f4f0-f612-8e47-016f69d54e08@redhat.com>
Date: Tue, 8 Jun 2021 10:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <3e4942e4-be35-ab51-e290-3faa6c67d4a2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 3:28 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
>> tests are now only being run if KVM is available. Drop the TCG
>> fallback.
>>
>> Suggested-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-7-philmd@redhat.com>
>> ---
>>   tests/qtest/arm-cpu-features.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c
>> b/tests/qtest/arm-cpu-features.c
>> index 66300c3bc2..b1d406542f 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -21,7 +21,7 @@
>>   #define SVE_MAX_VQ 16
>>     #define MACHINE     "-machine virt,gic-version=max -accel tcg "
>> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel
>> tcg "
>> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
> 
> Same comment as with patch 04/99: I think this is wrong. You're mixing
> up whether an accelerator has been built into the binary with the fact
> whether an accelerator is available and usable. There are plenty of
> cases where e.g. kvm is built into the binary but not usable during
> runtime, e.g. because:
> 1) The kernel does not support it
> 2) The current host CPU does not support it
> 3) There are problems with the permission to /dev/kvm
> etc.

Yes.

> I think we either need the fallback mechanism to tcg

No, this is precisely what we want to test.

> or you need to
> properly check whether KVM is usable, too.

Yes.


