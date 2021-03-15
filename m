Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBF833AB5B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:00:57 +0100 (CET)
Received: from localhost ([::1]:53064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgHg-0006mo-Ic
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgGL-0006NQ-U6
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:59:33 -0400
Received: from mail.ispras.ru ([83.149.199.84]:58086)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lLgGI-0000XJ-R0
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 01:59:33 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 0B2F140D403D;
 Mon, 15 Mar 2021 05:59:24 +0000 (UTC)
Subject: Re: [PATCH] replay: don't wait in run_on_cpu
To: qemu-devel@nongnu.org
References: <161544684811.80476.11634004581744007934.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <e7fa6729-2e22-1ee9-a0cd-e213146f30f2@ispras.ru>
Date: Mon, 15 Mar 2021 08:59:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161544684811.80476.11634004581744007934.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 11.03.2021 10:14, Pavel Dovgalyuk wrote:
> In record/replay mode waiting for vCPU to execute
> the task scheduled by run_on_cpu may lead to deadlock,
> because when run_on_cpu is executed in main_loop
> (e.g., in loadvm processing) it holds replay mutex.
> This patch allows running scheduled task in iothread
> when it holds the replay mutex.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   cpus-common.c            |    9 ++++++++-
>   include/sysemu/replay.h  |    1 +
>   replay/replay-internal.h |    1 -
>   stubs/replay-tools.c     |    5 +++++
>   4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/cpus-common.c b/cpus-common.c
> index 6e73d3e58d..38ff510175 100644
> --- a/cpus-common.c
> +++ b/cpus-common.c
> @@ -23,6 +23,7 @@
>   #include "hw/core/cpu.h"
>   #include "sysemu/cpus.h"
>   #include "qemu/lockable.h"
> +#include "sysemu/replay.h"
>   
>   static QemuMutex qemu_cpu_list_lock;
>   static QemuCond exclusive_cond;
> @@ -136,7 +137,13 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func func, run_on_cpu_data data,
>   {
>       struct qemu_work_item wi;
>   
> -    if (qemu_cpu_is_self(cpu)) {
> +    if (qemu_cpu_is_self(cpu)
> +        /*
> +         * vCPU thread is waiting when replay mutex is locked
> +         * and the task is not exclusive, the function may be called
> +         * without other synchronization.
> +         */
> +        || (replay_mode != REPLAY_MODE_NONE && replay_mutex_locked())) {
>           func(cpu, data);
>           return;
>       }
> diff --git a/include/sysemu/replay.h b/include/sysemu/replay.h
> index 0f3b0f7eac..032256533b 100644
> --- a/include/sysemu/replay.h
> +++ b/include/sysemu/replay.h
> @@ -62,6 +62,7 @@ extern char *replay_snapshot;
>   
>   void replay_mutex_lock(void);
>   void replay_mutex_unlock(void);
> +bool replay_mutex_locked(void);
>   
>   /* Replay process control functions */
>   
> diff --git a/replay/replay-internal.h b/replay/replay-internal.h
> index 97649ed8d7..dada623527 100644
> --- a/replay/replay-internal.h
> +++ b/replay/replay-internal.h
> @@ -117,7 +117,6 @@ void replay_get_array_alloc(uint8_t **buf, size_t *size);
>    * synchronisation between vCPU and main-loop threads. */
>   
>   void replay_mutex_init(void);
> -bool replay_mutex_locked(void);
>   
>   /*! Checks error status of the file. */
>   void replay_check_error(void);
> diff --git a/stubs/replay-tools.c b/stubs/replay-tools.c
> index 43296b3d4e..a42f2483d5 100644
> --- a/stubs/replay-tools.c
> +++ b/stubs/replay-tools.c
> @@ -48,6 +48,11 @@ void replay_mutex_unlock(void)
>   {
>   }
>   
> +bool replay_mutex_locked(void)
> +{
> +    return false;
> +}
> +
>   void replay_register_char_driver(Chardev *chr)
>   {
>   }
> 


