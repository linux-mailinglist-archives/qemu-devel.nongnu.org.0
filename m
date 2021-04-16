Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0B036278E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:14:59 +0200 (CEST)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSza-0001Qb-Tj
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXSFO-0006xl-Is
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:27:14 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXSFM-000279-On
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:27:14 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i190so18776132pfc.12
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TINj31AaZ3ru4S2L8k1HcfiDczgVWPxvOReG4kcymDA=;
 b=a4Rssjvy5gsHQawnF4jVOHQHPUXiwEdkwZra0rAJIiPtUUBI1TyHI1ufzFiwcxmuNk
 bMBnQFxBYyzf3+4Joam+HTXHMy99UFnOD8JjT7ur3TeRVs38FnAKjzm+ps5speKnUoc2
 xGzA6pBFuYrtaIUMSOrfh+PmSNs4tmd0Yo801zB8oeqD6KS+C65Fc1mQhs2BUFtuTxdh
 2JhtdEIKqjq2ESWL3GSD2R0Z4IzIyc6XRCQms+9B18c61BfMosbA3L2XFQ/2FSmbCMvY
 4x+LL6sxY048/Sa5eJE7M53f/bamC2eaX02fjEyucrtZAdnH7qKqkLyuzq0Jd9sKFHy6
 xAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TINj31AaZ3ru4S2L8k1HcfiDczgVWPxvOReG4kcymDA=;
 b=uh+YQXs4sn7U0mNLQuSh5XOvh5PQmswfd/ktcL17sPK2OuG2kA6v3y4A8Z1zA37CrC
 X1SRuRmmrEfo3YJ5ppClSKPGJrRijMyA9s0+28Plkyvuv43aTU6bH/tbGXhkRQnJOgjL
 wlGgFQnt30kXahyxJC+IQDeBohBaG/ZU3BsmFh6DoC+3tnYRrYqVvNFNgWvz//PNP8UM
 gOLErHcLy2qKyCD/gW18U8HVEnPKwNfvy2IEk2I2rxYMOs4/m7Yodk4vgkaCqqXafV0Z
 RS8e4XLyy3kUpRRkQbLBUQzR1yd3d+xT9tmr0wlhhSdaQyVSMtJhFgeRpPtJ057VQSXN
 JKIQ==
X-Gm-Message-State: AOAM531mEJXKVxeX3x+kJzMVLGlPzyah1mKE1CUQxP/DiOJPoQNorlVS
 0gQp6/tsgTEK2G5kd4ydC+wwQSNsME6A0w==
X-Google-Smtp-Source: ABdhPJwTLUkReW2ec10hRD9MBPFuVxHCBJqbO9uYKxZHMfTnrow9D0u6GaYoFkaRAH4iY+AxCBhu9w==
X-Received: by 2002:a62:e402:0:b029:259:baff:e8e5 with SMTP id
 r2-20020a62e4020000b0290259baffe8e5mr4551653pfh.81.1618594030320; 
 Fri, 16 Apr 2021 10:27:10 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j20sm5942640pjn.27.2021.04.16.10.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:27:09 -0700 (PDT)
Subject: Re: [PATCH v5] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1618538904-93433-1-git-send-email-robert.hu@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd594565-49ce-12cb-0e7e-29e9d4611d6e@linaro.org>
Date: Fri, 16 Apr 2021 10:27:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618538904-93433-1-git-send-email-robert.hu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 7:08 PM, Robert Hoo wrote:
> Since commit fa4518741e (target-i386: Rename struct XMMReg to ZMMReg),
> CPUX86State.xmm_regs[] has already been extended to 512bit to support
> AVX512.
> Also, other qemu level supports for AVX512 registers are there for
> years.
> But in x86_cpu_dump_state(), still only dump XMM registers no matter
> YMM/ZMM is enabled.
> This patch is to complement this, let it dump XMM/YMM/ZMM accordingly.
> 
> Signed-off-by: Robert Hoo<robert.hu@linux.intel.com>
> ---
> Changelog:
> v5: fix a minor issue. rebase to latest master.
> v4: stringent AVX512 case and AVX case judgement criteria
> v3: fix some coding style issue.
> v2: dump XMM/YMM/ZMM according to XSAVE state-components enablement.
>   target/i386/cpu-dump.c | 62 ++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 47 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

