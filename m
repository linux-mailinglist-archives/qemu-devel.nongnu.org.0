Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E99587972
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:58:41 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInjd-0000K5-3L
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:58:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1oInZh-0003su-Nr
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:48:29 -0400
Received: from mail.ispras.ru ([83.149.199.84]:57240)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1oInZe-0003J2-4M
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 04:48:24 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id B8A7E40D403D;
 Tue,  2 Aug 2022 08:47:49 +0000 (UTC)
Message-ID: <1202e58a-d012-e303-9b98-f9d39fba84c0@ispras.ru>
Date: Tue, 2 Aug 2022 11:47:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.1] icount: Take iothread lock when running QEMU
 timers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20220801164527.3134765-1-peter.maydell@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20220801164527.3134765-1-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

On 01.08.2022 19:45, Peter Maydell wrote:
> The function icount_prepare_for_run() is called with the iothread
> unlocked, but it can call icount_notify_aio_contexts() which will
> run qemu timer handlers. Those are supposed to be run only with
> the iothread lock held, so take the lock while we do that.
> 
> Since icount mode runs everything on a single thread anyway,
> not holding the lock is likely mostly not going to introduce
> races, but it can cause us to trip over assertions that we
> do hold the lock, such as the one reported in issue 1130.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1130
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
> index 8f1dda4344c..84cc7421be8 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -109,7 +109,13 @@ void icount_prepare_for_run(CPUState *cpu)
>       replay_mutex_lock();
>   
>       if (cpu->icount_budget == 0) {
> +        /*
> +         * We're called without the iothread lock, so must take it while
> +         * we're calling timer handlers.
> +         */
> +        qemu_mutex_lock_iothread();
>           icount_notify_aio_contexts();
> +        qemu_mutex_unlock_iothread();
>       }
>   }
>   


