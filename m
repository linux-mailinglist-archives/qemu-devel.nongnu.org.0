Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9264629CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:53:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouxI3-0000wV-HB; Tue, 15 Nov 2022 09:51:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouxHy-0000sm-0h
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:51:51 -0500
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ouxHv-0000dA-5E
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:51:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 2733426FF3;
 Tue, 15 Nov 2022 14:51:42 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 15 Nov
 2022 15:51:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b7ecde52-4ca2-4ba3-b364-b4ce7e61b764,
 4108EF7A520F6C47CD43A20CA0BA38D18DA47D40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <566a0720-f732-cb27-a98f-367e1981a02f@kaod.org>
Date: Tue, 15 Nov 2022 15:51:35 +0100
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA9OiNsX4-O60zKXL8WoEJbOH2TQr3LwDFJH4SOS8EPTMg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 61ca39bd-36d0-4d69-8d5c-d0aed5de3a9e
X-Ovh-Tracer-Id: 12069084053706148656
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdejtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpfhhrrghsshgvrdhighhlvghsihgrshesghhmrghilhdrtghomhdpkhifohhlfhesrhgvughhrghtrdgtohhmpdhhrhgvihhtiiesrhgvughhrghtrdgtohhmpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhpvghtvghrsehpjhgurdguvghvpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorh
 hgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/15/22 15:34, Peter Maydell wrote:
> On Tue, 15 Nov 2022 at 14:22, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> Currently, when a block backend is attached to a m25p80 device and the
>> associated file size does not match the flash model, QEMU complains
>> with the error message "failed to read the initial flash content".
>> This is confusing for the user.
> 
> The commit message says we get an unhelpful error if the
> file size "does not match"...
> 
>> Improve the reported error with a new message regarding the file size.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 02adc87527..e0515e2a1e 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -1606,6 +1606,14 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>       if (s->blk) {
>>           uint64_t perm = BLK_PERM_CONSISTENT_READ |
>>                           (blk_supports_write_perm(s->blk) ? BLK_PERM_WRITE : 0);
>> +
>> +        if (blk_getlength(s->blk) < s->size) {
> 
> ...but the code change is only checking for "too small".
> 
> What happens if the user provides a backing file that is too large ?

That's ok because the blk_pread() call following, which loads in RAM
the initial data, won't fail.

It might be better to enforce a strict check on the size to avoid
further confusion ? and change the error message to be clear.
  
> 
>> +            error_setg(errp,
>> +                       "backend file is too small for flash device %s (%d MB)",
>> +                       object_class_get_name(OBJECT_CLASS(mc)), s->size >> 20);
> 
> This potentially reports to the user a size which isn't the
> right one for them to use to set the size of the backing file,
> if that required size isn't an exact number of MB.

True. We have a few devices which size is below 1MB. Using a KB unit
should be fine.

Thanks,

C.

> 
>> +            return;
>> +        }
>> +
>>           ret = blk_set_perm(s->blk, perm, BLK_PERM_ALL, errp);
>>           if (ret < 0) {
>>               return;
>> --
>> 2.38.1
> 
> thanks
> -- PMM


