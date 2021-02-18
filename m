Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B031EC11
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 17:13:09 +0100 (CET)
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lClvQ-0005mF-Fl
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 11:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lCltO-0004RY-ND
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:11:03 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:37404
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lCltK-0007Uj-1Z
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 11:11:02 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id BAA45DA0330;
 Thu, 18 Feb 2021 17:10:53 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>, P J P <ppandit@redhat.com>
References: <20210218140629.373646-1-ppandit@redhat.com>
 <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] net: eepro100: validate various address values
Message-ID: <4bd0a545-6859-58c9-aa14-0a68cf40b266@weilnetz.de>
Date: Thu, 18 Feb 2021 17:10:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_8sUX5nbg5+DR8Z6F3t1Y3o=tgZY56dFTKLgA7XVWOcw@mail.gmail.com>
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
Cc: Jason Wang <jasowang@redhat.com>,
 Ruhr-University Bochum <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18.02.21 um 15:41 schrieb Peter Maydell:

> On Thu, 18 Feb 2021 at 14:13, P J P <ppandit@redhat.com> wrote:
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> While processing controller commands, eepro100 emulator gets
>> command unit(CU) base address OR receive unit (RU) base address
>> OR command block (CB) address from guest. If these values are not
>> checked, it may lead to an infinite loop kind of issues. Add checks
>> to avoid it.
>>
>> Reported-by: Ruhr-University Bochum <bugs-syssec@rub.de>
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> ---
>>   hw/net/eepro100.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
>> index 16e95ef9cc..afa1c9b2aa 100644
>> --- a/hw/net/eepro100.c
>> +++ b/hw/net/eepro100.c
>> @@ -843,7 +843,8 @@ static void action_command(EEPRO100State *s)
>>           bool bit_i;
>>           bool bit_nc;
>>           uint16_t ok_status =3D STATUS_OK;
>> -        s->cb_address =3D s->cu_base + s->cu_offset;
>> +        s->cb_address =3D s->cu_base + s->cu_offset;  /* uint32_t ove=
rflow */
>> +        assert (s->cb_address >=3D s->cu_base);
> We get these values from the guest; you can't just assert() on them.
> You need to do something else.
>
> My reading of the 8255x data sheet is that there is nothing
> in the hardware that forbids the guest from programming the
> device such that the cu_base + cu_offset wraps around:
> http://www.intel.com/content/dam/doc/manual/8255x-10-100-mbps-ethernet-=
controller-software-dev-manual.pdf
> -- page 30 says that this is all doing 32-bit arithmetic
> on addresses and doesn't say that there is any special case
> handling by the device of overflow of that addition.
>
> Your commit message isn't very clear about what the failure
> case is here, but I think the fix has to be something
> different from this.


I agree with Peter. The hardware emulation in QEMU should try to do the=20
same as the real hardware.

Assertions (not with assert(), but with g_assert() and related=20
functions) are good to catch implementation errors in QEMU code, but not =

to catch bad programming in guest code.

In this special case the emulation code already includes a hack to catch =

endless loops caused by buggy guest code: it has a limit of 16 cycles=20
and then prints a log message. This is a compromise to emulate the real=20
hardware as good as possible without making QEMU running an endless loop =

or requiring an extra thread to emulate the hardware loop until it is=20
stopped by new I/O operations.

Stefan




