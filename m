Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5C73AEB2E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:25:14 +0200 (CEST)
Received: from localhost ([::1]:43064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKrR-00050Z-6W
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKpo-0002gh-Bp
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:23:32 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lvKpm-0007qn-MP
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:23:32 -0400
Received: by mail-pf1-x42f.google.com with SMTP id y4so6777619pfi.9
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wUHrV81Pl1e69J09vEKhkpgOijSvvIdpwWg2kkSjXuA=;
 b=vsFLXNZqYsSCES8Qpzzb+73xT/yNUKJgse+PxVh7E9AJCuVYhEVjU/TTgAxw22unll
 W2dy0YuOnHer2J+S6Orfs1Jn/aOPvUjzv1C87/vLQCWtz/eLNCBPRqcHCu4zf0LZw2AD
 LYVz5hGtuytuD4p8KPVy1lwGimPcO0P8WSN1FVB4pGQGUycxwdK3SrX93NAVBSw0J4tO
 zX/YA4oDLFHDbh8Dcs96qBJtG0bafq/kcTlocwYCHGpNh/a+RyrxxZfgyNTOowW2EMSl
 wD8AlVz3Ds//SAvVOJFRlwjVIXjwpeFBrsCZATkaJ5oOkTw8VqiUxSqLFYh0SQQmUikt
 V3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wUHrV81Pl1e69J09vEKhkpgOijSvvIdpwWg2kkSjXuA=;
 b=HJ+yMpYlW0xNAZ3gVu7NFnOTKdVk7DxkqUA8PcA4IdeTtUu89w1ZiIqdw7ZrLt9dnx
 FviKQKhXCo+eUDHjW7xizyn6xUe1zRflyldD4ABJqb6lk+jQl4Kw1Cp1WP2P4fwVBsNJ
 xLNxjBCx77gQFaKdrRMqMFkmmUpH7LMz/VP0u0fQt3UpnMXhxg0C6sB6Ufrr4eQiqu3D
 qu8RS3m9UxTJtzAG25t03u3c9LWj7jaVFQq2yzjZjAz5V8hcmdZWjrI23obCIai8UB+1
 8IWPPLebdJE+8PboEHOoTo4vqRQoCLoKq/Vq+1dGO3ILzC0wwKExZPdGfAFqTdnclJvh
 wW1A==
X-Gm-Message-State: AOAM530ucFK9pXL1dj4gNtxJKBfqnvS2wPYttooDLWVjq5qVQDN7Ar6U
 GDZt88Ckho3O3ns7Hwt2AXgQUmXA8A9chg==
X-Google-Smtp-Source: ABdhPJwDmD9+EPDB45xi32LJ/Q0QIHuzpa2R0hnc417oYBFze4x68yD0iyLutPfcKS6maSf5YKULig==
X-Received: by 2002:a63:2011:: with SMTP id g17mr24203481pgg.195.1624285409021; 
 Mon, 21 Jun 2021 07:23:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k88sm10524566pjk.15.2021.06.21.07.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 07:23:28 -0700 (PDT)
Subject: Re: [PATCH 06/28] tcg/ppc: Split out tcg_out_sari{32,64}
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
 <20210614083800.1166166-7-richard.henderson@linaro.org>
 <CAFEAcA-5WCpC=ZZOL5Sj8vwkac6auUF7VxRYzD3N0aRJbaYq3g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <86c59999-a49f-5713-30f5-847a439e9352@linaro.org>
Date: Mon, 21 Jun 2021 07:23:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-5WCpC=ZZOL5Sj8vwkac6auUF7VxRYzD3N0aRJbaYq3g@mail.gmail.com>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 7:22 AM, Peter Maydell wrote:
> On Mon, 14 Jun 2021 at 09:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We will shortly require sari in other context;
>> split out both for cleanliness sake.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/ppc/tcg-target.c.inc | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
>>               /* Limit immediate shift count lest we create an illegal insn.  */
>> -            tcg_out32(s, SRAWI | RS(args[1]) | RA(args[0]) | SH(args[2] & 31));
>> +            tcg_out_sari32(s, args[0], args[1], args[2] & 31);
> 
> Maybe the "& 31" would be better inside tcg_out_sari32()
> rather than outside it? The sari64() implementation already
> implicitly ignores high bits of an overlarge shift count, so
> having sari32() do the same would be more consistent.
> 
> Either way
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Good idea.

r~

