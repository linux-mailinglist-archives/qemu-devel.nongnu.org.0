Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF065C53C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 18:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClIg-0004I7-Pz; Tue, 03 Jan 2023 12:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pClId-0004HE-PF
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:42:07 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pClIb-0007gM-EO
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 12:42:07 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id ED21F748139;
 Tue,  3 Jan 2023 18:39:44 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B0493748132; Tue,  3 Jan 2023 18:39:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AE45274633D;
 Tue,  3 Jan 2023 18:39:44 +0100 (CET)
Date: Tue, 3 Jan 2023 18:39:44 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/pci: Display correct size for unmapped BARs in HMP
 'info pci'
In-Reply-To: <20230103164825.95329-1-philmd@linaro.org>
Message-ID: <6bb76a1c-475e-1fe4-a7b6-8317a4388afd@eik.bme.hu>
References: <20230103164825.95329-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-379608505-1672767584=:38261"
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-379608505-1672767584=:38261
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 3 Jan 2023, Philippe Mathieu-Daudé wrote:
> When a BAR is not mapped, the displayed size is shifted by 1 byte:
>
>  (qemu) info pci
>    ...
>    Bus  0, device  11, function 0:
>      Ethernet controller: PCI device 1022:2000
>        PCI subsystem 0000:0000
>        IRQ 10, pin A
>        BAR0: I/O at 0xffffffffffffffff [0x001e].
>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001e].   <===
>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003fffe].   <===
>        id ""
>    Bus  0, device  18, function 0:
>      VGA controller: PCI device 1013:00b8
>        PCI subsystem 1af4:1100
>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000fffe].   <===
>        id ""
>
> Only substract this byte when the BAR is mapped to display
> the correct size:
>
>  (qemu) info pci
>    ...
>    Bus  0, device  11, function 0:
>      Ethernet controller: PCI device 1022:2000
>        PCI subsystem 0000:0000
>        IRQ 10, pin A
>        BAR0: I/O at 0xffffffffffffffff [0x001f].
>        BAR1: 32 bit memory at 0xffffffffffffffff [0x0000001f].   <===
>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0003ffff].   <===
>        id ""
>    Bus  0, device  18, function 0:
>      VGA controller: PCI device 1013:00b8
>        PCI subsystem 1af4:1100
>        BAR0: 32 bit prefetchable memory at 0x10000000 [0x11ffffff].
>        BAR1: 32 bit memory at 0x12050000 [0x12050fff].
>        BAR6: 32 bit memory at 0xffffffffffffffff [0x0000ffff].   <===
>        id ""
>
> Fixes: 0ac32c8375 ("PCI interrupt support - 'info pci' monitor command")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> hw/pci/pci-hmp-cmds.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pci-hmp-cmds.c b/hw/pci/pci-hmp-cmds.c
> index fb7591d6ab..8cfa5f9cd1 100644
> --- a/hw/pci/pci-hmp-cmds.c
> +++ b/hw/pci/pci-hmp-cmds.c
> @@ -75,22 +75,24 @@ static void hmp_info_pci_device(Monitor *mon, const PciDeviceInfo *dev)
>
>     for (region = dev->regions; region; region = region->next) {
>         uint64_t addr, size;
> +        bool mapped;
>
>         addr = region->value->address;
>         size = region->value->size;

As size is not used for anything else, you could adjust the value here 
once either as

size = region->value->size - (addr != -1 ? 1 : 0);

or in an if then you don't need the bool and tweak the value when 
printing. This looks simpler to me.

Regards,
BALATON Zoltan

> +        mapped = addr != -1;
>
>         monitor_printf(mon, "      BAR%" PRId64 ": ", region->value->bar);
>
>         if (!strcmp(region->value->type, "io")) {
>             monitor_printf(mon, "I/O at 0x%04" PRIx64
>                                 " [0x%04" PRIx64 "].\n",
> -                           addr, addr + size - 1);
> +                           addr, addr + size + (mapped ? -1 : 0));
>         } else {
>             monitor_printf(mon, "%d bit%s memory at 0x%08" PRIx64
>                                " [0x%08" PRIx64 "].\n",
>                            region->value->mem_type_64 ? 64 : 32,
>                            region->value->prefetch ? " prefetchable" : "",
> -                           addr, addr + size - 1);
> +                           addr, addr + size + (mapped ? -1 : 0));
>         }
>     }
>
>
--3866299591-379608505-1672767584=:38261--

