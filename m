Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D65606A43
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 23:28:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1old5T-0005x9-G0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:28:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1old09-0002Qi-0J
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 17:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1old01-0002QG-QX
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:22:45 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olczz-00054f-5H
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 17:22:45 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 g8-20020a17090a128800b0020c79f987ceso4722974pja.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 14:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u2gmfiWqzgI/1RbLqoZXVNy3iQx1kP/VMYxQkMmhfl0=;
 b=KsWq2UB4bgzHyl8bQePZ0Hbg9JvSwhRD1MZgVqDIdySKxnEFET98gkmsORQWgQg6NC
 sXWXywbmsAaR1MnfXXkMlopR09fkrfejckM8ovVJsKLfcGw9yZ2BOTSF+tl0eCEhj+mc
 zAFBZMoA6gzYseW+rjykCxgvH1EV5EmSDsRTP9TnyprDNthHZvaN9Ln2I9GGwLarQYne
 Uvsqas44LMT4CHU/UqXgTiHdqJ3ULVKU67doYgQSdgZ3yITPafWj5MutBgoNHMLprRRS
 VMDEVOP6+yGAZir4NF72plicCHZ4AsVMwUsPc9gO4itSXCaMdPPDSnEUm0f/a05KsuoQ
 KHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u2gmfiWqzgI/1RbLqoZXVNy3iQx1kP/VMYxQkMmhfl0=;
 b=Eos9OcAmpdNSTGE0C188UDqQHisq0JmJQ/E4b7wCTvkohJcLeyErTJeeUqf/x0/XOH
 czq/vsFm0zNvwfCetgo5QrpACWsJ3bYTnHf+LWCMNpv/ngMGNwMo3Rrl7bNrX71S5f9b
 geosjfeDiQ/gR63Khh8nSZPK1NT5QTori/qlVMa3W5GBLTyycIdGiLYm4DeskUL/uPz9
 m4yYG/PT6h2F+0TpeuQ+izdwoICqxKCgmSnQSKZP0CJv10COIojPJe4yQ04a/vgYCQc9
 4BoVVvvvH4YEYyYiGzg/2bk+vt8F6jDZiXSZOEvK9CaPix71rIt+1KaCIj2M5q/PfIp5
 UCZg==
X-Gm-Message-State: ACrzQf3N0pm8zi6mDn8nFCBPV/YT3Vu0NeV/gtQjrBYWyU33M6YH+rQY
 +ICthAO/xf+b63QHbMAJac+cQw==
X-Google-Smtp-Source: AMsMyM7UWwhZCMgqtC7fQGPNAfq+W+sqdLXKHuAhErg6iKjCyOyAJ7RKMX54/eAnnOjmxP5zxwJjkw==
X-Received: by 2002:a17:902:d4c5:b0:185:507b:5ef3 with SMTP id
 o5-20020a170902d4c500b00185507b5ef3mr16214480plg.108.1666300960954; 
 Thu, 20 Oct 2022 14:22:40 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a63e510000000b004308422060csm11858860pgh.69.2022.10.20.14.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 14:22:40 -0700 (PDT)
Message-ID: <87a62593-9b00-5120-849d-c00a41343ed7@linaro.org>
Date: Fri, 21 Oct 2022 07:22:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/i386: implement FMA instructions
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221020134353.50272-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221020134353.50272-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/20/22 23:43, Paolo Bonzini wrote:
> The only issue with FMA instructions is that there are_a lot_  of them (30
> opcodes, each of which comes in up to 4 versions depending on VEX.W and
> VEX.L; a total of 96 possibilities).  However, they can be implement with
> only 6 helpers, two for scalar operations and four for packed operations.
> (Scalar versions do not do any merging; they only affect the bottom 32
> or 64 bits of the output operand.  Therefore, there is no separate XMM
> and YMM of the scalar helpers).
> 
> First, we can reduce the number of helpers to one third by passing four
> operands (one output and three inputs); the reordering of which operands
> go to the multiply and which go to the add is done in emit.c.
> 
> Second, the different instructions also dispatch to the same softfloat
> function, so the flags for float32_muladd and float64_muladd are passed
> in the helper as int arguments, with a little extra complication to
> handle FMADDSUB and FMSUBADD.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.c                |  5 ++--
>   target/i386/ops_sse.h            | 27 +++++++++++++++++
>   target/i386/ops_sse_header.h     | 11 +++++++
>   target/i386/tcg/decode-new.c.inc | 40 +++++++++++++++++++++++++
>   target/i386/tcg/decode-new.h     |  1 +
>   target/i386/tcg/emit.c.inc       | 51 ++++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |  1 +
>   tests/tcg/i386/test-avx.py       |  2 +-
>   8 files changed, 135 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

