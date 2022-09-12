Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7732E5B596A
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:39:58 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhnB-0006H9-Hk
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhMI-0000sQ-6b
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:12:13 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhMG-0007as-K5
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:12:09 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1279948d93dso22314421fac.10
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=NxgeQiSuWhavYeQu7Xcu9FdXk358o2lKn4UNBJk1j5U=;
 b=dKll2OgUaGIcDCbRulKH3eSoOUJ0ggXOQ7UU9gVnAa59r+LdYlnv6yGMRHygUiBWpv
 JyGPnkwR12IfXw82J94a/EbP2+LQA5343qkKN8cIURJCft3Fl7JLNiH7XqjVLQ7SRK1x
 pudNgC8W3gX3oaK/a6Z7LP16vQpV+BnSDVWqpuNamfUX+6aafYUelZrmldkvl8DXagYl
 wvYS/5JmIpgH1NvdQoQGLRyLdgD89cT5JOqm50q4DfDf4IW3Wl8qttPmKSOtxZt0KfRk
 Y2Z8nUzck0apPZWWgEt5vLcHeHTGOtomBYU/RgVErH8qLxBDMqXWmd+MRuqeqqVxkZCq
 hPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=NxgeQiSuWhavYeQu7Xcu9FdXk358o2lKn4UNBJk1j5U=;
 b=waZ+2Bz/je8qknBgYUlTqlI1zx2W4o49mJtrWOVVZIhhvxF90DzPn4l+KddC6MKwB5
 Qtgz9KLWGNNVTKFly9rGIbCXPpbYvSasGlvmWLHfhlAdQZMDax3Z3yl+jvxpyNu0Vhfn
 0+eTMv15EOd05fSejU3KZ4IcooTqOP4svgaPRgLnhxLFR2i74edkJISLieVBQsZPzbZv
 QhBH8q006+XCXhh/MnFdlIfYazPwk4flvlnWEbdFOeeMCRbd8a94P8wrvbybOSk2gT12
 nxBHYYKu66+Ry8JI2fMgoNnjgrtzZ+lrmrsHCeY030smh2P4foPLHbYXTNlno6NmlnOa
 jY4A==
X-Gm-Message-State: ACgBeo3CqrWeXxhVWJXN1cAS1PwnlWaSQCWbSU5N/Nvj9JEz6tWGLeDz
 pVk0wslnZtzYSiFrJGCEaaA9aJR7MSEfEP6o
X-Google-Smtp-Source: AA6agR5EG2WkLpUuJ5l+4EXssnIuGlGroaiCUSszKzNlMsTBQbdFUfQfjxz5he1pvecuy6zAuaO2uw==
X-Received: by 2002:a05:6808:3090:b0:34f:6426:8258 with SMTP id
 bl16-20020a056808309000b0034f64268258mr5372064oib.263.1662981124657; 
 Mon, 12 Sep 2022 04:12:04 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a056830001800b006372969fbdcsm4510490otp.26.2022.09.12.04.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:12:04 -0700 (PDT)
Message-ID: <28c13ac3-3fce-82e4-1bd0-e0ff231f8020@linaro.org>
Date: Mon, 12 Sep 2022 12:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 16/37] target/i386: support operand merging in binary
 scalar helpers
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-17-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-17-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> Compared to Paul's implementation, the new decoder will use a different approach
> to implement AVX's merging of dst with src1 on scalar operations.  Adjust the
> helpers to provide this functionality.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

