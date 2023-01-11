Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC16667E7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 01:38:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFlam-0007ts-1b; Wed, 11 Jan 2023 19:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlak-0007s4-Jc
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:14 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pFlaj-0001jJ-6F
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 19:37:14 -0500
Received: by mail-pj1-x102e.google.com with SMTP id v23so17523527pju.3
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P8D66QBPX4fZgqOG7/VW8Yb8evSDFfLLLM0zaFKClFo=;
 b=rSbLegtANOTR2ZB/+rlm7Y1xRLvZck9Hp0mxHk+iVC2f13fHVCvsLap21DtLjzknyk
 yH4SUzmJZmbdxPov4EmpBBnCMmT3pO63eP+cBiSJp3N6eKY/j6Em8c7y/68TPLtuu5C9
 38A5SG9dqZcvcGvNP13BhDHjezlJmfMsf2mF9a+GRKTpe1QiHX2b+g59HMr2HklWiFwA
 ug8uCUL9qhtxmi9rnyu0i5h5dZeHoXrCJOhpcy0EAZ7B0b57X2xERVol3ti8wPANklP/
 GikqN8840KRYpc/1CDDkc345o4NPX3TyurteWVEyw7frDTbTWa8OEROHg8cc05tqqyeM
 PsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P8D66QBPX4fZgqOG7/VW8Yb8evSDFfLLLM0zaFKClFo=;
 b=KhBH0ZMmCaxgrbcGwaoBfT1demMOPTostqDYjpQteWvXNbj1K4vS1FvHC56lSZ0gI/
 p8+TADHEyVIh2KABGy0YoCw+B9WIi8tJAZg8GDfTjnw82bokngMi6s4qfz9myc794hKr
 WYQBQRhsi4m14QYW2vNicKzyWdUic6OUJnd3eM7a8Yw6M7O/riE4hegpuY26CMxETUEe
 K+Qu2q2/YdG02p5b9GehTLQC+AUPwc0G/TwfvFUboe6qAQNufuhElwDfHj3Ha/kWFwYU
 ltRgJjp1E7QTqlQsCtX6XwDpQOaITniIof3+QG9inpizLsNoHrjQSgtGHrta09gg/5yu
 0QSg==
X-Gm-Message-State: AFqh2kpKkcH54x7gh35KSHcgPI2hjLj7/0QejXY5cKcN7c+jpnzivOWF
 zOKRgwQzFJ5j+j6xkP54nLhWQA==
X-Google-Smtp-Source: AMrXdXs6ZKDxhmOUPG2eDHzcx776wA93Xks+2RCfGIWf6SLUuncO3Np/hAKVrKsvwKkf/hgns9zsrg==
X-Received: by 2002:a17:902:a402:b0:191:7d3:7fe4 with SMTP id
 p2-20020a170902a40200b0019107d37fe4mr66366586plq.59.1673483832345; 
 Wed, 11 Jan 2023 16:37:12 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0019327a6b740sm7994562ple.308.2023.01.11.16.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 16:37:11 -0800 (PST)
Message-ID: <b316e3fd-69b1-4be4-a748-53116fa52576@linaro.org>
Date: Wed, 11 Jan 2023 09:58:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 04/18] hw/arm: Use full "target/arm/cpu.h" path to include
 target's "cpu.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230110164406.94366-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

On 1/10/23 08:43, Philippe Mathieu-Daudé wrote:
> First we want to introduce a new "cpu.h" header in the "hw/arm/"
> namespace;

Do we?  Is that really the best name (not having seen its contents).

> second we would like to get rid of '-I target/$ARCH/'
> in the CPPFLAGS.
> Use the full path to "cpu.h": "target/arm/cpu.h".

That seems a worthy goal for hw/ though.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

