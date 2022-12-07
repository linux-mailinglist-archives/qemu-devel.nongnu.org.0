Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816A6460F5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 19:24:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2z4H-00062Y-Bo; Wed, 07 Dec 2022 13:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2z4E-00062I-6f
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2z4B-0000M0-LL
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 13:22:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670437366;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wvsgScsa427sr9lKB0lqismEKml1mVWUcmTxP1DqOes=;
 b=BXL5/k35SL8+dG0mJU6rRIV0zft3DElOS6C0jeTO/+zHuIhLmLslLvsa/eOkj5zFxOAG7b
 psSZ3Y7T7249lhRri9Yuy6Mvpk95Q3HdPf3B+CKlguVAYT3a84lCejb5wEo8C+z9jMYK/H
 +8IP75w5sh2eQ6xH7MrxgD1+RpdhYj4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-7-8KSnCuOti7z3dQvbQDqA-1; Wed, 07 Dec 2022 13:22:45 -0500
X-MC-Unique: 7-8KSnCuOti7z3dQvbQDqA-1
Received: by mail-qk1-f199.google.com with SMTP id
 h13-20020a05620a244d00b006fb713618b8so25518612qkn.0
 for <qemu-devel@nongnu.org>; Wed, 07 Dec 2022 10:22:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wvsgScsa427sr9lKB0lqismEKml1mVWUcmTxP1DqOes=;
 b=FnYBC+RxfE5eqq1yn0lpT7cKaEssa8n96Dtu6sT9UPlKp6v504UXfGLDKQUELooX15
 sYImKP7R5FvBq2w1adItoLQlqTnYFO2pYdl6gLU4AobwKE8SYf2/Nr9GK0kc3wNwFDiJ
 BrN0v3FVs1CXFbwEhvRwi6FN1DM7iJqrrjn3MqLaMfEp0ixxvcuw5UTZ/UziCHhIiCoC
 CPE7471b3ANxHKfOXn6rChby3v0BWRbZtEnAHrJTngbyYGFd52FMqwq3Lq7dgwHj5rQ1
 KKdAPBwsrX/6PpBwi8yISYy4HObs7Bo5wVQ5Z8rD+2VegiVCoG3st8b88W2rRo31YyZ3
 ISmw==
X-Gm-Message-State: ANoB5pm0Buq3d19Ina9whdDvvRkiY4LsOL9pKT0aicqgTBR7MkbAEJ5j
 C7TKxAw5mSUWxqKy7Be5Z/jodxLZULL5VtmDjrOfS127OCSFrTm8lqnCLPwqa2ZhBQs85N9ngjs
 83Bf/6XlyhHxLE2c=
X-Received: by 2002:a37:5ec7:0:b0:6fa:27fa:45d6 with SMTP id
 s190-20020a375ec7000000b006fa27fa45d6mr81786708qkb.177.1670437364929; 
 Wed, 07 Dec 2022 10:22:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7H8HafZml/7MNPDjkOYfAnoJr1Wddt6qBo7RSaTvJ25bXRRRjKTIVHo4UeYZd8qUdlxsUWAg==
X-Received: by 2002:a37:5ec7:0:b0:6fa:27fa:45d6 with SMTP id
 s190-20020a375ec7000000b006fa27fa45d6mr81786693qkb.177.1670437364668; 
 Wed, 07 Dec 2022 10:22:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k26-20020ac8475a000000b0039cb59f00fcsm8916438qtp.30.2022.12.07.10.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 10:22:44 -0800 (PST)
Message-ID: <3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com>
Date: Wed, 7 Dec 2022 19:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH for 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: eric.auger.pro@gmail.com, Stefan Hajnoczi <stefanha@gmail.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.262, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 12/7/22 17:55, Philippe Mathieu-Daudé wrote:
> On 7/12/22 15:33, Eric Auger wrote:
>> On 12/7/22 15:09, Stefan Hajnoczi wrote:
>>> On Wed, 7 Dec 2022 at 08:31, Eric Auger <eric.auger@redhat.com> wrote:
>>>> On 12/7/22 14:24, Eric Auger wrote:
>>>>> Initialize r0-3 to avoid compilation errors when
>>>>> -Werror=maybe-uninitialized is used
>>>>>
>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>   2495 |     d->Q(3) = r3;
>>>>>        |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>   2494 |     d->Q(2) = r2;
>>>>>        |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>   2493 |     d->Q(1) = r1;
>>>>>        |     ~~~~~~~~^~~~
>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>   2492 |     d->Q(0) = r0;
>>>>>        |     ~~~~~~~~^~~~
>>>>>
>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>
>>>>> ---
>>>>>
>>>>> Am I the only one getting this? Or anything wrong in my setup.
>>>> With Stefan's correct address. Forgive me for the noise.
>>> When is -Wmaybe-uninitialized used? QEMU's build system doesn't set
>>> it. Unless it's automatically set by meson this must be a manual
>>> --extra-cflags= option you set.
>>
>> I am using this configure cmd line:
>>
>> ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/qemu
>> --target-list=x86_64-softmmu --docdir=/usr/share/doc/qemu --enable-kvm
>> --extra-cflags=-O --enable-trace-backends=log --python=/usr/bin/python3
>> --extra-cflags=-Wall --extra-cflags=-Wundef
>> --extra-cflags=-Wwrite-strings --extra-cflags=-Wmissing-prototypes
>> --extra-cflags=-fno-strict-aliasing --extra-cflags=-fno-common
>> --extra-cflags=-Werror=type-limits
>>>
>>> If you added it manually then let's fix this in 8.0 since it's not
>>> tested/supported and very few people will see this issue.
> Please include the relevant meson output in the commit description, i.e.:
>
> C compiler for the host machine: clang (clang 14.0.0 "Apple clang
> version 14.0.0 (clang-1400.0.29.202)")
> C linker for the host machine: clang ld64 820.1
>
>   Compilation
>     host CPU                     : aarch64
>     host endianness              : little
>     C compiler                   : clang
>     Host C compiler              : clang
>     C++ compiler                 : c++
>     Objective-C compiler         : clang
>     CFLAGS                       : -ggdb
> -Werror=incompatible-function-pointer-types -O2 -g
>     CXXFLAGS                     : -ggdb
> -Werror=incompatible-function-pointer-types -O2 -g
>     OBJCFLAGS                    : -ggdb
> -Werror=incompatible-function-pointer-types -ggdb -O2 -g
>     LDFLAGS                      : -ggdb
> -Werror=incompatible-function-pointer-types
>     QEMU_CFLAGS                  : ...
>     QEMU_CXXFLAGS                : ...
>     QEMU_OBJCFLAGS               : ...
>     QEMU_LDFLAGS                 : -fstack-protector-strong
Here is the data:

C compiler for the host machine: cc -m64 -mcx16 (gcc 11.3.1 "cc (GCC)
11.3.1 20220421 (Red Hat 11.3.1-2)")
C linker for the host machine: cc -m64 -mcx16 ld.bfd 2.35.2-24

  Compilation
    host CPU                     : x86_64
    host endianness              : little
    C compiler                   : cc -m64 -mcx16
    Host C compiler              : cc -m64 -mcx16
    C++ compiler                 : c++ -m64 -mcx16
    CFLAGS                       : -O -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common
-Werror=type-limits -O2 -g
    CXXFLAGS                     : -O -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common
-Werror=type-limits -O2 -g
    LDFLAGS                      : -O -Wall -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -Werror=type-limits
    QEMU_CFLAGS                  : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
    QEMU_CXXFLAGS                : -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wundef
-Wwrite-strings -fno-strict-aliasing -fno-common -fwrapv -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
    QEMU_OBJCFLAGS               :
    QEMU_LDFLAGS                 : -fstack-protector-strong -Wl,-z,relro
-Wl,-z,now

Eric

>
> Thanks,
>
> Phil.
>


