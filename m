Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48487348E44
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 11:44:05 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPNT9-0005LH-US
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 06:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lPNS8-0004e6-1s; Thu, 25 Mar 2021 06:43:00 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lPNS6-0003L5-CI; Thu, 25 Mar 2021 06:42:59 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MOiPx-1l0qii171D-00QDD4; Thu, 25 Mar 2021 11:42:51 +0100
Subject: Re: [PATCH v3] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
To: Andreas Krebbel <krebbel@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210324185128.63971-1-krebbel@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <107c07f8-bf53-773b-e619-137e6487d8c5@vivier.eu>
Date: Thu, 25 Mar 2021 11:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324185128.63971-1-krebbel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MT5Qn1w1oXRw6c27fI73GBpcMnomfwR5EGXpl6jHLNCp42xKy2a
 VuSn1dHhqP6Lpagc598tBr+KcXBUXH9G+wAeP5QyAtQRjkXz6rl8R1ciwPH32BGv3kYjWdn
 Ln4fVa5oZOqLAydRK5S73sCiM2ebYnJxcYwYfEsd+O37oS838yR3lf6Jr6M9C89Md6seKVy
 QDkaMKFLUFQOD5Bbrp/0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JvZnLwzIJOs=:XQ8KFZ9gT/YnxlqjbGsWIV
 8JFcziHUb0vFg7jUdGGGXFkuYM9B5nFCeT1VvTTGua5NV6UxYkVs3JTCCmiS0WlqcMN2Jh7fl
 lN02DXAiAVuridsQtsQXEYrCrrGgN6CKiWMUMSS7D0tlYZyDfsOdEeFKLSIDRsdxVUslmz3Xo
 gbaLuf0mGLk7gwIBLhFeRfXo1PIR34QFFzciUmJJVF5H8K2z3Mt41HHhDO1/KXBGXqhrLAyDA
 a9W4IARg2QyxJh+5VvJL/PejxCQDnRvq7acI4uC6EHN/NU03ycXDcKnTcaJ5Iv1kDsLX0eijf
 aHFi7ey/19f4wPIaGZGDXjMpXtTls438dHu359fXNzpsdBVoPOTFNMpPtyv7xEgWtgmIasmxR
 Q9CBpqA5gg9doOPKzc9ZJc6m/2hdJLq7JJoCOtLG+N+ytvppke+SROWiYc7+oS9gK8Jy23IS6
 l/0KGOtZQIhbnCEHCS1iNK47Mzdw7MN6ds0ykTlgfH8GQsDPWsI7
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 19:51, Andreas Krebbel a écrit :
> When setting up the pointer for the sigreturn stub in the return
> address register (r14) we currently use the host frame address instead
> of the guest frame address.
> 
> Note: This only caused problems if Qemu has been built with
> --disable-pie (as it is in distros nowadays). Otherwise guest_base
> defaults to 0 hiding the actual problem.
> 
> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
> ---
>  linux-user/s390x/signal.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ecfa2a14a9..7107c5fb53 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -211,9 +211,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>      /* Set up to return from userspace.  If provided, use a stub
>         already in userspace.  */
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
> -        env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
> +        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
>      } else {
> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
> +        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
> +                        | PSW_ADDR_AMODE;
>          __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                     (uint16_t *)(frame->retcode));
>      }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

