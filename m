Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A5E5536EC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 17:57:24 +0200 (CEST)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gFn-0001Da-En
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 11:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o3gBs-0005Gb-KK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:53:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o3gBp-0002yF-AK
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 11:53:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655826796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OGRG/F80R/q9RG9KBo1oxxJibxV+C8amG8KTdAO5PU=;
 b=Ta7mfGUXxHtS7rCsPgu1gLE0kzSqxBUHgIG/O1TSDS3CGfrtaIC6P2rUgxiBqziIQUMfts
 Ulyn4eqPXIZGRzEeVA9SVuxS7vuqEpylagj7QU/G0ooq1U0TqUrwcmGChYdgZ0keySVVc7
 D58cS+q8oNukOqhu4pfZliVBOSshWDk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-hbZVditiN56fo-viCvxRxw-1; Tue, 21 Jun 2022 11:53:14 -0400
X-MC-Unique: hbZVditiN56fo-viCvxRxw-1
Received: by mail-ua1-f70.google.com with SMTP id
 r11-20020ab06dcb000000b0037f1faaf14dso2345634uaf.22
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 08:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OGRG/F80R/q9RG9KBo1oxxJibxV+C8amG8KTdAO5PU=;
 b=4+DaReaiLcp+JMhmReu3uSV4eMllGICN9NUolXJZboyyOTXDQMw+GJXLPT+Z7dVbEg
 irYdGTxj8EPxie1ojHP0H9AxFWkQlza43/WiHjSoAPLp3cULp0Ar5pAIgyphkrIvNy1k
 mUHzOjmnmb3bQGDnEMmOIt/PjOhrCVZBn9J/uDlNZqB1PNP3y3fMrvJV+07jYDdat9Qn
 jTHsIg1uaSHKCad/CWuRrJlHwUiFqhcGoX1meokXg3uLH3SXf3xfiwJkIpPOdsHRtNC/
 fWzAGrB7dLa9K0E9jE3m9NJqRULrisOCWFzTIzAdaJkCW/67ZGzAqDge2J2RzmZaTwRh
 D0fw==
X-Gm-Message-State: AJIora+jwgoY2KFWyCIp2jpOi3/bFar69Z1FYKHZrwcCpcZywXjDdEbB
 t7YcTHXO2PU0/4Y0i18QO6qnSX4Vg83qvKDYN6bxZ8ZD+sn4EHyG7o1WG7JxaRbxaGIXpdHA3+q
 3Y2WKlS0xIuPzybFBb/MEZhCCbgCrzjg=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr10603585uar.109.1655826793953; 
 Tue, 21 Jun 2022 08:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twRrBb856i1iXpaSGrQ5Pjhw9e7kmitf8U6TDKmL8aC+oJJdGASPWYZ4URnvoZd/ofjmbvIdAOKM3B+OriliI=
X-Received: by 2002:ab0:67cf:0:b0:341:257f:ce52 with SMTP id
 w15-20020ab067cf000000b00341257fce52mr10603574uar.109.1655826793745; Tue, 21
 Jun 2022 08:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220621092536.19837-1-hreitz@redhat.com>
In-Reply-To: <20220621092536.19837-1-hreitz@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 21 Jun 2022 11:53:02 -0400
Message-ID: <CAFn=p-a8pDQto-3=ZxRJV-gjG3LWd6eUQCvbnuY_9bQhyF9u3g@mail.gmail.com>
Subject: Re: [PATCH] iotests/297: Have mypy ignore unused ignores
To: Hanna Reitz <hreitz@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d9e6bb05e1f73784"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000d9e6bb05e1f73784
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2022, 5:25 AM Hanna Reitz <hreitz@redhat.com> wrote:

> e7874a50ff3f5b20fb46f36958ad ("python: update for mypy 0.950") has added
> `warn_unused_ignores =3D False` to python/setup.cfg, to be able to keep
> compatibility with both pre- and post-0.950 mypy versions.
>
> The iotests' mypy.ini needs the same, or 297 will fail (on both pre- and
> post-0.950 mypy, as far as I can tell; just for different `ignore`
> lines).
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>  tests/qemu-iotests/mypy.ini | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini
> index 4c0339f558..d66ffc2e3c 100644
> --- a/tests/qemu-iotests/mypy.ini
> +++ b/tests/qemu-iotests/mypy.ini
> @@ -9,4 +9,4 @@ no_implicit_optional =3D True
>  scripts_are_modules =3D True
>  warn_redundant_casts =3D True
>  warn_unused_configs =3D True
> -warn_unused_ignores =3D True
> +warn_unused_ignores =3D False
> --
> 2.35.3
>

I'm away for the week, but:

Acked-By: John Snow <jsnow@redhat.com>

=F0=9F=99=82

>

--000000000000d9e6bb05e1f73784
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jun 21, 2022, 5:25 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">e7874a50ff3f5b20fb46f36958ad (&quot;python: upd=
ate for mypy 0.950&quot;) has added<br>
`warn_unused_ignores =3D False` to python/setup.cfg, to be able to keep<br>
compatibility with both pre- and post-0.950 mypy versions.<br>
<br>
The iotests&#39; mypy.ini needs the same, or 297 will fail (on both pre- an=
d<br>
post-0.950 mypy, as far as I can tell; just for different `ignore`<br>
lines).<br>
<br>
Signed-off-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=
=3D"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qemu-iotests/mypy.ini | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qemu-iotests/mypy.ini b/tests/qemu-iotests/mypy.ini<br>
index 4c0339f558..d66ffc2e3c 100644<br>
--- a/tests/qemu-iotests/mypy.ini<br>
+++ b/tests/qemu-iotests/mypy.ini<br>
@@ -9,4 +9,4 @@ no_implicit_optional =3D True<br>
=C2=A0scripts_are_modules =3D True<br>
=C2=A0warn_redundant_casts =3D True<br>
=C2=A0warn_unused_configs =3D True<br>
-warn_unused_ignores =3D True<br>
+warn_unused_ignores =3D False<br>
-- <br>
2.35.3<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">I&#39;m away for the week, but:</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Acked-By: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">j=
snow@redhat.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
=F0=9F=99=82</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d9e6bb05e1f73784--


