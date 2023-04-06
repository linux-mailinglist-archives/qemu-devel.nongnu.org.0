Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E966D9BAA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:05:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRAL-00063u-GF; Thu, 06 Apr 2023 11:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRAJ-00063d-QR
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:04:43 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRAI-0008Ap-5j
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:04:43 -0400
Received: by mail-ej1-x632.google.com with SMTP id jw24so2127087ejc.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680793480; x=1683385480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQ9dCXH/V7jHVDgPe/cyUdcgnbaBd3kl160Z3zvX+wo=;
 b=YPwMQTR/bt3HXswhQ1fQrOeXoj7gF9aWcwG/p3ticEcLr6qJ8GWXKcLG9cl2LHayZu
 I1Ij8DZgDSJ5HhLYGuMV1OzG1KnvScKt1lBxbeFmk7TIp/8wujZad/wTZtfYyH7lLJzp
 cLUeQ93stExVCiQFffzNB3191ctfLd7w7rtZHdBefEzhphRTFPrUDwv8N9t9v1j2CL9f
 eTtpQYtd2EK+n0Z6eGoDouSM0btI40U2dPBZWxBW5+KiEDQAUE3Ld7FDFl7lKxeGntj6
 bvL3UOTOAc+fg7Z3xNRLamN2MRLEpA2NTEsx8FYr3FGgUfD9J3bhyCrRjBYCrhYGA3cQ
 PZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680793480; x=1683385480;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQ9dCXH/V7jHVDgPe/cyUdcgnbaBd3kl160Z3zvX+wo=;
 b=75nVDn1Rm7eP/GlEAd2lRjyLxcMQyYzXkR8moZD7F5Man5/CQH/nsEoOuIKUa5AJ+B
 eSHw08I/+GTiCt4fAbeork6402NmVgT32kG/KzYDEH78eAb7pSNumxqNn6mfLapJ5paF
 Xf/69hrm7kG9Ej+GJD6JflEX66vcoECjwyj0qdzQlNJzja1IeOZcUFPHFUJPttsqN7zn
 Q4WLEp3K9UPFmoTk3ykz4434mMw/wCuslri5ds4spsYRFgcVOMoMtLL+31Iw1vVuajz+
 fRjOoZqydnHjpTBTX0cWEaKm0a+nXwSrTlpFcvZrAJSVy6K+bCx1w/WHJMDRedxmur5e
 aBIg==
X-Gm-Message-State: AAQBX9fZRem/xLliRYjk5BAIlJbCW5U3epELRVBHRTz7gCj1OSVxNp1I
 Bmtv1cAxnd5a7YE5RIalaKMLI8NNofIHY65/mlpoHQ==
X-Google-Smtp-Source: AKy350bI1z+y4szwqKu6Jung9umVl0mnaMy8HyIAtRL+p+8aoGRYcwm327VSGrf3ADCJe8CwwRd/4FGa2rtB6sWsJyY=
X-Received: by 2002:a17:906:9bde:b0:924:efbb:8a8b with SMTP id
 de30-20020a1709069bde00b00924efbb8a8bmr3537996ejc.6.1680793480124; Thu, 06
 Apr 2023 08:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
 <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
 <CAFEAcA_Sagzoqy+GcdPgFyGLG9zenxWWFknzMz+gSrMPVuSsDQ@mail.gmail.com>
 <328a2ae2-ca27-0dee-6fae-7536128955bd@linux.ibm.com>
In-Reply-To: <328a2ae2-ca27-0dee-6fae-7536128955bd@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 16:04:29 +0100
Message-ID: <CAFEAcA_auAxVC-U80j4LuDWEXEbQysPcFcx-zkLeP5WXP3s6eQ@mail.gmail.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 6 Apr 2023 at 16:00, Stefan Berger <stefanb@linux.ibm.com> wrote:
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
>   void error_propagate_prepend(Error **dst_errp, Error *err,

Yes, that's what I had in mind.

-- PMM

