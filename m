Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E539B41268D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 21:00:23 +0200 (CEST)
Received: from localhost ([::1]:50304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSOWc-0002tT-Fk
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 15:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOT7-0006cg-4R
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:56:45 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mSOT4-0005mX-E2
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 14:56:44 -0400
Received: by mail-pf1-x435.google.com with SMTP id e16so17149785pfc.6
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 11:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y2AmxF8lQAAQD3n7iN6BUQ9Y6JFlFg18BlqvX5uZQug=;
 b=LwIORFN05Vvj/3u1cL82J4okRFS5rt3i/XShDecPDUvpPv40V/6Y6BIdxv3s8L0v5Z
 2DtdCm3+OY6PKdYMdGuDwzJeYmKDuqC5PWJi8DZBiLGK7LVY/+9NfMI5Uo1wnki1xOzH
 OFzoduqqMi6pezyX/CIYEzH670CeAHf5rPDP7/L3qTmWu1m/Ujy0ziPU8RcABSaWvIHF
 Cmxkz9mZ77CfI3cTjEBHDv9r87E6jE5t0pwo/XASKcDCFfpETh8CQSwXlMg9Z2exwuRe
 8YHiYjgYhTQ0fdaQ1jAW9086c91cToAV/aVEnpSivVOGgmlryU5tEp1Pi4rNg572B8w+
 5p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y2AmxF8lQAAQD3n7iN6BUQ9Y6JFlFg18BlqvX5uZQug=;
 b=CbYuOdpMJcgemBh/Evo0AlkNmIuka4wSHybLLz3TGK/aaMrqRc2d7bubmPYDRuvAvB
 LNbt8Sdfn8fKHygcLoUenDHa/0TZ4I2tF47TFPab+zjOhndTU8iq3GT+GU2kN2hHuhXV
 c9McgYaVGM2pclL3voMFfvRGBWpAM2NoukQGZAzbvLN1My5ZHfVWSj0CR1nRdSr/qeg/
 9oMcIyDX9eKwqZdZ2iRY45LnSHZIvNK5QG7P5xvgpkMMBPDIxFycSsrcp5FB+1ztzHA0
 rlV0uPe5udZ4rOtgky1920uoyNdaf5xb5TgN7NHNh0WHDmlpjQpkVhfQMmsqtgQAdF7e
 nkuA==
X-Gm-Message-State: AOAM531y5RxcsFVwEzrgaKS/bbA8+sobLb/yeB2l/RhsdJuEeUxn/EfX
 YeRf2wHTiavf5KIyl45RdinywQ==
X-Google-Smtp-Source: ABdhPJxfTGXE4XuvJHiD8laFh/GcsUz3T82E3peXbftF0VuW5di+5m25Egg4j9wHOH7HcnRMdGnnWA==
X-Received: by 2002:aa7:9718:0:b0:43e:ee6:fd94 with SMTP id
 a24-20020aa79718000000b0043e0ee6fd94mr26085684pfg.73.1632164200775; 
 Mon, 20 Sep 2021 11:56:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n19sm14760980pfa.60.2021.09.20.11.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 11:56:40 -0700 (PDT)
Subject: Re: [PATCH v6 10/21] target/loongarch: Add floating point arithmetic
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1631866380-31017-1-git-send-email-gaosong@loongson.cn>
 <1631866380-31017-11-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d77c332-19bb-c337-840b-5e97f82ec530@linaro.org>
Date: Mon, 20 Sep 2021 11:56:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631866380-31017-11-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 yangxiaojuan@loongson.cn, laurent@vivier.eu, peterx@redhat.com,
 f4bug@amsat.org, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 1:12 AM, Song Gao wrote:
> This patch implement floating point arithmetic instruction translation.
> 
> This includes:
> - F{ADD/SUB/MUL/DIV}.{S/D}
> - F{MADD/MSUB/NMADD/NMSUB}.{S/D}
> - F{MAX/MIN}.{S/D}
> - F{MAXA/MINA}.{S/D}
> - F{ABS/NEG}.{S/D}
> - F{SQRT/RECIP/RSQRT}.{S/D}
> - F{SCALEB/LOGB/COPYSIGN}.{S/D}
> - FCLASS.{S/D}
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/cpu.c                     |   1 +
>   target/loongarch/fpu_helper.c              | 406 +++++++++++++++++++++++++++++
>   target/loongarch/helper.h                  |  37 +++
>   target/loongarch/insn_trans/trans_farith.c | 108 ++++++++
>   target/loongarch/insns.decode              |  56 ++++
>   target/loongarch/internals.h               |   2 +
>   target/loongarch/translate.c               |  11 +
>   7 files changed, 621 insertions(+)
>   create mode 100644 target/loongarch/fpu_helper.c
>   create mode 100644 target/loongarch/insn_trans/trans_farith.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

