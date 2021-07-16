Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03A3CBA9A
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 18:36:58 +0200 (CEST)
Received: from localhost ([::1]:50960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Qpd-0008UA-U1
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 12:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qnz-00062p-Bb
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:35:15 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qnx-00008l-Oy
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 12:35:15 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso7854902pjt.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lkNxYiClYpExWrI+5z0GCVb5lYeWc3NCbIKm6TYm4Fo=;
 b=Dn1TzQ+g3d5OeaOvIDJ+cWccZ52c0JXItCQZdDdPgVdStiZ10F9gkSSXrOqOhR+A/B
 3p+wIKzgsQEUuZDc0/FZpwQ5wf3A/8K97ymiOJqDD94qDhjlaeFYur7lKGUheqF6Qvvh
 DTG1omaT0auOuCFo7bO+YmVIv1/tDshMnfBRQTEkMgybtU/+jq7L4dqyuvaRxRo3e4Uj
 aO6j9bdpQnTsYZf35sjFP08f8tx2dthEHOw5yG8xn2rQehbY+KfVqa5pZts1HN7b42lR
 xlu7EyJGMMrRO5KAaORvoZblHgiYpUIPU+pudFxSOkydqlOhfWuC4fC3GkHqAskRgr6+
 ZLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lkNxYiClYpExWrI+5z0GCVb5lYeWc3NCbIKm6TYm4Fo=;
 b=dD2YFIowMjFusYbr929LZP581LoaiOcvrTNo/YdOqpAyQTY6qAARV4knNYX2EWCgvj
 BdTvVLIxb5+B1CT9QKtbpdrTaoaKfNfBc1N0zj3DqdliCzqK7N6CKXcKPb2S/6J1Xc3J
 UquHqYcEtDPSqSKLuu915flm6l8PkYA0QDNQn4swQ4K8Fgl2Z1aDg4En1cqlYlOOniLj
 Sj4xMON4Rzj2rETy1dOkmpfzQ6fzNe14bApD/coB+krhhirY784ygLURtGwD3771gDvj
 //LGcbYL8fyTUJ6GAdGRKaoOpgZcPU8j2DFtUwJQE/bjs5k0fLyO2ZOgOvsS2oZ8fgww
 FjZQ==
X-Gm-Message-State: AOAM5304loDUWs1lhtaoETqj8vtlV3CPPeo8GH93ycTVFA4lKGmzE/lI
 Iz939glujePjPYy7/dGfXwKe5ufSc/U8aA==
X-Google-Smtp-Source: ABdhPJwWuEkn7dexU9vS0csyQ7ZCNaIZoIJ/ZotNczbUdABdcjhUsXpugkSPGimOicmu0QtnnJSYpw==
X-Received: by 2002:a17:90a:4404:: with SMTP id
 s4mr16609137pjg.218.1626453310523; 
 Fri, 16 Jul 2021 09:35:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 5sm11732943pgv.25.2021.07.16.09.35.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:35:10 -0700 (PDT)
Subject: Re: [PATCH for-6.2 07/34] target/arm: Fix calculation of LTP mask
 when LR is 0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bbb8d53-7772-d941-ba45-1f920a5ccaf5@linaro.org>
Date: Fri, 16 Jul 2021 09:35:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/13/21 6:36 AM, Peter Maydell wrote:
> In mve_element_mask(), we calculate a mask for tail predication which
> should have a number of 1 bits based on the value of LR.  However,
> our MAKE_64BIT_MASK() macro has undefined behaviour when passed a
> zero length.  Special case this to give the all-zeroes mask we
> require.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

