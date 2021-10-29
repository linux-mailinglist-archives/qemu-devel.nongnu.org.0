Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DC1440066
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:32:02 +0200 (CEST)
Received: from localhost ([::1]:57272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgUnR-0006Af-5X
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUkn-0004yG-9p
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:29:17 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgUkl-00048M-Cg
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:29:16 -0400
Received: by mail-pf1-x429.google.com with SMTP id m26so9738389pff.3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HWUSJz0qI8kLeemqobVCvpQRte2r44LscfQg4TCZ6r0=;
 b=D1exJGJRGG/ejKFMZPUOXEUq5bOSie1jq+S6xN1z+ToaT653VrB+B+pz668BSQ7h3Y
 ikGWC+ISdvn+3x1k4ktKvKctrR63gmyBrhcnqM7qnK6mI3WZ63FhDAvCpsQ0gQ/pbph9
 OGXOgyrNk5aLdFveiMPpPp8h/mPAXQc/q0eaDQsI6RiU6c29p6B5MkO7AtVljzZc7P2e
 NNDzwVOW5tYq71bu3kVrSn/9o/U7Rjr/s8dYYe+St2z9jQE8/oedsT/85Sna7iDecdm5
 0kqrDosNvcx+YQOV/q9NmJxYIpthFOOtivPlx7ktU5c9MFDx0FL3lWjFWM49MgNg0g8O
 X6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HWUSJz0qI8kLeemqobVCvpQRte2r44LscfQg4TCZ6r0=;
 b=J4BlTRU1ho6d459nSnrRb7Eyj4C70R2EFs+dMooOQUBgRcg0/t2FPq1Vts+jb7fqus
 2MwdXir+2AM1GbqOr1ZotF8JQbVV0nZ13eTcyhYkfOq4P2Z65j7N8CQtazAFKMw+1WZ9
 gGMWN0p3DcytO361Xf+zu9j6v5C2rRAq9W1KLEemIHYHMQiBaIfuuLllN/GIA2+qesx3
 R1wCkR35Zs5bgqQIuJGHlUR3uiBFUfY43B/45R2JFAnxnmv3yeVjUzVJw9z+7Pu0cJZC
 64pmWBYiOP39xT3c3pgw2JgViSq+b39KS3T8KHkOmu9nyVQABV3QTTKInjb8nUUr9LUG
 zG0Q==
X-Gm-Message-State: AOAM531VLa9fjQHZMgBxKVZTtZkApjOpiEs4Z3NOe3BtBe1NSNUQrC0M
 wv7r0EHkvYFVYF9hbqqBP2ASRg==
X-Google-Smtp-Source: ABdhPJxk+ofrkqyVlo73jOIPT7VDN+IFo7+WvoWyO2rxHMOyWYgcY4Usk7EoRl1nkc3+wPtPL5z8yA==
X-Received: by 2002:a63:8c0a:: with SMTP id m10mr9001460pgd.142.1635524953753; 
 Fri, 29 Oct 2021 09:29:13 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id q1sm3298205pfu.81.2021.10.29.09.29.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:29:13 -0700 (PDT)
Subject: Re: [PATCH v3 18/32] target/mips: Convert MSA 3RF instruction format
 to decodetree (DF_HALF)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
 <20211028210843.2120802-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <409f76a3-d6e4-9bc4-2c76-74a21d294507@linaro.org>
Date: Fri, 29 Oct 2021 09:29:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028210843.2120802-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 2:08 PM, Philippe Mathieu-Daudé wrote:
> Convert 3-register floating-point or fixed-point operations
> to decodetree.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v3:
> - Add plus_1(), extract DF in decoder
> - Remove TRANS_MSA(), call check_msa_enabled in trans_X()
> ---
>   target/mips/tcg/msa.decode      |  9 +++++
>   target/mips/tcg/msa_translate.c | 68 ++++++++++++++-------------------
>   2 files changed, 38 insertions(+), 39 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

