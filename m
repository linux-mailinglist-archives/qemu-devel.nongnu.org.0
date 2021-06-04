Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA2939C535
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 04:46:44 +0200 (CEST)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpMKh-0003Fo-Tj
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 22:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faraz.shahbazker@gmail.com>)
 id 1lpJC7-0007RY-9V
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 19:25:39 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faraz.shahbazker@gmail.com>)
 id 1lpJC5-0006F4-HA
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 19:25:39 -0400
Received: by mail-pg1-x536.google.com with SMTP id n12so9013727pgs.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 16:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4kdHN5MadEcN9/DpZEWwtDFnPUfE++6qTflXA2PfSSI=;
 b=PKLMrQi0bCQ8QmRuYXuiywej0qz95cN1H0ufW5gXexeb3G7Zr+vbW6jaLjAf3zkW0p
 x6PIq/Peft2cO5TKRVkyWOtVJtLeFDQkLFinf7rQvXxc8TZvf9lbCkuyWiXgPaS50rzf
 eM+jKzKvtSTksl3F19O3M8qgZjVxfLNQQZj2D+Mo+E+Ez93JKyT2LQZ2tvXSxgOyDDE5
 mFVkBy2yKdobcSOrozEFn4XmT4VfWDa8ke6QWYqghHr/8qA6fIs1VQG3X/OtuViUCz7n
 YTwbJZervDvFzevEwWhkOhSDhkZZousdDhQrl1svn2zafyxJiqYvvsUE2L8APsQMfBZJ
 SZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4kdHN5MadEcN9/DpZEWwtDFnPUfE++6qTflXA2PfSSI=;
 b=J3AJxZdpPmEKegx8pnQitLVPU3LHUDXJWWrdTZcBY0zc39QwAg7lvtuSSdb3buIsXT
 Xc7h6LgNTdif2DLFSjaYpg4/5LR1Hdh0HLPX4rt0iw3Kua66B/Sd66Ctq80KGrRyzHog
 MyV+iGFTdN0EUVCV2vqjVJZT4UNx6RD+0TN5+c5tp+S1Vk07MxzqYDUaQYaI6J2Ubp/F
 LrOPKX/FSglqYF1OLotV5nI34VLDiqI4H/u6Sdp+ZZMIr5DMvwbheMx1jetajnLCsN2h
 m0am1dBXH+S+PtwEcRrqi+EHNt9ZT80xYgJYuq44ZTaP1HCAQQJTeTMoFrjoCpiLB+rd
 H7tw==
X-Gm-Message-State: AOAM5328k6zN3Rav7cKuK9DRioD4CXS1RKLGo2dXbZLR01MTwm1Y1K2V
 NVeieTExr8X7b8cLxZ3zlHI=
X-Google-Smtp-Source: ABdhPJxPcE8QxGv5azBq+UXQ4oLQNQ/jmgnzjw9fJaV4rEXpb6aa/lWDFBKaB14Xd331lJYxg0sHeA==
X-Received: by 2002:a63:db01:: with SMTP id e1mr7406045pgg.38.1622849135118;
 Fri, 04 Jun 2021 16:25:35 -0700 (PDT)
Received: from [192.168.43.9] ([123.201.54.87])
 by smtp.gmail.com with ESMTPSA id a9sm2826837pga.43.2021.06.04.16.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 16:25:34 -0700 (PDT)
Subject: Re: [PATCH v11 08/46] target/mips: Add emulation of nanoMIPS 16-bit
 branch instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
References: <1534789014-8310-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1534789014-8310-9-git-send-email-aleksandar.markovic@rt-rk.com>
 <CAAdtpL7jGOxhaqA-gLSRX_6FktEm89AMW-xkV=n+mEjWd-O1iA@mail.gmail.com>
 <e208f68d-969a-0a07-a24c-25b6a0bbdb42@amsat.org>
From: Faraz Shahbazker <faraz.shahbazker@gmail.com>
Message-ID: <2ed21c01-d82f-4279-810d-3272afcf1138@gmail.com>
Date: Sat, 5 Jun 2021 04:55:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e208f68d-969a-0a07-a24c-25b6a0bbdb42@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=faraz.shahbazker@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Jun 2021 22:43:19 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Dimitrije Nikolic <dnikolic@wavecomp.com>,
 Stefan Markovic <smarkovic@wavecomp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, faraz.shahbazker@mediatek.com,
 Petar Jovanovic <pjovanovic@wavecomp.com>, Paul Burton <pburton@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 5/29/21 7:50 PM, Philippe Mathieu-Daudé wrote:
> On 5/29/21 3:52 PM, Philippe Mathieu-Daudé wrote:
>> On Mon, Aug 20, 2018 at 8:17 PM Aleksandar Markovic
>> <aleksandar.markovic@rt-rk.com> wrote:
>>>
>>> From: Stefan Markovic <smarkovic@wavecomp.com>
>>> +    case OPC_BPOSGE32:
>>> +        tcg_gen_andi_tl(t0, cpu_dspctrl, 0x3F);
>>> +        bcond_compute = 1;
>>> +        btgt = ctx->base.pc_next + insn_bytes + offset;
> 
> I think this opcode never worked correctly.
> 
> Per the "MIPS® Architecture Extension: nanoMIPS32 DSP Technical
> Reference Manual — Revision 0.04" p. 88 "BPOSGE32C":
> 
>    "First, the offset argument is left-shifted by one bit to form
>     a 17-bit signed integer value."
> 
> The caller, decode_nanomips_32_48_opc(), doesn't shift the offset:
> 
>      case NM_BPOSGE32C:
>          check_dsp_r3(ctx);
>          {
>              int32_t imm = extract32(ctx->opcode, 1, 13) |
>                            extract32(ctx->opcode, 0, 1) << 13;
> 
>              gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,
>                                    imm);
>          }
>          break;

I agree that the left-shift is missing. One must also note that the text 
in the nanoMIPS32 DSP manual is incorrect. This was most probably 
copy-pasted from the microMIPS DSP manual. The effective offset for 
nanoMIPS DSP is supposed to be 15-bit signed, not 17-bit.

- farazS

