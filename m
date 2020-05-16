Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3E21D5DE8
	for <lists+qemu-devel@lfdr.de>; Sat, 16 May 2020 04:28:18 +0200 (CEST)
Received: from localhost ([::1]:56484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZmYj-00015z-L6
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 22:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmXi-0000LN-UE
 for qemu-devel@nongnu.org; Fri, 15 May 2020 22:27:14 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:34456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jZmXh-0001vn-UE
 for qemu-devel@nongnu.org; Fri, 15 May 2020 22:27:14 -0400
Received: by mail-pj1-x1043.google.com with SMTP id l73so4596551pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 May 2020 19:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=i0wxapt62F29Zs5D6Qhh6j40Q+2QqSn1u2WaVdb83Is=;
 b=T/3tkiWXR7umx6voGo2ZNS6AOZywXBgIovYHCR04ZDMj2nzhDqUWU8eRBRZZW0Jvlr
 0bHtRmZmsckLgxRHRKU/ujBJ7f3jWq++pakN9tjapsVHTR35eFfkqnyOBCPze7NJQG/X
 2Sd+WN2cFkjScDKLQJaD9HUUCO6vo0HB/MSz4Am/nvXdQBu3hTqJNOEQdWYYd8bon9qm
 LK8eJKx5gf7VhRyiAXKaQ9Nsi5rYESG1cPRmU1z5xS/udtALvxklHnoiVRquWq+ynbN0
 3cyKXqhSllG65DqpLMLuMmzZFfjcf5/ZFoe0LukLfX/q+scMcdwzCCnwlogkBUjMeh5M
 TRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i0wxapt62F29Zs5D6Qhh6j40Q+2QqSn1u2WaVdb83Is=;
 b=RMpcU87byLG/UjwmQYAQ3GVz0baWOA+zD1DbZyL9/aM9jkzm9by5y6L5mfxg0ZKu6l
 q7e46qn5x8ejcT/uqw6HIU0IQWC+982MKEfuQFx/pn1uVDFpfc06I5PDhmkauzw39yoY
 f0jLG81SPHR0pz7yaiMBmaYYcI0iDqLY6KkhWEaqVLKY5sCkezGXfgiytHc/rtNGXJuT
 JnykWARx5jzK8+47eFhFWwek+AMLN5SoC/KL5GtV56Mc94JBZz+gh+flkA1kox9YbAWf
 BQ1EFyOP5wmG9yS8DvnLlbYDvNgETRhyIP1nFpWcyR0y/1ivcuFszqDuQPn5M4y9iG+H
 fp8A==
X-Gm-Message-State: AOAM533EzckSoB2xmmBcEhrlvcHovIBQu8JX50cLr7/ADe8gbdFViQ/R
 Vv0K5uIGm+wQoLCZuDrAPHQtKp2S+5g=
X-Google-Smtp-Source: ABdhPJxqbNf5PjmFjd+JgwalJAXq2E2H2picnQq93H2ycNu83+1MQc/UTRpj06A9qXX8DHKbrgCz2w==
X-Received: by 2002:a17:90a:28e5:: with SMTP id
 f92mr6481720pjd.38.1589596032028; 
 Fri, 15 May 2020 19:27:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id w14sm2709886pgi.12.2020.05.15.19.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2020 19:27:11 -0700 (PDT)
Subject: Re: [PATCH 09/10] target/arm: Convert VCVT fixed-point ops to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200515142056.21346-1-peter.maydell@linaro.org>
 <20200515142056.21346-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5dac0943-1063-9333-2a67-a3645df1bdff@linaro.org>
Date: Fri, 15 May 2020 19:27:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200515142056.21346-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/15/20 7:20 AM, Peter Maydell wrote:
> +# VCVT fixed<->float conversions
> +# TODO: FP16 fixed<->float conversions are opc==0b1100 and 0b1101
> +# We use size=0 for fp32 and size=1 for fp16 to match the 3-same encodings.
> +VCVT_SF_2sh      1111 001 0 1 . 1 shift:5   .... 1110 0 . . 1 .... \
> +                 @2reg_shift size=0

Maybe use %neon_rshift_i5 so you can drop

> +    /*
> +     * The decode doesn't include the must-be-1 top bit of imm6 in a->shift,
> +     * hence this 32-shift where the ARM ARM has 64-imm6.
> +     */
> +    shiftv = tcg_const_i32(32 - a->shift);

this.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

