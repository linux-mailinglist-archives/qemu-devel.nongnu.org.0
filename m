Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06803440C21
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Oct 2021 00:31:25 +0200 (CEST)
Received: from localhost ([::1]:42302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgwsm-00041a-2X
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 18:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwr3-0002pI-Qj
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:29:37 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgwr1-0004dQ-S3
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 18:29:37 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x33-20020a17090a6c2400b001a63ef25836so3818645pjj.3
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 15:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wn2H+nP9gIckscwOnNfuJj1KsRRzQMxGTBJQgnm7Z9A=;
 b=L9g8xsN+eWTrXwOeOmJgFnFsStvqtRlokPqqs+ZCTDBWD55/yzWrN9qiMr3vv9mZD3
 q6vqqxV1T9i9Q4CdIAmmxUZrYVkXEhFEfyWfp6wPkX4acs6wEX/YRHUWO6nIg1s2KTYf
 L4Fnc714LxB5Ji92A1AmR1KkUzCdtBDzjLUr1EIk7TTdnBYr3owZjXz1CDmG+bNZeQw+
 criogav3bHFNbBlAP1+vCZemSLPhC4NLIBTNQmVqkdonrIVgaCXLI1dp111R1VUENpVy
 PXIPFOO5/VI/683a3dOedSdtLmRAj80TNQPk3XiokUf+i9kJXzVBSkKBJzDxy53mX6yt
 bX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wn2H+nP9gIckscwOnNfuJj1KsRRzQMxGTBJQgnm7Z9A=;
 b=U1w/lUjXllVn8vRNQIcEjV25kyb4pnGzMtW+g1OVm+BkQg6eVqVubSJNp6xJ1ZX2aD
 rBmdbGszxb3oGkA8ZI1RfM2yjc8tlZxScU0q6zatdWcCN/fjbPFaevIig6CuO5v4yTT5
 gGS5wkRCBYDJqlOG/8Ru46ZYThWA2TRVCkKbrnx02WgTeamNew6zCUvsnRitLhK+nL0c
 kVkNcnJRVIefNZhylSXZ5ze0pt8xgb6C0vZ5vWAeBYj7IzJjeCZoO1Hv9nmiLNQK4Y7c
 Fe9U8GxDEUbTg2E7GaZ4cHwdBdUYc/qaabtkr26A3/9FTOGAgtddvYcfP9tAIjsaixL2
 RA5A==
X-Gm-Message-State: AOAM533Oyf3y1FTaAk47qppQZI/WFHKAhXDxc7bAk9AJpv2uCrdEKPhi
 68KEruq50uByaKZxTtEqKhEjrE144Dtgng==
X-Google-Smtp-Source: ABdhPJxdbD1ZmLdzRGM6ZcH68CYLgYqgihyUhvOJ51Jwxutt7RARS5/ab5Un2Gkc0P+GXg2Q3nYx0w==
X-Received: by 2002:a17:90a:650:: with SMTP id
 q16mr28740334pje.72.1635632974438; 
 Sat, 30 Oct 2021 15:29:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f4sm8998406pgn.93.2021.10.30.15.29.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 15:29:34 -0700 (PDT)
Subject: Re: [PATCH v2 19/34] target/ppc: Implement Vector Extract Double to
 VSR using GPR index insns
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211029202424.175401-1-matheus.ferst@eldorado.org.br>
 <20211029202424.175401-20-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab1581a2-ffef-4fd5-5d5a-e68944c04d80@linaro.org>
Date: Sat, 30 Oct 2021 15:29:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202424.175401-20-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
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
Cc: lucas.castro@eldorado.org.br, luis.pires@eldorado.org.br, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/29/21 1:24 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Implement the following PowerISA v3.1 instructions:
> vextdubvlx: Vector Extract Double Unsigned Byte to VSR using
>              GPR-specified Left-Index
> vextduhvlx: Vector Extract Double Unsigned Halfword to VSR using
>              GPR-specified Left-Index
> vextduwvlx: Vector Extract Double Unsigned Word to VSR using
>              GPR-specified Left-Index
> vextddvlx: Vector Extract Double Doubleword to VSR using
>             GPR-specified Left-Index
> vextdubvrx: Vector Extract Double Unsigned Byte to VSR using
>              GPR-specified Right-Index
> vextduhvrx: Vector Extract Double Unsigned Halfword to VSR using
>              GPR-specified Right-Index
> vextduwvrx: Vector Extract Double Unsigned Word to VSR using
>              GPR-specified Right-Index
> vextddvrx: Vector Extract Double Doubleword to VSR using
>             GPR-specified Right-Index
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v2:
> - Simplified helper
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

