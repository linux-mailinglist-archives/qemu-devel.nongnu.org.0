Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC06A407F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:23:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbad-0008Su-It; Mon, 27 Feb 2023 06:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWbaK-0008Pl-5R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:22:24 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pWbaI-0002mz-IS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:22:23 -0500
Received: by mail-lf1-x135.google.com with SMTP id r27so8032964lfe.10
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5k5nVkY8z0x+TJj/WUGPsI5m0EnnELVFZeDRdhDjkas=;
 b=SUv7+OjFfwYi5t8pOVh9/mXtOk3P+Q2rYvouNNfaVQkTeVyVpu8xqmRKCY0Frfxkgb
 2npD5luYP1CRAYQ2LXVSKh18TQbqAAORslcCnpFEE17kwv09Jl3xql5Gzgo5D+TXkaGk
 IyZwH3QLLWRZYV3R9lbDNJaOsFkn01mN8DA15WnsnTqiP7I/TAhgsgYNk6jzjdWKZ55n
 vVj/8+3BayyWTCutuzeBoXK+1H9w/shigfwJ4zvfg2RNs9k9VLR/NkU1979ALay1Lfjx
 ljYt9EwLVUW4UjFvIS8jGVCtrgY6Ztuy1kOIafHEDvPMfshNO5yKbt3NBlgnxwGLx6zn
 VVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5k5nVkY8z0x+TJj/WUGPsI5m0EnnELVFZeDRdhDjkas=;
 b=NUVBxg/A6kjyjQoMgF/KKXCQCQgLNXecBQ9Y98YH+NrRdQGjgj+xsrWABsioCJ8ccG
 sdtPeMdvFhG17iDUUH1HnOKmZ3azoHkP5wJK3+vktZGcyrLue/O4a52oNyC5FtxynW8b
 qNnANiiFOgzUSDytlRJTUSe01DjZnsULGnjjpgMVUZy+1rXm7bRFo5y3wYXgYEGSFmZ7
 LUsc9dJChLmen4nzaSzeMXYezk4RP0wKpIw+TqH9EguTMxKkyCmtK19kE5UE1aKBiuSX
 97FUYrHrFWv1/PvK1QHeaai1Iem2c0nOZ9T/t+q5SYRU1a1cdSvZS/xhjJ7VQnxxnayD
 FFJg==
X-Gm-Message-State: AO0yUKX+U5swbGKyWddRhpcMOTw/y/jLAydRJJRyk3aE7wYDVx+Av8zZ
 Wg2BATTZx4JEbGk7ZA/TedvEgnw7PPX5w0w/Z3Q=
X-Google-Smtp-Source: AK7set99EJxKj5cl7igKFPu4oKiumHBmoA2cRzlwxbok7VZHvxVdPlqId6thvTlC/7xvJYw7xEJgi8qUoQep+MGdH0o=
X-Received: by 2002:a05:6512:118d:b0:4dd:9eb6:444d with SMTP id
 g13-20020a056512118d00b004dd9eb6444dmr3725080lfr.4.1677496940431; Mon, 27 Feb
 2023 03:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <87fsb4k85h.fsf@pond.sub.org>
 <CAMxuvax6qPYQCzNX7vESJM9_f5k4C1Yat0sJcJjrHkh_1WGpQA@mail.gmail.com>
 <87a61821y3.fsf@pond.sub.org>
 <CAJ+F1CJNgmf+j36wutNMdPYBShoZUXJvzEBGEVwW-B-Z6Tc3ug@mail.gmail.com>
 <87356yq9rs.fsf@pond.sub.org>
 <CAJ+F1CK-WExedoeNouJZPmaiCr9H4S_tCjVaO4WX-O7jo56C0Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CK-WExedoeNouJZPmaiCr9H4S_tCjVaO4WX-O7jo56C0Q@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 27 Feb 2023 15:22:08 +0400
Message-ID: <CAJ+F1C+MtuA-erTfof=kdRkbF2t61zmBi+NUriBaxBGBGOsOGw@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x135.google.com
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

On Wed, Feb 22, 2023 at 2:29 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Feb 22, 2023 at 2:23 PM Markus Armbruster <armbru@redhat.com> wro=
te:
> > > Another option is to always pass a dummy last argument? :)
> > >
> > > void command(first,
> > > #ifdef A
> > >     a,
> > > #endif
> > > #ifdef B
> > >     b,
> > > #endif
> > >     dummy)
> >
> > Yet another option:
> >
> >   void command(first
> >   #ifdef A
> >       , a
> >   #endif
> >   #ifdef B
> >       , b
> >   #endif
> >       )
> >
> > [...]
> >
>
> Since I think we always have a first argument, that might be indeed
> the best solution. I'll try that. thanks
>

Actually, this is just moving the problem to the first argument. (and
it also breaks clang-format, which doesn't have a allow-leading-commas
option or similar). So I'll just add an error when using conditional
fields/args last.


--=20
Marc-Andr=C3=A9 Lureau

