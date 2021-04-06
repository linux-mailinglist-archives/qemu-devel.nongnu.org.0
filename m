Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7A355115
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:40:56 +0200 (CEST)
Received: from localhost ([::1]:59178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTj8h-00013U-C6
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:40:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTj76-0000bg-RR; Tue, 06 Apr 2021 06:39:16 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:36427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lTj6v-0004im-DD; Tue, 06 Apr 2021 06:39:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 14AC37462E0;
 Tue,  6 Apr 2021 12:38:59 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E71A674581E; Tue,  6 Apr 2021 12:38:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E55B17456E3;
 Tue,  6 Apr 2021 12:38:58 +0200 (CEST)
Date: Tue, 6 Apr 2021 12:38:58 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH-for-6.0] hw/ppc/mac_newworld: Restrict RAM to 2 GiB
In-Reply-To: <20210406084842.2859664-1-f4bug@amsat.org>
Message-ID: <bef58e2b-eeb3-426f-169d-f44d5423abe@eik.bme.hu>
References: <20210406084842.2859664-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1745056200-1617705538=:13819"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?ISO-8859-15?Q?H=E5vard_Eidnes?= <he@NetBSD.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1745056200-1617705538=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 6 Apr 2021, Philippe Mathieu-Daudé wrote:
> On Mac99 and newer machines, the Uninorth PCI host bridge maps
> the PCI hole region at 2GiB, so the RAM area beside 2GiB is not
> accessible by the CPU. Restrict the memory to 2GiB to avoid
> problems such the one reported in the buglink.
>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1922391
> Reported-by: Håvard Eidnes <he@NetBSD.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/ppc/mac_newworld.c | 4 ++++
> 1 file changed, 4 insertions(+)
>
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 21759628466..d88b38e9258 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -157,6 +157,10 @@ static void ppc_core99_init(MachineState *machine)
>     }
>
>     /* allocate RAM */
> +    if (machine->ram_size > 2 * GiB) {
> +        error_report("RAM size more than 2 GiB is not supported");
> +        exit(1);
> +    }
>     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
>
>     /* allocate and load firmware ROM */
>
--3866299591-1745056200-1617705538=:13819--

