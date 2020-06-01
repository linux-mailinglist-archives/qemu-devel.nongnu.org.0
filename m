Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907F1EA1F3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jun 2020 12:36:56 +0200 (CEST)
Received: from localhost ([::1]:34582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfhoN-0000Br-Cb
	for lists+qemu-devel@lfdr.de; Mon, 01 Jun 2020 06:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1jfhnO-0007iI-UK
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:35:54 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33152)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1jfhnN-0003Jm-58
 for qemu-devel@nongnu.org; Mon, 01 Jun 2020 06:35:54 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id B0833CD461;
 Mon,  1 Jun 2020 13:35:48 +0300 (MSK)
Subject: Re: [PATCH] replay: notify the main loop when there are no
 instructions
To: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org
References: <159013007895.28110.2020104406699709721.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <c0867841-ae6c-5190-ab43-80b4c8e0fe43@ispras.ru>
Date: Mon, 1 Jun 2020 13:35:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <159013007895.28110.2020104406699709721.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=83.149.199.45; envelope-from=dovgaluk@ispras.ru;
 helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 06:35:49
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 22.05.2020 09:47, Pavel Dovgalyuk wrote:
> When QEMU is executed in console mode without any external event sources,
> main loop may sleep for a very long time. But in case of replay
> there is another event source - event log.
> This patch adds main loop notification when the vCPU loop has nothing
> to do and main loop should process the inputs from the event log.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> ---
>   0 files changed
>
> diff --git a/cpus.c b/cpus.c
> index 7ce0d569b3..b4d0d9f21b 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -1362,6 +1362,13 @@ static int64_t tcg_get_icount_limit(void)
>       }
>   }
>   
> +static void notify_aio_contexts(void)
> +{
> +    /* Wake up other AioContexts.  */
> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
> +    qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
> +}
> +
>   static void handle_icount_deadline(void)
>   {
>       assert(qemu_in_vcpu_thread());
> @@ -1370,9 +1377,7 @@ static void handle_icount_deadline(void)
>                                                         QEMU_TIMER_ATTR_ALL);
>   
>           if (deadline == 0) {
> -            /* Wake up other AioContexts.  */
> -            qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
> -            qemu_clock_run_timers(QEMU_CLOCK_VIRTUAL);
> +            notify_aio_contexts();
>           }
>       }
>   }
> @@ -1395,6 +1400,10 @@ static void prepare_icount_for_run(CPUState *cpu)
>           cpu->icount_extra = cpu->icount_budget - insns_left;
>   
>           replay_mutex_lock();
> +
> +        if (cpu->icount_budget == 0 && replay_has_checkpoint()) {
> +            notify_aio_contexts();
> +        }
>       }
>   }
>   
>

