Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAA2DD002
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 12:04:28 +0100 (CET)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpr59-0004os-Co
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 06:04:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpr3U-0003vy-5j
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:02:45 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:57949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kpr3S-00039R-AO
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 06:02:43 -0500
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5x9B-1kiP4P3Nr1-007X2Y; Thu, 17 Dec 2020 12:02:38 +0100
Subject: Re: [PATCH] linux-user: Implement copy_file_range
To: Andreas Schwab <schwab@suse.de>, qemu-devel@nongnu.org
References: <mvm361eer3n.fsf@suse.de>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e382beb1-f13d-37f6-3e46-eb627c620ae2@vivier.eu>
Date: Thu, 17 Dec 2020 12:02:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <mvm361eer3n.fsf@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:luabQbzJsklFEYt3/2aeC5wMukljOz3Bc5rlCUlY1ox8F/d0x8/
 De3XOSs2wwBe0KYJa/DXXqm47GBDm3JC9t91FA52IhICndzZOZa4a5KCBEMMwfLENl66XgY
 h9dm+Gytgnh7XYwahAfnPWMxlFO4No3R5vZ7G1WUqu6TkwCPQfxpIw/PMAf/brigmRY5cKK
 bKDN0EuRhVApBfVc5UAaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mknkduLUQuk=:fDxkiUosKdM/ObrPRnuUw5
 d0Sp8B6FMAL8VSD3lBMT35fpE7x8CPE6XAaYc4acp2G/Ewaf2CFjuaogaUU/EA0tllc6SRBgE
 YHcNzTaTIerYRzlBhXkEatmyZk7wtHzkrc5/C06SlLX5rmIoDmMlrGm4cuMKjhxqtoza+gqX+
 TEwnE9xPT8rTih8Y04QGSQYxbRPR/Hglnak9TAXc+dla5iQlgSfMNYucJAL00uzKZbV+8Z2Jb
 Qls7z/xMHlkkmCjvZxYWq4EzQhay4Apy1UZ1eIZmvIwlYJwkrlBOnVZlZODv91qIUMe2UKeCr
 BSlPi7z9bO9lwbQR3ull0toqU9a4aslWMH3fj0WpmSDyjCHYnYzcUDi5WvECUUrQcQhp6thcA
 +/Lcviy6k4yHhvtumc3GJ9KGkMCfvCayxtgoKdWpgn+PJIbMgG536jhw5IcNnNuBfJgUWklDF
 P1I3Ljj5Tw==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/11/2020 à 12:45, Andreas Schwab a écrit :
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  linux-user/syscall.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 3160a9ba06..c3373af4c7 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -813,6 +813,12 @@ safe_syscall5(int, mq_timedsend, int, mqdes, const char *, msg_ptr,
>  safe_syscall5(int, mq_timedreceive, int, mqdes, char *, msg_ptr,
>                size_t, len, unsigned *, prio, const struct timespec *, timeout)
>  #endif
> +#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
> +safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
> +              int, outfd, loff_t *, poutoff, size_t, length,
> +              unsigned int, flags)
> +#endif
> +
>  /* We do ioctl like this rather than via safe_syscall3 to preserve the
>   * "third argument might be integer or pointer or not present" behaviour of
>   * the libc function.
> @@ -13057,6 +13063,40 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          return get_errno(membarrier(arg1, arg2));
>  #endif
>  
> +#if defined(TARGET_NR_copy_file_range) && defined(__NR_copy_file_range)
> +    case TARGET_NR_copy_file_range:
> +        {
> +            loff_t inoff, outoff;
> +            loff_t *pinoff = NULL, *poutoff = NULL;
> +
> +            if (arg2) {
> +                if (get_user_u64(inoff, arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                pinoff = &inoff;
> +            }
> +            if (arg4) {
> +                if (get_user_u64(outoff, arg4)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                poutoff = &outoff;
> +            }
> +            ret = get_errno(safe_copy_file_range(arg1, pinoff, arg3, poutoff,
> +                                                 arg5, arg6));
> +            if (arg2) {
> +                if (put_user_u64(inoff, arg2)) {
> +                    return -TARGET_EFAULT;
> +                }
> +            }
> +            if (arg4) {
> +                if (put_user_u64(outoff, arg4)) {
> +                    return -TARGET_EFAULT;
> +                }
> +            }
> +        }
> +        return ret;
> +#endif
> +
>      default:
>          qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
>          return -TARGET_ENOSYS;
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

