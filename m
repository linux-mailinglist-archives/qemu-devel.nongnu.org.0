Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1674C0474
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:17:51 +0100 (CET)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdTi-0000EF-JL
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:17:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdRh-0006df-Tr
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:15:45 -0500
Received: from [2607:f8b0:4864:20::1032] (port=38751
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdRg-0006p9-C3
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:15:45 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 nh8-20020a17090b364800b001bc023c6f34so332396pjb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vFYzBQTNeVA799/OQ4R6Wm5sV13oQqknj+bb67C4PgQ=;
 b=c2bu2iBTpDfQdiLuN36R2BRfzlX2Y5J0qDs+7yBz7Shb47aY59bWUxWCAUSAUJtkF5
 ffuYuAJlnKGgY7bouz5TOCFMm4vUT61RumuZa8Qv9vatrdb7SQjVlyclB4NE76Th97Qz
 iTF6ycq60lbKVOIGX2zN6s8P59LTviZQ9O9eaqPx4yd6ctj/ElG7u3j/Rg2RAYRAbZ3f
 5KE9pusxA1eiMcCBuVGyLhB4jqD5rbuRmxcauIHVtdCstbayyNEUeAAgo4koLy/hckxQ
 1KXjiIcQ2CxEWXcVHrdvsGSAw1lKDgS0kGzB8knfJaONNAaZxfSMKosR+5fD299y920Z
 7mLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vFYzBQTNeVA799/OQ4R6Wm5sV13oQqknj+bb67C4PgQ=;
 b=m2O95QCPcKWNxQ2/NMfAOKn4saKq/CtjXngcXv0k3oH6RTrf9j6BR28ArdajlssLfb
 NNE1x+33CuA2fqrdOqy8lWZIrX2Gnfxr5t55CKvtWSspmi0HQYjoLHD3RuIr1Jd4rihu
 XwfevQ9gQab8ZY8AikQkMGs3nKJmsGKvg+IcwrHnDjjSevcTluijUO3RRgGxeP9OLZkr
 XAsCVWY0L4zWz78+ojTH1je+8WUP39wEOSSWfdIkdgji263EEnWB4BcJmb0A5Ec+Z9XR
 JFVD/ilZIsUbr58Yg681YgTCy3+HslgN6Hkv+eAP1tH6HpQdBDMV3ugNwmc50XVFmcK9
 qx1A==
X-Gm-Message-State: AOAM533X0yMu1bnbSd3mx7tF97nTEoMD8bVLMSAjOKKEfI4zhZ7NDy9+
 ButpSgtQsDtv8w70L0zVRi71/w==
X-Google-Smtp-Source: ABdhPJykWvjPW3/U+WHjxntr/F0F/4T8tpWcs+p0Zldbq36aC48Q6FEWTwMa5AyYpntydR808OhCSw==
X-Received: by 2002:a17:90b:4b0b:b0:1b9:2295:1d6c with SMTP id
 lx11-20020a17090b4b0b00b001b922951d6cmr6208055pjb.126.1645568141612; 
 Tue, 22 Feb 2022 14:15:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id z14sm20149141pfh.173.2022.02.22.14.15.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:15:41 -0800 (PST)
Message-ID: <e12e0f7f-987c-c925-6238-97324ba17f10@linaro.org>
Date: Tue, 22 Feb 2022 12:15:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 21/47] target/ppc: implement vsrq
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-22-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-22-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 40 +++++++++++++++++++++--------
>   2 files changed, 31 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

