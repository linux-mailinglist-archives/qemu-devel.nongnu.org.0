Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F5650A3D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 11:38:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7DU8-0005M2-RS; Mon, 19 Dec 2022 05:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7DTf-0005BZ-74
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:34:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1p7DTd-00012q-Ha
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 05:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671446072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tYa2gs6nH7T/Ukvbmfbxr3t5LieC8tlfl8L9jvOnmCY=;
 b=U44+JeIOhvuG2PEWbtugaE3odZEQZf6910X6GM6H5mn5pED8uHL6I9zrCIy9TvK/gcwIXo
 7k9Z4TXofo7PYcm7NOPHmSjHyQN20lcg4N6GM5aBSKrTsD7ES2KuDEhgZNSk9/o8v8pRTZ
 gkQa0r9ZhV9cIuz9NPTte2UjNjPAG5s=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-2fafd9StMTaW8HujUBHQ9A-1; Mon, 19 Dec 2022 05:34:30 -0500
X-MC-Unique: 2fafd9StMTaW8HujUBHQ9A-1
Received: by mail-vs1-f70.google.com with SMTP id
 h7-20020a676c07000000b003b14cb5cc8fso2273162vsc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 02:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tYa2gs6nH7T/Ukvbmfbxr3t5LieC8tlfl8L9jvOnmCY=;
 b=NYP8k9ExBEfE1qW+TyXnHVz1lkh8H4cCHIgnskckhoO0HqGejk0qBAcKTlAYqSjCk8
 4rE3Q27LZOIOe0DYw2BxS6Es2AoNQo48oxz0R9XRHNTHS/VFmcvO8foKMfNHqTH93ltB
 FEXX2trAFkaNejWykqViaaS0X6nUo/9o8fJ6hxHQIHKQHYtCZ9a68f8Dpb6h1pxGvDp9
 ER/n+Ni36UO3q8U3nPGTWcgiWQ8Wi7H29LGnwvr2JxsUO3tixo42aTj3uvpyK98lj6Fk
 cg3EJY87l6dNIZJ0c97axMH8FhSqMHkpjs3zhj9chDMEV+vMpGHR4c74cI5MJkTdhaBh
 qyZA==
X-Gm-Message-State: AFqh2kqw4im8AW5Ddu0+NIOlnxFwggNuVI/AGHgA39Nf8IhLB6TCY8aN
 rbdr1bo3j7hd1O2zsPDXCLU1osBx+YI5hEEjdrTAvLfvDjQJSusoLxqRfoQZTuHwv5yalMr5Q4K
 dFYfeRkpMk45bFKibzH4GFg2m1EMv9n4=
X-Received: by 2002:a1f:2802:0:b0:3d2:1350:bdb0 with SMTP id
 o2-20020a1f2802000000b003d21350bdb0mr363383vko.20.1671446069426; 
 Mon, 19 Dec 2022 02:34:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsRoHSkHOpJBk8ufXsig5Z6+vtOy1MlroWiEKHCPmYteskzhJCmoeuj2rBJbKNE6CdR4+tQRWplcPskSwI8tTs=
X-Received: by 2002:a1f:2802:0:b0:3d2:1350:bdb0 with SMTP id
 o2-20020a1f2802000000b003d21350bdb0mr363379vko.20.1671446069200; Mon, 19 Dec
 2022 02:34:29 -0800 (PST)
MIME-Version: 1.0
References: <20221217090740.522093-1-kkostiuk@redhat.com>
 <CAFEAcA-c5vXMfmA+_9ZTc-Bsq-hCGHExRhE_SKX8i1_kuk1bCA@mail.gmail.com>
In-Reply-To: <CAFEAcA-c5vXMfmA+_9ZTc-Bsq-hCGHExRhE_SKX8i1_kuk1bCA@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 19 Dec 2022 12:34:18 +0200
Message-ID: <CAPMcbCo46mJ9kf9aTfGJ9gYHHOFgUULf7DdM0EijHA2rFgMU=w@mail.gmail.com>
Subject: Re: [PULL v2 0/6] QEMU Guest Agent misc patches
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000375e7505f02bdd19"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000375e7505f02bdd19
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 17, 2022 at 11:20 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 17 Dec 2022 at 09:07, Konstantin Kostiuk <kkostiuk@redhat.com>
> wrote:
> >
> > The following changes since commit
> d038d2645acabf6f52fd61baeaa021c3ebe97714:
> >
> >   Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into
> staging (2022-12-16 13:26:09 +0000)
> >
> > are available in the Git repository at:
> >
> >   git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-17
> >
> > for you to fetch changes up to ea5ea85c5894ac220cdb52b3f07c6ad6e4544900:
> >
> >   qga-win: choose the right libpcre version to include in MSI package
> (2022-12-17 10:53:38 +0200)
> >
> > ----------------------------------------------------------------
> > qga-pull-2022-12-17
> >
> > v1 -> v2:
> >   removed 'qga: Add ZFS TRIM support for FreeBSD' series
> >   that failed to merge
> >
> > ----------------------------------------------------------------
> > Andrey Drobyshev via (3):
> >       qga-win: add logging to Windows event log
> >       qga: map GLib log levels to system levels
> >       qga-win: choose the right libpcre version to include in MSI package
>
> These commits all have an author tag with an email 'qemu-devel@nongnu.org
> ';
> you need to fix those up and resend, please. (checkpatch catches this,
> if you want to detect this locally.)
>
>
What is the proper way to fix this? Can I fix this by myself, push and
resend commits
or author should resend it?

Best Regards,
Konstantin Kostiuk.


> thanks
> -- PMM
>
>

--000000000000375e7505f02bdd19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 17, 2022 at 11:20 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sat, 17 Dec 2022 at 09:07, Konstantin Kostiuk &lt;<a href=3D"mail=
to:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; The following changes since commit d038d2645acabf6f52fd61baeaa021c3ebe=
97714:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge tag &#39;for-upstream&#39; of <a href=3D"https://rep=
o.or.cz/qemu/kevin" rel=3D"noreferrer" target=3D"_blank">https://repo.or.cz=
/qemu/kevin</a> into staging (2022-12-16 13:26:09 +0000)<br>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-1=
7<br>
&gt;<br>
&gt; for you to fetch changes up to ea5ea85c5894ac220cdb52b3f07c6ad6e454490=
0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0qga-win: choose the right libpcre version to include in MS=
I package (2022-12-17 10:53:38 +0200)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; qga-pull-2022-12-17<br>
&gt;<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0removed &#39;qga: Add ZFS TRIM support for FreeBSD&#39; se=
ries<br>
&gt;=C2=A0 =C2=A0that failed to merge<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Andrey Drobyshev via (3):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qga-win: add logging to Windows event log<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qga: map GLib log levels to system levels<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qga-win: choose the right libpcre version to=
 include in MSI package<br>
<br>
These commits all have an author tag with an email &#39;<a href=3D"mailto:q=
emu-devel@nongnu.org" target=3D"_blank">qemu-devel@nongnu.org</a>&#39;;<br>
you need to fix those up and resend, please. (checkpatch catches this,<br>
if you want to detect this locally.)<br>
<br></blockquote><div><br></div><div>What is the proper way to fix this? Ca=
n I fix this by myself, push and resend commits<br></div><div>or author sho=
uld resend it? <br></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Konstant=
in Kostiuk.</div></div></div></div></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div>

--000000000000375e7505f02bdd19--


