Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D33FAAD5
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 12:18:31 +0200 (CEST)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKHtW-0002U7-QT
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 06:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHry-0001QK-Sh; Sun, 29 Aug 2021 06:16:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52186
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHrx-0001Sa-6i; Sun, 29 Aug 2021 06:16:54 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=[192.168.50.176])
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKHra-0007hZ-CI; Sun, 29 Aug 2021 11:16:30 +0100
To: John Arbuckle <programmingkidx@gmail.com>, groug@kaod.org,
 david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 hsp.cat7@gmail.com
References: <20210827181429.23609-1-programmingkidx@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2d87adfb-c612-8d36-4c97-50f07a82beeb@ilande.co.uk>
Date: Sun, 29 Aug 2021 11:16:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827181429.23609-1-programmingkidx@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.437,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/08/2021 19:14, John Arbuckle wrote:

> I was having a problem with missing video resolutions in my Mac OS 9 VM. When I
> ran QEMU it gave no indication as to why these resolutions were missing. I found
> out that the OpenFirmware VGA driver was not being loaded. To prevent anyone from
> going thru the same trouble I went thru I added messages that the user can see
> when a problem takes place with loading this driver in the future.
> 
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
>   hw/ppc/mac_newworld.c | 6 ++++++
>   hw/ppc/mac_oldworld.c | 6 ++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7bb7ac3997..c1960452b8 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -526,8 +526,14 @@ static void ppc_core99_init(MachineState *machine)
>   
>           if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>               fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> +        } else {
> +            printf("Warning: failed to load driver %s. This may cause video"
> +                   " problems.\n");
>           }
>           g_free(filename);
> +    } else {
> +        printf("Warning: driver %s not found. This may cause video problems.\n",
> +               NDRV_VGA_FILENAME);
>       }
>   
>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index de2be960e6..96603fe9cf 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -367,8 +367,14 @@ static void ppc_heathrow_init(MachineState *machine)
>   
>           if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>               fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> +        } else {
> +            printf("Warning: failed to load driver %s. This may cause video"
> +                   " problems.\n");
>           }
>           g_free(filename);
> +    } else {
> +        printf("Warning: driver %s not found. This may cause video problems.\n",
> +               NDRV_VGA_FILENAME);
>       }
>   
>       qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);

This is by design: it's not the OpenFirmware VGA driver that's not being loaded here 
(that is already embedded in OpenBIOS), it's a optional MacOS client driver which 
just so happens to read the EDID to generate its list of available resolutions.

What I don't understand is that the binary is installed by default in QEMU's sharedir 
so everything works out of the box with "make install". Do you have some kind of 
custom installer which is doing something different?


ATB,

Mark.

