Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4D356D04
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:13:49 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU80C-00051K-Fq
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7yg-000484-FY; Wed, 07 Apr 2021 09:12:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:35984
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7ye-0000vb-LK; Wed, 07 Apr 2021 09:12:14 -0400
Received: from host86-148-103-9.range86-148.btcentralplus.com ([86.148.103.9]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lU7ye-0003Zj-NI; Wed, 07 Apr 2021 14:12:16 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210406084842.2859664-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <97ed2955-e177-1ee5-cc68-052d7dd30b24@ilande.co.uk>
Date: Wed, 7 Apr 2021 14:11:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210406084842.2859664-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.103.9
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, =?UTF-8?Q?H=c3=a5vard_Eidnes?= <he@NetBSD.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/04/2021 09:48, Philippe Mathieu-Daudé wrote:

> On Mac99 and newer machines, the Uninorth PCI host bridge maps
> the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
> accessible by the CPU. Restrict the memory to 2GiB to avoid
> problems such the one reported in the buglink.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
> Reported-by: Håvard Eidnes <he@NetBSD.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ppc/mac_newworld.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 21759628466..d88b38e9258 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
>       }
>   
>       /* allocate RAM */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("RAM size more than 2 GiB is not supported");
> +        exit(1);
> +    }
>       memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>   
>       /* allocate and load firmware ROM */

I think the patch is correct, however I'm fairly sure that the default g3beige 
machine also has the PCI hole located at 0x80000000 so the same problem exists there too.

Also are you keen to get this merged for 6.0? It doesn't seem to solve a security 
issue/release blocker and I'm sure the current behaviour has been like this for a 
long time...


ATB,

Mark.

