Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDA629CC2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:57:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxN8-0005kp-Il; Tue, 15 Nov 2022 09:57:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouxN6-0005ib-Rm
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:57:08 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouxN4-0001aH-8j
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:57:08 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D8C0920916;
 Tue, 15 Nov 2022 14:57:01 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 15:57:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ca4d6c3c-d703-443d-9008-e83b9050eb54,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c0a8e901-d8d7-1d77-526c-210660516280@kaod.org>
Date: Tue, 15 Nov 2022 15:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] m25p80: Warn the user when the backend file is too small
 for the device
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Alistair Francis <alistair@alistair23.me>, Francisco Iglesias
 <frasse.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Delevoryas <peter@pjd.dev>,
 <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>
References: <20221115142141.2073761-1-clg@kaod.org>
 <CAFEAcA9OiNsX4-O60zKXL8WoEJbOH2TQr3LwDFJH4SOS8EPTMg@mail.gmail.com>
 <566a0720-f732-cb27-a98f-367e1981a02f@kaod.org>
 <CAFEAcA8AoQKGNEYwmw5SiDykRR+XWEvH0og_at-HTAiTZo=jag@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8AoQKGNEYwmw5SiDykRR+XWEvH0og_at-HTAiTZo=jag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2888a883-cbab-4024-91be-4fd279cfb01c
X-Ovh-Tracer-Id: 12158874570260908847
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdejudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpfhhrrghsshgvrdhighhlvghsihgrshesghhmrghilhdrtghomhdpkhifohhlfhesrhgvughhrghtrdgtohhmpdhhrhgvihhtiiesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhpvghtvghrsehpjhgurdguvghvpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorh
 hgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/15/22 15:55, Peter Maydell wrote:
> On Tue, 15 Nov 2022 at 14:51, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 11/15/22 15:34, Peter Maydell wrote:
>>> On Tue, 15 Nov 2022 at 14:22, Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> Currently, when a block backend is attached to a m25p80 device and the
>>>> associated file size does not match the flash model, QEMU complains
>>>> with the error message "failed to read the initial flash content".
>>>> This is confusing for the user.
>>>
>>> The commit message says we get an unhelpful error if the
>>> file size "does not match"...
>>>
>>>> Improve the reported error with a new message regarding the file size.
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>    hw/block/m25p80.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>>> index 02adc87527..e0515e2a1e 100644
>>>> --- a/hw/block/m25p80.c
>>>> +++ b/hw/block/m25p80.c
>>>> @@ -1606,6 +1606,14 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>>>        if (s->blk) {
>>>>            uint64_t perm = BLK_PERM_CONSISTENT_READ |
>>>>                            (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
>>>> +
>>>> +        if (blk_getlength(s->blk) < s->size) {
>>>
>>> ...but the code change is only checking for "too small".
>>>
>>> What happens if the user provides a backing file that is too large ?
>>
>> That's ok because the blk_pread() call following, which loads in RAM
>> the initial data, won't fail.
>>
>> It might be better to enforce a strict check on the size to avoid
>> further confusion ? and change the error message to be clear.
> 
> Can we use blk_check_size_and_read_all() here rather than
> a manual "check size, and then pread" ? That will take care
> of the error message for you and make this device behave
> the same way as other flash devices which use block backends.

ok. I wasn't aware of this routine. I will check.

Thanks,
C.

