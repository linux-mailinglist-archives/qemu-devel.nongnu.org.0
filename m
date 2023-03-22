Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 490866C422C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 06:27:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peqyI-0001aE-2C; Wed, 22 Mar 2023 01:25:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peqyE-0001Zi-CL
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 01:25:11 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peqyC-0004m2-7T
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 01:25:09 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y2so5946617pfw.9
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 22:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679462705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FpoAdBqUKToRSR5q5xjk2B97DJwTKXekxfKHDp9KOsg=;
 b=kxscOl/kvGWB5cIEgdmBtXaTYrYJ5rCF0wikDKNbrgipNTY2UB0+KBoT6fJek8rmwr
 B4EPfKXzgqMy31Bj3wUJLkWPft3ZZ+vGy4l3RhI/o77QXKds5iFbmcCgZgpJ6e7/Mlrh
 R43WJz/KJPuI16lQYIBrI3ELmhld4IwgjQf7vA2u9HVy8DpVrXHHZnetyJsxZd2bfKsZ
 4q/Qo+XhZquYv9BAPbYern+B7m7WYPQrLAhzNAQ3Hy3Xp39QliZ7toHfubMEl0Wknx9r
 5kekOW8CNiQz4DEi3c+tL4uMtfKT/ZljS28ovt+wqCFl5m1b04Gq2kfbp1+zlGVji4UO
 9o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679462705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FpoAdBqUKToRSR5q5xjk2B97DJwTKXekxfKHDp9KOsg=;
 b=lmJY19tLKzFKk9F3nidYlTSlRiyoPD7I7JReDUCH9cByjV77rIkgeSr004/41OpsRR
 vqCiLHlNEOwch7sR9qYJUWz+pfw3yDrkj+XgRj+JBmLgVb3TGpEa13U9BtAgrB7sSm4D
 NeYaoxgNLTgVA64bNMP/5zw9lF2oZ68adlOBlDKL6S8NiaOr04VOB9zscIiWa4+U++wZ
 sDKJYFV5S1OqdsdF8cMcwBlvzU4qayD1e4VFFkh8z21DzvGryonqllJb7eNuxC8R6UFZ
 n7leZghGOqfTtO4wKAxQC6VZ+oEOmiSlazB+Z0Bokytf+QBQ0u5Ydy4icOjmvVe0GIht
 BykQ==
X-Gm-Message-State: AO0yUKU4xvHZkilnZljnQrbpMRj4Mhgxum3YFYEQIH5m6wGF+csPgPzo
 uI/GtPJ9e6vk6EBmxLAbI/fNwg==
X-Google-Smtp-Source: AK7set+P38LXmp+DohwdIDPdDWqdmJn6GKZnwlaOub26thUT3glPfV3r9Y5bXMB0dn8WzGfPYuKsjg==
X-Received: by 2002:aa7:9e04:0:b0:626:dc8:b004 with SMTP id
 y4-20020aa79e04000000b006260dc8b004mr2100147pfq.26.1679462705375; 
 Tue, 21 Mar 2023 22:25:05 -0700 (PDT)
Received: from [192.168.165.227] (24-113-166-229.wavecable.com.
 [24.113.166.229]) by smtp.gmail.com with ESMTPSA id
 m12-20020aa78a0c000000b0058bcb42dd1asm9145032pfa.111.2023.03.21.22.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Mar 2023 22:25:04 -0700 (PDT)
Message-ID: <a687d922-3ab0-d947-b664-0d313f817c75@linaro.org>
Date: Tue, 21 Mar 2023 22:25:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/10] includes: move irq definitions out of cpu-all.h
To: Alessandro Di Federico <ale@rev.ng>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-7-alex.bennee@linaro.org>
 <20230321170652.170d1741@orange>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230321170652.170d1741@orange>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/21/23 09:06, Alessandro Di Federico wrote:
> On Mon, 20 Mar 2023 10:10:31 +0000
> Alex Bennée <alex.bennee@linaro.org> wrote:
> 
>> +#define CPU_INTERRUPT_HARD        0x0002
> 
> Out of curiosity, do we have a policy when to use `const` globals as
> opposed to `#define`?
> In theory, if a constant is never used in any preprocessor directive,
> we could turn it into a global `const`.

No, this is not c++.


r~

