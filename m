Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813A390DF6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:44:11 +0200 (CEST)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lliaf-0004IZ-Sz
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lliZc-0003aj-K8
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:43:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lliZa-00024O-QI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:43:04 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso14219025pjb.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sg8fvqfieGWZwZJ3JW+zUswdMtKjb+QkTeJ97XXVBTM=;
 b=J9LxqxoTmhlwkQLRbU+0trIopII1AO/rTusGsZt9hylXEGs9zE0zkqcneuz10ADxBy
 wsTicaIydRy2T7RFOGZIOPMA2W9MVEV7gMj8XVkx/NBc9VYl+7WawCgsU2ocgfNEWcEh
 EgpSr42HzMbYBrhwOO/8YdBPENLk4CGdqTZcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sg8fvqfieGWZwZJ3JW+zUswdMtKjb+QkTeJ97XXVBTM=;
 b=TZd0rwmuj/h58BlAHh6ea/qUQW+LeDWpNhGfmN0SZ2ReGJanN09BM7w9ccf+9BFj8O
 UvlaCylgkb63RCs2Aps59dBe3NNI59ygbZ/LnlnjyQqYjz2znzqF8PbYPsXQFzk8y7d7
 lZAPRRh8vMDq5KHvusX3NZ2A4eIwwdm0zwoWz/sUAakGvk5aNpUVCSE768WgwHvM/hfr
 grlS0Cdbp0/Bd+MhHmROYz3hDcK+w0Lca4RSSHlThW6q0KuI2+2XwRNzAVPKxUKT5nzt
 ARHskrDcIUjJ7cyo1TMS4Xg2MKjNMT8x132ngXsAha19iwHIg0Mk7KTDqzGeI8P5kV/C
 H2yg==
X-Gm-Message-State: AOAM530USD7QDtM/Vo4cmp9SZTIBP93V9BlqByJJZQOqwSAke2GAo3wd
 X8hNA7JiM9z72X29zDJduZTJuv82HzOiyvVROKz3Eg==
X-Google-Smtp-Source: ABdhPJwbcBLkTjkyGehtjYK+73qH4WaY7wPi6F2QnLwOcAC6cF/4SI4vNinQivBbpf24adlc2F7wKcWP4ENUYwObC3g=
X-Received: by 2002:a17:902:d711:b029:f0:b127:8105 with SMTP id
 w17-20020a170902d711b02900f0b1278105mr33711474ply.20.1621993381139; Tue, 25
 May 2021 18:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-3-yamamoto@midokura.com>
 <87r1hw4cuk.fsf@linaro.org>
 <CAH=wFzSF_UjyeCLm911unR9xU2hdXNYpCUs7=T+ZN4SG710UmQ@mail.gmail.com>
In-Reply-To: <CAH=wFzSF_UjyeCLm911unR9xU2hdXNYpCUs7=T+ZN4SG710UmQ@mail.gmail.com>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Wed, 26 May 2021 10:42:50 +0900
Message-ID: <CAH=wFzStKzO_uadmWEXxaa7c1DMs-DtAyA3gvbxRnEwTC9dReA@mail.gmail.com>
Subject: Re: [PATCH 2/5] linux-uesr: make exec_path realpath
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=yamamoto@midokura.com; helo=mail-pj1-x102b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 25, 2021 at 7:59 AM Takashi Yamamoto <yamamoto@midokura.com> wr=
ote:
>
> On Mon, May 24, 2021 at 7:59 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > YAMAMOTO Takashi <yamamoto@midokura.com> writes:
> >
> > > Otherwise, it can be easily fooled by the user app using chdir().
> > >
> > > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > > ---
> > >  linux-user/main.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/linux-user/main.c b/linux-user/main.c
> > > index 4dfc47ad3b..1f9f4e3820 100644
> > > --- a/linux-user/main.c
> > > +++ b/linux-user/main.c
> > > @@ -55,6 +55,7 @@
> > >  #endif
> > >
> > >  char *exec_path;
> > > +char exec_path_store[PATH_MAX];
> >
> > Is there any point in keeping this as a static path rather than just
> > allocating it off the heap?
>
> it's just the simplest given the api of realpath().
> do you mean it's better to use malloc? why?
>
> >
> > >
> > >  int singlestep;
> > >  static const char *argv0;
> > > @@ -610,7 +611,10 @@ static int parse_args(int argc, char **argv)
> > >          exit(EXIT_FAILURE);
> > >      }
> > >
> > > -    exec_path =3D argv[optind];
> > > +    exec_path =3D realpath(argv[optind], exec_path_store);
> > > +    if (exec_path =3D=3D NULL) {
> > > +        exec_path =3D argv[optind];
> > > +    }
> >
> >   exec_path =3D realpath(argv[optind], NULL)
> >   exec_path =3D exec_path ? exec_path : argv[optind];
> >
> > what situations would we expect realpath to fail and in those cases is
> > sticking to argv[optind] safe?
>
> i don't have any particular case in my mind.
> i guess it rarely fails and it might be simpler to just bail out on the f=
ailure.

i recalled why i did this way.
it was actually necessary for some apps. eg. runc
it executes an unlinked binary via /proc/self/fd.
i'll clean it up a bit and add comments.

>
> >
> > >
> > >      return optind;
> > >  }
> >
> >
> > --
> > Alex Benn=C3=A9e

