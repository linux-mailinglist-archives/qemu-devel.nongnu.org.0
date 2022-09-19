Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C385BD3F2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:40:16 +0200 (CEST)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKkh-0000IT-FB
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKe9-0000ws-Bm
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:33:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oaKe4-0002j7-7Y
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:33:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663608803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pb9/5KT0pyhCPK7MNhpxvbjTaGCAEf/mRGhnNWtr0mU=;
 b=CRGkrVvydxnV+icKPmSW9rygoLyiYZAwVxwdbNEJJxO76Yl//ceuvrEUSEv7tjIsXKEs6f
 TDeujHz1NisR2o7pBtIUrLXxzIEBlUQPwPGz5HJuXQSVKgSpdZVAVIjgRg3pt7qVTSQ/he
 R77FmrIvJwW5/Nem9Xfkb1Ffc2wqlo4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-439-HNbs4ltrOZGI7o5dlyRqkA-1; Mon, 19 Sep 2022 13:33:21 -0400
X-MC-Unique: HNbs4ltrOZGI7o5dlyRqkA-1
Received: by mail-qt1-f200.google.com with SMTP id
 ew15-20020a05622a514f00b0035cb76e35e5so12192971qtb.7
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Pb9/5KT0pyhCPK7MNhpxvbjTaGCAEf/mRGhnNWtr0mU=;
 b=BZQyOfB6Bs+4XpJV+3Jg5J36InTAkFB9b3NtYIwS2nw8/5eWua9YvoHeFp1FGevapL
 q84yQJzjp674IcMm/NmixLOZzGB2IHTUUoDe8jTxDEdc37COK1bwgC9OrN7Wqz3Y6T26
 2aBbNT1ald4wQ7/NghHIGFuS+DjmLNSopJrdvh26CIBA8qtfrlVGgJ6eKwreg73hI1wV
 ccoIFFfB5tJasIWu2noXbB59MVFV3KumyFXbgXXzaK+/h1FF+7KdeFzmwHax88LRvJwr
 v4Uvg8hdgA4ouwZwP+h/CLQ1U/rXJvVoUrtIE/8mph5i+aHAz0pobgrrIp8rdOPt3HRh
 qzqg==
X-Gm-Message-State: ACrzQf2sgb/aPlw8Bt8YizdPb24tRna1XcrumWLHDNLAECcTHfsuztG7
 SJ+Rt2hwt7ZN7OgsluJzpeXkRZqsq8p9vC9OcRQNHmIs67p0iq0DC4sYg76dmX4iG17r0ZGmTTP
 Lfo+rOiTc5zaEf83ei3LAXFZwpni8zgY=
X-Received: by 2002:ac8:5901:0:b0:35c:cc99:ea6b with SMTP id
 1-20020ac85901000000b0035ccc99ea6bmr15178441qty.294.1663608801175; 
 Mon, 19 Sep 2022 10:33:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7up6wiCdP9zkgzrWKUTvcEsGg+tFrMUL+DUDtUlUCfrih3QBtCdEdFvaCvN3dD0LgmsGr9s1ybQBQV/rGjxR4=
X-Received: by 2002:ac8:5901:0:b0:35c:cc99:ea6b with SMTP id
 1-20020ac85901000000b0035ccc99ea6bmr15178416qty.294.1663608800847; Mon, 19
 Sep 2022 10:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220830034816.57091-1-ricky@rzhou.org>
In-Reply-To: <20220830034816.57091-1-ricky@rzhou.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 19 Sep 2022 19:33:09 +0200
Message-ID: <CABgObfZCsm8YePTdQUnE64S=bdg6MtKRmBxBsBPJ7NJm0Vp=Rg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] target/i386: Read 8 bytes from cvttps2pi/cvtps2pi
 memory operands
To: Ricky Zhou <ricky@rzhou.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, eduardo@habkost.net
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I think this is broken for big endian systems because ldq expects
a pointer to xmm_t0.L(0) while ldo expects a pointer xmm_t0.

I will fix the bug in my new AVX decoder though, where it is also
present. So thanks for the report!

Paolo

On Tue, Aug 30, 2022 at 5:48 AM Ricky Zhou <ricky@rzhou.org> wrote:
>
> Before this change, emulation of cvttps2pi and cvtps2pi instructions
> would read 16 bytes of memory instead of 8. The SDM states that
> cvttps2pi takes a 64-bit memory location. The documentation for cvtps2pi
> claims that it takes a a 128-bit memory location, but as with cvttps2pi,
> the operand is written as xmm/m64. I double-checked on real hardware
> that both of these instructions only read 8 bytes.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Ricky Zhou <ricky@rzhou.org>
> ---
>  target/i386/tcg/translate.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index b7972f0ff5..3ba5f76156 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -3621,7 +3621,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>              if (mod != 3) {
>                  gen_lea_modrm(env, s, modrm);
>                  op2_offset = offsetof(CPUX86State,xmm_t0);
> -                gen_ldo_env_A0(s, op2_offset);
> +                if (b1) {
> +                    gen_ldo_env_A0(s, op2_offset);
> +                } else {
> +                    gen_ldq_env_A0(s, op2_offset);
> +                }
>              } else {
>                  rm = (modrm & 7) | REX_B(s);
>                  op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
> --
> 2.37.2
>


