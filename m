Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18333C9565
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 03:02:31 +0200 (CEST)
Received: from localhost ([::1]:59350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3pll-0003hk-MM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 21:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3pjI-0002ti-1t
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 20:59:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3pjG-0002ww-Cp
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 20:59:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso4569293pjx.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 17:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ndABTHBkUQmwNULC/CKmulGxTKzWFYJuy4Z1422sPPs=;
 b=aoRRo6KxCb57l+2LLTx4snHRMZ63+vx6GqzFcfW5Z/OAXby7L6a/dZ6XyjkgMZgjdp
 VxN3GJomZmc2hHoTKWW4z7MgC6AIycE/7BYudFPJqAqroIDa67o6bzJ+eCGm6ybyJs8k
 BKEgJnBoqdaHFKudZHJtideiDPjMvBk/+pas+sfKu6fNaDYEHrnpSx+lZuytHE+cvgMU
 0C/zytkkjzHjqa3PE8/weQB0ezdP8LxWMcldkZdO2pnS1WOI6HcTgF3EMv3bGl0S21fr
 uWTIAeCRZV0SlTEBBSC3H852KbdZwPX0faUJHunVI7Fm0TkcqGhOAQYcEdJss1/9K0kQ
 LbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ndABTHBkUQmwNULC/CKmulGxTKzWFYJuy4Z1422sPPs=;
 b=CwJJrJIHJbBw4Ap19FRv0VkNkg4uw/pljuTKEUJVq+hgl+prpn3hDTSgFJkncOMvmE
 sHTHbyRIet/aWnOItrHY6DBIXSJnU6cpioI2/2jtk77VmrQlO3INWq01YfRg82R1awJA
 vzDEiyQW8rDtYCgkORtJF9KSgMtihxfXTlntpUz8BaaZvawmJem4sgrym6ozGV/Eb+26
 1N2+A4ZH4DQDOeLHC4f2kKdKMnZ4XDZQwQrBmi6DpMAuMBcrxruq0Daw9zgMt4YKCLXF
 5pu2sqZ/q0XcMIQ0aabiDXLfpZBpDE5b0QBKRfQtO5QSgusvaoJ5/wMqS6Z7P0FmzL/h
 Sseg==
X-Gm-Message-State: AOAM533B3iY5q75pZsjUuuyVTV1AQ5jRTV34zxRcNthpXwE1Xu2d/bt3
 wG82tHNEJYkY0i9CM+iWmIQ83w==
X-Google-Smtp-Source: ABdhPJwLef1c43a1cFYpWGcfFT4FEU8TrEsO2HguZpo1LzOaNWxLt89IQmtKYNEActL+lAAEULR/xA==
X-Received: by 2002:a17:90a:642:: with SMTP id
 q2mr6349504pje.205.1626310792482; 
 Wed, 14 Jul 2021 17:59:52 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id l11sm3324283pjw.45.2021.07.14.17.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 17:59:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] Hexagon (target/hexagon) remove
 put_user_*/get_user_*
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1626303309-7946-1-git-send-email-tsimpson@quicinc.com>
 <1626303309-7946-2-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f321397d-4066-73da-2f9d-44bfd06e6e17@linaro.org>
Date: Wed, 14 Jul 2021 17:59:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626303309-7946-2-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 3:55 PM, Taylor Simpson wrote:
> +    target_ulong pc = env->gpr[HEX_REG_PC];
> +    uint8_t width = env->mem_log_stores[slot_num].width;
> +    target_ulong va = env->mem_log_stores[slot_num].va;
> +
> +    switch (width) {
>       case 1:
> -        put_user_u8(env->mem_log_stores[slot_num].data32,
> -                    env->mem_log_stores[slot_num].va);
> +        cpu_stb_data_ra(env, va, env->mem_log_stores[slot_num].data32, pc);

No, you need to pass the host return address, not the guest.
This should be

     uintptr_t ra = GETPC();


r~

