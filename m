Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CF11D75C3
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 13:01:15 +0200 (CEST)
Received: from localhost ([::1]:35676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jadWE-0002hE-MO
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 07:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1jadTR-0000ox-Pf
 for qemu-devel@nongnu.org; Mon, 18 May 2020 06:58:21 -0400
Received: from mail.ispras.ru ([83.149.199.45]:48878)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1jadTQ-0002Nu-Nt
 for qemu-devel@nongnu.org; Mon, 18 May 2020 06:58:21 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id CA204CD469;
 Mon, 18 May 2020 13:58:19 +0300 (MSK)
Subject: Re: [PATCH] replay: synchronize on every virtual timer callback
To: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org
References: <158875304273.3986.105601155554744438.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <b1c20314-83d5-b4f1-218e-230e6cf2914a@ispras.ru>
Date: Mon, 18 May 2020 13:58:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158875304273.3986.105601155554744438.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=83.149.199.45; envelope-from=dovgaluk@ispras.ru;
 helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 06:58:11
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
Cc: pbonzini@redhat.com, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping


On 06.05.2020 11:17, Pavel Dovgalyuk wrote:
> Sometimes virtual timer callbacks depend on order
> of virtual timer processing and warping of virtual clock.
> Therefore every callback should be logged to make replay deterministic.
> This patch creates a checkpoint before every virtual timer callback.
> With these checkpoints virtual timers processing and clock warping
> events order is completely deterministic.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> ---
>   util/qemu-timer.c |    5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index d548d3c1ad..47833f338f 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -588,6 +588,11 @@ bool timerlist_run_timers(QEMUTimerList *timer_list)
>           qemu_mutex_lock(&timer_list->active_timers_lock);
>   
>           progress = true;
> +        /*
> +         * Callback may insert new checkpoints, therefore add new checkpoint
> +         * for the virtual timers.
> +         */
> +        need_replay_checkpoint = timer_list->clock->type == QEMU_CLOCK_VIRTUAL;
>       }
>       qemu_mutex_unlock(&timer_list->active_timers_lock);
>   
>

