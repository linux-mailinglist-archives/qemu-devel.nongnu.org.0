Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA325FA022
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 16:23:35 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohtgs-00007f-DU
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 10:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtdX-0003ra-UE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:20:11 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ohtdV-0004Fe-Eu
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 10:20:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id i6so5451010pli.12
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 07:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=srrNkT58I3cvoIqssDj2sKYEDwui6He8sTYpZbKvUyU=;
 b=Rg85uKhtGxeGgNJLRBsijXMbeAnKVcNFElxnly7Tv/6Oiq9yZM9qJzt5b5qNVI4dJV
 3yHTs2w8pZaskKOjOgHQ+Ld1jzfkEQfFNyz8BnfyXxKHzNHtXKXIOvLk9+98TI2PjWGc
 P42ScJ+fXJaQ6hsacqy6AUL3ZGaOudg2VhDudOkxjkq7ob8s3DgOQQHBzBP2dguWR5Dy
 Ep3s7vRcr8NaQv3fdRrfxvK4rz8XcOV4fEq8hIew5U7y1iAr21aRGAjy4MXXEeOwCOuP
 ebHE4RqeBHz0+JRC8o2QIp0a/Ur3THgmpBv+vwXCdWRXQP26BbAmGv/BUToVr1kRbCqC
 q+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=srrNkT58I3cvoIqssDj2sKYEDwui6He8sTYpZbKvUyU=;
 b=iV4E5IHtzTxhRoIZNf8QbGhG+itHnQhGA1avhD3WteJKL6iheHjSS47Ms0nLCWcmg2
 8jLiYj8F2Bv4zxe2HBka+gxCze0ngYaFMfHtsEOpEpUXtnvLN5StwURv3TQYdSjjoZ+z
 XxEbc69/n3Q9GPqsA4bNWeNXyNgs8Ffwtl9gjYSWuTHr7Am7E1CtiXxh1z6BnfBDsvkH
 p3+tWQWqvuhDpsTDVqFnf6o8O5sIj55ZYpHyS1KjNmbd/nYSWNYBHdjGEUbAtbV57hn0
 6xMv2OToA0iDW75/zTe8RbJg0I9A9BfN9k5Uf0Vgj9Bn6VKEbXGhS0+mp5pxPeKr0b3r
 CB6A==
X-Gm-Message-State: ACrzQf0s0u6TCzXCzw1FPLbCUolpIb1lODTYNgCjkQsmxz/2dAAflau/
 9ALs/Lg3NPYbAQbkGTlWxJzkhA==
X-Google-Smtp-Source: AMsMyM7ZVB8kw//kGS77XNeoLlrScFAu4LhBzyPr6LrZN9QrUPIWKz92gyFWG/cvkz0ybEwYBpHwtg==
X-Received: by 2002:a17:90b:1e43:b0:20d:59b9:751b with SMTP id
 pi3-20020a17090b1e4300b0020d59b9751bmr901817pjb.90.1665411603225; 
 Mon, 10 Oct 2022 07:20:03 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7?
 ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a63e914000000b00434272fe870sm6384352pgh.88.2022.10.10.07.20.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 07:20:02 -0700 (PDT)
Message-ID: <82e86c6f-4304-119a-49e6-d0b16bd9a7e0@linaro.org>
Date: Mon, 10 Oct 2022 07:20:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RISU PATCH 1/5] risu: Use alternate stack
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, maobibo@loongson.cn
References: <20220917074317.1410274-1-gaosong@loongson.cn>
 <20220917074317.1410274-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220917074317.1410274-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.007,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/22 00:43, Song Gao wrote:
> We can use alternate stack, so that we can use sp register as intput/ouput register.
> I had tested aarch64/LoongArch architecture.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   risu.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)

Good idea.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

