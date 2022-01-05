Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9E485131
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 11:34:49 +0100 (CET)
Received: from localhost ([::1]:36554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n53d2-0001yi-9r
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 05:34:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53T9-0000TH-76
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:35 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:58189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n53T5-0007WB-9y
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 05:24:33 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7iGi-1mJE6w3RNC-014nuw; Wed, 05 Jan 2022 11:24:28 +0100
Message-ID: <0f208761-6e1d-6b50-a514-5bc37f0dca33@vivier.eu>
Date: Wed, 5 Jan 2022 11:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 6/7] linux-user/nios2: Fix sigmask in setup_rt_frame
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
 <20211221025012.1057923-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211221025012.1057923-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NwduWumUgTjRokoSAwJX3Hwi4e5tB99zlzQS+PvA5qjqCa/LMzb
 0Z80ABBJ9cK/Kx+DVrGekNXfiTdzw/y0s5946qbbz7ItfYSDUrptQpriSSKZbEKBleYQ5kZ
 sSbvziP9vEfD4mbkgNXu8Ul970kX7OoSnuwvnqkV3yY9+DXTDl1gFJNxvtxYYWtNqELXZbr
 6dPYSFA2JAoxiEppGk39Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:matEc5AGb5I=:nNQD79DQBcDhuDQgT3kOS4
 Mlc0Nd5ftDEeKISPlLBPRI8E6buhlV2/RujZxxSYdDTIV6AzAad0s3f2gTCuzMpJK0vMwadpJ
 9bNzzY3FiT246tvRzC2gAtmmB/Jtxtogbv08sdulYUmFHabifrmuoWPP6hTERVC15EWVDAMrG
 6bEW02F7vhaWlOG2EmWN0ZlIJYOnPyoODcb5mr0h7KNBgY8U43KECnpLVNIIF/AOLKxVnNi/o
 s/VVrdnyx1Ta+QfQUt6bdjpzt7kTTZD83FFIAwYQgKbAmwdrfwEKYLk63oi2Qw2z/f35+ZD8p
 xmz8Ud8xaQGRnRpskrEqVSuRkAAhvPZll6dTxQfyhGw1l5gru1Yu9BkwKMo99FWfXRkiZYP8R
 FE/LxIXzkPwRxpZ78UbBWQdLql9SL0e/B2gJ755cpzbD1q4cMFPWkk8EEaAMk3//yMNuQ/WPb
 3D7VSRbYqwJlcYZuhdo1xa2OglO6ot/u5cwxeTO6Qgt2+1jvT92gTH6POTKOq4zQ/3I2KlFA3
 42Vb3zA307RpyLBvCjRCKIYnvehjxNdjNFX57Pjj6cwpm1WGBM+464eR4bk4YwpZoTJTQMT9/
 rZOs8DAfwyW8RZl8+wUS6m6xyOuV8zHHI6Io3gLymQzXCuJ3W1GcwECvP/11IEaoOw31EI6aX
 zwLvYqvPjkMNi7t+mBVkrxi8w201vU66sWi0Mhae1PyLbDz4ELOfwnEkgK7+5m1KMG44=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 21/12/2021 à 03:50, Richard Henderson a écrit :
> Do not cast the signal mask elements; trust __put_user.
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/nios2/signal.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/nios2/signal.c b/linux-user/nios2/signal.c
> index 20b65aa06e..80e3d42fc9 100644
> --- a/linux-user/nios2/signal.c
> +++ b/linux-user/nios2/signal.c
> @@ -168,8 +168,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>       target_save_altstack(&frame->uc.tuc_stack, env);
>       rt_setup_ucontext(&frame->uc, env);
>       for (i = 0; i < TARGET_NSIG_WORDS; i++) {
> -        __put_user((abi_ulong)set->sig[i],
> -                   (abi_ulong *)&frame->uc.tuc_sigmask.sig[i]);
> +        __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
>       }
>   
>       /* Set up to return from userspace; jump to fixed address sigreturn


Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

