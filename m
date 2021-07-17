Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C800F3CC660
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 22:47:29 +0200 (CEST)
Received: from localhost ([::1]:51620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4rDc-0001wR-MR
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 16:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rCg-0000xg-PJ
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:46:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:37679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4rCf-00078T-8f
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 16:46:30 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o3-20020a17090a6783b0290173ce472b8aso11477384pjj.2
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 13:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ts5KKB9S+JUJhRxBPmx0LpjkBZ16A2xn/7gldoNiXDw=;
 b=TtZAbmUdKBqXXPeMC46qUJmydyas+3ZafDER5EWEtylKVVPu/rP6S9I8f92wmOmVk1
 vKeEHjAV21aW4L06hbhk8ba/U05fqjS9QnbExzlvunkY4+E/D6ruz97PhvVRk36kfmBK
 BPWlosVLawF7VgKg4AIOFWxT7iWxnTNRcs1SW6oLhXmogJwLHr8OTCrqtORQZ8Vb9LbQ
 d55CE33JPkhVMyhRp0lJrqxrr60aEeNtHjAXIsP6YkG3wiJuvEhgi+41YjiV9HmSLkX8
 iZtVE+MlYOcPgyhV/BkylQiWBQ0zuWCrdRGg//+UUXveYKpPpm/ZDBPIfhA6vWa/Udf+
 ++eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ts5KKB9S+JUJhRxBPmx0LpjkBZ16A2xn/7gldoNiXDw=;
 b=KgEkmf29Tqyltb4vg2LBOtBD2S8UoA0Ifywblx3OP1ervUQrdBVMfOs3r1dT21+/UB
 jS3r41uMHd/+t72/pTmyMe0UbauE6ZO+WN/NqkYmVdlXjp2RVl8h7nAb1uYK6LZr/VCh
 DeAZMjA/byO7O41yWIZV7G60IgZEDBoO9c/Mr9yBQCl5nhl4rQ9m4f/9SV6kGwg+Il4r
 Tr03IjlWItKp35DK6gjHxC+WdJLwUXYnqw1jjw6MBFdwW3Qd2JhhRzu9A52T8t6uMZ8y
 PsRQcmvpjzwEKza87TNtJ18App1SD/VNlrvjklzAxYoVdh1clsnUPG76sCf2OdUsZftN
 vgxQ==
X-Gm-Message-State: AOAM530/fWuw0ineOz+rsxRTIkx0gyv7MPhkFfiO6Fa/Cw4mYNOEQAko
 COf43J3h3ZSvuKeiOGf/wJzHfePWQsfO/w==
X-Google-Smtp-Source: ABdhPJwjImBtFmqg4J+avKyrI28Yx/+O1D9A1eu0J+2hCUGAqCZnU6H+gOmAC/mLcHNrtyJmlj+XHg==
X-Received: by 2002:a17:90a:a390:: with SMTP id
 x16mr4505067pjp.148.1626554787788; 
 Sat, 17 Jul 2021 13:46:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id w14sm17159787pgo.75.2021.07.17.13.46.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 13:46:27 -0700 (PDT)
Subject: Re: [PATCH for-6.2 20/34] target/arm: Implement MVE integer min/max
 across vector
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-21-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b38a6e37-084b-57c1-dc91-867e9308629b@linaro.org>
Date: Sat, 17 Jul 2021 13:46:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 7/13/21 6:37 AM, Peter Maydell wrote:
> +/* Max and min of absolute values */
> +static int64_t do_maxa(int64_t n, int64_t m)
> +{
> +    if (n < 0) {
> +        n = -n;
> +    }
> +    if (m < 0) {
> +        m = -m;
> +    }
> +    return MAX(n, m);
> +}

This doesn't look quite right.  The n operand is extracted unsigned, and only the m 
operand is subjected to ABS.


r~

