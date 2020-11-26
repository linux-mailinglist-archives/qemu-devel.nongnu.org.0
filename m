Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE02C536A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:00:28 +0100 (CET)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFwp-0003fS-Sq
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:00:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kiFsM-0000nq-CL
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kiFsI-0006e6-UY
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606391744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7YqBn8jAqyGKV/2OXH7i5yOki/3LiEWzoVQjmVGl9Uo=;
 b=OOEBq14tyGhaEyberTd58ebgqCgrWNsWCExTkavhoORrRbbwN3+08I1QgIcohy9KEMpKiY
 Lt4rhozrSMRQtYIfZTup4RQzVniDVjJAN++P0QAs31xIkbP/H34XQzfy1Re5ZZKKcYRYma
 8DHLeXcTeF2TlOTIChLzRt8mmN3ebbY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-whGnt4SSN2erj9sVCEozRw-1; Thu, 26 Nov 2020 06:55:41 -0500
X-MC-Unique: whGnt4SSN2erj9sVCEozRw-1
Received: by mail-io1-f72.google.com with SMTP id b4so1285043ioa.4
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 03:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7YqBn8jAqyGKV/2OXH7i5yOki/3LiEWzoVQjmVGl9Uo=;
 b=WInAoRejL2zB0ZkMa6A45l2LziSzO8wX4zmgx0SdfyjPjeUaeHxP8GFlCQ/PhMCBHZ
 cmmNBfQM1RItQQ7g2rhPhzsyNN6xsLtG8crwh0mwHt9lTq7+sMFtM+4jQXvKrJbDE9OY
 /lHP/xAysUyQmR5kHXYehjTvxAdC69vXm5mmhzSmyzTtwNQw/QAQZ3xGcO06KBGkWIGl
 vlbgsHk+JA+4onACozAC/GaNxUO/WX/8FDha9FgJrXz+XEZfQrCuki247DNzhtv+vgrX
 fRUNGdlcPnUAOIiqdJ++aWkQFub9DlxjwdMbHDx2lBBYZ65SQfSJx4Ec5pUD60+nXBXi
 nFvA==
X-Gm-Message-State: AOAM5331pOoloukBf7qlpLLlXGFyvd6sWJCN+wUa7koqFRl/M6hu+dfD
 tUB9xJcKH2Kpl0MIUHSSKKaZHoLqU+BGNraggp+zy4oetCHZ4vDM+CdM+2bIq4PYcpQFZFmx/wk
 8CayHxZwxdyCOhN4n+h4C5MWpe1tKM/c=
X-Received: by 2002:a5d:858b:: with SMTP id f11mr2006219ioj.0.1606391741202;
 Thu, 26 Nov 2020 03:55:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO8s4j3K9Zn60srz+nf9OSkYNUC40UD/yQWxmdi15mfKFLcUPEjGEEbCjsQ45FSjVqxuCbtlIKjWKZ6wWbq6U=
X-Received: by 2002:a5d:858b:: with SMTP id f11mr2006212ioj.0.1606391741012;
 Thu, 26 Nov 2020 03:55:41 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-2-marcandre.lureau@redhat.com>
 <CAFEAcA-qDgEG_N8ONha=wTtKGM4v-+3umLiZhA7DzP-1HiRXwQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-qDgEG_N8ONha=wTtKGM4v-+3umLiZhA7DzP-1HiRXwQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 26 Nov 2020 15:55:30 +0400
Message-ID: <CAMxuvazX5d8wHXZEejwh0dHQ3Q+RibSrbBxBQV4Kd1cd4DKOXg@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] compiler.h: replace QEMU_GNUC_PREREQ macro
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Thu, Nov 26, 2020 at 3:48 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 26 Nov 2020 at 11:29, <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Replace it with glib G_GNUC_CHECK_VERSION.
> >
> > Available since 2.42, the macro received a small correction in
> > 2.55.1 (glib d44afbadda8a "macros: make G_GNUC_CHECK_VERSION()
> > portable" which was apparently harmless).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qemu/atomic.h      |  2 +-
> >  include/qemu/compiler.h    | 15 +++------------
> >  scripts/cocci-macro-file.h |  1 -
> >  accel/tcg/cpu-exec.c       |  2 +-
> >  4 files changed, 5 insertions(+), 15 deletions(-)
> >
> > diff --git a/include/qemu/atomic.h b/include/qemu/atomic.h
> > index c1d211a351..c409257c11 100644
> > --- a/include/qemu/atomic.h
> > +++ b/include/qemu/atomic.h
> > @@ -248,7 +248,7 @@
> >   * 4.3 (http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D36793).
> >   */
> >  #if defined(__i386__) || defined(__x86_64__)
> > -#if !QEMU_GNUC_PREREQ(4, 4)
> > +#if !G_GNUC_CHECK_VERSION(4, 4)
> >  #if defined __x86_64__
> >  #define smp_mb()    ({ asm volatile("mfence" ::: "memory"); (void)0; }=
)
> >  #else
> > diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> > index c76281f354..cf044bab4a 100644
> > --- a/include/qemu/compiler.h
> > +++ b/include/qemu/compiler.h
> > @@ -7,21 +7,12 @@
> >  #ifndef COMPILER_H
> >  #define COMPILER_H
> >
> > +#include "glib-compat.h"
>
> osdep.h already includes glib-compat.h, so if it's safe to
> include it this early we should just move that #include line
> in osdep.h up above compiler.h. But I don't think it's going
> to be quite that simple, because some parts of osdep.h
> need to happen before we include any system headers, and
> glib-compat.h includes some system headers. As it stands
> this fragment will pull in glib-compat.h too early.
>
> You probably need to rearrange osdep.h so it is
>  * config-host.h
>  * poison.h
>  * bits that must go before any standard headers
>  * pure system includes
>  * glib-compat.h
>  * compiler.h
> (and hopefully none of the above needed stuff set up by compiler.h !)
>
> Or if this tangle of bits depending on each other seems too
> messy, we could just leave QEMU_GNUC_PREREQ the way it is :-)

Or I just change the order the header are included in libvhost-user
(before https://patchew.org/QEMU/20201125100640.366523-1-marcandre.lureau@r=
edhat.com/
lands), since that was the reason I didn't include osdep.h iirc.

Anyway, if the rest of the series is accepted, the include should go
away too (should have done that on top).


