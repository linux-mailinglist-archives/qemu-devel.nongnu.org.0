Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05A92ED3D9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 17:02:42 +0100 (CET)
Received: from localhost ([::1]:54644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxXkI-00005c-0s
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 11:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXiO-0007dk-L7
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:00:45 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxXiM-0006SY-9s
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 11:00:44 -0500
Received: by mail-ed1-x52d.google.com with SMTP id u19so8278966edx.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 08:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nm2Ima4bp1U3JjhBWCY7piiq4gwIFTGYdxuTBWUSwxA=;
 b=n5PRIhTcIdazsXZIWOfUu5lS9yaMmgrFRwCnxoqdZIuwe9IvpHrFjhAhibqkzJFYeD
 4FOGoPo6ct+qSyvaBQMzAR68yVE7ker2rWREGjsU6dMqqeKGs60mwx6aRgjOYOJiQNzo
 jp+JEAuSfYrUw6rUbyZKOV937XweNjvcVZt54rbe101Qkaa+asEB+OD7P1oAUjLNfItQ
 Z+vI7lMiHoruwmio6r0WRnRn6SXKhtZBVxBXk9jpd2y18WpsV8JkDnXXnKcO1OkAyK43
 AOykowSSrEeCDPXdnyPpw2kGf/mj05sD7dlTauRxyrtZl7r0Ft06v5uY7rle7WGoWBwu
 IMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nm2Ima4bp1U3JjhBWCY7piiq4gwIFTGYdxuTBWUSwxA=;
 b=QHxv2AB6sH3VeGILfCg1QptYCOvkzPjdvIvRrIRDL01h9KTP3EBZFAgYsuPSJtAGar
 iMYLnrvqFWssksq8mm3E78pZfpC2UwuGMGP6nr0/+hdWQh0eAPvDInWiHY1O1GLwx1RS
 hxfAI3QvaR+X181l77urQe3t6Y/MxYndImU3F4bcN7Z2FmGIKqn3kyYSauoN1tc7yrKj
 KXxbOr3IK35u7IS8yCsqH+ZYWKah7txqErI0PneHYxJXAnYZqOD6fj9/ZH3mzw78BJ45
 f7KWw7Np8X+lUAkL+VokW70IYMDjiy2151Ge/qJDD29DjICNJ95Ji7h23XMitXB5eot3
 g3gw==
X-Gm-Message-State: AOAM530YLpu9QNSex7e9NS7BrQckeRtnJIs47JAszyMHNhGrQosRJ3Gy
 9JrhE75vwkRv1//FRvq3x7EcJvZsoGLXCovhjyvI2A==
X-Google-Smtp-Source: ABdhPJwaOdl3MCbeZWtzzeFg3+ziw2gRTwk9Grn0NiN/izVIbCAvQTDn7w1SwAyU39h2g6Vw9FK9MERDA/YtI7tRNQU=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr2139042edw.52.1610035239948;
 Thu, 07 Jan 2021 08:00:39 -0800 (PST)
MIME-Version: 1.0
References: <20201208180118.157911-1-richard.henderson@linaro.org>
 <20201208180118.157911-6-richard.henderson@linaro.org>
In-Reply-To: <20201208180118.157911-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 16:00:28 +0000
Message-ID: <CAFEAcA9sT4JdPWkojp0r6yazJc5vbmzWHwnkMtChTQ1aZ2uugQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/24] target/arm: Fix SCTLR_B test for TCGv_i64
 load/store
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Dec 2020 at 18:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Just because operating on a TCGv_i64 temporary does not
> mean that we're performing a 64-bit operation.  Restrict
> the frobbing to actual 64-bit operations.

If I understand correctly, this patch isn't actually a behaviour
change because at this point the only users of gen_aa32_ld_i64()
and gen_aa32_st_i64() are in fact performing 64-bit operations
so the (opc & MO_SIZE) == MO_64 test is always true. (Presumably
subsequent patches are going to add uses of these functions that
want to load smaller sizes?) If that's right, worth mentioning
explicitly in the commit message, I think.

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index f35d376341..ef9192cf6b 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -949,7 +949,7 @@ static void gen_aa32_ld_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
>      tcg_gen_qemu_ld_i64(val, addr, index, opc);
>
>      /* Not needed for user-mode BE32, where we use MO_BE instead.  */
> -    if (!IS_USER_ONLY && s->sctlr_b) {
> +    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
>          tcg_gen_rotri_i64(val, val, 32);
>      }
>
> @@ -968,7 +968,7 @@ static void gen_aa32_st_i64(DisasContext *s, TCGv_i64 val, TCGv_i32 a32,
>      TCGv addr = gen_aa32_addr(s, a32, opc);
>
>      /* Not needed for user-mode BE32, where we use MO_BE instead.  */
> -    if (!IS_USER_ONLY && s->sctlr_b) {
> +    if (!IS_USER_ONLY && s->sctlr_b && (opc & MO_SIZE) == MO_64) {
>          TCGv_i64 tmp = tcg_temp_new_i64();
>          tcg_gen_rotri_i64(tmp, val, 32);
>          tcg_gen_qemu_st_i64(tmp, addr, index, opc);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

