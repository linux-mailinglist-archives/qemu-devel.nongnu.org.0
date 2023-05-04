Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3B46F6831
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:21:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puV8T-0006Zg-3L; Thu, 04 May 2023 05:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puV8P-0006ZK-HV
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puV8M-0007GX-HE
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683192017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U3dkBZd4Bd5o6y5a6A7L9mob1Im11ltu5mW7/8bVr8o=;
 b=fwWn44Qu0XcYa1pYrVbfgYarrh6NB4ea99l5Ns7SonPk/F9MHyTMugiwY2YScPag+r0L31
 F/s7YZ+HsCTtahhqFJfMlckB1LcGVv8pdI5ORcSINReefX0CI+Yeu+VPIxboWCuzRrOP9v
 bjUE/BJ2BEBv4pL3i2cyIrbAKK7ERoo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-qH2DJuVBM0mMTO47nhcpwA-1; Thu, 04 May 2023 05:20:16 -0400
X-MC-Unique: qH2DJuVBM0mMTO47nhcpwA-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b9a7553f95dso562231276.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683192015; x=1685784015;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U3dkBZd4Bd5o6y5a6A7L9mob1Im11ltu5mW7/8bVr8o=;
 b=Olf021gA2Q5DYmxzUe/f0387V9rMT2zJQtc83/9RBtRVlUJwTpSnSzrwfJHeKANeK9
 UHmjI4zru5oYZrkPtsbdHDYxDlDW0iwDb2CCRASlNjUyHG37RqkWgfGBkqfld8ffoHrf
 I1Jeae7E7GBF1CbaU27WcQhxu4bpZEUf0Oq0aq58JlgBH73O1FUW2ima3AHGRR3pukm7
 lfy0By/wfzO/lFS3lde4J4lmbigrbne0Z/9WBw9CHgtwmnS6O++9CqdKMKJ3n/PdDjDX
 EkFXS1g/TXGCL6+iYeF02VYKnA+AqZEXFb/mzJo1enHBqJgPO9uiIE6O3okrDJvuG/0L
 ayWQ==
X-Gm-Message-State: AC+VfDzo4hYC8j4GjnILzZhlNWs6DCLg2+uIwKrPskit8zUwlK/TIJn6
 Px53mHWt+Z2tm1HK7c/n/MrLkCDCwaoVNZQ1rVcyebD2ZMYmXkbDPZpaQc12NeYh9/pWiyyEr4m
 uTOJvxFxydXCyDc3bnh1AB/s9PnQLKmM=
X-Received: by 2002:a25:40d2:0:b0:b9e:7589:62fc with SMTP id
 n201-20020a2540d2000000b00b9e758962fcmr7862734yba.28.1683192015570; 
 Thu, 04 May 2023 02:20:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7MG0VIGvCupzKNYSMIQ3PCPU+7M4rKhCa4QQnOheC2le1t6kE1NPi8C+7MiNHoDgRguSkE9Eg9er1WlSj5gOk=
X-Received: by 2002:a25:40d2:0:b0:b9e:7589:62fc with SMTP id
 n201-20020a2540d2000000b00b9e758962fcmr7862725yba.28.1683192015279; Thu, 04
 May 2023 02:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230406124038.9813-1-mark@qpok.net>
In-Reply-To: <20230406124038.9813-1-mark@qpok.net>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 4 May 2023 12:20:04 +0300
Message-ID: <CAPMcbCrHxYmLST-+XMEhX3_5EMpwBP394MO4m9FXww4-292M8Q@mail.gmail.com>
Subject: Re: [PATCH v2] qga: Fix suspend on Linux guests without systemd
To: Mark Somerville <mark@qpok.net>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000028f18c05fadaaea4"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000028f18c05fadaaea4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>


On Thu, Apr 6, 2023 at 3:42=E2=80=AFPM Mark Somerville <mark@qpok.net> wrot=
e:

> Allow the Linux guest agent to attempt each of the suspend methods
> (systemctl, pm-* and writing to /sys) in turn.
>
> Prior to this guests without systemd failed to suspend due to
> `guest_suspend` returning early regardless of the return value of
> `systemd_supports_mode`.
>
> Signed-off-by: Mark Somerville <mark@qpok.net>
> ---
> v1: Identical to this version(!) but missing from qemu-devel... Sincere
>     apologies to anyone receiving this patch twice. I ran up against a
>     deeply frustrating and depressing SMTP issue which should now be
>     resovled.
>
>  qga/commands-posix.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 079689d79a..59e7154af4 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -1918,10 +1918,10 @@ static void guest_suspend(SuspendMode mode, Error
> **errp)
>      if (systemd_supports_mode(mode, &local_err)) {
>          mode_supported =3D true;
>          systemd_suspend(mode, &local_err);
> -    }
>
> -    if (!local_err) {
> -        return;
> +        if (!local_err) {
> +            return;
> +        }
>      }
>
>      error_free(local_err);
> @@ -1930,10 +1930,10 @@ static void guest_suspend(SuspendMode mode, Error
> **errp)
>      if (pmutils_supports_mode(mode, &local_err)) {
>          mode_supported =3D true;
>          pmutils_suspend(mode, &local_err);
> -    }
>
> -    if (!local_err) {
> -        return;
> +        if (!local_err) {
> +            return;
> +        }
>      }
>
>      error_free(local_err);
> --
> 2.40.0
>
>

--00000000000028f18c05fadaaea4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><div di=
r=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 6, 2023 at 3:42=E2=80=AFPM Mark Somerville &lt;=
<a href=3D"mailto:mark@qpok.net" target=3D"_blank">mark@qpok.net</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Allow the L=
inux guest agent to attempt each of the suspend methods<br>
(systemctl, pm-* and writing to /sys) in turn.<br>
<br>
Prior to this guests without systemd failed to suspend due to<br>
`guest_suspend` returning early regardless of the return value of<br>
`systemd_supports_mode`.<br>
<br>
Signed-off-by: Mark Somerville &lt;<a href=3D"mailto:mark@qpok.net" target=
=3D"_blank">mark@qpok.net</a>&gt;<br>
---<br>
v1: Identical to this version(!) but missing from qemu-devel... Sincere<br>
=C2=A0 =C2=A0 apologies to anyone receiving this patch twice. I ran up agai=
nst a<br>
=C2=A0 =C2=A0 deeply frustrating and depressing SMTP issue which should now=
 be<br>
=C2=A0 =C2=A0 resovled.<br>
<br>
=C2=A0qga/commands-posix.c | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index 079689d79a..59e7154af4 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -1918,10 +1918,10 @@ static void guest_suspend(SuspendMode mode, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0if (systemd_supports_mode(mode, &amp;local_err)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode_supported =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0systemd_suspend(mode, &amp;local_err);<br=
>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (!local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0error_free(local_err);<br>
@@ -1930,10 +1930,10 @@ static void guest_suspend(SuspendMode mode, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0if (pmutils_supports_mode(mode, &amp;local_err)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode_supported =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pmutils_suspend(mode, &amp;local_err);<br=
>
-=C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 if (!local_err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0error_free(local_err);<br>
-- <br>
2.40.0<br>
<br>
</blockquote></div>

--00000000000028f18c05fadaaea4--


