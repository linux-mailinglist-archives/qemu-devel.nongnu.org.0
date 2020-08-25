Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03F0251932
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 15:07:50 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAYg1-0003fO-Pt
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 09:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYfL-0003FZ-Pa
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:07:07 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:43082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kAYfJ-0002Fv-Pp
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 09:07:07 -0400
Received: by mail-ej1-x643.google.com with SMTP id m22so16397167eje.10
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 06:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=37Ox2hNGcqsCDVVBsuIyvU8yJLJUl5E0CCZj7cUv+7g=;
 b=pWnKHuTWsDnM4img7apCa4Ed4QQ14eehDDfHN4PqpaKw5MUZ3VR6kbbuQnP/i37/rw
 ZopXwgOkQBaNjMg/6jqohf6XWlSD45YVudhZQAbxMSTMHhDm90OjPIYxjcIqd6RipB47
 mEq6drLLbafTjhh89iNsaHqEcPhC+aF86B/7iOJOhd4PP9scf71AockHLLE8TXRv/Fhl
 mu92HKSuK/w4KpeW59utT9qqWH/PCIoRKC4ApchhzYD+3Yko5Q3r0D416kNVstRjfAu2
 Oj3DEknFilqX7dRtM17W+ivXEzQbhj5KMrMCDoCZvrDLugmc4tDmlDD+UjV9eQfn099q
 YpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=37Ox2hNGcqsCDVVBsuIyvU8yJLJUl5E0CCZj7cUv+7g=;
 b=Sd5lrwCqM3Gu7rSPAFAQnD66lH5V2ZS+HDx4O/iWkPHGB2jkY8xZlOHbgIzjfYROBl
 cSUg2HLVoGblbSgUgmjoXbUtewIHe6oiUr7h5M+x03KBGTHtlEBCpdDxh/a37dnXU3kl
 FziV2fAdy+n9/ITTQrFeTuhQu74vJ1ORlCkQeoxMBifQ+eH2jhWAOLfR8/fn76W9Fizv
 Ax3g1Swuob/M3WTyLU2iVrDTBkOITT92fEtGSBxPn1E0s5v+zVa73GOKv0ERnWmbdNK/
 Cx+Ulm0jYk+TTFtkUQXpczAaXH6I7MO37bHTzYf7JGkbd17pzOWpgzDxaKBYM/Tsp1gH
 lPhQ==
X-Gm-Message-State: AOAM533TXYITUHHgvM622Hyhe7yZ2tiojKeHRO9mO7ar0ITozYNnK0F7
 xTLUT35OcB/1mXp1SvAN8GjH7WEZjp+L40QEwyz/GQ==
X-Google-Smtp-Source: ABdhPJwIW7hVPglHFivq0WRvW6QYvO0dS1u7twOZuIh1ScRsyi+Hoq2rJ6Kawpde+xsIor6i3iDDaeNEZpL3Mm81cdQ=
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr10283839ejr.482.1598360824205; 
 Tue, 25 Aug 2020 06:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200815013145.539409-1-richard.henderson@linaro.org>
 <20200815013145.539409-15-richard.henderson@linaro.org>
In-Reply-To: <20200815013145.539409-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Aug 2020 14:06:52 +0100
Message-ID: <CAFEAcA-_2oiamCkEOhGQkqRFOx=ouWBmEtNUfyaxY=WX2zxJnw@mail.gmail.com>
Subject: Re: [PATCH 14/20] target/arm: Generalize inl_qrdmlah_* helper
 functions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 15 Aug 2020 at 02:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Unify add/sub helpers and add a parameter for rounding.
> This will allow saturating non-rounding to reuse this code.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>  /* Signed saturating rounding doubling multiply-accumulate high half, 32-bit */
> -static int32_t inl_qrdmlah_s32(int32_t src1, int32_t src2,
> -                               int32_t src3, uint32_t *sat)
> +static int32_t do_sqrdmlah_s(int32_t src1, int32_t src2, int32_t src3,
> +                             bool neg, bool round, uint32_t *sat)
>  {
>      /* Simplify similarly to int_qrdmlah_s16 above.  */
>      int64_t ret = (int64_t)src1 * src2;
> -    ret = ((int64_t)src3 << 31) + ret + (1 << 30);
> +    if (neg) {
> +        ret = -ret;
> +    }
> +    ret = ((int64_t)src3 << 31) + (round << 30);

Shouldn't this be "+=" as with the _h version earlier ?
(risu testing ought to catch this -- do we have a coverage hole?)

>      ret >>= 31;
> +
>      if (ret != (int32_t)ret) {
>          *sat = 1;
>          ret = (ret < 0 ? INT32_MIN : INT32_MAX);

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

