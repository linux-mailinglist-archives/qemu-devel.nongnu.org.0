Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6434312790
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 22:34:02 +0100 (CET)
Received: from localhost ([::1]:46484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8rgv-0005Mx-GT
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 16:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8rgA-0004tf-Oz
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 16:33:14 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:35970
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l8rg7-0005FZ-WD
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 16:33:14 -0500
Received: from [192.168.178.24] (p5b1511bf.dip0.t-ipconnect.de [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3918ADA1368;
 Sun,  7 Feb 2021 22:33:08 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
Message-ID: <2e72abaf-0ef2-f822-3be3-b8f59f18d9d2@weilnetz.de>
Date: Sun, 7 Feb 2021 22:33:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 07.02.21 21:12, Richard Henderson wrote:
> On 2/7/21 11:52 AM, Peter Maydell wrote:
>> On Sun, 7 Feb 2021 at 17:41, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> On 2/7/21 8:25 AM, Stefan Weil wrote:
>>>>> +#include "qemu-common.h"
>>>>> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
>>>>> +#include "exec/cpu_ldst.h"
>>>>> +#include "tcg/tcg-op.h"
>>>>> +#include "qemu/compiler.h"
>>>>> +#include <ffi.h>
>>>>> +
>>>>
>>>>
>>>> ffi.h is not found on macOS with Homebrew.
>>>>
>>>> This can be fixed by using pkg-config to find the right compiler (and maybe
>>>> also linker) flags:
>>>>
>>>> % pkg-config --cflags libffi
>>>> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
>>>> % pkg-config --libs libffi
>>>> -lffi
>>>
>>>
>>> Which is exactly what I do in the previous patch:
>>>
>>>
>>>> +++ b/meson.build
>>>> @@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
>>>>    'tcg/tcg-op.c',
>>>>    'tcg/tcg.c',
>>>>  ))
>>>> -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
>>>> +
>>>> +if get_option('tcg_interpreter')
>>>> +  libffi = dependency('libffi', version: '>=3.0',
>>>> +                      static: enable_static, method: 'pkg-config',
>>>> +                      required: true)
>>>> +  specific_ss.add(libffi)
>>>> +  specific_ss.add(files('tcg/tci.c'))
>>>> +endif
>>>
>>> Did you need a PKG_CONFIG_LIBDIR set for homebrew?
>>
>> Is this the "meson doesn't actually add the cflags everywhere it should"
>> bug again ?
> 
> I guess so.  I realized after sending this reply that PKG_CONFIG_LIBDIR can't
> be the answer, since the original configure should have failed if pkg-config
> didn't find ffi.
> 
> Was there a resolution to said meson bug?

Meanwhile I noticed an additional detail:

There exist two different pkg-config configurations for libffi on Homebrew:

% pkg-config --cflags libffi
-I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
% export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"
% pkg-config --cflags libffi
-I/opt/homebrew/Cellar/libffi/3.3_2/include

By default it points to a system directory which does not exist at all
on my Mac, so that will never work.

With the right PKG_CONFIG_PATH a correct include directory is set, and
the latest rebased tci-next branch now works for me with a compiler warning:

/opt/homebrew/Cellar/libffi/3.3_2/include/ffi.h:441:5: warning:
'FFI_GO_CLOSURES' is not defined, evaluates to 0 [-Wundef]

Stefan

