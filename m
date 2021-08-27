Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FA03FA10E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 23:18:13 +0200 (CEST)
Received: from localhost ([::1]:50406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJjEl-0004hi-0U
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 17:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mJjCL-0003nH-3S; Fri, 27 Aug 2021 17:15:41 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:22653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mJjCH-00018g-BZ; Fri, 27 Aug 2021 17:15:36 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 36BD97463B7;
 Fri, 27 Aug 2021 23:15:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 158087457EE; Fri, 27 Aug 2021 23:15:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 147E8745708;
 Fri, 27 Aug 2021 23:15:26 +0200 (CEST)
Date: Fri, 27 Aug 2021 23:15:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Arbuckle <programmingkidx@gmail.com>
Subject: Re: [PATCH] Report any problems with loading the VGA driver for PPC
 Macintosh targets
In-Reply-To: <20210827181429.23609-1-programmingkidx@gmail.com>
Message-ID: <bbcac344-99e2-f74a-2b72-145bbd5b4716@eik.bme.hu>
References: <20210827181429.23609-1-programmingkidx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
Cc: qemu-devel@nongnu.org, hsp.cat7@gmail.com, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021, John Arbuckle wrote:
> I was having a problem with missing video resolutions in my Mac OS 9 VM. When I
> ran QEMU it gave no indication as to why these resolutions were missing. I found
> out that the OpenFirmware VGA driver was not being loaded. To prevent anyone from
> going thru the same trouble I went thru I added messages that the user can see
> when a problem takes place with loading this driver in the future.
>
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
> hw/ppc/mac_newworld.c | 6 ++++++
> hw/ppc/mac_oldworld.c | 6 ++++++
> 2 files changed, 12 insertions(+)
>
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 7bb7ac3997..c1960452b8 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -526,8 +526,14 @@ static void ppc_core99_init(MachineState *machine)
>
>         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> +        } else {
> +            printf("Warning: failed to load driver %s. This may cause video"
> +                   " problems.\n");

I think you should use warn_report for these instead of printf and watch 
out if that needs \n or not (some functions add \n while some others may 
not and I always forget which is which but checkpatch should warn for it 
so you should get nofified if you leave \n there but it's not needed).

Regards,
BALATON Zoltan

>         }
>         g_free(filename);
> +    } else {
> +        printf("Warning: driver %s not found. This may cause video problems.\n",
> +               NDRV_VGA_FILENAME);
>     }
>
>     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index de2be960e6..96603fe9cf 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -367,8 +367,14 @@ static void ppc_heathrow_init(MachineState *machine)
>
>         if (g_file_get_contents(filename, &ndrv_file, &ndrv_size, NULL)) {
>             fw_cfg_add_file(fw_cfg, "ndrv/qemu_vga.ndrv", ndrv_file, ndrv_size);
> +        } else {
> +            printf("Warning: failed to load driver %s. This may cause video"
> +                   " problems.\n");
>         }
>         g_free(filename);
> +    } else {
> +        printf("Warning: driver %s not found. This may cause video problems.\n",
> +               NDRV_VGA_FILENAME);
>     }
>
>     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
>

