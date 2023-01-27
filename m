Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1783567ED14
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 19:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLTCQ-0005U7-6S; Fri, 27 Jan 2023 13:11:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTCN-0005Tb-Kl
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:11:39 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLTCL-0002RT-PT
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 13:11:39 -0500
Received: by mail-pj1-x1034.google.com with SMTP id j5so5312879pjn.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I68x1is1QyUH7UsXWZV8kk3i6FVYF2+tqdFci3ItjZs=;
 b=cMvgc41xu9kK3GsLs6k+TN+bj6rLRCyRXeUV3kbHQGXo9VvAHSB+vMAd9grxFXMaAY
 2TyVxI+DutK9oFzJNOQCCyXg8D/u60n698MDC6z/8+rb3Ktrhpfx7nlhsUyF6k+rmZbi
 smHZfzhHx4FP4z8DgmKYDWogckge2Hp56tkfscab6kOV9pduO6/3rcKyddTzMotT4SxY
 Xgl756TEsOss0KmgLx+DS3aVr+aCUgKjR4UDxG6Ykw00B8KA/SUh9ydy2GcCH6BY6URH
 2Q5JWkcFLqj8GfMtObBzAY4WrYbyKvGGTZ97BZFbnQUDj8gfQTKrUQ529xcOy5tBv0Ng
 30rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I68x1is1QyUH7UsXWZV8kk3i6FVYF2+tqdFci3ItjZs=;
 b=qa8NIMkhNXvCnKAy5XzTU62mvX3SUil4R+goZAqRxlppjqQ6QERspB/bXodLHegaoe
 X5YF1iSMJsD5QAGQ+Cryhrp0f0awnYMIvwzaRBknNWlJOHQ9o6sJdqQKK4BPILhaVMhH
 5lVATRm2j5jFS9vTqS4l8DEelIUycBDoTJdSdOKc16TDVUGYQybDXrHeP8dla2s0SpAI
 bp5krHYy3SqlOIeHZX6rET10pPI6J5AN965xy5mdR7PSTpFBm4fKmOgXmV8v4X7D8bgg
 q8K6rDeRg3VzjVgxWD0l2zVGRF0MbUlID9HiakUKviG7GUOUxPxKcmLNDQeAMl2ayW6x
 P9Kg==
X-Gm-Message-State: AO0yUKW/kOp96iF9dWdDEDV474raiULGdfX0eN7baoPcWlWzQdcKw3rw
 3xtW8fxU+UYJHhjYf5tBH8wLnw==
X-Google-Smtp-Source: AK7set9nUHZz9quel75ZCDwzf9Hq2JJSybI4FJfnROMIvpXbM6GNHuJ0xcQJa3GvS6lFCdX3mvyONg==
X-Received: by 2002:a17:903:2093:b0:196:6298:4d67 with SMTP id
 d19-20020a170903209300b0019662984d67mr226276plc.4.1674843095870; 
 Fri, 27 Jan 2023 10:11:35 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a9-20020a170902ecc900b001949ae8c275sm3166198plh.141.2023.01.27.10.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 10:11:35 -0800 (PST)
Message-ID: <e7b0cf42-2a11-e39a-402a-2a0bf779b1e5@linaro.org>
Date: Fri, 27 Jan 2023 08:11:30 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] target/tricore: Fix OPC2_32_RCRW_IMASK translation
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: anton.kochkov@proton.me
References: <20230127120328.2520624-1-kbastian@mail.uni-paderborn.de>
 <20230127120328.2520624-2-kbastian@mail.uni-paderborn.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127120328.2520624-2-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 1/27/23 02:03, Bastian Koppelmann wrote:
> we were mixing up the "c" and "d" registers. We used "d" as a
> destination register und "c" as the source. According to the TriCore ISA
> manual 1.6 vol 2 it is the other way round.
> 
> Signed-off-by: Bastian Koppelmann<kbastian@mail.uni-paderborn.de>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/653
> ---
>   target/tricore/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

