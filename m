Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3865693547
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 00:29:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQzHz-0005aV-Bi; Sat, 11 Feb 2023 18:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzHx-0005aI-OQ
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:28:13 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pQzHv-0003m4-LU
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 18:28:13 -0500
Received: by mail-pj1-x1034.google.com with SMTP id o13so8812757pjg.2
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fIL98+Qa1gx5dHGtJuKzFqNV7jMKWI2izJuLXLIQ9mc=;
 b=kVJlUMhSdLQG62ZmZeLpRQkHwHHsGEKederIprRZqODfNdz/c+K05Dtz0Zr6aQOYT8
 Z7KSojcN3ugSJtM7/5I5MYLzv1iUrfRxPTRuZQnZwFUwIKJ2LkuMyTkNYI1Tp8it2iTg
 Qfxpk7gZMeXKnCEaQ+jnt9jzp4yiUTekhNqWUdp/fz/KwHYgVQhrwqDpAGlxqqhwRR3Q
 8QONbSPCPtUrjOdvcH/rPJEluFNFf2rr3WtBfaBoBpaHa2ZiUYwbRaNQcZtffq4OV5Pu
 ENN3hdlJd9HjRNHsXtEo11kecnJoCUMwtU8hNTxFIp8zlMi6pLDwpNJrCXMQ7CmJ04Un
 +piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fIL98+Qa1gx5dHGtJuKzFqNV7jMKWI2izJuLXLIQ9mc=;
 b=xXhcz7vPjqHrF6QHeLWTB0ot3RG0x8xJW344/G+5MczgHgAQGQEihN08lCp9uQ+TXy
 +GjRq2MdpCYZ5sbs789Apl6lxhP7EHl6R7OF7stYPLJHmEF+3J/NZSAPONWaBgCA5Qy7
 xNJHIk+t/7TpVco8oS/AglQ20LYfotJHJCdJT5xEsB2XCv/8ifepUEDW8QUGaS8KZzZI
 UAb3bbuQTLr3aFDX4Fuk7drIvxMSI8dcMaQYOSkI2pcTk+Q+J5CIRdquEvea5wnoten/
 RaCx8lgxJuOeN0V54r1wC4RLspBHfVB9TlcIyclQM8zLKyoAJ5XrVMa0y/m6fKXoPFbq
 i8ww==
X-Gm-Message-State: AO0yUKX7YicLFCfltB7tEW6HQFX9lQmFAoGHkIPG+LM8CxU3LVmE2eEQ
 xfvwmbSEPIzvX3phQJDif4cSIg==
X-Google-Smtp-Source: AK7set8yzcV42Z3Z/FcUwVRwnRqzvReJI899REjSNj5XGcln1ScWwlS2yJQgTWfzuBX8cLbyYDOKtg==
X-Received: by 2002:a05:6a20:3c92:b0:bb:9aee:f6d3 with SMTP id
 b18-20020a056a203c9200b000bb9aeef6d3mr22829736pzj.46.1676158090177; 
 Sat, 11 Feb 2023 15:28:10 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 m23-20020a170902bb9700b00198d1993b4esm5485501pls.69.2023.02.11.15.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 15:28:09 -0800 (PST)
Message-ID: <35c28b39-53d7-dcc5-3add-41bb0504f593@linaro.org>
Date: Sat, 11 Feb 2023 13:28:05 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] hw/arm/smmu-common: Support 64-bit addresses
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-2-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230210163731.970130-2-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/10/23 06:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set. Ensure the IOMMU region covers all 64 bits.
> 
> Signed-off-by: Jean-Philippe Brucker<jean-philippe@linaro.org>
> ---
>   hw/arm/smmu-common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

