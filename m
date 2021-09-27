Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A64191B6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 11:41:46 +0200 (CEST)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUn8r-00018J-AG
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 05:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUn7R-0008BW-MX; Mon, 27 Sep 2021 05:40:17 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:36596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUn7Q-000267-2m; Mon, 27 Sep 2021 05:40:17 -0400
Received: by mail-ot1-f49.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so23612545otx.3; 
 Mon, 27 Sep 2021 02:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zaZg/t40mjkyzSNOSb9G2D+cFjxOwLo8MDuDBAhNlxQ=;
 b=PjSY9S82ihJ2Lrwg+wLbCV8kPvJhidg+5SZfqUlg8R5yrDuBXYYZYdgeyQ/KxJqSni
 0HxOgjRkaj39+59RCi7+aKv84/2pedQOsmhSoNhlJnxvyrIlZlCXThbcR9fIY2kuRPPj
 mLckyMhtNNmvnBjbjaY/z+bVXdC/zZxCJpgXuBd67/sXYjcCHb7St+LlnTj3P1AQz5KN
 jY8MIYlGanGapc4CnqXvM5o3Y6HNnVhYMaisJjMAS6ORR2jgkfYSS3UTnoGaIzPv5RLZ
 yE91EsOWwpI9E8DsK3fI77FB6RFH/rIWfQMx9MamqkjZucycxK7bmVpGmd54SN7b845s
 W08w==
X-Gm-Message-State: AOAM531EUjVlE2A4T6nHweSL+uJN2xRISwD/JpQsxsB0o+gohFRXyFL8
 UIOyJHoK4rNQq8P3RcB7/RlP5GB5Y/inc1cu038=
X-Google-Smtp-Source: ABdhPJwDS56AQvsYISoj8O/rkvGDDywW3wLA+kXYsU3PSjffgFqHwJpDCIN9ByEeQebb4HrPSZbWlQ98/FrIKKaDiqY=
X-Received: by 2002:a9d:6487:: with SMTP id g7mr16024950otl.13.1632735614159; 
 Mon, 27 Sep 2021 02:40:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
In-Reply-To: <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 27 Sep 2021 11:40:02 +0200
Message-ID: <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.49;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 27, 2021 at 11:15 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> > Reported-by: Warner Losh <imp@bsdimp.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  bsd-user/meson.build | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > index 03695493408..a7607e1c884 100644
> > --- a/bsd-user/meson.build
> > +++ b/bsd-user/meson.build
> > @@ -1,3 +1,7 @@
> > +if not config_host.has_key('CONFIG_BSD')
> > +  subdir_done()
> > +endif
> > +
> >  bsd_user_ss.add(files(
> >    'bsdload.c',
> >    'elfload.c',
>
>
> So, what's the reason for this change?

https://lore.kernel.org/qemu-devel/CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtBAG=
r+cziS4r2qw@mail.gmail.com/

linux-user/meson.build is evaluated on bsd, and bsd-user/meson.build on Lin=
ux.

> The commit messages and
> the cover letter don't really explain it. Is this fixing a bug
> (if so what?), a precaution to avoid possible future bugs,
> fixing a performance issue with how long meson takes to run (if
> so, how much effect does this have), or something else?

I'll wait for feedback from Paolo, then work on the explanation.

Regards,

Phil.

