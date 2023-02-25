Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0876E6A28AA
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:55:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVrG4-0005hv-L8; Sat, 25 Feb 2023 04:54:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrG0-0005gt-7u
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:54:21 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVrFy-00023N-Nm
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:54:20 -0500
Received: by mail-wr1-x431.google.com with SMTP id 6so1543648wrb.11
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V2QB5JomT5K9bcn7VNcYX4T2nBzZrx3+X0bB66OnSGY=;
 b=jD/d546jINDRAbQNEpiu97MAlRwz3ZMM3746ZJtlkrnHDgsH8A1X4pDJEtzz8uXIvd
 bWYgJunfua8s+ahNT6RRcZ9FV2pxM/mYn50KoWxFS1oUGbGHrK/OVjTaSdU5nFqFyvhf
 zDwiqGQOy7YbPJNenqnNgS+ki17xdDTdUyG6WcGkYs2xT7gRKFnMgJrd2YAOSx1QLFgP
 QuLPTWHQy7yw9USu0lR9APYCk+WJFHTVUDyg4h6RgmdOTxPkFXri4hXZUvNOMjh6vJij
 A3VvvL+5+ZFmjxz6s/gRXPiVvrncxp1G6d7qyC4aQNqy2E7Bo/N1BD7arIwPkzgRoWeX
 6EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V2QB5JomT5K9bcn7VNcYX4T2nBzZrx3+X0bB66OnSGY=;
 b=mUSvmvifND3JO1Le5B06ObilEJ8DxPy9sfBN4dEMZwCVXEEBwkd4Pi+Z64V92oCYOq
 5Tn/mtQ6+Zk4Dbvpy8oIhY1v5eefBCFNDMVJb/XX59IqjCoyEGGxevo+zJLk13wSBPu1
 ybLjzTmBSrs5WyFn+AbAET3tXrxmAZYhrX1Ye2mbMKvNeD4bZnPIhNcLQi9edI6Ly0W3
 oURw+6GQ0sWsPqxjgojprQnvIA/47Ge6iWxZEv1VM7iJuQnsYmmqA0C3dSerTfmWndty
 Zr9gL+/6FD5TM9iyFl+FuLAFhHqLpHyhJhz96Ql4XzQjP3xa/jFEEDITWFd5BJ1Rif5W
 4cfw==
X-Gm-Message-State: AO0yUKXKPxLAtZiMMoj5dDRDMjTEN4ouN6mroS10HTF7uaKC6F7I81bH
 CryvCwG4LdIubz5AmriwESdkUw==
X-Google-Smtp-Source: AK7set9KVGbUs85w3YAN4quxNkkU4X+ZFrdcgYxQ90phojNOwPPVOHSW9Qg83RwkWrxubieWXLpAvQ==
X-Received: by 2002:adf:e58f:0:b0:2c5:a07e:4bb6 with SMTP id
 l15-20020adfe58f000000b002c5a07e4bb6mr15363621wrm.33.1677318856675; 
 Sat, 25 Feb 2023 01:54:16 -0800 (PST)
Received: from [192.168.136.175] (120.red-95-127-35.staticip.rima-tde.net.
 [95.127.35.120]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c510600b003e20a6fd604sm2139551wms.4.2023.02.25.01.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 01:54:16 -0800 (PST)
Message-ID: <da634383-48cd-8b3d-b5b0-b6ca598cf1e2@linaro.org>
Date: Sat, 25 Feb 2023 10:53:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 14/30] tcg: Use tcg_constant_ptr in do_dup
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
 <20230225085945.1798188-15-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225085945.1798188-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 25/2/23 09:59, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op-gvec.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
> index a10d406bba..877b0b659b 100644
> --- a/tcg/tcg-op-gvec.c
> +++ b/tcg/tcg-op-gvec.c
> @@ -630,7 +630,7 @@ static void do_dup(unsigned vece, uint32_t dofs, uint32_t oprsz,
>        * stores through to memset.
>        */
>       if (oprsz == maxsz && vece == MO_8) {
> -        TCGv_ptr t_size = tcg_const_ptr(oprsz);
> +        TCGv_ptr t_size = tcg_constant_ptr(oprsz);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Can we remove tcg_const_ptr() or inline it in plugin-gen.c?

