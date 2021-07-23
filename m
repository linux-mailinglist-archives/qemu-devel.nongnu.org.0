Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6B23D4068
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 20:48:57 +0200 (CEST)
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m70ED-0002dS-0T
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 14:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m70D6-0001xd-F4
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:47:48 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:38896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m70D5-0004CX-0A
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 14:47:48 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j8-20020a17090aeb08b0290173bac8b9c9so10260808pjz.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 11:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bdZ8/Mv7WA8QplTbPrbLQ3qIIe8vn5g9SV7L4dz3W/E=;
 b=nX3mBmwHYAi+WtZ1ZJ3a2CgPON0II7Dnbcz6+hwfLzLN7wsJsw1vA2n3LStWBmv2qC
 fNFR9l7Cfnn6TaTF6fx3qSve6zJg74Qn+Jz5drTShd6p4cA7IxozTF4CygNJ1ihC1Nb6
 EdA6FeUTzkqqkX8wDsKEZhnzlED5qzuNtruLFbkm7OUlGG3fqLqgTmJgmPQ1FYKnKl7M
 llywmD0CPCPerfV1DxGEe/2UOkH2uNUsCReKz+uwmMABl7RwfURL5XuMf/vNG99EMrW4
 iR8HHd7URC46P5VJtasAHCAQ/EwmnLqZiCTEA13qRSmLtY3Q8UqwZZSOy9yJrZ8eod7g
 S3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bdZ8/Mv7WA8QplTbPrbLQ3qIIe8vn5g9SV7L4dz3W/E=;
 b=EE6hnjMRUj3wRlEA7yNYYwMennN6a6rANqDGr8QzgCl8nOmyc8H9xOK5QPgpjZfLWV
 X/D/U6MUA//1kuDqjYwHSHqw09Adf9YSMRh2vM7my8PSuyL3y4qcJMVEAPot/aRAOd+o
 FIP3oktSbzeOyjTyF/HjQ0gFQEeefAV9HuE00SF5N15VhpdQPt8UQYCekOthKQc7SM8W
 Vk1yH4Zyfz2rPiY+nQkl7cFQ4lSBhzWNUQTS60YTS9/Vy048J4DecUMaCQzNnphlPlrv
 Q8Invr7DpaOCbA7X3jIcQ/5LA0rKagAI7ytSXVYSFQEB9DYlr5+JtUem+vhsBX58fNm3
 YuwA==
X-Gm-Message-State: AOAM532srePgncVcspCHa5XUwFfT//BIHHITMxM8aP8Ciy+Jekix8n4H
 6C+/GmFWgcJtX2pnjLHjD392YpCtHQ51EA==
X-Google-Smtp-Source: ABdhPJyaZtDxLYubYO/iucx2vK/djFR4Se23soDLMztjJ6WHDk5PxIXQdLb3Tx8+0HEHCOidoc4Djg==
X-Received: by 2002:a17:902:f295:b029:12b:c82e:3563 with SMTP id
 k21-20020a170902f295b029012bc82e3563mr2576345plc.33.1627066065341; 
 Fri, 23 Jul 2021 11:47:45 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id i9sm2229272pju.50.2021.07.23.11.47.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 11:47:44 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Add sve-default-vector-length cpu property
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210714180635.1648966-1-richard.henderson@linaro.org>
 <20210714180635.1648966-3-richard.henderson@linaro.org>
 <CAFEAcA9yQRVVyHbdXnKq=XcPfB=6pAmpOCJ0Zj1Hqr5L8Aco0Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80550e31-cea0-f465-8b71-147843fda38e@linaro.org>
Date: Fri, 23 Jul 2021 08:47:41 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9yQRVVyHbdXnKq=XcPfB=6pAmpOCJ0Zj1Hqr5L8Aco0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/15/21 11:14 PM, Peter Maydell wrote:
>> +#ifdef CONFIG_USER_ONLY
>> +/* Mirror linux /proc/sys/abi/sve_default_vector_length. */
> 
> /proc/sys/abi/sve_default_vector_length wants a vector length in
> bytes, and it looks like we take a length in bits. I assume that's
> to match other places where the user can specify vector lengths,
> but we should mention the units we expect and that it's not what
> the kernel uses.

Oops, that wasn't intentional.

> We also don't support the kernel's (undocumented) "-1 means set
> to the maximum" behaviour -- do we need it, or is that more reasonably
> achievable by the user via other properties ?

I didn't notice that one either, possibly because it's undocumented.  Might as well 
support that too.


r~

