Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C830EACB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 04:17:39 +0100 (CET)
Received: from localhost ([::1]:49228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7V9G-0001M1-6B
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 22:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Ueb-0007dp-K1
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:45:57 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:51907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7UeZ-0005R3-0c
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 21:45:56 -0500
Received: by mail-pj1-x1034.google.com with SMTP id fa16so411651pjb.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 18:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ydw+7UpgfZX2nwrRo6ULLHStKp7KdA95eR8kGncokg4=;
 b=dH476bD6pBaWxo+VtajU4qGWyOuevrz5VddpJuA9Qk9Q5TlniLiy18t1GrqBfbRH4M
 J/Avx/5FHIh+HjnKXG+dd9qcVmGHSYdxXAkMqiX26fQ80TrgChVmu+hy7qoiVerWZ3PV
 aJF6ELL2c2Mp33kXSMfzvczUM1AzB5q0mMt/D0hBFIW412ekHDcMIScNVaky06bGIzeX
 vzecEdy44xZsQhtirSwicvFWlPQDasNWed3/aWgJjoDqjqsHq3rvbKt50rr3JrXz17Nt
 FHMJBAQzgvGpfGWETibxtDVx0fBr4QOxduGAsTo1229oBHhOYTakjPN2SeXUFlDmCXNo
 ZoKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ydw+7UpgfZX2nwrRo6ULLHStKp7KdA95eR8kGncokg4=;
 b=a547UpGw2UNf8XFftCYEbwQ//uuUvC/lgRWbBqJrXqRUSWNXUU4QQBDJ99R5B574pZ
 E6mho8laKFNDx05x2K3icpYIHDbJE2C9ipwZWWlwVEDvX0+ZwUWLHlhqhjbKN+7QKBzt
 AXQsQdHqn59t2i44bdboqUl16EzcoaD+T3+LMEmlc7ufd/RkqG5PSvxyOpQ1nnFe6klv
 k3g1TiN67KgOD8qpsZ0TyaX8++AAeMwpezk7d8D74WdtjdnRjtN1tFxytx3fB8oHCOPa
 OjGUkfWLqlQQnm/+j8KZSL/cU4QlWp1WRaMX++qo++CFY0RC7+e0vYXsR2QMe8fhCy7i
 +3HA==
X-Gm-Message-State: AOAM533QJaElpy88OJehS0Y7kuDdCKISitl2JqqhznkIvKYzfuPXz/XH
 9TDyMQXdYrhX22MgqJRv1XIdAg==
X-Google-Smtp-Source: ABdhPJwSrJ0zxhBsFphth2aSAvk0jO8J5yI2ndkMwn9RDT6Dp4Zf1FayYuBVFuOjO2isJp095L4fSg==
X-Received: by 2002:a17:902:7481:b029:e1:2cad:52d2 with SMTP id
 h1-20020a1709027481b02900e12cad52d2mr5886931pll.35.1612406753642; 
 Wed, 03 Feb 2021 18:45:53 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id 83sm3627021pfu.134.2021.02.03.18.45.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 18:45:52 -0800 (PST)
Subject: Re: [PATCH 1/2] target/cris: Use MMUAccessType enum type when possible
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210128003223.3561108-1-f4bug@amsat.org>
 <20210128003223.3561108-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c92e6957-8e17-e11f-e269-888b8b1b3c84@linaro.org>
Date: Wed, 3 Feb 2021 16:45:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128003223.3561108-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.178,
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 2:32 PM, Philippe Mathieu-Daudé wrote:
> Replace the 0/1/2 magic values by the corresponding MMUAccessType.
> We can remove a comment as enum names are self explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/cris/helper.c |  4 ++--
>  target/cris/mmu.c    | 13 ++++++-------
>  2 files changed, 8 insertions(+), 9 deletions(-)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


