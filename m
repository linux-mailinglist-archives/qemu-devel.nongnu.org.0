Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BBD438533
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 22:12:19 +0200 (CEST)
Received: from localhost ([::1]:38974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meNNK-0006iH-LQ
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 16:12:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNLw-00056e-CN
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:10:52 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meNLt-0003yJ-Ee
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 16:10:52 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so4566369pje.0
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=prWij6CtLt4dBaLtGrZ2Di3j2b37ltg836PDAVkHw1s=;
 b=vTJzYyJUUhljQOF71XaVWFTfaSvOWv1+fQH0L7QPiE3Tmeo2V+Q+Yb+4+I6kmj4KsL
 B+bq6u3zyXqWGlwcDYe6fQmJGIGAVz08GqJHKNN7ufQuZURHZaKnOHZQhEPcCzA/LVJN
 Bg44PXXciOM9hW06o9zjhwLX3RrBoPuh/uhmGvC4Vaznbjc25wNGYUyPsyeQae8g1StB
 H13dQciwdMOhkyfk+lqwNPdpGjUDuXBrLcDmTxHaP/3CtXHAOyEkP7d/EixlwByB0dpT
 bv1JEHWIfqhnqTj421zo8nXON6Qu8vTz77qG3hajQG9kypj59mSq4dV6FMEBg6p3h/WP
 ZpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prWij6CtLt4dBaLtGrZ2Di3j2b37ltg836PDAVkHw1s=;
 b=OnhpLPg5z7v9ShmK0EikNpJbqQHm2XyDHGvGqtqZrh/XB4G8DBm7hpeGfa0jd9th7p
 Fc+2UEOk1l1nIL209gj7LQ6YeizJ2Z6pc0drB9OtP8W2JfV9p7SSeDbE+Sp+Uc3ybjIP
 kvRNWvy3NHqseCEEb9hxxh1JSSSqNjgTHH1/9HaDRmL6lq1IgxTFHnSCPbtAD1mJeWIA
 xZTJ4voNMgb0JZHz4raIxraeUovUfOhpLHZR1pR8/eZyq5A915VMDn6lsWt6hJ/Aueh8
 fbKuWxP4KYXUudlV51wnq11+rJMyv4MZbp17+Q7uwwkIxTZQ4cD4R37Jv1M7k+CnWNDL
 NrKw==
X-Gm-Message-State: AOAM532BQDoPDA9bGjrEfRl4qnXSsXqmeWubhh8jAWUeuDb/Av04zrfi
 Kkx1Ibd5bmvnnyV/tui3RcJGig==
X-Google-Smtp-Source: ABdhPJyp/2SRXZIwjZvCwaEMLGsh56RVuFDf9s9890wBBSv4Up0uO01Ws39YsSy0Q3dL4NoFbqrUAg==
X-Received: by 2002:a17:903:20d4:b0:140:f4c:5c05 with SMTP id
 i20-20020a17090320d400b001400f4c5c05mr7506564plb.21.1635019848035; 
 Sat, 23 Oct 2021 13:10:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm13771739pfn.159.2021.10.23.13.10.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 13:10:47 -0700 (PDT)
Subject: Re: [PATCH 20/33] target/ppc: Introduce REQUIRE_VSX macro
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211021194547.672988-1-matheus.ferst@eldorado.org.br>
 <20211021194547.672988-21-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0eab04ca-2e7f-eb35-710c-9ff9c032c6b0@linaro.org>
Date: Sat, 23 Oct 2021 13:10:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021194547.672988-21-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: lucas.castro@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 luis.pires@eldorado.org.br, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 12:45 PM, matheus.ferst@eldorado.org.br wrote:
> From: "Bruno Larsen (billionai)"<bruno.larsen@eldorado.org.br>
> 
> Introduce the macro to centralize checking if the VSX facility is
> enabled and handle it correctly.
> 
> Signed-off-by: Bruno Larsen (billionai)<bruno.larsen@eldorado.org.br>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/translate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

