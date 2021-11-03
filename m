Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80A7443DCD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 08:44:39 +0100 (CET)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miAwo-0001SN-Ql
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 03:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1miAud-0007zF-5Y
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:42:23 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1miAub-0002DJ-KC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 03:42:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id d13so2092497wrf.11
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 00:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jqV8RyoowRRg+x1y91eX8x1Iu/wGztwrykaJSAonW3o=;
 b=cWsT6yJDoBYNtzapJB5NZrY8qfy4J21/U8+tiS6/Z6u1pH0klHCQ2jYxfArOtxqnAd
 EozZswc3/Fr0HNjkVAPng0hW1AmK8jpcOT0xnLlkW62IJ+XH/xpH0HO6rN7HPYo8Yca4
 arlb9FuBhWXD8UVIDWwZHPsGX20wnsC0YSKl0Auz1duhlGKrIiP6pV/ONtOfCOwbK4kJ
 HFDZaMRQ76a1bWlCF29j8fQ7kelbcorZzgjsN+rS2rz1BWZDgMQnRUdy/S3nuaC/y+3I
 yUe3yOD0WccbwKDn3KOSoTCJdSrtePTLrA4VNPdyMGMX5JxvRRu4gbmuusiVNyC6/xAs
 dBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqV8RyoowRRg+x1y91eX8x1Iu/wGztwrykaJSAonW3o=;
 b=EXiY3+BXxY6yMGwP2yJId79MMQUWvvKU+WIm1CJ4m6eNJp9FZXBmafTHQGUzl/5BwG
 AqSqpnlDNion65X/BPk7rNbnHE4eUsmWsFrN8PeUtHtqWn17wlSsKyVIC03cWN+17PGp
 uMoOd8mLNv7zlQud+/Tj/F4SDpXqysHqZogtuICozWRa9eWZVuO8avnz+znS/jx7Jj+J
 A80xeuPb8HLdyDfYXrYnflkbig0NIpD0x6Z9Qu8eS9M4nTCro/hMUGM9yss0VFlT9TU5
 x9D9lNqU1guW88v09iVDNrr/8yZHiDhY9v2blxE45dOmBs31dX50VT6bhwY9oC1/N4t8
 r8HA==
X-Gm-Message-State: AOAM532oNc4y3h9s39w5qwSTTGC1ygdbJSOvMA1ju/MHWyCP5gPW5rxo
 xCtLG9W+5iYmIRTI+UVrSMUhBg1CAKsCUZsUQe4=
X-Google-Smtp-Source: ABdhPJyszRTPSSiCEy+lVYwpdQ3va8t59c03NBpdzcoK/dEgrW0VrlzSc0HVrsUkAMwLllW4CaqAA/wAKCCNIz1D/E8=
X-Received: by 2002:a5d:6781:: with SMTP id v1mr44627226wru.239.1635925339474; 
 Wed, 03 Nov 2021 00:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211103073848.1459138-1-armbru@redhat.com>
In-Reply-To: <20211103073848.1459138-1-armbru@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 3 Nov 2021 11:42:07 +0400
Message-ID: <CAJ+F1CKkXB77QCv1_-_3Cu61tYkeTp+7juNx81SHqth6L_64WQ@mail.gmail.com>
Subject: Re: [PATCH] qdev-monitor: Fix use after free on duplicate device ID
 error
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bd10e705cfdd8c67"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Kevin Wolf <kwolf@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bd10e705cfdd8c67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 3, 2021 at 11:39 AM Markus Armbruster <armbru@redhat.com> wrote=
:

> Fixes: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd
> Reported-by: Coverity CID 1465223
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  softmmu/qdev-monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index e49d9773d2..14c1fb76c5 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -592,8 +592,8 @@ const char *qdev_set_id(DeviceState *dev, char *id,
> Error **errp)
>          if (prop) {
>              dev->id =3D id;
>          } else {
> -            g_free(id);
>              error_setg(errp, "Duplicate device ID '%s'", id);
> +            g_free(id);
>              return NULL;
>          }
>      } else {
> --
> 2.31.1
>
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000bd10e705cfdd8c67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 3, 2021 at 11:39 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fixe=
s: 4a1d937796de0fecd8b22d7dbebf87f38e8282fd<br>
Reported-by: Coverity CID 1465223<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0softmmu/qdev-monitor.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c<br>
index e49d9773d2..14c1fb76c5 100644<br>
--- a/softmmu/qdev-monitor.c<br>
+++ b/softmmu/qdev-monitor.c<br>
@@ -592,8 +592,8 @@ const char *qdev_set_id(DeviceState *dev, char *id, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (prop) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev-&gt;id =3D id;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Dupl=
icate device ID &#39;%s&#39;&quot;, id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(id);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
-- <br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt; <br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" cla=
ss=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000bd10e705cfdd8c67--

