Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBBB3AEA1A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:32:36 +0200 (CEST)
Received: from localhost ([::1]:43422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvK2U-0005Fo-PX
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvJzc-0003e8-MK
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:29:36 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvJza-00083u-LN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 09:29:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h2so5441349edt.3
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 06:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lHpPzrIcM8jjrNm0G0OJk0rMZOh+1o4vGe83nlS1eiY=;
 b=kyGm0Nb8jZLTSdVF6x8CDbimchezec5C5X9ZpZvkIQYUPybhWOzQbYc2kP6QGatnKb
 HVcrcT2WMYOK0A4Qy80lCV9Imtxs+mn2aGCTxXS/CzZHvtKdiFlabzgm5wR471DfHSfS
 ZSCPIagTg7m5BZOdkGeS1aqx/dNgMdA6Lup3POXJhNgs2OojuWBqgh+wtX3i13RSA6kX
 zRp31YCUIC+zHhwmZovPIjfHhWPPMeG1A91AQBFDn8vvUyHSLtAntbstWQR5RMwvQZKv
 YTNrv85LoHmgN6YIIOD7EnnAEM9X38C4jlxZIa0mVNh3VoDvq2hb3fH5z1UqccZRze8y
 vkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lHpPzrIcM8jjrNm0G0OJk0rMZOh+1o4vGe83nlS1eiY=;
 b=m18oBUXXkh5u8XWABDZEtCaQlpDop1+t+iWoTVuP/3VEsfYlvohvCEJ5MiC2p+l/si
 fzAW3EmZ1zJvjrbPmz91LcGxoQz74M+l68jZbSJa/Q5+ZYVkd5k6XkK8sELP2A5VzTTX
 u7Kk5O6Es6TB3d7xatjezsyaxR5u+NZeIUNZlj7Q2fbDOuKzrjGPGRIJ7XPUjVCqXzkl
 44cOu/26F4YezbvxCVLHjjTKJTnQuxPWfqKHYd5jJ0p23D14IkpFJ663JR0Kxg+WoN+R
 boUBnIPR6PwlzveYzbhsGqroRAV3BZCa8sDi547VbylYIYvA2ldEYX9OiY2AyucIzTyk
 6eIA==
X-Gm-Message-State: AOAM533mm161QjsspwGvy4mqwCbVa04SruIHbtrlPFj4Zj+xqTftIJ4Q
 Z28s5omWYbueFCbTHtTQ4QXP4M3STxMZNnKmLTfvYw==
X-Google-Smtp-Source: ABdhPJxTQXbA42SRF3C4R16Zr5tFCez5ghi1imfXIa97/aYwp/OzgtceezTBOhAlH8BCJrzXaE7BNkEgGlzaWnxbjvY=
X-Received: by 2002:a05:6402:748:: with SMTP id
 p8mr18981586edy.251.1624282172638; 
 Mon, 21 Jun 2021 06:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-4-peter.maydell@linaro.org>
In-Reply-To: <20210617121628.20116-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:28:56 +0100
Message-ID: <CAFEAcA_HT=f8CN9j5rw2gL9pboiia1dzNcaNtikymuT3DRJiWg@mail.gmail.com>
Subject: Re: [PATCH v3 03/44] target/arm: Implement MVE VCLZ
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 at 13:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
>
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> +    {                                                                   \
> +        TYPE *d = vd, *m = vm;                                          \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        unsigned const esize = sizeof(TYPE);                            \
> +        for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
> +            mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

Just noticed I didn't quite get the refactoring from "use sizeof(TYPE)"
to "take ESIZE" right here, so we currently do both (correct behaviour,
but oddly written). I'm going to squash in this trivial fixup:

--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -265,8 +265,7 @@ static inline void unknown_mergemask_type(void *d,
uint64_t r, uint16_t mask)
         TYPE *d = vd, *m = vm;                                          \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned e;                                                     \
-        unsigned const esize = sizeof(TYPE);                            \
-        for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
             mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
         }                                                               \
         mve_advance_vpt(env);                                           \

thanks
-- PMM

