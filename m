Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4DA674D98
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlOu-0008Qz-Ue; Fri, 20 Jan 2023 02:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlOr-0008Ph-Gg
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:21 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIlOp-0005Dm-Ep
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so5178246wmb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RXYeRnu/87Mvcfk9IZAc+Dm78jV8PD58MD1by96OlcI=;
 b=JXYuTJ7PTyp31jbxvPsjZ67r5SqSnMKvR32tfqhfdfZr7wqlpsc10YCihuWRM2GVwV
 VasjfEOYsX81JsMrnFqixOLMo2miJVwfYcALeCrDWCGxIGz9+LK5yFZW6KrKNV73SxNp
 TYH7EjGqDQ09JSWKWOHynz+WicWN1VhpyWVQddRY0oCKBUF3M5oK9/NVYiCoEWOYPrD9
 2I/kkFunbo+hF3OR2YhE+oKCLdbbvkxZilMU9sDr7ps1507Sq8CI2+Dyn1VZoLAIevm6
 WmpLVUbbe+VZDFrOXhP3jyV8qBG/waA9XsEF5GGsQQKCSKVoUwi1RqYCd/dYP5YSJ6Vf
 TMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RXYeRnu/87Mvcfk9IZAc+Dm78jV8PD58MD1by96OlcI=;
 b=sGBG+bxDguHZ9eHRS93ue+7hMp/JDUfGdvns1/sKnMX60RHY3iY6frCYxS56T7Nh5d
 h0KZNGqWPmKXprcl11MssHr1Ib85DaPtFrn7kDBqnuCqFKgzua6MMHxLMPu4QuwY3JyO
 AwTekHPKt818blKJxwqaKfIUVHCt1voHungj+pUw5zEKNMTJGsYhZq/utfRf2FGHiul3
 /3nE8xWVoTqvtfXIDRN8VDt2riHo/9xApkdIM4FirppWcm4utxLbHYwX69IqZbbjSJ+w
 3rcydZEbiiNdJgmouQgVZL/Jkif0DZebZk8RYPyOl9hGFTdx+1WRaKRb1OyaWeEjkVTA
 H9Zw==
X-Gm-Message-State: AFqh2kr/4HN+fWbUr6+nfSECHxRkmZbBY1RaojSONGioPZe2AdAX/oWK
 ArUhOQfKZRX14+Coze8E3LPiVA==
X-Google-Smtp-Source: AMrXdXtBv6zlPIzI7+xxUxF5fu5QMZpPACWoxqtwtxIeCT/8ikExBMJHk5LGx8c/r35H67gWxLfvzg==
X-Received: by 2002:a05:600c:4e93:b0:3db:d3f:a91f with SMTP id
 f19-20020a05600c4e9300b003db0d3fa91fmr10640560wmq.23.1674198077576; 
 Thu, 19 Jan 2023 23:01:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm1287281wmq.46.2023.01.19.23.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 23:01:17 -0800 (PST)
Message-ID: <4410fea1-e463-7445-da9e-ea555c335b96@linaro.org>
Date: Fri, 20 Jan 2023 08:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 2/2] log: remove unneeded new line
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230119214033.600FB74645F@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119214033.600FB74645F@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

On 19/1/23 22:40, BALATON Zoltan wrote:
> The help text of the -d plugin option has a new line at the end which
> is not needed as one is added automatically. Fixing it removes the
> unexpected empty line in -d help output.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   util/log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



