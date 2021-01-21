Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4962FF538
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:57:46 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2g5R-0002HU-JJ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:57:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g3t-000124-Fg
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:56:09 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:32860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2g3r-0001PH-Sg
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:56:09 -0500
Received: by mail-pj1-x102f.google.com with SMTP id lw17so5298527pjb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q9dAf5Suv6GtYs6hJpO/VPS6ykV1whvtSBZk5N2yUY0=;
 b=UJS/6jTakQM2jjdKoqzhFZqBSY5X+jQEFRlgdd774Z1NmH78BBijlHLrH8CdSoU2jn
 /R5739hakQf1GHKI2CMlVFoaspfl21cNT/EkpeZzvVHDJWNXTdL/SJ6wEGHcnph4BnRw
 V2zS9ug2qvo17OEaQbtJNnGFd0NO5ZMCpDhhN4Azm8R5DDOlbiKEjIsVwHbf6ikXx+fS
 EGkYdSP/GXN+F600ExcPtrhqCO9Ps+280R7Bsh7nKJsq2b7FhF1zil/daP8xElYs98k5
 fZVykF3sYKXXcL7tK04CO/bcG9E8CSWhfo3KWqC8sZ7edYPzHkJWLUM+uUZX3aqtpnXE
 xhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q9dAf5Suv6GtYs6hJpO/VPS6ykV1whvtSBZk5N2yUY0=;
 b=raA0RGxzzdHKvribKsCXfMLo/fCsspvvIbjfn6OrnEix60kYptCrvpE+TPh7uPeTTP
 qEnIE7iRU9C7pt/9R256ldX+dAQi688zqXFQ5i+OdkK5Q7cvjKLjW7JPHOju1j0rTok5
 ytrObfX/LXS8RRZAk0ZEWqDQxUMGQ2RccGB9OBU7D0tzKWeZcMmQkvK63Tn18KRPaDb7
 CrJvdzZFGQg7GwpWa288+/ZQ1bs5hSioNOuOfPkE50IM4G7UBInZ2Vr4Xifd6F2U6Bcr
 vP27V45L6ffn8FmxWWn9oWuIGHAGvBmAWL5Kj9mzqQyrZ1NVcRW8SBfJCAhm5YFPR0uU
 Xbjg==
X-Gm-Message-State: AOAM532uG3y5Ol2Zmlmme6FSJgl1ZS6xxLC1YRmum7cMzTjnpgmJQZm6
 bP6c6aNWi0VaguoC/1r01psM0A==
X-Google-Smtp-Source: ABdhPJwt5mJLfk22+vsHbYLDNFzoWTOYtmOQhB9xh+M5ukl8P+votO+ncQQzgFs0eltPe9aXnRSU9g==
X-Received: by 2002:a17:90a:a608:: with SMTP id
 c8mr1115405pjq.61.1611258966334; 
 Thu, 21 Jan 2021 11:56:06 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id k4sm6214106pfk.44.2021.01.21.11.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 11:56:05 -0800 (PST)
Subject: Re: [PATCH 3/6] target/mips: Convert Loongson DIV.G opcodes to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <20210112215504.2093955-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5722a920-f627-d9d1-2350-28f7b86319c1@linaro.org>
Date: Thu, 21 Jan 2021 09:56:02 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112215504.2093955-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 11:55 AM, Philippe Mathieu-Daudé wrote:
> DIV.G and DDIV.G are very similar. Provide gen_lext_DIV_G() a
> 'is_double' argument so it can generate DIV.G (divide 32-bit
> signed integers).
> 
> With this commit we explicit the template used to generate
> opcode for 32/64-bit word variants. Next commits will be less
> verbose by providing both variants at once.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/godson2.decode    |  1 +
>  target/mips/loong-ext.decode  |  1 +
>  target/mips/loong_translate.c | 28 ++++++++++++++++++++++------
>  target/mips/translate.c       | 26 --------------------------
>  4 files changed, 24 insertions(+), 32 deletions(-)

With the double-extend pasto fixed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


