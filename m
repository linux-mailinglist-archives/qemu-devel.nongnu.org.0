Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758136F3CD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:43:29 +0200 (CEST)
Received: from localhost ([::1]:49606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcIBk-0008EM-Mr
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHvm-0005Eh-3I
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:26:58 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHvj-0004qW-9v
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:26:57 -0400
Received: by mail-pg1-x529.google.com with SMTP id z16so7461371pga.1
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r6+ClU8xmxUT3UjW8pRdMgZ5blVwev4/zoOiFv+yP5c=;
 b=tLJ+XVtDZDDHr5RWyhngmR9zIBzszXY/Na/LAV9xVM4cglXwrHmQ8h9HCOQKU9lO5y
 v1YhBVY/XTnUvqRvPCiTOY4mp+qr6TyHk6Ldhv769Uz2+5aEn+petFLeUuRYp3kQH5sm
 O037vb/ZsbjPESCEksUuPVdvJcMRTzHsY5k5tDaK8fhSGyNNH37PHr3fG41af4zW6xId
 ypIncM+pTkCuwhGm5Qa6wN/8PDUFMIVg22MDzcyfg1OjypSFH8IHuyfVzq1aoTRzcsVi
 W0w853ggRDSCGUpWfkNIVJzp3GT9QF5h524RaF+bNGlgStmsMPP+vR2JXoTOyQ5tAS0i
 k8HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6+ClU8xmxUT3UjW8pRdMgZ5blVwev4/zoOiFv+yP5c=;
 b=UpADYuxJr02LESyRPS8IwRZjdnISMPkUzrPJ0lC4+zLJf1JGClkA5utSwf7M6OjE5V
 tAtZXAOtPmKfEYOSWad4zdpCpv+AQv9wO7MBMpCA4RmkHG7AyigJ4tT3CbeTBxNix2/7
 htI1ehTQF+HmV7HRfVwKBYNZAoCWscb5j76M0vKBV0go9KkWPRK5jaJ1RyMTAKJDSHvz
 kBx/LnoWRXmf7ODjfHeotV+hr3HSiSCiMokYTv+s1345FxCUDcD3P14QYbgDIXzZuwIf
 shXqxwNGklIxpJJYShHkcYd1zuY4x13PK9jhDBJnUEi5QpVhIx2qiHxnJV8kkY4LCMmE
 iNQg==
X-Gm-Message-State: AOAM531KJOgEJ/urs+qr4Hsbxvl8Fp9ef+6KSiBA3M0jAyDIfws/d4nx
 LWj88tjf7qJYbC8jnBoSzXlm8A==
X-Google-Smtp-Source: ABdhPJwh0Gw/gPqRCbqSP4XE7EbBofaMHUFdfbEs31ZfyglL2hw3eOSHH/MAgizz7yoygi+NvdweYA==
X-Received: by 2002:aa7:9108:0:b029:251:7caf:cec with SMTP id
 8-20020aa791080000b02902517caf0cecmr2725962pfh.13.1619746012678; 
 Thu, 29 Apr 2021 18:26:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w3sm8532827pjg.7.2021.04.29.18.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 18:26:52 -0700 (PDT)
Subject: Re: [PATCH v3 24/30] target/ppc: Move page crossing check to
 ppc_tr_translate_insn
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-25-richard.henderson@linaro.org>
Message-ID: <d36d28d9-9545-8a9e-ff25-c52f72d43d84@linaro.org>
Date: Thu, 29 Apr 2021 18:26:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210430011543.1017113-25-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 6:15 PM, Richard Henderson wrote:
> With prefixed instructions, the number of instructions
> remaining until the page crossing is no longer constant.
> 
> Signed-off-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   target/ppc/translate.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Oops, this was supposed to be ordered before the previous patch.


r~

