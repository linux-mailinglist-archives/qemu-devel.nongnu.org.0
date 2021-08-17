Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E29543EEA58
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 11:56:04 +0200 (CEST)
Received: from localhost ([::1]:41320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvpD-0007BT-G8
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 05:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mFvoE-0006Wo-FV
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:55:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mFvo9-0004qW-1f
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:55:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629194094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ghkwP6jiDO9WVlGwCJdF98U7C2EEenzVlpptJ/7vVS0=;
 b=PoDaO3/EldNv6RsI6aGxghsKN0ChXMjk1w2z77ZR39o1g6uwUl5QEKo4aOIYbcVpNdDoOG
 t+G9xEyTRWIQw+o6BYlJkebwsUHRuh6oyEGvw+bDDRe/8ZQC0gD/QDl0Z+m+DJheWEZUjb
 4XX97a75deegLuccAhR7vxhRMjNAyHQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-JwJSzcB6N-u_LAVKorAlbQ-1; Tue, 17 Aug 2021 05:54:52 -0400
X-MC-Unique: JwJSzcB6N-u_LAVKorAlbQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 h21-20020a17090adb95b029017797967ffbso2592144pjv.5
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghkwP6jiDO9WVlGwCJdF98U7C2EEenzVlpptJ/7vVS0=;
 b=pX4UhA1pZyz9GsKPPZViR++qn4uYy1EYK3+AaZrkEuQeJSf5z8m5Zg4dTAOLWD1tp8
 xdwnxV64hy2rfsdst+tBcVDRiHOpU+5ieecNCV6SY8vChQz/ADeVv1ba1j7Yz67fThZL
 wkrhdTL9Ey2dhCgi1P7Y9+rjxwhHhfyiUWrEegJsHoDSp9JqO2pQtHffoegHc76S7NfJ
 dsW3YnvRr3JH2/qlgNdDT07t1Q4bX/08cTJFOS3pmjzCIEsBqaqAti/AiNw1ktkCHIJ8
 HbO1NxpfYEi/W+jd1zuMkDLJtMu8bK9+0NbgVxBQV/3n5V7Uz3NH/KoXV7F391F/qhiF
 Q3OA==
X-Gm-Message-State: AOAM530Eg+Y856442LgniVRVuvlVg+jcTIs10ENmE21pnGyMbQgfdWcv
 F17PGZtvlSKqbOB7zKhatnTR8rKlCc+K08ytNtOP6M+jN0Ga7dpBd+skP/DsGTrZeP3LMnAFS9v
 1tba6Qdm1IdeUfxnN1U+b1fiW4X+hC+A=
X-Received: by 2002:a17:902:ab06:b029:12d:4e2e:aadf with SMTP id
 ik6-20020a170902ab06b029012d4e2eaadfmr2306210plb.2.1629194091014; 
 Tue, 17 Aug 2021 02:54:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE3Jm14ObWrwa/5+cR0tNoLczCXzB18H1LfacE3l9xc8E3du3Bkvt6NrJNv9U71db7n4q8Gta++p/hSjxDGaE=
X-Received: by 2002:a17:902:ab06:b029:12d:4e2e:aadf with SMTP id
 ik6-20020a170902ab06b029012d4e2eaadfmr2306197plb.2.1629194090720; Tue, 17 Aug
 2021 02:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629190206.git.mprivozn@redhat.com>
 <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
In-Reply-To: <f34ee80866e6f591bcb98401dee27682f5543fca.1629190206.git.mprivozn@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 17 Aug 2021 13:54:39 +0400
Message-ID: <CAMxuvayipXmaR5qWgFEbJpwnHj-pzOx0z3mR1JBLRc_KqqJvtg@mail.gmail.com>
Subject: Re: [PATCH 1/2] chardev: Propagate error from logfile opening
To: Michal Privoznik <mprivozn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000c607905c9be4f98"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.698, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000c607905c9be4f98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 12:56 PM Michal Privoznik <mprivozn@redhat.com>
wrote:

> If a chardev has a logfile the file is opened using
> qemu_open_old() which does the job, but since @errp is not
> propagated into qemu_open_internal() we lose much more accurate
> error and just report "Unable to open logfile $errno".  When
> using plain files, it's probably okay as nothing complex is
> happening behind the curtains. But the problem becomes more
> prominent when passing an "/dev/fdset/XXX" path since much more
> needs to be done.
>
> The fix is to use qemu_create() which passes @errp further down.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/chardev/char.c b/chardev/char.c
> index 4595a8d430..0169d8dde4 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -241,18 +241,15 @@ static void qemu_char_open(Chardev *chr,
> ChardevBackend *backend,
>      ChardevCommon *common =3D backend ? backend->u.null.data : NULL;
>
>      if (common && common->has_logfile) {
> -        int flags =3D O_WRONLY | O_CREAT;
> +        int flags =3D O_WRONLY;
>          if (common->has_logappend &&
>              common->logappend) {
>              flags |=3D O_APPEND;
>          } else {
>              flags |=3D O_TRUNC;
>          }
> -        chr->logfd =3D qemu_open_old(common->logfile, flags, 0666);
> +        chr->logfd =3D qemu_create(common->logfile, flags, 0666, errp);
>          if (chr->logfd < 0) {
> -            error_setg_errno(errp, errno,
> -                             "Unable to open logfile %s",
> -                             common->logfile);
>              return;
>          }
>      }
> --
> 2.31.1
>
>

--0000000000000c607905c9be4f98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 12:56 PM Mich=
al Privoznik &lt;<a href=3D"mailto:mprivozn@redhat.com">mprivozn@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
If a chardev has a logfile the file is opened using<br>
qemu_open_old() which does the job, but since @errp is not<br>
propagated into qemu_open_internal() we lose much more accurate<br>
error and just report &quot;Unable to open logfile $errno&quot;.=C2=A0 When=
<br>
using plain files, it&#39;s probably okay as nothing complex is<br>
happening behind the curtains. But the problem becomes more<br>
prominent when passing an &quot;/dev/fdset/XXX&quot; path since much more<b=
r>
needs to be done.<br>
<br>
The fix is to use qemu_create() which passes @errp further down.<br>
<br>
Signed-off-by: Michal Privoznik &lt;<a href=3D"mailto:mprivozn@redhat.com" =
target=3D"_blank">mprivozn@redhat.com</a>&gt;<br></blockquote><div><br></di=
v><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div> <br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char.c | 7 ++-----<br>
=C2=A01 file changed, 2 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/chardev/char.c b/chardev/char.c<br>
index 4595a8d430..0169d8dde4 100644<br>
--- a/chardev/char.c<br>
+++ b/chardev/char.c<br>
@@ -241,18 +241,15 @@ static void qemu_char_open(Chardev *chr, ChardevBacke=
nd *backend,<br>
=C2=A0 =C2=A0 =C2=A0ChardevCommon *common =3D backend ? backend-&gt;u.null.=
data : NULL;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (common &amp;&amp; common-&gt;has_logfile) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int flags =3D O_WRONLY | O_CREAT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int flags =3D O_WRONLY;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (common-&gt;has_logappend &amp;&amp;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0common-&gt;logappend) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D O_APPEND;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D O_TRUNC;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D qemu_open_old(common-&gt;log=
file, flags, 0666);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chr-&gt;logfd =3D qemu_create(common-&gt;logfi=
le, flags, 0666, errp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (chr-&gt;logfd &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unable to open logfile %s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0common-&gt;logfile);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000000c607905c9be4f98--


