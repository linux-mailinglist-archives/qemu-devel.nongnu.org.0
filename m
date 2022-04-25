Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244EF50E74C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 19:29:17 +0200 (CEST)
Received: from localhost ([::1]:53750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj2WR-0006Qi-Sv
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 13:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj2Ul-00055c-Ao
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:27:33 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nj2Uj-0001Dm-SO
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 13:27:30 -0400
Received: by mail-pl1-x62f.google.com with SMTP id d15so27808575pll.10
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s7uwrdE35sngzO12baBbL3qs6NQ2Fsdd0jBAh7tZ/J4=;
 b=WVOzOcMNLwVLZS3LAvtFhQ3MRRpuA+MBGt02yAflbUpDafTAYCYFB5xjXwqXlkKKyz
 0/vG6/YtnJ2zTtvmiIIzsOr4mcXdetS6XpAYyIaFf/r72DvgSeEB6AOvQrTvU6sqE74m
 dk98PDBZxrzluoOTJc9DtARPfNzq1DdQg7SH0gymR8ltuctpYX1+4MJIicZ6k4ix6XeO
 wacVjjrAISot7dxmzoyhnFy6rP4zccgrvvb7xj3O9S4VZJuHdA0NeEZ9YcUwXGonGnih
 fw007sWPd9/7bP6J1M4XfthzxsRZfDNCDwWxEZ/uM3J6gBTvldptT++1IGT4WoG34W4/
 DdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s7uwrdE35sngzO12baBbL3qs6NQ2Fsdd0jBAh7tZ/J4=;
 b=VYEFyy1TunN/lhKaLVbvl5BhSmunzlxQpwMB1dfShbb1UJnryRA+vu0A/fAr4T15y4
 jG3VAnK0Dt/UthehCuPlwHZTk3q0AVbos2RYhYW9ihDbLpz02W7gvc7ApfzyqOi/ITlX
 cXj81u+1Bg3/EZ7vYp50L6WAVKQp1U/fLjGbnxPjgQ1j+I0b6n0YpZcBOsNbAGz3/DvU
 d+2ZNqmKQGypBMQe6robAmfSexcXwYjJsvCR2yPN9hy9djbSw40YoeVw7E+ky2SaS6So
 Md7OVreboEgRo5LiN5aIpw+Co3QqoLOSBmya4yISKC5mpzjZFXJQM2YuT0n7oSsqbxVz
 NUzA==
X-Gm-Message-State: AOAM530VxL55NiVuXWapheX4xoc2BEsbyiOu1QurSowdaMgSmgiHcNSZ
 RWbrnDKRC6jeOXy1L6Je6Pim0w==
X-Google-Smtp-Source: ABdhPJwMY/kBaQ/PGwTVy8bmE5RzkEoiX72SaRg6K6kKK2QX9ucJjVJWkJVmLAbCL6TlPVlWsDiaZA==
X-Received: by 2002:a17:90b:1d0c:b0:1d2:a91e:24dc with SMTP id
 on12-20020a17090b1d0c00b001d2a91e24dcmr22362197pjb.165.1650907648307; 
 Mon, 25 Apr 2022 10:27:28 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d3:42c2:9c7a:9323:2295:e9c6?
 ([2607:fb90:27d3:42c2:9c7a:9323:2295:e9c6])
 by smtp.gmail.com with ESMTPSA id
 j29-20020a63231d000000b003aaee8ccba7sm7613750pgj.64.2022.04.25.10.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 10:27:27 -0700 (PDT)
Message-ID: <2800e646-598e-f295-667f-9147950a8b79@linaro.org>
Date: Mon, 25 Apr 2022 10:27:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 03/42] Add AVX_EN hflag
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220424220204.2493824-4-paul@nowt.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220424220204.2493824-4-paul@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/22 15:01, Paul Brook wrote:
> Add a new hflag bit to determine whether AVX instructions are allowed
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> ---
>   target/i386/cpu.h            |  3 +++
>   target/i386/helper.c         | 12 ++++++++++++
>   target/i386/tcg/fpu_helper.c |  1 +
>   3 files changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

