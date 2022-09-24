Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4875E8DB5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 17:11:38 +0200 (CEST)
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6ob-0003AZ-FK
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 11:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6mi-0001Cl-Ke
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:09:40 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6mb-000864-Ej
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 11:09:40 -0400
Received: by mail-qt1-x82a.google.com with SMTP id f26so1710286qto.11
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=SmCwkRZl+yMW7ZtpGR8X7bgW7FdqBGE+dlCZgYhzxDs=;
 b=nJZnomB2K9MiC0N9CFDCJewO4pmA9GlSzT8cGApMo3XQKYeroEOQUT+SUsObdWwq/D
 w4ASCmwHXTAxEDaOy+hJDvWywdfzyuLOBXhQZZf0kSlOlcoQEmZK2kjNJo50NIXw0WFJ
 Ru2YLPFTKhD/rjb/ZHSC288q5GgVAo9Db6QQ2hxJtsmn7yt8OzUxHwhvxSg/JizQ7EhT
 o2Esj8VUxHOEZDmAFQV1KwJFpLf1pvo4XICNbhcZGzeOiNWmfh3Pi7GIp+XXaAWxBFJ5
 K8vmCckFA/JbEsmENWi8Hk+dLB2shfPfgQlJkD/wa4pa6KcdlQP1iZOylWWRpafccnHl
 GvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SmCwkRZl+yMW7ZtpGR8X7bgW7FdqBGE+dlCZgYhzxDs=;
 b=AvApgFrOQp9ryeQKNDVzlJwjMlJ/yVpse0OuJN4TJWAnMog2mJT3ZDA724WfmbGNRq
 WXrSuY3TWBvUxITCZe990ubwKUFbdVIAPKR/jAh17KHbpMJidTdgDCgA708GOAgEKUE4
 ZciCJ1kMlcnQRYNSTZ0oRTjBo0riQ29udln1MLky/yWS/kYqMzPPorCgu4sFKzYgOLar
 SOGjkflmjGzxRFn8GAaYtfa0YoHU2+CeFY1JhDb4+LomSjXY3M/oecNMkTckVhBKqaLi
 DR9g+RWuyva9/Rh/kx7uYcld+7tcgDYs/SKU36YLBdEy18R2K6gRPEY/RfP13R+769mB
 dOgw==
X-Gm-Message-State: ACrzQf2QNYLMFqIgwztLd3IGBEQROIv7a5i7toRnKeFrC0GYgsQ1DASc
 6alKRcTzYJ3eGz5Un22aw58aHpVfRYUnEJUO
X-Google-Smtp-Source: AMsMyM5CXPGJLxz5rJy+HYnXdgfDEMJUVIntoikyngzEfn6LyFLMBwAcgKQzn29ZUkMJNLdTAD0Nkg==
X-Received: by 2002:a05:622a:11c9:b0:35c:3a5a:1ca3 with SMTP id
 n9-20020a05622a11c900b0035c3a5a1ca3mr11675287qtk.476.1664032172051; 
 Sat, 24 Sep 2022 08:09:32 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:1f12:b4b:2dff:20:54a0?
 ([2605:ef80:80b2:1f12:b4b:2dff:20:54a0])
 by smtp.gmail.com with ESMTPSA id
 dt9-20020a05620a478900b006cddf59a600sm8261042qkb.34.2022.09.24.08.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 08:09:31 -0700 (PDT)
Message-ID: <9875ffeb-ad97-e6b5-cc52-942f7211dd95@linaro.org>
Date: Sat, 24 Sep 2022 15:09:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/37] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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

On 9/20/22 17:24, Paolo Bonzini wrote:
> The new decoder is based on three principles:
> 
> - use mostly table-driven decoding, using tables derived as much as possible
>    from the Intel manual.  Centralizing the decode the operands makes it
>    more homogeneous, for example all immediates are signed.  All modrm
>    handling is in one function, and can be shared between SSE and ALU
>    instructions (including XMM<->GPR instructions).  The SSE/AVX decoder
>    will also not have duplicated code between the 0F, 0F38 and 0F3A tables.
> 
> - keep the code as "non-branchy" as possible.  Generally, the code for
>    the new decoder is more verbose, but the control flow is simpler.
>    Conditionals are not nested and have small bodies.  All instruction
>    groups are resolved even before operands are decoded, and code
>    generation is separated as much as possible within small functions
>    that only handle one instruction each.
> 
> - keep address generation and (for ALU operands) memory loads and writeback
>    as much in common code as possible.  All ALU operations for example
>    are implemented as T0=f(T0,T1).  For non-ALU instructions,
>    read-modify-write memory operations are rare, but registers do not
>    have TCGv equivalents: therefore, the common logic sets up pointer
>    temporaries with the operands, while load and writeback are handled
>    by gvec or by helpers.
> 
> These principles make future code review and extensibility simpler, at
> the cost of having a relatively large amount of code in the form of this
> patch.  Even EVEX should not be_too_  hard to implement (it's just a crazy
> large amount of possibilities).
> 
> This patch introduces the main decoder flow, and integrates the old
> decoder with the new one.  The old decoder takes care of parsing
> prefixes and then optionally drops to the new one.  The changes to the
> old decoder are minimal and allow it to be replaced incrementally with
> the new one.
> 
> There is a debugging mechanism through a "LIMIT" environment variable.
> In user-mode emulation, the variable is the number of instructions
> decoded by the new decoder before permanently switching to the old one.
> In system emulation, the variable is the highest opcode that is decoded
> by the new decoder (this is less friendly, but it's the best that can
> be done without requiring deterministic execution).
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/tcg/decode-new.c.inc | 748 +++++++++++++++++++++++++++++++
>   target/i386/tcg/decode-new.h     | 181 ++++++++
>   target/i386/tcg/emit.c.inc       |  31 ++
>   target/i386/tcg/translate.c      |  68 ++-
>   4 files changed, 1020 insertions(+), 8 deletions(-)
>   create mode 100644 target/i386/tcg/decode-new.c.inc
>   create mode 100644 target/i386/tcg/decode-new.h
>   create mode 100644 target/i386/tcg/emit.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

