Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020F5B57F5
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:13:07 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgR8-0002ul-5C
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgHD-0001OQ-9g
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:02:54 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgH4-00045W-5o
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:02:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id o25so14483338wrf.9
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=FWLQYhwBRaetWYprJwFBEr4+bN1sxLQ/wMSCN9D4j8Q=;
 b=oFoKZ0KHaT48Y9emJa/V6eKPlUUQir6zN+V/kLgEacHsgEc516artxdk5HlbYro3ab
 Y2FjVsbCCwLYwRlf3kc5iY+HnGvrsWLKxYWBAMmLa8TRBPhRKdf4E5GjN7/9gt5ndplA
 rluDR65Vfdq3D0/IXYIEqZWGr9tzfA81yv8f4mZjEHMjSg0Hy4e5sZ/RTQQ/GQxfiXCL
 ITYDf8D+mIHdBdeLComFYpwfwURQAtnD1hzJe2URJKWYTxlF4AWtC+0mguPJZ1JMI1bj
 bYw/DFnwwZrr885w6Hl0wgWkrBK0G/xz8JLyKJJ3UrKbKqcC7JO++L28JnKBwArJxB7y
 /aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=FWLQYhwBRaetWYprJwFBEr4+bN1sxLQ/wMSCN9D4j8Q=;
 b=ORzLaah2zh87P9OKdfwg2KuloHkwwDikx39InwSuzgFgVJlqZLHkQnClnLr5LRXl3R
 ffRd5fbfkQWhk9ZZ2nxAM7LOvR0rJQB578RV1k0WHWR3e4KomAMiL2meyLrr59Sk0EXq
 +RBxwvI1ps+XZSe3v4L27tV1xKXwbsxx/bVhnUBPcYrC6BwGMykOWx1Vp53tKn2/y7O9
 n2Kw+kbjI0hBE4xbOSZOKFOb3ZQVcA/MvtPtnU83K+I61MLShRrESCSUA8yOnRR4Va45
 EVloF1rqzWrNS7eTzuBVZ6chm6gxwTWK3FEpHj3c8lBty3vytUbDXljGkbzwqWRldAcQ
 D4wg==
X-Gm-Message-State: ACgBeo1JPKDJ4dnaMaZfXwWlz/Saj7qTKCT6JKWZ3su+RJZ/XbVD3GGR
 ptLNryQQpseO/uNpax1gVTC/6Q7OFe5hRB3P
X-Google-Smtp-Source: AA6agR5ac3F9aqCrr3FOKtuNG54tgNEXoUj1ixW39t/C/fkIUHZ93kRzNyPA47GxcisXTHcLCTo7vw==
X-Received: by 2002:a5d:522f:0:b0:228:dc7f:b9a8 with SMTP id
 i15-20020a5d522f000000b00228dc7fb9a8mr14967853wra.617.1662976959513; 
 Mon, 12 Sep 2022 03:02:39 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a05600c205300b003b47ff307e1sm4510755wmg.31.2022.09.12.03.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:02:39 -0700 (PDT)
Message-ID: <ba08edc7-54e9-a450-e044-5c6a58c646ba@linaro.org>
Date: Mon, 12 Sep 2022 11:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/37] target/i386: add CPUID[EAX=7, ECX=0].ECX to
 DisasContext
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-8-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-8-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> TCG will shortly implement VAES instructions, so add the relevant feature
> word to the DisasContext.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

