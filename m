Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F73210C4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:18:33 +0100 (CET)
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4YC-00075m-JL
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:18:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Vv-00067M-JT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:16:15 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4Vq-0004fr-Ig
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:16:11 -0500
Received: by mail-pj1-x102e.google.com with SMTP id ds5so526170pjb.2
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x1Wp4C1ACyVvUXh9Lmggq3Bl/GPNd9yyR4SkBLbKUEA=;
 b=O/bvRv+QLcCd8frJbKntdMgo4VnH6JZD0m/XqP8250RZoFWDulDmpuWwxcvUoaw8jc
 QKp8A3EYSrcBuXSmdmlp5fFSpMaVrly9ZKK7cA3vpbnTgElvPBL0aIutIuqgg4djaUf/
 8O4oTPhY0GR4Q5D4oEBXjiPx6Tg47BPSoTpdOTJeQUzHoPBBuK8ZfBT34XgVfbQ2jKGg
 s3sow0y8PuSkmhWlljKY+xUSiAOIX5DepuiYwLBvo+yTsN5RJMQYdTEgWoRqQ+NfKcdD
 KbKQ+uVj8TZqZWPH+3ko+Dm2nPrqevjYLoejBTOrBg/mziX5ARu54STk5//Y1iGd1bIB
 0/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x1Wp4C1ACyVvUXh9Lmggq3Bl/GPNd9yyR4SkBLbKUEA=;
 b=caPIfzUcmUIJCuGQJokz2zeOM2XH6SNKi7Vg+DC30s1OGlX4JPQxtHk5Av5DOI/cwe
 cAKdRv2b9M9/pHUB5Q1KUNfsgrxg683p6pfccAzEapqEPcPR4IlUjOYb+VZIUNUYUUg9
 yBek2JaNQhia24VCZSU+6u5VBbqF4Wld+ijvMtDqhLHsFXylxgrMOl4SHm+ZL1FNXXUK
 7nUFLye/GzSnnqVW6qEuBZl8onb4RvzEdNAS9dorCBSTlemPJ9HJtx5TjGmdz92YItod
 L+PXgdwjbQint8nYmkUHQBLaskqOtekfNTaPI9g5oHmlpGVU83sxeq0B4LbPJnCVpkNL
 +wRA==
X-Gm-Message-State: AOAM530BZRaPV1gbUzGV1uN/YT5vlzF5fyxK4ZOfeZLSfRZHxP0+14CT
 ZoVsySTmC2Nu7P0Pbc9pM9nwGK/5Xdozgg==
X-Google-Smtp-Source: ABdhPJzIm5xn2drjEF+z7mfxLplOLpJIyy/K3K7+eFNLnz5tXWx509uoyFF8rODek0AEt0C3RHbYzw==
X-Received: by 2002:a17:90a:6385:: with SMTP id
 f5mr21987027pjj.91.1613974565002; 
 Sun, 21 Feb 2021 22:16:05 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u127sm17515243pfb.180.2021.02.21.22.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:16:04 -0800 (PST)
Subject: Re: [RFC v1 02/38] target/arm: move helpers to tcg/
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-3-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a5467487-3afd-92e1-e319-4b0b9a11b840@linaro.org>
Date: Sun, 21 Feb 2021 22:16:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-3-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  meson.build                          |  1 +
>  target/arm/tcg/trace.h               |  1 +
>  target/arm/{ => tcg}/crypto_helper.c |  0
>  target/arm/{ => tcg}/debug_helper.c  |  0
>  target/arm/{ => tcg}/helper-a64.c    |  0
>  target/arm/{ => tcg}/helper.c        |  0
>  target/arm/{ => tcg}/iwmmxt_helper.c |  0
>  target/arm/{ => tcg}/m_helper.c      |  0
>  target/arm/{ => tcg}/mte_helper.c    |  0
>  target/arm/{ => tcg}/neon_helper.c   |  0
>  target/arm/{ => tcg}/op_helper.c     |  0
>  target/arm/{ => tcg}/pauth_helper.c  |  0
>  target/arm/{ => tcg}/sve_helper.c    |  0
>  target/arm/{ => tcg}/tlb_helper.c    |  0
>  target/arm/{ => tcg}/vec_helper.c    |  0
>  target/arm/{ => tcg}/vfp_helper.c    |  0
>  target/arm/meson.build               | 14 --------------
>  target/arm/tcg/meson.build           | 14 ++++++++++++++
>  target/arm/tcg/trace-events          | 10 ++++++++++
>  target/arm/trace-events              |  9 ---------
>  20 files changed, 26 insertions(+), 23 deletions(-)
>  create mode 100644 target/arm/tcg/trace.h
>  rename target/arm/{ => tcg}/crypto_helper.c (100%)
>  rename target/arm/{ => tcg}/debug_helper.c (100%)
>  rename target/arm/{ => tcg}/helper-a64.c (100%)
>  rename target/arm/{ => tcg}/helper.c (100%)
>  rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
>  rename target/arm/{ => tcg}/m_helper.c (100%)
>  rename target/arm/{ => tcg}/mte_helper.c (100%)
>  rename target/arm/{ => tcg}/neon_helper.c (100%)
>  rename target/arm/{ => tcg}/op_helper.c (100%)
>  rename target/arm/{ => tcg}/pauth_helper.c (100%)
>  rename target/arm/{ => tcg}/sve_helper.c (100%)
>  rename target/arm/{ => tcg}/tlb_helper.c (100%)
>  rename target/arm/{ => tcg}/vec_helper.c (100%)
>  rename target/arm/{ => tcg}/vfp_helper.c (100%)
>  create mode 100644 target/arm/tcg/trace-events

Can vec_internal.h be moved here too, rather than later?

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


