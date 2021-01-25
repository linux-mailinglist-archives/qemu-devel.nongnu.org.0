Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C44302B38
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:13:08 +0100 (CET)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47IR-0006FK-CI
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:13:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l474C-0006Uw-ML
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:58:26 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:33116
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4749-0006GZ-3M
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:58:24 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 1CB54DA0064;
 Mon, 25 Jan 2021 19:58:18 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
Date: Mon, 25 Jan 2021 19:58:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.21 um 18:05 schrieb Philippe Mathieu-Daud=C3=A9:

> On 1/25/21 5:47 PM, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Jan 25, 2021 at 03:45:30PM +0100, Philippe Mathieu-Daud=C3=A9 =
wrote:
>>> Some new users get confused with 'TCG' and 'TCI', and enable TCI
>>> support expecting to enable TCG.
>>>
>>> Emit a warning when native TCG backend is available on the
>>> host architecture, mentioning this is a suboptimal configuration.
>>>
>>> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>> Nitpick, the text printed is completely rewritten from what they
>> reviewed, so I would probably have dropped their R-b for that
>> scenario.
> I thought about it, and assumed their review tag was for the logical
> change of adding a warning, not particularly the warning content.
>
> I agree this it would have been better to ask them to review again.
> Next time I will reset the tags.


You are right, I would not have signed that new text and either used the =

original text (which was sufficient in my opinion) or used a different on=
e:

Use of the TCG interpretor is not recommended on this host architecture f=
or most users because there is a native TCG execution backend available w=
hich provides substantially better performance.

I have no evidence that TCI is less reliable than TCG, so I would not=20
write that.

And there are people who have good reasons to use TCI. So why should I=20
recommend them to stop that?

Stefan

>>> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>>   meson.build | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/meson.build b/meson.build
>>> index 16b2560e7e7..f675c54e636 100644
>>> --- a/meson.build
>>> +++ b/meson.build
>>> @@ -228,6 +228,13 @@
>>>       else
>>>         error('Unsupported CPU @0@, try --enable-tcg-interpreter'.for=
mat(cpu))
>>>       endif
>>> +  elif get_option('tcg_interpreter')
>>> +    warning('Use of the TCG interpretor is not recommended on this h=
ost')
>>> +    warning('architecture. There is a native TCG execution backend a=
vailable')
>>> +    warning('which provides substantially better performance and rel=
iability.')
>>> +    warning('It is strongly recommended to remove the --enable-tcg-i=
nterpreter')
>>> +    warning('configuration option on this architecture to use the na=
tive')
>>> +    warning('backend.')


