Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D66D9A91
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 16:38:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkQjY-0007e3-40; Thu, 06 Apr 2023 10:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkQjW-0007dr-9I
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:37:02 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkQjN-0001Cy-BT
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:37:01 -0400
Received: by mail-ej1-x62f.google.com with SMTP id l17so1923191ejp.8
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680791810; x=1683383810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6pripZTtUVqjvUBtxwtTgNUwmzj45hKF8PMY0iJU4E=;
 b=FFmEiqOHwixL1BzQ5yjHAPSGtXk1tn4FcVvsZU51I52m/X3+XaSNHwlObq2IrCSQH3
 QdPy8aW4NdMrMgKDsygXXHCOoscY2LuNmarbC/fB0FqvcpaqF87J+YUFcqe4TGkOo0bp
 uRbZ2z+8dbawj/N5UjURcznfkRWP/d3oUDsRhMRuzlIFRgV7YisegfLCd0PR4JR6n0qU
 VkpOiuL3Y2UhXEp/3q2jM+uoORGhYcreoYQ99Rg9UpStfgFcMlShx6YE0o0ZSV357Vmn
 OLvK4Fd0BeFxu9WyR0Bz3FBloMp5+xwZBmpK2ibzpAx9dj44iherLvbQ4vGjdVP++KOL
 Ee5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680791810; x=1683383810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6pripZTtUVqjvUBtxwtTgNUwmzj45hKF8PMY0iJU4E=;
 b=FxI4q0KU6zP9Xvfvj5SNje6al+d4fXlLPRPBDKZvAkq1I2dqnAlEAssLgxK7TYOnU2
 XD37MswgNowHtgZEZ99xZMd3O3NA1EUW+jBI/XLs8/8lUn1jneWOFkp0k9OvcHrG9n4B
 AenMFX3GiYyd1v3405dqERcrx7t2vLlhaI2u59LvbIeQSGOaFy1lrDZOpHb9Iz3XA7Hj
 hlhLooDMmNOHI12fNDo5z1qyYpV8+7DZ1LUGd3jQbw1akGAtiwfvafz2pOZhkGDQgSiy
 ymaN+2SxbnrXk5FJ9jPegjjpVk6928o/ma779frO7vIVrFfrhUUUHaBvvI4gWleikWLp
 9J6g==
X-Gm-Message-State: AAQBX9cxGWDlsll3U6mMOFxPmGJdDt7mm4aHoj+bPMO2BJZMoXz0Wi02
 xvNExlanYhOogncpcbyuZtg6kpzq5gKUCG8jPXt5tw==
X-Google-Smtp-Source: AKy350a884aSfmxQYmKZYO9h3jc+MG599rppUWJJcWEdrV+N+41G2tsmukpD0oyacGnoANq8ldts2B9cyrdPOnRwgkk=
X-Received: by 2002:a17:907:118d:b0:932:4577:6705 with SMTP id
 uz13-20020a170907118d00b0093245776705mr3666989ejb.6.1680791810247; Thu, 06
 Apr 2023 07:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
 <20230313114648.426607-6-marcandre.lureau@redhat.com>
 <CAFEAcA9zNpzj_VU3ysWaa24tTqaBDcB9o1+0HhO0R7hhVOdgdA@mail.gmail.com>
 <CAFEAcA9_GP8HqtYgG4mice_ACd8eqFLF6qrMYRz_5oe_HSM=-g@mail.gmail.com>
 <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
In-Reply-To: <8520898b-14e8-33a8-c34f-e98fecbedcb3@linux.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Apr 2023 15:36:39 +0100
Message-ID: <CAFEAcA_Sagzoqy+GcdPgFyGLG9zenxWWFknzMz+gSrMPVuSsDQ@mail.gmail.com>
Subject: Re: [PULL v2 05/25] error: add global &error_warn destination
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Thu, 6 Apr 2023 at 15:13, Stefan Berger <stefanb@linux.ibm.com> wrote:
> I'll be out starting tomorrow. I don't see Marc-Andr=C3=A9 online.
>
> Would this be acceptable?
> It ensures that if error_handle() returns, err has been freed.
> In the other two cases a copy is being made of the Error that can then be=
 used after the error_handle() call.

"Not error_warn" is the common case, so it doesn't seem
great to copy the error around like that. My thoughts were
either:
 (1) error_handle() should handle all of the error cases,
like this:

    if (errp =3D=3D &error_abort) {
       ...
       abort();
    }
    if (errp =3D=3D &error_fatal) {
       ...
       exit(1);
    }
    if (errp =3D &error_warn) {
        warn_report_err(err);
    } else if (errp && !*errp) {
        *errp =3D err;
    } else {
        error_free(err);
    }

and delete the "set *errp" logic from the callers.

(note that error_setv() has done checks already that mean it
will always take the "(errp && !*errp)" path, so we don't need
to special-case for which caller this was.)

(2) error_handle() should return a bool to say whether it's handled
the error entirely and the callsite should do nothing further
with it.

I prefer (1) I think but would defer to people with more
experience with the Error APIs.

thanks
-- PMM

