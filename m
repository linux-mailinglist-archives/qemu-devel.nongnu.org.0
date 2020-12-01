Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7212CA337
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:56:22 +0100 (CET)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk5Cf-0003v0-AY
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:56:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5BC-0003J2-DS
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:54:50 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk5BB-0002IP-0b
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:54:50 -0500
Received: by mail-oi1-x243.google.com with SMTP id s18so1633761oih.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=c4qf6YNx3B4ijfivXjBLm+FC+az4f4LFiSJQvsvUe/M=;
 b=ZtCzWQXk420nqr4C04IXPCgMCYve3te9CnIIHHwt45qaXedygj6WopB9oLYZ6OPHYM
 rQX8xdDJHqL8GvaDiUM3yjrpxCciFpraitKWlZRwnGV/Ri3Hg2YbHUt8NFsDSxEgiXvK
 uWjrDYq8drtSq8LM7K9tA14p+rR3YO/SvGaGfCnYjep9wVooPezIa4DkjRuOjRL3HF49
 hYGDysIqHOvcVUDN61qOb60lWZPJVxruinidLsKBBGqN81EMZ1kdSeJSIPNN+cN+CXnR
 QsbrgUbfEOMt07fezsqSD6M12GzC0lDQadVIZ99FE6AaprtI/6Bs/pLtsXk8rbNGCsx3
 rq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c4qf6YNx3B4ijfivXjBLm+FC+az4f4LFiSJQvsvUe/M=;
 b=qMrj06mMq5pwv2Tz67Qvy2A91+GC7GhXcOjeQ0c9UhTnWBCnLMFnqRoBKF8Afx1vJ5
 B470lEAc2SOfLuGDpVCvDdTHIr9i5RN9lT44hJJMERGcab7c0JDrp61eYfdoqotbZDgZ
 wc5mQmCmr8hIRdyqeNcDCnVqdKiJROdbP/BUjH1WBA/hNWlinOfRP5ugcg+/inr+bl7N
 hER3xeaY5P6F5e/2E6XMxARzN3pZBTWfhVt2/FAlnlL9LBQWTXMV+9KYGAqz9mGp66hk
 cTr1/qcYHwDwd77cxnQL9IPkHpoPC2/pnY+1c/8sSGhxx27UOl8wwG2IKKcJ/iUwjsi0
 +eBw==
X-Gm-Message-State: AOAM531/6iBVVBKWvQvDwItCctxKlaNTfjq+FGGVYtBlr8HxDeUJIdvg
 Pu0Ko4DQYMCapi6EcUHcnBoc6GBLd/AVmMtd
X-Google-Smtp-Source: ABdhPJwcMc452wXIHd/QPrDQNVagzTHg03IIbnoEch7dJqEyzpF2/QFQ0ZU0DHe6qrZo8F6xhzjs8Q==
X-Received: by 2002:aca:b60a:: with SMTP id g10mr1565943oif.26.1606827286857; 
 Tue, 01 Dec 2020 04:54:46 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id 186sm367594oof.16.2020.12.01.04.54.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:54:45 -0800 (PST)
Subject: Re: [PATCH v2 07/28] target/arm: Refactor M-profile VMSR/VMRS handling
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ffa10643-4d96-f2fc-8c0b-6bbdd55aeecb@linaro.org>
Date: Tue, 1 Dec 2020 06:54:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/19/20 3:55 PM, Peter Maydell wrote:
> +/*
> + * Emit code to store the sysreg to its final destination; frees the
> + * TCG temp 'value' it is passed.
> + */
> +typedef void fp_sysreg_storefn(DisasContext *s, void *opaque, TCGv_i32 value);
> +/*
> + * Emit code to load the value to be copied to the sysreg; returns
> + * a new TCG temporary
> + */
> +typedef TCGv_i32 fp_sysreg_loadfn(DisasContext *s, void *opaque);
> +
> +/* Common decode/access checks for fp sysreg read/write */
> +typedef enum fp_sysreg_check_result {
> +    fp_sysreg_check_failed, /* caller should return false */
> +    fp_sysreg_check_done, /* caller should return true */
> +    fp_sysreg_check_continue, /* caller should continue generating code */
> +} fp_sysreg_check_result;

CamelCase?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

