Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF33D4FAAB8
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:23:07 +0200 (CEST)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHbu-0005Ql-Rz
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHaJ-0004ON-07
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:21:27 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:41808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHaH-0000oM-Db
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 16:21:26 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 e8-20020a17090a118800b001cb13402ea2so8393085pja.0
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=93gaETMj19berHSg8GO7GyNmTk7Dj4pHowuU39fBDW4=;
 b=mgMkD17TZbuTYG2Ec1cXeM+9dkGnS8ruqVyuYVvIZB3CCT50bBsrpRCvSAAIni8IJu
 h05LzKRNMQsprCVAVlKr5vk/m7jadtI7OwL+4X1va4weAWWaU7StQpku/zUTiikvRX4o
 dOacjAnsaSKNi/+A+22gM0eK5RugkGZlaQXmddNJsF/kj8r4wSL7H3NtsX3mmcyByZFG
 LHbulSMPRIMpQbVY6TB8GqhzaNcJtHPUvfN3x33bd9wlxjGTSWDvozHj4DLCxYB2z69w
 pBfJTvleI5iq0y7jK23hwLoO3yvTMjkj4UjwHLFZJF6SwmeKnt94UQPyqAshiPuuXa6j
 70JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=93gaETMj19berHSg8GO7GyNmTk7Dj4pHowuU39fBDW4=;
 b=WwL+HxHPaUx1g8jq2rLv/Sl0yyHDzkpTNfM360/lM+RRPE6O9kJD1qRdg9GySz0FMQ
 n2VJpmt9rJvSHdtn0LNzCPYmey2mv7NWKZVabQn39y3+fFLsrEhBI27HupBhnmB40Ok7
 3YpdV5W5qe8sluMwDhkSlkmCwj9WC/9HCupFyFWDvm4RoGieEbZFE1LDril4Auqdmsdl
 JTIq8W+hzWxd5k9Roa49kC71kVQq4AdPwquvrUOwGsCKVwylEgs8tc+v5zCMKXK0NSVj
 PQhJFAfj9PYRjJ31Z3i/ajc0PhwD6ol1ii6JvE0Wzvnk72fWK/no5IFxK0mWJD+5tRt8
 xepg==
X-Gm-Message-State: AOAM5316zK1sd3X6eQAo/RamEcGbFkj0uUKhxPJsqN2ErPtXdeDJWSv7
 U+gpRUL6vlaRiJ69zW9SXpRB9g==
X-Google-Smtp-Source: ABdhPJxOqRmJvDEj4CrcrjdUxathCk06zAUmjtbHiOhL5R6Et2Ns8RWx2PqjsmnHjEYbvGtno1AEtw==
X-Received: by 2002:a17:902:c94a:b0:156:ae43:4023 with SMTP id
 i10-20020a170902c94a00b00156ae434023mr24901517pla.115.1649535682019; 
 Sat, 09 Apr 2022 13:21:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v7-20020aa78507000000b0050596bcb1c5sm3353883pfn.218.2022.04.09.13.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 13:21:21 -0700 (PDT)
Message-ID: <a516b025-6532-b28d-0205-7b24c49c39ea@linaro.org>
Date: Sat, 9 Apr 2022 13:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 30/41] hw/intc/arm_gicv3_redist: Factor out "update bit in
 pending table" code
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-31-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-31-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> +    if (extract32(pend, irq % 8, 1) == level) {

Here you assume level in {0,1}...

> +    pend = deposit32(pend, irq % 8, 1, level ? 1 : 0);

... and here you force it into {0,1}.
Better to have the compiler do that with bool level.

You might consider

     uint8_t bit = 1 << (irq % 8);
     read();
     if (!(pend & bit) ^ level) {
        no change
     }
     pend ^= bit;
     write();

as a follow up; extract + deposit seems unnecessary.

Anyway, with the bool thing fixed,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

