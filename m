Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC662D4495
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:44:14 +0100 (CET)
Received: from localhost ([::1]:34378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn0hR-0000vd-RE
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:44:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Yg-00026C-IN
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:35:10 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kn0Ye-0005VU-Tt
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:35:10 -0500
Received: by mail-ot1-x343.google.com with SMTP id i6so1543555otr.2
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dguusYMJdoDw2oR2NHTSZ5FudkPTWQjJ+ww5gNsJMmg=;
 b=JoKpfKx1SmrmreB+HPJdu9Ztq6Sz+CUeJxYYCRzHyOu5kzAZK2vASciFsfO86dEaKH
 GLyaqFp3x91rw4VbHexEN2Sf1VbSZhz4/a7A7ZkgxXf3gqzIPkHBAcUAA7MarQSNmGa9
 6471qcFwXCgNImT2/B/I/BRHBiTY0gQlkgXAJvB5hbCs3a87R7i5sxwPTfN/bmTe7eIh
 kuHDqDhh6vBYFsKxB0g5Ll/iP3G7cCwlFqaC4RbLAcUoepaan450gJ9kp2t/kXolxglF
 zj0lK23vO2eQv1CWEKJds41p87ulTYGd5eMJCfKllVR4wzJ1uaVAiXXG2gituz02qOR5
 8HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dguusYMJdoDw2oR2NHTSZ5FudkPTWQjJ+ww5gNsJMmg=;
 b=flwg5uIoPgewsa1JAMzzX6upJHTRijX0HjAj9gUG2VBu6flNUqjscsFJet00RViqIl
 eutA1fiYpQ4iP8yTEhnTGkgA3SXgmAMnwMYVXyVitZ2W1RWlkyo2Rw1EEdRJYm6e8NuS
 doyGni+WL7mS7OUqPvgvc5yKkVbmFFuszocLrjqsDhUz3w7D4HnDfskUAFT1UPBeomz2
 JYLd/kmMO8xXq1bFX97AuKpmp7tFh4rxJyWHNOHiNUcTfifE39JlJN9XW3X7MgsanWrE
 bhnRpKuc/bPZUipP78KSbU89anC+zde04axxjMenovf3iG273fjQ3ngWbl4duS487sbN
 vr7g==
X-Gm-Message-State: AOAM532jjljOW6Ei1cuLXu5xJ2YyYtYGMkxm/GIPOPZxVzX2f80/Tlwz
 JLlBf9f09N4XUFmdL76jllrG+w==
X-Google-Smtp-Source: ABdhPJwRwvSy4DxxpTs7/FBft4E/KjRk08HDmT64bwyby15IO6IFdqd559Oi1pTrxM65NAEe8EYUaA==
X-Received: by 2002:a05:6830:1c34:: with SMTP id
 f20mr38722ote.147.1607524507769; 
 Wed, 09 Dec 2020 06:35:07 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d32sm411981otb.24.2020.12.09.06.35.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Dec 2020 06:35:07 -0800 (PST)
Subject: Re: [PATCH 10/13] target/mips: Convert Rel6 LWLE/LWRE/SWLE/SWRE
 opcodes to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2d6703c-999e-4ea1-8417-0c7e592a6776@linaro.org>
Date: Wed, 9 Dec 2020 08:35:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:37 PM, Philippe Mathieu-Daudé wrote:
> LWLE/LWRE/SWLE/SWRE (EVA) opcodes have been removed from
> the Release 6. Add a single decodetree entry for the opcodes,
> triggering Reserved Instruction if ever used.
> 
> Remove unreachable check_insn_opc_removed() calls.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/isa-mips32r6.decode | 5 +++++
>  target/mips/translate.c         | 4 ----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

