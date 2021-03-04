Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A532DB54
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 21:49:05 +0100 (CET)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHuu8-0006eA-IV
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 15:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuit-00039I-O9
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:37:27 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHuir-0005w3-Bn
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 15:37:27 -0500
Received: by mail-pg1-x52b.google.com with SMTP id a4so19645520pgc.11
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=h67J1Queem3z2IKRbl7TJ6sYy6C8LgvyRuz8IUb7f8w=;
 b=K7bMFzyL/JxX7+oDp/Mt2uenxl/VeKUXhwt99PQFVDKfdHIe4fjImW1ec6GH8uYDr8
 e5cFHMkO05Pbs8+z9irWFIXmqsMoh+fi7ueNXaJ7rReqJELl30GBlfNjEiMrWRMiYZDD
 Fb4nfmRtRdbw/eQm512ZjQc/lJGbUzH+g/74d1iNOndaE8SXH5HMhRxoSDrTtcgqt6i9
 llBUL/VXeZ0oRQ4Yny7DFCXlt8DAw5ET9aWkVWv9UcYpFVKiL+QypqZCdK90oePaRA26
 eyiNN0PP+b2zlEILilpnN1WMnWIySwz6SM00n1ecUYI3IiTdsgZfRqwXeKQKuoshNmE2
 p9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h67J1Queem3z2IKRbl7TJ6sYy6C8LgvyRuz8IUb7f8w=;
 b=Pk/qf2njuXE9PBK6Apt/H9PSg5J5/4++Ujs2EiXRWr7XAsajmpoVfnfBMWwZAin3Mp
 dZJ0Cl7uQjJQAvhbzKKq/6i7V5Pjm1fNsiHSAjfq4ilhY2s1gNSMazSL79d8Qzuw3GuX
 xNts11XrIkyun5qzVJebRuVtKO40WO1Aqt8OtYx/enbt6iz+6O7ILH4WJ6YD4o+QxkPk
 r/Pv8SYnuggUCPov1xWKVYc0KD1EVlstzDd3aucKmvXRgLb9bEGoxdK8rZML0HNJpp4j
 JrWvHDrdVTAnQvaHTD35bWZjG2/ja8JWMGbJoj7X3yjkHpxZLtlSbIQPC3erm50P78JG
 IsRw==
X-Gm-Message-State: AOAM532iILQSuzDIZacWBnKkfRLnL+hmDGGd89CMwN7U/gK5vzqVbDEK
 9yvTS57wmtJXcldAhOOU7B8ljqHm3oDnWA==
X-Google-Smtp-Source: ABdhPJw97GsPjVl5svcqBbrtn7BdEYzfK054KxM8aLr7/PJcID329Jg+nc5bgj4Kodz063lcLpeuMA==
X-Received: by 2002:a65:46c9:: with SMTP id n9mr5030515pgr.116.1614890243622; 
 Thu, 04 Mar 2021 12:37:23 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id t17sm150164pjo.0.2021.03.04.12.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 12:37:23 -0800 (PST)
Subject: Re: [PATCH 34/44] hw/arm/armsse: Support variants with
 ARMSSE_CPU_PWRCTRL block
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-35-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <96aaeb0b-5360-623f-d5c0-1d8ea26a647a@linaro.org>
Date: Thu, 4 Mar 2021 12:37:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-35-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Support SSE variants like the SSE-300 with an ARMSSE_CPU_PWRCTRL register
> block. Because this block is per-CPU and does not clash with any of the
> SSE-200 devices, we handle it with a has_cpu_pwrctrl flag like the
> existing has_cachectrl, has_cpusectrl and has_cpuid, rather than
> trying to add per-CPU-device support to the devinfo array handling code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

