Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B04B430B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:42:02 +0100 (CET)
Received: from localhost ([::1]:50126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVzl-0005qN-SR
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:42:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nJVsS-00040d-Hr; Mon, 14 Feb 2022 02:34:28 -0500
Received: from mail.ispras.ru ([83.149.199.84]:36554)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nJVsQ-0008CI-BK; Mon, 14 Feb 2022 02:34:28 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 84F0D40755E6;
 Mon, 14 Feb 2022 07:34:15 +0000 (UTC)
Message-ID: <a59bb981-fe68-b75d-0e4c-f888e3e45fa0@ispras.ru>
Date: Mon, 14 Feb 2022 10:34:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/timer: fix a9gtimer vmstate
Content-Language: en-US
To: qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>
References: <164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <164422345976.2186660.1104517592452494510.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 07.02.2022 11:44, Pavel Dovgalyuk wrote:
> A9 gtimer includes global control field and number of per-cpu fields.
> But only per-cpu ones are migrated. This patch adds a subsection for
> global control field migration.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/timer/a9gtimer.c |   21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index 7233068a37..5e959b6d09 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -318,6 +318,12 @@ static void a9_gtimer_realize(DeviceState *dev, Error **errp)
>       }
>   }
>   
> +static bool vmstate_a9_gtimer_control_needed(void *opaque)
> +{
> +    A9GTimerState *s = opaque;
> +    return s->control != 0;
> +}
> +
>   static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
>       .name = "arm.cortex-a9-global-timer.percpu",
>       .version_id = 1,
> @@ -331,6 +337,17 @@ static const VMStateDescription vmstate_a9_gtimer_per_cpu = {
>       }
>   };
>   
> +static const VMStateDescription vmstate_a9_gtimer_control = {
> +    .name = "arm.cortex-a9-global-timer.control",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = vmstate_a9_gtimer_control_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(control, A9GTimerState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static const VMStateDescription vmstate_a9_gtimer = {
>       .name = "arm.cortex-a9-global-timer",
>       .version_id = 1,
> @@ -344,6 +361,10 @@ static const VMStateDescription vmstate_a9_gtimer = {
>                                        1, vmstate_a9_gtimer_per_cpu,
>                                        A9GTimerPerCPU),
>           VMSTATE_END_OF_LIST()
> +    },
> +    .subsections = (const VMStateDescription*[]) {
> +        &vmstate_a9_gtimer_control,
> +        NULL
>       }
>   };
>   
> 


