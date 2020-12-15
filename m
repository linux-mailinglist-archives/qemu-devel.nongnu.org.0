Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B52DAE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:09:21 +0100 (CET)
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB0y-00056t-U4
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:09:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAyr-0003RG-5Z
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:07:09 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAyp-0005Ii-DL
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:07:08 -0500
Received: by mail-ot1-x342.google.com with SMTP id h18so19418659otq.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bPt1r7O8pwmS+V4deEofXmXNttx/eGng+UvY0u/DvaU=;
 b=HW2+s1AptjiA+uSO/ZiWUvzG9sfmzSUwP8raqNuzezCYRhK4s9hrLlXBucpu8coHbQ
 6h/pmDqgJc6JUAzGaZp5PqC+rhEHShqx+fY63tV7qWC0BmgrNYPBeCCQB9EIdE1K5Xkg
 lOY9HWBJ04TzGnivEAcSlpwPBSmIziZcUbUHqyAk45uMgFS5hny0PFp4z/ouO0sH268N
 colnko22hSeiZFXBEpvVWr6w/wRxPQoEoawqCY4eU7yD/l/eSJdNhAs3vtXQWiND9Hy7
 L9b30osKNx6VVXllcvD+jd2oZ1d0byOUvq2NfGMOsUS++BNDzkOlURsfZD69AtpuXxNd
 OyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bPt1r7O8pwmS+V4deEofXmXNttx/eGng+UvY0u/DvaU=;
 b=na7ToEQK9KNgu9aJ9lSAm0/7lG3v0Myckz2SeXylyWlWVxbEOZrR66d4bv/0v8KYPp
 mvQrQ34qq81UZp8MXhYNmDqQg/D98Pxpkjl9e3f6nfOOeYrg21cJ6ZOoLzvm43n8FGS4
 xAiFE/6u73JU2GcX+MJoRW2YcbIcZ2fX42EetWc3qHb1/PIjDv1SO8mrFmnEGbYCCyZ8
 lXPrcQ/GAmkbgInytFEsU+mBYnGCnWa9TDKVlwqpuz7xbR9L0gDgxOOFNWkimkc/S3Hp
 uOj4PdpSCejJ9pIwNU4RIEPmr5ZkbYAaqG9PIQWC5fdeVsFqqL/PpBtYgsehEcT1m+Ge
 nxGg==
X-Gm-Message-State: AOAM531Pao4rBSl0tv/sctGu9ff2dKV5Z+Kez1hqCo/WJwOaJkbLlFzi
 ltBK3NTh9AwRxz+OcqsfJxMEww==
X-Google-Smtp-Source: ABdhPJxPxgxTM+IU27ZoUuAgT9LjWvXlzO+DCwdZt7KMBzlRGCHpL8/jf3LnYmQXZinbWiQjyl54qw==
X-Received: by 2002:a9d:b8e:: with SMTP id 14mr22973155oth.316.1608041225732; 
 Tue, 15 Dec 2020 06:07:05 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id e12sm428518otp.25.2020.12.15.06.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:07:05 -0800 (PST)
Subject: Re: [PATCH v2 05/16] target/mips: Extract common helpers from
 helper.c to common_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c9164ee8-ef2a-269d-daf6-6e1efa5fc24e@linaro.org>
Date: Tue, 15 Dec 2020 08:07:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x342.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> The rest of helper.c is TLB related. Extract the non TLB
> specific functions to a new file, so we can rename helper.c
> as tlb_helper.c in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/internal.h |   2 +
>  target/mips/cpu.c      | 215 +++++++++++++++++++++++++++++++++++++++--
>  target/mips/helper.c   | 201 --------------------------------------
>  3 files changed, 211 insertions(+), 207 deletions(-)

Subject and comment need updating for cpu.c.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


