Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72AE5EE3DF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:06:44 +0200 (CEST)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odbSE-0004jv-Of
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaBa-0000zw-Js
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:45:26 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odaBY-0000wh-PX
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 12:45:26 -0400
Received: by mail-pg1-x531.google.com with SMTP id 129so11284593pgc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 09:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+aoHudcY1jNsD3jw3dXzeUEmYywOkwMTvsN/+GltecU=;
 b=CEUCmQw7qv9BcovKRJ/+c1EGba+oZFYbMLD5SytKPh3wXZpETqrAGPMuSZrlN9zAeO
 frvrkTG8r/NuYppmg2+vanhmuSj+RFaDy3JSHoHv2Psh+FjpmTNgqXjG2ah1rCL+SQKf
 +x0aWlQh0Zqj3yUaLBqCeJCdRuJsNSnbVLdB6D6HuvIPFKXXqBl5t7T5LpyLWkvC1953
 bWEw0IUDwfq6LBTTGKQ7/jet2k9kYjlBEXxEWklyg7UH9f0x4UWrYNQU2e4LAsgRAkiw
 TgDIHvPE6XP2YRg+hwbVoZozN1n1OT6bgKJyIx33lEjZMjLKMyOBthqYQ1pOSQzvyq7s
 mEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+aoHudcY1jNsD3jw3dXzeUEmYywOkwMTvsN/+GltecU=;
 b=6uR0w1/d9KFEBCV5ysNQMoyYqFiwbSkzPFwzjo1O1NwGBkx1vmMufVdzMAxnHQLtoc
 lY6Q2W000UgRP0xoFX6qaadiDZj8rF4O1Y+fqF2yEs2jth3uH016kVyR2wzBhyKkXYl2
 HUgQqFvGGqCQDNlL5zbkaxegA5kgymajsKlywv+kzQMfn2Sspm4IftIxhGCt6mDFN6mz
 b2WlWgZ7SvNL4hPJwdboitddmzIu0RbkiKEFbf7/FbXfnYtSu1NruUAso7td0+uuUIdm
 /M6B8gY9lIqCB1Eaj+ldAEEbzsV8J5i0HAZ4Gnu8/0W8dOSxyThRS8VsLaIPy0rEvuie
 u+pQ==
X-Gm-Message-State: ACrzQf0yZvgVf/CVGk21/niyU8I1WOb5etZtQ4AikTmoWbejeGDLE/n1
 EoNlUqQpl3Ij2Hnqe0WVLo4/wQ==
X-Google-Smtp-Source: AMsMyM5g/GQCs45hUXl++v9aoalXf5wUG/aOD7fDCEeFda8EzO46xE5vCXhOg+r48XuHZQrYDhWO+Q==
X-Received: by 2002:aa7:88d0:0:b0:542:d98d:bf1f with SMTP id
 k16-20020aa788d0000000b00542d98dbf1fmr35427288pff.78.1664383523210; 
 Wed, 28 Sep 2022 09:45:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 y18-20020a17090322d200b0016bedcced2fsm4037963plg.35.2022.09.28.09.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 09:45:22 -0700 (PDT)
Message-ID: <697fb242-ba57-e00e-d824-b32f2bfc6c8a@linaro.org>
Date: Wed, 28 Sep 2022 09:45:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 02/15] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 07:14, Alex Bennée wrote:
> Both arm_cpu_tlb_fill (for normal IO) and
> arm_cpu_get_phys_page_attrs_debug (for debug access) come through
> get_phys_addr which is setting the other memory attributes for the
> transaction. As these are all by definition CPU accesses we can also
> set the requested_type/index as appropriate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v3
>    - reword commit summary
> ---
>   target/arm/ptw.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 2ddfc028ab..4b0dc9bd14 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2289,6 +2289,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>       ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
>       bool is_secure = regime_is_secure(env, mmu_idx);
>   
> +    attrs->requester_type = MEMTXATTRS_CPU;


This shouldn't build since you renamed the enumerator.
You should use *attrs = MEMTXATTRS_CPU(env_cpu(env)).


r~

