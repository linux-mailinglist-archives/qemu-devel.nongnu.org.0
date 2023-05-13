Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01511701676
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:40:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnb2-0003q9-Lo; Sat, 13 May 2023 07:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnaz-0003pa-Dg
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:39:29 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnay-00077J-0M
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:39:29 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so96921268a12.1
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977966; x=1686569966;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjK1d296F5IZd0hzBci5YaKy5tF3t5fadSlSFaXVzbQ=;
 b=v/YqlPfZ3BRoDIwCE/AkK34iSR6qJfoF0a/ySDl9brFdjAMcjAI8K2S3KqtpsnMeSL
 px1eDa+J8HIMrvo9ZLJ7Qonq/qZjxsa/r+9HALhICiDT0kdbl8SAxLKEe0MitgKT/Zy6
 cSK+n+WK0jG3yJyuwL8sNqohLiaLwqpFp9Q0GJNgLmLUynJ4VWdb1J2E+xTJeuVOzG+N
 O6JxR2e4miu5x68sRjBxeQYGOeZRyaJ0rCTyxiYPtfQ6rWhqlDmEKWTG1nbdzPpBFQbZ
 qqgQiXTjb3rM5vIy2PW4YLvLyXaO4BHeurlFMVOW9jgG/hDM6ldMkE3fY2pv3go5JUDE
 mdEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977966; x=1686569966;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kjK1d296F5IZd0hzBci5YaKy5tF3t5fadSlSFaXVzbQ=;
 b=BfDXWgsmXVgJSZs30YM7DI8YEouLH8kVd4fBOqMuiz18eni4R9Tr81E3S9m3xX094r
 LOih7KBjEUfd/yZHoDmvlt35wjmxd1yvv6v0mXA3sbrCwhALsJdZpTS+ZafaHBwNTh6+
 /KtElWVSqZ8qr8lOsdueJiOw8Ski5+scyDlPrbAQvSyyFZYxqUnPFOnitduHYgnkoIYt
 XMLXi6Y8ykTkBb/3EQCFvqa623MQTnmTJIYGNLIbNTJExDxj1iDzH81hv5ighZ0LuHsQ
 Ff95tFA5FXiY5m3s902YRjcBXLmbPbcXyufPi+RcWYuqyYK2kMvZqPlAhE2xsGIJDLZP
 xjRQ==
X-Gm-Message-State: AC+VfDzZzY2n1YchfQmRuNinHxQT2l4C/NaZUd95Swnsf2GlISlzzqle
 NXBLlKjcw0oW4CnRwo/cUNGqMLIMqY+/RSUd2z6CsA==
X-Google-Smtp-Source: ACHHUZ5Xpm/bVQvNuGsYWOGU89JsB6xYAu2cGMHS2Uma2ZLm+J0Qr5QYwi5R4IlddZoaux+XnboFJw==
X-Received: by 2002:a17:907:7ea3:b0:96a:4bca:83fa with SMTP id
 qb35-20020a1709077ea300b0096a4bca83famr7997635ejc.35.1683977965929; 
 Sat, 13 May 2023 04:39:25 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 jy27-20020a170907763b00b009663582a90bsm6813299ejc.19.2023.05.13.04.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:39:25 -0700 (PDT)
Message-ID: <5cc9f09d-ed6d-be12-8c40-7a16bc48a5ca@linaro.org>
Date: Sat, 13 May 2023 12:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 20/20] target/arm: Convert ERET, ERETAA, ERETAB to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/12/23 15:41, Peter Maydell wrote:
> +static bool trans_ERETA(DisasContext *s, arg_reta *a)
> +{
> +    TCGv_i64 dst;
> +
> +    if (!dc_isar_feature(aa64_pauth, s)) {
> +        return false;
> +    }
> +    /* The FGT trap takes precedence over an auth trap. */
> +    if (s->fgt_eret) {
> +        gen_exception_insn_el(s, 0, EXCP_UDEF, a->m ? 3 : 2, 2);
> +        return true;
> +    }

Missing el0 exception, before fgt trap.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

