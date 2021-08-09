Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7A3E4E08
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 22:41:34 +0200 (CEST)
Received: from localhost ([::1]:54684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDC5V-0007KP-MD
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 16:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDC3v-0005qb-UA
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:39:55 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDC3u-0005QI-Fc
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 16:39:55 -0400
Received: by mail-pl1-x634.google.com with SMTP id e19so4384966pla.10
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 13:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A4/kWpvkOPiTJhl1+yQDmthpvRNXCv2d1RyQSZOI8e8=;
 b=fr787RuVHcL2qRwXtY9zyxFsfzUCz9bYibA1OoZDET4TOvah9AY+/tCJJB1W3iLwlS
 vOTqauuhGrDNDPLEhUve3Qo45lV53qkBBlvuc+8aS+L3VcFgKIu8ZasiryQpVRhg1VOW
 wKytXS/9oobj6n68rypdm9gNLpF6pPEtdmxpBoQ6igfvZv9jyEVYYnHiU9T316n+syaL
 yEO9Qaw8fjcebI184aCNDCYwnbochtTb6VOAGXeQlaqIkjm3ViiI1DFNzkAJxC7ZQQuP
 eWzLhcbS/YPnqvwk3M4yXoQQ1l7r5zWlSwjWXHkM2S4vIUi9JHgaluf+iiQJ2lBjFEbE
 4ACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A4/kWpvkOPiTJhl1+yQDmthpvRNXCv2d1RyQSZOI8e8=;
 b=BEholb3OO8AjVs4RGbVioXtrbCMNQIllAgmOYPy+BTDHm9RcC09FxqF5sunMYgFvm9
 MtD2zQX6Yc53cgx2J345pqeqmoZh5w0IJ3m4gJmGbDaYlLdvyw/SjNYMiwNLUWwc9hVB
 4IoB/68e8dDMpXwEnVxEoDEh+Szp/WWL8mI/3RsClyWHqJo128RdxGCv3+gmmcBKR7nC
 /4t18CktOSeIhnroJDwUop99qv8hzfS1EnUL+lEz9dbyh78zOxSoJn+xooIbCpEeVv2k
 W7ba5W8siwGZ/VqZNXytyNok2NTDqomnxeQ4W8zaBj/QHaC5KyhLKdSERtGNkxZQqRON
 g0IQ==
X-Gm-Message-State: AOAM531JDEjXO81hDML10YsFdf/U8o+g6A+9ZSvl6OmWcPBIxCEj18fo
 N4BLbFCVRbCgyE41FZSSrW1mCA==
X-Google-Smtp-Source: ABdhPJxNTjRU3I2J3bokUHBWyRjvf/R7vtT94an0wiOqBPY63Q4RjZbz99xvNCqdlOIW45RZdEQxkQ==
X-Received: by 2002:a05:6a00:1250:b029:3c6:1aab:3f58 with SMTP id
 u16-20020a056a001250b02903c61aab3f58mr25681348pfi.43.1628541591779; 
 Mon, 09 Aug 2021 13:39:51 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id h21sm21598441pfq.130.2021.08.09.13.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 13:39:51 -0700 (PDT)
Subject: Re: [PATCH for 6.2 27/49] bsd-user: Add architecture specific signal
 tramp code
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-28-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a125d798-acb0-3190-2454-50edd39b5528@linaro.org>
Date: Mon, 9 Aug 2021 10:39:48 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-28-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Add a stubbed out version of setup_sigtramp. This is not yet used for
> x86, but is used for other architectures. This will be connected in
> future commits.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_sigtramp.h   | 29 ++++++++++++++++++++++++++
>   bsd-user/x86_64/target_arch_sigtramp.h | 29 ++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
>   create mode 100644 bsd-user/i386/target_arch_sigtramp.h
>   create mode 100644 bsd-user/x86_64/target_arch_sigtramp.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

