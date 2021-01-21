Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE632FE33C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 07:57:14 +0100 (CET)
Received: from localhost ([::1]:35118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Tu5-00082D-By
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 01:57:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Tt7-0007b1-5l
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:56:13 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:54591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Tt5-0000XT-Jo
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 01:56:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id cq1so999176pjb.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 22:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/OiO3SeGOLqlLwaO/VA1OmbCn+ssqwmTfkJ1/nRVkxc=;
 b=XsxApOE6D7UptQickfKs9eLXQh4crVvXXqfWlYNnMFatIFKUFb9WibHWrod3yFJQ90
 +MmyiI91SxizA6gP0tkU5XupsUVMCJgqh4x46/1y7AafgmRvUdv8znkDY3SNJebGz/PZ
 gSmV3uGjO2+9t7MrHasAfATk5d7DS8o/lpD6z9IgxVe9DzBE1dAWbqpQQ6g2MeAg3hmK
 +tzK/P/lnBRWKOEsX3iSvTJyMpkAFJA9d9qEqr+uQIymXk06AOWpVu/GkLyRj/B67pPN
 l8Y4b2s7tq+NIzoruGsI/ExbrqrLuNobMKmqzBz02KfcHWBREqHg3x0991h8b3koUuMs
 /Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/OiO3SeGOLqlLwaO/VA1OmbCn+ssqwmTfkJ1/nRVkxc=;
 b=EUJe2prW3QzzFEOlsrLgFv4dhu5Id/xfOHzEI/0n5YejqbzSTQDiuP52ECxZXlsMDF
 lCtA6x4E1hM7uwpyh804LRisHBWdbwyV6yVmPZgtyDqznPkA+IJ+Fq8+OaQEk20DeabG
 d8CBpdI2u/SnQ79ZHLY0ZneNjnlnS3dl0AWSxCTdPprOvDOtx9r9Ca7gACv9hA6jRXOr
 d1IF1CJ8StnftMvYPxqOE9wYTm0jswpzZqv4/rbf4DF7/jEdRyODE5zl8QlP8dxvHwW5
 M4/CoUuNwS33WB1+9kKIC40qN7ceVkIDBXzzendWS4sHCjG1riN+2DtK9IydB8U5SXNO
 MKlA==
X-Gm-Message-State: AOAM532wc/1DZ4+tTVFlRzD5ZZiyP26nqVQ93tytRc1Jpz807FTZQKxU
 jCm0QC/woV7FISBWuhfel2RgxA==
X-Google-Smtp-Source: ABdhPJwysVhT/FU87b2uHlAHnc1YwI/Ozt1gBdlYyNBSNVjL0ZFLHwsQAXn0xVivoJWVJn5Ge2nn4g==
X-Received: by 2002:a17:90a:4494:: with SMTP id
 t20mr10141018pjg.155.1611212170214; 
 Wed, 20 Jan 2021 22:56:10 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id i13sm4580753pgd.32.2021.01.20.22.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 22:56:09 -0800 (PST)
Subject: Re: [RFC PATCH 6/6] softmmu: Restrict watchpoint handlers to TCG
 accelerator
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92acf8b6-3304-f140-f333-8708e9f3ab8e@linaro.org>
Date: Wed, 20 Jan 2021 20:56:05 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 6:48 AM, Philippe Mathieu-Daudé wrote:
> Watchpoint funtions use cpu_restore_state() which is only
> available when TCG accelerator is built. Restrict them
> to TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC because we could keep that code by adding an empty
>     stub for cpu_restore_state(), but it is unclear as
>     the function is named generically.
> ---
>  include/hw/core/cpu.h | 4 ++--
>  softmmu/physmem.c     | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)

And all of the targets that use this are already conditionalized for this?  As
opposed to leaving the declarations and adding stubs?


r~

