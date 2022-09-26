Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE345EB4A8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 00:40:51 +0200 (CEST)
Received: from localhost ([::1]:46988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocwmP-0006bW-HF
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 18:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocwlG-000500-Kb; Mon, 26 Sep 2022 18:39:38 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ocwlD-0005hY-IM; Mon, 26 Sep 2022 18:39:38 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 389BE746335;
 Tue, 27 Sep 2022 00:39:28 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A222474632C; Tue, 27 Sep 2022 00:39:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9E9D2746307;
 Tue, 27 Sep 2022 00:39:27 +0200 (CEST)
Date: Tue, 27 Sep 2022 00:39:27 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v6 00/25] ppc4xx_sdram QOMify and clean ups
In-Reply-To: <cc7ed0de-327c-e2ea-e209-9cf951cfc8bd@kaod.org>
Message-ID: <a789ee55-b419-8db8-f27a-718b479244da@eik.bme.hu>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <cc7ed0de-327c-e2ea-e209-9cf951cfc8bd@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-345135325-1664231967=:76646"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-345135325-1664231967=:76646
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 26 Sep 2022, Cédric Le Goater wrote:
> On 9/24/22 14:27, BALATON Zoltan wrote:
>> This is the end of the QOMify series started by Cédric. This series
>> handles the SDRAM controller models to clean them up, QOMify and unify
>> them and at least partially clean up the mess that has accumulated
>> around these in the past. This includes the not yet merged patches
>> from the last series and new ones that change the DDR2 version used by
>> sam460ex.
>> 
>> v6: Split patch moving sdram controller models together into smaller steps
>> v5: Add functions the enable sdram controller and call it from boards
>> v4: address more review comments
>> v3: Fix patches that got squashed during rebase
>> v2: address some review comments and try to avoid compile problem with
>> gcc 12.2 (untested)
>> 
>> BALATON Zoltan (25):
>>    ppc440_bamboo: Remove unnecessary memsets
>>    ppc4xx: Introduce Ppc4xxSdramBank struct
>>    ppc4xx_sdram: Get rid of the init RAM hack
>>    ppc4xx: Use Ppc4xxSdramBank in ppc4xx_sdram_banks()
>>    ppc440_bamboo: Add missing 4 MiB valid memory size
>>    ppc4xx_sdram: Move size check to ppc4xx_sdram_init()
>>    ppc4xx_sdram: QOM'ify
>>    ppc4xx_sdram: Drop extra zeros for readability
>>    ppc440_sdram: Split off map/unmap of sdram banks for later reuse
>>    ppc440_sdram: Implement enable bit in the DDR2 SDRAM controller
>>    ppc440_sdram: Get rid of the init RAM hack
>>    ppc440_sdram: Rename local variable for readability
>>    ppc4xx_sdram: Rename functions to prevent name clashes
>>    ppc440_sdram: Move RAM size check to ppc440_sdram_init
>>    ppc440_sdram: QOM'ify
>>    ppc440_uc.c: Move some macros to ppc4xx.h
>>    ppc440_uc.c: Remove unneeded parenthesis
>>    ppc440_uc.c: Move DDR2 SDRAM controller model to ppc4xx_sdram.c
>>    ppc4xx_devs.c: Move DDR SDRAM controller model to ppc4xx_sdram.c
>>    ppc4xx_sdram: Move ppc4xx_sdram_banks() to ppc4xx_sdram.c
>>    ppc4xx_sdram: Use hwaddr for memory bank size
>>    ppc4xx_sdram: Rename local state variable for brevity
>>    ppc4xx_sdram: Generalise bank setup
>>    ppc4xx_sdram: Convert DDR SDRAM controller to new bank handling
>>    ppc4xx_sdram: Add errp parameter to ppc4xx_sdram_banks()
>>
>>   hw/ppc/meson.build      |   3 +-
>>   hw/ppc/ppc405.h         |   8 +-
>>   hw/ppc/ppc405_boards.c  |  13 +-
>>   hw/ppc/ppc405_uc.c      |  33 +-
>>   hw/ppc/ppc440.h         |   4 -
>>   hw/ppc/ppc440_bamboo.c  |  25 +-
>>   hw/ppc/ppc440_uc.c      | 267 +-------------
>>   hw/ppc/ppc4xx_devs.c    | 413 ----------------------
>>   hw/ppc/ppc4xx_sdram.c   | 753 ++++++++++++++++++++++++++++++++++++++++
>>   hw/ppc/sam460ex.c       |  44 +--
>>   hw/ppc/trace-events     |   1 +
>>   include/hw/ppc/ppc4xx.h |  65 +++-
>>   12 files changed, 859 insertions(+), 770 deletions(-)
>>   create mode 100644 hw/ppc/ppc4xx_sdram.c
>
> Zoltan,
>
> Could we add you as a MAINTAINER of these files ? You know them well now.
> At least the ppc44* ones.

I may know some things now but I forget quickly :-) I already maintain the 
files I've written but don't really want to get cc-d on others. I read the 
list though and if I see something I can help with I'll try to do so like 
with this series. That's all I can commit to now, not taking other orphan 
files, so no thanks but I'll try to review what I can informally.

Regards,
BALATON Zoltan
--3866299591-345135325-1664231967=:76646--

