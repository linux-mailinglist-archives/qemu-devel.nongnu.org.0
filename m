Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 597432FFF9D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:57:49 +0100 (CET)
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tCO-0006T8-EJ
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:57:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l2tB9-000648-Im
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:56:31 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:36232
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l2tB3-0000mu-Li
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:56:31 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 8CCFDDA072C;
 Fri, 22 Jan 2021 10:56:21 +0100 (CET)
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210122092205.1855659-1-philmd@redhat.com>
 <20210122092205.1855659-3-philmd@redhat.com>
 <b661e53c-8c3a-ae19-0250-400d9977dc76@redhat.com>
 <CAP+75-WNPbyB6-qFd3o4QUGr0jhfhR-EvwsV9ToL4VRJY3uKug@mail.gmail.com>
 <ea55ed86-468c-bb47-3c31-ed099af08b78@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 2/2] meson: Warn when TCI is selected but TCG backend is
 available
Message-ID: <b4c20547-7db0-a279-c4cf-e170081a9b7c@weilnetz.de>
Date: Fri, 22 Jan 2021 10:56:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <ea55ed86-468c-bb47-3c31-ed099af08b78@redhat.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 22.01.21 um 10:47 schrieb Thomas Huth:

> On 22/01/2021 10.46, Philippe Mathieu-Daud=C3=A9 wrote:
>> On Fri, Jan 22, 2021 at 10:43 AM Thomas Huth <thuth@redhat.com> wrote:=

>>> On 22/01/2021 10.22, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> Some new users get confused with 'TCG' and 'TCI', and enable TCI
>>>> support expecting to enable TCG.
>>>>
>>>> Emit a warning when native TCG backend is available on the
>>>> host architecture, mentioning this is a suboptimal configuration.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>>> ---
>>>> =C2=A0=C2=A0 meson.build | 3 +++
>>>> =C2=A0=C2=A0 1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meson.build b/meson.build
>>>> index 0a645e54662..7aa52d306c6 100644
>>>> --- a/meson.build
>>>> +++ b/meson.build
>>>> @@ -234,6 +234,9 @@
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error('Unsupported =
CPU @0@, try=20
>>>> --enable-tcg-interpreter'.format(cpu))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 endif
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 endif
>>>> +=C2=A0 if 'CONFIG_TCG_INTERPRETER' in config_host and cpu in=20
>>>> supported_cpus
>>>> +=C2=A0=C2=A0=C2=A0 warning('Experimental TCI requested while native=
 TCG is=20
>>>> available on @0@, suboptimal performance expected'.format(cpu))
>>>> +=C2=A0 endif
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 accelerators +=3D 'CONFIG_TCG'
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 config_host +=3D { 'CONFIG_TCG': 'y' }
>>>> =C2=A0=C2=A0 endif
>>>>
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>
>>> ... maybe you could also add some wording to the help text of the=20
>>> configure
>>> script? Or maybe we could simply rename the "--enable-tcg-interpreter=
"
>>> option into "--enable-tci" to avoid confusion with the normal TCG ?
>>
>> I also thought about renaming as --enable-experimental-tci but then=20
>> doubt that
>> would help, some users just want to enable everything :)
>
> Then we should rename it into --disable-native-tcg ;-)
>
> =C2=A0Thomas
>

Both patches are fine (also optionally with the suggested addition of=20
"slow"), so

Reviewed-by: Stefan Weil <sw@weilnetz.de>

I think that --enable-tci would increase the TCI/TCG confusion and=20
suggest to keep the current --enable-tcg-interpreter as most experts=20
know that an interpreter is usually something which is slow.

As soon as time permits I also plan to make a new effort to integrate=20
TCI as a run time option. Some years ago it was not possible to have=20
code which supports both native and interpreted TCG, but this might have =

changed now. If it is possible, this would simplify CI a lot, and users=20
could select the interpreter via a command line argument.

Stefan




