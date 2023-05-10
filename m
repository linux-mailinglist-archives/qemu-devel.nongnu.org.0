Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912426FDB05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:48:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgR8-0004x9-By; Wed, 10 May 2023 05:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgR5-0004wr-Jb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:48:39 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgR4-0008Jw-40
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:48:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3063b5f32aaso4531145f8f.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683712116; x=1686304116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vjke7ea4LvF7OWGekzNHMNgy8NOLYlcQAFQOJaWYkxs=;
 b=CXrJkfV4MOSp0Mk8kSjWGIVa6vWyKSQMbLrOROO+xnMppC59LjrBFJPRtFjT3OwwXK
 9JqFcAB3QdZuzIwySFLTmDVOCUHHv+vLZqJPf+4KAAxCeRDrFyLUAI3IrN7sbhvXXEt0
 77wqQkZqfkMByOOy5mw6gcQi96byUJyEtvYH9vEB/APbLUJj7i+40T5Ly/tmdmZERJ5R
 ckyaDpL50q5xwhCMRKdop6ZvpSn67r47IGOOt1ejjaC4q0SXPn90ee+N8+aYeWj9KyV7
 +GG/w4E8OE1CDfCTb79adhaQS4GlOphZGdklLeKPD+yeUSQHvmcr5K4R6hE/NhBcezKW
 CJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712116; x=1686304116;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vjke7ea4LvF7OWGekzNHMNgy8NOLYlcQAFQOJaWYkxs=;
 b=HC4GMhDtqQkgKkQyBn0ePVKopUlsGuOfc2qEIzbbmqWZ93OEE4CluwCduu4JX8rDJF
 X6DpaIsEA/zFJFp/HrDvoOyBrj1jPPj1IwlAeLGH18+vkJqbLI3h/QcDI4e15wfr6Sez
 fihv8IyMdC5Xic2/nA27wQs2U5mnhezE6zybmOt115FbFJ7al3h4AXZuG954BnX8t1mJ
 OxmKB8Bzy1vdO+2Z4ymlyM8MlUZHJzT8+oQr2Kf2tAviz7UShlT8V8Mnr1ftMF+icSBO
 z03nD1mhRlPzHVOTn15ZzShShHRzyBEBIOyXix4zTzcItvz5gtTgKHi018JVB2hPy3YQ
 Xm0Q==
X-Gm-Message-State: AC+VfDwRrE7ATKL8HIyoULnBgxPpfwzDYw7raZTWIYxDBXQy9CHS+Gjs
 0jmcUvl5C0Iy+PVJBoP/Q9sBZg==
X-Google-Smtp-Source: ACHHUZ4ZRAAnRzoD3eglCTUqE4XwjR8mQNxFgI6AM037CpevEk5TLMlpC83a8PNaxhgGF3uBMUvIcA==
X-Received: by 2002:adf:f291:0:b0:306:3bf0:f1ec with SMTP id
 k17-20020adff291000000b003063bf0f1ecmr12479575wro.7.1683712116543; 
 Wed, 10 May 2023 02:48:36 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a7bc40e000000b003f4272c2d0csm7447985wmi.36.2023.05.10.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:48:36 -0700 (PDT)
Message-ID: <9dc720f2-6a9a-ab15-7f79-ad9c11bdd379@linaro.org>
Date: Wed, 10 May 2023 10:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 04/12] accel/tcg/cputlb.c: Widen CPUTLBEntry access
 functions
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-5-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-5-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:13, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cputlb.c      |  8 ++++----
>   include/exec/cpu_ldst.h | 10 +++++-----
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

