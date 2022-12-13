Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7B64BA59
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 17:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p58Xd-0002Gs-VG; Tue, 13 Dec 2022 11:54:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p58Xa-0002Fk-94; Tue, 13 Dec 2022 11:54:02 -0500
Received: from 2.mo552.mail-out.ovh.net ([178.33.105.233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1p58XY-0002B0-K1; Tue, 13 Dec 2022 11:54:02 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 1056726A57;
 Tue, 13 Dec 2022 16:53:55 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 17:53:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00523356e20-8a11-4916-b4c2-f93a06f4e123,
 70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
Date: Tue, 13 Dec 2022 17:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>
CC: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>, David
 Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>, Greg
 Kurz <groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8f7c01ff-bff5-40a3-9427-ab6b74539159
X-Ovh-Tracer-Id: 12547591513020074814
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrghdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrhhordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpug
 grvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.33.105.233; envelope-from=clg@kaod.org;
 helo=2.mo552.mail-out.ovh.net
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

On 12/13/22 17:27, Richard Henderson wrote:
> On 12/13/22 10:21, Peter Maydell wrote:
>> On Tue, 13 Dec 2022 at 16:14, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> On 12/13/22 10:10, Philippe Mathieu-Daudé wrote:
>>>> On 13/12/22 17:00, Richard Henderson wrote:
>>>>> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>>>>>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>>>>>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>>>>>> aCube Sam460ex board") were testing on a little-endian setup,
>>>>>> they meant to use const_le32() instead of tswap32() here,
>>>>>> since tswap32() depends on the host endianness.
>>>>>
>>>>> tswap depends on target endianness.
>>>>
>>>> Yes, it depends on both host/target endianness. What I meant
>>>> is we shouldn't have system code depending on host endianness.
>>>
>>> It compares host vs target endianness, to determine if a swap is needed.  But the real
>>> dependency is target endianness.
>>
>> It does seem odd, though. We have a value in host endianness
>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>> being a C constant). But we're storing it to env->gpr[], which
>> is to say the CPUPPCState general purpose register array. Isn't
>> that array *also* kept in host endianness order?
> 
> Yes indeed.
> 
>> If so, then the right thing here is "don't swap at all",
> 
> So it would seem...
> 
>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>> that the current code is setting the wrong value for the GPR
>> on little-endian hosts, which seems a bit unlikely...
> 
> ... unless this board has only been tested on matching hosts.

But these are register default values. Endianness doesn't apply
there. Doesn't it ?

C.


