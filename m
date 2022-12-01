Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7AD63E9EE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dB8-0006kj-Cw; Thu, 01 Dec 2022 01:36:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0dB6-0006kZ-Ni
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:36:12 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0dB4-0008V8-8L
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:36:12 -0500
Received: by mail-pl1-x631.google.com with SMTP id k7so734685pll.6
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 22:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2oYie1gDpWmJptLlHzezvfl5nKfgDucUrSz5MCzwHxc=;
 b=JZZ+Ft6KO1PJCtbLZ+H9STWFBflt1B98ML5K0c+phHzRFaG+g2KXxRBw1Ezw2i+0vj
 B10f99UgkhuoYPScrBwj2uZtVouPgK8mC6GHRMedbgsG4AGHelWTthQBI1k6C4NEzCkk
 marMVKAFXThlmGTuml3PmYm/Fg3NBLQXc71W7Ebq/0MPS3PKBBmVQRqWXD0fEMYpDNGe
 e/5ZHhIZu2HTfonQ0C0qMnBZjlisk5Uj7Ejj7MbP+RmiWNpg5IuoUUYoPyL3KgxEJvHc
 W+AwB7kBzDei3GWmr6p++Za6epn9SeTTE7zP5q1T2XIs2RCwknRDIKq5lqfrg10/DqcS
 Q4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2oYie1gDpWmJptLlHzezvfl5nKfgDucUrSz5MCzwHxc=;
 b=3aiDlYi5kxnPBHEabXGE53rEIJioC4Cj8975vR+o4VH/NCwufeBJ48IQ+1IngiA69r
 z/vAUpButpaO5fdJetAhouLJYIdoN/zO3oOR9MPTVhQpVQxPhDpQwUeTj5kdvhQy4TVM
 tc7o39aas25dkQ50nNd8mjIWnzR+/Q/Kxy0u7wtjx5GejYcVAzJQfUlwMrLkdOmRuoHP
 VnnOip6ULwDd5xCqPQU6xwed1XL/dev6ApKjdDUTu16Lcvtl4RCZomMEx2wtCDGmLoBb
 2WgpZzgHfdyLyHg469Ds/D4AIyt5s0n15Scw9TuWAnWjfRyqyYZ2hh2FXkpD71a3iSG3
 L8ow==
X-Gm-Message-State: ANoB5plGw3tyGTq7IdSBjqieLndm7WuVNVvdnq9gXj3eoOYExpL8vCHr
 tG71AfSyvZzFJsOIlj+zRKweFQ==
X-Google-Smtp-Source: AA0mqf6oF4C0pXk0k9uwTA2OAO5fKvq2l3y6cHfQE5mv/VhAwgIsNO0ImD/eiMfhmBTWLrafquQbnQ==
X-Received: by 2002:a17:90b:19d3:b0:212:dadc:23e3 with SMTP id
 nm19-20020a17090b19d300b00212dadc23e3mr69380474pjb.129.1669876568521; 
 Wed, 30 Nov 2022 22:36:08 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 x28-20020aa78f1c000000b0056c349f5c70sm2420171pfr.79.2022.11.30.22.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 22:36:07 -0800 (PST)
Message-ID: <65e471b6-b44b-3a35-74a8-d871c80820d4@linaro.org>
Date: Wed, 30 Nov 2022 22:36:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 1/3] tcg/s390x: Fix coding style
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221130132654.76369-1-philmd@linaro.org>
 <20221130132654.76369-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130132654.76369-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 05:26, Philippe Mathieu-Daudé wrote:
> We are going to modify this code, so fix its style first to avoid:
> 
>    ERROR: spaces required around that '*' (ctx:VxV)
>    #281: FILE: tcg/s390x/tcg-target.c.inc:1224:
>    +        uintptr_t mask = ~(0xffffull << i*16);
>                                              ^
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)


Thanks, queued to tcg-next.


r~

