Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D2B2D8A22
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 22:21:51 +0100 (CET)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koCKr-00056o-Uy
	for lists+qemu-devel@lfdr.de; Sat, 12 Dec 2020 16:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1koAxo-0002ot-4U; Sat, 12 Dec 2020 14:53:56 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:13811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1koAxf-00034F-Lx; Sat, 12 Dec 2020 14:53:53 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 53FC57470E8;
 Sat, 12 Dec 2020 20:53:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 268407470E2; Sat, 12 Dec 2020 20:53:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2529274645F;
 Sat, 12 Dec 2020 20:53:44 +0100 (CET)
Date: Sat, 12 Dec 2020 20:53:44 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/8] ppc: Convert PPC UIC to a QOM device
In-Reply-To: <CAFEAcA85GS=UHtGR=OoL0LZsLBcoV3W-wah=FbHTSG8Sy0gjsw@mail.gmail.com>
Message-ID: <3644c4ed-9284-8037-d62b-f4f4e45cf9b7@eik.bme.hu>
References: <20201212001537.24520-1-peter.maydell@linaro.org>
 <20201212001537.24520-3-peter.maydell@linaro.org>
 <b4550f1-bedb-dc65-70a0-f11083c5da4c@eik.bme.hu>
 <CAFEAcA85GS=UHtGR=OoL0LZsLBcoV3W-wah=FbHTSG8Sy0gjsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Sat, 12 Dec 2020, Peter Maydell wrote:
> On Sat, 12 Dec 2020 at 18:27, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>
>> On Sat, 12 Dec 2020, Peter Maydell wrote:
>>> Currently the PPC UIC ("Universal Interrupt Controller") is implemented
>>> as a non-QOM device in ppc4xx_devs.c. Convert it to a proper QOM device
>>> in hw/intc.
>>>
>>> The ppcuic_init() function is retained for the moment with its current
>>> interface; in subsequent commits this will be tidied up to avoid the
>>> allocation of an irq array.
>>>
>>> This conversion adds VMState support.
>>>
>>> It leaves the LOG_UIC() macro as-is to maximise the extent to which
>>> this is simply code-movement rather than a rewrite (in new code it
>>> would be better to use tracepoints).
>>>
>>> The default property values for dcr-base and use-vectors are set to
>>> match those use by most of our boards with a UIC.
>>
>> Would this be easier to review if it's split into two patches, first doing
>> the conversion in place, then another just doing code moving? Maybe we
>> could spot some problem that way easier?
>
> That didn't really feel very feasible to me. You can see that
> mostly it's code motion using the git diff --color-moved option
> if you look at the commit.

Thanks this helped a bit, at least to confirm the bug is not in here.

Regards,
BALATON Zoltan

