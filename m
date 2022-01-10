Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A8489F86
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 19:48:17 +0100 (CET)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ziJ-0001nH-VA
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 13:48:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n6zdQ-0000kC-GX; Mon, 10 Jan 2022 13:43:13 -0500
Received: from [2001:738:2001:2001::2001] (port=26822 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n6zdN-0007P2-Eo; Mon, 10 Jan 2022 13:43:11 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CE3BE7457E7;
 Mon, 10 Jan 2022 19:42:57 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id B18E074570D; Mon, 10 Jan 2022 19:42:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id AF9707456B4;
 Mon, 10 Jan 2022 19:42:57 +0100 (CET)
Date: Mon, 10 Jan 2022 19:42:57 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Add extra float instructions to POWER5P
 processors
In-Reply-To: <20220110161959.758997-1-clg@kaod.org>
Message-ID: <b72f9546-ab8-9e3-551a-614a61487ddf@eik.bme.hu>
References: <20220110161959.758997-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1974711611-1641840177=:81889"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1974711611-1641840177=:81889
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 10 Jan 2022, Cédric Le Goater wrote:
> ISA v2.03 introduced Floating Round to Integer instructions : frin,
> friz, frip, and frim. Add them to POWER5+.
>
> The PPC_FLOAT_EXT flag also includes the fre (Floating Reciprocal
> Estimate) instruction which was introduced in ISA v2.0x. The
> architecture document says its optional and that might the reason why

There's a grammar error in this sentence. I think it should be "might be 
the reason" or "might have been the reason", not sure which is more 
correct but "be" is missing here for sure. Another one: it should be 
"it's" instead of "its" in this context.

Regards,
BALATON Zoltan

> it has been kept under the PPC_FLOAT_EXT. This means 970 CPUs can not
> use it under QEMU.
>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> target/ppc/cpu_init.c | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index f15a52259c90..e30e86fe9d04 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -6953,6 +6953,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data)
>                        PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                        PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
>                        PPC_FLOAT_STFIWX |
> +                       PPC_FLOAT_EXT |
>                        PPC_CACHE | PPC_CACHE_ICBI | PPC_CACHE_DCBZ |
>                        PPC_MEM_SYNC | PPC_MEM_EIEIO |
>                        PPC_MEM_TLBIE | PPC_MEM_TLBSYNC |
>
--3866299591-1974711611-1641840177=:81889--

