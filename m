Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25704FFB40
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:33228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nefpj-0003Rh-TL
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nefoC-000284-Og
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:25:34 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:36244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nefoB-0001fH-5e
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 12:25:32 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so28596107b3.3
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 09:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mitm7sVwZaOEvNnczlvscuad+3yzTLR80/x8ZhkOxQ0=;
 b=DbeMfHIr0yRkl/vxJktC8vC0W3HVJIalqjgFRlMHi8ORfU6Sr8GyD6MeqPDRj02Q2L
 mr1z/NydOHWPHBwBTZkIlJJ9khmA9VII4mnssI9xd4DXy8eto+2Ml68x0wFvrpjl3Pjd
 /ZJP5giF7r2I6MBw5My651O4plq2gYc95EvHWpPQ8mQ1YupDL8mTsSAYMh1/G6WTKLff
 smEVLIgwB/65TwTBMHkyRbMgdIZXZHBhgr1iIqa7q8tYBvqf18K9DzMUaVKREMlyKeqt
 o3AjSdca4vIjA2t7nt9OXMtwzxWfFEeN4YFBdlqWr4KK1b5czAD8NwLx1CblnaYfP8Er
 YCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mitm7sVwZaOEvNnczlvscuad+3yzTLR80/x8ZhkOxQ0=;
 b=eB1uN+1Sj7zR2J8uqAZpuFc90+I1/4pEKMsnAeCrZK4nZ0e1/w+h5y+GkdyOE5npGk
 Jx9+zmY2PCdokmlmg82m9AIppDUqplILumDlbGiiBDWwkhUoo4fTvBNYAMF5Eg3SvN/S
 zbvLQ14xp24ui/hwTeduEqg4K8U0+Wb6a3o8MNQ+5fYG73QWZ6ccTcjgC9eleXHeAHNn
 4GNBUCaD5iyL+iETq/uaNQ+Q9c/xrE4/7pFy1YfPjaSEMCFfQwSgCEryR13p/bnDehF+
 b2iXo4EE6w8oJ3AZaFqw4be54u7IN5wCScYexrooqNtaRyG5r1pPy5isQa5vTsQat6N+
 O4oA==
X-Gm-Message-State: AOAM5308HW2+Fb4aSsNci1kYW5ItKiszxBc5VesHN30GhoYwkrHURAya
 Mo+mt+a/Zl5Qfm2u6EYmoBB3rWtQGJLN+twnPGjdFQ==
X-Google-Smtp-Source: ABdhPJz3Z5czonIDgJCawMTBU9XvJ2KKibBeoXbsL2BuDn3l4cZgW5z93CpLEUyIKNPcksSjcce50tod6+yncWRZzBY=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr35900516ywm.329.1649867129142; Wed, 13
 Apr 2022 09:25:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220413160945.544176-1-pbonzini@redhat.com>
In-Reply-To: <20220413160945.544176-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Apr 2022 17:25:18 +0100
Message-ID: <CAFEAcA85dC7qgTuCd-s39=1LuCT5DnMqps_ctwZGDJESx+Xpcw@mail.gmail.com>
Subject: Re: [PATCH] target/i386: do not access beyond the low 128 bits of SSE
 registers
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Apr 2022 at 17:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The i386 target consolidates all vector registers so that instead of
> XMMReg, YMMReg and ZMMReg structs there is a single ZMMReg that can
> fit all of SSE, AVX and AVX512.
>
> When TCG copies data from and to the SSE registers, it uses the
> full 64-byte width.  This is not a correctness issue because TCG
> never lets guest code see beyond the first 128 bits of the ZMM
> registers, however it causes uninitialized stack memory to
> make it to the CPU's migration stream.
>
> Fix it by only copying the low 16 bytes of the ZMMReg union into
> the destination register.
>

> +/*
> + * Copy the relevant parts of a Reg value around. In the case where
> + * sizeof(Reg) > SIZE, these helpers operate only on the lower bytes of
> + * a 64 byte ZMMReg, so we must copy only those and keep the top bytes
> + * untouched in the guest-visible destination destination register.
> + * Note that the "lower bytes" are placed last in memory on big-endian
> + * hosts, which store the vector backwards in memory.  In that case the
> + * copy *starts* at B(SIZE - 1) and ends at B(0), the opposite of
> + * the little-endian case.
> + */
> +#ifdef HOST_WORDS_BIGENDIAN
> +#define MOVE(d, r) memcpy(&((d).B(SIZE - 1)), &(d).B(SIZE - 1), SIZE)

Still has the typo where it's copying d to d, not r to d.


> +#else
> +#define MOVE(d, r) memcpy(&(d).B(0), &(r).B(0), SIZE)
> +#endif

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

