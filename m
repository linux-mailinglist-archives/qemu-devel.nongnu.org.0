Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521B44BF3D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 11:56:46 +0100 (CET)
Received: from localhost ([::1]:47088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklHZ-0005bn-JJ
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 05:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklGO-0004oq-J6
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:55:32 -0500
Received: from [2a00:1450:4864:20::330] (port=51120
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mklGL-0001d2-Gk
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 05:55:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id 133so1790278wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 02:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2UMa4jluuXeH4yf3YQQ0Rudc4gGGciLKcH8xIKoZ6Vc=;
 b=W9u2qqeKCDGcH6mevCrn0KgdFTuOU7TmdAEzzFkbz9GLOJw+m+Wh8F4Kr4euugmkHU
 yvcffZuoJN7z0mYiCV2XvNT4wOd22WPzy+GBBWXONi5ld7dSedjgGf5w4bFiBBYPcMq0
 FM7jpYybmHgpsRas7gwOoV3KD5jMGpt0WahdqkQuyP/K+ZAdx+h3kNAAB4hfZ12vN9XA
 72/k14V802DQRngTvloLXJ4cyPbrfA3a5kTGj+IZu8UT/mzoHV7G9ha8iNZkecwvPWEQ
 X7r+dBzP1l0yvWVcTy0J4NLtp2tUl7KM6LkWeOcMfzbVUBv8fE3dDWdXmIr5QhyZ+KWn
 BGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2UMa4jluuXeH4yf3YQQ0Rudc4gGGciLKcH8xIKoZ6Vc=;
 b=Dv6yWjxW2P5rEU557vNwJ17HBpC2/w67XqzdydLLekJZbmLRwGn0ATtoMyN36Y4Epy
 vldg33cPWiKUOdkpTqPBgPyx5OHbp3GNZwCJ0AQ6V+2Fu4NgUPs0e50vccG9AjfN2IIp
 mAY47cSE4Y+CgU8VOYvRfynKje59ek8pc0B8pwVujNr3In3pjRw3ncEV2QcCcvEWnWSz
 eEPLqN6Cx9jAe8H01NIV2qBfXx6zjxjLmT3A1l+bB61q02GoexUZAWi0EOQsbLf5gUGY
 YWaK4T2VfyTHLDFWGct1FxxCjhDulv5Zf8mKEspRr5YMbLKLl/EQVp4j14BESJOKsE0w
 tS8g==
X-Gm-Message-State: AOAM532zFDkpxW5QiWEKd9k2DUrMpj76T90M2sEYHehL3q8dWps/+nZO
 MIt5kw6fLA5Ljj3MYYNundGazA==
X-Google-Smtp-Source: ABdhPJy1NZFhxKJLlmDr2IlgnRJS4kxxytmsYuvUcvlC7KXCkI5GDFgsge4RRCeIEwJpnfVA6VYUqQ==
X-Received: by 2002:a05:600c:1c1a:: with SMTP id
 j26mr15457791wms.28.1636541728017; 
 Wed, 10 Nov 2021 02:55:28 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id u5sm23640111wrg.57.2021.11.10.02.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 02:55:27 -0800 (PST)
Subject: Re: [PATCH v2 07/14] target/riscv: Ajdust vector atomic check with
 XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-8-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e57db161-5a52-9170-e39e-17b8ad9335a3@linaro.org>
Date: Wed, 10 Nov 2021 11:55:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211110070452.48539-8-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 8:04 AM, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

