Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E978632389B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 09:28:21 +0100 (CET)
Received: from localhost ([::1]:46478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEpWu-00020L-VX
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 03:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEpVG-0001TB-Ph
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:26:38 -0500
Received: from mail.ispras.ru ([83.149.199.84]:38190)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lEpVE-00033h-Jh
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 03:26:38 -0500
Received: from [10.12.39.188] (unknown [85.142.117.224])
 by mail.ispras.ru (Postfix) with ESMTPSA id 90D7740755E0;
 Wed, 24 Feb 2021 08:26:27 +0000 (UTC)
Subject: Re: [PATCH v2] replay: notify CPU on event
To: qemu-devel@nongnu.org
References: <161346807047.1296085.955420533772419632.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <28b28cbe-5d08-bd60-0abd-fbba628b4d67@ispras.ru>
Date: Wed, 24 Feb 2021 11:26:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161346807047.1296085.955420533772419632.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 16.02.2021 12:34, Pavel Dovgalyuk wrote:
> This patch enables vCPU notification to wake it up
> when new async event comes in replay mode.
> 
> The motivation of this patch is the following.
> Consider recorded block async event. It is saved into the log
> with one of the checkpoints. This checkpoint may be passed in
> vCPU loop. In replay mode when this async event is read from
> the log, and block thread task is not finished yet, vCPU thread
> goes to sleep. That is why this patch adds waking up the vCPU
> to process this finished event.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   replay/replay-events.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/replay/replay-events.c b/replay/replay-events.c
> index a1c6bb934e..92dc800219 100644
> --- a/replay/replay-events.c
> +++ b/replay/replay-events.c
> @@ -126,6 +126,7 @@ void replay_add_event(ReplayAsyncEventKind event_kind,
>   
>       g_assert(replay_mutex_locked());
>       QTAILQ_INSERT_TAIL(&events_list, event, events);
> +    qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>   }
>   
>   void replay_bh_schedule_event(QEMUBH *bh)
> 


