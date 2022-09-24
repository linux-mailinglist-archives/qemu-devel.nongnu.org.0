Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3125E8FCA
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 23:22:09 +0200 (CEST)
Received: from localhost ([::1]:55214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocCbB-0007SD-1K
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 17:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCW8-0002ix-Ut
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:16:57 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocCW5-0000zn-1U
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 17:16:55 -0400
Received: by mail-qt1-x831.google.com with SMTP id j10so2064912qtv.4
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0pcoCmTssQom92+jXh9h4qQoPHROppRKJNnJPTzQf6Y=;
 b=mwvg5lST7NR/y8wpugnoRIof4yWO0LXKQFiGKM1Qwk7RUDb1gO/cz2twg5xWaZki9w
 4WkcrjnW2rui8xAfgXeSaypO1HO9p/NIBclOBoOQZLYxGp+kflOMteprB8M8MN8fIx5B
 6KtKbXuslfesEClQqK9J5QOOmJcHtUB1hrXvT05SiXrKzq6ZXVG/Xb3R8aHYaGsO/FFd
 nIoTwQ3pBk3wCdCqyg8SFiYwPCABU7SON6boJ4PtnBAYyXVAYGhjXf459yNyn4zbtu+t
 GpdZKalSIu5xONHcQidoXvTkyqK2LdGjrOAE58Eldur7m1/e9kV7EX3NKnjO+7SzMW+H
 nC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0pcoCmTssQom92+jXh9h4qQoPHROppRKJNnJPTzQf6Y=;
 b=WxqwHAMqan/AK2jkaKEIkHo6MgUOz8Yc9d/5e8tgCa9PfLe7rhSWNLM/jeDMzj/A8R
 SvxzqD5oQX9rQeLJt22ETTiBcqAlHb6cXXQzHr/jZHHZGNeQt/WkRIMYchCYlUIqUwvC
 GK5aGmnRAvjYXnU1fYnpZRhtFiDSYhs75V2c/gGtSxZ22pZHC3dcCFoCif2vZ6kRNshx
 h70OKE1J9PEEsPPMfUFQh+GRJhwcReJZ3TcEGTZYx+v7CyVn5+oxtK0Btb8X48JPg895
 iH//GXwwR90UJwPaTRQNY+FBtjW2WgsYXQGA0B0DfNl3ej8TrO2GQaEfP66F/VPvvf9Q
 M0zw==
X-Gm-Message-State: ACrzQf076NMpZXKLdTdFDQ9eNPy6FOjrYHtCxkC85pZXOtmJlU81E6Ji
 XlV52XSXwp4L1zEVUrtUzJhLHA==
X-Google-Smtp-Source: AMsMyM4Ng+rOMx50VZ4Mzqw6paxj7Z1VuDJQnkAawcmyQWdtubxoU0VWEmOmX+wKf0QcP/v9WvsRAw==
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr12597960qtc.334.1664054211893; 
 Sat, 24 Sep 2022 14:16:51 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3?
 ([2605:ef80:80b4:2f4d:42e1:8e60:a726:78e3])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a05622a058c00b0035bafecff78sm8693509qtb.74.2022.09.24.14.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 14:16:51 -0700 (PDT)
Message-ID: <a01bb109-a386-593a-9b54-dacd661448ae@linaro.org>
Date: Sat, 24 Sep 2022 21:16:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-31-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220920172507.95568-31-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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

On 9/20/22 17:25, Paolo Bonzini wrote:
> These are mostly moves, and yet are a total pain.  The main issue
> is that:
> 
> 1) some instructions are selected by mod==11 (register operand)
> vs. mod=00/01/10 (memory operand)
> 
> 2) stores to memory are two-operand operations, while the 3-register
> and load-from-memory versions operate on the entire contents of the
> destination; this makes it easier to separate the gen_* function for
> the store case
> 
> 3) it's inefficient to load into xmm_T0 only to move the value out
> again, so the gen_* function for the load case is separated too
> 
> The manual also has various mistakes in the operands here, for example
> the store case of MOVHPS operates on a 128-bit source (albeit discarding
> the bottom 64 bits) and therefore should be Mq,Vdq rather than Mq,Vq.
> Likewise for the destination and source of MOVHLPS.
> 
> VUNPCK?PS and VUNPCK?PD are the same as VUNPCK?DQ and VUNPCK?QDQ,
> but encoded as prefixes rather than separate operands.  The helpers
> can be reused however.
> 
> For MOVSLDUP, MOVSHDUP and MOVDDUP I chose to reimplement them as
> helpers.  I named the helper for MOVDDUP "movdldup" in preparation
> for possible future introduction of MOVDHDUP and to clarify the
> similarity with MOVSLDUP.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h            |   7 ++
>   target/i386/ops_sse_header.h     |   3 +
>   target/i386/tcg/decode-new.c.inc | 126 ++++++++++++++++++++++++++++++
>   target/i386/tcg/emit.c.inc       | 127 +++++++++++++++++++++++++++++++
>   target/i386/tcg/translate.c      |   1 +
>   5 files changed, 264 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

