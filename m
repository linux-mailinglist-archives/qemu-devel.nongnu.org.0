Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EF431AE17
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 22:18:05 +0100 (CET)
Received: from localhost ([::1]:42694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lB2Im-0007vZ-Lx
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 16:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB2I2-0007Up-A1
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 16:17:18 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:55525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lB2I0-0007cN-Hp
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 16:17:18 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MaIKJ-1lPb083V4P-00WI70; Sat, 13 Feb 2021 22:17:06 +0100
Subject: Re: [PATCH] linux-user: target: signal: Support TARGET_SS_AUTODISARM
To: chengang@emindsoft.com.cn, riku.voipio@iki.fi
References: <20201008043105.21058-1-chengang@emindsoft.com.cn>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ac9ca134-694b-a8e5-bed0-76474c817e57@vivier.eu>
Date: Sat, 13 Feb 2021 22:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20201008043105.21058-1-chengang@emindsoft.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:paBKi6p61yI8QZlmfAwkt2F+Wejgwx6GtiBPu56oEq+1/v4281z
 mNiYoN/BURcYwB2NjJzzRGNJks+PepY8vO24parYYLnj+GPQfTOQjA001aGbN5qYFsVR5Vj
 tLr1c8KcF1x3CDLrlwKx1/mElX4o2g5F4nO1pNFMv4QEI9mEAkim8EOF+rKlzhRyOm6cyZm
 XBzah/rEGWWfVVh5u1ENg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U7BLhKtvLig=:CxuJbpYSZfAll9NHMJ5v9M
 yxmu3AP/USb1G0tVpwgQSDL+zfzo85UDBJbE2OPQ48v9vuHDN4vLouwJv/igw+KVhpIvJZaUZ
 l6eEpPH57DOR6FKFm6+INA/asqz/PZbGOF7YWZlztuXWqclFYWMypMoqz6oP3g5cPn98a9t/e
 36xCEBTiknjKk5GucoYtJUHTXmnG9dWCCpfLmoXQFuZ2OtFU2bYkpu82kejR5B5Agj5jTA/08
 s/4zEfiG4kJMuUiAbyI5+WmdoT0kX/RcQ+Y+m6f+sHq4lDfuYyPf8qyLe6OF/fEgrna7ibe/U
 cg8Wy8VKTGwOYbRNrJ8QYQD4v9AcBMjKl65O+m+ET1w1XFXsKolrIF6JE2JtSrRo5R1QhOwj1
 2wAql+IXy/UkgxbsTRMtjsQTHlTAygvVog8GGoPpOzGtxP8l6vJI/JFmRITGyBhxgRoYX9emr
 QwzfG1cIKA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/10/2020 à 06:31, chengang@emindsoft.com.cn a écrit :
> From: Chen Gang <chengang@emindsoft.com.cn>
> 
> Add definitions to pass building.
> 
> Signed-off-by: Chen Gang <chengang@emindsoft.com.cn>
> ---
>  linux-user/alpha/target_signal.h  | 6 ++++++
>  linux-user/hppa/target_signal.h   | 5 +++++
>  linux-user/mips/target_signal.h   | 6 ++++++
>  linux-user/mips64/target_signal.h | 5 +++++
>  linux-user/sparc/target_signal.h  | 6 ++++++
>  5 files changed, 28 insertions(+)
> 
> diff --git a/linux-user/alpha/target_signal.h b/linux-user/alpha/target_signal.h
> index cd63d59fde..241e207815 100644
> --- a/linux-user/alpha/target_signal.h
> +++ b/linux-user/alpha/target_signal.h
> @@ -93,4 +93,10 @@ typedef struct target_sigaltstack {
>  #define TARGET_GEN_SUBRNG7     -25
>  
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> +
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif /* ALPHA_TARGET_SIGNAL_H */
> diff --git a/linux-user/hppa/target_signal.h b/linux-user/hppa/target_signal.h
> index c2a0102ed7..2c9d4e611e 100644
> --- a/linux-user/hppa/target_signal.h
> +++ b/linux-user/hppa/target_signal.h
> @@ -66,4 +66,9 @@ typedef struct target_sigaltstack {
>  #define TARGET_MINSIGSTKSZ	2048
>  #define TARGET_SIGSTKSZ		8192
>  
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif /* HPPA_TARGET_SIGNAL_H */
> diff --git a/linux-user/mips/target_signal.h b/linux-user/mips/target_signal.h
> index 66e1ad44a6..4fdf15e279 100644
> --- a/linux-user/mips/target_signal.h
> +++ b/linux-user/mips/target_signal.h
> @@ -73,4 +73,10 @@ typedef struct target_sigaltstack {
>  /* compare linux/arch/mips/kernel/signal.c:setup_frame() */
>  #define TARGET_ARCH_HAS_SETUP_FRAME
>  #endif
> +
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif /* MIPS_TARGET_SIGNAL_H */
> diff --git a/linux-user/mips64/target_signal.h b/linux-user/mips64/target_signal.h
> index 753e91fbd6..93c64df3b7 100644
> --- a/linux-user/mips64/target_signal.h
> +++ b/linux-user/mips64/target_signal.h
> @@ -68,4 +68,9 @@ typedef struct target_sigaltstack {
>  #define TARGET_MINSIGSTKSZ    2048
>  #define TARGET_SIGSTKSZ       8192
>  
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif /* MIPS64_TARGET_SIGNAL_H */
> diff --git a/linux-user/sparc/target_signal.h b/linux-user/sparc/target_signal.h
> index 5cc40327d2..a465d699d2 100644
> --- a/linux-user/sparc/target_signal.h
> +++ b/linux-user/sparc/target_signal.h
> @@ -68,4 +68,10 @@ typedef struct target_sigaltstack {
>  #define TARGET_SIGSTKSZ		16384
>  
>  #define TARGET_ARCH_HAS_SETUP_FRAME
> +
> +/* bit-flags */
> +#define TARGET_SS_AUTODISARM (1U << 31) /* disable sas during sighandling */
> +/* mask for all SS_xxx flags */
> +#define TARGET_SS_FLAG_BITS  TARGET_SS_AUTODISARM
> +
>  #endif /* SPARC_TARGET_SIGNAL_H */
> 

Applied with the part for linux-user/generic/signal.h from your other patch to my linux-user-for-6.0
branch.

Thanks,
Laurent


