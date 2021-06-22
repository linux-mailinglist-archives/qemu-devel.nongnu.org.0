Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9283D3AFD3D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 08:48:39 +0200 (CEST)
Received: from localhost ([::1]:58938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvaD8-0000RX-MJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 02:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaBs-0007TF-Fn
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:47:20 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:47101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvaBr-0002Kf-2x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 02:47:20 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so22254350wrt.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 23:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V7ipLieEmtCEYxSmxXfHcv8AdA/TVzLpMN6TEKN2kTY=;
 b=KtLL8H7ikE6mycYLsglVv4ajb/H8XYcZ1VkejssFIM0qB59WHdvpQMROQJU93wS0X+
 DLDnx6BG9J8+Zf3k9cBM/C6PIzPWxN3KVLrAp6aPJj6ZjXcQJQszMYEUnuhaip+QKoFZ
 b+cB8v5PoQ/rxwH51MIAzXpqu23oMwpmcjKTVz45LgAHEDCD3zvn/j6AcanJd2WfUlJD
 f40PJTei96bhVxwcaUQPIRtcs39QF9ku0ZRL8k5Rv9tydsPG1bHBLB2WgYMLmixVvsM9
 x3VP0JWexiPTVcBMVSnGJaY1Li6JiPUHg/c51vBXC/IuZdVsEKmOO0dcyIGSkhpUFDDv
 6iJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V7ipLieEmtCEYxSmxXfHcv8AdA/TVzLpMN6TEKN2kTY=;
 b=FvFvxO+n2aQK+ej36/kOeVeIwrMylLl32woQw0FK+qioeBhhBbHS3gngiX/f64bRVa
 6PYhrybo3HIY/k3gxFwZW9uY8518S1IhpFwD5XzDJdUyLWQDNc0DBTG40jFJn4Mjk0JI
 jDMNzhM28oj92xtBmapGhLFSMB9DkgONXYgJ3+FQuX4Xa+h0eI8RDWD6bkqjF2Gf9mdV
 J+0z2rQwvvLKcp9peFznSJwPQUKcZKXpQWfvUZNNm2u9ShzOWQC0lFR6YsKbNwEb547e
 LKhLONJ8SIAXBd+cTXrcr/OZPxruDs2TA/lnbQSgVTGJwR6NvLd4SltVRQo67YV8hBw7
 fj5w==
X-Gm-Message-State: AOAM53210/Ek/0kBiPWZR/3AJNiJND6nX6o1cXYCvCf6dV0fmnkxt4Zj
 1pyDsTuHZu/GAGz8vy9Bbz8=
X-Google-Smtp-Source: ABdhPJyUOxrT2iOcbptMC0ST0BvNkRSVsEniCPo3T1fCWKSUi7+SQ0aERQeeaHUZi+OqnVUfJmeKeQ==
X-Received: by 2002:adf:cd10:: with SMTP id w16mr2866725wrm.200.1624344437746; 
 Mon, 21 Jun 2021 23:47:17 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id s62sm1359205wms.13.2021.06.21.23.47.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:47:17 -0700 (PDT)
Subject: Re: [PATCH v2 22/29] target/arm: Improve vector REV
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210621231849.1871164-1-richard.henderson@linaro.org>
 <20210621231849.1871164-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3002674a-ca71-8bf4-829b-92036d9d23ca@amsat.org>
Date: Tue, 22 Jun 2021 08:47:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210621231849.1871164-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 6/22/21 1:18 AM, Richard Henderson wrote:
> We can eliminate the requirement for a zero-extended output,
> because the following store will ignore any garbage high bits.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

