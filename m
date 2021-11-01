Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D38441F0F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:16:39 +0100 (CET)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhavG-0004GK-Df
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhagi-0002Ls-NE
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:01:36 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhagg-000175-SX
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:01:36 -0400
Received: by mail-qk1-x72c.google.com with SMTP id i9so16613797qki.3
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9CoSEE5xxU2Fe//d6ynBOQtvqF5jNIY6sP1r9R8epN4=;
 b=zVfuL3XKlj8klyf0Ghna0SjjUA93U7Cq5oQLYG6N+j0kS6rhQRKEfpMlAKpxrNzfNB
 dBpU2+fMTIDIz6iV8uXnE9/XjepttFGUx8bC0hBC6CsSeprOvRm4pMs6tHKHfb2QBtbD
 th2exdQmVt97Glo3beuBeaRYbXrCOCAmrK7ju6JjB4yv5aNpc0Ykz/JVRVM7ILqnmJ7f
 c53lxhMuN+s27AWPgBwFyhbfKAMvkih+b61oSRKICRqkWtMsP9qyqkWFFaTy2GBW8jje
 +S87A4esWdiKZMxcazYzqBK3ofeUoo+pEV0PHjaYfD6Nd7dUh6M9Xna3AjT8Wl+bMR2L
 vDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9CoSEE5xxU2Fe//d6ynBOQtvqF5jNIY6sP1r9R8epN4=;
 b=zrzTz+RN2L6wq8TA49amNjOYoaTWH70kjsgMTHodqj/kkBjSlz5JmQTQL1gyxhOHVC
 7ZNifSVvhbssMZJ+zkdQLBWymMNktOpMikhxKuHHuoU0PbimGvD41YRJpQfQayO7FrNI
 oxscbd+5YdytV4KdU13worpGSBcFFlX0M7fFgff+P+zZXRXyKMyg1jgWk8B389oE8pr6
 w+VWvz0NZ/PBavLlgS4QrLK49PR+1mWzCzTUY8P78P5lhQe8JWufFpGAl+Ic9CYZ90UP
 mm7DEmME0VC1VpA/Je6/aK6djqszWHLe/lIqfXpWDgtriajW+5iFw6xN8IBV9RLXd0B5
 Us7Q==
X-Gm-Message-State: AOAM5315M7DAw+PIc1K4WUP1oLVKc4zCC6Uq//jHjROs9RLp4v8bZhDy
 zTyHop9kxojNpseNjuoyo6au1w==
X-Google-Smtp-Source: ABdhPJzEb9A90v6btr4gHl33YMnYJ3NwzTRrcnT0N/z+bDZ1bPViWezKy5GjDhP9qF73xafOsqJAuA==
X-Received: by 2002:a37:9a88:: with SMTP id
 c130mr24797128qke.494.1635786093717; 
 Mon, 01 Nov 2021 10:01:33 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id m68sm10407103qkb.105.2021.11.01.10.01.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:01:33 -0700 (PDT)
Subject: Re: [PATCH 13/13] target/riscv: Enable uxl field write
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-14-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
Date: Mon, 1 Nov 2021 13:01:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-14-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>           mask |= MSTATUS_MPV | MSTATUS_GVA;
> +        if ((val ^ mstatus) & MSTATUS64_UXL) {
> +            mask |= MSTATUS64_UXL;
> +        }

Why do you need the conditional here?
Why is this not just

     mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;


>  static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>  {
> -    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);

Hmm.  Not sure about this.

It looks like we should in fact change mask, just a few lines down, at which point the 
extension (or not) for the source would not matter.  And likewise in trans_csrrwi.


r~

