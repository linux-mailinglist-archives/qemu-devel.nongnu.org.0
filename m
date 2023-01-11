Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5486266681D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:50:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlb0-00080T-4Q; Wed, 11 Jan 2023 19:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlay-0007zj-2Y
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:28 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaw-0001tx-Gq
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:27 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so21833719pjg.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DfBCClcu5zkUR8Pj5QpSFmTCUthF2j8bjC5jCaHmJ30=;
 b=IUSt8IAq53TEHhLODf1KPqrb0TAJp3HjwMUCvO3h3EhOEYbzEOCRQ9KePR2e/0Ha64
 g9mVFiGZ+UQJNhJbe5oDfwQou78thEIwJHhBa7HbuxrJx3zhKBngiUgHIiiAIbQrMDTi
 TqDNgO+y3VuiF3PdcCBG1mXIhiCWcjn1Z85umQYCx1fuHYC65vGXwl96gghPy5k8wNRF
 wb4aw629eUUTAgn83YnDSS8XgLc4Gk1XUsQ4pBMF9lhuy24IiPR70HMra4Kq8GPQYaDZ
 2scfuyvCJT6NuOSYYieiTz1lH8fpH96ZdkOgPOfhuY7e+7wt2wZXLy0SFgsHzsqcvzNh
 Y+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DfBCClcu5zkUR8Pj5QpSFmTCUthF2j8bjC5jCaHmJ30=;
 b=aSZ+je20nQv9Q/g8eDxAcWy3xV+PHjFtHLsVnAX70SvIwv7rR56Vq4EFYOTjkQs23E
 AIzv1hcfGEsJwq4c8j6eeJcX1twVS6AH34pUucMvr9S0SRh2g2zKF7xQTFxZn2WsKP6x
 jba9O/v2XfvlXI+3T8Hd65qqTjauYXJAICo/ZwsuiJOcPPbwVzFyvqigl45FgqpTLP8I
 a+qFVn6+6CQoTjVVLhOJdUK/Ug15maYqbDPZSDupBV+PguRnwZjYeawa4/aPRFOekk3i
 wcV9Ubq6oSxkZ8QFEb3PuQ+CEO4Jn+cMtLiLXokFee+5lYj8zdtPdmzCq9NxSW7y8/y9
 laug==
X-Gm-Message-State: AFqh2krPLFr04jdWVm1XfSxVfLko0rnckJ6DEyVskPExXaUI8Y92hcJY
 zN1g5wXIp989utO3flTebnNkC4ao/bsRAW12
X-Google-Smtp-Source: AMrXdXs//muQds1Y2CzgwNbMg834ZyZ5fziD6N3C5twVnXKGVfR3OzLDNkSUOJf6zowa9NWaWPgJWA==
X-Received: by 2002:a17:903:25d1:b0:192:50fe:5051 with SMTP id
 jc17-20020a17090325d100b0019250fe5051mr4392225plb.26.1673483845136; 
 Wed, 11 Jan 2023 16:37:25 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 j2-20020a170902da8200b00188ea79fae0sm10838783plx.48.2023.01.11.16.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:24 -0800 (PST)
Message-ID: <92d0b7a8-1f67-96e7-8252-c37bb2e139e5@linaro.org>
Date: Wed, 11 Jan 2023 10:14:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/3] accel/tcg: Add debuginfo support
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230111014705.2275040-1-iii@linux.ibm.com>
 <20230111014705.2275040-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230111014705.2275040-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/10/23 17:47, Ilya Leoshkevich wrote:
> ginfo.h
> @@ -0,0 +1,77 @@
> +/*
> + * Debug information support.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef ACCEL_TCG_DEBUGINFO_H
> +#define ACCEL_TCG_DEBUGINFO_H
> +
> +/*
> + * Debuginfo describing a certain address.
> + */
> +struct debuginfo_query {
> +    unsigned long long address;  /* Input: address. */
> +    int flags;                   /* Input: debuginfo subset. */
> +    const char *symbol;          /* Symbol that the address is part of. */
> +    unsigned long long offset;   /* Offset from the symbol. */
> +    const char *file;            /* Source file associated with the address. */
> +    int line;                    /* Line number in the source file. */
> +};

s/unsigned long long/uint64_t/g

Otherwise it looks reasonable.

r~

