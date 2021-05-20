Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D7838B0A6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 15:58:33 +0200 (CEST)
Received: from localhost ([::1]:46392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljjC4-0005W9-BM
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 09:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljj9e-0003rb-Ca
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:56:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljj9c-0005dk-NQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 09:56:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id y7so1990566eda.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 06:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rYne+pta4HbcVQgDWy6ZmNYMyTMdpMVpim+iCoweDwU=;
 b=feeSm2rtC7faPQwJRhCr7lP+SK+I1B0pqH82/1s8ux8RrAfexmCeoRKZ7q7chFg4mh
 U6SWM6ITK+vozM0Ejzs9dT4oZ0yP24lBJaWHz4LTxJgrc32DEoXFBWO3wRiDZv5kJiQY
 W0EgFRKu2rSToKGOw8qFb8gOGwzTEHgjIua7xl0lM6pNm5AX1lnaGBRqDiQ50th3KuZ9
 NSXDRQpLUEU9oh127B3VWnWXnkA1ml10T4t43NLxNMnD95hfoq4S0Ipi+dEE40e2fw2A
 1Z61FayT/nsS5GlPZ9XbyTcvtjAaARqYuJWiWAyzuckEVE6k/TF9YVB29T4E/GPVhtwy
 RHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rYne+pta4HbcVQgDWy6ZmNYMyTMdpMVpim+iCoweDwU=;
 b=GIR6aIXhGJ3CwSXHE7pGMt3cq0xtHKTGI945BcuqMqsVWwdOaxRaCCbY9tS8jJNNQU
 D/m7T+p0c4HNe7wlhGuTMISlKRwdacv0PKeZdxTLqFZk2mDShXMyubvBTgmkjmwa8zt/
 zSjNutjhPodxcqcyNQHF8/vSYUT2e2kww0lXangTMSz50W++Mcg8jQ0qhLYOE6KpJt4J
 47pQ0ZgMG7Z+qCqj54nnbo40LC3KUcVg4uJLSvcJVTJ1G/pHliw2C2WHKYdufBS8yNAM
 2glbfiD8gwB5IBttyNryuQJwcYwbOheVjU6SKz833FD6NyGImRY5DdmQ0iv3lNj0mcLf
 hRvg==
X-Gm-Message-State: AOAM533bm97hidhXI92+UFIT9ztFElF89DGLLg+fa0wMF66e9jrOhgpl
 4szJsUoHz/UhhgVSTz+kWPvyABJ/y4qfwOKSnPAFrvOBtt4+uw==
X-Google-Smtp-Source: ABdhPJzXv2UANbCfstlex9/AZmF8vA9hA3ESzbjcytG+38aiWX02AwkPFQuf2zo6SUal1LaG57V9RGz+w6vclxFEq1s=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr5095824edb.100.1621518958952; 
 Thu, 20 May 2021 06:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210511101951.165287-1-alistair.francis@wdc.com>
 <20210511101951.165287-37-alistair.francis@wdc.com>
In-Reply-To: <20210511101951.165287-37-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:55:40 +0100
Message-ID: <CAFEAcA-ZPxvdTE13cjxy7o7mcD7DT7p8nRPbueF_S9QO0F3_FA@mail.gmail.com>
Subject: Re: [PULL v3 36/42] target/riscv: Remove the hardcoded MSTATUS_SD
 macro
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <alistair23@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 May 2021 at 11:22, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: fcc125d96da941b56c817c9dd6068dc36478fc53.1619234854.git.alistair.francis@wdc.com
> ---
>  target/riscv/cpu_bits.h  | 10 ----------
>  target/riscv/csr.c       | 12 ++++++++++--
>  target/riscv/translate.c | 19 +++++++++++++++++--
>  3 files changed, 27 insertions(+), 14 deletions(-)

> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 26eccc5eb1..a596f80f20 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -78,6 +78,17 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>      return ctx->misa & ext;
>  }
>
> +#ifdef TARGET_RISCV32
> +# define is_32bit(ctx)  true
> +#elif defined(CONFIG_USER_ONLY)
> +# define is_32bit(ctx)  false
> +#else
> +static inline bool is_32bit(DisasContext *ctx)
> +{
> +    return (ctx->misa & RV32) == RV32;
> +}
> +#endif

Hi; Coverity points out (CID 1453107) that this is_32bit() function
can never return true for at least some build configs, because RV32
is defined as ((target_ulong)1 << (TARGET_LONG_BITS - 2))
but ctx->misa is a uint32_t field, which (if TARGET_LONG_BITS is
64) is not big enough for the RV32 bit.

Bug, or false positive ?

thanks
-- PMM

