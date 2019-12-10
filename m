Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147631182D4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Dec 2019 09:53:13 +0100 (CET)
Received: from localhost ([::1]:52208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iebGa-0003r6-0G
	for lists+qemu-devel@lfdr.de; Tue, 10 Dec 2019 03:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iebFn-0003JM-Jo
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iebFm-0005Xj-Ms
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:52:23 -0500
Received: from 8.mo3.mail-out.ovh.net ([87.98.172.249]:34882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iebFm-0005Ur-HI
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 03:52:22 -0500
Received: from player760.ha.ovh.net (unknown [10.108.16.166])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 4132623916F
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 09:52:13 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 78875D1DC949;
 Tue, 10 Dec 2019 08:52:06 +0000 (UTC)
Subject: Re: [PATCH 2/5] ppc/pnv: Introduce a POWER10 PnvChip and a powernv10
 machine
To: David Gibson <david@gibson.dropbear.id.au>
References: <20191205184454.10722-1-clg@kaod.org>
 <20191205184454.10722-3-clg@kaod.org>
 <20191210033454.GE207300@umbus.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ba99c545-fa33-fd34-0308-ed83f7ad62f4@kaod.org>
Date: Tue, 10 Dec 2019 09:52:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191210033454.GE207300@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6682215948407049024
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelvddguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeeitddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.172.249
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2019 04:34, David Gibson wrote:
>> +static inline bool pnv_chip_is_power10(const PnvChip *chip)
>> +{
>> +    return PNV_CHIP_GET_CLASS(chip)->chip_type == PNV_CHIP_POWER10;
>> +}
>> +
>> +static inline bool pnv_is_power10(PnvMachineState *pnv)
>> +{
>> +    return pnv_chip_is_power10(pnv->chips[0]);
>> +}
>

I agree this is starting to be ugly.

> It's not in scope for this series, but now that we have P8/9/10
> specific chip object types and powernv8/powernv9, we should be able to
> remove the ugly chip_type field, and just do object class checks on
> the chip and or machine objects themselves.
 

So we would use object_class_dynamic_cast() instead of field chip_type ?

C.

