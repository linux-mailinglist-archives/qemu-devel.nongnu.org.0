Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3691A174FEE
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 22:35:32 +0100 (CET)
Received: from localhost ([::1]:52024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8WFH-0006hb-AF
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 16:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55988)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1j8WEU-0006ED-P4
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:34:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1j8WET-0002Jk-Fb
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:34:42 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:62889)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1j8WET-0002JM-9g
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 16:34:41 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 64081746381;
 Sun,  1 Mar 2020 22:34:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 465ED74637E; Sun,  1 Mar 2020 22:34:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 44AF574569F;
 Sun,  1 Mar 2020 22:34:38 +0100 (CET)
Date: Sun, 1 Mar 2020 22:34:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 1/2] dp264: use pci_create() to initialise the cmd646
 device
In-Reply-To: <20200301190520.18520-2-mark.cave-ayland@ilande.co.uk>
Message-ID: <alpine.BSF.2.22.395.2003012232020.79908@zero.eik.bme.hu>
References: <20200301190520.18520-1-mark.cave-ayland@ilande.co.uk>
 <20200301190520.18520-2-mark.cave-ayland@ilande.co.uk>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:738:2001:2001::2001
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 1 Mar 2020, Mark Cave-Ayland wrote:
> Remove the call to pci_cmd646_ide_init() since global device init functions
> are deprecated in preference of using qdev directly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> hw/alpha/dp264.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index 8d71a30617..50e75aeee3 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -16,6 +16,7 @@
> #include "sysemu/sysemu.h"
> #include "hw/rtc/mc146818rtc.h"
> #include "hw/ide.h"
> +#include "hw/ide/pci.h"
> #include "hw/timer/i8254.h"
> #include "hw/isa/superio.h"
> #include "hw/dma/i8257.h"
> @@ -100,9 +101,13 @@ static void clipper_init(MachineState *machine)
>     /* IDE disk setup.  */
>     {
>         DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
> +        PCIDevice *pci_dev;
> +
>         ide_drive_get(hd, ARRAY_SIZE(hd));
>
> -        pci_cmd646_ide_init(pci_bus, hd, 0);
> +        pci_dev = pci_create(pci_bus, -1, "cmd646-ide");
> +        qdev_init_nofail(DEVICE(pci_dev));

You could just use pci_create_simple here now that you don't set 
properties.

Regards,
BALATON Zoltan

> +        pci_ide_create_devs(pci_dev, hd);
>     }
>
>     /* Load PALcode.  Given that this is not "real" cpu palcode,
>

