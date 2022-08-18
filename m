Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE1598B55
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 20:39:36 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOkQY-0007Kd-D1
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 14:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOkKc-0004aK-J6
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:33:27 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOkK9-0004rx-7v
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 14:33:18 -0400
Received: by mail-pj1-x102c.google.com with SMTP id f21so2515652pjt.2
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 11:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Y2QXZGrOB18ZqqLG550YQ1cPCpWPt9PDM9vKo819liY=;
 b=tFJrYrroM+s9Mu4YS6Jmj1GoS9DnZgqgDwPTfOBPAaF6+Rq2Mc89YUeslkJvW78ce9
 n0j+R+IWbP0hH/Iv1Qt2PShpu3xlmzoKt7Vo2bqfXRItGymuUtvEcEWLkGLagrLvMff8
 mJeiajUWsKr3h3oH/6QgvFBwZilnkA9RBL7qZYMiKcgCD9pHF9dLvtLQggkSYRoTeU3X
 /1BfoNJ5bQhzv2Bb8bOQL/pQLs8BNERuni66q9/4dhOUeZmLV+DgnJBz4SA4zyGV8kqe
 /to+agdl3QYXCXGoY8i8LRsNRv9eapY26C0Fj46IqdEyMYQjPE9Sk48GpsAVsNZHJIJE
 DmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Y2QXZGrOB18ZqqLG550YQ1cPCpWPt9PDM9vKo819liY=;
 b=rR2iu1qJHO4WHV+fl2aJGFk/cdN/XYypirLsN87DQvtkcVeu4KSM5ZIGYnaGV3oUGa
 0nmfqAv+k5iqLuIBbWk7MZvZy/P3b7+/l/s8A02JXkpttvplKk07kvyKHyoAkRjze061
 j7MOlG6xLrAiTKN0D8LeQjbHZu2DGxGgl/8NWXKjgGiuD6bc1eY7dWptmKk5uLUBUSX+
 vc59zoSb5w9Ao37k1GA1Rt3F9A5w4e41DWMsxevvhFtJhU78Sr3i/RtEYfgPTZbl3qn6
 o+gyrhc38cpy22r0fEeuonvTuSMppJDV6auPam1/4pmcze0hD6iI3hjMI/jIvdN8QSJM
 ydyw==
X-Gm-Message-State: ACgBeo1JoDPD8i6sul4JV2EGGSg4uvVQJxRbhH9zGk5etogeOQLU5YVC
 Rlg8NYa7bGv6j0osZcMLX5kXrg==
X-Google-Smtp-Source: AA6agR7vhf8hgWi4suXhBRP45jxpscxsWx5OufUfKIawExghQavD+E3/UVYoYOdVAZl8fDzgHV4vYA==
X-Received: by 2002:a17:902:cecc:b0:170:9353:f295 with SMTP id
 d12-20020a170902cecc00b001709353f295mr3534493plg.63.1660847575404; 
 Thu, 18 Aug 2022 11:32:55 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e?
 ([2602:47:d49d:ec01:bbf3:9914:aa9c:3b4e])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a17090a5d9500b001f3162e4e55sm1789615pji.35.2022.08.18.11.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 11:32:54 -0700 (PDT)
Message-ID: <afa9b1cc-f66b-b706-17ec-d206ec950d54@linaro.org>
Date: Thu, 18 Aug 2022 11:32:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 0/4] linux-user: Fix siginfo_t contents when jumping to
 non-readable pages
Content-Language: en-US
To: Vivian Wang <dramforever@live.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Laurent Vivier <laurent@vivier.eu>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
References: <20220817150506.592862-1-iii@linux.ibm.com>
 <TYYP286MB1439C85770DC0C4AA39550BAC66D9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <TYYP286MB1439C85770DC0C4AA39550BAC66D9@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

On 8/18/22 09:55, Vivian Wang wrote:
> On 8/17/22 23:05, Ilya Leoshkevich wrote:
>> Hi,
>>
>> I noticed that when we get a SEGV due to jumping to non-readable
>> memory, sometimes si_addr and program counter in siginfo_t are slightly
>> off. I tracked this down to the assumption that translators stop before
>> the end of a page, while in reality they may stop right after it.
> 
> Hi,
> 
> Could this be related to issue 1155 [1]? On RISC-V, I'm getting incorrect 
> [m|s]tval/[m|s]epc combinations for page faults in system emulation and incorrect si_addr 
> and program counter on SIGSEGV in user emulation. Since it seems to only affect 
> instructions that cross page boundaries, and RISC-V also has variable length instructions, 
> it seems that I've run into the same problem as what is fixed here.

It seems likely, and the code at the end of riscv_tr_translate_insn is wrong.

> Could this fix be extended be extended to targets/riscv?

I'll write up something.


r~

