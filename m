Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F35836868A
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 20:24:48 +0200 (CEST)
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZe0N-0006vC-5y
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 14:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lZdzB-0006Ur-L7
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:23:33 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lZdyl-0003kq-AD
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 14:23:33 -0400
Received: from [192.168.100.1] ([82.142.18.94]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N1wdj-1lSep42SEb-012LMP; Thu, 22 Apr 2021 20:23:03 +0200
Subject: Re: [PATCH 1/2] linux-user/alpha: Fix rt sigframe return
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210422180819.252121-1-richard.henderson@linaro.org>
 <20210422180819.252121-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <5c79ca76-8b66-eba0-9acf-9077957d0945@vivier.eu>
Date: Thu, 22 Apr 2021 20:23:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422180819.252121-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RQqenIGE9+eHe3nl06XJ1gtARrAXS8oul0ZzeNkegPKTFJOXrCd
 CRqC5xgWoiRFkARVDaSeSV+11/nTlfPmzZiRsJoZCnY7VCPvsvDl9z9P2EeMRGWXdFMQT/P
 wA4pwelHnmWFSFOA7Cr9ECBwLtD9nldawfxUnNx7DMD7b4WPZJ7wkfD9wS1QIZu8nfriYm0
 M/n6LTsbaQ3yF7bRH+Ptg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ac2SOAtMj3I=:/5Ff4UZuAbdHAVQxfSFrRw
 eEvEC3tr0jcer7tOXsguwUCXMRFnJWuuCg3BRKi93LlpkK06zbDku2Yq7njFL7j7mfs8pWZXr
 OnT5SoEgJ2q6ardfP6BgJLc6gP20UTNYOUMGWpDUoWUMKShq5gnYYgG7hQnqGY3XCz3AZHeoy
 /69104NRs2lWyFyyOtxfdvyRVT9Jd3QcU5dtmdI5M1aoDPXk6Xje6FiKwbDRoBqPHf4EoVeTT
 NLjx7iyFx2mXaVwWkM1/q5V5KNONfmzHiXA2or3LfKpnfku2lIREq4NY667k7OfaGw1OE8pdC
 X0RZWFORLvo0hfwIGa/E5b+h7JbWD+qqSSJl5+PY/8PMGD17pw50wP7ZpGVqnFc97/K6myS86
 RXzhyEQVy1jXigqiSKebrYIYwx4eVcD6xBwSey+M1LOrX9+dEJEufvd+QC26c8nCd0mDR7oRp
 ntdPl37qkAani1ZbD0vJbHzc5Igoy3rlYNSdkKBoAthQLR3/dyFQsDnnVpNI/Y+5d0cdJtAiG
 9C25iM+73sCJIq5BoyDfGY=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/04/2021 à 20:08, Richard Henderson a écrit :
> We incorrectly used the offset of the non-rt sigframe.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/alpha/signal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
> index c5c27ce084..86f5d2276d 100644
> --- a/linux-user/alpha/signal.c
> +++ b/linux-user/alpha/signal.c
> @@ -200,7 +200,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>                     &frame->retcode[1]);
>          __put_user(INSN_CALLSYS, &frame->retcode[2]);
>          /* imb(); */
> -        r26 = frame_addr + offsetof(struct target_sigframe, retcode);
> +        r26 = frame_addr + offsetof(struct target_rt_sigframe, retcode);
>      }
>  
>      if (err) {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

