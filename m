Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B149E4B2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:34:41 +0100 (CET)
Received: from localhost ([::1]:37076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5rE-0002MC-DF
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:34:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5WE-0005FO-CI
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:12:59 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nD5WB-00021G-Ir
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:12:57 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MTzjI-1mmAxq36p8-00R3CE; Thu, 27 Jan 2022 15:12:52 +0100
Message-ID: <d1cefa77-2914-2137-617c-49c0290d2a73@vivier.eu>
Date: Thu, 27 Jan 2022 15:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/2] linux-user: rt_sigprocmask, check read perms first
Content-Language: fr
To: Patrick Venture <venture@google.com>
References: <20220126212559.1936290-1-venture@google.com>
 <20220126212559.1936290-2-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220126212559.1936290-2-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4nGB1caaMzBne3jJRrHqum10SiWV+7QApvt7EiH5n6eB7pZ9unf
 D2SspQhtNg/O4qEUBg9avGEVW8MyKtJgDnQp6f8xiOoZdQpXF3kPRQVHvp5itvw30e1UWTL
 iuCsAqsyRafubH2l9paApKHbKUcdbv/bdLe1LzSrMrG056UV69LoDp1XDBipWYnWEuUqKzr
 Qe8FaWF4DGvp4eoeReIlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZjnSR9L4nhg=:UB9cqtKeYENoL0HHPCoE4i
 aaX/Bg9xD24GkdE6kpFUK2n8DjpSM7UwEjMvaY2W7gewnWEak2X7tqsoE+d2dDYFJW+cxGYoi
 9PnC1Tqye/R6i1MC2RfDBXWY38PtdxIZJuSDOnUAkhmX7RWG1mlKMtAshDr/elOblKzjq4iTC
 NOx4Zmm83SoJShR5iv+X6TMjkaEd0sninTkJuHN+6ogdE6FNJHNwFdyh89tWxlh9qPf0OHQMF
 aEG0nuL8zj7VlqloT7Gmvz16DHsolnO+/6d+tm4x115HDVd3lVZM7u1XUjUmXGazIKKCh0yNv
 RG1yvj+TM5YOeUYIh44yr1J1/LV910DGdFDRFt1ogy3t65OyTtXrZAnNnUmvSLL4DigMmfMJM
 VibrWDxJBv7yYpDHOL9UzoPgCzeA36f1sAAQ8o+ihCVvy6rmQHjAOVtmVf9rXCaglihg/hGC6
 y3Riv9lEk4S+PRb9rmtItqSePZIk2M2yQRYDiDiZ09vhGDYd2d6GNsE8nBTKQGfmWDAb/y7KS
 T0QbdwbHTCysftYbE7IW1thdbyOVVeaitx5yaQzRTnIOYGj6Thlm566NpCrAD7nKVuJryKJn0
 85miirqCa5vJaNuakzPqcH7AAx2Z/R5/noGG2INdP6uF4r5LKPBRAVgfC82NXc2d1Zg2Jz0y6
 UWOZVjYKqu8RmTOyyaNNp3T9fHAk7tWFjgJp6CuP8wyLwyKhhMw84CX9q5/VQO4wbhdo=
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

Le 26/01/2022 à 22:25, Patrick Venture a écrit :
> From: Shu-Chun Weng <scw@google.com>
> 
> Linux kernel does it this way (checks read permission before validating `how`)
> and the latest version of ABSL's `AddressIsReadable()` depends on this
> behavior.
> 
> c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Patrick Venture <venture@google.com>
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

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


