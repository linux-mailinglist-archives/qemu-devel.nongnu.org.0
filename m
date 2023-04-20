Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677976E9D50
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 22:37:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppb1I-0005MN-CU; Thu, 20 Apr 2023 16:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppb1G-0005ME-I9
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:36:42 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ppb1E-0000Hc-QR
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 16:36:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.235])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BEB892116A;
 Thu, 20 Apr 2023 20:36:34 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 20 Apr
 2023 22:36:33 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005767b6fae-98bd-4c80-b211-75c08c24dcba,
 91FBEC0C449219CB8F2B4F52376FDFE733FDDD1D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <853710e0-d727-315f-f2bd-454577b60420@kaod.org>
Date: Thu, 20 Apr 2023 22:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Content-Language: en-US
To: <qemu-devel@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230420202939.1982044-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 569fa21e-0cc9-46d3-bee5-c703acc419e6
X-Ovh-Tracer-Id: 11696411183464156082
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddgudeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffdufeeliedujeeffffhjeffiefghffhhfdvkeeijeehledvueffhfejtdehgeegnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpthhhuhhthhesrhgvughhrghtrdgtohhmpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdgtlhhgsehrvgguhhgrthdrtghomhdpshhtvghfrghnhhgrsehrvgguhhgrthdrtghomhdpphgsohhniihinhhisehrvgguhhgrthdrtg
 homhdpsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpphhhihhlmhgusehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

+ Φλ

On 4/20/23 22:29, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   util/async.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..856e1a8a33 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
>   
>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wpragmas"
> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> +#endif
>       QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif
>   
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;


