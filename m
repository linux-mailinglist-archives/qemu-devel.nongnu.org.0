Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53F3A080F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:53:02 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlWn-0001gS-GS
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlVx-0000zA-7z
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:52:09 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:38540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlVv-0002al-Kw
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:52:08 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t17so1324532pga.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=rHnlRnujWd694dHd5H4DBjilvctvRKjrD2h5939v0HI=;
 b=GjrmPDpFr4hmOuknqb6r9QnmNSxHYeUv2+UnNtmPZRNL+mEv+3Rc111VmqEgX2iGnq
 g7lw/5DII0FFrnRjovEKV4+603rtUtsYnq0jC/zexNDE2lckHI6X1VUJmqyh6dGGLwe/
 vja++vS0m3apOrAW3bI6G5eKjlFMMXCNw9ZZk6G7GuqcegrQuwfaNm4Co+Fdt937MXtF
 QDf68ErHKcKQnXGWjxPiKxJT5r8uDwnMEEawNFt85viPn0vdb4voLsPMi0PS0gKox6PX
 huYSQx3K7xloDT2lTyyk5bExjjDvhbhAurRwY5zxXWAvRxnGyPZdrBDnry4i5hTf2K2f
 VpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rHnlRnujWd694dHd5H4DBjilvctvRKjrD2h5939v0HI=;
 b=JzTHNc7rPraueuOzulH8DGvl7WsbfHkhklhtC25DxKrEfh6Hkb8Dj2VDUR2YMRl67o
 rt2pR0g+zPiNSMZglr/4OxhwjYYsaoWm+GkPhgR2VI1TOCUz1O+TexK/sluLq9iISFoO
 4IlguKJHDAHsVuq/gaDy1ngtzEJ40PVxYmPEcdiDewrwzHmcNsJlJXAYYHONGRvSIhhc
 OKzRpT6siNp6KVBpBb2BCrzVDP0n8BQsi4ajmXr+77y1cd4lqSlN+Is7kmQ+3JJmq37g
 8rLdITuWg/K8YXr+RFiKfI+cty9P+YbQiy4JCyI7ajd2YTSnSWAkY3ch7ZvO0yV99t8C
 SLeg==
X-Gm-Message-State: AOAM530irRWG6QyHJvpYbiCfNnXircRuZeVC3Ve2XcS64QY6sfeBOztT
 wGcsXdQi1XXQimqTLTfHwHH2nWe9AoMa/Q==
X-Google-Smtp-Source: ABdhPJwSQBLwAItJDMzZZu0cG9wMC+7UJjxgiWR+SsLzO0MphsaA0RoaBxj20DmQWGIkOl/DNB0elg==
X-Received: by 2002:a05:6a00:d44:b029:2ee:12e1:5781 with SMTP id
 n4-20020a056a000d44b02902ee12e15781mr2436288pfv.75.1623196325914; 
 Tue, 08 Jun 2021 16:52:05 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u24sm1042383pfm.200.2021.06.08.16.52.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:52:05 -0700 (PDT)
Subject: Re: [PATCH 28/55] target/arm: Implement MVE VMULL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d18667d4-a31d-30a6-27e2-d1df3a489aa8@linaro.org>
Date: Tue, 8 Jun 2021 16:52:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMULL insn, which multiplies two single
> width integer elements to produce a double width result.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 14 ++++++++++++++
>   target/arm/mve.decode      |  5 +++++
>   target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c |  4 ++++
>   4 files changed, 58 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

