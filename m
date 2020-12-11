Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C9E2D8140
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 22:45:31 +0100 (CET)
Received: from localhost ([::1]:54976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knqED-0003kX-Pl
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 16:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knqAk-0002IA-8x
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:41:54 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knqAd-0006sO-JV
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 16:41:53 -0500
Received: by mail-ot1-x343.google.com with SMTP id h18so9598151otq.12
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 13:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1wZQo08W4y18MFXQvXuGaqmeyVDr030sK43u1+GHIEU=;
 b=VrZBKe67V0jCJxp4AP7ZhaFnaFo0RRX+tnb7H/J9nJlwIMhWldCaiPKLjIZQi5EJFf
 wRNhbFdRwWjNqPLcZQcMPa6R7eDE7krC08IOVzdbNN2/s7SrpCg+iuhiJJu53+piMvqM
 928nd5aR73JvktpvwNdCbJjMgLlpjTPP5TbPEglY1ovi41r8ZB+Ew2fh2CLXunzcK9vS
 noQ7Czl39ugu1CFvsAV9QD3HYNqqfnVWGpc0FkTFwM3Ie8JDiLB1CmmbIF4QrvBdC1qJ
 LCjZKlvC7vgPIoADkpVanLeDFf5xAPoNp1fQyDcFdy7VAhKEx6aZ5OShVXAbwJ7koNCB
 vZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1wZQo08W4y18MFXQvXuGaqmeyVDr030sK43u1+GHIEU=;
 b=ofHJn5JM4YFv8g4/S2SJyvv2+Q+rEWHGIE2HImgwUPLy6qpWPAeUsUK/sN84MOc8WW
 FCWzWCy5s2YrvpZwkpAZvrwyYGc769WIsCYaiHpaOkP+hbWdgFsVXbHqKw+I7gV4TMyb
 3+XyimiIp+cOAQV4NTfBSbFL4jqTuzChRA0iDWbi/J2yIo9672QxAbtynPF6Ccq4ynOD
 2DUWYfhwyuWhzOCEXwgx09GmcQzD1gmON1EbqnWa+Bz3FNVMiiA4awJ22aQKDLkgjA9O
 sl01l8k5VglqD88KIS25rSoiajCZo8W8c1A4WzxZYlDFC9zCLQEEGFGuDxh8IukVYrcP
 jsfw==
X-Gm-Message-State: AOAM533tPjqgZ6ccf3+X+2689IbwKizh7rGJ0YSNwVbXZw05ERVOHAEm
 ke1qybpX50sapatO/HbpR3q8lQ==
X-Google-Smtp-Source: ABdhPJwcgNyQHPKy/uQRLag+cvdjUdPWmJnPP9xVXHOFL9uwJnM+9xZxK3Z+PiZdWk9mR9KhbJMMLA==
X-Received: by 2002:a9d:506:: with SMTP id 6mr10796575otw.95.1607722901208;
 Fri, 11 Dec 2020 13:41:41 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y204sm2116898oiy.38.2020.12.11.13.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 13:41:40 -0800 (PST)
Subject: Re: [PATCH] icount: improve exec nocache usage
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bce56bb4-dd59-d408-ca17-1df944ef6259@linaro.org>
Date: Fri, 11 Dec 2020 15:41:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/8/20 3:10 AM, Pavel Dovgalyuk wrote:
> cpu-exec tries to execute TB without caching when current
> icount budget is over. But sometimes refilled budget is big
> enough to try executing cached blocks.
> This patch checks that instruction budget is big enough
> for next block execution instead of just running cpu_exec_nocache.
> It halves the number of calls of cpu_exec_nocache function
> during tested OS boot scenario.
> 
> Signed-off-by: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
> ---
>  accel/tcg/cpu-exec.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 58aea605d8..251b340fb9 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -685,7 +685,7 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>      insns_left = MIN(0xffff, cpu->icount_budget);
>      cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>      cpu->icount_extra = cpu->icount_budget - insns_left;
> -    if (!cpu->icount_extra) {
> +    if (!cpu->icount_extra && insns_left < tb->icount) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I also wonder if we should really be not caching these.  Ever since MTTCG, we
have not actually been reusing the memory.  We're simply removing the TB from
the hash table.  I think we should be remembering these just in case we can in
fact reuse them.


r~


