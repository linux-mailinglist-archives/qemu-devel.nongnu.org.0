Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D03ADF01
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:21:09 +0200 (CEST)
Received: from localhost ([::1]:47560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyJw-0002Ix-IB
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyIu-0000vH-7h
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:20:04 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyIs-0005k6-GD
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:20:03 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MBUuP-1lzfP707Gp-00D0II; Sun, 20 Jun 2021 16:19:58 +0200
Subject: Re: [PATCH 1/2] linux-user: Let sigaction query SIGKILL/SIGSTOP
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
 <20210601145600.3131040-2-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a165ac58-bbdb-28cf-8c85-7ac2d996fded@vivier.eu>
Date: Sun, 20 Jun 2021 16:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210601145600.3131040-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uiONvq9AxA4RJs1M7WMDktM1ZFx8y4wVJJ6rrJDUzt4mnzeymmM
 iGJhwc4bFAHy4uwUwl1m8mHFtLBU0raoH/cNVNPA93JyEnmpNVfYWCaM1Y1mwhJnM9NIst+
 4Uj4nuRxcrRXGnr7JAGjNo6Fn9trLz5TmY+5fTgSiSS4ZIE68hRM3sYTIoYVW4TUBwjX1nX
 hyZfSh4x6RIgef/KQlL3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GYbxnkJLA4Q=:9WAyVyjJv+1bZwqS1Giw3y
 6fjkGkmMIkgnnU9isLhAabOh7j4dhPJX+uGT7D5tpdWd1R77ZDq72iMJhCx4OTsysCR9VP876
 vjQ3sYIsI1rWXbh6s8cyMWIypZFZiS4uSIrCuubZbING1NK2EnvXa7XFOtHXZdLXfMoAHbAD7
 701BGEsLIWxFoWh9IXArA8qK65PAU/c94YgJvLfBtcHG64DeE9ibvFtNE786jB+dm2CpbeW9U
 VU4BzFXPSy+s6PQJJrlhb0FzEBwrwfwtTWIGiAiRXJfJkJnkU6uekGMlGzN4zYwj+wt75HE7f
 XSEa1n7qIM35ScaiKJv+H9JMCnL0cpSVAQb+NaC7FkocKrU3kZ1zg1ZRxKtjQ16aNw3ajl8rc
 w9iDNftSP9l4MYb0Wd+Cy8py3MPhRL1W9s5qHQZMG1D7esccHsvuYEKzempuWPR92WXfMl+DZ
 uRVZepkC1XHHO7A5vv3vqlDntpoLMIhPVvmJ8k2SN/hyUUMcWEt3y+Q16wVZ/s3xl1P/ZmQQm
 5dmddMx/iMr7eEmdIFw9QQ=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

