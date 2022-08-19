Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB1599236
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 03:04:43 +0200 (CEST)
Received: from localhost ([::1]:55044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOqRG-00046y-4C
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 21:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOqP0-0002Uh-F7
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:02:23 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOqOy-0000RT-Nl
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 21:02:22 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 t11-20020a17090a510b00b001fac77e9d1fso3505879pjh.5
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=ixOlEfyLqLz2KFQBHX2QQgJ+7A904g301hEJwW5ZFHk=;
 b=A6MMHV50BvOrEY4IQlUe4ukrtZC33pcsumy+XLoc0g63dYaSQJ+WsmZxdw5cvf9Z6H
 BXH/te4TAjF1qQ1VC1QrUrLDD+cU/SDhQBt+MgW5spt7WGfA/89REwRWC2KTOuB1gFOv
 vU5jSNuGpQFHIVJoL1kYRi6+8vX2VvgZr+oGAq3x5KExERUd/1mqrsV+bvrFmDy8eUH+
 fw4UjLpb/K7MFoGq6t/mj5rPjtOZDON91zYS6kfV0HYpMPNu6L+BVbC1/wm/bSJ+PzQg
 kUPiI759C0pMSXVrFjcDN5ZiKjr40N2IYW1313wmxAROxrF7HYYn1TF3E1HV/MUgqSWj
 IEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ixOlEfyLqLz2KFQBHX2QQgJ+7A904g301hEJwW5ZFHk=;
 b=OZOSaB/gJfEO8gdiJjaD9liCFBAnnLmlxo8zH5ZH6jvIw7i8E/pbSuuVZHV2fj9F4D
 fAk3iGtGmV3b1blFwtkiDoe93qfYNIFKf69QNEBmIDstiwo0p/fiHRpOwWHHo40RYF+N
 LlhSlCoXRE6S63Xv0BdCAh905Xjb/bVzyMkuMJm3QDu3Q6MvxXOmzsgCg8aKK1xwkA3s
 BqPNibF4bJqNcXc/w9PwQuZCW5HCgL1fLLlDe7rL6auEfkfR4bLNt4+8kR/wWRUxr/GW
 v44G7x04Hzt/GhKsbe2vbNKcDvm23UKiWnye88Cetj1evt85hJrHIF/0m4DL+VIVnM3R
 j/Qw==
X-Gm-Message-State: ACgBeo25nAZli/MRwWv3nD6kbHF/6SX7kVCCo5/+rPIhXoOrqIm3qOL+
 V0VFx60dsJSpndDUqCG6tBK01A==
X-Google-Smtp-Source: AA6agR6iRcdvU8DZWcfA+PLDnvzxSPcKDjWvxi/FOfUOb1JEziSykj0j7QQ73Z191IStKnFIfsHFFg==
X-Received: by 2002:a17:90b:380b:b0:1fa:b6a7:87d7 with SMTP id
 mq11-20020a17090b380b00b001fab6a787d7mr10230769pjb.111.1660870938984; 
 Thu, 18 Aug 2022 18:02:18 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e?
 ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902654b00b0016f035dcd75sm1972906pln.193.2022.08.18.18.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 18:02:18 -0700 (PDT)
Message-ID: <3402017d-7088-6902-61b8-4e61cea6db58@linaro.org>
Date: Thu, 18 Aug 2022 18:02:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 1/3] linux-user: un-parent OBJECT(cpu) when closing thread
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
 <20220816122621.2066292-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220816122621.2066292-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/16/22 05:26, Alex Bennée wrote:
> While forcing the CPU to unrealize by hand does trigger the clean-up
> code we never fully free resources because refcount never reaches
> zero. This is because QOM automatically added objects without an
> explicit parent to /unattached/, incrementing the refcount.
> 
> Instead of manually triggering unrealization just unparent the object
> and let the device machinery deal with that for us.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/866
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Message-Id: <20220811151413.3350684-2-alex.bennee@linaro.org>
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index f409121202..bfdd60136b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8594,7 +8594,13 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
>           if (CPU_NEXT(first_cpu)) {
>               TaskState *ts = cpu->opaque;
>   
> -            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);
> +            if (ts->child_tidptr) {
> +                put_user_u32(0, ts->child_tidptr);
> +                do_sys_futex(g2h(cpu, ts->child_tidptr),
> +                             FUTEX_WAKE, INT_MAX, NULL, NULL, 0);
> +            }
> +
> +            object_unparent(OBJECT(cpu));

This has caused a regression in arm/aarch64.

We hard-code ARMCPRegInfo pointers into TranslationBlocks, for calling into 
helper_{get,set}cp_reg{,64}.  So we have a race condition between whichever cpu thread 
translates the code first (encoding the pointer), and that cpu thread exiting, so that the 
next execution of the TB references a freed data structure.

We shouldn't have N copies of these pointers in the first place.  This seems like 
something that ought to be placed on the ARMCPUClass, so that it could be shared by each cpu.

But that's going to be a complex fix, so I'm reverting this for rc4.


r~

