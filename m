Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC37320786
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 23:43:46 +0100 (CET)
Received: from localhost ([::1]:47650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDayX-0003r8-M1
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 17:43:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDax2-0002vV-GH
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:42:12 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDax0-0003LP-Rb
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 17:42:12 -0500
Received: by mail-pg1-x52d.google.com with SMTP id o7so7737554pgl.1
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 14:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CqMqW8sAfPMZWp2XIYiOB0VefZjJ42GTPuMmTsz9xTc=;
 b=Dua67BuzNmK5nd9Lfq+4b0DP4Hb4Aui011yXHg/zqsJtjrKk8P9/LyceSrbsTkEh4i
 S/97YM5gvZwZh41pM8JNmIIOo3hZ1DYP+SOfb5IDPmh/+dLBkuryZpOSFkQP7QvLpaMH
 G2aS+dnudjL9jRS4penZX9+7akVKUHAUP1bWE1KVhK4MprvzOHCTLN1Hg0Mq5Cxzid5M
 90axrVVJcCXA5g3y1GsDxdGMNP73khggv35Q8Xn3hl3AK/SyQWB5lijAdKOKLg4gKksm
 SFlpyRonEhOxhKtZWEF3QILnU8k8lA0bHBRPhnjEUP8NuNtiBWRfo+iVeml92TQLSdfM
 CG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CqMqW8sAfPMZWp2XIYiOB0VefZjJ42GTPuMmTsz9xTc=;
 b=LOtJXTfjhmgv0Y001xst190udCwJ7hsw4T/qnn17ZjeZaupqx+Uv18YPGoBDJVeGbk
 pBIyGpBw8zRL7LDMjWz/za76Naq9b2yAe95kAgCcgMN5jhmgtRxjQUVUiYYm0FsJlQi6
 30sVS6NehG3F9gUnDLVvoasNimFfnlctmG+pEofAx8lv25OLhqEaSc/Do4zBFoppcrDs
 e3b2/57vGr4Y0hOzscAYBr26J6FXW5/IEOZo4xuJNiVO2VnY7Bxe5zlmTXJVbPXZAcss
 ESBbe6qk9d9iLgwlnwNtsxx3Nq+bQ7VySyuZXeN9VLxclUpAHmcsvQARfmIbWMieLcn2
 IwHQ==
X-Gm-Message-State: AOAM530N0/bdKp3vIKBg/vOSICL4DdEIGcfU03uNwu9aG1HTynYNKi2/
 i2LvnYCr+jlnqgKRslesgrO21g==
X-Google-Smtp-Source: ABdhPJzoyVlC95+QtzttYgPs6KZTTjZRoZugKz4RgXO6tvCHZRm1hRCjziuPKmKAXxMWBvDW0kvo5A==
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr14134713pgf.47.1613860929198; 
 Sat, 20 Feb 2021 14:42:09 -0800 (PST)
Received: from [192.168.7.36] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id
 gq15sm316071pjb.9.2021.02.20.14.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 14:42:08 -0800 (PST)
Subject: Re: [PATCH v2 01/24] hw/arm/mps2-tz: Make SYSCLK frequency
 board-specific
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2c62837e-8898-e8a8-8080-3a6e65b67a29@linaro.org>
Date: Sat, 20 Feb 2021 14:42:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 has a different SYSCLK frequency from the AN505 and AN521;
> make the SYSCLK frequency a field in the MPS2TZMachineClass rather
> than a compile-time constant so we can support the AN524.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/mps2-tz.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

