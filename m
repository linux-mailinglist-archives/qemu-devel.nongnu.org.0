Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C974A99BC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:11:29 +0100 (CET)
Received: from localhost ([::1]:37588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFyN5-0002nB-NL
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:11:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nFxx7-00042a-Ub; Fri, 04 Feb 2022 07:44:38 -0500
Received: from [2001:738:2001:2001::2001] (port=25999 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nFxx5-0006rg-GY; Fri, 04 Feb 2022 07:44:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 29C09745708;
 Fri,  4 Feb 2022 13:43:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0D971745706; Fri,  4 Feb 2022 13:43:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 0B0D47456E3;
 Fri,  4 Feb 2022 13:43:43 +0100 (CET)
Date: Fri, 4 Feb 2022 13:43:43 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH 04/11] target/ppc: 6xx: Critical exception cleanup
In-Reply-To: <20220203200957.1434641-5-farosas@linux.ibm.com>
Message-ID: <9580615e-c7-9b40-6534-6f1d8abe9f3b@eik.bme.hu>
References: <20220203200957.1434641-1-farosas@linux.ibm.com>
 <20220203200957.1434641-5-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022, Fabiano Rosas wrote:
> This only applies to the G2s, the other 6xx CPUs will not have this
> vector registered.
>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> target/ppc/excp_helper.c | 15 ---------------
> 1 file changed, 15 deletions(-)
>
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index d855a275ca..e27e1c3c70 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -596,20 +596,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>
>     switch (excp) {
>     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
> -        switch (excp_model) {
> -        case POWERPC_EXCP_40x:
> -            srr0 = SPR_40x_SRR2;
> -            srr1 = SPR_40x_SRR3;
> -            break;
> -        case POWERPC_EXCP_BOOKE:
> -            srr0 = SPR_BOOKE_CSRR0;
> -            srr1 = SPR_BOOKE_CSRR1;
> -            break;
> -        case POWERPC_EXCP_6xx:
> -            break;
> -        default:
> -            goto excp_invalid;

It may not be a problem but this seems to change previous behaviour. To 
keep that you may need to test for G2 here, or rather move this whole case 
before the default case to avoid goto and be able to just fall through to 
invalid if CPU is not a G2 (unless we're Ok with an if the default case).

Regards,
BALATON Zoltan

> -        }
>         break;
>     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
>         if (msr_me == 0) {
> @@ -836,7 +822,6 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
>                   powerpc_excp_name(excp));
>         break;
>     default:
> -    excp_invalid:
>         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
>         break;
>     }
>

