Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF04466CF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:14:33 +0100 (CET)
Received: from localhost ([::1]:55008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1rM-0007ub-Mj
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1j8-0007sB-Ts
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:06:03 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:39513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1j6-0003df-Rz
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:06:02 -0400
Received: by mail-qt1-x82b.google.com with SMTP id x10so7154620qta.6
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qEbQS/Ouh+WEJN1wHyBYR0mrNuiPYFrTd8eQ68Uh1z8=;
 b=EjM17lIJ4gHxJMcO4cQYFblpZUBOkFvUSuORpjGRhy8E3onXiaaMfSq7mAZ7CEJ4fj
 FW2457LtHlrUOaeqDRa/WE57dYNXNwgV7TDQxgOeQu7L7ofstQzv4ePxcasBPIxt3WYw
 bH9wvsObpF/w2BJvBHa568Aug/+sLApCK8xdVtJUtzCxYykzFnlCIb9oZRp7p6xWgnhF
 mMcft5o7QcXygbSdaSHYof0bphvgjbewutpe18FvD5IaY480Twzjgs0CYlrxV06Nm6Yn
 AnFX9ekLGAQeB3s8pvJXz33PfgUUwoCj1fD9+ngw0Y2kAZnArVAWaADE+SZOFl41GIG5
 6lFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qEbQS/Ouh+WEJN1wHyBYR0mrNuiPYFrTd8eQ68Uh1z8=;
 b=Ziw6TXL5GZIAk2XCZh4G1rXG+vNWod52KKeXLxImvikgMc0iC2tCgeKc0J/lPDAKyf
 VazNelVz6wNeDMA/xC+svq+FDucBbsCa0ml8/I0uSgR39s/3KaT+U1wXyHi1BO8ffKSe
 xdzuJ3+AxHtzi77t0Byu/AlrdHLab8F+9e0X3FEhhDNRY9o8ZlFx57LZrpV/5AtuqPBF
 fAxRn+zSooDVKk39tISTWYSEZ1AlhSju+/wUcS+j5b4sgdwXd1AAoncKr+HcqJ9Eh74f
 X2gpzvavSDMa3PuhyGOkTLdGVxqxPoJQR2Hmt1+SC5z+bmgX+5gDimiq7WwAd6CkShKU
 JURw==
X-Gm-Message-State: AOAM532dlOScaK2Jd3lgjI7YbkKHQ3HCceHUEw6FgtpUG/IJAN5vvW98
 CM4YKaV3VdAqMHbQf3se1ZrHug==
X-Google-Smtp-Source: ABdhPJx7uWYDyrvfA9a9saR4xkHIt8rxEHGcqwmAqn5JYHr+Vb1uGV6w3qr2tpmnOhYVh7gyOgCgIg==
X-Received: by 2002:a05:622a:589:: with SMTP id
 c9mr32821669qtb.313.1636128359649; 
 Fri, 05 Nov 2021 09:05:59 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id d19sm6200512qty.26.2021.11.05.09.05.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:05:59 -0700 (PDT)
Subject: Re: [PATCH v4 03/36] bsd-user: create a per-arch signal.c file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-4-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44386f8d-7bcd-9965-5a44-6e3fc60fddf9@linaro.org>
Date: Fri, 5 Nov 2021 12:05:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-4-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> Create a place-holder signal.c file for each of the architectures that
> are currently built. In the future, some code that's currently inlined
> in target_arch_signal.h will live here.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/i386/signal.c   | 1 +
>   bsd-user/x86_64/signal.c | 1 +
>   meson.build              | 2 +-
>   3 files changed, 3 insertions(+), 1 deletion(-)
>   create mode 100644 bsd-user/i386/signal.c
>   create mode 100644 bsd-user/x86_64/signal.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

