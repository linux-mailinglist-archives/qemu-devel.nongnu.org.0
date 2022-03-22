Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78D4E3C17
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:01:27 +0100 (CET)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWbKO-0007hU-Oj
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:01:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWbHX-0005fx-C4
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:58:27 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nWbHV-0003oU-HF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 05:58:26 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MNtjq-1nhduX2DDE-00OHzb; Tue, 22 Mar 2022 10:58:21 +0100
Message-ID: <831d87d4-49fb-e738-bed8-2b5af96bfa4f@vivier.eu>
Date: Tue, 22 Mar 2022 10:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] linux-user/alpha: Fix sigsuspend for big-endian hosts
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220315084308.433109-1-richard.henderson@linaro.org>
 <20220315084308.433109-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220315084308.433109-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:dCYMxIhgkgoaVRd88/YwaIULTVAh+KDWU6+e3qDHYy3nHaP48WH
 e3UNFqBbevAeL7mb6wEnvKKxSlrowktyOVjx0TYO0YE9tvkLmcqVJqlSIN6l0W55UgxNKHF
 i+r4XvKkLT5C2NN1Bd1dF6bOGz+GxDsZ9WU/rMW99WKVpUQ1sIIC2lBG+WFbeloxQA7C3LJ
 ZZJ+Ay+Nb8wujgHjcYP+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ezWrFYlv7PM=:mOQ/6x78+4BShenTVFzQaJ
 lgJo7sUyQtknxd2HqDt6sApR8r6FKlAtQMuJ8O78mg3sD49BYqBbKObkv6CbrCO+3Uvj+yj/p
 4w3eFc9OKtwftmP6g6mxG5WVYVTQWBONxajMlTe+YC/Qlx1VpqxSTexkn/35XQEog2dsygqr1
 KmR6qAB6L9CwHWGhKBvdvbN96aoIFKkHYYO9bpib+A9xVrmLmNZuTPRHBsxv5GasCXesUqy7F
 pT8dC9nGyO/4NCKw75tOq3PrZmJKha6foein+/9BGSgPLCrcLZ3O3z30UgRHPzCgYIhTHwk0+
 G0sGkQoTmerPFKcC20hvz3IG9VjDfRTygULfrLNjWHsizX7NQOYjV7I32iD5DEwXhbA/stal5
 LL2I9bsajuZx6yF4QSOFvA7XbeWSoPBFL5Ga4lkUqBtzWqOtO9jH26oSuvUt9f5IYcQopRNae
 JbOfj0OU3qSM8U+IBMgMieQZb86VjX6dg5aPYhtL9rQBiEJw6abMlU4uuHoLS95S0FyAT3oEh
 NSa8vf9Li2QHtjIF2GhgCHNvClmp70R+UF9rb8emPG1Nr5Pp100KkhCuhsLFmnftExmt+JOjj
 Jg7LB/hYX/MHk4Ocz87PHuCWgXujMLKgTC/V6PzU8dEzzQlMWPDf3w7reJeVL1X6ir4wnp376
 ou4GT9HKbNCNMz+RYnjcgv3MOlF9U9/+MWbPqvezYf2Sv3dY/TuvAKao1OeAq6gWYOZ0=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 15/03/2022 à 09:43, Richard Henderson a écrit :
> On alpha, the sigset argument for sigsuspend is in a register.
> When we drop that into memory that happens in host-endianness,
> but target_to_host_old_sigset will treat it as target-endianness.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/syscall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index b9b18a7eaf..ecd00382a8 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -9559,7 +9559,8 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
>           {
>               TaskState *ts = cpu->opaque;
>   #if defined(TARGET_ALPHA)
> -            abi_ulong mask = arg1;
> +            /* target_to_host_old_sigset will bswap back */
> +            abi_ulong mask = tswapal(arg1);
>               target_to_host_old_sigset(&ts->sigsuspend_mask, &mask);
>   #else
>               if (!(p = lock_user(VERIFY_READ, arg1, sizeof(target_sigset_t), 1)))

And what about target_set in TARGET_NR_ssetmask, mask in TARGET_NR_sigprocmask and in 
TARGET_NR_osf_sigprocmask?

Thanks,
Laurent

