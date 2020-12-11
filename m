Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE602D7782
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 15:13:36 +0100 (CET)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knjAt-0008HR-AD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 09:13:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knj73-0004xi-Fa
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:09:37 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knj71-0003g0-9A
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 09:09:37 -0500
Received: by mail-ot1-x344.google.com with SMTP id h18so8278241otq.12
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 06:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Yvb78vce8Sm1A6QtixiT2LFeRSxrpUlhox4wv5K31w=;
 b=TgxjiWJ9ii9wvu6fmndWKwTnH3Iuv8wyjuJ6EYRgzOa0QS7M5jjP41XM+zwvp/tTOq
 139+8xI7lIOU/VddhfuTzYqUzqCWAPJ+GBMAeo0aaErQEGziUmY7FNIV6puQDdCD1Qvy
 caH0q5L4BV4Ckf7pRIpRJMfzR5sPjQix6vBAAva6II+nKTCoifF5CWUcBI2+3ZKWKcUq
 TqbgrC/ARBf0XtwDBH85QzFv0n05MSg2aaIcFRQzkFrBlh9NV39ILWvwUc/kMs7QuzAb
 lnffKxZk2fgUGK0HlS+lFdDIOslzCNWJvV0DEIgdCvcd5A2CO+6hgXQbDJALQ+eNvTo6
 hBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Yvb78vce8Sm1A6QtixiT2LFeRSxrpUlhox4wv5K31w=;
 b=IlRd2A/NASUGPHC0RRN2HmhtZ8g+8j1esl0AqcqrKk9ahjO+GXrx7gCOa00Y+T5Mic
 H+ViyQlhIqbjs6whne3tz5SwMoqOkWS09I6UlARvI+r6d4f60OGh5N001JyT2VkuYsNC
 US8mq9GfwbJMBUnM7zRSDHVrXnq+o/9iXHm77rkE1c33Hcli+geCyfzaS/aF+MrQLSFG
 XqG4ctskv9NFeS8fk2Iat9UiGv/BiBGy5ZZPb0ol6I+PVcV76/NXJlwmtXat9hg6rKd7
 /KTAT3h6+O2o1f8EHpikt92Nxao7nSlKfuIlKYFYF7l0ldvCQKgxstyIBvk9R4NRM7PN
 r1Yg==
X-Gm-Message-State: AOAM532Jyj9PpLDTcMUzngSveGyGur+gb36w2K8zb2ON94zyI09aDzfc
 UBreK5/JeqFEwOY/R2eUyr4y6g==
X-Google-Smtp-Source: ABdhPJzi5DSvc+LgcZKHsYAXKL75vncWXLUSHIFBoNmTXTIk0IVz6pO9uDwNByg4v6oarnEHV7PyJQ==
X-Received: by 2002:a9d:261:: with SMTP id 88mr9744183otb.202.1607695774032;
 Fri, 11 Dec 2020 06:09:34 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t72sm1794525oie.47.2020.12.11.06.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 06:09:33 -0800 (PST)
Subject: Re: [PATCH 2/2] target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1
 for "max" AA64 CPU
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
References: <20201211051359.3231-1-rebecca@nuviainc.com>
 <20201211051359.3231-3-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fe70943b-c05a-69a8-c7b0-b3e690a95bf2@linaro.org>
Date: Fri, 11 Dec 2020 08:09:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211051359.3231-3-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 11:13 PM, Rebecca Cran wrote:
> Enable FEAT_DIT for the "max" AARCH64 CPU.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  target/arm/cpu64.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

