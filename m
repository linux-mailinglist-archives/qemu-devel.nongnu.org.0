Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A58C2CDC36
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 18:16:43 +0100 (CET)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kksDi-0006u7-FA
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 12:16:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks7p-0001l6-58
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:10:37 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kks7h-0007Uv-4E
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 12:10:36 -0500
Received: by mail-ot1-x341.google.com with SMTP id w3so1785762otp.13
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 09:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ryNOAktagrJ7Tg3Tg77kn0s+R1SHkWLPi0JKyvY+n8=;
 b=TiykxljfXN2pTbhBmmLtkZfDhzNZblt68qTDig06qPYwyumc6UMT1dOZnuYDxex83z
 Sft3tRQ+BKVg5hLcTFpUQPKFYFWDY28rr1suHxejslL2w8uMmSI+uWWwWIMcC3mAi8d8
 Av5jacXNsa7xjHjlCV8kyrK3Fk9vkFUc1L/nCgZlgE8WFV860+1mWffw34tQjby3nC78
 L/vhR0d7Lt2aGBh+lYxjDqyHq6Kx3dNo/VXRudQcDpzeCbi1BWT+fdJZAxxV4JW4RV/+
 DLZKDD/Hdt+VVaeRwjdMJ9oQni4dhKzLtjBrV6/9nmpEKiPSxhZr1oZL+K9DisnxmdS1
 pCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ryNOAktagrJ7Tg3Tg77kn0s+R1SHkWLPi0JKyvY+n8=;
 b=Cj5d2ESLSJMNVGtVEb59KqSw/dRbj4UYPAIeche1Ma6STcbIcAm+RRH5MUP7OhIvQv
 6mvQfAU3nW7gUg5kRG0f9gKp0ugvFY+fmloo34VZy9skAtllje8jLRpVPRip6N8cYEMk
 vYOGwBeC5iL4mwzVC9r4KG0qr3t1FLDKj5VhIryH01g+rZhc1AZgpuugJtybA4dhDsrk
 YdnnOTWbqIEqx8AAvAeB3rqL0LQW9fWb0O1uM+9vBeWKDgDsoMli0FOuTi8dmmqqubCV
 Q+D8kt3iTDBPAOh2qS3hJRH7u/DvXV3t29Y09WU8+VJTAM1d2pG5x+imf48OgHQxAeZA
 R97g==
X-Gm-Message-State: AOAM532ZnjnZA/7Xt4kM9j/mmUXUTM/MzFPMx/nvot3kDMG/qlQFXPRD
 cnmkgIvHgyAGvs7dEm90ZuS1qQ==
X-Google-Smtp-Source: ABdhPJz6q4JgjeQ3DOv3qqVcxmpv5Nc/V94ZxVPHoTc9/9f04FXSYjns8g51LPmTl/sNqF7t+dIhKw==
X-Received: by 2002:a05:6830:18eb:: with SMTP id
 d11mr128317otf.208.1607015427789; 
 Thu, 03 Dec 2020 09:10:27 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id x66sm316179oig.56.2020.12.03.09.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 09:10:27 -0800 (PST)
Subject: Re: [PATCH 2/9] target/mips: Simplify msa_reset()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfb36b79-f65d-1ae7-0b35-7f3aaf985f17@linaro.org>
Date: Thu, 3 Dec 2020 11:10:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> Call msa_reset() inconditionally, but only reset

unconditionally.

> the MSA registers if MSA is implemented.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Maybe not very useful.

Yeah, it's marginal, especially given one user.
But whichever way you prefer.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

