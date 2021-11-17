Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F1454BD4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 18:20:01 +0100 (CET)
Received: from localhost ([::1]:60500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnObI-0007xR-GH
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 12:20:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnOMT-00011g-Pw
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:04:41 -0500
Received: from [2a00:1450:4864:20::32f] (port=46007
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnOMP-0004Lb-BS
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 12:04:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2651067wme.4
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 09:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pCBF/HHLC+l6tBmCNIRJtnDQ7QjXlcdMZ6lpXZcl2wc=;
 b=GPNChEjBU87rvhyPhHsyG+BG/Ll5Nn2a1CsGS3GYQRa5JNkkD81nLUviXKWg8jWZGQ
 o0zQq70L6kLCkR8zwAPAJZNMLzSDQKXJ7mIR62o4qYMX2mGhDDc3ErHibEQ4VVe9Yxly
 TwD1XXIra/eQTBxNpyqqhcmER/C+dC5fiSw6Xnd/YJg65GqCgWpC3pJUJi4TKsCxHPld
 sfLeWSwNRDVStpyk9d8/kNpD0VaUvC5J0btLxqEiQCibsiIZxJXh71eQYzBhzdlyzYL2
 vmM105eIcl0Jkear5GjFKB4pVT7GkLLFbtGbVQGWadilju4CIEcm5z0XvCN//nS7p7d/
 g2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pCBF/HHLC+l6tBmCNIRJtnDQ7QjXlcdMZ6lpXZcl2wc=;
 b=rfnomXHV1xrGPxg2jglXj/khUlUs27sdQ/3yuWH1FZWKe0asuQzJk4R9fKbwv9brOL
 XhSQgRcYPvyvBmKI5I1DQaMHw3N+PiA7F/KL5Tzdqp3L33fF523Oal4i/i74XBHPtFaU
 LxO83FcJ8FD+cvNwWNWF0oeY/3YVcIHOmQiu2c66qehu6KWK02Nkimsenz7C0Za7JI2J
 4Zlv0gapE1tPrgeVgzOqSJrHPxxjstPTRJv6o6jApQIVyHbDFMlZoFICAVXWppkJ3DVa
 VojIm4lq2KbIBlarKOXpLxjZcg9sdzPK8KNVA459LY19jvTmc9zC7zbvCLAEeBYHradz
 MI4w==
X-Gm-Message-State: AOAM532GKCE02iqf6Vf/7bD8weR0Vou0rCH6bEw0qn+VvO7wOrw+n4BY
 CWJmC044ZYoOcijlmkBAfC3eoQ==
X-Google-Smtp-Source: ABdhPJyknHIch0gs+DRFEm62QkgsUdnsHL5SbNWlzODA92b8cu3UqcoEEE3jhuSh2D6TeSMPUXYpfw==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr1468883wmq.26.1637168675056; 
 Wed, 17 Nov 2021 09:04:35 -0800 (PST)
Received: from [192.168.8.105] (101.red-176-80-44.dynamicip.rima-tde.net.
 [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id n1sm341666wmq.6.2021.11.17.09.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:04:34 -0800 (PST)
Subject: Re: [PATCH v5 16/17] meson: Move linux_user_ss to linux-user/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-17-richard.henderson@linaro.org>
 <375dc57d-419a-8098-bb65-049ca6b0a781@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c2ac30ca-06c0-ba30-19aa-10e8fcdde1cb@linaro.org>
Date: Wed, 17 Nov 2021 18:04:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <375dc57d-419a-8098-bb65-049ca6b0a781@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 5:56 PM, Philippe Mathieu-Daudé wrote:
> +Thomas/Paolo
> 
> On 11/17/21 17:04, Richard Henderson wrote:
>> We have no need to reference linux_user_ss outside of linux-user.
>> Go ahead and merge it directly into specific_ss.
> 
> The patch is correct, so:
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> But ...
> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   meson.build            | 3 ---
>>   linux-user/meson.build | 4 ++++
>>   2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/meson.build b/meson.build
>> index 9f59c57909..ecc181ea13 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -2363,7 +2363,6 @@ common_user_ss = ss.source_set()
>>   crypto_ss = ss.source_set()
>>   hwcore_ss = ss.source_set()
>>   io_ss = ss.source_set()
>> -linux_user_ss = ss.source_set()
>>   qmp_ss = ss.source_set()
>>   qom_ss = ss.source_set()
>>   softmmu_ss = ss.source_set()
>> @@ -2614,8 +2613,6 @@
> 
> ... shouldn't it be cheaper for the build system to
> avoid parsing linux-user machinery when we linux-user
> is disabled, ...
> 
> + if have_linux_user
> 
> subdir('linux-user')
> 
> + endif

We had this discussion before, and settled on

if not have_linux_user
    subdir_done()
endif

within linux-user/meson.build.

>> +specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
> 
> ... and add here unconditionally?

Can't do it unconditionally.  We still need to distinguish specific_ss files that are 
CONFIG_USER_ONLY, when building both user-only and sysemu binaries.

I thought about changing this to CONFIG_USER_ONLY, but thought that would just be a step 
too far for this patch.


r~

