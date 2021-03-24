Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3918E347FDD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 18:55:52 +0100 (CET)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP7jS-0003rs-Hk
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 13:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP7hT-0003PU-Mz; Wed, 24 Mar 2021 13:53:47 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lP7hR-0007n8-8h; Wed, 24 Mar 2021 13:53:47 -0400
Received: from [192.168.100.1] ([82.142.25.162]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MeD1l-1lyjQr3OPn-00bH4b; Wed, 24 Mar 2021 18:53:38 +0100
To: Andreas Krebbel <krebbel@linux.ibm.com>, qemu-devel@nongnu.org
References: <be03acc3-8e9f-4715-6936-68013c49b920@vivier.eu>
 <20210324155530.52239-1-krebbel@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
Message-ID: <91794f50-593d-87cc-bf46-56593c204308@vivier.eu>
Date: Wed, 24 Mar 2021 18:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210324155530.52239-1-krebbel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sfF6v3D6SBQ8LUqCp2xs7wra2AcaEqFFqjZNaOOfHmND+3qJV+x
 lxoZg0z9aMA8Rix+2yBpbAcmY8Fs7lZR10c4S9kRpVooj554dZVjucvejCKC8l+29iIB6ri
 GQ1RNcqOFnUOxKuFpiGutylVjvzozOnd1LEK2+0pEttGjjugV7PnGVDtBDqh/bEM4yoixk0
 DS8bJeXTkuIn2vgq5bMdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oeJJfgAlDHw=:jyckEPgVWXhRRoMO7nbJkV
 oiCszB5ACaBBSFVN+YSTCTwNIe9XgfRFTKCXjYJlHArHyBFot66+pqr7SUzYIIkLha4pXPiBg
 rBfG2MZEkjDAv8xdsVqEj0J8jy6BMXhqDocqU26PXv8+LLWaWdZKow4TTikxHHJlxvnkbuom0
 eKnQgiRhr1RG+iOz1ZLIvfm2GyOLZilTXYN/SUXmxIWr7/XGPIRCbo+EZNIIOj3DvkxBV1K2m
 a+G9VZHr8PmvSdy7SS1TefrI9nWlkvbRNRV7NQx2Oufr9/HANDwb8PJavVHxhLLPbW0oqnQfo
 PjoTjf34o6hK3QXR1Gslxw/NgEUvETRKn9HoV5NhWs0TARtlj7FfqwL7AAT9Gbi5c0rCCWrKC
 dvqI8zgb4g9kQ8F1glYMU+kid/yTKxXqJiwyyEbBEJWlQhwQQp+brJgKAeeKNUBV3rHftMG7J
 rT86D+cs0w==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_ZBI=0.001,
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
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2021 à 16:55, Andreas Krebbel a écrit :
> When setting up the pointer for the sigreturn stub in the return
> address register (r14) we have to use the guest frame pointer instead
> of the host frame pointer.
> 
> Note: This only caused problems if Qemu has been built with
> --disable-pie (as it is in distros nowadays). Otherwise guest_base
> defaults to 0 hiding the actual problem.
> 
> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
> ---
>  linux-user/s390x/signal.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
> index ecfa2a14a9..e9bf865074 100644
> --- a/linux-user/s390x/signal.c
> +++ b/linux-user/s390x/signal.c
> @@ -213,7 +213,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>          env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
>      } else {
> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
> +        env->regs[14] = (target_ulong) (frame_addr + offsetof(rt_sigframe, retcode))
> +                        | PSW_ADDR_AMODE;
>          __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>                     (uint16_t *)(frame->retcode));
>      }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

but if you want to send a v3:
- to be consistent with lines below, use "offsetof(typeof(*frame), ..."
- in the line above, you can remove the (unsigned long) of the sa_restorer as it is an abi_ulong,
- don't send the "v2" as a reply to the v1 as it can be hidden in the mail thread and missed by the
maintainer :)

Thanks,
Laurent

