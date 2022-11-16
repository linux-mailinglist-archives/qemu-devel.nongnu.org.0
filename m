Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C1062B3D4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 08:14:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovCbF-0003Cf-CZ; Wed, 16 Nov 2022 02:12:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovCbD-00039i-Ll
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 02:12:43 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ovCbB-0001AD-MQ
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 02:12:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 59BDC13F3C187;
 Wed, 16 Nov 2022 08:12:37 +0100 (CET)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 16 Nov
 2022 08:12:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S0025291a1ba-3038-4302-8044-183f1ba1d196,
 02E7B4D3E773D69B5537C3086E449D6A4A510449) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1bc3c01f-ecff-28d9-c29f-64a11ffd0e9a@kaod.org>
Date: Wed, 16 Nov 2022 08:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] m25p80: Improve error when the backend file size does
 not match the device
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
CC: Alistair Francis <alistair@alistair23.me>, Francisco Iglesias
 <frasse.iglesias@gmail.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Peter
 Delevoryas <peter@pjd.dev>, <qemu-block@nongnu.org>, <qemu-devel@nongnu.org>
References: <20221115151000.2080833-1-clg@kaod.org>
 <87edu3o0ag.fsf@pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87edu3o0ag.fsf@pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: f9f4b88a-9e15-44ad-94e6-5fa701f37101
X-Ovh-Tracer-Id: 10188549735492520882
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghrmhgsrhhusehrvgguhhgrthdrtghomhdprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhfrhgrshhsvgdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhkfiholhhfsehrvgguhhgrthdrtghomhdphhhrvghithiisehrvgguhhgrthdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhpvghtvghrsehpjhgurdguvghvpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpd
 hqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehvdelpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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

On 11/16/22 07:56, Markus Armbruster wrote:
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Currently, when a block backend is attached to a m25p80 device and the
>> associated file size does not match the flash model, QEMU complains
>> with the error message "failed to read the initial flash content".
>> This is confusing for the user.
>>
>> Use blk_check_size_and_read_all() instead of blk_pread() to improve
>> the reported error.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 02adc87527..68a757abf3 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -24,6 +24,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/units.h"
>>   #include "sysemu/block-backend.h"
>> +#include "hw/block/block.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-properties-system.h"
>>   #include "hw/ssi/ssi.h"
>> @@ -1614,8 +1615,7 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>>           trace_m25p80_binding(s);
>>           s->storage = blk_blockalign(s->blk, s->size);
>>   
>> -        if (blk_pread(s->blk, 0, s->size, s->storage, 0) < 0) {
>> -            error_setg(errp, "failed to read the initial flash content");
>> +        if (!blk_check_size_and_read_all(s->blk, s->storage, s->size, errp)) {
>>               return;
>>           }
>>       } else {
> 
> Ignorant question: what does blk_pread() on short read?  Does it fail?

an underlying call to blk_check_byte_request() makes it fail.

> Or does it succeed, returning how much it read?  I tried to find an
> answer in function comments, no luck.
> 
> Are there more instances of "we fill some fixed-size memory (such as a
> ROM or flash) from a block backend?"

Yes. There are other similar devices :  nand, nvram, pnv_pnor, etc.

C.


