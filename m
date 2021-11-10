Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A15744BC8B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:06:19 +0100 (CET)
Received: from localhost ([::1]:57060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkicb-0000bt-R2
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:06:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkib8-00082V-PZ
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:04:46 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:58811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mkib3-0005qT-Gz
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:04:46 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AAB8821881;
 Wed, 10 Nov 2021 08:04:37 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 10 Nov
 2021 09:04:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003aad7dedb-ef21-4b52-8745-79d122275f15,
 FF02C7A8D8E58AFC286F2B1DBFB5F34314452EF1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ae379705-5697-4a03-df04-3d20799f7d83@kaod.org>
Date: Wed, 10 Nov 2021 09:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc: Fix register update on lf[sd]u[x]/stf[sd]u[x]
Content-Language: en-US
To: <matheus.ferst@eldorado.org.br>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
References: <20211109192911.485507-1-matheus.ferst@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211109192911.485507-1-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 45cf279b-fb82-4e2e-bdfb-0d8fad2fb8f4
X-Ovh-Tracer-Id: 9013110232128523113
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudeigddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: danielhb413@gmail.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/21 20:29, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
> 
> These instructions should update the GPR indicated by the field RA
> instead of RT. This error caused a regression on Mac OS 9 boot and some
> graphical glitches in OS X.

I could reproduce the issue and the fix on Mac OS 9. I wonder how we could
automate the MacOS tests since they are graphical.

> Fixes: a39a106634a9 ("target/ppc: Move load and store floating point instructions to decodetree")
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate/fp-impl.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Applied for 6.2

Thanks,

C.

> 
> diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
> index d1dbb1b96b..c9e05201d9 100644
> --- a/target/ppc/translate/fp-impl.c.inc
> +++ b/target/ppc/translate/fp-impl.c.inc
> @@ -1328,7 +1328,7 @@ static bool do_lsfpsd(DisasContext *ctx, int rt, int ra, TCGv displ,
>           set_fpr(rt, t0);
>       }
>       if (update) {
> -        tcg_gen_mov_tl(cpu_gpr[rt], ea);
> +        tcg_gen_mov_tl(cpu_gpr[ra], ea);
>       }
>       tcg_temp_free_i64(t0);
>       tcg_temp_free(ea);
> 


