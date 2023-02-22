Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21069FE98
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 23:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUxj8-0007Hg-Mj; Wed, 22 Feb 2023 17:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUxj5-0007HB-7M
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:36:39 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUxj3-0003pw-6R
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 17:36:38 -0500
Received: by mail-pl1-x635.google.com with SMTP id q11so10990874plx.5
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 14:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B0lolDkaMIpYsyD0nmPYrQbl1T7dNlzCw4g2IwrWKcA=;
 b=o9DQGxOQWYtlyxkXiqHjkQz0+Tf+P4wO7vgdS0LBHxr1Dr6vZ6su+k42yNqrxIQ8ui
 lGR90XPE0ocKdHHW1PRafmSELoJe7zXJjrTEQ2BBY1PebFjK+IBR8KmFd9PHmAx+enpu
 qEbW77dbla/FLG91fgOliUTEkeJUYC5AOPX2HNWsogjudIHdhta6yKXX5UIi12Y8AJf1
 MEUGv0I+D6DrEOysugxLKNUQPdGxKCFyd4SXmoxJveYSZB/4RfZnl9/GsSP9KRow0YiZ
 AsgPmN6mOxhsHn4/qarMMUQ3wSD5/n5+My9FZaIT10I9V9Oo1asq//tvCUtJ7lSNObuM
 oZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B0lolDkaMIpYsyD0nmPYrQbl1T7dNlzCw4g2IwrWKcA=;
 b=Jk4/lUl2BLxKSYKhWliHkeuiai998yNQ2t4D9Wr2wA20MCajTbK9TSWVv2XV7z0i3d
 X/ggtCVM/dsUGggcE+0dwtlOnfmmhq5tqLRd71kMp6/hObMnAtDI++8fMaJhV1u8oJIc
 NVD3QtmWBNqSwgabbmZ4YGqDS1x8NegyJFsmYRWbUjtD04oD/ojA6oaHm/PEd0RhOQ2A
 ZxtUVqG5X+zHrj6V0iSNe0Z3N1q1n/cbWO0sGyaScvngG8GnMU2PfQUbFRxDNbxHeeRw
 p7wEb8tVYE3ahw5hnh2wkwKlb8PEfapdZ7R2oaQl2n1PJPqDTyF27o2ohHIJROzHwHXP
 eUQg==
X-Gm-Message-State: AO0yUKVrDBx71i7OQtOd2hA06Zmf3//5xtV5w5m0hasu79a0Hc03wUsh
 kY0MExRnej6eGlU4D9Nu9AbrmA==
X-Google-Smtp-Source: AK7set+LWI2hr5IAGY95Epzu+o3F4MDMiJGWaHcsyjyFdo+bqvhLfrRzuJaiUVTt12j9EzqGrWomDQ==
X-Received: by 2002:a17:903:22cc:b0:19a:e965:c1d5 with SMTP id
 y12-20020a17090322cc00b0019ae965c1d5mr9022164plg.33.1677105394829; 
 Wed, 22 Feb 2023 14:36:34 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 bh4-20020a170902a98400b00192a3e13b39sm5770609plb.264.2023.02.22.14.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:36:34 -0800 (PST)
Message-ID: <84b33d0f-ac04-ebbc-6ca1-d8c249044e5f@linaro.org>
Date: Wed, 22 Feb 2023 12:36:31 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] tcg: Allow displaying TCG_TYPE_I128 arguments
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20230222212810.53857-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222212810.53857-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 2/22/23 11:28, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tcg/tcg.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index a4a3da6804..3df2c6a6af 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1955,6 +1955,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
>               break;
>   #if TCG_TARGET_REG_BITS > 32
>           case TCG_TYPE_I64:
> +        case TCG_TYPE_I128:
>               snprintf(buf, buf_size, "$0x%" PRIx64, ts->val);

This would be for a 128-bit constant, which we don't have.
Is this a guess, or hitting the assert, or what?


r~

