Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C67478DBE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:23:39 +0100 (CET)
Received: from localhost ([::1]:36216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myE93-0002ED-QD
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:23:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1myE6s-0008Tc-20
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:21:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1myE6n-0000Mf-UW
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:21:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639750876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSvF9MXKPCD8y0hcxahIIC0tMz1iT38FaNSp2xqBWSQ=;
 b=dd7E3rKOlHa1d5ObJewVnwZJoS8gwhPC3yLdBdV93YbdKIFLaSIAseVUqfQ6U6cBLcO8D4
 MrkKxAsHdBX7RSYuscW+AA1sM7aLmtNrJhUJoL6QIAcATmwcwr43wpmykcP2SWt3Qd2DB+
 sIsVGLkrEZ6Ic82mBH7z2QaghtkYwqw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-59RcBdSkMGqd_yUCtjzt-w-1; Fri, 17 Dec 2021 09:21:14 -0500
X-MC-Unique: 59RcBdSkMGqd_yUCtjzt-w-1
Received: by mail-pg1-f198.google.com with SMTP id
 a8-20020a63cd48000000b00330605939c0so1519049pgj.5
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 06:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HSvF9MXKPCD8y0hcxahIIC0tMz1iT38FaNSp2xqBWSQ=;
 b=miIPZZ4DF2lBLO+mVEbbT2SAXI/8o7k+NHdM9hFAQboMe2K9adjaL2/cl7hPnsSQ2Z
 roggz9v5gSJR/W6+bnjSpigxkw95ccu19sA6Oqvvgv6WX+x8yXcFweFzAmpOs8RN08Pp
 vw/RGLpIthmfkB4pQ9ED565GsM2l1sL+lz8088vK1QAbQpy5kiSWhkZ5iucNVuHM6iPu
 Q8zvBZxpkPtMXubGN8Us/1CE5gpKQjUzcgB7Jl3eU514vYlCYibEfkikktObcOXXQvvz
 a9cMaU72eZ73F4ufD4M/lOJS0G7BAo91mt6jfiPeX8OWrVWJk3ttsPNDVtFdTu4Gj6ZC
 vbyQ==
X-Gm-Message-State: AOAM530u1ThO2M3ChGu6YlKD8kIKeu9kSEINUqgLg0bPsAplnCcwzxXa
 S8Ey0rGkWDcI4PDn5Jh8lGrtCL2A2CpCnIRHeO1PvT6egNFcYoqeYS5nRcqO2lxi2drABzpZExX
 JEUTkzIyUS1xTDAx6yJPh/R/WVCISvkI=
X-Received: by 2002:aa7:8891:0:b0:4a5:58ad:e2e6 with SMTP id
 z17-20020aa78891000000b004a558ade2e6mr3468638pfe.42.1639750873800; 
 Fri, 17 Dec 2021 06:21:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLTNyc9hCNGsoE2uYnIjO4rO6bvYyvX+vweO+x0RUyWbweb4Jbza2FR6ZHOFXd/9IHfZYLv+unHSyv93YNf/k=
X-Received: by 2002:aa7:8891:0:b0:4a5:58ad:e2e6 with SMTP id
 z17-20020aa78891000000b004a558ade2e6mr3468619pfe.42.1639750873507; Fri, 17
 Dec 2021 06:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
 <20211009210838.2219430-37-marcandre.lureau@redhat.com>
 <25f4195a-94bf-db04-6bd7-2221e807a34f@redhat.com>
In-Reply-To: <25f4195a-94bf-db04-6bd7-2221e807a34f@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 17 Dec 2021 18:21:02 +0400
Message-ID: <CAMxuvazjzSjppA=yMJK-rJSuiB9WM6XdMOjFNWZnVd03YFATFw@mail.gmail.com>
Subject: Re: [PATCH v2 36/37] ui/dbus: register D-Bus VC handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Hoffmann, Gerd" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 5:35 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 10/9/21 23:08, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Export the default consoles over the D-Bus chardev.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  ui/dbus.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
>
> > +static void
> > +dbus_vc_parse(QemuOpts *opts, ChardevBackend *backend,
> > +              Error **errp)
> > +{
> > +    DBusVCClass *klass =3D DBUS_VC_CLASS(object_class_by_name(TYPE_CHA=
RDEV_VC));
> > +    const char *name =3D qemu_opt_get(opts, "name");
> > +    const char *id =3D qemu_opts_id(opts);
> > +
> > +    if (name =3D=3D NULL) {
> > +        name =3D "";
>
> Could also drop this assignation, and:
>
> > +        if (g_str_has_prefix(id, "compat_monitor")) {
> > +            name =3D "org.qemu.monitor.hmp.0";
> > +        }
>
>            else
>
> > +        if (g_str_has_prefix(id, "serial")) {
> > +            name =3D "org.qemu.console.serial.0";
> > +        }
>
>            else {
>               name =3D "";
>            }
>

done

> > +        if (!qemu_opt_set(opts, "name", name, errp)) {
> > +            return;
> > +        }
> > +    }
> > +
> > +    klass->parent_parse(opts, backend, errp);
> > +}
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>

thanks


