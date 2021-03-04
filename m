Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06C832DA92
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 20:50:46 +0100 (CET)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHtzh-0004cV-Ou
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 14:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHty7-0003pe-H2
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:49:07 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHty5-0002Bx-4i
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 14:49:07 -0500
Received: by mail-pg1-x531.google.com with SMTP id o10so19604665pgg.4
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 11:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Zi1PB3ue2D1l/bFagYQyHyEOo+RinjYI3uWBgOKVZps=;
 b=ZIgMLSoWG1B75dBsBWD9d0JGypd0l+72tBdPZ5IXxqfu9XcaVGehJ/5R0HMyWylqlN
 GecBQX2yF9yzi6Ww8f3H3eCW5knDdSGDxUq8zd+kO13YEpx6h1CQGITkJ8MkptIOj2SA
 JnPNYi6dOSDHleCOn3wVDqXMrETsMf9U14tFRMBkuPAb8IKrV1tTF5svXurJZSK8uchw
 HLzCkJlLKTsJWKmhJg3ZvL/CZj51mX81KDSksPi6WvCBS2Av7kWHi5UWnMf/1E8OCSTz
 Alj3UbkcWbfYIA4A3TznYMJ+fcI3+uIhl0QLQ6zJT3wfRrUuCpUuEDgWWxdLV90lNygC
 hzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Zi1PB3ue2D1l/bFagYQyHyEOo+RinjYI3uWBgOKVZps=;
 b=pWIabusEq7Nvq5uXMC6koARdw0dBU+MR1DDmvTi0rwnZVv39cAQ4Ju5XO2v1T6UOGD
 i4ZHv/q+x/rCWcL/tVGzbnANAMqBfl3pUP796+L1jiSqSxrUiuem/4etf8OjrGnx+BHU
 TyR+NPIVOdKCAG/5vf1dohAhQKimQ5OfAOE5hanl8nzeRTNiuTb9KFir49hczE4+OGrA
 Upbi8lrE8QMjUkGKuqdHkSX0FvO2kwbTZEccEjKP6svXdjfJdOlWqIUFhXGJemQfk+rj
 OSNDxJB5/u8xw0oj5u8JsM3XFBuz+M7IH/xxSq5E9w1QvMCg7BojIZILHK+A42ql4yAY
 /DDA==
X-Gm-Message-State: AOAM533B+FWsga/J5VWjFXCLuzYL9K47vKh0ga2LsOkm87x4glG6E4vx
 Etzt7zeNKvGNTQYb4b02hT7WLuQ6WPpAvQ==
X-Google-Smtp-Source: ABdhPJzhLASzga+8KnQ3DI2UymXIh9aMihw1mz+K96dO3Bg7yV3QTEN7GmyDigaX84e5qZNKJJ018w==
X-Received: by 2002:a05:6a00:2345:b029:1ee:481d:4179 with SMTP id
 j5-20020a056a002345b02901ee481d4179mr5326631pfj.42.1614887342985; 
 Thu, 04 Mar 2021 11:49:02 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id z29sm193551pfr.114.2021.03.04.11.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 11:49:02 -0800 (PST)
Subject: Re: [PATCH 16/44] hw/misc/iotkit-sysctl: Implement dummy version of
 SSE-300 PWRCTRL register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d46c632-6c37-0a2f-3807-116c435052c5@linaro.org>
Date: Thu, 4 Mar 2021 11:49:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The SSE-300 has a new PWRCTRL register at offset 0x1fc (previously
> reserved). This register controls accessibility of some registers
> in the Power Policy Units (PPUs). Since QEMU doesn't implement
> the PPUs, we don't need to implement any real behaviour for this
> register, so we just handle the UNLOCK bit which controls whether
> writes to the register itself are permitted and otherwise make it
> be reads-as-written.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

