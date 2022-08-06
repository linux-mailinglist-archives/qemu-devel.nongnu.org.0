Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AD58B4C8
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Aug 2022 11:40:38 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKGIO-00029X-OO
	for lists+qemu-devel@lfdr.de; Sat, 06 Aug 2022 05:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKGGM-0000Cq-VG; Sat, 06 Aug 2022 05:38:31 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oKGGJ-0000od-JG; Sat, 06 Aug 2022 05:38:29 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id BC8D674635D;
 Sat,  6 Aug 2022 11:38:23 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8AD80746335; Sat,  6 Aug 2022 11:38:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 87F93745702;
 Sat,  6 Aug 2022 11:38:23 +0200 (CEST)
Date: Sat, 6 Aug 2022 11:38:23 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Peter Maydell <peter.maydell@linaro.org>
cc: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <27b7eacd-6946-9eb5-5320-7a404de75a7@eik.bme.hu>
Message-ID: <b4f8b5cd-aa53-b89-4ccf-6be71babdc77@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
 <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
 <CAFEAcA8qBMUY+an+-i7x2i98iATjMN7m89rGsSwEV90sH-iCdg@mail.gmail.com>
 <ceb063e-b796-a5b1-5bd1-4cd81c5ed2d@eik.bme.hu>
 <CAFEAcA_eTMV5DKVfe6wdPgbXPTp6aw7FoMjxPratgohMA5F+7Q@mail.gmail.com>
 <27b7eacd-6946-9eb5-5320-7a404de75a7@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Aug 2022, BALATON Zoltan wrote:
> On Fri, 5 Aug 2022, Peter Maydell wrote:
>> On Fri, 5 Aug 2022 at 17:50, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>> This also
>>> allows to get the cpu without a link with something like:
>>> 
>>> PPC4XX_MACHINE(current_machine /* or qdev_get_machine() */)->soc.cpu
>> 
>> ...and now you have device code that's making assumptions about
>> the machine and SoC it's in.
>
> Since these devices are strictly part of this SoC making this asumption 
> should be OK. Making assumption about the machine may be a valid argument

I think this is my really last comment on this topic but I can't stop 
thinking about this. If we can't user parent or get the cpu any other way 
and we have to use a link property then we probably need a PPC4xxSocDevice 
abstract class that has the cpu link and all these devices derive from 
that. That way the boilerplate for the link property is confined to this 
SocDevice class and does not have to be repeated in every other SoC 
device. Unless QOM properties don't work that way and they would need to 
be aliased in which case it does not bring anything.

Regards,
BALATON Zoltan

