Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B42421971
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:48:20 +0200 (CEST)
Received: from localhost ([::1]:38120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVoo-0006MY-Si
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:48:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXVmc-0004YQ-KX; Mon, 04 Oct 2021 17:46:02 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:63035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXVmZ-0004rm-Va; Mon, 04 Oct 2021 17:46:01 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1A4DD7463B7;
 Mon,  4 Oct 2021 23:45:53 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id EDEDB746398; Mon,  4 Oct 2021 23:45:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EBC257462D3;
 Mon,  4 Oct 2021 23:45:52 +0200 (CEST)
Date: Mon, 4 Oct 2021 23:45:52 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] target/ppc: Fix test the decrementer exception
In-Reply-To: <20211004212027.432553-1-clg@kaod.org>
Message-ID: <f99b328a-9f96-aac2-52ee-24aa8d344e96@eik.bme.hu>
References: <20211004212027.432553-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-435723662-1633383952=:16636"
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
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-435723662-1633383952=:16636
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 4 Oct 2021, Cédric Le Goater wrote:
> Commit 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer") introduced
> new int64t variables and broke the test triggering the decrementer
> exception. Revert partially the change to evaluate both clause of the
> if statement.
>
> Fixes: Coverity CID 1464061

Shouldn't this be:

Reported-by: Coverity CID 1464061
Fixes: 4d9b8ef9b5ab ("target/ppc: Fix 64-bit decrementer")

or something similar?

Regards,
BALATON Zoltan

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
> hw/ppc/ppc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index f5d012f860af..a724b0bb5ecb 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -848,7 +848,7 @@ static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
>      * On MSB edge based DEC implementations the MSB going from 0 -> 1 triggers
>      * an edge interrupt, so raise it here too.
>      */
> -    if ((signed_value < 3) ||
> +    if ((value < 3) ||
>         ((tb_env->flags & PPC_DECR_UNDERFLOW_LEVEL) && signed_value < 0) ||
>         ((tb_env->flags & PPC_DECR_UNDERFLOW_TRIGGERED) && signed_value < 0
>           && signed_decr >= 0)) {
>
--3866299591-435723662-1633383952=:16636--

