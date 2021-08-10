Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8663E5249
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:38:13 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJWm-0004tS-Oq
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDJH2-0006En-CM
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:21:56 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDJH0-00058o-Na
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 00:21:56 -0400
Received: by mail-pl1-x62c.google.com with SMTP id e19so5722677pla.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 21:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TcJ4ryn5CIXeyVXmDA3SBGLkbqBO6Vz22TGrywm8qQk=;
 b=dhnrVZO6JKxI1Re0fbbRm/4ZdYvd4ZCl6tFYvhsE55rePicTOjJmPF5UK2y0Fk3QQF
 hart8tKTGtfOh9Y6fmD6h6i5RWarI1SdMyqQocoQQg0VF0mpv3uQl+Ejpw1elOpaZmD+
 n4XpCfQdLcyKUZfgfZWn1jRTKeADxMV0Z7NVeJ0InqvG/HTNVLTW2kcY15n2ELC8l3tg
 UmaZdZyWLU+4LfoJPJO4ve/s9TlQFXUc8z8H6EI5vt/vMBW0n8SFKrYmcxYyI2Gb+GE5
 /DZ6HxVG6+xMptUdz5jLpy6ISKRt+mSBXQnT+ME+mpTo/r82K+p7b1ATufgCrruZNgo1
 DhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TcJ4ryn5CIXeyVXmDA3SBGLkbqBO6Vz22TGrywm8qQk=;
 b=Ssbe0HMdW+rYKQGn4CkAKFx5nsqDkxTZcJNtbrSan6AZq3nQ+uw9JuWpXazfZBBiDM
 ZB1DaZFvvORTDpiJZSV1lC5cWWjCVsqwMMMcvQV/aAmZM/N7dEQOArXuzmcku7WGbmv7
 JYgaAnkxCg+6I9jFQGebMmzFuktLSFCvZXBb8CKPOoYU6UZkWQRqs8wlyLH1PR4pRSko
 o640R25KWRWBM3vdJAdn/7buewzAZlLwx96WkBF1iToENaGT6fUTuu/jxQt5w3LfkYVK
 dfgA88y7sb6dm2w0X/oUZw2ORrTutxpjzC949L/S6wAMriAHEW0tIgCn0anbidxUEBUa
 94Uw==
X-Gm-Message-State: AOAM531J8F8htPD3XnCu7yJ4CBMPADfpzSpQVYaTumqfeGSimEMFlr7n
 JMwiAElAyeDfJGB14SGP+haF775jhzcZXg==
X-Google-Smtp-Source: ABdhPJyTaMMm+otkzt0GkUGFZnEzwIuDvI6vn6wkYDgbhBrnfY3qwrclIWiSvt0Y/Bdr1g+a7HwMjw==
X-Received: by 2002:a17:90a:6e41:: with SMTP id
 s1mr2777773pjm.109.1628569313078; 
 Mon, 09 Aug 2021 21:21:53 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id q13sm1082583pjq.10.2021.08.09.21.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 21:21:52 -0700 (PDT)
Subject: Re: [PATCH for 6.2 31/49] bsd-user: Remove dead #ifdefs from elfload.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-32-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <97283f04-fbe8-2c6a-c5b6-950dc9c87267@linaro.org>
Date: Mon, 9 Aug 2021 18:21:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-32-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> LOW_ELF_STACK doesn't exist on FreeBSD and likely never will. Remove it.
> Likewise, remove an #if 0 block that's not useful
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 20 --------------------
>   1 file changed, 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

