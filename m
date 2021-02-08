Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED1313903
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 17:13:57 +0100 (CET)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l99Ai-0000fp-CN
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 11:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l92yF-0000e7-Ok
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:36:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l92xn-0008Gd-QT
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:36:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612776950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LecizDr9k0Q1Eq6Li75YzDoIbQKVBOCpBCzsri6ySIs=;
 b=ao+wmQIi6XvwRNjN7N000WkmvLkzHNWLyFY8qU5PNJ3Um3Aud0533hetAzJaegQ80M7iu0
 utRqCHjVtyx4jtE9NiulSPqVb5E7LWs2WiNuTl8bFPNctSCP5WSikHuZLL86a2sZFWrfMU
 l/KbL3+ryR5UADDvgeGXoxHSIKtZK5E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-K--GFsDeOP2aPH-bGEvibA-1; Mon, 08 Feb 2021 04:35:49 -0500
X-MC-Unique: K--GFsDeOP2aPH-bGEvibA-1
Received: by mail-wm1-f72.google.com with SMTP id t128so5148944wmg.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 01:35:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LecizDr9k0Q1Eq6Li75YzDoIbQKVBOCpBCzsri6ySIs=;
 b=OO0QjtezXVH4RsCQtl5I1Zi/y9cSSwaOzjCV0EdmcibVFpCFi+cZB9pyMUVLSWtG7w
 3bZqy0BQ1HzJKd06gZHFUrI9708h0PQyPBTDHlsk8zG+H4h9NmhRCdZDCOh1dAbJpfhf
 ZTsCxbtF1OHMhGyP+v8vsp2JqhwGjogf8i9jDKCuv5SE3n/hbjAsAvYyL+BDRjHEL38w
 I2UQEbrPriskNoBUrc4wrWRSTLtWFOpYaar+mYoASPRH7djNDaDluQDf0F3meKBaPmo2
 vKuM5rgO27pUNV833DiQc3akOFzckGq6LOX07zuSrKR0p+Ah6Cx+3+lmCEXKegeJD2hV
 aGOw==
X-Gm-Message-State: AOAM530oJzTyOsphryd74UaBg1F0j/jgNtwXbG8cQnL0x/gbHQpsxret
 ons1tqRUUYY7VDJpaxxJ+g5ueXg8B6Vn0pZG7wUMh6NxEcXCrFFXbpoeqqZ8qRAXhEUsfC0kpas
 vXIZ91YWv1VIHbNfEmS0Wxyv4m20TPeS5/XCj69atBvDErIk/elX+dZBCqkJyiOxqNak=
X-Received: by 2002:adf:f58b:: with SMTP id f11mr18971988wro.3.1612776947665; 
 Mon, 08 Feb 2021 01:35:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRPezJHAeujdAoQEHRixSyieZzthiHiF3VHh4u7WH/DZPgJK5BYEwUpLro3D4WRCD0IgZXAg==
X-Received: by 2002:adf:f58b:: with SMTP id f11mr18971965wro.3.1612776947441; 
 Mon, 08 Feb 2021 01:35:47 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id d9sm29822264wrq.74.2021.02.08.01.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 01:35:46 -0800 (PST)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
Date: Mon, 8 Feb 2021 10:35:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/02/21 10:20, Peter Maydell wrote:
>>>> +
>>>> +if get_option('tcg_interpreter')
>>>> +  libffi = dependency('libffi', version: '>=3.0',
>>>> +                      static: enable_static, method: 'pkg-config',
>>>> +                      required: true)
>>>> +  specific_ss.add(libffi)
>>>> +  specific_ss.add(files('tcg/tci.c'))
>>>> +endif
>>> Did you need a PKG_CONFIG_LIBDIR set for homebrew?
>> Is this the "meson doesn't actually add the cflags everywhere it should"
>> bug again ?

No, it shouldn't be the same bug.  In this case the dependency is not 
indirect dependency, specific_ss is included directly:

   target_specific = specific_ss.apply(config_target, strict: false)
   arch_srcs += target_specific.sources()
   arch_deps += target_specific.dependencies()

   lib = static_library('qemu-' + target,
                  sources: arch_srcs + genh,
                  dependencies: arch_deps,
                  objects: objects,
                  include_directories: target_inc,
                  c_args: c_args,
                  build_by_default: false,
                  name_suffix: 'fa')

It's more likely to be what Stefan pointed out later:

> Meanwhile I noticed an additional detail:
> 
> There exist two different pkg-config configurations for libffi on Homebrew:
> 
> % pkg-config --cflags libffi
> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
> % export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
> % pkg-config --cflags libffi
> -I/opt/homebrew/Cellar/libffi/3.3_2/include
>
> By default it points to a system directory which does not exist at all
> on my Mac, so that will never work.

Paolo


