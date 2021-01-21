Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE02FEF90
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 16:57:07 +0100 (CET)
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2cKY-0008Bw-Tr
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 10:57:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2cJF-0007fu-9V
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2cJA-0002Mz-Do
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 10:55:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611244538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mFxJfukx0zPQQ2ilzrXBzb5gAMhRVYziKFg4h/Y6ECU=;
 b=dCE4TqiDtOxL0Cos7zuzcrXj9Rknlh2Z2nl2JGvN+qEtdH2/T+LnER11YhdRcB1ONxY9Np
 xScgb+VuHoJo/GjyCNl0LEW+IyWPoNSqcg60KMacm8SNiJz2b4lz46ZUxMNcLUx9F4wVAy
 90cREM8LdEf0uD5D52OpCGJ21zaqsd0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-gRwCn2jzNs6rLqTcLo328A-1; Thu, 21 Jan 2021 10:55:36 -0500
X-MC-Unique: gRwCn2jzNs6rLqTcLo328A-1
Received: by mail-ed1-f69.google.com with SMTP id w4so1378620edu.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 07:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mFxJfukx0zPQQ2ilzrXBzb5gAMhRVYziKFg4h/Y6ECU=;
 b=UfLQYsBep2jdjPdusTNAnHpJO9+OPsuSw4FI6qxR5iF/bH1/rIVfeldCsBRlvTGcjP
 pnIv5YcLhieEm1zxQgbXt+Mt4PvUVlQl92fWH8Cpa7SkMvF6Oaa+IDFErU+Gn4Wcp34h
 nxHp97LH2NuLlnNY+ue5WfpIfyn/zZCEVKzQ8yWSBxsbJw2tDLFsefqbngo+VKXnZAXx
 fJEsR0UzE79q+kkMDgNgUlGZ2Ry2SXOS4aAms3MFZN+20YkwKxeb1NVPTn9GIqk0dECk
 IFsnJlCtfMo/ThQzwc2wKGaa03Kw8zQxv6Itkp80gb/SXSIy+CI4oXy5hua4wnNp0fi2
 bo5Q==
X-Gm-Message-State: AOAM533MZZQ83gUczRoGtL1tl73WEzMN1NV1QmRNIVEepHI5FLH7LvSp
 Q/lIrk5k3q2/j15lzqIv/ppuWTIKX4wXWNvLU5NisWvScxu7I9FjyB7bYx6yuAN9xrs09rlzhFm
 VRms8x/kjtcChMlZ1alC/BgdmAyQBh2D16mLgqoo3PXs49SVtrNfRjFh1FR5pwEO3
X-Received: by 2002:a17:906:2695:: with SMTP id
 t21mr72115ejc.287.1611244534879; 
 Thu, 21 Jan 2021 07:55:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzJcRRv1HJ14gKvFSCVlON08w1y/h+kR82xCAm7QMfEXPA7b5sL4RUmYjx1t9j80WmR2URnA==
X-Received: by 2002:a17:906:2695:: with SMTP id
 t21mr72101ejc.287.1611244534624; 
 Thu, 21 Jan 2021 07:55:34 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k21sm2978728edq.60.2021.01.21.07.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 07:55:33 -0800 (PST)
Subject: Re: changing tests/qtest/meson.build causes unnecessary rebuilding
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA8mBK9932CLZ9uFtEa0rSycK6Sp9UDjSJnbJpg2hx8idg@mail.gmail.com>
 <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b17b0df5-4bfd-6fef-3d01-c7783fdb3364@redhat.com>
Date: Thu, 21 Jan 2021 16:55:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <17698af4-537b-3e8e-67c8-4ed45a922def@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 1/21/21 2:12 PM, Paolo Bonzini wrote:
> On 21/01/21 12:56, Peter Maydell wrote:
>> $ make -C build/arm-clang/ -j8
>> make: Entering directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> [1/23] Generating qemu-version.h with a meson_exe.py custom command
>> make: Leaving directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> $ touch tests/qtest/meson.build
>> $ make -C build/arm-clang/ -j8
>> make: Entering directory
>> '/home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang'
>> /usr/bin/ninja  build.ninja && touch build.ninja.stamp
>> [0/1] Regenerating build files.
>> The Meson build system
>> [...]
>>
>> It then goes on to rebuild hundreds or thousands of files, most of
>> which are not even in tests/. (Oddly, the exact set of files recompiled
>> seems to vary from run to run.)
>>
>> Forcing a full rebuild of all of QEMU seems rather excessive when
>> the change was likely "add a new test case"...
> 
> This is "avoid build.ninja changes due to order of hash table iteration"
> (https://github.com/mesonbuild/meson/pull/7900/).  I think Meson 0.57
> (with the fix) should be out soon, hopefully before 6.0.
> 
> Alternatively you can try to bug your distro to include the patches,
> they are pretty safe.

Possible kludge rebuilding meson locally:

Paolo's #7900 got merged in commit 1c582a9de:
("Merge pull request #7900 from bonzini/stabilize-hash"),
so a possible kludge is to build and install meson in your
$HOME/.local/bin/ directory with pip as:

  $ python3 -m pip install --user \
      git+https://github.com/mesonbuild/meson.git@1c582a9de

Then either update your $PATH or use:

  $ ./configure --meson=$HOME/.local/bin/meson ...

Regards,

Phil.


