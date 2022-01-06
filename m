Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EDF485F6B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 04:57:11 +0100 (CET)
Received: from localhost ([::1]:46390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Jtk-0002ne-I2
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 22:57:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Jsc-0001Nn-UB
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 22:55:58 -0500
Received: from [2607:f8b0:4864:20::635] (port=41982
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5Jsb-0005i7-Ao
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 22:55:58 -0500
Received: by mail-pl1-x635.google.com with SMTP id z3so1604511plg.8
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 19:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YbzNT/s1mVi4f0CdRjwz7KGLeYKyZkSt4/hZtVr2WaY=;
 b=UAzPYHxDom2NlSbVmYR57ZoZzyaMRic5ymALzdI8tA6wOMioy6slbpvtZTsHNeYOKt
 nWdV5uBcIaipZ+hbwERgElhxlX/LOZUTH6Wut3zEDw7A/LezSnU89txt5f/Bs8WLf/Qs
 DCswxtU0ceWeXLgQzxCHlRFf4JC1k6XnEKw1fKFpyw9aK5Q5ImBX7G1VT2RAVUzF+1sM
 /co4kpN7ZKlpFK30iT8wrPjClDSmJJMawS0c0jN56P39vEQ/Trwm2FOp2wMBtZb8cUZo
 owKilbV0pHt4AaY02i4AHtsSl+HQr4LKIZbG09fKEvgj1BovP2hqfVOYbWBHuqM7QzuD
 FMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YbzNT/s1mVi4f0CdRjwz7KGLeYKyZkSt4/hZtVr2WaY=;
 b=WpIj4/PmUh/d7g59geGf5Pd/cReQDWOF4+m+4zCZEydgYb6G3YwuPgsZ7VuoyywBkl
 B5kce/3hlVmyxPuPTQpYEcSZdVnGR4qfB/UEk0zOfB3VN4GqwjEhnt3mptMxLng9I+hJ
 zDTqoAIs27wEKElFNhuSWT/IdSjC8ZXBctOfGtDTUQ9RgMHVwdUohsH/2KRKZZx2sPS3
 +OHIwkHq030VEwBw5XDAPKUD5mhxLqxNEiN4i56JSspkb2T9Mreehr5fZs3RGeD72S3n
 lA4CgDalWr4KTxdKy+Ifh/0v5w6sM92sr2F9UvCbg+Pj+GphJH24j+7WjCryjOb8eSVN
 lprw==
X-Gm-Message-State: AOAM533mVHlDQTu+UyNzT1nog4hoL3///9ti9ehc1jsAD7x9wy69KhhV
 sUWMbIbF7HeAOkgrXbwdcyDUKw==
X-Google-Smtp-Source: ABdhPJxnVGHGfAyI4h+PLjtD7SlFiDJxxmT8MF51srXIGN664cCfTeRHr/sDYgsQvr1/OaOtnFWoMw==
X-Received: by 2002:a17:90a:aa86:: with SMTP id
 l6mr7882777pjq.82.1641441355642; 
 Wed, 05 Jan 2022 19:55:55 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id 72sm513383pfu.70.2022.01.05.19.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jan 2022 19:55:55 -0800 (PST)
Subject: Re: [PATCH] tcg/loongarch64: Support raising sigbus for user-only
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20220105174456.3719220-1-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f788f664-74af-5247-1351-17e487e8f7a3@linaro.org>
Date: Wed, 5 Jan 2022 19:55:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220105174456.3719220-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/5/22 9:44 AM, WANG Xuerui wrote:
> +static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addr_reg,
> +                                   unsigned a_bits)
> +{
> +    TCGLabelQemuLdst *l = new_ldst_label(s);
> +
> +    l->is_ld = is_ld;
> +    l->addrlo_reg = addr_reg;
> +
> +    tcg_debug_assert(a_bits < TCG_TARGET_REG_BITS);
> +    tcg_out_opc_bstrpick_d(s, TCG_REG_TMP1, addr_reg, 0, a_bits - 1);

Looks good.  My only comment is wrt using bstrpick vs andi.
I haven't found any pipeline or timing info for loongarch,
so I don't know if either way is best.

With bstrpick, you can drop the assert.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

