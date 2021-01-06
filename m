Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083652EC346
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 19:38:23 +0100 (CET)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxDhN-0006nk-Kt
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 13:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDgJ-0006NU-0t
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:37:15 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDgH-0001rl-8c
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:37:14 -0500
Received: by mail-oi1-f180.google.com with SMTP id p5so4478064oif.7
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 10:37:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4OCaT6ljZofXDjlCJHZtg9aKPhRWN14GpOhwvn1+Rc0=;
 b=QgCJ/cLGNoui0ggXnxr42fEkbHQP7BZMCMMtn4S9OzmL4TBNATsRytYypDCMpusDqI
 OKtXyyi8Gfw/4bdZRjfW6uHknv00mLjKytqRghYcB2CN+pxpWFhhDgn1oWyrnX7KMqZK
 KRwl/IpvFtOZh/7DY7haQMu7YTKjgQVPtBFvr3kidBzSjaMby8Nkt56z8WUe351UwOad
 6bWofVE3wDWxyVoRm54CAwaMKZtUPeg5rBZ0IBoGbpPg9pSja9P0KZiFIXpEPJUDQcmt
 P6/Hf1SSMkbjgOHzPYj+wgd38ltRHcHffmQPbFn6QLrjddXCEXqWc/cMgFa2PSaprXVd
 Lt1w==
X-Gm-Message-State: AOAM532qeeeas5Zf60O3ceFmLhjpIIXsBEup+j6D6w3WP3E7DyEGACxQ
 jSje5M3jdJgY0B13hyOKBEy6uSALiUcssFJJsbs=
X-Google-Smtp-Source: ABdhPJwBzsgzIp/+Hck4LCMdb+vD0yXvZEqb4D+eKf15c2i1SHC6Geo1dgHUsROFTVFTzjHqiiv9Ql1+/F01uLhTt/8=
X-Received: by 2002:aca:c752:: with SMTP id x79mr3792236oif.46.1609958232072; 
 Wed, 06 Jan 2021 10:37:12 -0800 (PST)
MIME-Version: 1.0
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-3-f4bug@amsat.org>
 <1f23c2f4-28b9-ac3b-356e-ea9cc0213690@amsat.org>
In-Reply-To: <1f23c2f4-28b9-ac3b-356e-ea9cc0213690@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 6 Jan 2021 19:37:00 +0100
Message-ID: <CAAdtpL65=s-eUGKjXe-KzyqyHs1+a1qwHyp72xNRNo0gHxE8Hg@mail.gmail.com>
Subject: Re: [PATCH v2 02/24] target/mips/translate: Expose check_mips_64() to
 32-bit mode
To: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.180;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f180.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm <kvm@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 6, 2021 at 7:20 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Hi,
>
> ping for code review? :)

FWIW the full series (rebased on mips-next) is available here:
https://gitlab.com/philmd/qemu/-/commits/mips_msa_decodetree

>
> Due to the "Simplify ISA definitions"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg770056.html
> patch #3 is not necessary.
>
> This is the last patch unreviewed.
>
> On 12/15/20 11:57 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > To allow compiling 64-bit specific translation code more
> > generically (and removing #ifdef'ry), allow compiling
> > check_mips_64() on 32-bit targets.
> > If ever called on 32-bit, we obviously emit a reserved
> > instruction exception.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  target/mips/translate.h | 2 --
> >  target/mips/translate.c | 8 +++-----
> >  2 files changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/mips/translate.h b/target/mips/translate.h
> > index a9eab69249f..942d803476c 100644
> > --- a/target/mips/translate.h
> > +++ b/target/mips/translate.h
> > @@ -127,9 +127,7 @@ void generate_exception_err(DisasContext *ctx, int =
excp, int err);
> >  void generate_exception_end(DisasContext *ctx, int excp);
> >  void gen_reserved_instruction(DisasContext *ctx);
> >  void check_insn(DisasContext *ctx, uint64_t flags);
> > -#ifdef TARGET_MIPS64
> >  void check_mips_64(DisasContext *ctx);
> > -#endif
> >  void check_cp1_enabled(DisasContext *ctx);
> >
> >  void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int =
offset);
> > diff --git a/target/mips/translate.c b/target/mips/translate.c
> > index 5c62b32c6ae..af543d1f375 100644
> > --- a/target/mips/translate.c
> > +++ b/target/mips/translate.c
> > @@ -2972,18 +2972,16 @@ static inline void check_ps(DisasContext *ctx)
> >      check_cp1_64bitmode(ctx);
> >  }
> >
> > -#ifdef TARGET_MIPS64
> >  /*
> > - * This code generates a "reserved instruction" exception if 64-bit
> > - * instructions are not enabled.
> > + * This code generates a "reserved instruction" exception if cpu is no=
t
> > + * 64-bit or 64-bit instructions are not enabled.
> >   */
> >  void check_mips_64(DisasContext *ctx)
> >  {
> > -    if (unlikely(!(ctx->hflags & MIPS_HFLAG_64))) {
> > +    if (unlikely((TARGET_LONG_BITS !=3D 64) || !(ctx->hflags & MIPS_HF=
LAG_64))) {
>
> Since TARGET_LONG_BITS is known at build time, this can be simplified
> as:
>
> if ((TARGET_LONG_BITS !=3D 64) || unlikely!(ctx->hflags & MIPS_HFLAG_64))=
)
>
> >          gen_reserved_instruction(ctx);
> >      }
> >  }
> > -#endif
> >
> >  #ifndef CONFIG_USER_ONLY
> >  static inline void check_mvh(DisasContext *ctx)
> >

