Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A23DBF3C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:49:36 +0200 (CEST)
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YVi-0001OC-Tz
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YU3-0008Kx-G0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:47:51 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:44950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YU2-0004ze-16
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:47:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id q2so12306999plr.11
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Y1fVlefxzFWTPDME/a9xIKg0QQWtUb1i1gNesZX+mJ8=;
 b=CrZW72gm8eVN2Pibpl1CTyfxrdupFrjGu2OxdpP1EHwgUJp+67mfL5IuNyuNlluVsG
 H7AK4t45+d12nmLtM5yNNbskUywFaViwDaiwC0MTpNbir0mgoogevdDJKdY5rA00TJXr
 Lq7cHtp9LJnXGKuEHTB8Uy+7j1Zy7zFik48ZbLuOK1AkURtXAQqPJPKJ5u14w7sBZQx0
 UENorTkvlVHiJRBV9W0fYJQPTabt+Sr1ng6wSJrHc2ze4CnrJyMMLkmmtDbGU8JYTiy8
 7KsUybCrL1t13eaY6l2/pC3PYCdA2uMm4glQ8lVvkuNvD4gz4pXNf2S2DVvo4dHsehUP
 z6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y1fVlefxzFWTPDME/a9xIKg0QQWtUb1i1gNesZX+mJ8=;
 b=uPrIPbetvWk6ki7TXg87YNJ/AAoX87CevlexlsV8b0WST1F/yaDL0jzkm+Y/LYPgSn
 jkcjifE6JiTnHFSnjgbVTwMI/gb1u3sryoy/IPPQa7Klo4tBUeYiLVQDlA5RdbP7vF4m
 ifQq9Q/hkL1G1WXPZNdWAH/JYAS38odR6i5w8zWXtyUuFO3p7kZVZtthsXhwegff7Hul
 RdjZfIqf8XIlfEfRpBogHFRZ/F96NAGUTTcBUPoQmaufR960+B8PjivIJn/7KCh5yo14
 o5tb/aDPGV5BNLfafZ66+4wGY598bn5z1dBKTbZ3H4z+zezBoJAq9JQQHW6qx61wdFFr
 e6ew==
X-Gm-Message-State: AOAM532eEOPrIgud5rOsFBM0I2LAW6MRwfkdUaCuOh4+UN8xB3eR1kRK
 BdSKNZd0BM7AMesbACrdi31NMlPeIIVdBw==
X-Google-Smtp-Source: ABdhPJxqlj1faOXbXsVhDSai99gDJIBpe79ATLg+LeU0KjEUKzJpWxz9flG6QcCN6ikyAkbF2Bwlyg==
X-Received: by 2002:a05:6a00:1c6d:b029:338:322:137d with SMTP id
 s45-20020a056a001c6db02903380322137dmr4208616pfw.38.1627674468173; 
 Fri, 30 Jul 2021 12:47:48 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id n22sm3299812pfo.125.2021.07.30.12.47.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:47:47 -0700 (PDT)
Subject: Re: [PATCH for-6.2 40/53] target/arm: Implement MVE VCMUL and VCMLA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-41-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b598cb8c-2b68-ae6c-f634-ddcf3287a408@linaro.org>
Date: Fri, 30 Jul 2021 09:47:44 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-41-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 7/29/21 1:14 AM, Peter Maydell wrote:
> +#define DO_VCMULH(N, M, D, S) float16_mul(N, M, S)
> +#define DO_VCMULS(N, M, D, S) float32_mul(N, M, S)
> +
> +#define DO_VCMLAH(N, M, D, S) float16_muladd(N, M, D, 0, S)
> +#define DO_VCMLAS(N, M, D, S) float32_muladd(N, M, D, 0, S)
> +
> +DO_VCMLA(vcmul0h, 2, uint16_t, 0, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul0s, 4, uint32_t, 0, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul90h, 2, uint16_t, 1, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul90s, 4, uint32_t, 1, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul180h, 2, uint16_t, 2, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul180s, 4, uint32_t, 2, float32_chs, DO_VCMULS)
> +DO_VCMLA(vcmul270h, 2, uint16_t, 3, float16_chs, DO_VCMULH)
> +DO_VCMLA(vcmul270s, 4, uint32_t, 3, float32_chs, DO_VCMULS)

Here you don't need to pass in floatN_chs if you use floatN as TYPE.  The macros to merge 
mul and muladd are clever.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

