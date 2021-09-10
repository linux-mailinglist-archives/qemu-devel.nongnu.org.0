Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DA406D39
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:58:50 +0200 (CEST)
Received: from localhost ([::1]:53140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOh3J-0004nf-7Q
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOh2Q-00047Z-09
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:57:54 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOh2O-0000uI-DE
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:57:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so2753893wrh.10
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2VfHc5KO9WMdiTBuGivxoSBEiRgjBDaZF+iKDGww+5I=;
 b=DROGL7rjorW3MABBYGZSA29vpUvKqCS+nRVotiDlqpXxp9+0Cr4qzAZijrRlEjl6/F
 pXLfggJggzksmU3LS4S0fPraWuFzHdT6Dpnp5b3r3N8CDPTAWm26BN/j+9Lrnl1yBEI/
 P1S9Giruo0wab3hL/Yt3tT55ttn+2hRqfjXZ+lhof3PkagWX3LDS3MuIrg/rFNN9u93k
 23vht1lgvwUM3bJFEDa4SGvO4v+HLwDPEZgZyHRGP9gN2rZwhIU6NHgifTya1BAVjgVb
 Hee/KecX2e7peL3g7m9oYCBauoros7/BgKjjygCsE/goj8fme7PgZQo6yYhY35GIYdTf
 z6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2VfHc5KO9WMdiTBuGivxoSBEiRgjBDaZF+iKDGww+5I=;
 b=3lqY9baPg14LnJ4HeNeklv+rNuOiXVP6vxpY+0rL5Y1Ji2VAEE1j0xkZBFC1loUwmS
 6eIDbpAbdb3SqUePivExrFIIT/OoLe4sJIRXHxxMvMTpy6bdaCXrAqYGjeXrz9MGBag5
 L+urFMIPoxS5b922PVSSl6K1JtavfxjN4wZiPLStkj+LAmxSwyOC+R4r4z9NyRcW2Tcn
 73PfzlCO0cohAcgaFjlerkPjaOjAFkf6MLZD2AAZv9ehta5AJizM+8h3kEX4QU3WsT07
 Gj+JpRAFWCEa1GKDyTK0jATRyJpHyxuuB3jZr66bPmAa3mXwXfS//GH1okMnV4rMEvLR
 9syQ==
X-Gm-Message-State: AOAM532sHjPlL+yYN9o96ritbhNKpkckdVwzSmBnxISLDQ63vMOUfxiX
 S9c7NUjndRGPVtvf8AL7crHwlDHFPR5DqFxj
X-Google-Smtp-Source: ABdhPJzyvXDABG2Cb+u/kB20lK+Yhbh3fGXmEomjUF4DpYUveTAtkeWX0ft8b5FoeqKshYFyU3EYMw==
X-Received: by 2002:a5d:43d2:: with SMTP id v18mr9954302wrr.98.1631282270383; 
 Fri, 10 Sep 2021 06:57:50 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id k16sm4736798wrh.24.2021.09.10.06.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:57:49 -0700 (PDT)
Subject: Re: [PATCH v10 03/16] target/riscv: clwz must ignore high bits (use
 shift-left & changed logic)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
 <20210904203516.2570119-4-philipp.tomsich@vrull.eu>
 <3e608998-3270-cf41-66b5-32158db99de0@linaro.org>
 <CAAeLtUAgr9r2aBV+M8jVE7J0DG2U4-EjxAEfY1adhQ_XCfT5ZQ@mail.gmail.com>
 <CAAeLtUAstVXF563xWGP3DjPCdPaN4GO8kr5S5LXVQnWu8eqDZQ@mail.gmail.com>
 <641dcee6-0577-35e3-0b58-2acdc2b80c2d@linaro.org>
 <CAAeLtUD2QL43+=F3F-HfZ7S2+7FLmsyvdWnr0GO5-aXKPUzGBA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <efc18104-0758-64fe-17f2-1413cd149aa7@linaro.org>
Date: Fri, 10 Sep 2021 15:57:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAAeLtUD2QL43+=F3F-HfZ7S2+7FLmsyvdWnr0GO5-aXKPUzGBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 3:47 PM, Philipp Tomsich wrote:
> Just wondering regarding the UXL-comment: the clzw instruction will be an illegal encoding 
> for RV32 (the w-form instructions are present on RV64 only), so it should never be 
> encountered in a RV32 instruction stream.

Correct.

> Did you mean that clz (the instruction operating on xlen-registers) would have ctx->w
> set for RV32 executing on RV64 ... or am I missing something fundamental?

Yes.

Or, as some test patches I was planning to post this weekend, replacing "w" as boolean 
with an "operation length" (ol) as an enum of MXL_RV*, so that we can represent "d" 
operations on RV128 with the same mechanism.


r~

