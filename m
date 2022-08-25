Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE95A17C3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 19:14:58 +0200 (CEST)
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRGRV-0003YQ-DH
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 13:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRGLO-0008Rf-Ik
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 13:08:40 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRGLM-0005rS-Ok
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 13:08:38 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 r15-20020a17090a1bcf00b001fabf42a11cso5745500pjr.3
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=xtQSPEzaGMS+tM6hRrNz5CEgxT9fgu8N5j5efGRkT/M=;
 b=BMqmD6F01wSomKLZjbwGmBzgRndyAiNQzIOiptjb2zONuSq3W0SZKaLnfBoeNriYBo
 3LhPHXiaYd/Sds2XyQFhzFVm6hYT3RfpWUiOiNFw+KBrraePdoNbh8t80tdgDL9zWetE
 TzxBMO3TyvmZlSYBi3xYKI6c8k5kOacmlQi37pltNEU3YzFUAUUgyXMKjKpZrMzyE0TK
 prAuAA/h+3ONP60B0Yqkt+XEzMGHjw8zXDBVHVSmUtC56swI+g/t1vfnTOa5KuYkX5Dd
 g1ZlY/XTlyiEHQUlKDTVjno/Lkwo608lx8LLtu1xnDt94sWIWLY/7p/liqwc/PPHR+oO
 n3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=xtQSPEzaGMS+tM6hRrNz5CEgxT9fgu8N5j5efGRkT/M=;
 b=AQqkLiE3YWAT4V8mBALvblOd7EsSsQhNIgbDZ8XdeDE4rzm7lZkJ54xTJMcPQDvRE7
 GLoc4FJDat9ibNmYHsHkk3lA/ZO7tKe0ezjFnqr5m5u45EX/EFIl+ZJEKXcovrXl46ku
 LB5V31h/WqPGHQDETCT6D58A/K+JTwEOTCuTk58Y3Z5bj5d39BcbW/EfRf3P17a+sGVH
 YkA0MrTAqebNdeADY3jbGduueKjLVuepsULTVAo+00ksVRcCLKIZ0VfFchLBVDP0QQkd
 xl7NGIUYjJjEX6UWxf85XP52Jn4N7V04WWECRxcA/XsbwsQPURn6MgefM5qf5W4jgHit
 rcXA==
X-Gm-Message-State: ACgBeo1kd7TbXAoGVp8JZoY6PzY8KfWfvt5ejrA6Pd8yeeBFZbwQhdab
 1LGTVTQm6snfWncmXxt5vWeXyg==
X-Google-Smtp-Source: AA6agR5Rt6CtQH2pLwhT2w+BSDqKlwZczJnsl8tMgEpkEHw8+up5DIi3HSNNBQKMmuV2mrn6HTwDZA==
X-Received: by 2002:a17:902:f550:b0:172:fe5d:aa0a with SMTP id
 h16-20020a170902f55000b00172fe5daa0amr71879plf.170.1661447314210; 
 Thu, 25 Aug 2022 10:08:34 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a65554e000000b0041b672e93c2sm13074099pgr.17.2022.08.25.10.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 10:08:33 -0700 (PDT)
Message-ID: <4c084547-cacd-585c-13c9-1f63ef9cc1f8@linaro.org>
Date: Thu, 25 Aug 2022 10:08:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] i386: DPPS rounding fix
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220825164827.392942-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825164827.392942-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/25/22 09:48, Paolo Bonzini wrote:
> The DPPS (Dot Product) instruction is defined to first sum pairs of
> intermediate results, then sum those values to get the final result.
> i.e. (A+B)+(C+D)
> 
> We incrementally sum the results, i.e. ((A+B)+C)+D, which can result
> in incorrect rouding.
> 
> For consistency, also change the variable names to the ones used
> in the Intel SDM and implement DPPD following the manual.
> 
> Based on a patch by Paul Brook<paul@nowt.org>.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 67 ++++++++++++++++++++++---------------------
>   1 file changed, 35 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

