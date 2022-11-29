Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED263BA0A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 07:57:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozuXO-0000eC-3n; Tue, 29 Nov 2022 01:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ozuXM-0000dQ-59
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 01:56:12 -0500
Received: from mail.ispras.ru ([83.149.199.84])
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1ozuXJ-0002hR-Fm
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 01:56:11 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9A2A9419E9FA;
 Tue, 29 Nov 2022 06:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 9A2A9419E9FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1669704941;
 bh=yX3rY0lgLK75vuWqjt/AohiFgoHTkKL9UCdGibKctMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=c9QUQg41PwPViq87a9+CCgX1qN0T3dHsLPbxGtoAaZuX6ivM54kqd2+utfasL+C1m
 1O1fCNPWmPi3ePQMHXvOsA1XVLi2NntTDWK3DOYEVUt2T8jL/onmu6gTZDUYhVzWed
 /tlFX87dccOWgjloUoh1TGIWUSjLI0KX6lTBOdIQ=
Message-ID: <7919b4ed-4a14-c2b1-651b-6e5633eced51@ispras.ru>
Date: Tue, 29 Nov 2022 09:55:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-7.2] replay: Fix declaration of replay_read_next_clock
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pavel.dovgaluk@ispras.ru, stefanha@gmail.com
References: <20221129010547.284051-1-richard.henderson@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <20221129010547.284051-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

On 29.11.2022 04:05, Richard Henderson wrote:
> Fixes the build with gcc 13:
> 
> replay/replay-time.c:34:6: error: conflicting types for  \
>    'replay_read_next_clock' due to enum/integer mismatch; \
>    have 'void(ReplayClockKind)' [-Werror=enum-int-mismatch]
>     34 | void replay_read_next_clock(ReplayClockKind kind)
>        |      ^~~~~~~~~~~~~~~~~~~~~~
> In file included from ../qemu/replay/replay-time.c:14:
> replay/replay-internal.h:139:6: note: previous declaration of \
>    'replay_read_next_clock' with type 'void(unsigned int)'
>    139 | void replay_read_next_clock(unsigned int kind);
>        |      ^~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 8eda206e090 ("replay: recording and replaying clock ticks")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   replay/replay-internal.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/replay/replay-internal.h b/replay/replay-internal.h
> index 89e377be90..b6836354ac 100644
> --- a/replay/replay-internal.h
> +++ b/replay/replay-internal.h
> @@ -136,7 +136,7 @@ bool replay_next_event_is(int event);
>   /*! Reads next clock value from the file.
>       If clock kind read from the file is different from the parameter,
>       the value is not used. */
> -void replay_read_next_clock(unsigned int kind);
> +void replay_read_next_clock(ReplayClockKind kind);
>   
>   /* Asynchronous events queue */
>   


