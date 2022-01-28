Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653549F50E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 09:23:06 +0100 (CET)
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDMXA-0006EJ-IN
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 03:23:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDMM8-0000ar-C8
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:11:41 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDMLy-000418-3S
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 03:11:39 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MTzve-1mmRq11LbW-00R3TD; Fri, 28 Jan 2022 09:10:47 +0100
Message-ID: <8f621c66-0b16-3f5d-c75f-84bc29af7062@vivier.eu>
Date: Fri, 28 Jan 2022 09:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] linux-user: Implement starttime field in self stat
 emulation
Content-Language: fr
To: Cameron Esfahani <dirty@apple.com>, qemu-devel@nongnu.org
References: <20220128001251.45165-1-dirty@apple.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220128001251.45165-1-dirty@apple.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zNWbSydpEHiv2rEMsxk8BG/HNXeYbAMWRmknLTaJVcUADHOT15+
 +EkORcX80fv1BUUhb62PtPVD1EbvInmzdcy/36hfJ54PJIYZJkrPog/sEszviMZp6ybdeu4
 9dChBKw5ftPgIJWIAhjc5t6N2B4AXXQxwUteLUZ7YTOJnk6S+XyBxkLrWBUbSaS4Mg/FDqy
 UbjyatukNHlmckAqSiJww==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Jh8VJVoGEeg=:bSC6bmpzeTrShfJpmEzq9Q
 T/K+Ci7d1xIegJdhuMS8ZZOHVKfDAWFQrUA6iIOqCkkPOJv1lqFTq70wGKwcMRo0cJ9j0WSB2
 02/+ZB93csim7RyeZyFLPNYXNnBtEjjeDRbRO9ixJR7YaZoBP/zN/6uv7KWFeImYrH/kizz07
 KbVyOGqZVijZG0Men/rZ754qAsPb1wp4CAzjEPNRoTXu+ruIkObRsvxNQ1VyMXQhVdTH5Y25Q
 TUXLAI+V83pRa58wnUgAOiHHXjqp2Of49N/0X0HR9l9+w+3ktpnYfzBQJ99K5ZVpig+/lsI66
 X5n7F1vE5aNG7J6oK0u6ohniu1M9dZWFx9BzGaDoNdzBQiNlUNb0fc7P3lJJwdz1CzISJFVMx
 1fNSnWOyFvmkyuS8EHKdiEwi6LdgEnT21dy9BzTrjThGIa9CxjckdpOap75F6XkAxVxBrXh4O
 4s0MV6ZS+Gh/wMETlRWx1gI22W+flSdsF3PcUYpK4n8dDxIPVojKme4A5mdmM0m7QCvwr/Ffq
 q7n9E/ph8AmumFJ9MqqCrhbcCZ1vAdgjMOI5ZYIVPfed3yyDLOcJEWH34sJRInOXI2IuYkw6m
 m0UuXSlR177/ia/mp7TyI0zpFpcWiqC5uOnMY9mG3KnTuFVGnTIZuDYc3yXjZLAuLI1jYtskG
 vgot+HOq94t2Tgmbnqed0HTR7FAFJ/RoLRXrUQUpELme37WPsc3Cyf87yCltF6kcxR70=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 28/01/2022 à 01:12, Cameron Esfahani a écrit :
> Instead of always returning 0, return actual starttime.
> 
> v3: Fix formatting issues
> v2: Use clock_gettime() instead of scanning /proc/self/stat
> 
> Signed-off-by: Cameron Esfahani <dirty@apple.com>
> ---
>   linux-user/main.c    | 14 ++++++++++++++
>   linux-user/qemu.h    |  3 +++
>   linux-user/syscall.c |  3 +++
>   3 files changed, 20 insertions(+)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 16def5215d..fbc9bcfd5f 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -190,12 +190,26 @@ void stop_all_tasks(void)
>   /* Assumes contents are already zeroed.  */
>   void init_task_state(TaskState *ts)
>   {
> +    long ticks_per_sec;
> +    struct timespec bt;
> +
>       ts->used = 1;
>       ts->sigaltstack_used = (struct target_sigaltstack) {
>           .ss_sp = 0,
>           .ss_size = 0,
>           .ss_flags = TARGET_SS_DISABLE,
>       };
> +
> +    /* Capture task start time relative to system boot */
> +
> +    ticks_per_sec = sysconf(_SC_CLK_TCK);
> +
> +    if ((ticks_per_sec > 0) && !clock_gettime(CLOCK_BOOTTIME, &bt)) {
> +        /* start_boottime is expressed in clock ticks */
> +        ts->start_boottime = bt.tv_sec * (uint64_t) ticks_per_sec;
> +        ts->start_boottime += bt.tv_nsec * (uint64_t) ticks_per_sec /
> +                              NANOSECONDS_PER_SECOND;
> +    }
>   }
>   
>   CPUArchState *cpu_copy(CPUArchState *env)
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 7910ce59cc..106175406a 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -158,6 +158,9 @@ typedef struct TaskState {
>   
>       /* This thread's sigaltstack, if it has one */
>       struct target_sigaltstack sigaltstack_used;
> +
> +    /* Start time of task after system boot in clock ticks */
> +    uint64_t start_boottime;
>   } __attribute__((aligned(16))) TaskState;
>   
>   abi_long do_brk(abi_ulong new_brk);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 5950222a77..7b3dbc72d4 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8107,6 +8107,9 @@ static int open_self_stat(void *cpu_env, int fd)
>           } else if (i == 3) {
>               /* ppid */
>               g_string_printf(buf, FMT_pid " ", getppid());
> +        } else if (i == 21) {
> +            /* starttime */
> +            g_string_printf(buf, "%" PRIu64 " ", ts->start_boottime);
>           } else if (i == 27) {
>               /* stack bottom */
>               g_string_printf(buf, TARGET_ABI_FMT_ld " ", ts->info->start_stack);

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

