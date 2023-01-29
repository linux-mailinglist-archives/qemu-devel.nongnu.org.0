Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668B567FCF0
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 06:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM0Wm-0007a6-95; Sun, 29 Jan 2023 00:46:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pM0Wh-0007Tz-Cb
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:46:51 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pM0Wf-0000Sh-Rf
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:46:51 -0500
Received: by mail-pf1-x434.google.com with SMTP id g9so3665633pfk.13
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 21:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7h0JttyO0pqxFO/z+wUGO7E8E9gzHhzjJSn2y31u9Es=;
 b=EJBL8wXitXqCqBdSLUkvU3lg4Dv/tp2GSaFVRsTfiGUKGwABie4EMbczv+LCnVpIPB
 z3ixDMYi6bItw4EbPV37XyPf8wGg8GL2laisqoSxN8E4cU7KSuGSYW/WZcXhO++v4/o9
 dp11iQJx5gozgfnnK49H9IQ1/nASOEExQ3Cs2AHZD0rPFmHYfDbU8Rn/NcEJkrnlkshh
 VwBMrfXUTPs8erT80WvsoUzWTP+Ima/DHoK0HJrM/41pJ/f7rTExoNF588Gs+AE4NrJD
 qwaa1aY1vWuF0I5DSBwl3oKHNoMS6QeloqZJQWHi0+n6BaN5P58Gd8iwsOXeGMthxl/M
 Tg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7h0JttyO0pqxFO/z+wUGO7E8E9gzHhzjJSn2y31u9Es=;
 b=Sj/TLqg494BiFqeHMx7+FpAwqAUgJhyPODv8XjVe6452fGNFhqYBNZpv2VKmoFG4rV
 MKs1w6TpzNYFSgWN0+q3ahfYP3Q2k3nvPApA9sRJnvETxwlTiSefh3XwbsGPHLpIEQZ6
 eKaTGW/4uODZIikMoM7T0deEzAupRceKaxjb4TwMx/+m3/Dq+Dcc7k6Ldz9Cpi08NgXW
 0XCg4ZCIPVnw8d6N0LCDcgmpaq4fL06G5BRX79x3y8/ND5SNJxVWrjOSxtre58EWDf5M
 7AT7r5grJ2rdjTNueQCpDNih0a0JNAUWBseyOXLtNFjzp3pL3aknQ6Kf/Yfw22disF9D
 d3UA==
X-Gm-Message-State: AFqh2kruUGxa9nI7Pt4xc1MI2m5ggGcLshzm5eGj9YrcirDMgpIJq5Cq
 B+nywy81XgAsMmkbzGvjuon4bw==
X-Google-Smtp-Source: AMrXdXt14n9AbKSz4J4fNjR3+8I6vsfhkNayEelSxmdYdhExbe0GiMmpA3BDaBa/ld3Xe/cn/XT3Lw==
X-Received: by 2002:a62:3896:0:b0:58b:9b4e:5292 with SMTP id
 f144-20020a623896000000b0058b9b4e5292mr41925584pfa.1.1674971208391; 
 Sat, 28 Jan 2023 21:46:48 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 y6-20020a056a00180600b00593b06e0493sm544054pfa.81.2023.01.28.21.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 21:46:47 -0800 (PST)
Message-ID: <a82ddbca-18f9-f130-7c3c-9d37d1252d9f@linaro.org>
Date: Sat, 28 Jan 2023 19:46:43 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] linux-user: move target_flat.h to target subdirs
Content-Language: en-US
To: Mike Frysinger <vapier@gentoo.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20230129004625.11228-1-vapier@gentoo.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230129004625.11228-1-vapier@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/28/23 14:46, Mike Frysinger wrote:
> This makes target_flat.h behave like every other target_xxx.h header.
> It also makes it actually work -- while the current header says adding
> a header to the target subdir overrides the common one, it doesn't.
> This is for two reasons:
> * meson.build adds -Ilinux-user before -Ilinux-user/$arch
> * the compiler search path for "target_flat.h" looks in the same dir
>    as the source file before searching -I paths.
> 
> This can be seen with the xtensa port -- the subdir settings aren't
> used which breaks stack setup.
> 
> Move it to the generic/ subdir and add include stubs like every
> other target_xxx.h header is handled.
> 
> Signed-off-by: Mike Frysinger<vapier@gentoo.org>
> ---
>   linux-user/aarch64/target_flat.h       | 1 +
>   linux-user/arm/target_flat.h           | 1 +
>   linux-user/{ => generic}/target_flat.h | 0
>   linux-user/m68k/target_flat.h          | 1 +
>   linux-user/microblaze/target_flat.h    | 1 +
>   linux-user/sh4/target_flat.h           | 1 +
>   6 files changed, 5 insertions(+)
>   create mode 100644 linux-user/aarch64/target_flat.h
>   create mode 100644 linux-user/arm/target_flat.h
>   rename linux-user/{ => generic}/target_flat.h (100%)
>   create mode 100644 linux-user/m68k/target_flat.h
>   create mode 100644 linux-user/microblaze/target_flat.h
>   create mode 100644 linux-user/sh4/target_flat.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

