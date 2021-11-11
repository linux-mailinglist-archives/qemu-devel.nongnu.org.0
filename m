Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3626844D5F8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:39:51 +0100 (CET)
Received: from localhost ([::1]:45526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8Qo-0005rm-BU
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8PE-0004Mt-FH
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:38:13 -0500
Received: from [2a00:1450:4864:20::32a] (port=37495
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8PA-0006tx-Ta
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:38:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 y84-20020a1c7d57000000b00330cb84834fso7016966wmc.2
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sGDrPmKPBfcZau5qX/zItxiGCbUo9zlU7dnLEn5pqg8=;
 b=b/bEWSp8P76Rt937arOSRkBsHaA2QVBv/6OonzbXCzmV4OyuFst5EL0FvJTaDw6I9I
 b7ZglGG+dobfOIufoq7H0Krfo3IZCoH+NNrXHpfnr+uOaQHwhjPt96bGkNsRui5V+WZG
 Z4rSSv69zZvVNQXIdM+G1GdHlqz9ZWK5QXEkLiZoIH00NtiFwbNVj/fUZikU+Td41r5q
 Eqnk2tqO+QSMTY2GhdqrTAXcAJJLuWxyptWr6Z/qILX9rnjmdjlBfPVzCOVmYFKo19r6
 kLl9i792Je8pmRcyIJ7ivHh0q+xVJz2vQB7+tyBCft9KGmAgav344902o3rDgo2f+F7B
 VItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sGDrPmKPBfcZau5qX/zItxiGCbUo9zlU7dnLEn5pqg8=;
 b=8GqCGB9/i0u4NMxqphNSnp8v2nYTSt5gD2TA5YHviN6x+Q4DBqrghlQVuphja8z9vW
 f89ag1M8Y+WhzUMWNxnmy4iGbBCjOp6AqGdW6RDJld6IhKakklCrPMJ7I6RcGukiTu7Z
 Z5cC7wD8zkzMEYYRzHoC9NyAyfVtT7pP/f0qIsN3hYyOVn2nDik7uch7jeyMP+CrR1Bq
 wux/fpRD5imSEyamNjyslLt8ig4QeKHNbu7ndAmMMdZm0cMNJTZhcTQjBkHYZkx2VWs/
 8zWSScxvPm44FwPHPHb+eY10RWsDGcsrKr5XOlhV36NyhMgkxQOUVJrx6j25VRt9adtn
 0e5Q==
X-Gm-Message-State: AOAM532OwAx6okA9FBwLr5nFGzjRO7yNaXCKtm80DzrmnaoAvsIrGHZW
 6foWtO9tBTuT6ePYI/NUBfNxRw==
X-Google-Smtp-Source: ABdhPJxKdBysrY9YBYAZKX2wnWOSjBG3ylF/Yts9mU+PnUS/sODAI5nJJz9UnA1LsPxgrq4XjVuphg==
X-Received: by 2002:a05:600c:4f10:: with SMTP id
 l16mr7578259wmq.47.1636630686891; 
 Thu, 11 Nov 2021 03:38:06 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id f8sm9184692wmf.2.2021.11.11.03.38.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:38:06 -0800 (PST)
Subject: Re: [PATCH v3 15/20] target/riscv: Remove VILL field in VTYPE
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-16-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cb94ecbb-3328-bc4d-859b-6cdf0076256f@linaro.org>
Date: Thu, 11 Nov 2021 12:38:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-16-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/cpu.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index b48c7c346c..5f35217f7d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -106,7 +106,6 @@ FIELD(VTYPE, VLMUL, 0, 2)
>   FIELD(VTYPE, VSEW, 2, 3)
>   FIELD(VTYPE, VEDIV, 5, 2)
>   FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 8)
> -FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)

Hmm.  It's sorta-kinda documentation. Otherwise we might as well remove RESERVED as well, 
and just move the 7 constant into vsetvl.

Either way,
Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

