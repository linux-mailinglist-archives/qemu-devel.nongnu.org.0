Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5F3EB345
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 11:19:44 +0200 (CEST)
Received: from localhost ([::1]:34334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mETLr-0003Xv-6G
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 05:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETKW-0002iv-SH
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 05:18:20 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mETKV-00068J-5E
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 05:18:20 -0400
Received: by mail-ed1-x530.google.com with SMTP id x14so14405813edr.12
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 02:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oZIw2u5y0mvealZNuJ78zAwzoQu5b2h9itKJUHTZSqA=;
 b=LWUXiiX96Vaw2EuHvu0E+RNefQqcWBRdyu7fWXEFVVvYDQOCOhcKpFEQGy/GAgEpyW
 bH0hADRjyHmXwueZEPbSkKeXAWpfe5lZnpO6agAab4dF4RonbdqmHuAyHQyWQqgdF1SW
 7/3wHN9Zu1dnM9wBTFsx9SJ8SJIzbB3VH9VQ+WyJoJr++zjsexjtuRy74e3Ln9I5oNuy
 0vg/yRshR6D7CLziX6Xxry58Fp8Gozfd6mJtwDWFyVmanE4YCUX1uSBChrzJf6h7L6uV
 Nx3ehp5KP8k+W+NgHuY1hmeZ0pX9JQV/CQTyu+MDgOrl7NFPJ8TbTD9ZcktIRVhSKg+B
 ztzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oZIw2u5y0mvealZNuJ78zAwzoQu5b2h9itKJUHTZSqA=;
 b=Nc1qBNKaXiUyoxBpL2tH+AD2yX8Qz0MaoUF+L4XD4soOT/TMIJ0XGmyHqZDaIw29kk
 N22A1yu/hL+ll8BklFPA9EdBzSjCaAFaYoKgqOLpXIGRBuaJUp9kda42u0wE1MUN5npZ
 LJ+TCIKNmxLLSQFr2n9vfseVoE2WKgckzyqlPUxjXEIU771L/Dv9gLcL12ZY9QgJQCok
 /U4CKDY56LHedSVAhs1nBKbvSm07OE7RyYSnqkgJqSFIOfwLFPFzX1crB7venb9//5m9
 9Adqva08VXPUZObx1S8KJNHM98t/5EaHH6BFDgVO90upQRRTLb8uCQ7siqHPfL9RbrWz
 Ftcw==
X-Gm-Message-State: AOAM5310POqA15409xbJ0qqXagVaB+9Dwtmp8lhI4qXMrf3Cp68lOreC
 9EyQMA/4MNIHunrwPGIVUO0v6IX30LE4wngdhQDbQw==
X-Google-Smtp-Source: ABdhPJyqYez1yPEYiMBvBLrbOBzxVm/OiWXdaS4hicMoG31XjF2CGJU81Y+NAjqmkci3FQzao+1m3N4L8jNhpYeftLk=
X-Received: by 2002:a50:ff03:: with SMTP id a3mr1839258edu.100.1628846297362; 
 Fri, 13 Aug 2021 02:18:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210812191007.70331-1-matheus.ferst@eldorado.org.br>
 <7b8530e0-4dc8-ea7f-3cac-e6ae623e6770@linaro.org>
In-Reply-To: <7b8530e0-4dc8-ea7f-3cac-e6ae623e6770@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Aug 2021 10:17:32 +0100
Message-ID: <CAFEAcA8=auwb6vjPZqoem4vYoVUecbgsxSXjwZGPzDhQOkLqhQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/ppc: fix vector registers access in gdbstub
 for little-endian
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>,
 matheus.ferst@eldorado.org.br, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 Aug 2021 at 21:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/12/21 9:10 AM, matheus.ferst@eldorado.org.br wrote:
> >   static bool avr_need_swap(CPUPPCState *env)
> >   {
> > +    bool le;
> > +#if defined(CONFIG_USER_ONLY)
> > +    le = false;
> > +#else
> > +    le = msr_le;
> > +#endif
>
> It certainly doesn't seem like the right fix.
>
> My first guess was that MSR_LE wasn't being properly set up at cpu_reset for user-only,
> but it's there.

This code is confusing because there are multiple possible swaps happening:

(1) gdb_get_regl() and friends assume they are passed a host-endian value
and will tswap to get a value of TARGET_WORDS_BIGENDIAN endianness.
(For the other direction, ldl_p() et al do target-endian accesses.)
(2) for ppc softmmu, TARGET_WORDS_BIGENDIAN is always true, and so
if the CPU is in LE mode then the ppc gdbstub code needs to swap
(ppc_maybe_bswap_register() does this)
(3) for ppc usermode, TARGET_WORDS_BIGENDIAN matches the actual binary's
ordering, so the gdb_get_regl() etc swap is always correct and sufficient
and ppc_maybe_bswap_register() does nothing
(4) the data affected by this avr_need_swap() function is the 128
bit registers, and it has to do with whether we consider the two
64-bit halves as (high, low) or (low, high). (The swapping or not
of each 64-bit half is done with the same steps 1 2 3 above as for a
64-bit value.)

I haven't yet worked through the 128 bit case -- I'd need to look at
whether we store the AVR data in the CPU struct as a pair of uint64
host-order values (Arm does this, it's always index 0 is lo, 1 is hi
regardless of host endianness) or really as a host-order 128 bit integer.
But I think the code is pretty confusing, and to make it a bit less
so it would be useful to:
 * unify the "do we need to do an extra swap" logic that is currently
split between avr_need_swap() and ppc_maybe_bswap_register() (assuming
that the answer is really the same for both cases, of course...)
 * look at whether there is a nicer way to handle the 128 bit
register case than "byteswap the two 64-bit halves and then decide
which order to use them in"
 * write a good explanatory comment...

-- PMM

