Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B4D3F0DE5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 00:09:05 +0200 (CEST)
Received: from localhost ([::1]:55182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGTk8-0003vL-Gt
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 18:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTiv-0003FN-Gn
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:07:49 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mGTiu-0008IZ-2Z
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 18:07:49 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so5784488wrr.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 15:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sizpEldse+ADcfqD2jVBpBMsymKBN0sA4ZfllAtjrDs=;
 b=Sc/Kc1hmbmZWbnWhtZGMHXo/4/ksTYFaTT+BpHHlTkBbkQ0J+tOTKS6n03gMauzU5p
 dOx6WOU18EeO2Yt6pv00V0Bax+CckABNRg3TaZ0WJF2hwpwZMGfXgbhp2QK+s7kUEaoW
 E1AgmPiXhXGnCjzspaYH5dPc4P2F6Oqhigkb6mECjbzcCOsnDA5rG/K9rSjzQvUuTP8W
 YskRgbf+PqOjOjRrruLN9D/oGK+0L8lasAbcmzrdYHDy04NxjM1Fa9UEA9WCA/K10uBf
 CfgIxfH28d8v7c2mtYJE4I2xafKKNKvu5q/4AuHjJUZPVwoKPIbOCvcf0Uk29EIAwfxj
 LVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sizpEldse+ADcfqD2jVBpBMsymKBN0sA4ZfllAtjrDs=;
 b=sNedzP0JRaCjwIOqYXCElHuhO3NZDQVfgoJ6t+gadkP/hkoWNPAfE0vXG9AieHfoht
 DJ93rf+eEudLXoDA11RnlaIF99tkQB+/BRJMu+P7h2QnlT/FNuUNnq/Liydrm+fOg2ba
 3U8lO0V9ma1YG15400/re+f99ULGX0f0fl9R0rO3Vm0kSFyn2iO9NVL7JLZlFx6YQtwQ
 C+9d5lVKO7oSJf6bNPrt/54JDO//59lGBhTEI+UpyQM3s139PMLkVxpdtfjwrnC4oIaY
 479Pxxxrotkn5r+Dg5hNlTvqUYXGl82PTqXKGQiJ9o1aSWB3ezEBK+mVqArWOBFNsiqp
 8jlw==
X-Gm-Message-State: AOAM533vrLo5DhYEpfEMZ5v0K4qpRSOtGrMAOebXakYgmcY00axSJ3Ug
 Tz6Ktd8Xx0sVse91N5fzrrE=
X-Google-Smtp-Source: ABdhPJwpCh0IrLugPA7VvaaYOyJlPTjJmHbL3Phv35DS+DDMH41OSSR8Etj1va16nvacngat9CebWg==
X-Received: by 2002:a5d:6b8f:: with SMTP id n15mr13139671wrx.241.1629324466728; 
 Wed, 18 Aug 2021 15:07:46 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p3sm1068599wrr.21.2021.08.18.15.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 15:07:46 -0700 (PDT)
Subject: Re: [PATCH v3 00/16] tcg/mips: Unaligned access and other cleanup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210818201931.393394-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6341c27-f656-da64-271d-487eea49d931@amsat.org>
Date: Thu, 19 Aug 2021 00:07:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.961,
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
Cc: Huacai Chen <chenhc@lemote.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Jiaxun & Huacai.

On 8/18/21 10:19 PM, Richard Henderson wrote:
> Based-on: <20210818191920.390759-1-richard.henderson@linaro.org>
> ("[PATCH v3 00/66] Unaligned access for user-only")
> 
> Important points:
>   * Support unaligned accesses.
>   * Drop requirement for 256MB alignment of code_gen_buffer.
>   * Improvements to tcg_out_movi:
>     - Have a tb-relative register for mips64, reducing the
>       code size for most pointers,
>     - Try a few 3-insn sequences,
>     - Drop everything else into a constant pool.
> 
> 
> r~
> 
> 
> Richard Henderson (16):
>   tcg/mips: Support unaligned access for user-only
>   tcg/mips: Support unaligned access for softmmu
>   tcg/mips: Drop inline markers
>   tcg/mips: Move TCG_AREG0 to S8
>   tcg/mips: Move TCG_GUEST_BASE_REG to S7
>   tcg/mips: Unify TCG_GUEST_BASE_REG tests
>   tcg/mips: Allow JAL to be out of range in tcg_out_bswap_subr
>   tcg/mips: Unset TCG_TARGET_HAS_direct_jump
>   tcg/mips: Drop special alignment for code_gen_buffer
>   tcg/mips: Create and use TCG_REG_TB
>   tcg/mips: Split out tcg_out_movi_one
>   tcg/mips: Split out tcg_out_movi_two
>   tcg/mips: Use the constant pool for 64-bit constants
>   tcg/mips: Aggressively use the constant pool for n64 calls
>   tcg/mips: Try tb-relative addresses in tcg_out_movi
>   tcg/mips: Try three insns with shift and add in tcg_out_movi
> 
>  tcg/mips/tcg-target.h     |  17 +-
>  tcg/region.c              |  91 -----
>  tcg/mips/tcg-target.c.inc | 730 +++++++++++++++++++++++++++++++-------
>  3 files changed, 604 insertions(+), 234 deletions(-)
> 


