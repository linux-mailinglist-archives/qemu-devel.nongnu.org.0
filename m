Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4B39C385
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 00:28:34 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpIIr-0003tE-HX
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 18:28:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIHu-0002YR-Hk
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:27:34 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:43583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpIHt-0001Ly-09
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 18:27:34 -0400
Received: by mail-pf1-x433.google.com with SMTP id t28so8442794pfg.10
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 15:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7selQ+sKpOlsFc3S4SdzFtHuywRIusSg7hbeeXt3k0E=;
 b=jb4teQ+WyUhE1k1MZEhRsg2EiLycxd5y4SA0fFMe4W1WWOxgQPASMGZoOM0RxpusYR
 JWoerb2cm9SXEFq6m4N9LqBZuXTBOHQjOS3+GlFs0YyGMI1S47EZxql8SAOmwyeo4s8O
 NIloUbL3qJPYZ4TynOKXwM/p3gKpa54UxT1PB3Iux5gFsj0hn4YJK0Uqm77Aysq5koY6
 fn4XyORDyLYTBYsN437lGLfQBwPt/PD4goaSqJ/xDMtH2YD6jCSZAOvKCtVEe02zTGD6
 FeVnpVqVYeBwokv9inzeDS7MzydOlLTeJW8I79wrXalztB2bBy73kjuW5Z41ZFLAMNnX
 Mzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7selQ+sKpOlsFc3S4SdzFtHuywRIusSg7hbeeXt3k0E=;
 b=ou/P1so1nHQP2ymmTY4xxRspKO091XFuAY/PB72T1CFUIW/pHx9koWIUARGnFW5bBA
 GrNhelmEBWOMlWSpWxqpdz/ofkUwGXT+rM1o9nHueQxeyywqcwd5yRhb+pLDRURBJ2gG
 nx4MnCoyrIgHNRTB0HYJ52ubsYllat/ECMUSSPXZHVWk+2mwlcIwzft9XdoNejxeo84+
 /9BCIJi8jYJ07p8d5CTZgA/ywyJTX9AgK7rfBGO3vwCZcpEEAwmzhOaQFx1t2C5uMI1Q
 ApCj0LeY2zgZQdEMFYl6AR9ZpFAd7h8ue6JBS0xghLACRgLt8/vGYNUV1W91YMP/uDhz
 oKxw==
X-Gm-Message-State: AOAM532pcDJ1vmLq1b/jJjSV8mtTScKNkW5qG3tg2e9g5y+Ui1G5eHHl
 kvheecd8EO9u/LH0xOyz+MBNtg==
X-Google-Smtp-Source: ABdhPJwG9Dg5ORDlIh36z/Wv2WIH0cgvCeajDyLLLkEn4qMNljpBYj0UFlgJrfs911TnM94HxwCAtw==
X-Received: by 2002:a63:594f:: with SMTP id j15mr7152873pgm.244.1622845651569; 
 Fri, 04 Jun 2021 15:27:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w1sm2577325pfi.162.2021.06.04.15.27.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 15:27:31 -0700 (PDT)
Subject: Re: [PATCH v16 38/99] target/arm: move arm_sctlr away from tcg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-39-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f1e6052-15eb-d443-c75c-6cd4b37c7c8e@linaro.org>
Date: Fri, 4 Jun 2021 15:27:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-39-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> this function is used for kvm too, add it to the
> cpu-common module.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 11 +++++++++++
>   target/arm/tcg/helper.c | 11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

