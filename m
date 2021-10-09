Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BC427BDA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 18:18:49 +0200 (CEST)
Received: from localhost ([::1]:58884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZF3h-0006Je-2h
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 12:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZF14-0004L9-CB
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:16:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mZF11-0004RC-9c
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 12:16:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so10062581pjb.4
 for <qemu-devel@nongnu.org>; Sat, 09 Oct 2021 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rco6xhKMGfJW6ZaQmBGJ3CiJs+qemU60m+RC81T9N4g=;
 b=p6CayW5fsZg2OfN9Sh8qyP2GwrxRnmQjx4sp95HNhQhC5ql2xkrJxQ0RnRbgiZiW3f
 hqOgpSx9GzcM/MEFzK3kVc3jFC6YKAT4iUc4M+0v+jkmbzyhOukSNRH+AfJJ3Bv6CHx6
 HilXjIJ9clp3wE7gUDHEiCzpnir7+KBKMOxN75QupYJYf+SXKMST+SK3RQ5BR2Hh5IeF
 +d9dNZPn2V6hahFo0GaYgZCGhUbbJIOVVkyF9JB2C0axOelLxWJx0i8kHnWNIprXCTxE
 YkR6VI/YiOiKcv9aL7TbeedjxV9wlvprnLIKoWrPiK9F2i2elINfWhZWdRx/0DKEU3fK
 OQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rco6xhKMGfJW6ZaQmBGJ3CiJs+qemU60m+RC81T9N4g=;
 b=4WjclY6Hae+e+1fsMoCVBYI5s0Q5ZNmJVkRKjBHpXQYmZohPTRkaM8TdXY7a/ji+Qt
 DoH9PTR5i8+tIjKHi7AXVBItX/FyDxD1kwf/mxie8aeyzXIkMU1W0aHMX7tCN8nc3JBG
 kZvY4Hx2e915s2/TgAKC1TmM4FB0xzzmAxuYIRJTQxcW+dnTxneukX9F0AYUHkxujAur
 kGngs4/cimcJtVjExCv+UmNX4nzbck6USf2ADqRGwiC+D7E8o07m59GDzSyiJUiPnFah
 1VKJ5iriccVdbdfoRd25/AnUYaB8sEuYbcB+cROjEw/WGBjoCj6HDd3EZ9KWBOlF9M2A
 JxkA==
X-Gm-Message-State: AOAM530VO2mXKSXd9dL0PbRQPWBgH8l3m1tR3m5quLLqtOGFB34mAY1q
 C/JhtFDPtljk+27NDqMZJ3GKew==
X-Google-Smtp-Source: ABdhPJyKn8N+c5yNn/5f7eMoCePw0UuZIc4RKR6WA+l1zmX02hBPqmQt+uw4hpEnqg8EitLqwvwPXQ==
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr15368777plr.71.1633796152304; 
 Sat, 09 Oct 2021 09:15:52 -0700 (PDT)
Received: from [172.16.83.58] (068-185-026-038.biz.spectrum.com.
 [68.185.26.38])
 by smtp.gmail.com with ESMTPSA id q10sm3145533pgn.31.2021.10.09.09.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Oct 2021 09:15:51 -0700 (PDT)
Subject: Re: [PATCH v2 11/15] bsd-user: Add stop_all_tasks
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f8666f5-929d-7f53-83f4-3e1ee8c84052@linaro.org>
Date: Sat, 9 Oct 2021 09:15:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008231506.17471-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Laurent Vivier <laurent@vivier.eu>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/21 4:15 PM, Warner Losh wrote:
> Similar to the same function in linux-user: this stops all the current tasks.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 9 +++++++++
>   bsd-user/qemu.h | 1 +
>   2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

