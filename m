Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6204A3ADF08
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:28:11 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyQk-0007nb-F1
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:28:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyQ2-00071h-Kl
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:27:26 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:44489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyQ0-0002An-Vr
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:27:26 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mjjvp-1lRjc33gPD-00lHRS; Sun, 20 Jun 2021 16:27:21 +0200
Subject: Re: [PATCH 2/2] tests/tcg/linux-test: Check that sigaction can query
 SIGKILL/SIGSTOP
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
 <20210601145600.3131040-3-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8408f323-d7da-f813-84f0-680e55e1d2dd@vivier.eu>
Date: Sun, 20 Jun 2021 16:27:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210601145600.3131040-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1Wu26qPVRJp3KYsUM13HrjiJMuEBjERePkuWznDLICkb2HoFVOq
 fv4lw7DtIL4wEIcmpscZVbot4YjT5nnG/WuAu9ylEeY0znCOFIaE9Q5GqvFT+JO9Olxa2hr
 1BIPPGDJjM4gazI4GIgKrDtgArfvdx43q0q1tUxhJS4FFtiiAd6+go8MGBEefcas+d1p2pA
 PlmBG3Iarsq0N7HIkjoqA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c7GvT2KgVYg=:FpuabPJbFVGxFETWEfhXrK
 +bF0lib3eQ55kk9JSD83Kz/WH1G3v610k47Drl97NvWNojhDEDob6iKEydskuAD4pCWN/unb9
 qCsecqlGJi4wXF1mOlECPdG5KOblPvDG8HIm94nmy4+cB7WhydhOXcUIrmsg95JqyKQlWyu4f
 72igXSwILdMZ4QHj+rNn6SkybfQ1BPxL/VxUgpQZAy0oEwHbQVP7cddhDKzQhaj3TGj+V+ym+
 dAU6rGjmfIozp/eM9cRqEeFrJaGIsyQ0Any+XtUsIjD/tHhqxxUMfbyIT2prSV5SbASZhBG5z
 ncmOyT9nvTKEwCuWfgAUU6gSgUR3Sd8Syz63l5HtRtDWHvYA0pLMWRaJomJJD5QLkfhChqiwY
 czcSmK/MQ0/7QsNdHnA+Y7Uww0hgNQ0264u6aAmMtVsVKYLwFsmW7met+QDP/rS8NdkQ5YSsj
 xgNhNq9MVKRpd0/DMrUu1n4cCUZFM+nJXpGi5a65er2eG2MNJCKcH4AP8F7qydEO9YsOFhiYs
 z1C/372HV9n13gB3doaGug=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/06/2021 à 16:56, Ilya Leoshkevich a écrit :
> Verify that querying is allowed, but making changes isn't.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/multiarch/linux-test.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
> index ce033c21c7..cd9d8159bc 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -496,6 +496,15 @@ static void test_signal(void)
>      sigemptyset(&act.sa_mask);
>      act.sa_flags = 0;
>      chk_error(sigaction(SIGSEGV, &act, NULL));
> +
> +    if (sigaction(SIGKILL, &act, NULL) == 0) {
> +        error("sigaction(SIGKILL, &act, NULL) must not succeed");
> +    }
> +    if (sigaction(SIGSTOP, &act, NULL) == 0) {
> +        error("sigaction(SIGSTOP, &act, NULL) must not succeed");
> +    }
> +    chk_error(sigaction(SIGKILL, NULL, &act));
> +    chk_error(sigaction(SIGSTOP, NULL, &act));
>  }
>  
>  #define SHM_SIZE 32768
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent


