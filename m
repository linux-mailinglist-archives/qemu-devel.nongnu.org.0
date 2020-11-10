Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2D82ADCAA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 18:13:34 +0100 (CET)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcXD2-0003fa-Ny
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 12:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcX3w-0004jC-8d
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:04:08 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kcX3u-0007ZU-3S
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 12:04:07 -0500
Received: from [192.168.100.1] ([82.252.154.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N7yuz-1kG6FJ21Ol-0150jZ; Tue, 10 Nov 2020 18:03:58 +0100
Subject: Re: [PATCH] linux-user: Prevent crash in epoll_ctl
To: LemonBoy <thatlemon@gmail.com>, qemu-devel@nongnu.org
References: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d5d5d4b2-f07b-62b4-3604-4e6963ae68fa@vivier.eu>
Date: Tue, 10 Nov 2020 18:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a244fa67-dace-abdb-995a-3198bd80fee8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:aTtiw+ATN6CvUZ6kM8j5lVJnHYlREbdF3b8wL2vlctkAMhMCJsx
 34UUB6wlWwHI+KqslQOPkK4O1U6wC1VaHMixAkPbUb99A9SsE/A0xKWfx0fifwRaMA1jkZA
 B9SOmA4mmn31CKQxjKCvFJVUbpC9sGV63mbF61ug81CNgPvQTTpJLVISYooRJDrULU3UDWK
 3iaZo2ybF2AR0llgreb+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:U02uwIrRbtE=:tKHCugEMWT0/TiaA/yJuSg
 tkmV/M2GSZ9epOvUKRnFdY4ObKt61mme9OVnVnjVNxdbxYGZR1LS+1Dxqj0ZBt84TOnXqDYsy
 HUhrSvnEBKcT0/JuURnQMYRo1tS+RY12lbvuyMHJxbm2QwowuT9+Y4E+ioLDijjzfiUik+Vkt
 CZi67aMeUEy9UXrnUf+hrDc/4V/HgZ7JbKLwapXH7oEYSl+4NCk6n8WuFwIC8WZeXGfnvwj9l
 nzd2b07Bw7CDTeUnULnOcLLlK5NQJX21lKGk7TtrBedcndkvJGwwWALrM/YovxAXsmn7FSaIX
 PAecu+Wbmmfqv0qsCdBVWi5YM6b5mXxPkbh+k1CVRgolROO1w7GfsRugU6/+KhVLFydh5b19d
 eVlyjmma71GMuVCuoQ6lxfezePfW+qIS62PtR6KT6CutAORA1Uo5mTvcYMiEI/5Aj2Zj/7rhl
 UyuwUR859g==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 12:04:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

Le 17/04/2020 à 17:34, LemonBoy a écrit :
> From 894bb5172705e46a3a04c93b4962c0f0cafee814 Mon Sep 17 00:00:00 2001
> From: Giuseppe Musacchio <thatlemon@gmail.com>
> Date: Fri, 17 Apr 2020 17:25:07 +0200
> Subject: [PATCH] linux-user: Prevent crash in epoll_ctl
> 
> The `event` parameter is ignored by the kernel if `op` is EPOLL_CTL_DEL,
> do the same and avoid returning EFAULT if garbage is passed instead of a
> valid pointer.
> 
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  linux-user/syscall.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 674f70e70a..a51ff43f9b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -12020,17 +12020,25 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>          struct epoll_event ep;
>          struct epoll_event *epp = 0;
>          if (arg4) {
> -            struct target_epoll_event *target_ep;
> -            if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
> -                return -TARGET_EFAULT;
> +            if (arg2 != EPOLL_CTL_DEL) {
> +                struct target_epoll_event *target_ep;
> +                if (!lock_user_struct(VERIFY_READ, target_ep, arg4, 1)) {
> +                    return -TARGET_EFAULT;
> +                }
> +                ep.events = tswap32(target_ep->events);
> +                /*
> +                 * The epoll_data_t union is just opaque data to the kernel,
> +                 * so we transfer all 64 bits across and need not worry what
> +                 * actual data type it is.
> +                 */
> +                ep.data.u64 = tswap64(target_ep->data.u64);
> +                unlock_user_struct(target_ep, arg4, 0);
>              }
> -            ep.events = tswap32(target_ep->events);
> -            /* The epoll_data_t union is just opaque data to the kernel,
> -             * so we transfer all 64 bits across and need not worry what
> -             * actual data type it is.
> +            /*
> +             * before kernel 2.6.9, EPOLL_CTL_DEL operation required a
> +             * non-null pointer, even though this argument is ignored.
> +             *
>               */
> -            ep.data.u64 = tswap64(target_ep->data.u64);
> -            unlock_user_struct(target_ep, arg4, 0);
>              epp = &ep;
>          }
>          return get_errno(epoll_ctl(arg1, arg2, arg3, epp));
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

