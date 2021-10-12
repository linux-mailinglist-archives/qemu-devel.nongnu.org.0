Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42533429D96
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 08:18:00 +0200 (CEST)
Received: from localhost ([::1]:39214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maB6t-0003YX-B1
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 02:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maB5k-0001yX-1Y
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:16:49 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:34499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1maB5i-00082H-EZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 02:16:47 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxV8b-1myJkY35ir-00xwLV; Tue, 12 Oct 2021 08:16:43 +0200
Subject: Re: [PATCH 7/9] linux-user/nios2: Fix sigmask in setup_rt_frame
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-10-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <c5b718d1-caf7-3862-6ff9-099a3d851840@vivier.eu>
Date: Tue, 12 Oct 2021 08:16:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211001153347.1736014-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cZuCqW/dpssCHMTo9/Nle5uIsdPOFPw8CJvnS/Ct1DM0+Lu2naK
 +Josohx5AwAuDo5KeMBySUz1Yf8JdJT0AJ2Q9qippeAh093qGI5S3OIg2gVbhAClYRxTh0T
 ZYja5hf0+0gNlKK9cJ6h35vHtw58NP2HIKLRSaDwmwHbkB0mZ1cB32fw3TrFpyPCYUsJzJp
 iVkK4JrUIMiHgi50vdpjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dKzbZ/dl8/Q=:3PfzHjXviFOTciPEPkV9ck
 DWoUIDPLNhyt5W6L2U8/wtUDmqkm2IwpSGYC0B3SHzwVhWj9NpghvbzHmQAW7GfGAQSi5iW8S
 drl6OnFhcoe5Lnr4O2By2Lnfo81nlwVvbGfdZoZltBqUVoA/htyJoXRJupMxU2+2KhGqn9J0P
 3JiLkE6z/b+xWatsF8aBhLYX7iOTYW/lFWRSoERa3iFC08N4o0q3pGuuY2jj9MoTYE2UgdtGc
 cX978w4oTRCafKOtAOpN+I/WxKDsQ/mF3Tya0rJJYylWJQG4idhH+zmAC1Rodk4mKpxndqTg2
 VHgW915jOSzuFCQ/9aQIiwqAAMQ2PtEmyOjm3pvqheSsvxKF6UfrWWYBmE1YWoWkr9k54tRa2
 pCnnnpukGPg0foujf+GgxV1HUOSK2mFv3k9d17/Wgwxg1zPpa1R8INcVRVQ7YUWdjOJxBnvJY
 VUOyhn+M0KkmIPENcTZ48NwsoUSwWfPA0MhO6bk3n0odyi1OblY38fpoi61mFtPT4kbs8gpsv
 VcuMLH3AsY7yZfuy3ucmJPBIHGDeSPpwQlO1hio8Lx5ep6pl6qcQvSjC/dM4fvTlCO2mPrqDa
 qDmzCLrLZpIF2cBdaCNC+savFoFTggp8Z2vXqKw2vZdw3r8bmrH6nV2byD3lPqtn3Z5BPSyIF
 Vu+e3gfveBop1sdjeh9eAWUJDw9bZTtQlEQuCC7tQymevB3awEIb3AsZw8jizOKXAmgIgqiOf
 ZP3zuArkzkX97Rsocrn5aRwmIv4T2M84wmOsag==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: marex@denx.de, crwulff@gmail.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/10/2021 à 17:33, Richard Henderson a écrit :
> Do not cast the signal mask elements; trust __put_user.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/nios2/signal.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 20b65aa06e..80e3d42fc9 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -168,8 +168,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>      target_save_altstack(&frame->uc.tuc_stack, env);
>      rt_setup_ucontext(&frame->uc, env);
>      for (i = 0; i < TARGET_NSIG_WORDS; i++) {
> -        __put_user((abi_ulong)set->sig[i],
> -                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
> +        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
>      }
>  
>      /* Set up to return from userspace; jump to fixed address sigreturn
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

