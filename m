Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A690760D82D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 01:51:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onTgU-0005CR-4p; Tue, 25 Oct 2022 19:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onTgS-0004zr-7s
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:12 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onTgQ-0002xf-8c
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 19:50:11 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso552419pjc.2
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 16:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SpUwsYmWJLaXasltbRDgdudnm5JOibAtNFyKmzAElEk=;
 b=FUQg8kCLk5uomG4HWy+894RlOzUJdycz+T4ih5OYUZ466781e5/tzP0t9gsVGAQYgb
 siVYell8RYnRB17oXxvNYzA0s0AMQwd/HXQ5GJvusGVaHC50S7uvZSMYWlr9COFTiL1c
 NkKNONUL+GpUeqssnr0mM5yHxxcPmlZx7xkp7JkM0yesauG+JXxs4ybzbzUAXu9NCE8U
 hpSk6zwJx0Ll/eDOfK3EfvkONubXRiza6JZsg1VTZ0swnHpNJZV0mdip6c4QFGSlhxeC
 5nYVa3IZZaXe8dHuIM9ofY31JR3WR1SvMUE1gf3iJkxYp6rry3SkjZwi7iziuBjPszMQ
 fbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SpUwsYmWJLaXasltbRDgdudnm5JOibAtNFyKmzAElEk=;
 b=PscDoO7Ufj6tPFs8Nyobx5gyfHH8VZfuv3XqfVp0ISje76lnYdIWYkfyBXLMW1XtWr
 9kDBfpITJpDAlxC5XQ1cfOJ+p2bCIII9c8CW285s+S+LxqH4XgQXV8OxQ+qLmuBEPbAf
 MdWCqRUvTX4VbaL0F8zCPTV38A6Fea8SI1vVGzTsgv3lUS62dwfSha3WANdZlMmBZklY
 Gnh9ygsVflPQfOCKJhYtPcXJK1cb4Cakm2DWQ7O/p6yQRWdIGYSeq7LWtut793cP5Vby
 esE+oxtTNPSF+dsF2tPNhNbDWQnuR9nysASz24TyoYliu3HewpSxBLDLX/5tG2mtpXxc
 hywQ==
X-Gm-Message-State: ACrzQf17K5lh0YEDUFvLyIavvUZfqTeF2ESjE3RXNzvuuo4RBkH2Bb1m
 hUX44naMh+ITEDYPivGnw6YXOQ==
X-Google-Smtp-Source: AMsMyM40h59nwOCKbFG4PUCW2cD/T5oJJU3xgAAV72keSczwm6g4bpBubAOFCR59pSUdJIt8kozACQ==
X-Received: by 2002:a17:90b:3847:b0:20d:c41f:de7a with SMTP id
 nl7-20020a17090b384700b0020dc41fde7amr916674pjb.85.1666741807736; 
 Tue, 25 Oct 2022 16:50:07 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a632341000000b0043a09d5c32bsm1776785pgm.74.2022.10.25.16.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 16:50:07 -0700 (PDT)
Message-ID: <548c9d6e-16d2-1a61-a1ba-ee4aded712a7@linaro.org>
Date: Wed, 26 Oct 2022 09:50:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/arm: honor HCR_E2H for AT S1E2R and AT S1E2W
 address translation
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Ake Koomsin <ake@igel.co.jp>
Cc: qemu-devel@nongnu.org, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221017093003.547009-1-ake@igel.co.jp>
 <CAFEAcA_E5P2+ybnhH05DNsb_LuKjROU9-NKke46x+_LO7zr-qw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_E5P2+ybnhH05DNsb_LuKjROU9-NKke46x+_LO7zr-qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 22:25, Peter Maydell wrote:
> In the pseudocode, E2H is handled by changing the behaviour not
> just of the S1E2 ops, but also of the S1E1 ops. If E2H is set:
>   * the S1E2 ops use the EL2&0 regime, but continue to ignore
>     PSTATE.PAN
>   * the S1E1 ops also use the EL2&0 regime, with the S1E1RP and
>     S1E1WP ops looking at PSTATE.PAN and the others not
> 
> Richard -- do we want to just do the same thing, or do
> our MMUIdx uses differ from the architectural translation
> regimes in a way that means we need to do something else?

We want to do the same thing.  The *_PAN MMUIdx are intended to be exactly like the 
architecture, when PAN is enabled and not ignored.


r~

