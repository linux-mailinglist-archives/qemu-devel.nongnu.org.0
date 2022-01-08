Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E53488555
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 19:18:41 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6GIa-0007cB-UI
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 13:18:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6GGd-0006oD-B3
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:16:39 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:40603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n6GGX-0003gO-PE
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 13:16:35 -0500
Received: from [192.168.100.1] ([82.142.12.178]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MqJZl-1mbcWz2Id9-00nOrO; Sat, 08 Jan 2022 19:16:30 +0100
Message-ID: <3d44e8ff-6adc-8c52-5449-1c3ef4355786@vivier.eu>
Date: Sat, 8 Jan 2022 19:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user: rt_sigprocmask, check read perms first
Content-Language: en-US
To: Patrick Venture <venture@google.com>
References: <20220106220038.3658586-1-venture@google.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220106220038.3658586-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V1DCjJ3cBQjswCZFfgsTiTK/7TGZQWY6aO5WoqYO+2fW1+WVCC3
 OgKX3gH+cjjVe5iQInINhnNuBjJgxVBYU93PSOh04XjuGduFAmnWJEtM9SHWTjoeGJTI+RD
 PDyEgMJnrp9UMgmClA7LfwfPuYzRF+bPJHptw7RoOduoKKG40VI9S7m0IU09FesbGptlwHl
 rFKd76NVwvSi5zTPB/BJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HGJIddqNdK4=:L1S9b9l9eIcfUeVvbW5+c5
 BJhBKtPeOltEiP4teiEI8WSisNnUQ2mTYBTFsr46I2k2Dffvn3cumhL9zeAcsKrcltj3jXUR7
 ruCXxfEwVoEuVzpUTcd7vb+3zIx84H+j+EtwlJKcItDCXO70b6i1RNQ4iME/KNgajzzx5jfxs
 MqHY0iYaBimlTZdV4etNXds2lDrW3KzG3ya4bu17PWKWF34uJ7IFVQNhhoJ0BcUspegbscR8b
 wKZn8FNTdtYBZZWJYCSDbV3ftjTy6qaEU+1bIugQ4m2mqz/xEqtQJ3ZhNrO3SRzG1PaHB4+uV
 zrctZdNyYX9U2w6GNEJzZRq23MXcYY5vh4JTnCw/VyhBiAroVtDVHoj1lfdVEhtLPzJup6Mpf
 /SKhbkqrNrKsavhR0Wx3M1ZonQlT9pJ/R1zbv1nbaQIZMNeE2G2f4uvij4uAHvTga7znXrhIt
 6sz0biQAlmAHWJt/m7aD4qvdZZmAb4ojeK5LG5ouR98t2mwmV1p+iYySmnj7PNTmEGlnXWFg2
 EExdWU9SgDhwKoXN4CYke1/aGuW5DCsX/71iYDT3yrCSScN1lmVGpAhgIfdOu9R9qxO0842NS
 EWm/J1PX5R9FtiW4VppWrFXDLAa4X5TkQgp2iq26vH3HhxeWOqzPbUMV1y23+U/7NKKYrUVnY
 p2d8fyqmRA7KjMhbe5WZnRfgTx1IHXCdcJiFGxu0x+sjHkb9f05mSPewDveX+/kvXLjk=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/01/2022 à 23:00, Patrick Venture a écrit :
> From: Shu-Chun Weng <scw@google.com>
> 
> Linux kernel does it this way (checks read permission before validating `how`)
> and the latest version of ABSL's `AddressIsReadable()` depends on this
> behavior.
> 
> c.f.  https://github.com/torvalds/linux/blob/9539ba4308ad5bdca6cb41c7b73cbb9f796dcdd7/kernel/signal.c#L3147
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
>   linux-user/syscall.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ce9d64896c..3070d31f34 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9491,6 +9491,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>               }
>   
>               if (arg2) {
> +                if (!(p = lock_user(VERIFY_READ, arg2, sizeof(target_sigset_t), 1)))
> +                    return -TARGET_EFAULT;
> +                target_to_host_sigset(&set, p);
> +                unlock_user(p, arg2, 0);
> +                set_ptr = &set;
>                   switch(how) {
>                   case TARGET_SIG_BLOCK:
>                       how = SIG_BLOCK;
> @@ -9504,11 +9509,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
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

I know it's only code move but generally we also update the style to pass scripts/checkpatch.pl 
successfully.

Could you also update TARGET_NR_sigprocmask in the same way as it seems the kernel behaves like this 
too in this case?

Thanks,
Laurent

