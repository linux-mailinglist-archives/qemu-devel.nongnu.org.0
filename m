Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0A332B48
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:58:15 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJekQ-0000sR-Pv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:58:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeZs-00069t-T9
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:47:22 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:27949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lJeZo-0007C7-4X
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:47:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DA4407456B8;
 Tue,  9 Mar 2021 16:47:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B9CBE7456B4; Tue,  9 Mar 2021 16:47:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id B831B7456E3;
 Tue,  9 Mar 2021 16:47:13 +0100 (CET)
Date: Tue, 9 Mar 2021 16:47:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH RESEND 5/6] hw/mips/gt64xxx: Trace accesses to ISD
 registers
In-Reply-To: <20210309142630.728014-6-f4bug@amsat.org>
Message-ID: <c41f22b4-e687-3ff-fd23-5c645ae5911f@eik.bme.hu>
References: <20210309142630.728014-1-f4bug@amsat.org>
 <20210309142630.728014-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-976903974-1615304833=:73634"
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-976903974-1615304833=:73634
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 9 Mar 2021, Philippe Mathieu-Daudé wrote:
> Trace all accesses to Internal Space Decode (ISD) registers.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/mips/gt64xxx_pci.c | 2 ++
> hw/mips/trace-events  | 2 ++
> 2 files changed, 4 insertions(+)
>
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 9a12d00d1e1..43349d6837d 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -387,6 +387,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
>     PCIHostState *phb = PCI_HOST_BRIDGE(s);
>     uint32_t saddr = addr >> 2;
>
> +    trace_gt64120_write(addr, val);
>     if (!(s->regs[GT_CPU] & 0x00001000)) {
>         val = bswap32(val);
>     }
> @@ -966,6 +967,7 @@ static uint64_t gt64120_readl(void *opaque,
>     if (!(s->regs[GT_CPU] & 0x00001000)) {
>         val = bswap32(val);
>     }
> +    trace_gt64120_read(addr, val);

There are a few other places where logs use saddr << 2 instead of addr so 
for consistency you might consider either changing those too or use saddr 
<< 2 here as well. (Reviewed-by still stands either way.)

Regards,
BALATON Zoltan

>
>     return val;
> }
> diff --git a/hw/mips/trace-events b/hw/mips/trace-events
> index b7e934c3933..13ee731a488 100644
> --- a/hw/mips/trace-events
> +++ b/hw/mips/trace-events
> @@ -1,4 +1,6 @@
> # gt64xxx_pci.c
> +gt64120_read(uint64_t addr, uint64_t value) "gt64120 read 0x%03"PRIx64" value:0x%08" PRIx64
> +gt64120_write(uint64_t addr, uint64_t value) "gt64120 write 0x%03"PRIx64" value:0x%08" PRIx64
> gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
> gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
> gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
>
--3866299591-976903974-1615304833=:73634--

