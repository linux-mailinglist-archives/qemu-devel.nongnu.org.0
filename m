Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F560323E47
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 14:32:59 +0100 (CET)
Received: from localhost ([::1]:55856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEuHi-0000J1-Ie
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 08:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lEu2v-0005eh-RQ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lEu2t-0006qR-Rt
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 08:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614172659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BVkZTfq4ZHNV945jGEY02n9jgY2HTYpr95Lye0xZg70=;
 b=QNbVplnBE9RVhhhqqAtlyUFK7/iDgKe44pwZjBoeZy/Nqjv2Hq3Dphuvym9niPKLKqCsU2
 nnUrSoXE/cENdd4K3yEscXbLuSeBrHXkbMC442p0UOUPSOeKzLvhTOPUOunrV69YQ8PR77
 EH2TookrOgrrSMx10J0V3poDCtIWKtY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-tMHmtLeCMbGKTJ3GQ9ycEw-1; Wed, 24 Feb 2021 08:17:35 -0500
X-MC-Unique: tMHmtLeCMbGKTJ3GQ9ycEw-1
Received: by mail-io1-f72.google.com with SMTP id s5so1405346ioc.22
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:17:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BVkZTfq4ZHNV945jGEY02n9jgY2HTYpr95Lye0xZg70=;
 b=R6wG2zEJxgc66v9XrdNsccyi1jkr3Dt1R3dKvhh0iaiUqERGSUNX+o/NzoFULPm8Rw
 3a3J4gz17WgoeVA11oy5LMB9VNQSq265O9CwJ23D6HSDIMo9boDbQKjyuxopT3di0lQI
 5hnkWY2Y+t10mbXz1uUZ/VYNNPu2Rc+sM0WRgv9YVRZrKx7MlhgDEZURPS00XGODs4/O
 kP/1C9tPR5BciA6DrBXFrqwrz5pORCsc/VRJNsNzOg/4G+VNAOn5o2alt7jDsYtrl6a8
 sJcsuE6Q8ntotYlcm3eA+DrOiJ4tzWjTxyP4PlBVxIXw+2KUgq1ae8hR1sFrvKi2R2dm
 TioA==
X-Gm-Message-State: AOAM531ZSEfzxMYUkwtoAHlVMa5RBvW79fMVOjoaY0EL3+WFqIQVSvOk
 dLCHIoEKt74uhi7UFyyXKdhC8/LEaigADFQSl7/hYHeBJ0WWwhH3s2XI2eFHHIUC8Ea2jV0mD4D
 fgFf9ZzERwiJGhooWYpxFY1u/Bkwf5uc=
X-Received: by 2002:a5e:940c:: with SMTP id q12mr16483162ioj.0.1614172654509; 
 Wed, 24 Feb 2021 05:17:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynEn4NHODU9ffYAwPugmFmIYx72v2G8l11ZGcj7gVNgdc/9rowmosE0XxHO0iP98pjQ/JDzobeVxmgKa7Y6rs=
X-Received: by 2002:a5e:940c:: with SMTP id q12mr16483137ioj.0.1614172654311; 
 Wed, 24 Feb 2021 05:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20210224131142.1952027-1-berrange@redhat.com>
 <20210224131142.1952027-9-berrange@redhat.com>
In-Reply-To: <20210224131142.1952027-9-berrange@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 24 Feb 2021 17:17:23 +0400
Message-ID: <CAMxuvay_GPdG8i9RSuFy059TGEK0qysDF7+BDbuTntnj58ycqA@mail.gmail.com>
Subject: Re: [PATCH 08/14] chardev: reject use of 'wait' flag for socket
 client chardevs
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000aaacfc05bc14db6d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list <libvir-list@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000aaacfc05bc14db6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2021 at 5:15 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> This only makes sense conceptually when used with listener chardevs.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  chardev/char-socket.c            | 12 ++++--------
>  docs/system/deprecated.rst       |  6 ------
>  docs/system/removed-features.rst |  6 ++++++
>  3 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> index 9061981f6d..b24618b581 100644
> --- a/chardev/char-socket.c
> +++ b/chardev/char-socket.c
> @@ -1336,14 +1336,10 @@ static bool
> qmp_chardev_validate_socket(ChardevSocket *sock,
>              return false;
>          }
>          if (sock->has_wait) {
> -            warn_report("'wait' option is deprecated with "
> -                        "socket in client connect mode");
> -            if (sock->wait) {
> -                error_setg(errp, "%s",
> -                           "'wait' option is incompatible with "
> -                           "socket in client connect mode");
> -                return false;
> -            }
> +            error_setg(errp, "%s",
> +                       "'wait' option is incompatible with "
> +                       "socket in client connect mode");
> +            return false;
>          }
>      }
>
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 78474f0845..c69887dca8 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -192,12 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally
> present in both the old and
>  new locations, clients must use introspection to learn where to anticipa=
te
>  the field if/when it does appear in command output.
>
> -chardev client socket with ``wait`` option (since 4.0)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''
> -
> -Character devices creating sockets in client mode should not specify
> -the 'wait' field, which is only applicable to sockets in server mode
> -
>  ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>
> diff --git a/docs/system/removed-features.rst
> b/docs/system/removed-features.rst
> index 7942c2e513..870a222062 100644
> --- a/docs/system/removed-features.rst
> +++ b/docs/system/removed-features.rst
> @@ -106,6 +106,12 @@ The ``query-cpus`` command is replaced by the
> ``query-cpus-fast`` command.
>  The ``arch`` output member of the ``query-cpus-fast`` command is
>  replaced by the ``target`` output member.
>
> +chardev client socket with ``wait`` option (removed in 6.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Character devices creating sockets in client mode should not specify
> +the 'wait' field, which is only applicable to sockets in server mode
> +
>  Human Monitor Protocol (HMP) commands
>  -------------------------------------
>
> --
> 2.29.2
>
>

--000000000000aaacfc05bc14db6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 2021 at 5:15 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">This only makes sense conceptually when used with listener chardevs.<=
br>
<br>
Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redha=
t.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br></blockquote><div><=
br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:mar=
candre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0chardev/char-socket.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +=
+++--------<br>
=C2=A0docs/system/deprecated.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ------=
<br>
=C2=A0docs/system/removed-features.rst |=C2=A0 6 ++++++<br>
=C2=A03 files changed, 10 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
index 9061981f6d..b24618b581 100644<br>
--- a/chardev/char-socket.c<br>
+++ b/chardev/char-socket.c<br>
@@ -1336,14 +1336,10 @@ static bool qmp_chardev_validate_socket(ChardevSock=
et *sock,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sock-&gt;has_wait) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;&#39;wait&#39;=
 option is deprecated with &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;socket in client connect mode&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sock-&gt;wait) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &=
quot;%s&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;&#39;wait&#39; option is incompatible with &q=
uot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;socket in client connect mode&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;%s&quot;,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;&#39;wait&#39; option is incompatible with &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;socket in client connect mode&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst<br>
index 78474f0845..c69887dca8 100644<br>
--- a/docs/system/deprecated.rst<br>
+++ b/docs/system/deprecated.rst<br>
@@ -192,12 +192,6 @@ Since the ``dirty-bitmaps`` field is optionally presen=
t in both the old and<br>
=C2=A0new locations, clients must use introspection to learn where to antic=
ipate<br>
=C2=A0the field if/when it does appear in command output.<br>
<br>
-chardev client socket with ``wait`` option (since 4.0)<br>
-&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
-<br>
-Character devices creating sockets in client mode should not specify<br>
-the &#39;wait&#39; field, which is only applicable to sockets in server mo=
de<br>
-<br>
=C2=A0``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)<br>
=C2=A0&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
<br>
diff --git a/docs/system/removed-features.rst b/docs/system/removed-feature=
s.rst<br>
index 7942c2e513..870a222062 100644<br>
--- a/docs/system/removed-features.rst<br>
+++ b/docs/system/removed-features.rst<br>
@@ -106,6 +106,12 @@ The ``query-cpus`` command is replaced by the ``query-=
cpus-fast`` command.<br>
=C2=A0The ``arch`` output member of the ``query-cpus-fast`` command is<br>
=C2=A0replaced by the ``target`` output member.<br>
<br>
+chardev client socket with ``wait`` option (removed in 6.0)<br>
+&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
+<br>
+Character devices creating sockets in client mode should not specify<br>
+the &#39;wait&#39; field, which is only applicable to sockets in server mo=
de<br>
+<br>
=C2=A0Human Monitor Protocol (HMP) commands<br>
=C2=A0-------------------------------------<br>
<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div></div>

--000000000000aaacfc05bc14db6d--


