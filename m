Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7649D280
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 20:31:22 +0100 (CET)
Received: from localhost ([::1]:56646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCo0n-0002Du-PZ
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 14:31:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCnwK-0000Jl-0o
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:26:44 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:36781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nCnwH-0006LS-HM
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 14:26:43 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxE1Q-1mJlVk0kbg-00xYXI; Wed, 26 Jan 2022 20:26:36 +0100
Message-ID: <48f25af9-fc8f-aab3-bf34-f2d1ed013390@vivier.eu>
Date: Wed, 26 Jan 2022 20:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/2] linux-user: rt_sigprocmask, check read perms first
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220126175850.1904968-1-venture@google.com>
 <20220126175850.1904968-2-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126175850.1904968-2-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GRcv7TpTg2XMGsRIaHyz4NdFRjQOGmio/pUF8yO7Fifie4eO65d
 4KGiRAztc5lNcL4VXsGQ8Tr6QxQN3ZFzNv8ViGeV76N3CmKESZ6xt+jo1QNXYmL7Ao0KQv4
 jXU0UP6irEfBnZaPeC72DtxNhWf8U3Upq9i6AZcw7yFKAYK5JqG2i9XnCHTy3DZGxj5U4AK
 cic6xtn+O6653XbYGqM0A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vblA2BxYtCg=:M7HCU0K9W+nbbTJhlEsgcX
 zl4ojg40+e25lwfXjqL71LjGBHWSWnfM9yUcfzytglC6fSQcdBKxK/EneEz+lqGlNneynj3Qy
 c5lZ5FCYxlCV8xBEomW6QKGZwmYkzApK/r49wNOJiALePtPYlXkSXtE4HzCGDIshlP6e0rjAI
 VjuAqnWvwFXuLq0xN2gZHLlJRTd31+GqxTRv9hjKnv8drA22UBBEmW8sEypsR9Vr9JRjwTk43
 jcYuwLx3yLCsWnqKdDLFtItlkiZ+AiZ/uoJj7pZaYR3pkiRtIoxGnRWZXhaIVh5PkUA3AwPa6
 Pj2wFgOL7mWtQEEHF8SReG66jh00HVIC8qCCPQ1wxaCJ9HJCE+f+3uea3dXV4VEORS08Igp9+
 zLAUFFpTspR7DKxa0Z23TGcvgXdRr5I26Qedj7Ba1+Ra0PPcIc6YThUAG7sF+3A/UqvtMLygi
 p3jmGwPIUXaUXvvcJN73/xElh/3tN4WNMSscajAc/p+WxRujQtT/lPyZEUHREmEmuU2HLuUbH
 RHRMWvb2t3dHwzOQlvpY+jTFmxBy4ZBMY1WfBQMQClYKoukOjyNvwpAxPoY31MABnO2mG7AXR
 Hf2bFyFYEm51b+dXPZ19zUMURANa08XSlG0wG3Ts7hethKjqm0C/dDx7XQJV4rfvJZ0Sz05YH
 ltqQfLvIscK2yDU5dhTVnn+vB5GyYsN0mZ+K3b4grJzYdqKaJm21cg41yGfbl4COKRJU=
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
Cc: qemu-devel@nongnu.org, scw@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/01/2022 à 18:58, Patrick Venture a écrit :
> From: Shu-Chun Weng <scw@google.com>
> 
> Linux kernel does it this way (checks read permission before validating `how`)
> and the latest version of ABSL's `AddressIsReadable()` depends on this
> behavior.
> 
> c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Shu-Chun Weng <scw@google.com>

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

but you must resend the patch: you are not the author, but you have to add your Signed-off-by.
(and now you can add my reviewed-by)

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n296

Thanks,
Laurent

> ---
>   linux-user/syscall.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..34bd819e38 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9508,6 +9508,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               }
>   
>               if (arg2) {
> +                p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1);
> +                if (!p) {
> +                    return -TARGET_EFAULT;
> +                }
> +                target_to_host_sigset(&set, p);
> +                unlock_user(p, arg2, 0);
> +                set_ptr = &set;
>                   switch(how) {
>                   case TARGET_SIG_BLOCK:
>                       how = SIG_BLOCK;
> @@ -9521,11 +9528,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>                   default:
>                       return -TARGET_EINVAL;
>                   }
> -                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
> -                    return -TARGET_EFAULT;
> -                target_to_host_sigset(&set, p);
> -                unlock_user(p, arg2, 0);
> -                set_ptr = &set;
>               } else {
>                   how = 0;
>                   set_ptr = NULL;


