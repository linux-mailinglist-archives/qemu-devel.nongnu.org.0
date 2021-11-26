Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D796945EBF2
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 11:53:06 +0100 (CET)
Received: from localhost ([::1]:46700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqYqm-0001Zv-TY
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 05:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYms-0006V9-UZ
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:49:02 -0500
Received: from [2a00:1450:4864:20::330] (port=39837
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mqYmr-00072D-1h
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 05:49:02 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso10370376wmr.4
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 02:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3kqselbQEBwGxFOQN3TRWk7TQWQRoZpmyMqJFMQPimQ=;
 b=Nz1L2sUdlelP7ASl7uUePI/jDsGaEPy6K5DPU2/IwAEP7zbOCgkWkFerncmY4ev4lj
 5ViCk5RrtrgwFAp4aA2njMXbqXI5l9v8/mjPUcKvZfQo03gRRn1rhq2Pkd9iy4Y2uEw9
 Cpxrh/kI7+GvwIOS8URB1XtIOo8TDDLaynCNVohcz6l2O8bD8eq3ll1Zc1KaYPIN4c7Y
 JZn31u6Lk2gjW11JTQMLFcrQGTx4NS70UfJNJIP6T/K16z2/n2M8jYcolBy19WTIE3mh
 hD5a6h1ybQ/Jh6OARu+3+osO/oiXgTXI6mLA1NaZ7POIx+x99PNC9C6cKicnpIkmfyeh
 8b1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3kqselbQEBwGxFOQN3TRWk7TQWQRoZpmyMqJFMQPimQ=;
 b=BG4DZ11p7VREn9SByHgYf8+tGSE7sFt0xhmJIAGZhbN+zJWaCHezQajouHm2MhvRyp
 02DYL1C2v8L8+zcEPrL6j4J2AefaIqc9KCqnTEEk8ouvmFBhexnStHVqAG56y54GkrjK
 b3BLFx1nqjR0YzppohVN0Gec2f46JFin51C+RVEKqlPB9fp1ZOymrpPfOj0DvQPPLrC8
 dV3Oty+tBUAaiFAff32s9aL7XQBpoW4EpHvHEJn9hb+PQDXCoPpBMZtYg/lFJriKXvnI
 ThHhBnJVsJ5xT6RBZn4rgGZYgNpkXuaVvQmTFbBiNZTso2N4gEbXSCSloDDXROYBtL7M
 Kzeg==
X-Gm-Message-State: AOAM531Ppt4QSDRuxbFG+dQv160CNjrkYK8vA83jP+U2/mrpuy6u5pLo
 hpeppCalfbcE0MDRE7Ai+sW3/Q==
X-Google-Smtp-Source: ABdhPJwLnpK3hBTtBXHWK3n5SmjNPKM5azVGAxU7FXs50cSlj5IDtUgMAmr2FTn5TdUNpEthArQH3w==
X-Received: by 2002:a05:600c:2308:: with SMTP id
 8mr14111422wmo.179.1637923739667; 
 Fri, 26 Nov 2021 02:48:59 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id y142sm5754296wmc.40.2021.11.26.02.48.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 02:48:59 -0800 (PST)
Subject: Re: [PATCH v2 3/3] linux-user: Remove TARGET_SIGSTKSZ
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637893388-10282-1-git-send-email-gaosong@loongson.cn>
 <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e5981910-0f5d-9640-5fc8-a9fd0ca10fcb@linaro.org>
Date: Fri, 26 Nov 2021 11:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637893388-10282-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 3:23 AM, Song Gao wrote:
> TARGET_SIGSTKSZ is not used, we should remove it.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   linux-user/alpha/target_signal.h  | 1 -
>   linux-user/generic/signal.h       | 1 -
>   linux-user/hppa/target_signal.h   | 1 -
>   linux-user/mips/target_signal.h   | 1 -
>   linux-user/mips64/target_signal.h | 1 -
>   linux-user/sparc/target_signal.h  | 1 -
>   6 files changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

