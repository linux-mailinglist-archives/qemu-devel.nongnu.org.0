Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E63F0A3D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 19:25:41 +0200 (CEST)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGPJr-0008Qq-Sa
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 13:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPIh-0007jt-GN
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:24:27 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGPIf-0002q5-UO
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 13:24:27 -0400
Received: by mail-pf1-x42a.google.com with SMTP id m26so2833565pff.3
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 10:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sE70+rFYUv0lyCI3VOaaIRy1hMwuuHick5AC7wn7Y9w=;
 b=QR/I5Qd3UHz/W3zVrrqN67koQYVYmZOcKIcYtnvTwUy+VB6m5FEpUTzeW646gEz5KF
 I7U7z1bcP8u4YMMa13CMbsZgiAG2B9PsyvDnUP8qieCfYjWrfxfISuZNMEzyqDhKwy6s
 QcztoMmOH0mNOkPWMk+lIFgD396CUbARCvUTZYTp5s6pmHr7r00kUZA4r6x9GN3mKj1n
 St8cZW69m7gYzMfSmCd1HORduzs6mfb0e9tiUf4szgvwYYbvjNhMIltBHBZ0YjsKahzP
 QIW0rOwO17Wxd61k3DhcPipfpkLkU5/UrdF9vFayQZNwU7NiHSTQyPyP3DkWy4rAX+6H
 lCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sE70+rFYUv0lyCI3VOaaIRy1hMwuuHick5AC7wn7Y9w=;
 b=MtUXP+vfizu19v7HIqrUIw6yCuI+QndfUXbC33/bzrwyA4EBim/Zbe1xOLGSv/A8eK
 zPS8LJz9t18aTe/taL9YCMj96RyrpkDqvf0+iJATDhKkxqdb3+HL3muBxZgNSlmy3MF1
 a046icypqgDZtoUzq2a9ymkqNOxPn6ZGrXsie9ULpbqLPN5l1dTwH6aQuiSEeXsKsBJ4
 nd/x4Hu/ekeCCvvZrlapUoiyTun2fKSgjOm5dXJY0LKbvdJo1UfnpwwvOEse2xHll31n
 HjTSYwASqLwNhfJTWaCXbvPcgquVf144F9hDGfhkSXWbNzHCrD8FV4JqeAl+Q8QI/pAT
 Dxkg==
X-Gm-Message-State: AOAM5328T+FwQdqAsKo9CZeJp0X9QSvdNH3BiRpQCEAvsR7TIe4Y1uT7
 7xAKxaUgqEicM/8/YdjPEjlC0Q==
X-Google-Smtp-Source: ABdhPJxhMSCVX5mPtUbaswOzteQGRUsb0EGZyATW6+iLdrdrMI4fINHuBA1vrXwxvk5XvsopukMhFw==
X-Received: by 2002:a65:6487:: with SMTP id e7mr9762312pgv.27.1629307464207;
 Wed, 18 Aug 2021 10:24:24 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x42sm329130pfh.205.2021.08.18.10.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 10:24:23 -0700 (PDT)
Subject: Re: [PATCH 4/5] target/mips: Store CP0_Config0 in DisasContext
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210818164321.2474534-1-f4bug@amsat.org>
 <20210818164321.2474534-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bdf8029f-efc5-2d4e-5cf4-6dd2f22ec99c@linaro.org>
Date: Wed, 18 Aug 2021 07:24:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818164321.2474534-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 6:43 AM, Philippe Mathieu-Daudé wrote:
> Most TCG helpers only have access to a DisasContext pointer,
> not CPUMIPSState. Store a copy of CPUMIPSState::CP0_Config0
> in DisasContext so we can access it from TCG helpers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/translate.h | 1 +
>   target/mips/tcg/translate.c | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

