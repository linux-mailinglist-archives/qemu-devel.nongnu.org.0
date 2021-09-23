Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36581415BFB
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:33:02 +0200 (CEST)
Received: from localhost ([::1]:48502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM2H-0007E2-92
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTLz3-00050R-2B
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:29:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mTLz1-0004Ld-6Y
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:29:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id u27so21447914edi.9
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CiN9r3EVrkLBHXZuSJs9asqHddwjmTt9kNwDzjdur4Q=;
 b=p3Tz3lrskOLprNcK3nEEOyoW7zW5Kb4zgfSQra86aUcHIT/Pljxpnd4Sh7Q5PuvpvE
 rP2JB/kMJbg00k89i0d0EWYdWgrV6i1wWqleba232IafPaz9c88Lh2iBG3KFl1y1HM12
 miLq9dyvB2ECh5JTQM+6Cg/93b7U/0T5DaWojvGOiuZEFigpZVOfPDTKL6uSi9FA6tYg
 YOmkEiuDb7zfK4ZvFY/ctUuIHiKsDWFA3FGcymHjqjJRag4LSFFbSr3JP6XmZf5yhe/B
 EifUZeThjs0NV0XIX7ubf80d2l3PtEOoc+OTB9nQAJ8xZ2RTnRgIfupXQXWwUJ22Wikw
 ZXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CiN9r3EVrkLBHXZuSJs9asqHddwjmTt9kNwDzjdur4Q=;
 b=ixECtoXMePpib/9qnxKncPm9734IvLNE1w592cJGvAiBiPnj7yaJHGvguekGLk5EG3
 SN0FUj7r6x0ACVupR3958ygXptbaez3tRmUKZ0BNvPxeK3gOsVC4bvevynZDi6ui92at
 9vd1v80YGlzFkR1AxdCWDMfnxZEKwqheSyjc6nmNusiMEkAJF0s8HO98eJJbKY4I4WSO
 D/fuwxN8E2NG7cJBimzHHQOOfUx3vMEIwm3IxnbxA4KriaxVR99aYcItSTc525gYvpB7
 HcnIrYdGDOvHAyxahBCbfWVW8WxXU22RPL200K7AbauAFUCTiUEBaPmGMmdItvAlDCn8
 DXcg==
X-Gm-Message-State: AOAM531bK6U5lS5tb2f50yD3R/gvPojzYExQxjHMoPIOSBpBU0f04iB8
 BOBT0C4Gs3fKRk5zXkNJY/cpDkHGqjs=
X-Google-Smtp-Source: ABdhPJzR/PqvcjJ3/xHj1sfpA7XUF04WKIIq+Kh6dEcHTXeDAUTgGE1qgj83skTYUEAmCBxI/zWBGA==
X-Received: by 2002:a17:906:e216:: with SMTP id
 gf22mr3982550ejb.357.1632392972998; 
 Thu, 23 Sep 2021 03:29:32 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id x13sm2720841ejv.64.2021.09.23.03.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:29:32 -0700 (PDT)
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210923081555.3648310-1-pbonzini@redhat.com>
 <YUw5Pglv2lcS2Nz6@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3f13ab75-c55d-b272-859e-a0b7a147e93b@redhat.com>
Date: Thu, 23 Sep 2021 12:29:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUw5Pglv2lcS2Nz6@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/09/21 10:22, Daniel P. Berrangé wrote:
> On Thu, Sep 23, 2021 at 04:15:55AM -0400, Paolo Bonzini wrote:
>> Skip the test if bzip2 is not available, and run it after they are
>> uncompressed.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   pc-bios/meson.build     | 3 ++-
>>   tests/qtest/meson.build | 6 +++---
>>   2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
>> index f2b32598af..975565198e 100644
>> --- a/pc-bios/meson.build
>> +++ b/pc-bios/meson.build
>> @@ -10,8 +10,9 @@ if install_edk2_blobs
>>       'edk2-x86_64-secure-code.fd',
>>     ]
>>   
>> +  roms = []
>>     foreach f : fds
>> -    custom_target(f,
>> +    roms += custom_target(f,
>>                     build_by_default: have_system,
>>                     output: f,
>>                     input: '@0@.bz2'.format(f),
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index e1f4df3df8..6d8100c9de 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -68,12 +68,12 @@ qtests_i386 = \
>>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test'] : []) +              \
>>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ? ['fuzz-e1000e-test'] : []) +   \
>>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] : []) +                 \
>> +  (install_edk2_blobs ? ['bios-tables-test'] : []) +                                        \
>>     qtests_pci +                                                                              \
>>     ['fdc-test',
>>      'ide-test',
>>      'hd-geo-test',
>>      'boot-order-test',
>> -   'bios-tables-test',
>>      'rtc-test',
>>      'i440fx-test',
>>      'fw_cfg-test',
>> @@ -180,7 +180,7 @@ qtests_arm = \
>>   
>>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>>   qtests_aarch64 = \
>> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>> +  (cpu != 'arm' and install_edk2_blobs ? ['bios-tables-test'] : []) +                           \
>>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>>     ['arm-cpu-features',
>> @@ -269,7 +269,7 @@ foreach dir : target_dirs
>>     qtest_emulator = emulators['qemu-system-' + target_base]
>>     target_qtests = get_variable('qtests_' + target_base, []) + qtests_generic
>>   
>> -  test_deps = []
>> +  test_deps = roms
> 
> Shouldn't this be
> 
>    if install_edk2_blobs
>       test_deps += roms
>    endif

That, or (better) move the "roms = []" initializer outside the "if 
install_edk2_blobs".

Also, right now bios-tables-test hangs (before the patch) or is skipped 
(after) if --disable-blobs is used on the configure command line.  We 
can do the unpack in that case and skip the installation.  This is not 
really necessary to fix the issues that Peter saw in vm-build-freebsd, 
but it does not hurt either.

Paolo

