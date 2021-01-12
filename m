Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA52F234E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 01:24:14 +0100 (CET)
Received: from localhost ([::1]:41938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz7Tq-0001U2-1K
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 19:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7QN-0007f6-Ql
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:20:40 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:34872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz7QK-0006Dj-D7
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 19:20:39 -0500
Received: by mail-pg1-x52c.google.com with SMTP id n7so263424pgg.2
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 16:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GfMqM4WC8eaZ2pRuIVphRSiObr1BAu4lQBcwDOX0CKw=;
 b=nEdjznfHnpoCKo37vdFMgxgCwYJbQ1a4G9UQkqCUIX8eV/7x/hOlKrlAiJFdsanj0r
 k9b4kyzIpYQkQztu31/J1TF1uMKJEVD0ODpNAtvpeve/P+WVKvlvQcBLOz5AWcVX1u9R
 zOKoltwpRijA+njJeVq8DoNx+7wDQTx72pOQUn+2P03p49ifvaesz+08eofzPaev21Hh
 g0yNpASegqu7OdNSTRKCyxOc2JyvWPt9ZZbOZDWuIV1v/WrLXnCWvkBIFcN7khOLQD48
 M9bYUgYIwYUqViquTBgnL/hiXCFWITzMWLmjrZIjKOWZXv8hus/Z8hUMRM/MYOXQm60B
 VUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GfMqM4WC8eaZ2pRuIVphRSiObr1BAu4lQBcwDOX0CKw=;
 b=pEakGwVtxfTBT9xd7FkKQalpVKvSkz5xQfHvDV27EPZOrGfdaXmKrxaXs8RiAElpE0
 cR1qIsbVbE0y+UwsxvwHqVtgi1AksCGrncHvz+Wt20TOupWcl6a8c9c80vpxDInG1Pkj
 5VZskMCMsJsbtY7V9hm+V6gYrQ/vV9PCUh71K6iSF6tQJnnobqF15OHcHbP/kAifqHVe
 94lmnk3isNrf+YOkmRTHsdwclqbILTQT7wT710d1UkXPrwPTwji4M4KtppjmFXwFYw0+
 Ay+63nhYz7jSgPbUPTkEx0pyq+qlN1uXEnTrxy8X0uUxLSbnC2ejSIHikzibw7IuGzYw
 qahA==
X-Gm-Message-State: AOAM533oOa/S+rEbs6S97MtDkZpCVLQD96j3vEz2MxDhzhXreJcO7Iw0
 JB/4DRkHH+I+JKji5GztCdRJHXObZdXGrg==
X-Google-Smtp-Source: ABdhPJzRBOR9hHVKWVSWTtdh3FP5KjKKHknWlEXBM3j3ren1/3zk/HmY1c3Y888g7mtMwNfgmaBHPg==
X-Received: by 2002:a62:b410:0:b029:1a4:7868:7e4e with SMTP id
 h16-20020a62b4100000b02901a478687e4emr2188771pfn.62.1610410834552; 
 Mon, 11 Jan 2021 16:20:34 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id 5sm768987pff.125.2021.01.11.16.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 16:20:33 -0800 (PST)
Subject: Re: [PATCH 14/18] target/arm: secure stage 2 translation regime
To: remi.denis.courmont@huawei.com, qemu-arm@nongnu.org
References: <3337797.iIbC2pHGDl@basile.remlab.net>
 <20201218103759.19929-14-remi.denis.courmont@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e46f18fc-8add-fea5-f598-c10570e7895c@linaro.org>
Date: Mon, 11 Jan 2021 14:20:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218103759.19929-14-remi.denis.courmont@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/20 12:37 AM, remi.denis.courmont@huawei.com wrote:
> @@ -3586,10 +3586,10 @@ static void ats_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>              /* fall through */
>          case 1:
>              if (ri->crm == 9 && (env->uncached_cpsr & CPSR_PAN)) {
> -                mmu_idx = (secure ? ARMMMUIdx_SE10_1_PAN
> +                mmu_idx = (secure ? ARMMMUIdx_Stage1_SE1_PAN
>                             : ARMMMUIdx_Stage1_E1_PAN);
>              } else {
> -                mmu_idx = secure ? ARMMMUIdx_SE10_1 : ARMMMUIdx_Stage1_E1;
> +                mmu_idx = secure ? ARMMMUIdx_Stage1_SE1 : ARMMMUIdx_Stage1_E1;
>              }
>              break;

Was this a bug that we weren't treating SE10 properly vs two-stage lookup?  If
so, it warrants mentioning in the patch description.


r~

