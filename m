Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F051C3499F0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 20:05:51 +0100 (CET)
Received: from localhost ([::1]:33838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPVIk-00022g-SL
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 15:05:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPVGs-00018P-R2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:03:56 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPVGr-0003CK-3s
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 15:03:54 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso2946940ott.13
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q1elWYz8lS96H22skDoDiaJEy9s2DrTcMR6hwSl2DaA=;
 b=aKwZZtLGamwAlKg70ucBhx1MyWoKBd/hLGmtzFj2P/tkn6KTpaMkh1HZu3KI5fu8Vm
 hLTIclRXHb5miaVmLrLhAcSLRCMedu956s/l2kS1ktwh26HWX9vdPDAhPcSyEm4qmf7a
 uL1v0AuJFGxQ8KIP/KxHDZzEvLnc65EQ0j/C0+7mzURPih84okuT0iij3e9As64fmXxY
 ICCpxgFsj7d5oQlWshyZok8kxwLa9SnM30TBr8aCpdEbi4q+nrD87HCboM0gxO4g4qjj
 LcBWy3fsmP7op8pauU+4KgzPLD/NrjY2m/GcMtewmtaOVWNl6zUJTHC7wa9zgURO97FY
 R8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q1elWYz8lS96H22skDoDiaJEy9s2DrTcMR6hwSl2DaA=;
 b=BTMWwgrWD4PslJf94RCdyxdB41LsZxrr4JGBtvuelgTu1rd7JlG8NYBtm4fBhLZVVh
 MYoLcCE2XE1MkSvO0Ff5WoGrtAwSC6TttJqyaF4McCMxyLRe/vx1pwA1nsgR3WETQBN+
 ptEvNvwBt61Gi+od7VDK18BkyqB2keNJqBtBPYmPZYVjgoTFmCGm4JDb+R6zwJMSudlN
 9uFOQ/77GGVVxYzs43APcjvc0mIHIxWUrABAPQxcYOywYu/auIIs+Wqn4NgrrEQYvMRg
 73sfL+SFeUgTbzK/YVDaSlqyoKaYQY8DN5DoJ6P2GT/n/Xzqf3IAcxNnbIWmOPu7TS1p
 C4eQ==
X-Gm-Message-State: AOAM533MjVQ80rH+0AaPr146y1fv6TitXN9z/YPIkd/1eOmVdYPZTp9q
 zWTnzWRYD72NFFPkVDRUDbG6mw==
X-Google-Smtp-Source: ABdhPJzeDfo8+ABwBNEio1HfuH7/ofDGXArEK2jmK5V4hM+rDkRv/6Ld0VaZvUMoUHS2ZVazSkeO1g==
X-Received: by 2002:a9d:6e11:: with SMTP id e17mr8778283otr.222.1616699031712; 
 Thu, 25 Mar 2021 12:03:51 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e12sm1469497otq.30.2021.03.25.12.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 12:03:51 -0700 (PDT)
Subject: Re: [RFC v11 47/55] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-40-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8b0629b-a0da-e85e-5729-3f29eeb247ef@linaro.org>
Date: Thu, 25 Mar 2021 13:03:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-40-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:46 AM, Claudio Fontana wrote:
> +#define is_a64(env) (false)
...
> +#define arm_el_is_aa64(env, el) (false)

Why a define and not have the ifdef inside the static inline?

This define is causing you to make other random changes to avoid unused 
variables, and I'm not keen.

If you're running into problems with --enable-debug not eliminating code 
blocks, leading to link errors, then I think that 
__attribute__((always_inline)) and a comment will be the best option.


> +
> +#endif /* TARGET_AARCH64 */
> +
> +/**
> + * arm_hcr_el2_eff(): Return the effective value of HCR_EL2.
> + * E.g. when in secure state, fields in HCR_EL2 are suppressed,
> + * "for all purposes other than a direct read or write access of HCR_EL2."
> + * Not included here is HCR_RW.
> + */
> +uint64_t arm_hcr_el2_eff(CPUARMState *env);

Is this diff being weird or did you really move this declaration, and if so, why?


r~

