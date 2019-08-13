Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D958BEF3
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Aug 2019 18:49:34 +0200 (CEST)
Received: from localhost ([::1]:54354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxZzJ-0002gD-QI
	for lists+qemu-devel@lfdr.de; Tue, 13 Aug 2019 12:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hxZyZ-0001qB-6Y
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 12:48:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hxZyY-0000HZ-BH
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 12:48:47 -0400
Received: from 7.mo3.mail-out.ovh.net ([46.105.57.200]:52868)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hxZyY-0000GW-5z
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 12:48:46 -0400
Received: from player796.ha.ovh.net (unknown [10.108.57.72])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 25817222F8B
 for <qemu-devel@nongnu.org>; Tue, 13 Aug 2019 18:48:43 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id C1B308BBD9B1;
 Tue, 13 Aug 2019 16:48:38 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190813164420.9829-1-clg@kaod.org>
 <CAFEAcA-OmF+gOmhJjsaRVJVg1DAj5nXQz0rJ6wEFfAht+VSqnQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <43eb577e-27a7-de43-93f5-b4f2ae8f3b70@kaod.org>
Date: Tue, 13 Aug 2019 18:48:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-OmF+gOmhJjsaRVJVg1DAj5nXQz0rJ6wEFfAht+VSqnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 16855566031047134165
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.57.200
Subject: Re: [Qemu-devel] [PATCH] spapr/xive: Mask the EAS when allocating
 an IRQ
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
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/08/2019 18:46, Peter Maydell wrote:
> On Tue, 13 Aug 2019 at 17:44, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> If an IRQ is allocated and not configured, such as a MSI requested by
>> a PCI driver, it can be saved in its default state and possibly later
>> on restored using the same state. If not initially MASKED, KVM will
>> try to find a matching priority/target tuple for the interrupt and
>> fail to restore the VM because 0/0 is not a valid target.
>>
>> When allocating a IRQ number, the EAS should be set to a sane default =
:
>> VALID and MASKED.
>>
>> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>>
>>  David, this fixes a "virsh save/restore" issue in certain configurati=
ons
>>  of CPU topology which never showed up before :/
>>
>>  Peter, I was busy on a KVM/passthru issue and lacked the time to
>>  investigate all ... you decide.
>=20
> rc5 has been tagged so this is definitely too late for 4.1.

This is nothing too invasive which will be difficult to backport.

Thanks,

C.=20

