Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B553DC48
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 16:39:13 +0200 (CEST)
Received: from localhost ([::1]:47718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxrPM-0004W8-3H
	for lists+qemu-devel@lfdr.de; Sun, 05 Jun 2022 10:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxrN8-0003Bb-Rg
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:36:54 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxrMx-00047n-6x
 for qemu-devel@nongnu.org; Sun, 05 Jun 2022 10:36:54 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s68so10971703pgs.10
 for <qemu-devel@nongnu.org>; Sun, 05 Jun 2022 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9YfmyU4P7skjDpkQBG1bmYhw6LZzt95v+mXiawPiugA=;
 b=J7XwWRx5c0MskeD79xML8QF+nXwda7BrZ9Tnd/38ey4ZwVAOhQQEhgAYuQjAbVH8+m
 f/mNnv0TK54JnfZO9/ofDQJP+GAfqOtN8pd4LWMT/Fl0mu7VVy6fgPdO4SZ18cVWpp6B
 SCfXBM7al1a8L6DbcctXsgmQNjQ8iIN9Fwamk35WDvLV68siA1gkGzQPXfKhLb3kYXyP
 PqjH/CTG7TV5/6LWR9PMc3LVDe4rdKkS+YYgguj4opEZoqMsYXkfbAzaQ4kJP75T0hFP
 ti76+cJRuJO4yOV/GK8s6rmASvPuSWsgr3tC1VaPqFap0a6OYeyrDUnDydMcUd45Qp6U
 xAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9YfmyU4P7skjDpkQBG1bmYhw6LZzt95v+mXiawPiugA=;
 b=DcNRDtfl4HceEpgUXnbFYQaQYAST0+YC9iMIUV+cps4qT9DWeHtZ1B8WFJo9x+9Fi8
 +KHcbPQlN1zYB67Tcs8jcpd1VQXo1EgP6FEf8hNfMsJHsUMWaluk8pibw0BnGLtxvRM8
 IM2WnYlEpJBBOrz5MO+Jc0BVD9YSIjUMyS/a+XfN7tb6wVSJbg7lgKEg9JlzYW/Ca0ya
 EK+XeNcMlv+D0R92oGgH0/wTjJAVD7+d2OaTdjjuSCpt288D22Guw0QaitYTEEbbDbKG
 TBw8FdJmuJCw3qp1OV4a9zXHFPPjXq49EfxRNBCNpLI9jdUFRMGYoJfkOgoDNfHN1bab
 AzjA==
X-Gm-Message-State: AOAM532MXy2d/6MB0l6f0GhIeomjr30MRv7HPrRb2OfFhG9ww+GQBNuA
 IQzERSnc5Hp0PJHtyIHSh0kzlw==
X-Google-Smtp-Source: ABdhPJylo+3fzR7JM/UFfjcZ+yqmV2KJzvj1JerzyrgBTZTKsmyxj4ZkfewzBIMo3/rb3B7vy1a2PA==
X-Received: by 2002:a63:131b:0:b0:3fc:c051:5a04 with SMTP id
 i27-20020a63131b000000b003fcc0515a04mr17154238pgl.568.1654439800132; 
 Sun, 05 Jun 2022 07:36:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:7b92:21dc:74b5:76dd?
 ([2602:ae:1547:e101:7b92:21dc:74b5:76dd])
 by smtp.gmail.com with ESMTPSA id
 g196-20020a6252cd000000b0051b9e224623sm9343173pfb.141.2022.06.05.07.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jun 2022 07:36:39 -0700 (PDT)
Message-ID: <ac25d80d-d8e6-9120-1609-395d666f0af8@linaro.org>
Date: Sun, 5 Jun 2022 07:36:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 1/3] target/openrisc: Add basic support for semihosting
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>
Cc: QEMU Development <qemu-devel@nongnu.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-2-shorne@gmail.com>
 <0a1051aa-f2f5-02de-693c-2c8b5e002998@linaro.org> <Ypv/cBqa5CUeXoaj@antec>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Ypv/cBqa5CUeXoaj@antec>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 6/4/22 17:57, Stafford Horne wrote:
> I am kind of leaning towards dropping the semi-hosting patches and only moving
> forward with the virt patches.  The reason being that 1. we would not need to
> expand the architecture spec to support the qemu virt platform, and we would
> need to document the NOP's formally, and 2. OpenRISC doesn't really support the
> full "semihosting" facilities for file open/close/write etc.

I agree that "virt" would to more for openrisc devel than these nops.

> Also, if we have virt I can't imagine anyone using the semihosting much.

IMO, semihosting is most valuable for writing regression tests and not much more.  (You 
have no control over the exit status of qemu with normal shutdown, as compared with 
semihosting exit.)


r~

