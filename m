Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5FB6D9C72
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:32:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRZc-0008Hu-Mw; Thu, 06 Apr 2023 11:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pkRZR-0008HA-4h
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:30:42 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pkRZK-00057w-QK
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:30:40 -0400
Received: by mail-lj1-x235.google.com with SMTP id 20so41087976lju.0
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680795025; x=1683387025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JjdYxeRVqTdZV9qRahuh10Ui9fcwe4N4aiAZOtBGHLM=;
 b=QSeRgdCxcYZMbhH044QmZ9XpvuPiTDMQLEF/UkzJKZX3AaEkDsybqVHmZAxngmMdgZ
 eoKy/LlafCcvxkYX3P7QHUd5Vb4xSLTqOJFYZnsqA6FOIIgAaj0BqQucJYI6Aoc/Jx5c
 JdCCcd121bWWmBM9/uWQ7f09cpWh4BMeHZZkVz8WFB4GMd8PORgGSJtaZU8CLSz6OkVl
 /isI5OXx9jWisQfDAcYSQcH4WXWvCjirMZ4+CxLYH8b7NA9mHjaMohmIhQth3v983Vfd
 pfLml6L5C4IqwuT2Wg9SwSz26jdUtsUVi6XnXqNBst1mOz5mYMlW04BEGY1q+X7DG9yP
 kufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680795025; x=1683387025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JjdYxeRVqTdZV9qRahuh10Ui9fcwe4N4aiAZOtBGHLM=;
 b=rOiR1PymKjMR5NUfBg93JWDD6Y5fxPLC5lJ5qYkbkpUMG8f3on9WiUz2Ac8pCGbjB0
 1+F0R+dRdhHToSPeQawXd2E9+FBrw1b22fsx5GYXGo77PqjjwWPa3XMPM7dgbsGPTKDL
 APzb7ouTA1b0hD80Y4OiLH/0GanK/RKHIayFLgs6InJKRndZbooZfDDY91NlCUJ/nHpN
 gcE7XLjpdgo7EY0mYnTQCToFif/Y8aCMw2LFcSBEDQWejs6+7vlr0Kwo6OUmUwAIuWxh
 qVvyPzDuyoEK4O6EWcdJ/1gD3OlBdqL9qYiv1DwwYRDMPc3iHMWjngwz1QcJ/wYel9Nq
 Mtpw==
X-Gm-Message-State: AAQBX9cw8oBicbSl84Pxq97iHZFeXu9fdDDOhGjF0JNzQCWtlQZy0EPH
 4+lol4CUMyae89yVu7BwIr0F169QGySjvJ2deM8=
X-Google-Smtp-Source: AKy350bKuF8R5hGlRD/zGspUNfhtXXmS+nO9fk7q1BEfqRnssA72U32Y7nzL1EKA4a2JadDivvXR4Ri2efRBNXdMSY4=
X-Received: by 2002:a2e:8247:0:b0:2a6:18c0:2b43 with SMTP id
 j7-20020a2e8247000000b002a618c02b43mr3595347ljh.0.1680795024712; Thu, 06 Apr
 2023 08:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
 <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
 <CAFEAcA_Sagzoqy+GcdPgFyGLG9zenxWWFknzMz+gSrMPVuSsDQ@mail.gmail.com>
 <328a2ae2-ca27-0dee-6fae-7536128955bd@linux.ibm.com>
In-Reply-To: <328a2ae2-ca27-0dee-6fae-7536128955bd@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 6 Apr 2023 19:30:13 +0400
Message-ID: <CAJ+F1C+Ps47iQ-j5Sb07_5VaXCd3Nfheiv5w19wEttz_3V8t2g@mail.gmail.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Thu, Apr 6, 2023 at 7:00=E2=80=AFPM Stefan Berger <stefanb@linux.ibm.com=
> wrote:
>
>
>
> On 4/6/23 10:36, Peter Maydell wrote:
> > On Thu, 6 Apr 2023 at 15:13, Stefan Berger <stefanb@linux.ibm.com> wrot=
e:
> >> I'll be out starting tomorrow. I don't see Marc-Andr=C3=A9 online.
> >>
> >> Would this be acceptable?
> >> It ensures that if error_handle() returns, err has been freed.
> >> In the other two cases a copy is being made of the Error that can then=
 be used after the error_handle() call.
> >
> > "Not error_warn" is the common case, so it doesn't seem
> > great to copy the error around like that. My thoughts were
> > either:
> >   (1) error_handle() should handle all of the error cases,
> > like this:
> >
> >      if (errp =3D=3D &error_abort) {
> >         ...
> >         abort();
> >      }
> >      if (errp =3D=3D &error_fatal) {
> >         ...
> >         exit(1);
> >      }
> >      if (errp =3D &error_warn) {
> >          warn_report_err(err);
> >      } else if (errp && !*errp) {
> >          *errp =3D err;
> >      } else {
> >          error_free(err);
> >      }
> >
> > and delete the "set *errp" logic from the callers.
>
>
> Like this?
>
> diff --git a/util/error.c b/util/error.c
> index 5537245da6..e5e247209a 100644
> --- a/util/error.c
> +++ b/util/error.c
> @@ -46,6 +46,10 @@ static void error_handle(Error **errp, Error *err)
>       }
>       if (errp =3D=3D &error_warn) {
>           warn_report_err(err);
> +    } else if (errp && !*errp) {
> +        *errp =3D err;
> +    } else {
> +        error_free(err);
>       }
>   }
>
> @@ -76,7 +80,6 @@ static void error_setv(Error **errp,
>       err->func =3D func;
>
>       error_handle(errp, err);
> -    *errp =3D err;
>
>       errno =3D saved_errno;
>   }
> @@ -289,11 +292,6 @@ void error_propagate(Error **dst_errp, Error *local_=
err)
>           return;
>       }
>       error_handle(dst_errp, local_err);
> -    if (dst_errp && !*dst_errp) {
> -        *dst_errp =3D local_err;
> -    } else {
> -        error_free(local_err);
> -    }
>   }
>


looks like a fix to me, send a patch?
thanks

>   void error_propagate_prepend(Error **dst_errp, Error *err,
>
>
>
> >
> > (note that error_setv() has done checks already that mean it
> > will always take the "(errp && !*errp)" path, so we don't need
> > to special-case for which caller this was.)
> >
> > (2) error_handle() should return a bool to say whether it's handled
> > the error entirely and the callsite should do nothing further
>
> > with it.
> >
> > I prefer (1) I think but would defer to people with more
> > experience with the Error APIs.
> >
> > thanks
> > -- PMM
>


--=20
Marc-Andr=C3=A9 Lureau

