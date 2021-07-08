Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4114A3C16D4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:04:24 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WVj-00056S-A3
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vyp-0000Gu-7V
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:30:24 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:48941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m1Vyl-0003Nj-6Y
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:30:22 -0400
Received: from [192.168.100.1] ([82.142.13.34]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MtwEO-1lC1M50LQi-00uF8M; Thu, 08 Jul 2021 17:30:09 +0200
Subject: Re: [PATCH v2 8/8] linux-user: Simplify host <-> target errno
 conversion using macros
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-9-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d3d8214a-69f2-af60-324c-db4196ff7dae@vivier.eu>
Date: Thu, 8 Jul 2021 17:30:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PYP3Ug4j/n763WrTrBJLCX+bDVb97X6CQOk4YnLEZCaMK0Bktdo
 cM4QcMEeMgWHDcxMkQ3r+FteSXlzU9Uz0t1wmB+WMyF8Ud/5heIV7pAI+Var0wzY36nWUBO
 P/8HJ6Gjk8JOD05VIH/JL1Y3Gyrj6FEYXHg5sTeg3rykDWeUbbZD1huHoqB8YZJ+nRaRM/+
 pIqBAL5WPMB5trOhgAD6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AN2O2KXlXJI=:szt4yRGd/B3xkIjYw68p5p
 4LkNKKjIWQi+ZTftTLK1vf8R6/HcPQPtOaXpBXuknPB71ZirS2NgtD4y3qeviO6fr+idgRwuy
 8r/IBNF7dgTbkQmAFrYX7jBQNBgU2iVLuWlPVWkBPZi2CjkbFmrZls/lPFehVRAYyjQq4o6r1
 VdIGALAesbMkvqwoJghCChmticSgfXug2l83i0TdabzB6MNIsdODizYGoIWJzvl8VKVFlAixL
 4VlIfqKITHG5VFiEjigUcwxeAS9uM+XmERmk7XiVl2r7ktTb17FdoyD79X0djrKaIdWgrqU/m
 brypEegRrkmG1JzfPUcNWeK5tIbzPFQ3cp9dSOzOqaMfW0QEY9srQTQ8xi/Rwl4pNXCpPXxB7
 0TmwsTKXOKIQ3GmJdwqgW/m15y1KPRr1u/w3AeoJAqRz38kYIze1dTZQDmrxIqwZVVIesxsSI
 l2Kr801S8Y4srJTIhiHrP7S9etpJkq36e6W1BN1+dPGf8zRHU0ZcFxj6uQWeTCa4yYq5jTvc+
 jOWAkL1XIWNdo9qafAR+1TgVj1YbuWfbTEu2j8BTTP52zclsYdHjnKClsoqaj/QwYtKSNSYH4
 NL/BQmaYqcrdZsMG+dV1XNf5LzPOhMeAEulAvHImbXyWSWasXawolJaeFzZVfyrVdLdsu2PGx
 /Aoti6vZs01GI2AuncBwuwp67XfAhik9m6oGNn/Ur73GbwA0gmUkhBxKw93w0WXVtyhkTTl9d
 daNsu+Xw4EpfJ6HCVF00dKl1jpsJAgotwyjSQqj377CMT8K/aqgtv6k+p8phF+n2PGiDJL+e5
 IO0I2r8zMr6IA71NzUEdTxfVcaAwD3eklyEhxPOkclXdIz3pLX41o9mntcvvkyfIJ++n7RI
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/07/2021 à 16:11, Philippe Mathieu-Daudé a écrit :
> Convert the host_to_target_errno_table[] array to a switch case
> to allow compiler optimizations. Extract the errnos list as to
> a new includible unit, using a generic macro. Remove the code
> related to target_to_host_errno_table[] initialization.
> 

Is there some performance penalties by using a switch() rather than an array[] ?

> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall.c    | 169 +++++-----------------------------------
>  linux-user/errnos.c.inc | 140 +++++++++++++++++++++++++++++++++
>  2 files changed, 161 insertions(+), 148 deletions(-)
>  create mode 100644 linux-user/errnos.c.inc
> 
...
> diff --git a/linux-user/errnos.c.inc b/linux-user/errnos.c.inc
> new file mode 100644
> index 00000000000..807c97ca25e
> --- /dev/null
> +++ b/linux-user/errnos.c.inc
> @@ -0,0 +1,140 @@
...
> +#ifdef ERKFILL

You fix it in patch 1 but forgot to report it in your patch :)

Thanks,
Laurent

