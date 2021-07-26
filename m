Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5B3D5D11
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:34:01 +0200 (CEST)
Received: from localhost ([::1]:45774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82cC-0000b1-FJ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:34:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82b0-0008Lq-8R
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:32:46 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m82ay-0005qB-Qb
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:32:45 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so20329351pjb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1R1TpIZAGhobMfNqQ1mvlScSxyUfSGmbRkNOwiXH790=;
 b=M/da+guJX20K5dVuGzSR5VGqx6pS8zccVzdT0zdg3pMwfCsdue9H1+PI2KF+ZY7sMm
 uoWSi7yT6dXzCiSotxYDtU7exD3yTfSMGP1IpqW/p3H14Ph8ULRRZQkwlUJIQbXgVOD1
 uqHmZNQU4u82PJq8PrZhpm3HMDt23q9be++LernUxDvVqr/7U8Lm9ghVzqVQ5rAAYYyP
 a2oZWJqfymNifON3Hc1txshevS31UygX/rlGehAGTJqJaZXOIU+g/6HK74YvPdNagW6S
 lue7Bu9iwLt6NFNX/L1/ywHac99It+5/zYz8ybCQrdCFj09D/rU6kQ5ImsxtorPranyJ
 ANtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1R1TpIZAGhobMfNqQ1mvlScSxyUfSGmbRkNOwiXH790=;
 b=Wq995FLMV4/oKL5n3ev1t3Plg0mhTRO/zf0OKBnIt9bCYAP0i5ZjKb3xA9UCv44gjI
 j16Y7bO51g0wqaPvCTjQqqb1/6J0VMO8Solwfvzqwz2JdrghWZq9nFqGQSBEW6KG4BjE
 9CPsmmrwhqJzXREXdlGvNpNo/3WLFS6wGGOaTKtR2OghwN+eVlC+BIVxWrJGgfMZe5pm
 0VlhB1V+okiddM8EkMAm2GugNCK4QlGt7EzZBL6Oyz8Dcl0cAa6ACcfkmh8+1DEC84YT
 KwHPQTiNHMfwEsOs/lfhANjv4aQuKM2BEfA+Vh8d37qZgAY46xjpgqrai00v6Vw5C0Pm
 rU0w==
X-Gm-Message-State: AOAM5308n9mJHKD7zvDWQNat/jl4KgaIqQFDqGY5CCrow2Z5kijCn3gF
 AR/ZFHkixVP2GQqiR1S+yfpmEQ==
X-Google-Smtp-Source: ABdhPJzMZFcEmMWQBw+w8/xwi/hxNQpVrtAyVG3TUMMGISPGQIVdsquPUOOEdK/lv7VhophAuOtQyA==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id
 d18mr27049396pjw.102.1627313561212; 
 Mon, 26 Jul 2021 08:32:41 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id s31sm52823pgm.27.2021.07.26.08.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 08:32:40 -0700 (PDT)
Subject: Re: [PATCH v2 03/22] target/loongarch: Add core definition
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-4-git-send-email-gaosong@loongson.cn>
 <ea7be587-1bc6-f770-1c9f-4f57e1c3c7eb@linaro.org>
 <ce2e4871-bed6-e5a7-b8ec-faf23c836307@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <457ecc92-ec6c-8ec9-f477-78af439d62dc@linaro.org>
Date: Mon, 26 Jul 2021 05:32:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce2e4871-bed6-e5a7-b8ec-faf23c836307@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 10:47 PM, Song Gao wrote:
> Hmm,  but where can we declared in ? such as ARM architecture declared in internals.h, is that OK?

Yes.

It is preferable that only things that are used outside of target/arch/ go into cpu.h, and 
that everything that is private to target/arch/ go into some other local header (with 
internals.h being a good catch-all).


r~

