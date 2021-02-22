Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9B3210D8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:30:15 +0100 (CET)
Received: from localhost ([::1]:35408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4jX-0005H1-0t
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4iU-0004qd-SE
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:29:10 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:34763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4iT-0002L0-7l
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:29:10 -0500
Received: by mail-pj1-x1030.google.com with SMTP id my11so6260885pjb.1
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pSzypxyXmjakyx97eKf31F3sCLfmf6SnzsofLcuMSPE=;
 b=ngacGl1sDUq6QeSb+TxofrFKpYWeLd3+kgQdsCOfvLgVeNnTIgAyDNDxv0aWQZjCWR
 v1YUO+ZnHk+62IM264f6p46Uwz2zFNQ1ZsKcl5E55WqK+LXfGzpvkkmxx8k2bYJARkVZ
 nkZQN3E9I0NYpTahvspkOvA5bInP7yrDRees3rx2IvEwKcsj8Y3dqZ4nh9SJfXAZSpba
 qgizWpN0gJnQ4fYXigPOdFm2cukRYJpBA5Ds0Lr+AQX6WK6yWzBPTwD48aIKuAIIJSyv
 WniICeHSLt5BQPQBP0R1O8rORN4Z49wHF4lI4pXUQrflrAO8/6DYyWMWSdwwUqQLOIgo
 SJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pSzypxyXmjakyx97eKf31F3sCLfmf6SnzsofLcuMSPE=;
 b=Jt4I4bIDuoZHN+mWUXSmkp2fdtLxXFNmmypoJ1+FJgK+XC44Ce1bmkaVPJmXaQWkS5
 OLUI3RQQTLN5D4NNFg2s9tBtWUpNGXDbYSeTt1RShK7PIBO/kI28gTCRGG2Y/n4vhfgW
 ofsor7zrIvNpmHaPWCmPSl7sHziDV4dPzr+fMCx3EXzs7JKfBa72tzNR3FOhby7ZcuGU
 rQzZf5vScs7nKjDJll4Ydc/6/3Tm+YE/LKt1VJ6522nshRFbeQebZFVYw4ZiTjtCcIwB
 XiTJ2zfHhp3Y/pwddGDojwEUTrkJF2VkA6yhNVffPjL/eUWi0FbsavWRKN1BneLzFUQP
 ZNdw==
X-Gm-Message-State: AOAM5324JAE0Gj5rCMUGavxxM3I4F1uCKmDk0XqsSQKMaBloANZZu4jC
 N8GzLbrIcHVKvI390GbPMUiIuQ3JsnyzsQ==
X-Google-Smtp-Source: ABdhPJx+NWGCkNly80ZpnTKaql3xXfkaww9C/OMJ5jeO4TnVL11Q8vGpby2YCWqyzypseIBitaLMRA==
X-Received: by 2002:a17:902:ea09:b029:e3:a720:b83 with SMTP id
 s9-20020a170902ea09b02900e3a7200b83mr20568381plg.51.1613975347693; 
 Sun, 21 Feb 2021 22:29:07 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id u15sm8140946pfk.128.2021.02.21.22.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:29:07 -0800 (PST)
Subject: Re: [RFC v1 08/38] target/arm/tcg: split softmmu parts of
 v8_cp_reginfo and el2_cp_reginfo
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-9-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b02f9576-41d5-8d6d-df48-59a17530c83d@linaro.org>
Date: Sun, 21 Feb 2021 22:29:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-9-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
> 
> since ats_write64 is only used there, make it softmmu-only.
> 
> gt_cntvoff_write, gt_hyp_*_write and gt_hyp_timer_reset are only used
> in el2_cp_reginfo, so they can be softmmu-only too.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>  target/arm/tcg/helper-tcg.h     |  16 ++--
>  target/arm/tcg/helper.c         | 129 +++-------------------------
>  target/arm/tcg/softmmu/helper.c | 145 +++++++++++++++++++++++++++++---
>  3 files changed, 149 insertions(+), 141 deletions(-)

Hum.  As long as we're moving code around, let's put all the cp_regs stuff in
its own file, rather than creating another massive file with random stuff in it.


r~

