Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6181D75B8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 12:59:20 +0200 (CEST)
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jadUN-0001b3-Sa
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 06:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovgaluk@ispras.ru>)
 id 1jadTN-0000ix-Fe
 for qemu-devel@nongnu.org; Mon, 18 May 2020 06:58:17 -0400
Received: from mail.ispras.ru ([83.149.199.45]:48860)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dovgaluk@ispras.ru>) id 1jadTL-0002K0-Nm
 for qemu-devel@nongnu.org; Mon, 18 May 2020 06:58:17 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 079CBCD464;
 Mon, 18 May 2020 13:58:10 +0300 (MSK)
Subject: Re: [PATCH] icount: fix shift=auto for record/replay
To: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>, qemu-devel@nongnu.org
References: <158875154623.957.4036561733593052357.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Message-ID: <323b0733-07a5-b7fc-9781-2a33e5338a02@ispras.ru>
Date: Mon, 18 May 2020 13:58:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158875154623.957.4036561733593052357.stgit@pasha-ThinkPad-X280>
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
Cc: pbonzini@redhat.com, pavel.dovgaluk@ispras.ru, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping


On 06.05.2020 10:52, Pavel Dovgalyuk wrote:
> This patch fixes shift=auto when record/replay is enabled.
> Now user does not need to guess the best shift value.
>
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
> ---
>   cpus.c |    4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/cpus.c b/cpus.c
> index 5670c96bcf..dfb9f4717f 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -379,7 +379,8 @@ static void icount_adjust(void)
>   
>       seqlock_write_lock(&timers_state.vm_clock_seqlock,
>                          &timers_state.vm_clock_lock);
> -    cur_time = cpu_get_clock_locked();
> +    cur_time = REPLAY_CLOCK_LOCKED(REPLAY_CLOCK_VIRTUAL_RT,
> +                                   cpu_get_clock_locked());
>       cur_icount = cpu_get_icount_locked();
>   
>       delta = cur_icount - cur_time;
> @@ -685,6 +686,7 @@ static const VMStateDescription icount_vmstate_timers = {
>       .fields = (VMStateField[]) {
>           VMSTATE_INT64(qemu_icount_bias, TimersState),
>           VMSTATE_INT64(qemu_icount, TimersState),
> +        VMSTATE_INT16(icount_time_shift, TimersState),
>           VMSTATE_END_OF_LIST()
>       },
>       .subsections = (const VMStateDescription*[]) {
>

