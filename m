Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51BD38F5FF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 01:01:18 +0200 (CEST)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJZW-0000Ro-1p
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 19:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJXe-0008A5-SN
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:59:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:42677)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1llJXc-00086T-TI
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:59:22 -0400
Received: by mail-pg1-x533.google.com with SMTP id f22so20268956pgb.9
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SGu7skfaNhob59rhV8LQ4LaD7JpaQiMDgdIwsTJF4xM=;
 b=Dd05Ec7nxvFu7CUJeetKOg3sadwylQUSuo+aODANf9cPPr5YHvynQskOozgSWCDduF
 NNMFrhQSUOee/wjNFas/CSY/sxTsPibfiqKTvGwlyPMP9ZTUP8MeTn3ArRKTmQIJ6+En
 M3b6KcHC3+b2a5soXKLBWwYKJ2On1HOR0vMg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SGu7skfaNhob59rhV8LQ4LaD7JpaQiMDgdIwsTJF4xM=;
 b=J01iFFNmXvnPnXoL5NeN+ks2VYHAIpyHjSBmuoON1OMsGbRofMAhWrRmt+V4Bbzxt4
 TvSMpYEddwOfaLPa+NJdqwqOSJKmE6+qom+cKg/6Tp72yLDDTHNFkV2gbQTaUq5+WuNt
 0uO15EYc0Ohv2TPCIrg4h5gwwwD2fBfIBLMY7yKQbEWyJNUGG9MwZKWxi+Tjxpf9O834
 ZUDgez6tk/bNctXZ76ir4fDfKgmlNafwqyqYSoHD/9hxQWYXbCXsEAniqyiE6ZIOayvY
 1b/2GOIjeCGuoElYiL+JcjMQTPC3FozS5y455ZhLC10dTUID68PUyhvjQQU9AH5M/SJB
 VgHA==
X-Gm-Message-State: AOAM531Bp3okuEhCVD4F2ILra+OQYAGRTwWuwrrOtslOSAafzQzhlZAh
 mkPuDKd15GmxY65toU+jHzOjxV7Ona5sON8BXQajHw==
X-Google-Smtp-Source: ABdhPJypTmhomaC3doCSe228MXMW0YiFQofFze4MQWRol56zBrSOK/bvdnDRB6LLgFWr/DsmC0jEEYbjoBzQJxPmXQI=
X-Received: by 2002:a63:4e12:: with SMTP id c18mr15790070pgb.451.1621897159481; 
 Mon, 24 May 2021 15:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210524045412.15152-1-yamamoto@midokura.com>
 <20210524045412.15152-3-yamamoto@midokura.com>
 <87r1hw4cuk.fsf@linaro.org>
In-Reply-To: <87r1hw4cuk.fsf@linaro.org>
From: Takashi Yamamoto <yamamoto@midokura.com>
Date: Tue, 25 May 2021 07:59:08 +0900
Message-ID: <CAH=wFzSF_UjyeCLm911unR9xU2hdXNYpCUs7=T+ZN4SG710UmQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] linux-uesr: make exec_path realpath
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x533.google.com
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

On Mon, May 24, 2021 at 7:59 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> YAMAMOTO Takashi <yamamoto@midokura.com> writes:
>
> > Otherwise, it can be easily fooled by the user app using chdir().
> >
> > Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
> > ---
> >  linux-user/main.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/linux-user/main.c b/linux-user/main.c
> > index 4dfc47ad3b..1f9f4e3820 100644
> > --- a/linux-user/main.c
> > +++ b/linux-user/main.c
> > @@ -55,6 +55,7 @@
> >  #endif
> >
> >  char *exec_path;
> > +char exec_path_store[PATH_MAX];
>
> Is there any point in keeping this as a static path rather than just
> allocating it off the heap?

it's just the simplest given the api of realpath().
do you mean it's better to use malloc? why?

>
> >
> >  int singlestep;
> >  static const char *argv0;
> > @@ -610,7 +611,10 @@ static int parse_args(int argc, char **argv)
> >          exit(EXIT_FAILURE);
> >      }
> >
> > -    exec_path =3D argv[optind];
> > +    exec_path =3D realpath(argv[optind], exec_path_store);
> > +    if (exec_path =3D=3D NULL) {
> > +        exec_path =3D argv[optind];
> > +    }
>
>   exec_path =3D realpath(argv[optind], NULL)
>   exec_path =3D exec_path ? exec_path : argv[optind];
>
> what situations would we expect realpath to fail and in those cases is
> sticking to argv[optind] safe?

i don't have any particular case in my mind.
i guess it rarely fails and it might be simpler to just bail out on the fai=
lure.

>
> >
> >      return optind;
> >  }
>
>
> --
> Alex Benn=C3=A9e

