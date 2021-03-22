Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45F5343E1A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:39:00 +0100 (CET)
Received: from localhost ([::1]:60946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHxb-0002OC-Ls
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHen-0001xn-Ot
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:19:33 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHej-0000db-Ea
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:19:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id j18so16046070wra.2
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D0rFHSWev68TWzWIionm0g2o/d9J/79dSZN/3A7LZgA=;
 b=FTKfJdSzreA/mAA4/l1q2jpY3NUEXszl6/rwYd+MrvAmgVGmR9Hi1w6iNkhaBjFV1h
 08au2AjKWAZ9LIGERkuwqn1+r0Dq+xK+4r6A5QyE7Oy31HxgrlY8CBh476GiDRLGjImn
 UTFuVS1vY4+5l8nfiY+Ghxohfw95PJfDyRgpvX+ybIxsGL95jgUuvENmc7KT933yWnrR
 GMzqGqr/29EwkzgzbygbuEg05BWHISTz7Oe8KBMJp2R+hBGeqx2hPl09oxVA2ZZgoIIC
 zehHZykKwuudSSz4rgf+8IhkmmMA1Anq0gApDtUTkULIY4bEsYDvWyxGWn8c2yDTnkTn
 ltAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D0rFHSWev68TWzWIionm0g2o/d9J/79dSZN/3A7LZgA=;
 b=NTY00etTBrQ/0yYvHW5C+EAHFzxoYdyx2W+Au8PuIXFZAz4za0NUrcT8X6ujHDNG5B
 EwH04k4moGi1iHOTg3/qcVgexIhVO3Gc7dj9v4Jj951zWKQxn0TAGPONVwdTvDz0N7pu
 W0yNmW/NqBiyWz5re1uLvNxyXBbRU7EtvJ4V8s6QfoYkJZpGurqFp41JpeqDtvBSh2If
 tSUToImFhQnZOb5Y8VRBKxdolIKDP4VWUw1TDUAEAPP8UVpIK31auTaT7eR1gNUFUsAO
 P+IpLseAQZerCAIyKujPsHaMhWv0pS845SMzlHQEx/zlQuP4Xe6IQV3psGk1rS1iypai
 QIbw==
X-Gm-Message-State: AOAM533ZAEpAhKBzAshhONXzjsdQkmca1+Q6QqldAU8m7ag+80Tc+k9U
 sHxxjjDW2U9FTBo5VK03FZs=
X-Google-Smtp-Source: ABdhPJx22MD4Mb0vZO4LNakvnGg9i682l3aqmw6fA5yPsrpr+nnP6n88gWVPjaSLw9lUzC7TZBsDOg==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr14978252wru.259.1616408366983; 
 Mon, 22 Mar 2021 03:19:26 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h8sm19060097wrt.94.2021.03.22.03.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:19:26 -0700 (PDT)
Subject: Re: [PATCH] target/mips/mxu_translate.c: Fix array overrun for
 D16MIN/D16MAX
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210316131353.4533-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <649ba539-aafb-c3b1-d1db-2eb4d914370c@amsat.org>
Date: Mon, 22 Mar 2021 11:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316131353.4533-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 2:13 PM, Peter Maydell wrote:
> Coverity reported (CID 1450831) an array overrun in
> gen_mxu_D16MAX_D16MIN():
> 
>   1103     } else if (unlikely((XRb == 0) || (XRa == 0))) {
>   ....
>   1112         if (opc == OPC_MXU_D16MAX) {
>   1113             tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>   1114         } else {
>   1115             tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>   1116         }
> 
>>>> Overrunning array "mxu_gpr" of 15 8-byte elements at element
>     index 4294967295 (byte offset 34359738367) using index "XRa - 1U"
>     (which evaluates to 4294967295).
> 
> This happens because the code is confused about which of XRa, XRb and
> XRc is the output, and which are the inputs.  XRa is the output, but
> most of the conditions separating out different special cases are
> written as if XRc is the output, with the result that we can end up
> in the code path that assumes XRa is non-0 even when it is zero.
> 
> Fix the erroneous code, bringing it in to line with the structure
> used in functions like gen_mxu_S32MAX_S32MIN() and
> gen_mxu_Q8MAX_Q8MIN().
> 
> Fixes: CID 1450831
> Fixes: bb84cbf38505bd1d8
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> NB: tested with 'make check' and 'make check-acceptance' only, which
> almost certainly don't exercise this code path.
> 
>  target/mips/mxu_translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to mips-fixes.

