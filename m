Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903A58C85D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:29:34 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1sz-00042S-BM
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1g9-00052c-Hw; Mon, 08 Aug 2022 08:16:23 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:64364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oL1g6-0003AQ-Ch; Mon, 08 Aug 2022 08:16:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 377B2746FDE;
 Mon,  8 Aug 2022 14:16:10 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F1B13746E07; Mon,  8 Aug 2022 14:16:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id F003074638A;
 Mon,  8 Aug 2022 14:16:09 +0200 (CEST)
Date: Mon, 8 Aug 2022 14:16:09 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 00/22] ppc: QOM'ify 405 board
In-Reply-To: <20220808102734.133084-1-clg@kaod.org>
Message-ID: <65dff991-cf15-75e9-8cb-d55e72ae5560@eik.bme.hu>
References: <20220808102734.133084-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-20469756-1659960969=:47322"
X-Spam-Probability: 9%
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-20469756-1659960969=:47322
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 8 Aug 2022, Cédric Le Goater wrote:
> Hello,
>
> Here is large series QOM'ifying the PPC405 board. It introduces a new
> generic machine and SoC models, converts the current device models to
> QOM and populates the SoC. The process is quite mechanical without too
> much issues to handle. The noisy part is the initial patch introducing
> the SoC realize routine.
>
> What's left ?
>
> * the SDRAM mappings are very baroque and certainly could be simplified.
>  I think we should QOMify the ppc440 machines before addressing this
>  part.

The issue with SDRAM controller and the likely reason why its model looks 
so complex is that it can't handle any RAM size because of how the bank 
sizes are encoded in the registers so it only really supports real RAM 
modules which are predefined sizes. Also the firmware discovers RAM by 
looking at SPD data and may only check the slots that the real hardware 
has which may not be the first one. Previously I had code to round down 
the memory size specified on the command line to an acceptable size and 
issue a warning to let the user know but this was dropped because of some 
changes in code elsewhere which now allocates memory before the machine 
could check and ajust it so we can only adjust it by wasting some. Take 
this into account and check the ppc4xx_sdram_banks() function and 440 
machines before changing this.

Regards,
BALATON Zoltan


> Thanks,
>
> C.
>
> Changes in v3 :
>
> - New device model Ppc4xxDcrDeviceState
> - Removal of ppc4xx_mal_init(), ppc4xx_plb_init() and ppc405_ebc_init()
> - Fixes for some reset issues
> - Kept 2 RAM banks at the Soc level but only one is initialized.
> - Moved SRAM under the machine. It's not part of the SoC according
>   to the 405 specs
>
> Changes in v2 :
>
> - docs/about/removed-features.rst update
> - Fix compile breakage (uic)
> - Fix CPU reset, which breaking u-boot boot
> - Changed prefix of memory regions to "ppc405"
> - Reduced the number of RAM banks to 1. Second was a dummy one to
>   please ppc405ep_init()
>
> Cédric Le Goater (22):
>  ppc/ppc405: Remove taihu machine
>  ppc/ppc405: Introduce a PPC405 generic machine
>  ppc/ppc405: Move devices under the ref405ep machine
>  ppc/ppc405: Move SRAM under the ref405ep machine
>  ppc/ppc405: Introduce a PPC405 SoC
>  ppc/ppc405: Start QOMification of the SoC
>  ppc/ppc405: QOM'ify CPU
>  ppc/ppc4xx: Introduce a DCR device model
>  ppc/ppc405: QOM'ify CPC
>  ppc/ppc405: QOM'ify GPT
>  ppc/ppc405: QOM'ify OCM
>  ppc/ppc405: QOM'ify GPIO
>  ppc/ppc405: QOM'ify DMA
>  ppc/ppc405: QOM'ify EBC
>  ppc/ppc405: QOM'ify OPBA
>  ppc/ppc405: QOM'ify POB
>  ppc/ppc405: QOM'ify PLB
>  ppc/ppc405: QOM'ify MAL
>  ppc/ppc405: QOM'ify FPGA
>  ppc/ppc405: Use an explicit PPCUIC object
>  ppc/ppc405: Use an explicit I2C object
>  ppc/ppc4xx: Fix sdram trace events
>
> docs/about/deprecated.rst       |   9 -
> docs/about/removed-features.rst |   6 +
> docs/system/ppc/embedded.rst    |   1 -
> hw/ppc/ppc405.h                 | 198 +++++++-
> include/hw/ppc/ppc4xx.h         |  48 +-
> hw/ppc/ppc405_boards.c          | 375 ++++-----------
> hw/ppc/ppc405_uc.c              | 828 +++++++++++++++++---------------
> hw/ppc/ppc4xx_devs.c            | 184 ++++---
> hw/ppc/sam460ex.c               |  24 +-
> MAINTAINERS                     |   2 +-
> 10 files changed, 903 insertions(+), 772 deletions(-)
>
>
--3866299591-20469756-1659960969=:47322--

