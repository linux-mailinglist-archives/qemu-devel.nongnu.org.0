Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF511441A13
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:42:57 +0100 (CET)
Received: from localhost ([::1]:39632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUmG-0004qA-Up
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUjz-0002iH-GJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:40:35 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:46895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhUjy-0004T5-1E
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 06:40:35 -0400
Received: by mail-qt1-x82e.google.com with SMTP id s1so13967700qta.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LerSDip4kArOXibM3bHSA4G9bPSUeS1ue3a3zZwCP+o=;
 b=bSx95gEI4WrgtLjSdxUTPVLV477ZuaW2YRMP4giRFcnD1kg1XmuIqLHaImG2962dYD
 O+TeKynXZ7bbUbZUAadge57CdquCtYPKkeoMsdw2r4bqBrEMc2oUAwQjuKevofsji1SB
 ZeNi1Xx0j9BAAb6w4VSI7yljJg/urtTvo4gpO/Rln4/KOSBq/LZO25uFZRPpFR4cLQVN
 3ce+WjzRR25plgZnqoeQpptDye8nEdn98OkpX0iF0X8Hs1Y3qJcZ/d8TwxO0FBQqIk7u
 c+jeXIUS6OFv/JogeDV1M+PE5CtxUe9MgtljqC38r3vaa9DCPWtlbXH+lhxQ8PSCYCNd
 Unyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LerSDip4kArOXibM3bHSA4G9bPSUeS1ue3a3zZwCP+o=;
 b=ZrlK3PxZQvMtCf9Hr42QISIDCutIpAu8W6rNswdXrMFjSzKMGLQ32xwf4QpF9MB84U
 YHhRIeqyEVxGnydMNrT/lwQvQw5gBmTlMXrwxQO6XF0nHDPNuhMDmrqLGze18lpV0Mmd
 DvGGfdspLdKVoGu8kTW9v+k+5cbSNQmvL/0FDcccTE12z5PYlQhPMDwk+dlo/vH0T0BF
 0fx/t+zlSg3FushOHI2063VzuChd7BrLNDSyDlsaD2+AduGbWhVysuTOSnB8s8Km5CbK
 gIzvPrs44wF/WK7OxYWFt8aiD3N1oLbUzjBo8xUhk/HBGqLxQlkFz5n251DlxW+PAREi
 lYsA==
X-Gm-Message-State: AOAM532Ir35KDhMdU4EzqB8zdhB+q0hw8+b7VDBCPyTFt9B9/POBzWsT
 BnsUdL5fRIue1XEr4XGkJcISSw==
X-Google-Smtp-Source: ABdhPJwIBjILW0NWvfVVWxT37DwsUBhjGzmx2c10w8CzeDQT8cfdv+4xUlRHp+C0dYmD1r3IhAgzsA==
X-Received: by 2002:ac8:7f44:: with SMTP id g4mr29121136qtk.130.1635763232879; 
 Mon, 01 Nov 2021 03:40:32 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id u8sm1060910qkp.21.2021.11.01.03.40.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 03:40:32 -0700 (PDT)
Subject: Re: [PATCH 04/13] target/riscv: Use gdb xml according to max mxlen
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-5-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10878235-c45a-07eb-144e-09e4ba4486fd@linaro.org>
Date: Mon, 1 Nov 2021 06:40:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211101100143.44356-5-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.592,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 6:01 AM, LIU Zhiwei wrote:
> +    switch (env->misa_mxl_max) {
> +    case MXL_RV32:
> +        tmp = (uint32_t)ldl_p(mem_buf);

Signed int32_t.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

