Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757D332B5C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:02:08 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeoB-0004FT-Dm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJecf-00013s-Td
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:50:15 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:59272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJecb-0008Hb-FI
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:50:13 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6FA207456B8;
 Tue,  9 Mar 2021 16:50:07 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 5141F7456B4; Tue,  9 Mar 2021 16:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 4F83C7456B7;
 Tue,  9 Mar 2021 16:50:07 +0100 (CET)
Date: Tue, 9 Mar 2021 16:50:07 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 2/6] hw/mips/gt64xxx: Simplify ISD MemoryRegion
 read/write handlers
In-Reply-To: <20210309142630.728014-3-f4bug@amsat.org>
Message-ID: <3bb43a40-60a1-523-6571-261957ad1c57@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1409978894-1615305007=:73634"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1409978894-1615305007=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> The ISD MemoryRegion is implemented for 32-bit accesses.
> Simplify it by setting the MemoryRegionOps::impl min/max
> access size fields.
>
> Since the region is registered with a size of 0x1000 bytes,
> we can remove the hwaddr mask.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/mips/gt64xxx_pci.c | 10 ++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 6eb73e77057..99b1690af19 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -385,13 +385,12 @@ static void gt64120_writel(void *opaque, hwaddr addr,
> {
>     GT64120State *s = opaque;
>     PCIHostState *phb = PCI_HOST_BRIDGE(s);
> -    uint32_t saddr;
> +    uint32_t saddr = addr >> 2;
>
>     if (!(s->regs[GT_CPU] & 0x00001000)) {
>         val = bswap32(val);
>     }
>
> -    saddr = (addr & 0xfff) >> 2;
>     switch (saddr) {
>
>     /* CPU Configuration */
> @@ -695,9 +694,8 @@ static uint64_t gt64120_readl(void *opaque,
>     GT64120State *s = opaque;
>     PCIHostState *phb = PCI_HOST_BRIDGE(s);
>     uint32_t val;
> -    uint32_t saddr;
> +    uint32_t saddr = addr >> 2;
>
> -    saddr = (addr & 0xfff) >> 2;
>     switch (saddr) {
>
>     /* CPU Configuration */
> @@ -976,6 +974,10 @@ static const MemoryRegionOps isd_mem_ops = {
>     .read = gt64120_readl,
>     .write = gt64120_writel,
>     .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> };
>
> static int gt64120_pci_map_irq(PCIDevice *pci_dev, int irq_num)
>
--3866299591-1409978894-1615305007=:73634--

