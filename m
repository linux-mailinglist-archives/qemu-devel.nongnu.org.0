Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF1F58CA35
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:11:05 +0200 (CEST)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3TE-0007zu-VC
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL3QR-00045I-SN; Mon, 08 Aug 2022 10:08:11 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:46790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL3QP-0005qk-GI; Mon, 08 Aug 2022 10:08:11 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3B795747644;
 Mon,  8 Aug 2022 16:08:06 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 000B1746FDE; Mon,  8 Aug 2022 16:08:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F2B22746E07;
 Mon,  8 Aug 2022 16:08:05 +0200 (CEST)
Date: Mon, 8 Aug 2022 16:08:05 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 00/22] ppc: QOM'ify 405 board
In-Reply-To: <db56128c-4e25-5c23-97a4-c9a8a2fa0f49@kaod.org>
Message-ID: <95f06a5-b7b8-d79-7564-20652ac89e7@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
 <65dff991-cf15-75e9-8cb-d55e72ae5560@eik.bme.hu>
 <db56128c-4e25-5c23-97a4-c9a8a2fa0f49@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-907815730-1659967685=:47322"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-907815730-1659967685=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> On 8/8/22 14:16, BALATON Zoltan wrote:
>> On Mon, 8 Aug 2022, Cédric Le Goater wrote:
>>> Hello,
>>> 
>>> Here is large series QOM'ifying the PPC405 board. It introduces a new
>>> generic machine and SoC models, converts the current device models to
>>> QOM and populates the SoC. The process is quite mechanical without too
>>> much issues to handle. The noisy part is the initial patch introducing
>>> the SoC realize routine.
>>> 
>>> What's left ?
>>> 
>>> * the SDRAM mappings are very baroque and certainly could be simplified.
>>>  I think we should QOMify the ppc440 machines before addressing this
>>>  part.
>> 
>> The issue with SDRAM controller and the likely reason why its model looks 
>> so complex is that it can't handle any RAM size because of how the bank 
>> sizes are encoded in the registers so it only really supports real RAM 
>> modules which are predefined sizes. Also the firmware discovers RAM by 
>> looking at SPD data and may only check the slots that the real hardware has 
>> which may not be the first one. 
>> Previously I had code to round down the memory size specified on the 
>> command line to an acceptable size and issue a warning to let the user know 
>> but this was dropped because of some changes in code elsewhere which now 
>> allocates memory before the machine could check and ajust it so we can only 
>> adjust it by wasting some. 
>
> I don't think we should care adjusting the values. the machine init
> routine should check that the RAM size is valid or fail. The machine
> should also have a sane RAM size value by default.
>
> See how the aspeed machine deals with similar constraints of its SDRAM
> controller in aspeed_machine_init(). If the sdram controller does not
> validate the RAM size, aspeed_sdmc_set_ram_size() fails with an error.

Even then we need to check if the specified memory matches one of the 
allowed sized and distribute it to the allowed banks by the soc. This code 
is more complex than the 405ep has currently and should not be reprated in 
each board. That's why we have the ppc4xx_memory_banks and sdram_init 
functions so while it may be possible to simmplify it a bit maybe not 
much. I've spent quite some time with it so if you change it check that 
at least sam360ex -m 2G still works.

Regards,
BALATON Zoltan
--3866299591-907815730-1659967685=:47322--

