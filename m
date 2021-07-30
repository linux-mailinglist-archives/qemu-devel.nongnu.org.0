Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB43DBEFD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 21:30:28 +0200 (CEST)
Received: from localhost ([::1]:38186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9YDD-0005wX-P6
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 15:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YBm-00053e-L3
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:28:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:51122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9YBi-0000it-MS
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 15:28:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id l19so16767877pjz.0
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 12:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=15ZmjW3RIu0cYHVoR2rnYY8mTpc4w9b3YJm5u5HP3gI=;
 b=rBSpuccPe629rICfm+GrPMYZG9mTwIikeRW5mg4dS7ZxBYwnJmYAlf+SA2G5o+X2nL
 rnVk5ev3YZllfNxzRLJ9qXEfFr1ksbu6N2z1Fzk6XaQSVwarm9WfGXPvVCEN7fclqLAu
 kVxoz+kB19I/wBKFvm2/yrZHYHUcoxRtX6QvAUJxhJSmVkQInzycxlFE0H0i5BmKc6hd
 OC1Jd6Lk4w0UxEjOZotJzCMNUxiE/Qk7vUiF63Ty7MLkfkXKDN07pRSojAlfWK4WnrU7
 DRw7hUyc8NpVFX98RfanpxmmA7ccF/Y15MUgVC1jlSdQ17gVTtgnqj+UxUhta5lVbNsQ
 fXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=15ZmjW3RIu0cYHVoR2rnYY8mTpc4w9b3YJm5u5HP3gI=;
 b=P7CQSE1jWtt9JthEAtXvPrJHBTlsZNFHhLtAP4ClsqTpQ0eR6x6cLs7LfpEJkPN6fU
 AMYFIKsjANGdewzoeQqNgCn/zb8Pw4cV7s2ufJLGzyIkp3h89t9dAhGUI5OIC9WCCwvu
 Qg1ns0vSef0bBmN9rCG/0wO0SZ7Jeodnu3nQA+QcXyTTBsNEIIRVGFozSx5cqt91fC/c
 /34KfUC6G3CaPsf4gnOd62FuRQ9ovvbQ0FycmauuTeNYuFKzDBeOgfp1bwMnbeNM0Efn
 KVEYoFTiRu1AKZoKMw+vpzdLG24m+vNmvxwscvhqiHCMu4wwMCb7OYRuXzCfAQPnpe/L
 ZBug==
X-Gm-Message-State: AOAM533YiI+riZcTJhA7lXxP5+Xza2gGir2xlb+LoeRaK6S/V7U0gb/M
 9+ttse5e8gSFO9CSyPcUuSnXv4ojrW8wkA==
X-Google-Smtp-Source: ABdhPJyYWgokte2srKbQJNJM56xhaq2O49/GZWEfR4T0u3nug96hAOitRu72diywYW/AImr/cFGBDA==
X-Received: by 2002:a17:90a:19db:: with SMTP id
 27mr4780854pjj.216.1627673333257; 
 Fri, 30 Jul 2021 12:28:53 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id j5sm144393pjv.56.2021.07.30.12.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 12:28:52 -0700 (PDT)
Subject: Re: [PATCH for-6.2 37/53] target/arm: Implement MVE VSUB, VMUL, VABD, 
 VMAXNM, VMINNM
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-38-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b9e96ae0-5791-686f-687b-390470e72b46@linaro.org>
Date: Fri, 30 Jul 2021 09:28:50 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-38-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> Implement more simple 2-operand floating point MVE insns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 15 +++++++++++++++
>   target/arm/mve.decode      |  6 ++++++
>   target/arm/mve_helper.c    | 24 ++++++++++++++++++++++++
>   target/arm/translate-mve.c |  5 +++++
>   4 files changed, 50 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

