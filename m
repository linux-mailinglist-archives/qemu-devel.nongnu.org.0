Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC513ADF02
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:22:17 +0200 (CEST)
Received: from localhost ([::1]:49734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyL3-0003pz-0B
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyKA-00038z-Jz
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:21:22 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyK9-0006f2-0d
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:21:22 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MGhi0-1m7fdm0Hf0-00DrPM; Sun, 20 Jun 2021 16:21:16 +0200
Subject: Re: [PATCH 1/2] linux-user: Let sigaction query SIGKILL/SIGSTOP
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
 <20210601145600.3131040-2-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0c34900e-886a-2d27-e0d7-f48e7b3edc9d@vivier.eu>
Date: Sun, 20 Jun 2021 16:21:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210601145600.3131040-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sPCh7dun4OJwBZXhPb0ulQ+DCaVLU+4+UYUDliZrt9hSY1wdGLw
 eisn9GX80VHIvwndHe0FYmr4CUXEzIn81ITD/jAyhbexO8Jh7MSJNO3foYTYJUiADuXgyJd
 7KKllUmOUYQd6CrCK+raQOQMxaNaT6UHTmq/p2zd07sBPx+134o9qSAQJnugX/2xCyvySB2
 sKpfK9mM9gcrShCyYTAsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q67TG6Tm1oI=:QrcOD9pk84qBUPil6HseQ1
 C5UPEU61MayvivMm0TRcZdifN8JCsOFIieQA5JieEVml8ExHBPuRaxZUXpx/71335MlkqA0Hj
 7UTPauW8GAwYruePUX+PC0XtiMAaCbg7xplrPQMZEKVNuj/07xAyVP/nGwm4clwg406AHA5mT
 kyrtSH8Dpsq4SHaC9kbRMZTGR/SC1OlRB1TpUB2+J3zfMKkOqcOugOwDr5ePOdvb7ZrZiCasw
 8H7+Bun6RjptHJokxME5kzqrfrfpEBo3bIRDObCDoTtRc2pfFg39rjh7WRlQCi3MTyJ8JxtXw
 DlFJY7JZvvIn2iQpds/jcyfqyh34RxuX9K4SvoQatKqjrf88ugXBGfjCf/WG16BgsMFvN+Wdt
 L+CeGEORLL3HSaxlTS1gsxhx0KxtHsJIpODoEnJEi2BC//JmPiMHdeTnPENM5kCl6G/Vgr+xA
 re6aAb95tz3CauRhTsyVtPJKoX4oFsMQvLMZwPiJSATMo3OgMzTRovS6Fy46qGo2x4ihn6CsC
 eUujXyqC/m8lX32sNRZA2s=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/06/2021 à 16:55, Ilya Leoshkevich a écrit :
> The kernel allows doing this, so let's allow this in qemu as well.
> Valgrind relies on this.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  linux-user/signal.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9016896dcd..bc3431708f 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -851,7 +851,11 @@ int do_sigaction(int sig, const struct target_sigaction *act,
>  
>      trace_signal_do_sigaction_guest(sig, TARGET_NSIG);
>  
> -    if (sig < 1 || sig > TARGET_NSIG || sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP) {
> +    if (sig < 1 || sig > TARGET_NSIG) {
> +        return -TARGET_EINVAL;
> +    }
> +
> +    if (act && (sig == TARGET_SIGKILL || sig == TARGET_SIGSTOP)) {
>          return -TARGET_EINVAL;
>      }
>  
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


