Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A583A7181
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 23:44:52 +0200 (CEST)
Received: from localhost ([::1]:45812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsuO3-0002FT-5e
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 17:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuN4-0001CX-QO
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:43:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:42700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsuN3-0004D9-9C
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 17:43:50 -0400
Received: by mail-pl1-x62c.google.com with SMTP id v13so7347950ple.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MsP8k49LHApyYCRD2stYRXxE0xx/PDQBMlBRCPOSz4M=;
 b=M/Ta5jaQ4ywY6FdaSdSigmEOamxO/nIciuxjzvrZApjT+M9wPBhX4BxKfPx5fh9uHT
 VWD+zK1EGH+Cjs5ibVKerZ1fXodOIXx0l7X7MU8x/uVt0EdTt/C3PtL2tIuydFEycGuM
 fK/nIbxxiPKDm29RaAIpsjs7dl9SPuIFMYku5NdGjYtb7YKHP/kQ2ChN/e8d8jhH4FEg
 s/gqb4KIeC1e2wXkkijaud7I4eGFvUSR6ucr3IOl7TnGlV1B0aBPR+s8c8BdutBlIZSb
 SDN2dU8H6HTOpaIGPyzxqSMYNQSoCZeLlxguYsaex3BmF7j1pX0Bs/IzZKkrfuRE7Chw
 KLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MsP8k49LHApyYCRD2stYRXxE0xx/PDQBMlBRCPOSz4M=;
 b=pAlzfJvDNX0gAA4IGP+8LM2HpbxtdsxBdsXWkoBzpqWVUv6Iytr19NtPYiZlXjm0Oj
 LwrHDqZkxJOhYlHi+bRvlDuhOQMfyZDtVCuSJz9uftSOPrJJ9tA+jLfitFgQIbR9kkW/
 GgWleCc+7T0IdPEslKAyf9QXJdrDTyD93JYTToWL2rQCvodXhobhqy660LY579NrOYXL
 +7CEe6wyk0oiFYzOT7Df8N8kOu6Ulmr8ey/eZI8Ruay1rmXawVlVUETib7PnTVmnOaBP
 j/uYiyrS8ZNvYcQUqyujRWsXhSJJXC450DQb3pvOkj5ih4OqQp7R2Ipf+H7tDMDaHp3v
 6qXw==
X-Gm-Message-State: AOAM532ePzm13dv19rlJ5A23CxREIryiM/SRqj+3s2bKvB/ISk5cZwr7
 jma5CF4aDwYwnHt/IrUKxpM8sJlJnTBrMA==
X-Google-Smtp-Source: ABdhPJw4kIXxNhjcxd7n2CMeu8nfpQ/Q6uJbrvxPifcrglj4GyTwfZaJMlJppanxa69eInRkSf1iBA==
X-Received: by 2002:a17:90a:d705:: with SMTP id
 y5mr1348305pju.20.1623707027538; 
 Mon, 14 Jun 2021 14:43:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 mi10sm373811pjb.10.2021.06.14.14.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 14:43:47 -0700 (PDT)
Subject: Re: [PATCH v2 45/57] target/arm: Implement MVE VQSHL (vector)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-46-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c01674ed-992b-f863-fb84-938ef08d38da@linaro.org>
Date: Mon, 14 Jun 2021 14:43:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-46-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE VQSHL insn (encoding T4, which is the
> vector-shift-by-vector version).
> 
> The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
> the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

