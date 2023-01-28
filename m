Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC64767FBDB
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 00:44:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLuro-000671-7N; Sat, 28 Jan 2023 18:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLurm-00066h-Cw
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:44:14 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLurk-0005lA-3q
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 18:44:14 -0500
Received: by mail-pl1-x635.google.com with SMTP id be8so8308213plb.7
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 15:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a2zip9Pq/dbYgsxlZ0SJ+8SRbv75IQZcpblwVdopINg=;
 b=sj4+uVvylOFE0k/JIcZ3CkDeg7E2h6n3M+24zTJUS8cSjT67sFkts1Uii36dhUgddy
 Det6/g62sZ9FrNsvzdM8IGg1sUkd1KFfHM7rHcqCZw6oMCFwE/GCvl9ORrttx/hd4mpF
 UNjaTCmoZ3MSC+WpoN+geCIfk5O25DZ+hkSfgItDvBN4gqzBRn8BNLMWpt0QX5wT2k7y
 +fEY+A3JxovjBlGiIH55S/xF12cn9C7z+SkoDK0YwypbiDnGaQScyTYvHMpdM85bo2pz
 Tqcpfmb+4nKznD7usOHx1I0GDfkzmY4Rrzz7CpdanX2Bxg0hpedCVCcs7379EdRoXrkr
 zZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a2zip9Pq/dbYgsxlZ0SJ+8SRbv75IQZcpblwVdopINg=;
 b=r7h8LbRX1UZuO9mcEQkNUb9a/M0jxB28IcVQUnQT1i1ycnQ2UaFExsIU+s+sYmo5oP
 X2fzsowQD69mNR9gt6mrY6rwtX8DN8t5473Vv1KvX6evVI5NDUDJnJ1rJj/W21KIYNdq
 esMWLMmkLgk+wLwZ3jotEtmEX9dz4uDeGcb6KU9Xwpfrk6WKLlZvwF9mWsOKp33wfwbJ
 /r442MX9hKnbPiggFIfeBGQPEvSdGxuVkJ8YydHOf630DCfTKp/ArMjIT8AQxsl/KE5r
 UemT4M9AqpWdxlblDzHIPygO/S+L20uV4lBk+EqkY21xAu2IwsysWNKO6nPKCoq79BgL
 tK9g==
X-Gm-Message-State: AO0yUKUP5hcYMGIc7MxXwDb1itmq70ao0UqkZ02WvDwpjsmanqAqMzOC
 NukDAgLTUvgyr9wiEPm44LqiWg==
X-Google-Smtp-Source: AK7set8kg4vsI+1f8TTx4/PIcqAesgxp+dUlAXhlg2UdnRYrUyzIx2S5v6kVq2i85bhMxKUYg+H95Q==
X-Received: by 2002:a17:902:d2ce:b0:194:ce30:1a94 with SMTP id
 n14-20020a170902d2ce00b00194ce301a94mr3867617plc.1.1674949448633; 
 Sat, 28 Jan 2023 15:44:08 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 jk11-20020a170903330b00b00188c04258c9sm5037103plb.52.2023.01.28.15.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:44:07 -0800 (PST)
Message-ID: <2153c0f8-ab42-24f7-6d13-16c421bcedba@linaro.org>
Date: Sat, 28 Jan 2023 13:44:04 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 15/23] target/arm: Mark up sysregs for HDFGRTR bits 12..63
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-16-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/27/23 07:54, Peter Maydell wrote:
> Mark up the sysreg definitions for the registers trapped
> by HDFGRTR/HDFGWTR bits 12..x.
> 
> Bits 12..22 and bit 58 are for PMU registers.
> 
> The remaining bits in HDFGRTR/HDFGWTR are for traps on
> registers that are part of features we don't implement:
> 
> Bits 23..32 and 63 : FEAT_SPE
> Bits 33..48 : FEAT_ETE
> Bits 50..56 : FEAT_TRBE
> Bits 59..61 : FEAT_BRBE
> Bit 62 : FEAT_SPEv1p2.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 12 ++++++++++++
>   target/arm/helper.c | 37 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 49 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

