Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF73F313F49
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:41:20 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CPP-00083g-J4
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l96Go-0007Vk-FM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:08:07 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:40330
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l96GN-0006Y5-RM
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:07:52 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id EEE9ADA0782;
 Mon,  8 Feb 2021 14:07:07 +0100 (CET)
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
 <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
 <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <02ea197e-7ad0-0d85-78d7-c58f4aeceddc@weilnetz.de>
Date: Mon, 8 Feb 2021 14:07:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <2a61b461-c460-3b25-edd8-30e52b2eb578@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.265,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.02.21 um 10:35 schrieb Paolo Bonzini:

> On 08/02/21 10:20, Peter Maydell wrote:
>>>>> +
>>>>> +if get_option('tcg_interpreter')
>>>>> +  libffi = dependency('libffi', version: '>=3.0',
>>>>> +                      static: enable_static, method: 'pkg-config',
>>>>> +                      required: true)
>>>>> +  specific_ss.add(libffi)
>>>>> +  specific_ss.add(files('tcg/tci.c'))
>>>>> +endif
>>>> Did you need a PKG_CONFIG_LIBDIR set for homebrew?
>>> Is this the "meson doesn't actually add the cflags everywhere it 
>>> should"
>>> bug again ?
>
> No, it shouldn't be the same bug.  In this case the dependency is not 
> indirect dependency, specific_ss is included directly:
>
>   target_specific = specific_ss.apply(config_target, strict: false)
>   arch_srcs += target_specific.sources()
>   arch_deps += target_specific.dependencies()
>
>   lib = static_library('qemu-' + target,
>                  sources: arch_srcs + genh,
>                  dependencies: arch_deps,
>                  objects: objects,
>                  include_directories: target_inc,
>                  c_args: c_args,
>                  build_by_default: false,
>                  name_suffix: 'fa')
>
> It's more likely to be what Stefan pointed out later:
>
>> Meanwhile I noticed an additional detail:
>>
>> There exist two different pkg-config configurations for libffi on 
>> Homebrew:
>>
>> % pkg-config --cflags libffi
>> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
>> % export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
>> % pkg-config --cflags libffi
>> -I/opt/homebrew/Cellar/libffi/3.3_2/include
>>
>> By default it points to a system directory which does not exist at all
>> on my Mac, so that will never work.
>
> Paolo


Yes, it looks like setting the right PKG_CONFIG_PATH is sufficient for 
builds with Homebrew on macOS.

Richard, this commit is also the one which breaks qemu-system-i386 on 
sparc64 for me:

sw@gcc102:~/src/gitlab/qemu-project/qemu$ git bisect good
115a01c323e6a01902894ec23ba704bf3dc8215a is the first bad commit
commit 115a01c323e6a01902894ec23ba704bf3dc8215a
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sat Jan 30 14:24:25 2021 -0800

     tcg/tci: Use ffi for calls

     This requires adjusting where arguments are stored.
     Place them on the stack at left-aligned positions.
     Adjust the stack frame to be at entirely positive offsets.

     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

  include/tcg/tcg.h        |   1 +
  tcg/tcg.c                |  72 +++++++++++++++-----------
  tcg/tci.c                | 131 
++++++++++++++++++++++++++---------------------
  tcg/tci/tcg-target.c.inc |  50 +++++++++---------
  tcg/tci/tcg-target.h     |   2 +-
  5 files changed, 143 insertions(+), 113 deletions(-)

Regards,

Stefan



