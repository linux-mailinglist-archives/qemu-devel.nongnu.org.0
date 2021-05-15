Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301ED38171A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:12:51 +0200 (CEST)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqLo-0004Zr-Pg
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqK5-0003sm-Uo
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:11:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqK4-000757-9r
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:11:01 -0400
Received: by mail-wm1-x332.google.com with SMTP id u133so890172wmg.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ivc+p7vnjEAHC1z5qO/7bChA+e9/J245jFNksBnAbTo=;
 b=QI4acjqQ1garHmO7J51lZrhtp3uOhLFxu2n6ga1al1NUrXmBAUkiijmJWTCoUb+RVE
 cWB85+6RlLeMYzDBoz0qcacN9z130wpm010UEFnyRheo2v3CVoZWAeNOuJHXRySve5g8
 vYIIvvfBh1TxTylnkq/PzRjsw1xjGunWEeJw3QlCG67x0zlYIaiNc8ltoJ2qO4MWnhN7
 gnMoaEdhL6zAq4p02vtStKIQCME5iVHGnF9GK3r0r1wVxEQcsMdF8Cw7SqluYjAImNwN
 sRUd1dWR/itYlgkGhgHn9DkUZF5TFTT4OrH9mnU+LExHB08c1EwmHEF3AtMrDuN8hLoG
 Fxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ivc+p7vnjEAHC1z5qO/7bChA+e9/J245jFNksBnAbTo=;
 b=jjyz6dRkKCX5qLhq0JTd+jukg6BTiqZ4R4TzaN5GmGG7LFR83ErDgLFw8qqIf91xoM
 e7s0tIbAvQiXDHUT67rfP/xjI57NkdrkVjzxpHDil2zhud66PtegQ0lrjGKtr7t34Y/T
 swN+AxI5I1XnTr7G7/gveM4+0RQj3cWhgMHsaeN9YCbhCEmckw+bFv0YKxDp+f6q9Cbj
 XWIznwi/uNrailUAm5NQ1MGBAYBSskLwlTUaHwd9s4k+d2x4Ofoiy+WZjze56CZ3/FIC
 +EGhlSOuWK6TXmztoTQPcBlLa9BP5e/V5O2MaIEYm+MTlQyHb9s03ZWqU/hTi1ybYQIk
 cU2w==
X-Gm-Message-State: AOAM533cHVMnOQasqbcibZShx3buJfpLKaQOaTbSKODINLle1uekfB3q
 PZP9FU20EL0HqL+kRDXRE9hk0FEAGnp6Hw==
X-Google-Smtp-Source: ABdhPJyLbV69xi61MtLY71cNHr95pHmMGpenhkKPikxNxmkSrhrOyKLeavpa1vHYzDKBNMvtzKDw9A==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr13060758wmc.172.1621069858471; 
 Sat, 15 May 2021 02:10:58 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c22sm7424032wmb.10.2021.05.15.02.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:10:58 -0700 (PDT)
Subject: Re: [PATCH v6 01/26] tcg: Combine dh_is_64bit and dh_is_signed to
 dh_typecode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3d03f148-4461-c5a1-acf5-9bd0e169f203@amsat.org>
Date: Sat, 15 May 2021 11:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> We will shortly be interested in distinguishing pointers
> from integers in the helper's declaration, as well as a
> true void return.  We currently have two parallel 1 bit
> fields; merge them and expand to a 3 bit field.
> 
> Our current maximum is 7 helper arguments, plus the return
> makes 8 * 3 = 24 bits used within the uint32_t typemask.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/helper-head.h   | 37 +++++--------------
>  include/exec/helper-tcg.h    | 34 ++++++++---------
>  target/hppa/helper.h         |  3 --
>  target/i386/ops_sse_header.h |  3 --
>  target/m68k/helper.h         |  1 -
>  target/ppc/helper.h          |  3 --
>  tcg/tcg.c                    | 71 +++++++++++++++++++++---------------
>  7 files changed, 67 insertions(+), 85 deletions(-)

Nice. I've been looking for a definition name for the heavily
used magic '3', but using such definitions doesn't really
help in the code review, so we are better without it.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

