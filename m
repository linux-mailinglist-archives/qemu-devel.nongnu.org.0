Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67D4CC5DB
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:16:40 +0100 (CET)
Received: from localhost ([::1]:57552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqwJ-00014t-U6
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqeL-0005rm-8P
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:58:06 -0500
Received: from [2607:f8b0:4864:20::529] (port=42803
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPqeJ-0004Qg-OH
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:58:04 -0500
Received: by mail-pg1-x529.google.com with SMTP id o8so5379738pgf.9
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dvmTXEIRNtxfRAcMzuI0lXRaip+cXWhNxZQzMHTDJn8=;
 b=Vifz5+eF4aJ/wBExrRAitxlr5AFkps96WJNU0V7RudpQvD+Ko7iSBW7LmE/2O/6byQ
 0N2NaZkeEiBuOjGn+f4K47AoLoMmNlMOOjnCAa8Z6VGTz/HHG6ADc3ng8qG73+5wm7tU
 QEyHvwrzhE6rBkCAyx72Nxm6yb3z2zLTnuJXL3kO8dvGMtrqDd8GgXCNwQy6sNUv3ydo
 WNdfoXv5amTZUmBzYvMWUdlr0mZ1URRyZ+8wdcsM55MeF5Y2+aZvoypKoncMwEvH5KZH
 +yMF8HDRXy7LF9ijTk9Jph0yOuvBD0PPWmxqRjchdLGHl0noL1kb89oX6IbC2KARoxNb
 s4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dvmTXEIRNtxfRAcMzuI0lXRaip+cXWhNxZQzMHTDJn8=;
 b=6WqSQ9tPfFnUsyskX1dgdA05AQq+zkIJuZM5jTB+FvrxI9EZfVASP1XbYH4qClGCCj
 Dr+L4jTclS5QID5Dkykrd7bISxRJsTw61OB4sQKJFxqYXz0brhE3/8zlfu3jBfqleYJ+
 PnBrUxXfYbFUH1IzqaHrduPo31BqqIoxxYbygXLvsVTpgsxcObew8l2TMvJyCwHd7VJg
 UhcPRif26bFGyvB+hu8zcLFPG3PVGEzPLJvnUoh13XWpoP0+NQTw4Esaqrk1UDRWfwAD
 x82e5gCfBAfK9Aodf37iDB/lC5t+OR6jgCge1lI/UwbafhusQvLjgGRWsQIYRO/hxdFz
 sCJg==
X-Gm-Message-State: AOAM533xTBI+YklFXpek+t3o8aWSZMpst3REEC6gbjHMIpanba/GtvN3
 i5NVojFCmTI0X+84y9lBbzxubA==
X-Google-Smtp-Source: ABdhPJzWc7NWw8E6TQylJsjxfk+nqOmBlRJQLdi6JyAF7ouF2qPYszwYNTYbzXgKwoeJliqcrmOVmQ==
X-Received: by 2002:a62:7e06:0:b0:4e0:f0f8:9b86 with SMTP id
 z6-20020a627e06000000b004e0f0f89b86mr40283430pfc.26.1646333882286; 
 Thu, 03 Mar 2022 10:58:02 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:e819:4400:f268:c391?
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a056a00158500b004f0f12b320asm3356643pfk.6.2022.03.03.10.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 10:58:01 -0800 (PST)
Message-ID: <09ba59b1-7e1d-05a9-b96e-514c28a7e6d6@linaro.org>
Date: Thu, 3 Mar 2022 08:57:58 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v2 3/5] tests/tcg/ppc64le: drop __int128 usage in
 bcdsub
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220303172041.1915037-1-matheus.ferst@eldorado.org.br>
 <20220303172041.1915037-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303172041.1915037-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, danielhb413@gmail.com, groug@kaod.org,
 philippe.mathieu.daude@gmail.com, clg@kaod.org, mrezanin@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/22 07:20, matheus.ferst@eldorado.org.br wrote:
> I'm avoiding newer insns like mtvsrdd/mfvsrld to move values between VSR
> and GPR so we can run this test in a POWER8 machine.

This...

> +#define BCDSUB(AH, AL, BH, BL, PS)                          \
> +    asm ("mtvsrd 32, %3\n\t"                                \
> +         "mtvsrd 33, %4\n\t"                                \
> +         "xxmrghd 32, 32, 33\n\t"                           \
> +         "mtvsrd 33, %5\n\t"                                \
> +         "mtvsrd 34, %6\n\t"                                \
> +         "xxmrghd 33, 33, 34\n\t"                           \
> +         "bcdsub. 0, 0, 1, %7\n\t"                          \
> +         "mfocrf %0, 0b10\n\t"                              \
> +         "mfvsrd %1, 32\n\t"                                \
> +         "xxswapd 32, 32\n\t"                               \
> +         "mfvsrd %2, 32\n\t"                                \
> +         : "=r" (cr), "=r" (th), "=r" (tl)                  \
> +         : "r" (AH), "r" (AL), "r" (BH), "r" (BL), "i" (PS) \
> +         : "v0", "v1", "v2");

... belongs here as a comment.

> +        if (TH || TL) {                         \

Would be clearer with TH != UNDEF || TL != UNDEF.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

