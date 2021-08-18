Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F913F0DF4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:14:16 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTp9-0000FX-O9
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTmh-0007bM-HI
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:11:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTmg-0002SZ-0O
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:11:43 -0400
Received: by mail-wr1-x429.google.com with SMTP id q11so5798190wrr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1jQpcqX4StJZjVpOXie7T+LwegJt2o0NU992zAldeDo=;
 b=Yxks+c7K90pj3yZQxJoyjkA2waFcxzp4tppqIDBjpdiqIVfVSUpbGBgZ9VF1z6xhd8
 1qTr3oHhiiAQXcDFo4AU1WZdq+pF9hUaQxUQTQ0Y5gry3Ipjv9w+k03AY5gAMJNUaL1F
 Bu3zpq/1LrG3WVIp4CuxqjNVYr7wJrR9WzoZOgmWfB+IQUk2Bz9ixY8xLmM4P9JeWZeC
 +kBy96ENLePpFDpj/t64awzYtzVZq3utQsqHBCQLrUFXp63cLHJFCe1no6bliSheP8Eg
 i9/0e8PbTBJYwdzzH328Vw+Z5e5cOCPAlMotRF3VE7XTJVc3e7q5KluG65riCgpFUuKf
 FUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1jQpcqX4StJZjVpOXie7T+LwegJt2o0NU992zAldeDo=;
 b=C1MFBjJ3VjXxGbPM2H3iPSXxpFaC7Fno4e244wuZz7tHTVuiQYcm8Y7Mk8nuOeHdp+
 bgQQTT91J79kwlUADOuPN0M9A2fvzkPDVwZdfL9Q4EPmLyIhQ/61MMxTw/J7nEZLqFsA
 sf1QZTUwbgqlPEZi6lQ3SQjjDo9bOXhVIV6VLQW88kjI8gizxRoB0+77FmxrCYp4bolh
 eSsUW7SdVjuLZkdZH5Koha9Brtl7qizfFoqdWNv8H2SNGs9uIv7KU7eXxEQlGefzodIh
 e0CcqQiXJkb72jQqDXK5wA07wicUtYMrKw38NBHXvxvvJ5ZhdGZg6Zq+nQH9cBp2vfvc
 b6hg==
X-Gm-Message-State: AOAM5334HBiAvBBfw7xN/LoWksEDOe3j5H+P3FUnfR0MX0zDzJZZfpHJ
 Qk1hkvz9XqqtDPQgAC+a/L8+nnnwspc=
X-Google-Smtp-Source: ABdhPJzaq0e7HuAKRhAKmhR1AukvMoKrxcW9Ce7R7EFu8noc+R9sWwryiD7XLqW2x6lAfgCyPYlurg==
X-Received: by 2002:adf:f403:: with SMTP id g3mr13270306wro.222.1629324700388; 
 Wed, 18 Aug 2021 15:11:40 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a11sm1086291wrq.6.2021.08.18.15.11.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:11:39 -0700 (PDT)
Subject: Re: [PATCH v3 05/16] tcg/mips: Move TCG_GUEST_BASE_REG to S7
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
 <20210818201931.393394-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <13f31871-23ff-cb15-2052-753a762075cb@amsat.org>
Date: Thu, 19 Aug 2021 00:11:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 10:19 PM, Richard Henderson wrote:
> No functional change; just moving the saved reserved regs to the end.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index 92bde50704..b3a2cc88ab 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -86,7 +86,7 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>  #define TCG_TMP3  TCG_REG_T7
>  
>  #ifndef CONFIG_SOFTMMU
> -#define TCG_GUEST_BASE_REG TCG_REG_S1
> +#define TCG_GUEST_BASE_REG TCG_REG_S7
>  #endif

Maybe add a comment in tcg_target_callee_save_regs[]?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


