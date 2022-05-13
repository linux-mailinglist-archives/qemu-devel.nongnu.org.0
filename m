Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF3525EDB
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 12:05:57 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npSBI-0006nu-H8
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 06:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npS8B-0003rT-Q1
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:02:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1npS89-0007Of-1Q
 for qemu-devel@nongnu.org; Fri, 13 May 2022 06:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652436160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s18fsl1Hg1m/VyCmocaQRT2efostDBVKxjUT+GEezvc=;
 b=NfDtJWjDP+wsxQ9zT2T63rCDrj9nt0hv8v1bdsjeKLySYLkI2SvEW6zvvWJR2LFCeVa8pr
 zxUtzJB4+pIvQF7sjBXsEV8EJs/4iB56/etKhGIB7o2gKuZvHUVIyLJWFhq/YqwZ/acl23
 Eeba6TdkwLOdFFG4NOlOTOu5YNzclTw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-ZZdQCx7LMoGMJaSroPolWw-1; Fri, 13 May 2022 06:02:39 -0400
X-MC-Unique: ZZdQCx7LMoGMJaSroPolWw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-2fb7bf98f1aso68320157b3.5
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 03:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s18fsl1Hg1m/VyCmocaQRT2efostDBVKxjUT+GEezvc=;
 b=YkHTZKGFr2rTFswHbAdWjuraDw94FpCQnvgQqf6WnVQV+Ki7MGA4wcUnBDbczYADVT
 M9QDexIut/6nn592cfSU1mktc4rRquu0C0Wj5t8w6tORzySWFfDRO3/6vtxGy7wWm8zX
 V0ixVpI6Fgla5Xyh/0GFn75Yvz8LmczZ+9OJboX0qmEVSfB0HbxcgliWlAnN0ucZUDNn
 k/TdL74AV0meCtycia2TOIY7nPiSqPBFLvShH+7mVVzSSRU3myHOoebEWQWkkboZ/4fn
 fPYzxYp8npvSDEoA2xEnVx7BOGzRnU05DNsNrKe5ZBoHxMebKNflbKfme7wYbzQo+tL5
 zCsg==
X-Gm-Message-State: AOAM530Djvu1ZmnnpFDOLKQ2L84OJRAbz+iAtl4yJeviX8tQ8Qul07bL
 Vcc5iothnQNr1as6IO/KQfP3gYtDPkE5nKQJs+EdE5+5JGxiZFsVq0UZY5ZTsghVWVYt7B2H7f+
 /23ti5ng4tnm6xlD+R+qmR0z0X/8b3iY=
X-Received: by 2002:a81:5785:0:b0:2f4:dfcb:717c with SMTP id
 l127-20020a815785000000b002f4dfcb717cmr4724748ywb.456.1652436158385; 
 Fri, 13 May 2022 03:02:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/UjgrDzaLoLqhO5WSsOdaB2ikdmW+rHKPgdkYlk8+VTwBMq128hyE1B3TEHNLPbNIdOtoggAZPtnBeYpEl74=
X-Received: by 2002:a81:5785:0:b0:2f4:dfcb:717c with SMTP id
 l127-20020a815785000000b002f4dfcb717cmr4724715ywb.456.1652436158078; Fri, 13
 May 2022 03:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220505081431.934739-1-marcandre.lureau@redhat.com>
 <20220505081431.934739-8-marcandre.lureau@redhat.com>
 <87mtfww6xk.fsf@pond.sub.org>
In-Reply-To: <87mtfww6xk.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 13 May 2022 12:02:26 +0200
Message-ID: <CAMxuvaz9MuiwCZMeRoH58ufe76GQdcMQ=o9bsQU1vGTxpJ1HWQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] qga: use qemu_open_cloexec() for
 safe_open_or_create()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Kevin Wolf <kwolf@redhat.com>, 
 Darren Kenny <darren.kenny@oracle.com>, Laurent Vivier <lvivier@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 qemu-block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi

On Thu, May 5, 2022 at 1:33 PM Markus Armbruster <armbru@redhat.com> wrote:
>
> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The function takes care of setting CLOEXEC, and reporting error.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  qga/commands-posix.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> > index 0ef049650e31..8ebc327c5e02 100644
> > --- a/qga/commands-posix.c
> > +++ b/qga/commands-posix.c
> > @@ -370,21 +370,16 @@ safe_open_or_create(const char *path, const char =
*mode, Error **errp)
> >       * open() is decisive and its third argument is ignored, and the s=
econd
> >       * open() and the fchmod() are never called.
> >       */
> > -    fd =3D open(path, oflag | ((oflag & O_CREAT) ? O_EXCL : 0), 0);
> > +    fd =3D qemu_open_cloexec(path, oflag | ((oflag & O_CREAT) ? O_EXCL=
 : 0), 0, errp);
> >      if (fd =3D=3D -1 && errno =3D=3D EEXIST) {
> > +        g_clear_pointer(errp, error_free);
>
> Aha, this is where you really need ERRP_GUARD().
>
> Elsewhere, we use
>
>            error_free(errp);
>            errp =3D NULL;
>

More like:

        error_free(*errp);
        *errp =3D NULL;

compared to:

       g_clear_pointer(errp, error_free);

I have a preference ;) but I will switch to the former for now.

> If one of these two ways is superior, we should use the superior one
> everywhere.
>
> If it's a wash, we should stick to the prevalent way.
>
> >          oflag &=3D ~(unsigned)O_CREAT;
> > -        fd =3D open(path, oflag);
> > +        fd =3D qemu_open_cloexec(path, oflag, 0, errp);
> >      }
> >      if (fd =3D=3D -1) {
> > -        error_setg_errno(errp, errno,
> > -                         "failed to open file '%s' "
> > -                         "(mode: '%s')",
> > -                         path, mode);
>
> This changes the error message, doesn't it?
>
> Not an objection, just something that might be worth noting in the
> commit message.
>

ok

> >          goto end;
> >      }
> >
> > -    qemu_set_cloexec(fd);
> > -
> >      if ((oflag & O_CREAT) && fchmod(fd, DEFAULT_NEW_FILE_MODE) =3D=3D =
-1) {
> >          error_setg_errno(errp, errno,
> >                           "failed to set permission 0%03o on new file '=
%s' (mode: '%s')",
>


