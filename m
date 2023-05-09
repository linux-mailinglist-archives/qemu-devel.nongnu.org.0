Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C086FCA1D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:19:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwP7o-0006eB-Qs; Tue, 09 May 2023 11:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwP7n-0006e2-2A
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:19:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwP7l-00087C-Lt
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:19:34 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-30796c0cbcaso2391039f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683645572; x=1686237572;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=elCVJKmdRmNvHUXNlfUxaXprAQ1ZPFq6svcP6msPcbo=;
 b=GJ/FFuHxbQmZ8QQxSA0mpfGQIZ1PIaJ3Eb33XSd/+3cCN0xPDhNQbdav54LD6M2jfP
 hldwIcskT2r+Fkl7sLgEssk/wxSTBhcHqYUMW5YqISEGh6/b0GRq09jI6D+qeYOciriP
 XauTXEX/PJzB8x78HuFmIHQ4TvbruQ8ESnfSCX+Fk+CqhrEs2bUL7vT9O2lkGEr/EtRc
 z2Dwt6V/4+EalRFgDSZQvQQ9piIzqCaH52g21kVCmHIv2aM5zw4hrclLEhNGaOvb0Itv
 vaWPYNR2OUswMyDS95LBGH8OVYZycM6WXMkooJuwAA4mC0Ew34oBSaYsAZLozZDwZ9DH
 Xu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683645572; x=1686237572;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=elCVJKmdRmNvHUXNlfUxaXprAQ1ZPFq6svcP6msPcbo=;
 b=k68Vl7ExnLJQEbg3zDjWdQgAxOfKCGPZjQ0PjUSyHaeMkDDsJb51nmOiWpzd+KqT9z
 jeKVDkbv/hFbXdStyR5IuZSlm+F8nmj1dL6sYXMjv90WEhn0jpk4op7l2vU0+wJu6wdY
 73/BRZGvg0FUPVBOgwHfLRDMr6A8sE1OaCp3Z5EYuHZG80XnDnn/IjEMoliVne0OYEYQ
 yKlSiuM29dMWbjCCU2uH5vQEZn57s+Z+1irtDuzfKEgVxwPnK9InNykmS5HpV2Gk39rI
 R0B5dbBtx3zNRXb+WrroQ3gLtTnX4u1p8iPfCgpEvZ1ow7ovJ5ovaKoJK+9tvkIB5gwW
 Uv8A==
X-Gm-Message-State: AC+VfDwdL+2bJnjRpnaGSN7CYxiPK7wZQPAiZPscUlGvnVfjxLFMU4rs
 xC6BYPWvHQHFiPYf3Jg+T7j3ag==
X-Google-Smtp-Source: ACHHUZ6N/ZvcDwFu7bk4+7yVHg4cAg/656fPnyG6z6iB3kdlMKdMresZdbd/fzVn+HfQjtd60YOUgA==
X-Received: by 2002:a5d:43c4:0:b0:2f8:2d4:74ef with SMTP id
 v4-20020a5d43c4000000b002f802d474efmr10375331wrr.43.1683645571869; 
 Tue, 09 May 2023 08:19:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 e12-20020adfe7cc000000b002c54c9bd71fsm14671134wrn.93.2023.05.09.08.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 08:19:31 -0700 (PDT)
Message-ID: <12d0df91-4ff8-f1b0-fcb4-bf84514077d8@linaro.org>
Date: Tue, 9 May 2023 17:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] target/m68k: Fix gen_load_fp for OS_LONG
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230508140857.137405-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508140857.137405-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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

On 8/5/23 16:08, Richard Henderson wrote:
> Case was accidentally dropped in b7a94da9550b.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


