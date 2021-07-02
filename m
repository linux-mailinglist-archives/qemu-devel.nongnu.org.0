Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7494B3BA2C5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:30:39 +0200 (CEST)
Received: from localhost ([::1]:43288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzL7m-0007M9-HP
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lzL6Y-0006Zl-Bt
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:29:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:11950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lzL6T-00045p-Ny
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:29:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 8369574570B;
 Fri,  2 Jul 2021 17:29:11 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0E73C745709; Fri,  2 Jul 2021 17:29:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0CD087456B4;
 Fri,  2 Jul 2021 17:29:11 +0200 (CEST)
Date: Fri, 2 Jul 2021 17:29:11 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PULL 06/18] hw/pci-host/bonito: Allow PCI config accesses
 smaller than 32-bit
In-Reply-To: <20210702133557.60317-7-f4bug@amsat.org>
Message-ID: <e23a266-ff58-41c1-a2b6-2b19388d22c6@eik.bme.hu>
References: <20210702133557.60317-1-f4bug@amsat.org>
 <20210702133557.60317-7-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1506315025-1625239751=:62543"
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1506315025-1625239751=:62543
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 2 Jul 2021, Philippe Mathieu-Daudé wrote:
> When running the official PMON firmware for the Fuloong 2E, we see
> 8-bit and 16-bit accesses to PCI config space:
>
>  $ qemu-system-mips64el -M fuloong2e -bios pmon_2e.bin \
>    -trace -trace bonito\* -trace pci_cfg\*
>
>  pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x4d2, size: 2
>  pci_cfg_write vt82c686b-pm 05:4 @0xd2 <- 0x1
>  pci_cfg_write vt82c686b-pm 05:4 @0x4 <- 0x1
>  pci_cfg_write vt82c686b-isa 05:0 @0x4 <- 0x7
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x81, size: 1
>  pci_cfg_read vt82c686b-isa 05:0 @0x81 -> 0x0
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x81, size: 1
>  pci_cfg_write vt82c686b-isa 05:0 @0x81 <- 0x80
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x83, size: 1
>  pci_cfg_write vt82c686b-isa 05:0 @0x83 <- 0x89
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x85, size: 1
>  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x3
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x5a, size: 1
>  pci_cfg_write vt82c686b-isa 05:0 @0x5a <- 0x7
>  bonito_spciconf_small_access PCI config address is smaller then 32-bit, addr: 0x85, size: 1
>  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x1
>
> Also this is what the Linux kernel does since it supports the Bonito
> north bridge:
> https://elixir.bootlin.com/linux/v2.6.15/source/arch/mips/pci/ops-bonito64.c#L85
>
> So it seems safe to assume the datasheet is incomplete or outdated
> regarding the address constraints.
>
> This problem was exposed by commit 911629e6d3773a8adeab48b
> ("vt82c686: Fix SMBus IO base and configuration registers").
>
> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210624202747.1433023-4-f4bug@amsat.org>

Tested-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/pci-host/bonito.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 751fdcec689..a57e81e3a97 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -187,7 +187,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
> #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
> #define BONITO_PCICONF_FUN_OFFSET      8
> #define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
> -#define BONITO_PCICONF_REG_MASK        0xFC
> +#define BONITO_PCICONF_REG_MASK_HW     0xff         /* As seen running PMON */
> #define BONITO_PCICONF_REG_OFFSET      0
>
>
> @@ -466,7 +466,7 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
>              BONITO_PCICONF_IDSEL_OFFSET;
>     devno = ctz32(idsel);
>     funno = (cfgaddr & BONITO_PCICONF_FUN_MASK) >> BONITO_PCICONF_FUN_OFFSET;
> -    regno = (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_OFFSET;
> +    regno = (cfgaddr & BONITO_PCICONF_REG_MASK_HW) >> BONITO_PCICONF_REG_OFFSET;
>
>     if (idsel == 0) {
>         error_report("error in bonito pci config address 0x" TARGET_FMT_plx
>
--3866299591-1506315025-1625239751=:62543--

