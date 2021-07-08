Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCA3C1A94
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:35:12 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ajn-0004Ay-2j
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1ag1-0000bd-9M
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:31:19 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:38659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1afz-0004ck-Ne
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:31:17 -0400
Received: by mail-pl1-x632.google.com with SMTP id x3so3785363pll.5
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2FlDev8BXJ8Wyo3E6jwDC0scx/IcSV18ZbZbNTAF4R4=;
 b=FRWjXf5jsWyiP+wk+OnEhurUQ+y8fyOBf3T2FUi+GukNmRMfNB5aTW2c57495l1Vj0
 P3s3hrhblhX8x/SPwBjxMGjur1pzQX519TJRi8m6wfJrIVFNHeaxj8lVfFD+wlZGUpv7
 PibN8aNBBBDpT3pGNeSivNyYi76nJ18/vDJOKU3ToBTOneSkrxQMNLjsy+9EwlBRNOJk
 iWhcFhbi0rmTiGCZUdu7eEfl9jZHAmd6R0/CvwN7rgdbsRWNfmzQjSNGR1RTgvgrnLQj
 7W3Wy4w6YoG/j41UWh93pEmhJlKWXajYLkPBd9hAzJPpySllz7YPYXDhOZLZcEcE6Z7D
 1rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2FlDev8BXJ8Wyo3E6jwDC0scx/IcSV18ZbZbNTAF4R4=;
 b=WP16JhZW5lBoqmiqfohDKMyr0A6AOe/OTfMfqdzSAtDuNbd5+77BAZapdTaGolvdLK
 br2kfmteiHMQsLOW43TOnSs/6CJDaqElDSkrWPPwnUD+rZw5symfjD3ntMiXZ2T9wYDZ
 n/JeigAD2ElTxHOBp2IWUP6qTxYIFYjCr+4pTxGzKyu/+JM3p4jaEjv1eU1PfVVYZlwj
 eTjLkK+uKu0iZg6M1ulkdUFVnbRgPg3RTmDTWx1IcYvO3OM0Q1tgFkEXjP13YXhAfswh
 9tc480eil1NGtsIWoPvcVogKQClZqG6yyakXX2oz5XX/ZCSlsx2Tg+7s0LYwS9xQQdit
 s7Rw==
X-Gm-Message-State: AOAM532UTaMAXEl8EjN7tGZADC4KI8U2oxW+b+Y9gkinfM/Y1kpCswnY
 fsXTcNsjrkUuh9CkUdyYA9ddGw==
X-Google-Smtp-Source: ABdhPJzyMWPhf4QnYCmZV38qc0wmbqCBVCUxjaoC9sQzDYLMh3Cowp4YDGamZyZXNRpPCYEhKKhqfA==
X-Received: by 2002:a17:90b:214:: with SMTP id
 fy20mr6655535pjb.62.1625776274323; 
 Thu, 08 Jul 2021 13:31:14 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q67sm3828462pfb.8.2021.07.08.13.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:31:14 -0700 (PDT)
Subject: Re: [PATCH v2 27/39] plugins: fix-up handling of internal hostaddr
 for 32 bit
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-28-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d64c18fe-7431-75fc-9034-9c1f4cfe5753@linaro.org>
Date: Thu, 8 Jul 2021 13:31:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-28-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> The compiler rightly complains when we build on 32 bit that casting
> uint64_t into a void is a bad idea. We are really dealing with a host
> pointer at this point so treat it as such. This does involve
> a uintptr_t cast of the result of the TLB addend as we know that has
> to point to the host memory.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   include/qemu/plugin-memory.h | 2 +-
>   accel/tcg/cputlb.c           | 2 +-
>   plugins/api.c                | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

