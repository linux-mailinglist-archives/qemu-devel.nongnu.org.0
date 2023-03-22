Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BF26C4F1E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 16:13:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf09J-000512-Pd; Wed, 22 Mar 2023 11:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf09H-00050W-Ci
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:13:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pf09F-0004SO-5v
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 11:13:11 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so23913453pjt.2
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679497987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zcclF7SqqbPPsha7eyGhQDcCrUmtIaUQmO3Md6O8lvc=;
 b=GBp4bTVlyLFBwGCjMUrGF0K3BKRZ4jhqt8NcOCW4yhoGusIIPcaXVhK5dojA7kHYzy
 PVGnYp1u0vEPC5cjpoZQcYk8tsiJ5k6g2C4LveMq+gpFIJ+iLynunYHP/qTCL0uZ7LNT
 SPIWetkSSV0+IWNm0ovP6NVI4wNbE5/UgeYmSuJzYsjnJQzM0IchiOiCZxaNSVv8wL9d
 GjCc3YUdrV2J0SJJVYFHoJg6t9qnX15+5jOvTpBcB0GZGViBjmCv2NxgSNvl/zVcyEMl
 WVxKJyDU+s7L9vlozI33HtnLLaXLPue/TzrGKQaV1n1xtoIEJF9m8XSWsbahOtuxJ4GE
 tNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679497987;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zcclF7SqqbPPsha7eyGhQDcCrUmtIaUQmO3Md6O8lvc=;
 b=LEtK4WwMd4Vu40ihN/UNLHX/Fvc+Y9sZjlzaSHEfYCZCCXHlMbzVAd9xAKw2JKum4w
 a8U6TBmKLAOg3e1CHX0Gd4wMZkkI+GUnmM4NWb3aAjvaCNyugvqyATGv2hhTv4bzZ6Dn
 uiQXDoXLB/01j7FOrXGgIp+l5rismVlO0XTlRdpEtWIzb+Guo3dgmltRpZUs8kpVRjHi
 QNclW2CTdVjJrSIDYuIDNRhxJlweE8ziFWensKIDVO6f0q0M9o37DVolfzpD5tjcqVHp
 y4gVfYPuLJC1UACfMFA+Xe7Jm7BrxgKV84xb+jTDVL5+BadMruGBD0j7gH8mDHgNY4VO
 VAuQ==
X-Gm-Message-State: AO0yUKXeq1zDoe+bFHzlIy3Ye0Fw7/YjndZZYRE7fOD/msK65+7Umxv+
 CzNb4U+Dhl8bBwZuzW9Zujcd/Q==
X-Google-Smtp-Source: AK7set+1nQORbnWzppu3hcmLHmeBiPcWbJ4Lnbj6GDTUHSS95l7S8lEfIJVA5YnRi0ci2UdM4MlPWQ==
X-Received: by 2002:a17:902:e5cd:b0:19f:8bbf:9c56 with SMTP id
 u13-20020a170902e5cd00b0019f8bbf9c56mr3660423plf.3.1679497987508; 
 Wed, 22 Mar 2023 08:13:07 -0700 (PDT)
Received: from [192.168.7.190] (24-113-166-229.wavecable.com. [24.113.166.229])
 by smtp.gmail.com with ESMTPSA id
 bd8-20020a170902830800b0019cb6222698sm10661905plb.266.2023.03.22.08.13.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 08:13:07 -0700 (PDT)
Message-ID: <792569ef-327f-7038-7f21-1038b1295a7a@linaro.org>
Date: Wed, 22 Mar 2023 08:13:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0 2/2] target/arm/gdbstub: Only advertise M-profile
 features if TCG available
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas
 <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org
References: <20230322142902.69511-1-philmd@linaro.org>
 <20230322142902.69511-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230322142902.69511-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 3/22/23 07:29, Philippe Mathieu-Daudé wrote:
> Cortex-M profile is only emulable from TCG accelerator. Restrict
> the GDBstub features to its availability in order to avoid a link
> error when TCG is not enabled:
> 
>    Undefined symbols for architecture arm64:
>      "_arm_v7m_get_sp_ptr", referenced from:
>          _m_sysreg_get in target_arm_gdbstub.c.o
>      "_arm_v7m_mrs_control", referenced from:
>          _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
> 
> Fixes: 7d8b28b8b5 ("target/arm: Implement gdbstub m-profile systemreg and secext")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/arm/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

