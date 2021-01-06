Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1E2EC32C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 19:22:10 +0100 (CET)
Received: from localhost ([::1]:44690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxDRh-0000r5-TH
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 13:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDQY-0000J7-QG
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:20:58 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:33576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDQW-0003vE-Ub
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:20:58 -0500
Received: by mail-wm1-x333.google.com with SMTP id n16so3597944wmc.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 10:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QfbeWsTRTl5t+yoIzvqBpOs8fewM/q2gZY0NpUaJFJ0=;
 b=KKUyO72RiIV2lTc2BzL4v5d4Wax+ixJXUKre5AzfybcTMoRmqt/av+KsWYg2hS1AOz
 bdNdHofJ4C5gkVDP6zCjV599rXtajM8vLrMNdUkkE+MhYt+C53xiVcrKFbtTYDQ9yaDx
 ziEHTWDQ8VFx1wjOcQzj/gm2lQVSzB73a+dZcGTkjJovunCyJys/JafYbxqen0ZIdIkm
 Z0PE3ZlYdXju2PWwj/hWIn1EqAL69+pks3qupMz0qHbKAM/vAc5sboRCGhRI4R0hTTdt
 risWwGGAu6EGxvtOIh8Z8M5O4hlaiX9/xYLPmTDg7IgEDDFYPDUNUePWCLq0V46hhR1D
 fzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QfbeWsTRTl5t+yoIzvqBpOs8fewM/q2gZY0NpUaJFJ0=;
 b=Ai/msNvJuJqODGACp0ksVFQgs36L0/jFoWqC7ZL9O5FiJfU14WGzXsVjPQYZoSqxdJ
 h1Gm6Lzzq+qCYLsw77jebkGBUNHK+LTw3ym5CwNrbUg6l50gdAEpKsAkbawYUx5h5ISO
 fWwdZFdLsFkAKaZlYr6LKX1DNSVK9+ay99OrNRnnhjjx91c0q3FzO2PPlWVh5Texg17Y
 V99oweQCwXSaSGF6zNr8efIvhYNSWcGocEakvDYAjFYvPoO+6eaPk9Hxivqsvl6ZoR76
 V/MVAI0LKud6SmSVt0JXU25Vv/PsBiS0Oy4R3un4H6fafBh7FqDNiL9vksrj2XJU6S/R
 S7sg==
X-Gm-Message-State: AOAM533xj3Jy9S2EYNGAI0Co6HjpraF/gRXAhAAAoLI8Z+CmgWFD7VqI
 tuhDPcl/p52v6DhfeiHJxXw=
X-Google-Smtp-Source: ABdhPJzTMCojHyc3I3zeK/plHO8a7afnD7azaRHN5Jwo51vHLO6QKkdnUWYGLJef50BbNkQxyfT6YA==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr325351wmq.163.1609957255178; 
 Wed, 06 Jan 2021 10:20:55 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z21sm3853080wmk.20.2021.01.06.10.20.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 10:20:54 -0800 (PST)
Subject: Re: [PATCH v2 02/24] target/mips/translate: Expose check_mips_64() to
 32-bit mode
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1f23c2f4-28b9-ac3b-356e-ea9cc0213690@amsat.org>
Date: Wed, 6 Jan 2021 19:20:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

ping for code review? :)

Due to the "Simplify ISA definitions"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg770056.html
patch #3 is not necessary.

This is the last patch unreviewed.

On 12/15/20 11:57 PM, Philippe Mathieu-Daudé wrote:
> To allow compiling 64-bit specific translation code more
> generically (and removing #ifdef'ry), allow compiling
> check_mips_64() on 32-bit targets.
> If ever called on 32-bit, we obviously emit a reserved
> instruction exception.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 2 --
>  target/mips/translate.c | 8 +++-----
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/target/mips/translate.h b/target/mips/translate.h
> index a9eab69249f..942d803476c 100644
> --- a/target/mips/translate.h
> +++ b/target/mips/translate.h
> @@ -127,9 +127,7 @@ void generate_exception_err(DisasContext *ctx, int excp, int err);
>  void generate_exception_end(DisasContext *ctx, int excp);
>  void gen_reserved_instruction(DisasContext *ctx);
>  void check_insn(DisasContext *ctx, uint64_t flags);
> -#ifdef TARGET_MIPS64
>  void check_mips_64(DisasContext *ctx);
> -#endif
>  void check_cp1_enabled(DisasContext *ctx);
>  
>  void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
> diff --git a/target/mips/translate.c b/target/mips/translate.c
> index 5c62b32c6ae..af543d1f375 100644
> --- a/target/mips/translate.c
> +++ b/target/mips/translate.c
> @@ -2972,18 +2972,16 @@ static inline void check_ps(DisasContext *ctx)
>      check_cp1_64bitmode(ctx);
>  }
>  
> -#ifdef TARGET_MIPS64
>  /*
> - * This code generates a "reserved instruction" exception if 64-bit
> - * instructions are not enabled.
> + * This code generates a "reserved instruction" exception if cpu is not
> + * 64-bit or 64-bit instructions are not enabled.
>   */
>  void check_mips_64(DisasContext *ctx)
>  {
> -    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
> +    if (unlikely((TARGET_LONG_BITS != 64) || !(ctx->hflags & MIPS_HFLAG_64))) {

Since TARGET_LONG_BITS is known at build time, this can be simplified
as:

if ((TARGET_LONG_BITS != 64) || unlikely!(ctx->hflags & MIPS_HFLAG_64)))

>          gen_reserved_instruction(ctx);
>      }
>  }
> -#endif
>  
>  #ifndef CONFIG_USER_ONLY
>  static inline void check_mvh(DisasContext *ctx)
> 

