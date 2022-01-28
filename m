Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D854449F700
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 11:17:18 +0100 (CET)
Received: from localhost ([::1]:35422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDOJh-00058g-Fh
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 05:17:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDOGc-0002un-6w
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:14:06 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:38147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nDOGa-0005kS-EZ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:14:05 -0500
Received: from [192.168.100.1] ([82.142.25.174]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWz4j-1mkVVm3vB3-00XHH5; Fri, 28 Jan 2022 11:14:00 +0100
Message-ID: <aecbe24d-c05a-7704-80bc-9fe66b55d28b@vivier.eu>
Date: Fri, 28 Jan 2022 11:13:59 +0100
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
X-Provags-ID: V03:K1:v/vHyjGCEZ0w6Q0VmW56oB31C6j4iTTLThaicvi7/s6OAnV9zA3
 5UEIMgD3iFWrSVNw+4wrRo+ZrG+8j40HsZPxNUCILeZJiglampcYNhskatrQ6GY00dgvkT6
 8Kv1rQCPIgSOD331+Zi62hu+L+tJVZz8g/Xugd17RvtB5Im2Ks+v80wLJLgmZbeaCgMEsub
 Z8dzbAGKfz4bxe2qjrfvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WleBrX6PxeI=:R92y6+Jj4/wnSHMRCkNeGD
 mi/q+ZQexChr0i3WWPlVkcyEFeeN5KIf1fd14iO5M2bpsNSuDMS0rysw1V8O4xcpsyGe0KvKr
 VrE65iF8Y3zYQ2u3rDonzjK/zbaLC3U+4UjQakXmPWMkuckN3qzIW9z7JryUfBxfor/1Qu8Jo
 i4O6oL6F5gKh2I7sBZ5gVBOokxmQEVim33/ALlqzHibDQIBR4oMXt2OapI4OjoKQyBV6MLpLD
 GNd9+xto8Hs+q83DAOQj4YaS1a+AG7v7MynWnyvRSJdm87do7QAwOf/YmtkmIFvU4TFbqHtgK
 H9+W2cs7Toa+75F2n2qrVjQrN3QKS3bGxgui4oqqxJYOHEPpAOwfd/vJfAt+nhKFxkhgp3bfB
 y7dZZc4FJb1W0tKoLEDaMmjxTbyOjh/eJuZyPCCSfO+/ckVrh4HNduQFX2NPLyOV8nX7C78Qd
 ibeLos+3r6wYrSMsHg8OCSR7mbtC20kPvrIGlgsiyQZZYBm1nb1Be+ncZ/CUE68FtDcvh8Dkj
 2jdqoyNM5K67+iQQMcpUpafRs2Njlx0ik2F23ZcWzm45w7T2TSJQh8JyxIyBFi/wOyFVIhAIq
 3WDtpGIbFVcMQbhGO8LE9foLcQuaaVWOF5TpSg/sak2cR4Qb2BP5sHs4/3TVOxtQc/zw358KU
 dOvjPxq4gOXZXHgKLFtoCq+FJ0dfrPy5NymlxsfAsiQyH0yBWjA8nmRH+gnPZMxMpeO8=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

For your next contribution: move version information after the "---" to not clutter the commit message.

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent

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


