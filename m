Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95B443C01
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 04:49:48 +0100 (CET)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi7HX-0002I1-68
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 23:49:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Fq-0000Lq-A1
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:48:02 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:45863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mi7Fo-0005IF-BX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 23:48:01 -0400
Received: by mail-qv1-xf29.google.com with SMTP id s9so1422223qvk.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L6yk3KZ08G/sRG+koWjB+g9wd4JkMZ8rKwv/Q4dfkJw=;
 b=B4aAzasBMLAAMBge0xFxJ7Y7aeHwdoMnWpRtEwlR6Tgyr3wltYVFJk4bQ0LT5HnnFL
 Iao+A2JU+oZgCYzRsMF3kqmq2Ih/VGlwZobJjEY7yXjpprlEUJzlHkdhnxtgWIcC7aZ9
 1BZDeUSXxC7mK9t1wunawUjzmGcNj0ogfRqxMPPVc0qLscfj9exiU22ncEDwRsYnlqny
 bId0PQwbsqNIPPKaDShCHRQUEJdm8UfP0VXKlqByk1CyruILDBhMCzXae2vU7CYV/qin
 vY/8wyx0he8GOXIOxx04xlk10Giccdz6n155wwvAn5N4jZJTqBP6tE6TBQqvbsMngt4A
 QgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6yk3KZ08G/sRG+koWjB+g9wd4JkMZ8rKwv/Q4dfkJw=;
 b=k5sqYevKaQw1B0UrNjve3O/nD5SU0p2qRmJNqi8LSIc95dWD/jkcdl1P8+150EGb2c
 0ytRgeuZMIhKubSVs9Oz5Ssljvv58Hdc5jlpOMBlLwVheJqfbH2JZzzAluJAaPfJweH7
 vrEQeKPuQOJBcJsLuDeo+pzIcPsMU3YRSvON9hv9ajEF4jKd3G3GMVb7dKZk4Sv6u7cf
 EOERLoUMtw1dTD4cHdkjZ4tnX1/r1W10XA6ZFKmlRVZ1FqPktGu8wLtJFx9Ff6VwXnxT
 3n4L0VSHnqCIyr36WBqCYpHPzKWeTk5jrwPWGzNIodEf5RGTnQxYaZ1CMUzgN98T10dH
 SjbA==
X-Gm-Message-State: AOAM531xt3GwTIdSj5oSyXqusakToxq7VfNbOpyppTdFFuxcy827EkUY
 1XrAFbZmUv15iTEhWyGkXe17GA==
X-Google-Smtp-Source: ABdhPJxvZQ9gjr6ei9yolqtV7QqRSPAO7ucZfzdV7/+tT0E17ssFYlRGUF7TayGcgQQoVe7HeJBXuA==
X-Received: by 2002:a05:6214:c6f:: with SMTP id
 t15mr7146513qvj.6.1635911279520; 
 Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u18sm737851qki.69.2021.11.02.20.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 20:47:59 -0700 (PDT)
Subject: Re: [PATCH v2 26/30] bsd-user: add arm target build
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211102225248.52999-1-imp@bsdimp.com>
 <20211102225248.52999-27-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc347f04-cf78-0b30-b0c4-911e3281e6d1@linaro.org>
Date: Tue, 2 Nov 2021 23:47:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211102225248.52999-27-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.549,
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
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 6:52 PM, Warner Losh wrote:
> CC: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Acked-by: Kyle Evans <kevans@FreeBSD.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configs/targets/arm-bsd-user.mak | 2 ++
>   1 file changed, 2 insertions(+)
>   create mode 100644 configs/targets/arm-bsd-user.mak
> 
> diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
> new file mode 100644
> index 0000000000..90b6533195
> --- /dev/null
> +++ b/configs/targets/arm-bsd-user.mak
> @@ -0,0 +1,2 @@
> +TARGET_ARCH=arm
> +TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml
> 

Note that we just added one more xml file for m-profile mve.


r~

