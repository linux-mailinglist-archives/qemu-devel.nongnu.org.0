Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C36F5622
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:27:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9h9-0006xj-QC; Wed, 03 May 2023 06:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9h0-0006xP-Vu
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:26:41 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9gy-000274-Up
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:26:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f195b164c4so31615035e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109588; x=1685701588;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rSV2v3gDUn8KOmznTfeOMT9/+H6Q5btx5Wiu1Qinc/4=;
 b=V6AhAJH/tPpXTQDmFxS+8UrBVsbgGnalOgaq4jN5XHFcxPRxksWDEOJgYGb0GxblZy
 A3irkh9/Y+UYs4cLwyow9x8h+azTQWm1c86ve+ojiEDKo8CDNFyQoHsxz817EKksovVV
 19mqZXQeY8s1wyadZazPMAAZFqErvLE5kPF5+y9erDOelJkeWuzy4KP+Ixt4zJSJAmvp
 9Ul2buoQVpSyH1U7AFRvOik0VS12qEXgl/8RXhjsTDJEoJRQY4/tJtSQqiZjwzFrvSUF
 jEAR2rBGvrRs/R5vIBKxNccc/VqNz5by8+wwBtmkklJh+AOMXQhwetomkEWMTa+2jVwZ
 sWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109588; x=1685701588;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rSV2v3gDUn8KOmznTfeOMT9/+H6Q5btx5Wiu1Qinc/4=;
 b=c67Vhm/AZ9EalvCYBB7sOb3t8ct3hyA3WbuxVAacZFPqEEGFvEfbyqeTXWpNiFEVU3
 ie+SYsrr1Df+ZJZLEmU+vYzrLH/SUrBpTczZhlF7fvIoQiBmWKA+S6xOi44OJ2cVU4qP
 LCVvIq0c2aDZoQnZp2w80Qlb5X+nuOavht/B7eLnQGSgUknGOuBoZ3IJz8IWhklilMo/
 v6gD55kuKkjewqVzezOI0Y1McD+iqg2Y28jtj75rzKEXf9I3TXS3KJXxpf1xLqvW3592
 tXN8LxaeKtkIufrpVzUDrDvsFs9MpablbtAybkyWLzoAInKytEbqYh0LIGFSiabNiqbL
 UjqA==
X-Gm-Message-State: AC+VfDwMoDONSFlKBGJDM6pOTGKA0M3CT/Cl9iOAVoGx50AVxnvh1I/8
 SYE206Giyi+TVEOnIN7NLf4fZ9en/LA3F0F+1+oHmg==
X-Google-Smtp-Source: ACHHUZ5CHqy3ojepICieIPAPtvMIf2VJI6v2s1kyEm0pFqyXxWZBfZQVu3ZzIJY+uvyDIasRalkLZA==
X-Received: by 2002:adf:f94f:0:b0:302:5d34:38a7 with SMTP id
 q15-20020adff94f000000b003025d3438a7mr13030925wrr.36.1683109588317; 
 Wed, 03 May 2023 03:26:28 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a5d6b10000000b003062765bf1dsm10196477wrw.33.2023.05.03.03.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:26:28 -0700 (PDT)
Message-ID: <52d5437e-8bf9-7cc7-325a-af3b2dc9668b@linaro.org>
Date: Wed, 3 May 2023 11:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 11/22] hw/alpha: make E1000_PCI a hard dependency for
 clipper
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-12-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 5/3/23 10:12, Alex Bennée wrote:
> We can't just imply it as the board will fail to create otherwise.
> This shows up as a "make check" failure with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/alpha/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

